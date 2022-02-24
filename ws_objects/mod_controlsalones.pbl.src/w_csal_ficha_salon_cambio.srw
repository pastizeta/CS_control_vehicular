$PBExportHeader$w_csal_ficha_salon_cambio.srw
forward
global type w_csal_ficha_salon_cambio from window
end type
type cbx_seleccionar from checkbox within w_csal_ficha_salon_cambio
end type
type dw_csal_salones_temporales_unlapso from datawindow within w_csal_ficha_salon_cambio
end type
type dw_csal_salones_temporales_dias from datawindow within w_csal_ficha_salon_cambio
end type
type cb_regresar from commandbutton within w_csal_ficha_salon_cambio
end type
type cb_cambiar from commandbutton within w_csal_ficha_salon_cambio
end type
type dw_csal_salon_ficha from datawindow within w_csal_ficha_salon_cambio
end type
type cb_cancelar from commandbutton within w_csal_ficha_salon_cambio
end type
end forward

global type w_csal_ficha_salon_cambio from window
integer width = 3760
integer height = 1754
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cbx_seleccionar cbx_seleccionar
dw_csal_salones_temporales_unlapso dw_csal_salones_temporales_unlapso
dw_csal_salones_temporales_dias dw_csal_salones_temporales_dias
cb_regresar cb_regresar
cb_cambiar cb_cambiar
dw_csal_salon_ficha dw_csal_salon_ficha
cb_cancelar cb_cancelar
end type
global w_csal_ficha_salon_cambio w_csal_ficha_salon_cambio

type variables
str_csal_salones_reservacion istr_reservacion

string is_sort='#5A'
end variables

on w_csal_ficha_salon_cambio.create
this.cbx_seleccionar=create cbx_seleccionar
this.dw_csal_salones_temporales_unlapso=create dw_csal_salones_temporales_unlapso
this.dw_csal_salones_temporales_dias=create dw_csal_salones_temporales_dias
this.cb_regresar=create cb_regresar
this.cb_cambiar=create cb_cambiar
this.dw_csal_salon_ficha=create dw_csal_salon_ficha
this.cb_cancelar=create cb_cancelar
this.Control[]={this.cbx_seleccionar,&
this.dw_csal_salones_temporales_unlapso,&
this.dw_csal_salones_temporales_dias,&
this.cb_regresar,&
this.cb_cambiar,&
this.dw_csal_salon_ficha,&
this.cb_cancelar}
end on

on w_csal_ficha_salon_cambio.destroy
destroy(this.cbx_seleccionar)
destroy(this.dw_csal_salones_temporales_unlapso)
destroy(this.dw_csal_salones_temporales_dias)
destroy(this.cb_regresar)
destroy(this.cb_cambiar)
destroy(this.dw_csal_salon_ficha)
destroy(this.cb_cancelar)
end on

event open;integer li_row=1, li_dias_lapso, li_i, li_dia_fecha
integer li_cve_dia, li_j, li_control
string ls_tipo_reservacion, ls_materia
date ld_fecha
istr_reservacion =message.powerobjectparm

ls_materia=istr_reservacion.materia+' (GRUPO '+istr_reservacion.grupo+')'
if f_valida_es_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio)>0 then ls_materia=ls_materia+'. ASIMILADA DE '+f_select_padre_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio)
 
