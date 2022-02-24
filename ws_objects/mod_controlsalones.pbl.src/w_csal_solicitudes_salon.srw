$PBExportHeader$w_csal_solicitudes_salon.srw
forward
global type w_csal_solicitudes_salon from window
end type
type st_1 from statictext within w_csal_solicitudes_salon
end type
type ddlb_estatus from dropdownlistbox within w_csal_solicitudes_salon
end type
type cb_buscar from commandbutton within w_csal_solicitudes_salon
end type
type st_mensaje from statictext within w_csal_solicitudes_salon
end type
type dw_csal_solicitudes_salon from datawindow within w_csal_solicitudes_salon
end type
type dw_csal_solicitudes_temporales from datawindow within w_csal_solicitudes_salon
end type
type dw_csal_solicitudes_permanente from datawindow within w_csal_solicitudes_salon
end type
end forward

global type w_csal_solicitudes_salon from window
integer width = 6100
integer height = 2474
boolean titlebar = true
string title = "Solicitudes de salon"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
st_1 st_1
ddlb_estatus ddlb_estatus
cb_buscar cb_buscar
st_mensaje st_mensaje
dw_csal_solicitudes_salon dw_csal_solicitudes_salon
dw_csal_solicitudes_temporales dw_csal_solicitudes_temporales
dw_csal_solicitudes_permanente dw_csal_solicitudes_permanente
end type
global w_csal_solicitudes_salon w_csal_solicitudes_salon

type variables
str_csal_salones_reservacion istr_reservacion

string is_sort_reservados="#12A #9A #4A"

date idt_fecha_ini_actual, idt_fecha_fin_actual
integer ii_anio, ii_periodo, ii_estatus
end variables

forward prototypes
public function string uf_nombre_dia (integer p_dia)
public subroutine uf_actualiza ()
public function string uf_dia_semana (integer p_dia)
public subroutine uf_limpia ()
public subroutine uf_carga_solicitudes ()
end prototypes

public function string uf_nombre_dia (integer p_dia);string ls_dia

choose case p_dia
	case 0
		ls_dia='Domingo'
	case 1
		ls_dia='Lunes'
	case 2
		ls_dia='Martes'
	case 3
		ls_dia='Miércoles'
	case 4
		ls_dia='Jueves'
	case 5
		ls_dia='Viernes'
	case 6
		ls_dia='Sábado'
end choose

return(ls_dia)
end function

public subroutine uf_actualiza ();dw_csal_solicitudes_permanente.reset()
dw_csal_solicitudes_temporales.reset() 

dw_csal_solicitudes_permanente.SetReDraw(false)
dw_csal_solicitudes_temporales.SetReDraw(false)


if isnull(ii_periodo) or isnull(ii_anio)then
	messagebox('Aviso','Las fechas de reservación deben encontrarse en el periodo escolar actual')
else	
	uf_carga_solicitudes()
end if

dw_csal_solicitudes_permanente.SetReDraw(true)
dw_csal_solicitudes_temporales.SetReDraw(true)

end subroutine

public function string uf_dia_semana (integer p_dia);string ls_dia = ''

choose case p_dia
	case 0
		ls_dia='Domingo'
	case 1
		ls_dia='Lunes'
	case 2	
		ls_dia='Martes'
	case 3
		ls_dia='Miércoles'
	case 4
		ls_dia='Jueves'
	case 5
		ls_dia='Viernes'
	case 6
		ls_dia='Sábado'
	case else
end choose

return (ls_dia)
end function

public subroutine uf_limpia ();dw_csal_solicitudes_salon.Reset()

end subroutine

public subroutine uf_carga_solicitudes ();integer li_i, li_control=0, li_materia, li_temp_dia, li_perma_dia
integer li_j, li_cve_dia, li_k, li_dia_fecha, li_dias_lapso
date ld_fecha_inicio, ld_fecha_final, ld_fecha
string ls_lapso, ls_fecha, ls_titulo

ls_titulo=this.title
this.title='Cargando...'
SetPointer(HourGlass!)

dw_csal_solicitudes_salon.reset()
dw_csal_solicitudes_salon.SetReDraw(false)

dw_csal_solicitudes_temporales.retrieve(ii_periodo,ii_anio,0,ii_estatus,-1,-1)
dw_csal_solicitudes_permanente.retrieve(ii_periodo,ii_anio,1,ii_estatus,-1,-1)

li_temp_dia=dw_csal_solicitudes_temporales.rowcount()
li_perma_dia=dw_csal_solicitudes_permanente.rowcount()

