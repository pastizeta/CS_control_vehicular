$PBExportHeader$w_csal_prestamo_salon.srw
forward
global type w_csal_prestamo_salon from window
end type
type cb_refrescar from commandbutton within w_csal_prestamo_salon
end type
type dw_csal_semana_exportar from datawindow within w_csal_prestamo_salon
end type
type dw_csal_salon_activo from datawindow within w_csal_prestamo_salon
end type
type cb_izquierda from commandbutton within w_csal_prestamo_salon
end type
type cb_derecha from commandbutton within w_csal_prestamo_salon
end type
type st_semana from statictext within w_csal_prestamo_salon
end type
type dw_csal_salones_semana from datawindow within w_csal_prestamo_salon
end type
type dw_csal_salones_temporales_dia from datawindow within w_csal_prestamo_salon
end type
type dw_csal_salones_permanentes from datawindow within w_csal_prestamo_salon
end type
type dw_csal_semana from datawindow within w_csal_prestamo_salon
end type
end forward

global type w_csal_prestamo_salon from window
integer width = 4151
integer height = 2771
boolean titlebar = true
string title = "Calendario para reservación de salones"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_refrescar cb_refrescar
dw_csal_semana_exportar dw_csal_semana_exportar
dw_csal_salon_activo dw_csal_salon_activo
cb_izquierda cb_izquierda
cb_derecha cb_derecha
st_semana st_semana
dw_csal_salones_semana dw_csal_salones_semana
dw_csal_salones_temporales_dia dw_csal_salones_temporales_dia
dw_csal_salones_permanentes dw_csal_salones_permanentes
dw_csal_semana dw_csal_semana
end type
global w_csal_prestamo_salon w_csal_prestamo_salon

type variables
date id_diasemana[7]

integer ii_periodo, ii_anio
end variables

forward prototypes
public subroutine uf_carga_semana (date pd_fecha_inicio)
public subroutine uf_exportar ()
end prototypes

public subroutine uf_carga_semana (date pd_fecha_inicio);integer li_hoy_dia, li_i, li_j, li_dias, li_cambios=0, li_salones=0, li_activos, li_horas
integer li_columna, li_hora_inicio, li_hora_final, li_duracion, li_renglon, li_hora
integer li_jornada_inicio, li_jornada_fin, li_hora_jornada, li_cuenta_salon
integer li_valor, li_estatus, li_por, li_periodo_hoy, li_anio_hoy, li_periodo_fecha, li_anio_fecha
integer li_periodo_inicio, li_anio_inicio, li_periodo_final, li_anio_final, ii_verifica=0
string ls_salon, ls_salones='', ls_cero_inicio, ls_cero_final
date ld_hoy_fecha

ld_hoy_fecha=pd_fecha_inicio
li_hoy_dia=DayNumber (ld_hoy_fecha)
id_diasemana[li_hoy_dia]=ld_hoy_fecha

dw_csal_salones_permanentes.Reset()
dw_csal_salones_temporales_dia.Reset()
dw_csal_salones_semana.Reset()
dw_csal_semana.Reset()
dw_csal_salon_activo.Reset()


this.title='Cargando...'
SetPointer (HourGlass!)


//Insertar Fechas
for li_i=1 to 7
	li_dias=li_i - li_hoy_dia
	id_diasemana[li_i]=RelativeDate(ld_hoy_fecha, li_dias)
	
	choose case li_i
	case 1 
		dw_csal_semana.object.fecha_domingo.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 2 
		dw_csal_semana.object.fecha_lunes.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 3 
		dw_csal_semana.object.fecha_martes.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 4 
		dw_csal_semana.object.fecha_miercoles.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 5 
		dw_csal_semana.object.fecha_jueves.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 6 
		dw_csal_semana.object.fecha_viernes.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 7 
		dw_csal_semana.object.fecha_sabado.text=f_convierte_fecha_texto(id_diasemana[li_i])
		
	end choose

	
next

f_select_anio_periodo_actual(li_periodo_hoy,li_anio_hoy,today())
f_select_anio_periodo_actual(li_periodo_inicio,li_anio_inicio, id_diasemana[1])
f_select_anio_periodo_actual(li_periodo_final,li_anio_final, id_diasemana[7])

if li_periodo_inicio=li_periodo_final and li_anio_inicio=li_anio_final then
	st_semana.text="Semana del "+f_convierte_fecha_texto(id_diasemana[1])+" al "+f_convierte_fecha_texto(id_diasemana[7])+' de '+string(year(id_diasemana[1]))
	ii_verifica=0