dw_csal_salon_ficha.insertrow(0)
dw_csal_salon_ficha.SetItem(1, "salon",istr_reservacion.salon+' ('+ f_select_clase_aula_salon(istr_reservacion.salon)+')'	)
dw_csal_salon_ficha.SetItem(1, "materia", ls_materia)
dw_csal_salon_ficha.SetItem(1, "profesor", istr_reservacion.profesor)	
dw_csal_salon_ficha.SetItem(1, "grupo", istr_reservacion.grupo)	
dw_csal_salon_ficha.SetItem(1, "horario", istr_reservacion.horario)	
dw_csal_salon_ficha.SetItem(1, "fecha_movimiento", istr_reservacion.fecha_movimiento)	
dw_csal_salon_ficha.SetItem(1, "tipo_reservacion",istr_reservacion.tipo_reservacion)	
dw_csal_salon_ficha.SetItem(1, "observaciones",istr_reservacion.observaciones)
dw_csal_salon_ficha.SetItem(1, "lapso",istr_reservacion.lapso)
dw_csal_salon_ficha.SetItem(1, "horario_periodo",f_select_texto_horarios_materia(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "materias_asimiladas",f_select_texto_asimiladas(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "asimilada",f_valida_es_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "salon_anterior",f_select_texto_salones_anteriores(istr_reservacion.cve_dia,istr_reservacion.hora_inicio,istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
 
if istr_reservacion.estatus_reservacion=2 then
	
		if istr_reservacion.lapso_completo>0 then 
			dw_csal_salones_temporales_unlapso.Retrieve(istr_reservacion.periodo,istr_reservacion.anio,istr_reservacion.lapso_completo)
			li_row=dw_csal_salones_temporales_unlapso.RowCount()
		end if
		
		li_dias_lapso=DaysAfter(istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)+1
		li_cve_dia=istr_reservacion.cve_dia	
	
			for li_i=1 to li_dias_lapso
				
				ld_fecha=RelativeDate(istr_reservacion.fecha_inicio,li_i -1)
				li_dia_fecha=Daynumber(ld_fecha)-1
				
				for li_j=1 to li_row
				
					if istr_reservacion.lapso_completo>0 then li_cve_dia=dw_csal_salones_temporales_unlapso.GetItemNumber(li_j,"cve_dia")
								
					if li_dia_fecha=li_cve_dia then
		
						li_control=li_control+1
						dw_csal_salones_temporales_dias.InsertRow(0)
						dw_csal_salones_temporales_dias.SetItem(li_control,"reservacion",1)
						dw_csal_salones_temporales_dias.SetItem(li_control, "cve_dia", li_dia_fecha)
						dw_csal_salones_temporales_dias.SetItem(li_control, "nom_dia", f_select_nombre_dia(li_dia_fecha))
						dw_csal_salones_temporales_dias.SetItem(li_control, "fecha", ld_fecha)
						dw_csal_salones_temporales_dias.SetItem(li_control, "nom_fecha", f_convierte_fecha_texto(ld_fecha))
						
					end if
					
				next
						
			next
			
		dw_csal_salones_temporales_dias.SetSort(is_sort)
		dw_csal_salones_temporales_dias.Sort()

		cb_cambiar.enabled=false
		cb_cambiar.visible=false
		cb_cancelar.enabled=true
		cb_cancelar.visible=true
else
		
	this.width=2450
	cb_cancelar.enabled=false
	cb_cancelar.visible=false		
	
	
	if istr_reservacion.estatus_reservacion=1 then
		cb_cambiar.enabled=true
		cb_cambiar.visible=true
	else
		cb_cambiar.enabled=false
		cb_cambiar.visible=false
	end if
	
end if

end event

type cbx_seleccionar from checkbox within w_csal_ficha_salon_cambio
integer x = 1748
integer y = 1494
integer width = 603
integer height = 102
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Seleccionar todos"
boolean checked = true
end type

event clicked;integer li_i, li_row, li_valor

li_row=dw_csal_salones_temporales_dias.rowcount()

if this.checked=true then li_valor=1 else li_valor=0

for li_i=1 to li_row
	dw_csal_salones_temporales_dias.SetItem(li_i,"reservacion",li_valor)
next



end event

type dw_csal_salones_temporales_unlapso from datawindow within w_csal_ficha_salon_cambio
boolean visible = false
integer x = 2717
integer y = 38
integer width = 794
integer height = 835
integer taborder = 20
string title = "none"
string dataobject = "d_csal_salones_temporales_unlapso"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer li_check

if dwo.Type = "column" then
	
	if string(dwo.Name)= 'marcado' then
	
	li_check=this.GetItemNumber(row,"marcado") 

		choose case li_check
			case 0
				li_check=1
			case 1
				li_check=0	
			end choose
		end if

end if
	 	

end event

event constructor;this.setTransObject(gtr_sumuia)
end event

type dw_csal_salones_temporales_dias from datawindow within w_csal_ficha_salon_cambio
integer x = 2575
integer y = 19
integer width = 1093
integer height = 1290
integer taborder = 10
string title = "none"
string dataobject = "d_csal_salones_temporales_dias"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_regresar from commandbutton within w_csal_ficha_salon_cambio
integer x = 1306
integer y = 1498
integer width = 413
integer height = 106
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Regresar"
end type

event clicked;CloseWithReturn(Parent, '0')
end event

type cb_cambiar from commandbutton within w_csal_ficha_salon_cambio
integer x = 823
integer y = 1498
integer width = 464
integer height = 106
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Cambiar Salón"
end type

event clicked;CloseWithReturn(Parent, '1')
end event

type dw_csal_salon_ficha from datawindow within w_csal_ficha_salon_cambio
integer x = 22
integer y = 19
integer width = 2326
integer height = 1290
integer taborder = 10
string title = "Ficha de Reservación"
string dataobject = "d_csal_salon_ficha"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancelar from commandbutton within w_csal_ficha_salon_cambio
integer x = 549
integer y = 1498
integer width = 739
integer height = 106
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Cancelar Reservación"
end type

event clicked;integer li_mensaje, li_i, li_row, li_reservacion, li_num_asignacion
integer li_cve_dia, li_dias, li_j, li_dia_fecha, li_marcados, ii_cve_dia
date  ld_fecha 

li_mensaje = MessageBox("Aviso", "¿Seguro que desea Cancelar la Reservación?", Exclamation!, YesNo!, 2)

if li_mensaje=1 then
	
	li_row=dw_csal_salones_temporales_dias.RowCount()
	
	if dw_csal_salones_temporales_dias.Find("reservacion=1",1,li_row)=0 then 
		MessageBox("Aviso", "Debe marcar el día que desea cancelar de la reservación.")
		goto salir
	end if
	
	dw_csal_salones_temporales_dias.SetFilter("reservacion=1")
	dw_csal_salones_temporales_dias.Filter()
	
	li_marcados=dw_csal_salones_temporales_dias.rowcount()
	dw_csal_salones_temporales_dias.SetFilter("")
	dw_csal_salones_temporales_dias.Filter()
	dw_csal_salones_temporales_dias.SetSort(is_sort)
	dw_csal_salones_temporales_dias.Sort()
	 
	if (li_row=1) or (li_row=li_marcados and istr_reservacion.lapso_completo=0) then
		
		//Marcar como borrado el registro único
		f_update_estatus_reservacion(0,istr_reservacion.num_asignacion)
		
		CloseWithReturn(Parent, '2')
		
	else
		
		//Borrar todas reservaciones pasadas
		li_row=dw_csal_salones_temporales_unlapso.rowcount()
		
		if li_row=0 then f_delete_reservacion_temporal(istr_reservacion.num_asignacion)
			
		for li_i=1 to li_row
			li_num_asignacion=dw_csal_salones_temporales_unlapso.GetItemNumber(li_i,"num_asignacion")
			f_delete_reservacion_temporal(li_num_asignacion)
		next
		
		
		//Reservar de forma individual todas con su estatus borrado o activo
		li_row=dw_csal_salones_temporales_dias.rowcount()

		istr_reservacion.estatus_reservacion=2
		istr_reservacion.lapso_completo=0
		
		for li_i=1 to li_row
			
			istr_reservacion.cve_dia=dw_csal_salones_temporales_dias.GetItemNumber(li_i,"cve_dia")
			istr_reservacion.fecha_inicio=dw_csal_salones_temporales_dias.GetItemDate(li_i,"fecha")
			istr_reservacion.fecha_final=istr_reservacion.fecha_inicio
					
			li_num_asignacion=f_insert_reservacion_temporal(istr_reservacion)
			li_reservacion=dw_csal_salones_temporales_dias.GetItemNumber(li_i,"reservacion")
	
			if li_reservacion=1 then
				//Marcar como borrada
				f_update_estatus_reservacion(0,li_num_asignacion)
			else
				ii_cve_dia=istr_reservacion.cve_dia
			end if
					
		next
		
		w_csal_salones_reservar.istr_reservacion.cve_dia=ii_cve_dia
		w_csal_salones_reservar.istr_reservacion.hora_inicio=istr_reservacion.hora_inicio
		w_csal_salones_reservar.istr_reservacion.salon=istr_reservacion.salon
		
		CloseWithReturn(Parent, '2')				
			
	end if
	
end if 

salir:


end event

