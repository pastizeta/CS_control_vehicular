$PBExportHeader$w_csal_prestamo_salon_dia.srw
forward
global type w_csal_prestamo_salon_dia from window
end type
type st_total from statictext within w_csal_prestamo_salon_dia
end type
type cb_buscar from commandbutton within w_csal_prestamo_salon_dia
end type
type st_dia from statictext within w_csal_prestamo_salon_dia
end type
type st_1 from statictext within w_csal_prestamo_salon_dia
end type
type em_hora_final from editmask within w_csal_prestamo_salon_dia
end type
type em_hora_inicio from editmask within w_csal_prestamo_salon_dia
end type
type em_fecha from editmask within w_csal_prestamo_salon_dia
end type
type st_mensaje from statictext within w_csal_prestamo_salon_dia
end type
type dw_csal_salones_reservados_lapso from datawindow within w_csal_prestamo_salon_dia
end type
type dw_csal_salon_activo from datawindow within w_csal_prestamo_salon_dia
end type
type dw_csal_salones_reservados from datawindow within w_csal_prestamo_salon_dia
end type
type cb_reservar from commandbutton within w_csal_prestamo_salon_dia
end type
type dw_csal_salones_fecha_temporales_dia from datawindow within w_csal_prestamo_salon_dia
end type
type dw_csal_salones_hora_permanentes from datawindow within w_csal_prestamo_salon_dia
end type
end forward

global type w_csal_prestamo_salon_dia from window
integer width = 6967
integer height = 2733
boolean titlebar = true
string title = "Salones reservados"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
st_total st_total
cb_buscar cb_buscar
st_dia st_dia
st_1 st_1
em_hora_final em_hora_final
em_hora_inicio em_hora_inicio
em_fecha em_fecha
st_mensaje st_mensaje
dw_csal_salones_reservados_lapso dw_csal_salones_reservados_lapso
dw_csal_salon_activo dw_csal_salon_activo
dw_csal_salones_reservados dw_csal_salones_reservados
cb_reservar cb_reservar
dw_csal_salones_fecha_temporales_dia dw_csal_salones_fecha_temporales_dia
dw_csal_salones_hora_permanentes dw_csal_salones_hora_permanentes
end type
global w_csal_prestamo_salon_dia w_csal_prestamo_salon_dia

type variables
str_csal_salones_reservacion istr_reservacion

string is_sort_reservados="#17A #5A #1A"

date idt_fecha
date idt_fecha_ini, idt_fecha_fin
date idt_fecha_ini_actual, idt_fecha_fin_actual

integer ii_cve_dia, ii_hora_inicio, ii_hora_final
integer ii_anio, ii_periodo
integer ii_anio_actual, ii_periodo_actual
end variables

forward prototypes
public subroutine uf_carga_reservados ()
public function string uf_nombre_dia (integer p_dia)
public subroutine uf_actualiza ()
public function string uf_dia_semana (integer p_dia)
public subroutine uf_cambia_dia ()
public subroutine uf_limpia ()
end prototypes

public subroutine uf_carga_reservados ();integer li_i, li_control=0, li_materia, li_temp_dia, li_perma_dia, li_lapso_actual, li_total=0
integer li_j, li_lapso=0, li_dias, li_dia, li_cve_dia, li_k, li_dia_fecha, li_dias_lapso
date ld_fecha_inicio, ld_fecha_final, ld_fecha
string ls_lapso, ls_fecha, ls_titulo

ls_titulo=this.title
this.title='Cargando...'
SetPointer(HourGlass!)

dw_csal_salones_reservados.reset()
dw_csal_salones_reservados.SetReDraw(false)

dw_csal_salones_fecha_temporales_dia.retrieve(ii_periodo,ii_anio,ii_cve_dia,ii_hora_inicio,ii_hora_final,idt_fecha,idt_fecha)
dw_csal_salones_hora_permanentes.retrieve(ii_periodo,ii_anio,ii_cve_dia,ii_hora_inicio,ii_hora_final)

li_temp_dia=dw_csal_salones_fecha_temporales_dia.rowcount()
li_perma_dia=dw_csal_salones_hora_permanentes.rowcount()