else
	st_semana.text="Semana del "+f_convierte_fecha_texto(id_diasemana[1])+" de "+string(year(id_diasemana[1])) +" al "+f_convierte_fecha_texto(id_diasemana[7])+' de '+string(year(id_diasemana[7]))
//	ii_verifica=1
end if


//Insertar Horas

li_jornada_inicio=7 
li_jornada_fin=22

li_hora_jornada=li_jornada_inicio

for li_i=1 to (li_jornada_fin - li_jornada_inicio)
	dw_csal_semana.insertrow(0)
	if li_hora_jornada<10 then ls_cero_inicio='0' else ls_cero_inicio=''
	if li_hora_jornada+1<10 then ls_cero_final='0' else ls_cero_final=''
	dw_csal_semana.SetItem(li_i, "horario",ls_cero_inicio+string(li_hora_jornada)+":00 - "+ls_cero_final+string(li_hora_jornada+1)+":00")	
	li_hora_jornada=li_hora_jornada+1
next
dw_csal_semana.insertrow(0)
dw_csal_semana.DeleteRow(dw_csal_semana.RowCount())

//Obtener Salones asignados normalmente

dw_csal_salones_permanentes.retrieve(ii_periodo,ii_anio)
li_salones=dw_csal_salones_permanentes.rowcount()

for li_i=1 to li_salones
	dw_csal_salones_semana.insertrow(0)
	dw_csal_salones_semana.SetItem(li_i, "cve_salon", dw_csal_salones_permanentes.GetItemString(li_i,"cve_salon"))	
	dw_csal_salones_semana.SetItem(li_i, "cve_materia", dw_csal_salones_permanentes.GetItemNumber(li_i,"cve_materia"))	
	dw_csal_salones_semana.SetItem(li_i, "cve_profesor", dw_csal_salones_permanentes.GetItemNumber(li_i,"cve_profesor"))	
	dw_csal_salones_semana.SetItem(li_i, "cve_dia", dw_csal_salones_permanentes.GetItemNumber(li_i,"cve_dia"))	
	dw_csal_salones_semana.SetItem(li_i, "hora_inicio", dw_csal_salones_permanentes.GetItemNumber(li_i,"hora_inicio"))	
	dw_csal_salones_semana.SetItem(li_i, "hora_final", dw_csal_salones_permanentes.GetItemNumber(li_i,"hora_final"))	
	dw_csal_salones_semana.SetItem(li_i, "cve_grupo", dw_csal_salones_permanentes.GetItemString(li_i,"cve_grupo"))	
	dw_csal_salones_semana.SetItem(li_i, "estatus", 1)	
	
next

//Obtener Salones asignados por un cambio temporal

for li_i=1 to 7

	dw_csal_salones_temporales_dia.retrieve(ii_periodo, ii_anio,li_i -1,id_diasemana[li_i])
	li_cambios=dw_csal_salones_temporales_dia.rowcount()
//	messagebox(string(id_diasemana[li_i]),string(li_cambios))

	for li_j=1 to li_cambios
		
		li_salones=li_salones+1	
		dw_csal_salones_semana.insertrow(0)
		dw_csal_salones_semana.SetItem(li_salones, "cve_salon", dw_csal_salones_temporales_dia.GetItemString(li_j,"cve_salon"))	
		dw_csal_salones_semana.SetItem(li_salones, "cve_materia", dw_csal_salones_temporales_dia.GetItemNumber(li_j,"cve_materia"))	
		dw_csal_salones_semana.SetItem(li_salones, "cve_profesor", dw_csal_salones_temporales_dia.GetItemNumber(li_j,"cve_profesor"))	
		dw_csal_salones_semana.SetItem(li_salones, "cve_dia", dw_csal_salones_temporales_dia.GetItemNumber(li_j,"cve_dia"))	
		dw_csal_salones_semana.SetItem(li_salones, "hora_inicio", dw_csal_salones_temporales_dia.GetItemNumber(li_j,"hora_inicio"))	
		dw_csal_salones_semana.SetItem(li_salones, "hora_final", dw_csal_salones_temporales_dia.GetItemNumber(li_j,"hora_final"))	
		dw_csal_salones_semana.SetItem(li_salones, "fecha_inicio", dw_csal_salones_temporales_dia.GetItemDateTime(li_j,"fecha_inicio"))	
		dw_csal_salones_semana.SetItem(li_salones, "fecha_final", dw_csal_salones_temporales_dia.GetItemDateTime(li_j,"fecha_final"))	
		dw_csal_salones_semana.SetItem(li_salones, "cve_grupo", dw_csal_salones_temporales_dia.GetItemString(li_j,"cve_grupo"))	
		dw_csal_salones_semana.SetItem(li_salones, "estatus", dw_csal_salones_temporales_dia.GetItemNumber(li_j,"estatus"))	

	next
	