//Permanentes
for li_i=1 to li_perma_dia

	li_control=li_control+1
	dw_csal_solicitudes_salon.insertrow(0)
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_salon", dw_csal_solicitudes_permanente.GetItemString(li_i,"cve_salon"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_materia", dw_csal_solicitudes_permanente.GetItemNumber(li_i,"cve_materia"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_profesor", dw_csal_solicitudes_permanente.GetItemNumber(li_i,"cve_profesor"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_dia", dw_csal_solicitudes_permanente.GetItemNumber(li_i,"cve_dia"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "hora_inicio", dw_csal_solicitudes_permanente.GetItemNumber(li_i,"hora_inicio"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "hora_final", dw_csal_solicitudes_permanente.GetItemNumber(li_i,"hora_final"))
	dw_csal_solicitudes_salon.SetItem(li_control, "fecha_movimiento", dw_csal_solicitudes_permanente.GetItemDateTime(li_i,"fecha_movimiento"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "fecha_inicio", idt_fecha_ini_actual)
	dw_csal_solicitudes_salon.SetItem(li_control, "fecha_final",  idt_fecha_fin_actual)
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_grupo", dw_csal_solicitudes_permanente.GetItemString(li_i,"cve_grupo"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "estatus", dw_csal_solicitudes_permanente.GetItemNumber(li_i,"estatus"))
	dw_csal_solicitudes_salon.SetItem(li_control, "lapso_completo", dw_csal_solicitudes_permanente.GetItemNumber(li_i,"lapso_completo"))
	dw_csal_solicitudes_salon.SetItem(li_control, "tipo_reservacion",'CAMBIO DE SALÓN')
	dw_csal_solicitudes_salon.SetItem(li_control, "nom_dia",f_select_nombre_dia(dw_csal_solicitudes_permanente.GetItemNumber(li_i,"cve_dia")))	
	dw_csal_solicitudes_salon.SetItem(li_control, "lapso",'PERIODO ESCOLAR')
	dw_csal_solicitudes_salon.SetItem(li_control, "horario",string(dw_csal_solicitudes_permanente.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_solicitudes_permanente.GetItemNumber(li_i,"hora_final")))
	dw_csal_solicitudes_salon.SetItem(li_control, "nom_profesor",f_select_nombre_profesor(dw_csal_solicitudes_permanente.GetItemNumber(li_i,"cve_profesor")))		
	dw_csal_solicitudes_salon.SetItem(li_control, "nom_materia",f_select_nombre_materia(dw_csal_solicitudes_permanente.GetItemNumber(li_i,"cve_materia")))		
	dw_csal_solicitudes_salon.SetItem(li_control, "indistinto", dw_csal_solicitudes_permanente.GetItemNumber(li_i,"indistinto"))
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_salon_ant", dw_csal_solicitudes_permanente.GetItemString(li_i,"cve_salon_ant"))
	dw_csal_solicitudes_salon.SetItem(li_control, "estatus_descripcion", dw_csal_solicitudes_permanente.GetItemString(li_i,"estatus_descripcion"))
	dw_csal_solicitudes_salon.SetItem(li_control, "id_solicitud", dw_csal_solicitudes_permanente.GetItemNumber(li_i,"id_solicitud"))
	dw_csal_solicitudes_salon.SetItem(li_control, "permanente", dw_csal_solicitudes_permanente.GetItemNumber(li_i,"permanente"))

next		


//Temporales en ese rango de fecha y horas
for li_i=1 to li_temp_dia
	
	li_control=li_control+1
	dw_csal_solicitudes_salon.insertrow(0)
	
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_salon", dw_csal_solicitudes_temporales.GetItemString(li_i,"cve_salon"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_materia", dw_csal_solicitudes_temporales.GetItemNumber(li_i,"cve_materia"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_profesor", dw_csal_solicitudes_temporales.GetItemNumber(li_i,"cve_profesor"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_dia", dw_csal_solicitudes_temporales.GetItemNumber(li_i,"cve_dia"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "hora_inicio", dw_csal_solicitudes_temporales.GetItemNumber(li_i,"hora_inicio"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "hora_final", dw_csal_solicitudes_temporales.GetItemNumber(li_i,"hora_final"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "fecha_movimiento", dw_csal_solicitudes_temporales.GetItemDateTime(li_i,"fecha_movimiento"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "fecha_inicio", dw_csal_solicitudes_temporales.GetItemDateTime(li_i,"fecha_inicio"))		
	dw_csal_solicitudes_salon.SetItem(li_control, "fecha_final",  dw_csal_solicitudes_temporales.GetItemDateTime(li_i,"fecha_final"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_grupo", dw_csal_solicitudes_temporales.GetItemString(li_i,"cve_grupo"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "estatus", dw_csal_solicitudes_temporales.GetItemNumber(li_i,"estatus"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "lapso_completo", dw_csal_solicitudes_temporales.GetItemNumber(li_i,"lapso_completo"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "observaciones", dw_csal_solicitudes_temporales.GetItemString(li_i,"observaciones"))	
	dw_csal_solicitudes_salon.SetItem(li_control, "tipo_reservacion",'RESERVA TEMPORAL')

	ld_fecha_inicio=date(dw_csal_solicitudes_temporales.GetItemDateTime(li_i,"fecha_inicio"))
	ld_fecha_final=date(dw_csal_solicitudes_temporales.GetItemDateTime(li_i,"fecha_final"))

	li_cve_dia=dw_csal_solicitudes_temporales.GetItemNumber(li_i,"cve_dia")
	li_dias_lapso=DaysAfter(ld_fecha_inicio,ld_fecha_final)+1
	ls_lapso=''
	
	for li_k=1 to li_dias_lapso
		ld_fecha=RelativeDate(ld_fecha_inicio,li_k -1)
		li_dia_fecha=Daynumber(ld_fecha)-1
		
		if li_dia_fecha=li_cve_dia then
			ls_fecha=f_convierte_fecha_texto(ld_fecha)
			if ls_lapso='' then ls_lapso=ls_fecha else 	ls_lapso=ls_lapso+', '+ls_fecha
		 end if
	 next
	
	dw_csal_solicitudes_salon.SetItem(li_control, "nom_dia",f_select_nombre_dia(li_cve_dia))	
	dw_csal_solicitudes_salon.SetItem(li_control, "lapso",ls_lapso)
	dw_csal_solicitudes_salon.SetItem(li_control, "horario",string(dw_csal_solicitudes_temporales.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_solicitudes_temporales.GetItemNumber(li_i,"hora_final")))
	dw_csal_solicitudes_salon.SetItem(li_control, "nom_profesor",f_select_nombre_profesor(dw_csal_solicitudes_temporales.GetItemNumber(li_i,"cve_profesor")))		
	li_materia=dw_csal_solicitudes_temporales.GetItemNumber(li_i,"cve_materia")
	if li_materia=0 then  dw_csal_solicitudes_salon.SetItem(li_control, "nom_materia","NO ASIGNADA") else	dw_csal_solicitudes_salon.SetItem(li_control, "nom_materia",f_select_nombre_materia(dw_csal_solicitudes_temporales.GetItemNumber(li_i,"cve_materia")))  
	dw_csal_solicitudes_salon.SetItem(li_control, "indistinto", dw_csal_solicitudes_temporales.GetItemNumber(li_i,"indistinto"))
	dw_csal_solicitudes_salon.SetItem(li_control, "cve_salon_ant", dw_csal_solicitudes_temporales.GetItemString(li_i,"cve_salon_ant"))
	dw_csal_solicitudes_salon.SetItem(li_control, "estatus_descripcion", dw_csal_solicitudes_temporales.GetItemString(li_i,"estatus_descripcion"))
	dw_csal_solicitudes_salon.SetItem(li_control, "id_solicitud", dw_csal_solicitudes_temporales.GetItemNumber(li_i,"id_solicitud"))
	dw_csal_solicitudes_salon.SetItem(li_control, "permanente", dw_csal_solicitudes_temporales.GetItemNumber(li_i,"permanente"))

next

	
dw_csal_solicitudes_salon.SetSort(is_sort_reservados)
dw_csal_solicitudes_salon.Sort()
dw_csal_solicitudes_salon.SetReDraw(true)

this.title=ls_titulo
SetPointer(Arrow!)

end subroutine

on w_csal_solicitudes_salon.create
this.st_1=create st_1
this.ddlb_estatus=create ddlb_estatus
this.cb_buscar=create cb_buscar
this.st_mensaje=create st_mensaje
this.dw_csal_solicitudes_salon=create dw_csal_solicitudes_salon
this.dw_csal_solicitudes_temporales=create dw_csal_solicitudes_temporales
this.dw_csal_solicitudes_permanente=create dw_csal_solicitudes_permanente
this.Control[]={this.st_1,&
this.ddlb_estatus,&
this.cb_buscar,&
this.st_mensaje,&
this.dw_csal_solicitudes_salon,&
this.dw_csal_solicitudes_temporales,&
this.dw_csal_solicitudes_permanente}
end on

on w_csal_solicitudes_salon.destroy
destroy(this.st_1)
destroy(this.ddlb_estatus)
destroy(this.cb_buscar)
destroy(this.st_mensaje)
destroy(this.dw_csal_solicitudes_salon)
destroy(this.dw_csal_solicitudes_temporales)
destroy(this.dw_csal_solicitudes_permanente)
end on

event open;f_select_anio_periodo_actual_fechas(ii_periodo,ii_anio,today(), idt_fecha_ini_actual, idt_fecha_fin_actual)

ii_estatus=0
post uf_actualiza()


end event

type st_1 from statictext within w_csal_solicitudes_salon
integer x = 48
integer y = 99
integer width = 457
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Estatus:"
boolean focusrectangle = false
end type

type ddlb_estatus from dropdownlistbox within w_csal_solicitudes_salon
integer x = 530
integer y = 99
integer width = 567
integer height = 381
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string item[] = {"Pendientes","Aprobadas","Rechazadas","Canceladas"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text(index)
	case 'Pendientes'
		ii_estatus=0
	case 'Aprobadas'
		ii_estatus=1
	case 'Rechazadas'
		ii_estatus=2
	case 'Canceladas'
		ii_estatus=3
end choose
end event

type cb_buscar from commandbutton within w_csal_solicitudes_salon
integer x = 1865
integer y = 99
integer width = 410
integer height = 106
integer taborder = 160
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Consultar"
end type

event clicked;uf_actualiza()
end event

type st_mensaje from statictext within w_csal_solicitudes_salon
integer x = 80
integer y = 445
integer width = 819
integer height = 173
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
boolean focusrectangle = false
end type

type dw_csal_solicitudes_salon from datawindow within w_csal_solicitudes_salon
integer x = 37
integer y = 275
integer width = 5965
integer height = 2035
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_csal_solicitudes_salon"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;integer li_row,  li_estatus

str_csal_salones_reservacion lstr_reservacion

if row>0 then
	
	li_row=row
	 
	if isvalid(w_csal_salon_permanente_sol) then close(w_csal_salon_permanente_sol) 
	if isvalid(w_csal_salon_temporal) then close(w_csal_salon_temporal_sol) 
	
	li_estatus=this.GetItemNumber(li_row,"estatus")
	
	if li_estatus=0 then
		lstr_reservacion.salon=this.GetItemString(li_row,"cve_salon") 
		lstr_reservacion.materia=this.GetItemString(li_row,"nom_materia") 
		lstr_reservacion.profesor=this.GetItemString(li_row,"nom_profesor") 
		lstr_reservacion.dia=this.GetItemString(li_row,"nom_dia") 
		lstr_reservacion.hora_inicio=this.GetItemNumber(li_row,"hora_inicio")
		lstr_reservacion.hora_final=this.GetItemNumber(li_row,"hora_final")
		lstr_reservacion.fecha_inicio=date(this.GetItemDateTime(li_row,"fecha_inicio"))
		lstr_reservacion.fecha_final=date(this.GetItemDateTime(li_row,"fecha_final"))
		lstr_reservacion.fecha_movimiento=date(this.GetItemDateTime(li_row,"fecha_movimiento"))
		lstr_reservacion.grupo=this.GetItemString(li_row,"cve_grupo")
		lstr_reservacion.tipo_reservacion=this.GetItemString(li_row,"tipo_reservacion") 
		lstr_reservacion.observaciones=this.GetItemString(li_row,"observaciones")
		lstr_reservacion.cve_dia=this.GetItemNumber(li_row,"cve_dia") 
		lstr_reservacion.cve_materia=this.GetItemNumber(li_row,"cve_materia") 
		lstr_reservacion.cve_profesor=this.GetItemNumber(li_row,"cve_profesor") 
		lstr_reservacion.periodo=ii_periodo
		lstr_reservacion.anio=ii_anio
		lstr_reservacion.permanente=this.GetItemNumber(li_row,"permanente") 
		lstr_reservacion.id_solicitud=this.GetItemNumber(li_row,"id_solicitud") 
		lstr_reservacion.id_lapso_solicitud=this.GetItemNumber(li_row,"lapso_completo") 
		lstr_reservacion.indistinto=this.GetItemNumber(li_row,"indistinto") 
		lstr_reservacion.salon_anterior=this.GetItemString(li_row,"cve_salon_ant")
		
		if lstr_reservacion.permanente = 0 then
			openwithparm(w_csal_salon_temporal_sol, lstr_reservacion)
		elseif lstr_reservacion.permanente = 1 then
			openwithparm(w_csal_salon_permanente_sol, lstr_reservacion)
		end if
	
	end if

end if


end event

type dw_csal_solicitudes_temporales from datawindow within w_csal_solicitudes_salon
boolean visible = false
integer x = 1518
integer y = 176
integer width = 1463
integer height = 240
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_csal_salones_solicitudes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type dw_csal_solicitudes_permanente from datawindow within w_csal_solicitudes_salon
boolean visible = false
integer width = 1514
integer height = 262
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_csal_salones_solicitudes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

