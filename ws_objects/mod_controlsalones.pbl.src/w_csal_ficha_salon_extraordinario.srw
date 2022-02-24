$PBExportHeader$w_csal_ficha_salon_extraordinario.srw
forward
global type w_csal_ficha_salon_extraordinario from window
end type
type cbx_seleccionar from checkbox within w_csal_ficha_salon_extraordinario
end type
type dw_csal_salones_extraordinarios_dias from datawindow within w_csal_ficha_salon_extraordinario
end type
type dw_csal_salones_extraordinarios_unlapso from datawindow within w_csal_ficha_salon_extraordinario
end type
type cb_cancelar from commandbutton within w_csal_ficha_salon_extraordinario
end type
type cb_confirmar from commandbutton within w_csal_ficha_salon_extraordinario
end type
type dw_csal_salon_ficha from datawindow within w_csal_ficha_salon_extraordinario
end type
end forward

global type w_csal_ficha_salon_extraordinario from window
integer width = 2684
integer height = 1552
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 29534863
string icon = "AppIcon!"
boolean center = true
cbx_seleccionar cbx_seleccionar
dw_csal_salones_extraordinarios_dias dw_csal_salones_extraordinarios_dias
dw_csal_salones_extraordinarios_unlapso dw_csal_salones_extraordinarios_unlapso
cb_cancelar cb_cancelar
cb_confirmar cb_confirmar
dw_csal_salon_ficha dw_csal_salon_ficha
end type
global w_csal_ficha_salon_extraordinario w_csal_ficha_salon_extraordinario

type variables
str_csal_salones_reservacion istr_reservacion
integer ii_reserva=1

string is_sort='#5A'

end variables

on w_csal_ficha_salon_extraordinario.create
this.cbx_seleccionar=create cbx_seleccionar
this.dw_csal_salones_extraordinarios_dias=create dw_csal_salones_extraordinarios_dias
this.dw_csal_salones_extraordinarios_unlapso=create dw_csal_salones_extraordinarios_unlapso
this.cb_cancelar=create cb_cancelar
this.cb_confirmar=create cb_confirmar
this.dw_csal_salon_ficha=create dw_csal_salon_ficha
this.Control[]={this.cbx_seleccionar,&
this.dw_csal_salones_extraordinarios_dias,&
this.dw_csal_salones_extraordinarios_unlapso,&
this.cb_cancelar,&
this.cb_confirmar,&
this.dw_csal_salon_ficha}
end on

on w_csal_ficha_salon_extraordinario.destroy
destroy(this.cbx_seleccionar)
destroy(this.dw_csal_salones_extraordinarios_dias)
destroy(this.dw_csal_salones_extraordinarios_unlapso)
destroy(this.cb_cancelar)
destroy(this.cb_confirmar)
destroy(this.dw_csal_salon_ficha)
end on

event open;integer li_i, li_dias_lapso, li_dia_fecha, li_control=0, li_row=1, li_j, li_cve_dia
date ld_fecha
string ls_materia 
istr_reservacion =message.powerobjectparm

ls_materia=istr_reservacion.materia+' (GRUPO '+istr_reservacion.grupo+')'
if f_valida_es_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio)>0 then ls_materia=ls_materia+'. ASIMILADA DE '+f_select_padre_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio)
 