next

dw_csal_salones_semana.SetSort("#4A, #5A, #1A")
dw_csal_salones_semana.Sort()


//Acomodar salones en el calendario

li_salones=dw_csal_salones_semana.rowcount()

for li_i=1 to li_salones

	ls_salon= dw_csal_salones_semana.GetItemString(li_i,"cve_salon")	
	li_columna=dw_csal_salones_semana.GetItemNumber(li_i,"cve_dia")+1
	li_hora_inicio=dw_csal_salones_semana.GetItemNumber(li_i,"hora_inicio")	
	li_hora_final=dw_csal_salones_semana.GetItemNumber(li_i,"hora_final")
	li_duracion=li_hora_final - li_hora_inicio
	li_estatus=dw_csal_salones_semana.GetItemNumber(li_i,"estatus")

	li_hora=li_hora_inicio
	li_cuenta_salon=0

	if ii_verifica=1 then f_select_anio_periodo_actual(li_periodo_fecha,li_anio_fecha, id_diasemana[li_columna])
	
	if (li_anio_fecha=li_anio_hoy and li_periodo_fecha=li_periodo_hoy and li_anio_hoy>0) or ii_verifica=0 then
	
		for li_j=1 to li_duracion
			
			if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
			if li_hora+1<10 then ls_cero_final='0' else ls_cero_final=''
			li_renglon=dw_csal_semana.Find("horario='"+ls_cero_inicio+string(li_hora)+":00 - "+ls_cero_final+string(li_hora+1)+":00'",1,dw_csal_semana.rowcount())
			ls_salones=dw_csal_semana.GetItemString(li_renglon,li_columna)
			if isNull(ls_salones) then ls_salones="1 salón" else ls_salones=string(integer(left(ls_salones,pos(ls_salones,"sal")-2))+1)+" salones"
			dw_csal_semana.SetItem(li_renglon, li_columna,ls_salones)	
			li_hora=li_hora+1
		
			if li_estatus>1 then dw_csal_semana.SetItem(li_renglon,li_columna+15,1)	
			
		next
		
	end if
	
next


//Pintar cuadritos

li_horas=dw_csal_semana.rowcount()

dw_csal_salon_activo.retrieve()
li_activos= dw_csal_salon_activo.rowcount()

	for li_i=1 to li_horas
		
		for li_j=1 to 7

			if isnull (dw_csal_semana.GetItemString(li_i,li_j)) then
				li_por=0
			else
				li_valor=integer(left(dw_csal_semana.GetItemString(li_i,li_j),pos(dw_csal_semana.GetItemString(li_i,li_j),'s')-2))
				li_por=(li_valor*100)/li_activos
				if li_por= 0 and li_valor>0 then li_por=1
			end if
		
		dw_csal_semana.SetItem(li_i, li_j+8,li_por)	
		
	next

next


this.title='Calendario para reservación de salones'
SetPointer (Arrow!)
end subroutine

public subroutine uf_exportar ();integer li_row, li_i, li_j=-1, li_salones, li_estatus, li_hora, li_salon
integer li_columna, li_hora_inicio, li_hora_final, li_duracion, li_renglon, li_ii, li_col
integer li_col_tempo[], li_col_perma[]
string ls_cero_inicio, ls_cero_final

li_row=dw_csal_semana.rowcount()
dw_csal_semana_exportar.Reset()
dw_csal_semana_exportar.insertrow(0)

//Columnas Temporales
li_j=0
for li_i=1 to 7
	li_j=li_j+3
	li_col_tempo[li_i]=li_j
next

//Columnas Permanentes
li_j=-1
for li_i=1 to 7
	li_j=li_j+3
	li_col_perma[li_i]=li_j
next

//Fechas
li_j=-1
for li_i=1 to 7
	li_j=li_j+3
	dw_csal_semana_exportar.SetItem(1,li_j,string(id_diasemana[li_i]))
	dw_csal_semana_exportar.SetItem(1,li_j+1,string(id_diasemana[li_i]))
	dw_csal_semana_exportar.SetItem(1,li_j+2 ,string(id_diasemana[li_i]))