//Permanentes
for li_i=1 to li_perma_dia

	li_control=li_control+1
	dw_csal_salones_reservados.insertrow(0)
	dw_csal_salones_reservados.SetItem(li_control, "cve_salon", dw_csal_salones_hora_permanentes.GetItemString(li_i,"cve_salon"))	
	dw_csal_salones_reservados.SetItem(li_control, "cve_materia", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_materia"))	
	dw_csal_salones_reservados.SetItem(li_control, "cve_profesor", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_profesor"))	
	dw_csal_salones_reservados.SetItem(li_control, "cve_dia", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_dia"))	
	dw_csal_salones_reservados.SetItem(li_control, "hora_inicio", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"hora_inicio"))	
	dw_csal_salones_reservados.SetItem(li_control, "hora_final", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"hora_final"))
	dw_csal_salones_reservados.SetItem(li_control, "fecha_inicio", idt_fecha_ini_actual)
	dw_csal_salones_reservados.SetItem(li_control, "fecha_final",  idt_fecha_fin_actual)
	dw_csal_salones_reservados.SetItem(li_control, "cve_grupo", dw_csal_salones_hora_permanentes.GetItemString(li_i,"cve_grupo"))	
	dw_csal_salones_reservados.SetItem(li_control, "inscritos", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"grupos_inscritos"))	
	dw_csal_salones_reservados.SetItem(li_control, "estatus", 1)
	dw_csal_salones_reservados.SetItem(li_control, "lapso_completo",0)
	dw_csal_salones_reservados.SetItem(li_control, "tipo_reservacion",f_select_nombre_estatus(1))
	dw_csal_salones_reservados.SetItem(li_control, "nom_dia",f_select_nombre_dia(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_dia")))	
	dw_csal_salones_reservados.SetItem(li_control, "lapso",'PERIODO ESCOLAR')
	dw_csal_salones_reservados.SetItem(li_control, "horario",string(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"hora_final")))
	dw_csal_salones_reservados.SetItem(li_control, "nom_profesor",f_select_nombre_profesor(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_profesor")))		
	dw_csal_salones_reservados.SetItem(li_control, "nom_materia",f_select_nombre_materia(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_materia")))		
	if f_valida_tiene_asimiladas(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_materia"),dw_csal_salones_hora_permanentes.GetItemString(li_i,"cve_grupo"),ii_periodo,ii_anio)>0 then dw_csal_salones_reservados.SetItem(li_control, "asimiladas",'**')
	if f_valida_es_asimilada(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_materia"),dw_csal_salones_hora_permanentes.GetItemString(li_i,"cve_grupo"),ii_periodo,ii_anio)>0 then dw_csal_salones_reservados.SetItem(li_control, "asimiladas",'*')

next		


//Temporales en ese rango de fecha y horas
for li_i=1 to li_temp_dia

	li_control=li_control+1
	dw_csal_salones_reservados.insertrow(0)
	dw_csal_salones_reservados.SetItem(li_control, "cve_salon", dw_csal_salones_fecha_temporales_dia.GetItemString(li_i,"cve_salon"))	
	dw_csal_salones_reservados.SetItem(li_control, "cve_materia", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_materia"))	
	dw_csal_salones_reservados.SetItem(li_control, "cve_profesor", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_profesor"))	
	dw_csal_salones_reservados.SetItem(li_control, "cve_dia", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_dia"))	
	dw_csal_salones_reservados.SetItem(li_control, "hora_inicio", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"hora_inicio"))	
	dw_csal_salones_reservados.SetItem(li_control, "hora_final", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"hora_final"))	
	dw_csal_salones_reservados.SetItem(li_control, "num_asignacion", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"num_asignacion"))	
	dw_csal_salones_reservados.SetItem(li_control, "fecha_movimiento", dw_csal_salones_fecha_temporales_dia.GetItemDateTime(li_i,"fecha_movimiento"))	
	dw_csal_salones_reservados.SetItem(li_control, "fecha_inicio", dw_csal_salones_fecha_temporales_dia.GetItemDateTime(li_i,"fecha_inicio"))		
	dw_csal_salones_reservados.SetItem(li_control, "fecha_final",  dw_csal_salones_fecha_temporales_dia.GetItemDateTime(li_i,"fecha_final"))	
	dw_csal_salones_reservados.SetItem(li_control, "cve_grupo", dw_csal_salones_fecha_temporales_dia.GetItemString(li_i,"cve_grupo"))	
	dw_csal_salones_reservados.SetItem(li_control, "estatus", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"estatus"))	
	dw_csal_salones_reservados.SetItem(li_control, "lapso_completo", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"lapso_completo"))	
	dw_csal_salones_reservados.SetItem(li_control, "observaciones", dw_csal_salones_fecha_temporales_dia.GetItemString(li_i,"observaciones"))	
	dw_csal_salones_reservados.SetItem(li_control, "tipo_reservacion",f_select_nombre_estatus(dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"estatus")))		

	ld_fecha_inicio=date(dw_csal_salones_fecha_temporales_dia.GetItemDateTime(li_i,"fecha_inicio"))
	ld_fecha_final=date(dw_csal_salones_fecha_temporales_dia.GetItemDateTime(li_i,"fecha_final"))

	if (dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"lapso_completo"))=0 then	
		
		li_cve_dia=dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_dia")
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
		
		dw_csal_salones_reservados.SetItem(li_control, "nom_dia",f_select_nombre_dia(li_cve_dia))	
		dw_csal_salones_reservados.SetItem(li_control, "lapso",ls_lapso)
		
	else
		dw_csal_salones_reservados.SetItem(li_control, "nom_dia",'TODOS')
		dw_csal_salones_reservados.SetItem(li_control, "cve_dia",-1)
		dw_csal_salones_reservados.SetItem(li_control, "lapso",f_convierte_fecha_texto(ld_fecha_inicio)+' AL '+f_convierte_fecha_texto(ld_fecha_final))
	end if				
	
	dw_csal_salones_reservados.SetItem(li_control, "horario",string(dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"hora_final")))
	dw_csal_salones_reservados.SetItem(li_control, "nom_profesor",f_select_nombre_profesor(dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_profesor")))		
	li_materia=dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_materia")
	if li_materia=0 then  dw_csal_salones_reservados.SetItem(li_control, "nom_materia","NO ASIGNADA") else	dw_csal_salones_reservados.SetItem(li_control, "nom_materia",f_select_nombre_materia(dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_materia")))  
	if f_valida_tiene_asimiladas(dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_materia"),dw_csal_salones_fecha_temporales_dia.GetItemString(li_i,"cve_grupo"),istr_reservacion.periodo,istr_reservacion.anio)>0 then 	dw_csal_salones_reservados.SetItem(li_control, "asimiladas",'**')
	if f_valida_es_asimilada(dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_materia"),dw_csal_salones_fecha_temporales_dia.GetItemString(li_i,"cve_grupo"),istr_reservacion.periodo,istr_reservacion.anio)>0 then 	dw_csal_salones_reservados.SetItem(li_control, "asimiladas",'*')				
	
next

	
dw_csal_salones_reservados.SetSort(is_sort_reservados)
dw_csal_salones_reservados.Sort()
dw_csal_salones_reservados.SetReDraw(true)

li_total=dw_csal_salones_reservados.rowcount()
st_total.text=string(li_total)
this.title=ls_titulo
SetPointer(Arrow!)

end subroutine

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

public subroutine uf_actualiza ();f_select_anio_periodo_actual_fechas(ii_periodo_actual,ii_anio_actual,idt_fecha,idt_fecha_ini_actual, idt_fecha_fin_actual)

st_dia.text = uf_nombre_dia(ii_cve_dia)

dw_csal_salon_activo.reset()
dw_csal_salones_hora_permanentes.reset()
dw_csal_salones_fecha_temporales_dia.reset() 
dw_csal_salones_reservados_lapso.reset()

dw_csal_salon_activo.SetReDraw(false)
dw_csal_salones_hora_permanentes.SetReDraw(false)
dw_csal_salones_fecha_temporales_dia.SetReDraw(false)
dw_csal_salones_reservados_lapso.SetReDraw(false)

if isnull(ii_periodo) or isnull(ii_anio) or ii_anio<>ii_anio_actual or ii_periodo<>ii_periodo_actual then
	messagebox('Aviso','Las fechas de reservación deben encontrarse en el periodo escolar actual')
	cb_reservar.enabled=false
else	
	uf_carga_reservados()
	cb_reservar.enabled=true
end if

dw_csal_salon_activo.SetReDraw(true) 
dw_csal_salones_hora_permanentes.SetReDraw(true)
dw_csal_salones_fecha_temporales_dia.SetReDraw(true)
dw_csal_salones_reservados_lapso.SetReDraw(true)

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

public subroutine uf_cambia_dia ();date ld_hoy, ld_fecha
integer li_i, li_numero

ld_hoy=today()

for li_i=1 to 7
				
	ld_fecha=RelativeDate(ld_hoy,li_i -1)
	li_numero=DayNumber(ld_fecha) -1
	
	if li_numero=ii_cve_dia then 
	
		em_fecha.text=string(ld_fecha)
		idt_fecha=ld_fecha
					
  	end if
				
next
end subroutine

public subroutine uf_limpia ();st_total.text=''
dw_csal_salones_reservados.Reset()
cb_reservar.enabled=false
end subroutine

on w_csal_prestamo_salon_dia.create
this.st_total=create st_total
this.cb_buscar=create cb_buscar
this.st_dia=create st_dia
this.st_1=create st_1
this.em_hora_final=create em_hora_final
this.em_hora_inicio=create em_hora_inicio
this.em_fecha=create em_fecha
this.st_mensaje=create st_mensaje
this.dw_csal_salones_reservados_lapso=create dw_csal_salones_reservados_lapso
this.dw_csal_salon_activo=create dw_csal_salon_activo
this.dw_csal_salones_reservados=create dw_csal_salones_reservados
this.cb_reservar=create cb_reservar
this.dw_csal_salones_fecha_temporales_dia=create dw_csal_salones_fecha_temporales_dia
this.dw_csal_salones_hora_permanentes=create dw_csal_salones_hora_permanentes
this.Control[]={this.st_total,&
this.cb_buscar,&
this.st_dia,&
this.st_1,&
this.em_hora_final,&
this.em_hora_inicio,&
this.em_fecha,&
this.st_mensaje,&
this.dw_csal_salones_reservados_lapso,&
this.dw_csal_salon_activo,&
this.dw_csal_salones_reservados,&
this.cb_reservar,&
this.dw_csal_salones_fecha_temporales_dia,&
this.dw_csal_salones_hora_permanentes}
end on

on w_csal_prestamo_salon_dia.destroy
destroy(this.st_total)
destroy(this.cb_buscar)
destroy(this.st_dia)
destroy(this.st_1)
destroy(this.em_hora_final)
destroy(this.em_hora_inicio)
destroy(this.em_fecha)
destroy(this.st_mensaje)
destroy(this.dw_csal_salones_reservados_lapso)
destroy(this.dw_csal_salon_activo)
destroy(this.dw_csal_salones_reservados)
destroy(this.cb_reservar)
destroy(this.dw_csal_salones_fecha_temporales_dia)
destroy(this.dw_csal_salones_hora_permanentes)
end on

event open;istr_reservacion =message.powerobjectparm

em_fecha.text=string(istr_reservacion.fecha_inicio)
em_hora_inicio.text= string(istr_reservacion.hora_inicio)
em_hora_final.text= string(istr_reservacion.hora_final)
idt_fecha = istr_reservacion.fecha_inicio

ii_cve_dia = istr_reservacion.cve_dia
ii_hora_inicio = istr_reservacion.hora_inicio
ii_hora_final = istr_reservacion.hora_final
ii_anio = istr_reservacion.anio
ii_periodo = istr_reservacion.periodo

st_dia.text = uf_nombre_dia(ii_cve_dia)

f_select_anio_periodo_actual_fechas(ii_periodo_actual,ii_anio_actual,today(), idt_fecha_ini_actual, idt_fecha_fin_actual)

post uf_actualiza()


end event

type st_total from statictext within w_csal_prestamo_salon_dia
integer x = 4070
integer y = 93
integer width = 560
integer height = 109
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "0"
boolean focusrectangle = false
end type

type cb_buscar from commandbutton within w_csal_prestamo_salon_dia
integer x = 1865
integer y = 80
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

event clicked;idt_fecha = date(em_fecha.text)
ii_cve_dia = DayNumber(idt_fecha)-1
st_dia.text = uf_nombre_dia(ii_cve_dia)

ii_hora_inicio = integer(em_hora_inicio.text)
ii_hora_final = integer(em_hora_final.text)

uf_actualiza()
end event

type st_dia from statictext within w_csal_prestamo_salon_dia
integer x = 48
integer y = 80
integer width = 560
integer height = 109
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Día"
boolean focusrectangle = false
end type

type st_1 from statictext within w_csal_prestamo_salon_dia
integer x = 1393
integer y = 109
integer width = 135
integer height = 61
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "-"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_hora_final from editmask within w_csal_prestamo_salon_dia
integer x = 1543
integer y = 80
integer width = 150
integer height = 109
integer taborder = 150
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh"
string minmax = "0~~23"
end type

event modified;uf_limpia()
end event

type em_hora_inicio from editmask within w_csal_prestamo_salon_dia
integer x = 1232
integer y = 80
integer width = 150
integer height = 109
integer taborder = 150
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh"
string minmax = "0~~23"
end type

event modified;uf_limpia()
end event

type em_fecha from editmask within w_csal_prestamo_salon_dia
integer x = 655
integer y = 80
integer width = 494
integer height = 109
integer taborder = 180
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

event modified;uf_limpia()
end event

type st_mensaje from statictext within w_csal_prestamo_salon_dia
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

type dw_csal_salones_reservados_lapso from datawindow within w_csal_prestamo_salon_dia
boolean visible = false
integer x = 4718
integer y = 1504
integer width = 998
integer height = 826
integer taborder = 150
string title = "none"
string dataobject = "d_csal_salones_reservados_lapso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type dw_csal_salon_activo from datawindow within w_csal_prestamo_salon_dia
boolean visible = false
integer x = 5171
integer y = 64
integer width = 132
integer height = 90
integer taborder = 170
string title = "none"
string dataobject = "d_csal_salon_activo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_escolar)
end event

type dw_csal_salones_reservados from datawindow within w_csal_prestamo_salon_dia
integer x = 37
integer y = 275
integer width = 6835
integer height = 2272
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_csal_salones_semana"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;integer li_row, li_foco, li_cve_dia, li_hora_inicio, li_reservados
string ls_return, ls_salon

str_csal_salones_reservacion lstr_reservacion

if row>0 then
	
	li_row=row
	 
	if isvalid(w_csal_salon_permanente) then close(w_csal_salon_permanente) 
	if isvalid(w_csal_salon_temporal) then close(w_csal_salon_temporal) 
	
	lstr_reservacion.num_asignacion=this.GetItemNumber(li_row,"num_asignacion") 
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
	lstr_reservacion.estatus_reservacion=this.GetItemNumber(li_row,"estatus") 
	lstr_reservacion.horario=this.GetItemString(li_row,"horario")
	lstr_reservacion.lapso_completo=this.GetItemNumber(li_row,"lapso_completo") 
	lstr_reservacion.cve_dia=this.GetItemNumber(li_row,"cve_dia") 
	lstr_reservacion.cve_materia=this.GetItemNumber(li_row,"cve_materia") 
	lstr_reservacion.cve_profesor=this.GetItemNumber(li_row,"cve_profesor") 
	lstr_reservacion.periodo=ii_periodo
	lstr_reservacion.anio=ii_anio
	
	if (this.GetItemString(li_row,"nom_dia"))='TODOS' then lstr_reservacion.lapso='TODOS LOS DIAS DEL' else lstr_reservacion.lapso=this.GetItemString(li_row,"nom_dia")
	lstr_reservacion.lapso=lstr_reservacion.lapso+' '+this.GetItemString(li_row,"lapso")
	
	if lstr_reservacion.estatus_reservacion = 1 then
		openwithparm(w_csal_salon_permanente, lstr_reservacion)
	elseif lstr_reservacion.estatus_reservacion = 2 then
		openwithparm(w_csal_salon_temporal, lstr_reservacion)
	end if

	
end if

end event

event clicked;	if dwo.Type = "text" then
		
		choose case string(dwo.Name)
	
			case 'cve_salon_t'
				is_sort_reservados="#1A #17A #5A"
				this.Modify("cve_salon_t.background.color='11527407'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("asimiladas_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")
				this.Modify("cve_materia_t.background.color='15793151'")
				this.Modify("cve_profesor_t.background.color='15793151'")

			case 'nom_materia_t'
				is_sort_reservados="#15A #12A #1A #17A #5A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='11527407'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("asimiladas_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")
				this.Modify("cve_materia_t.background.color='15793151'")
				this.Modify("cve_profesor_t.background.color='15793151'")
				
			case 'cve_grupo_t'	
				is_sort_reservados="#12A #15A #1A #17A #5A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='11527407'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("asimiladas_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")
				this.Modify("cve_materia_t.background.color='15793151'")
				this.Modify("cve_profesor_t.background.color='15793151'")
				
			case 'nom_profesor_t'		
				is_sort_reservados="#14A #15A #12A #1A #17A #5A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='11527407'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("asimiladas_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")
				this.Modify("cve_materia_t.background.color='15793151'")
				this.Modify("cve_profesor_t.background.color='15793151'")

			case 'tipo_reservacion_t'		
				is_sort_reservados="#13A #17A #5A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='11527407'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("asimiladas_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")
				this.Modify("cve_materia_t.background.color='15793151'")
				this.Modify("cve_profesor_t.background.color='15793151'")
				
			case 'nom_dia_t'		
				is_sort_reservados="#4A #5A #1A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='11527407'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("asimiladas_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")
				this.Modify("cve_materia_t.background.color='15793151'")
				this.Modify("cve_profesor_t.background.color='15793151'")
				
			case 'horario_t'		
				is_sort_reservados="#5A #6A #17A #1A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='11527407'")
				this.Modify("lapso_t.background.color='15793151'")	
				this.Modify("asimiladas_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")
				this.Modify("cve_materia_t.background.color='15793151'")
				this.Modify("cve_profesor_t.background.color='15793151'")
				
			case 'lapso_t'		
				is_sort_reservados="#18A #17A #5A #1A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='11527407'")
				this.Modify("asimiladas_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")
				this.Modify("cve_materia_t.background.color='15793151'")
				this.Modify("cve_profesor_t.background.color='15793151'")
				
			case 'asimiladas_t'		
				is_sort_reservados="#21A #17A #5A #1A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("asimiladas_t.background.color='11527407''")			
				this.Modify("inscritos_t.background.color='15793151'")
				this.Modify("cve_materia_t.background.color='15793151'")
				this.Modify("cve_profesor_t.background.color='15793151'")

			case 'inscritos_t'		
				is_sort_reservados="#22A #17A #5A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("asimiladas_t.background.color='15793151''")			
				this.Modify("inscritos_t.background.color='11527407'")
				this.Modify("cve_materia_t.background.color='15793151'")
				this.Modify("cve_profesor_t.background.color='15793151'")				

			case 'cve_materia_t'
				is_sort_reservados="#2A #12A #1A #17A #5A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("asimiladas_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")
				this.Modify("cve_materia_t.background.color='11527407'")
				this.Modify("cve_profesor_t.background.color='15793151'")				
				
			case 'cve_profesor_t'		
				is_sort_reservados="#3A #15A #12A #1A #17A #5A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("asimiladas_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")
				this.Modify("cve_materia_t.background.color='15793151'")
				this.Modify("cve_profesor_t.background.color='11527407'")
				
		end choose

		this.SetSort(is_sort_reservados) 
		this.Sort() 		
		
	end if
	
end event

type cb_reservar from commandbutton within w_csal_prestamo_salon_dia
integer x = 3306
integer y = 77
integer width = 399
integer height = 125
integer taborder = 220
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Reservar"
end type

event clicked;integer li_row, li_foco, li_cve_dia, li_hora_inicio, li_reservados
string ls_return, ls_salon

str_csal_salones_reservacion lstr_reservacion

if isvalid(w_csal_salon_permanente) then close(w_csal_salon_permanente) 

lstr_reservacion.num_asignacion=0
lstr_reservacion.salon='' 
lstr_reservacion.materia=''
lstr_reservacion.profesor=''
lstr_reservacion.dia=st_dia.text
lstr_reservacion.hora_inicio=ii_hora_inicio
lstr_reservacion.hora_final=ii_hora_final
lstr_reservacion.fecha_inicio=idt_fecha
lstr_reservacion.fecha_final=idt_fecha
lstr_reservacion.fecha_movimiento=today()
lstr_reservacion.grupo=''
lstr_reservacion.tipo_reservacion='TEMPORAL'
lstr_reservacion.observaciones=''
lstr_reservacion.estatus_reservacion=2
lstr_reservacion.horario=''
lstr_reservacion.lapso_completo=0
lstr_reservacion.cve_dia=ii_cve_dia
lstr_reservacion.cve_materia=0
lstr_reservacion.cve_profesor=0
lstr_reservacion.periodo=ii_periodo
lstr_reservacion.anio=ii_anio
lstr_reservacion.lapso=''

openwithparm(w_csal_salon_temporal, lstr_reservacion)


end event

type dw_csal_salones_fecha_temporales_dia from datawindow within w_csal_prestamo_salon_dia
boolean visible = false
integer x = 1840
integer y = 195
integer width = 998
integer height = 349
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_csal_salones_temporales_fecha_dia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type dw_csal_salones_hora_permanentes from datawindow within w_csal_prestamo_salon_dia
boolean visible = false
integer x = 1704
integer y = 1498
integer width = 998
integer height = 288
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_csal_salones_permanentes_hora"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_escolar)
end event

