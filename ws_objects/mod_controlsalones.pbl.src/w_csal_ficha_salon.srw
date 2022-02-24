$PBExportHeader$w_csal_ficha_salon.srw
forward
global type w_csal_ficha_salon from window
end type
type dw_csal_salon_ficha from datawindow within w_csal_ficha_salon
end type
end forward

global type w_csal_ficha_salon from window
integer width = 2373
integer height = 1408
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_csal_salon_ficha dw_csal_salon_ficha
end type
global w_csal_ficha_salon w_csal_ficha_salon

type variables
str_csal_salones_reservacion istr_reservacion
end variables

on w_csal_ficha_salon.create
this.dw_csal_salon_ficha=create dw_csal_salon_ficha
this.Control[]={this.dw_csal_salon_ficha}
end on

on w_csal_ficha_salon.destroy
destroy(this.dw_csal_salon_ficha)
end on

event open;integer li_row
string ls_tipo_reservacion, ls_materia
istr_reservacion =message.powerobjectparm

ls_materia=istr_reservacion.materia+' (GRUPO '+istr_reservacion.grupo+')'
if f_valida_es_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio)>0 then ls_materia=ls_materia+'. ASIMILADA DE '+f_select_padre_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio)


dw_csal_salon_ficha.insertrow(0)
dw_csal_salon_ficha.SetItem(1, "salon",istr_reservacion.salon+' ('+ f_select_clase_aula_salon(istr_reservacion.salon)+')')	
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



 
 
end event

type dw_csal_salon_ficha from datawindow within w_csal_ficha_salon
integer x = 22
integer y = 32
integer width = 2319
integer height = 1277
integer taborder = 10
string title = "Ficha de Reservación"
string dataobject = "d_csal_salon_ficha"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