next

//Horario
for li_i=1 to li_row
	dw_csal_semana_exportar.insertrow(0)
	dw_csal_semana_exportar.SetItem(li_i+1,1,dw_csal_semana.GetItemString(li_i,"horario"))
	
	for li_j=2 to 22
		dw_csal_semana_exportar.SetItem(li_i+1,li_j,'0')
	next
next


//Llenar valores

li_salones=dw_csal_salones_semana.rowcount()

li_ii=-2
for li_i=1 to li_salones

	li_hora_inicio=dw_csal_salones_semana.GetItemNumber(li_i,"hora_inicio")	
	li_hora_final=dw_csal_salones_semana.GetItemNumber(li_i,"hora_final")
	li_duracion=li_hora_final - li_hora_inicio
	li_estatus=dw_csal_salones_semana.GetItemNumber(li_i,"estatus")
	
	if li_estatus=1 then
		li_columna=li_col_perma[dw_csal_salones_semana.GetItemNumber(li_i,"cve_dia")+1]
	else
		li_columna=li_col_tempo[dw_csal_salones_semana.GetItemNumber(li_i,"cve_dia")+1]
	end if
	

	li_hora=li_hora_inicio
	
	for li_j=1 to li_duracion
		
		if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
		if li_hora+1<10 then ls_cero_final='0' else ls_cero_final=''
		li_renglon=dw_csal_semana_exportar.Find("horas='"+ls_cero_inicio+string(li_hora)+":00 - "+ls_cero_final+string(li_hora+1)+":00'",2,dw_csal_semana_exportar.rowcount())

		li_salon=integer(dw_csal_semana_exportar.GetItemString(li_renglon,li_columna))
		li_salon=li_salon+1
		dw_csal_semana_exportar.SetItem(li_renglon, li_columna,string(li_salon))	
	
		if li_estatus=1 then li_col=2 else li_col=1
		li_salon=integer(dw_csal_semana_exportar.GetItemString(li_renglon,li_columna+li_col))
		li_salon=li_salon+1
		dw_csal_semana_exportar.SetItem(li_renglon, li_columna+li_col,string(li_salon))
		
		li_hora=li_hora+1
		
	next
	
next


f_exportar_reporte(dw_csal_semana_exportar,1,"Calendario de Reservaciones Semanal")
end subroutine

on w_csal_prestamo_salon.create
this.cb_refrescar=create cb_refrescar
this.dw_csal_semana_exportar=create dw_csal_semana_exportar
this.dw_csal_salon_activo=create dw_csal_salon_activo
this.cb_izquierda=create cb_izquierda
this.cb_derecha=create cb_derecha
this.st_semana=create st_semana
this.dw_csal_salones_semana=create dw_csal_salones_semana
this.dw_csal_salones_temporales_dia=create dw_csal_salones_temporales_dia
this.dw_csal_salones_permanentes=create dw_csal_salones_permanentes
this.dw_csal_semana=create dw_csal_semana
this.Control[]={this.cb_refrescar,&
this.dw_csal_semana_exportar,&
this.dw_csal_salon_activo,&
this.cb_izquierda,&
this.cb_derecha,&
this.st_semana,&
this.dw_csal_salones_semana,&
this.dw_csal_salones_temporales_dia,&
this.dw_csal_salones_permanentes,&
this.dw_csal_semana}
end on

on w_csal_prestamo_salon.destroy
destroy(this.cb_refrescar)
destroy(this.dw_csal_semana_exportar)
destroy(this.dw_csal_salon_activo)
destroy(this.cb_izquierda)
destroy(this.cb_derecha)
destroy(this.st_semana)
destroy(this.dw_csal_salones_semana)
destroy(this.dw_csal_salones_temporales_dia)
destroy(this.dw_csal_salones_permanentes)
destroy(this.dw_csal_semana)
end on

event open;post uf_carga_semana(today())
//post uf_carga_semana(date('2016/01/01'))

dw_csal_salones_permanentes.setTransObject(gtr_escolar)
dw_csal_salon_activo.setTransObject(gtr_escolar)


f_select_anio_periodo_actual(ii_periodo,ii_anio,today())

end event

type cb_refrescar from commandbutton within w_csal_prestamo_salon
integer x = 3646
integer y = 2518
integer width = 402
integer height = 115
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Refrescar"
end type

event clicked;uf_carga_semana(id_diasemana[1])
end event

