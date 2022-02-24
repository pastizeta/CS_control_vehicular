$PBExportHeader$w_csal_ficha_salon_reservacion.srw
forward
global type w_csal_ficha_salon_reservacion from window
end type
type cb_1 from commandbutton within w_csal_ficha_salon_reservacion
end type
type cb_reservar from commandbutton within w_csal_ficha_salon_reservacion
end type
type dw_csal_salon_ficha from datawindow within w_csal_ficha_salon_reservacion
end type
end forward

global type w_csal_ficha_salon_reservacion from window
integer width = 2377
integer height = 1536
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
cb_reservar cb_reservar
dw_csal_salon_ficha dw_csal_salon_ficha
end type
global w_csal_ficha_salon_reservacion w_csal_ficha_salon_reservacion

type variables
str_csal_salones_reservacion istr_reservacion
end variables

on w_csal_ficha_salon_reservacion.create
this.cb_1=create cb_1
this.cb_reservar=create cb_reservar
this.dw_csal_salon_ficha=create dw_csal_salon_ficha
this.Control[]={this.cb_1,&
this.cb_reservar,&
this.dw_csal_salon_ficha}
end on

on w_csal_ficha_salon_reservacion.destroy
destroy(this.cb_1)
destroy(this.cb_reservar)
destroy(this.dw_csal_salon_ficha)
end on

event open;integer li_row, li_cve_dia, li_dias_lapso, li_k, li_dia_fecha
string ls_tipo_reservacion, ls_fecha, ls_lapso, ls_materia
date ld_fecha
istr_reservacion =message.powerobjectparm

ls_materia=istr_reservacion.materia+' (GRUPO '+istr_reservacion.grupo+')'
if f_valida_es_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio)>0 then ls_materia=ls_materia+'. ASIMILADA DE '+f_select_padre_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio)

dw_csal_salon_ficha.insertrow(0)
dw_csal_salon_ficha.SetItem(1, "salon",istr_reservacion.salon+' ('+ f_select_clase_aula_salon(istr_reservacion.salon)+')'	)	
dw_csal_salon_ficha.SetItem(1, "profesor", istr_reservacion.profesor)	
dw_csal_salon_ficha.SetItem(1, "grupo", istr_reservacion.grupo)	
dw_csal_salon_ficha.SetItem(1, "materia", ls_materia)
dw_csal_salon_ficha.SetItem(1, "horario", string(istr_reservacion.hora_inicio)+" a "+string(istr_reservacion.hora_final))	

choose case istr_reservacion.estatus_reservacion
	case 1 
		ls_lapso=istr_reservacion.dia+' '+'DEL PERIODO ESCOLAR'	
	case 2

		if istr_reservacion.lapso_completo=0 then	
						
			li_cve_dia=istr_reservacion.cve_dia
			li_dias_lapso=DaysAfter(istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)+1
			ls_lapso=''
						
			for li_k=1 to li_dias_lapso
				ld_fecha=RelativeDate(istr_reservacion.fecha_inicio,li_k -1)
				li_dia_fecha=Daynumber(ld_fecha)-1
							
				if li_dia_fecha=li_cve_dia then
					ls_fecha=f_convierte_fecha_texto(ld_fecha)
					if ls_lapso='' then ls_lapso=ls_fecha else 	ls_lapso=ls_lapso+', '+ls_fecha
				 end if
			 next
						
			ls_lapso=istr_reservacion.dia+' '+ls_lapso		
						
		else
			ls_lapso='TODOS LOS DIAS DEL'+' '+f_convierte_fecha_texto(istr_reservacion.fecha_inicio)+' AL '+f_convierte_fecha_texto(istr_reservacion.fecha_final)
		end if
	
end choose

dw_csal_salon_ficha.SetItem(1, "lapso",upper(ls_lapso))
dw_csal_salon_ficha.SetItem(1, "fecha_movimiento", istr_reservacion.fecha_movimiento)	
dw_csal_salon_ficha.SetItem(1, "tipo_reservacion",istr_reservacion.tipo_reservacion)	
dw_csal_salon_ficha.SetItem(1, "observaciones",istr_reservacion.observaciones)	
dw_csal_salon_ficha.SetItem(1, "horario_periodo",f_select_texto_horarios_materia(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "materias_asimiladas",f_select_texto_asimiladas(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "asimilada",f_valida_es_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "salon_anterior",f_select_texto_salones_anteriores(istr_reservacion.cve_dia,istr_reservacion.hora_inicio,istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))

end event

type cb_1 from commandbutton within w_csal_ficha_salon_reservacion
integer x = 1989
integer y = 1331
integer width = 336
integer height = 106
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Salir"
end type

event clicked;CloseWithReturn(Parent, '0')

end event

type cb_reservar from commandbutton within w_csal_ficha_salon_reservacion
integer x = 1631
integer y = 1331
integer width = 347
integer height = 106
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Reservar"
end type

event clicked;integer li_i, li_dia, li_dias, li_lapso
integer li_ocupado

if istr_reservacion.temporal=1 then 

	//Validar si sigue disponible
	select count(*)
	into :li_ocupado
	from dbo.horario
	where cve_salon=:istr_reservacion.salon
	and cve_dia=:istr_reservacion.cve_dia
	and hora_inicio=:istr_reservacion.hora_inicio
	using gtr_escolar; 

	if gtr_escolar.SQLCode = -1 then 
		messagebox("Error ESCOLAR: Revisión de disponibilidad", gtr_escolar.SQLErrText)	
		CloseWithReturn(Parent, '0')
	end if
	
	if li_ocupado > 0 then
		messagebox('Aviso','El salón ya no se encuentra disponible')
		CloseWithReturn(Parent, '0')
	else
		if f_update_salon_actual(istr_reservacion.salon,istr_reservacion.salon_anterior, istr_reservacion.cve_dia, istr_reservacion.hora_inicio, istr_reservacion.cve_materia,istr_reservacion.grupo) = 1 then
			f_insert_reservacion_cambio(istr_reservacion)
			CloseWithReturn(Parent, '1')
		else
			CloseWithReturn(Parent, '0')
		end if 
	end if

else   

	if istr_reservacion.lapso_completo=0 then
	
		f_insert_reservacion_temporal(istr_reservacion)
		CloseWithReturn(Parent, '1')
		
	else	
	
		if istr_reservacion.lapso_completo=1 then
			li_lapso=f_select_lapso_completo_max()
			istr_reservacion.lapso_completo=li_lapso+1
			w_csal_salones_reservar.ii_lapso_foco=istr_reservacion.lapso_completo
		end if
	
		//Reservar para cada día.
	
		li_dias=DaysAfter(istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)+1
		if li_dias>7 then li_dias=7
		li_dia=DayNumber(istr_reservacion.fecha_inicio) -2
	
		for li_i=1 to li_dias
					
			li_dia=li_dia+1
			if li_dia=7 then li_dia=0
			istr_reservacion.cve_dia=li_dia
			f_insert_reservacion_temporal(istr_reservacion)
		next
	
		CloseWithReturn(Parent, '1')
		
	end if

end if

end event

type dw_csal_salon_ficha from datawindow within w_csal_ficha_salon_reservacion
integer x = 22
integer y = 32
integer width = 2300
integer height = 1264
integer taborder = 10
string title = "Ficha de Reservación"
string dataobject = "d_csal_salon_ficha"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