dw_csal_salon_ficha.insertrow(0)
dw_csal_salon_ficha.SetItem(1, "salon",istr_reservacion.salon+' ('+ f_select_clase_aula_salon(istr_reservacion.salon)+')'	)
dw_csal_salon_ficha.SetItem(1, "materia", ls_materia)	
dw_csal_salon_ficha.SetItem(1, "profesor", istr_reservacion.profesor)	
dw_csal_salon_ficha.SetItem(1, "grupo", istr_reservacion.grupo)	
dw_csal_salon_ficha.SetItem(1, "horario", istr_reservacion.horario)	
dw_csal_salon_ficha.SetItem(1, "lapso",istr_reservacion.lapso)
dw_csal_salon_ficha.SetItem(1, "fecha_movimiento", istr_reservacion.fecha_movimiento)	
dw_csal_salon_ficha.SetItem(1, "tipo_reservacion",istr_reservacion.tipo_reservacion)	
dw_csal_salon_ficha.SetItem(1, "observaciones",istr_reservacion.observaciones)	
dw_csal_salon_ficha.SetItem(1, "horario_periodo",f_select_texto_horarios_materia(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "materias_asimiladas",f_select_texto_asimiladas(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "asimilada",f_valida_es_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "salon_anterior",f_select_texto_salones_anteriores(istr_reservacion.cve_dia,istr_reservacion.hora_inicio,istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))

	
if istr_reservacion.lapso_completo>0 then 
	dw_csal_salones_extraordinarios_unlapso.Retrieve(istr_reservacion.periodo,istr_reservacion.anio,istr_reservacion.lapso_completo)
	li_row=dw_csal_salones_extraordinarios_unlapso.RowCount()
end if

li_dias_lapso=DaysAfter(istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)+1
li_cve_dia=istr_reservacion.cve_dia	

	for li_i=1 to li_dias_lapso
		
		ld_fecha=RelativeDate(istr_reservacion.fecha_inicio,li_i -1)
		li_dia_fecha=Daynumber(ld_fecha)-1
		
		for li_j=1 to li_row
		
			if istr_reservacion.lapso_completo>0 then li_cve_dia=dw_csal_salones_extraordinarios_unlapso.GetItemNumber(li_j,"cve_dia")
						
			if li_dia_fecha=li_cve_dia then

				li_control=li_control+1
				dw_csal_salones_extraordinarios_dias.InsertRow(0)
				dw_csal_salones_extraordinarios_dias.SetItem(li_control,"reservacion",1)
				dw_csal_salones_extraordinarios_dias.SetItem(li_control, "cve_dia", li_dia_fecha)
				dw_csal_salones_extraordinarios_dias.SetItem(li_control, "nom_dia", f_select_nombre_dia(li_dia_fecha))
				dw_csal_salones_extraordinarios_dias.SetItem(li_control, "fecha", ld_fecha)
				dw_csal_salones_extraordinarios_dias.SetItem(li_control, "nom_fecha", f_convierte_fecha_texto(ld_fecha) + ' ' + string(year(ld_fecha)))
				
			end if
			
		next
				
	next
	
	dw_csal_salones_extraordinarios_dias.SetSort(is_sort)
	dw_csal_salones_extraordinarios_dias.Sort()
	

end event

type cbx_seleccionar from checkbox within w_csal_ficha_salon_extraordinario
integer x = 1803
integer y = 1325
integer width = 508
integer height = 77
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 29534863
string text = "Seleccionar todos"
boolean checked = true
end type

event clicked;integer li_i, li_row, li_valor

li_row=dw_csal_salones_extraordinarios_dias.rowcount()

if this.checked=true then li_valor=1 else li_valor=0

for li_i=1 to li_row
	dw_csal_salones_extraordinarios_dias.SetItem(li_i,"reservacion",li_valor)
next



end event

type dw_csal_salones_extraordinarios_dias from datawindow within w_csal_ficha_salon_extraordinario
integer x = 1799
integer y = 26
integer width = 845
integer height = 1248
integer taborder = 50
string title = "none"
string dataobject = "d_csal_salones_temporales_dias"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_csal_salones_extraordinarios_unlapso from datawindow within w_csal_ficha_salon_extraordinario
integer x = 2695
integer y = 74
integer width = 794
integer height = 835
integer taborder = 40
string title = "none"
string dataobject = "d_csal_salones_temporales_unlapso"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

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

type cb_cancelar from commandbutton within w_csal_ficha_salon_extraordinario
integer x = 640
integer y = 1328
integer width = 538
integer height = 106
integer taborder = 30
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cancelar Reservación"
end type

event clicked;integer li_mensaje, li_i, li_row, li_reservacion, li_num_asignacion
integer li_cve_dia, li_dias, li_j, li_dia_fecha, li_marcados
date  ld_fecha 

li_mensaje = MessageBox("Aviso", "¿Seguro que desea Cancelar la PreReservación?", Exclamation!, YesNo!, 2)

if li_mensaje=1 then
	
	li_row=dw_csal_salones_extraordinarios_dias.RowCount()
	
	if dw_csal_salones_extraordinarios_dias.Find("reservacion=1",1,li_row)=0 then 
		MessageBox("Aviso", "Debe marcar el día que desea cancelar de la reservación.")
		goto salir
	end if
	
	dw_csal_salones_extraordinarios_dias.SetFilter("reservacion=1")
	dw_csal_salones_extraordinarios_dias.Filter()
	
	li_marcados=dw_csal_salones_extraordinarios_dias.rowcount()
	dw_csal_salones_extraordinarios_dias.SetFilter("")
	dw_csal_salones_extraordinarios_dias.Filter()
	dw_csal_salones_extraordinarios_dias.SetSort(is_sort)
	dw_csal_salones_extraordinarios_dias.Sort()
	
	if (li_row=1) or (li_row=li_marcados and istr_reservacion.lapso_completo=0) then
		
		//Borrar el registro único

 		f_delete_reservacion_temporal(istr_reservacion.num_asignacion)
		w_csal_control_salones_extraordinarios.uf_cargar_reservados()
		close(w_csal_ficha_salon_extraordinario)		
		
	else
		
		//Borrar todas reservaciones pasadas
		li_row=dw_csal_salones_extraordinarios_unlapso.rowcount()
		
		if li_row=0 then f_delete_reservacion_temporal(istr_reservacion.num_asignacion)
			
		for li_i=1 to li_row
			li_num_asignacion=dw_csal_salones_extraordinarios_unlapso.GetItemNumber(li_i,"num_asignacion")
			f_delete_reservacion_temporal(li_num_asignacion)
		next
		
		//Reservar de forma individual las que no fueron marcadas para borrarse
		li_row=dw_csal_salones_extraordinarios_dias.rowcount()

		istr_reservacion.estatus_reservacion=4
		istr_reservacion.lapso_completo=0
		
		for li_i=1 to li_row
				
			li_reservacion=dw_csal_salones_extraordinarios_dias.GetItemNumber(li_i,"reservacion")
				
			if li_reservacion=0 then
			
				istr_reservacion.cve_dia=dw_csal_salones_extraordinarios_dias.GetItemNumber(li_i,"cve_dia")
				istr_reservacion.fecha_inicio=dw_csal_salones_extraordinarios_dias.GetItemDate(li_i,"fecha")
				istr_reservacion.fecha_final=istr_reservacion.fecha_inicio
					
				f_insert_reservacion_temporal(istr_reservacion)
					
			end if
					
		next
					
		w_csal_control_salones_extraordinarios.uf_cargar_reservados()
		Close(w_csal_ficha_salon_extraordinario)						
			
	end if
	
end if 

salir:
end event

type cb_confirmar from commandbutton within w_csal_ficha_salon_extraordinario
integer x = 1196
integer y = 1328
integer width = 578
integer height = 106
integer taborder = 20
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Confirmar Reservación"
end type

event clicked;integer li_mensaje, li_i, li_row, li_reservacion, li_num_asignacion
integer li_cve_dia, li_dias, li_j, li_dia_fecha, li_marcados
date  ld_fecha 

li_mensaje = MessageBox("Aviso", "¿Seguro que desea Confirmar la PreReservación?", Exclamation!, YesNo!, 2)

if li_mensaje=1 then
	
	li_row=dw_csal_salones_extraordinarios_dias.RowCount()
	
	if dw_csal_salones_extraordinarios_dias.Find("reservacion=1",1,li_row)=0 then 
		MessageBox("Aviso", "Debe marcar el día que desea confirmar de la reservación.")
		goto salir
	end if
	
	dw_csal_salones_extraordinarios_dias.SetFilter("reservacion=1")
	dw_csal_salones_extraordinarios_dias.Filter()
	
	li_marcados=dw_csal_salones_extraordinarios_dias.rowcount()
	dw_csal_salones_extraordinarios_dias.SetFilter("")
	dw_csal_salones_extraordinarios_dias.Filter()
	dw_csal_salones_extraordinarios_dias.SetSort(is_sort)
	dw_csal_salones_extraordinarios_dias.Sort()
	
	if (li_row=1) or (li_row=li_marcados and istr_reservacion.lapso_completo=0) then
		
		//Confirmar en el mismo registro

		f_update_estatus_reservacion(4,istr_reservacion.num_asignacion)
		w_csal_control_salones_extraordinarios.uf_cargar_reservados()
		close(w_csal_ficha_salon_extraordinario)		
		
	else

		//Borrar todas reservaciones pasadas
		li_row=dw_csal_salones_extraordinarios_unlapso.rowcount()
		
		if li_row=0 then f_delete_reservacion_temporal(istr_reservacion.num_asignacion)
			
		for li_i=1 to li_row
			li_num_asignacion=dw_csal_salones_extraordinarios_unlapso.GetItemNumber(li_i,"num_asignacion")
			f_delete_reservacion_temporal(li_num_asignacion)
		next
		
		//Reservar de forma individual las confirmadas
		li_row=dw_csal_salones_extraordinarios_dias.rowcount()

		istr_reservacion.estatus_reservacion=4
		istr_reservacion.lapso_completo=0
		
		for li_i=1 to li_row
				
			li_reservacion=dw_csal_salones_extraordinarios_dias.GetItemNumber(li_i,"reservacion")
				
			if li_reservacion=1 then
			
				istr_reservacion.cve_dia=dw_csal_salones_extraordinarios_dias.GetItemNumber(li_i,"cve_dia")
				istr_reservacion.fecha_inicio=dw_csal_salones_extraordinarios_dias.GetItemDate(li_i,"fecha")
				istr_reservacion.fecha_final=istr_reservacion.fecha_inicio
					
				f_insert_reservacion_temporal(istr_reservacion)
					
			end if
					
		next
					
		w_csal_control_salones_extraordinarios.uf_cargar_reservados()
		Close(w_csal_ficha_salon_extraordinario)						
			
	end if
	
end if 

salir:
end event

type dw_csal_salon_ficha from datawindow within w_csal_ficha_salon_extraordinario
integer x = 26
integer y = 29
integer width = 1744
integer height = 1245
integer taborder = 10
string title = "Ficha de Reservación"
string dataobject = "d_csal_salon_ficha"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