type dw_csal_semana_exportar from datawindow within w_csal_prestamo_salon
boolean visible = false
integer x = 3394
integer y = 826
integer width = 519
integer height = 851
integer taborder = 30
string title = "none"
string dataobject = "d_csal_semana_exportar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_csal_salon_activo from datawindow within w_csal_prestamo_salon
boolean visible = false
integer x = 3807
integer y = 83
integer width = 183
integer height = 90
integer taborder = 20
string title = "none"
string dataobject = "d_csal_salon_activo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_izquierda from commandbutton within w_csal_prestamo_salon
integer x = 62
integer y = 54
integer width = 256
integer height = 106
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "<<"
end type

event clicked;date  ld_inicio_nuevo, ld_fin_nuevo


ld_fin_nuevo=RelativeDate(id_diasemana[1],-1)

if ld_fin_nuevo< today() then
	messagebox("Aviso", "No puede reservar en fecha anterior a la actual")
else
	
	ld_inicio_nuevo=RelativeDate(ld_fin_nuevo,-6)
	f_select_anio_periodo_actual(ii_periodo,ii_anio,ld_inicio_nuevo)
	post uf_carga_semana(ld_inicio_nuevo)
	
end if


end event

type cb_derecha from commandbutton within w_csal_prestamo_salon
integer x = 3749
integer y = 54
integer width = 256
integer height = 106
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = ">>"
end type

event clicked;date ld_fecha_inicio

ld_fecha_inicio=RelativeDate(id_diasemana[7],1)

f_select_anio_periodo_actual(ii_periodo,ii_anio,ld_fecha_inicio)
uf_carga_semana(ld_fecha_inicio)
end event

type st_semana from statictext within w_csal_prestamo_salon
integer x = 388
integer y = 45
integer width = 3310
integer height = 102
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_csal_salones_semana from datawindow within w_csal_prestamo_salon
boolean visible = false
integer x = 1415
integer y = 2467
integer width = 168
integer height = 93
integer taborder = 30
string title = "none"
string dataobject = "d_csal_salones_semana"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_csal_salones_temporales_dia from datawindow within w_csal_prestamo_salon
boolean visible = false
integer x = 3723
integer y = 570
integer width = 380
integer height = 192
integer taborder = 20
string title = "none"
string dataobject = "d_csal_salones_temporales_dia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type dw_csal_salones_permanentes from datawindow within w_csal_prestamo_salon
boolean visible = false
integer x = 3997
integer y = 1066
integer width = 1375
integer height = 320
integer taborder = 20
string title = "none"
string dataobject = "d_csal_salones_permanentes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_csal_semana from datawindow within w_csal_prestamo_salon
integer x = 62
integer y = 170
integer width = 3979
integer height = 2291
integer taborder = 10
string title = "none"
string dataobject = "d_csal_semana"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;integer li_dia, li_hora
string ls_salones, ls_horario, ls_dia
str_csal_salones_reservacion lstr_reservacion

if dwo.Type = "column" then
	
	choose case string(dwo.Name)

		case 'domingo'
			li_dia=0
			ls_dia='Domingo'
		case 'lunes'
			li_dia=1
			ls_dia='Lunes'
		case 'martes'
			li_dia=2	
			ls_dia='Martes'
		case 'miercoles'
			li_dia=3
			ls_dia='Miércoles'
		case 'jueves'
			li_dia=4
			ls_dia='Jueves'
		case 'viernes'
			li_dia=5
			ls_dia='Viernes'
		case 'sabado'
			li_dia=6
			ls_dia='Sábado'
			
		case else
			
		goto salir
		
	end choose
	
	ls_salones=this.GetItemString(row,li_dia+1)
	ls_horario=this.GetItemString(row,"horario")

	lstr_reservacion.hora_inicio=integer(left(ls_horario,pos(ls_horario,":")-1))
	lstr_reservacion.hora_final=lstr_reservacion.hora_inicio+1
	lstr_reservacion.cve_dia=li_dia
	lstr_reservacion.dia=ls_dia
	lstr_reservacion.fecha_inicio=id_diasemana[li_dia+1]
	lstr_reservacion.fecha_final=id_diasemana[li_dia+1]
	lstr_reservacion.anio=ii_anio
	lstr_reservacion.periodo=ii_periodo

	opensheetwithparm(w_csal_prestamo_salon_dia,lstr_reservacion,w_ppal,0,Original!)

end if

salir:


end event

event clicked;if dwo.Name='p_salvar' then uf_exportar() 


end event

