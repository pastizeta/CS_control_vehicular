$PBExportHeader$w_csal_salon_permanente_sol.srw
forward
global type w_csal_salon_permanente_sol from window
end type
type cb_rechazar from commandbutton within w_csal_salon_permanente_sol
end type
type dw_csal_salon_ficha from datawindow within w_csal_salon_permanente_sol
end type
type dw_csal_salones_reservados_lapso from datawindow within w_csal_salon_permanente_sol
end type
type dw_csal_salones_reservados from datawindow within w_csal_salon_permanente_sol
end type
type dw_csal_salones_hora_permanentes from datawindow within w_csal_salon_permanente_sol
end type
type dw_csal_salones_fecha_temporales_dia from datawindow within w_csal_salon_permanente_sol
end type
type cb_aprobar from commandbutton within w_csal_salon_permanente_sol
end type
type st_salon from statictext within w_csal_salon_permanente_sol
end type
type dw_csal_salon_activo from datawindow within w_csal_salon_permanente_sol
end type
type dw_csal_salones_disponibles from datawindow within w_csal_salon_permanente_sol
end type
type st_libres from statictext within w_csal_salon_permanente_sol
end type
end forward

global type w_csal_salon_permanente_sol from window
integer width = 4348
integer height = 2384
boolean titlebar = true
string title = "Cambio permanente de salón"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_rechazar cb_rechazar
dw_csal_salon_ficha dw_csal_salon_ficha
dw_csal_salones_reservados_lapso dw_csal_salones_reservados_lapso
dw_csal_salones_reservados dw_csal_salones_reservados
dw_csal_salones_hora_permanentes dw_csal_salones_hora_permanentes
dw_csal_salones_fecha_temporales_dia dw_csal_salones_fecha_temporales_dia
cb_aprobar cb_aprobar
st_salon st_salon
dw_csal_salon_activo dw_csal_salon_activo
dw_csal_salones_disponibles dw_csal_salones_disponibles
st_libres st_libres
end type
global w_csal_salon_permanente_sol w_csal_salon_permanente_sol

type variables
str_csal_salones_reservacion istr_reservacion
string  is_sort_disponibles="#1A"

end variables

forward prototypes
public subroutine uf_carga_libres ()
public subroutine uf_carga_reservados ()
public subroutine uf_cambia_salon ()
public function integer uf_verifica_disponble (string p_salon)
public subroutine uf_actualiza ()
public subroutine uf_aprobar (long p_solicitud, long p_asignacion)
public subroutine uf_rechazar (long p_solicitud)
end prototypes

public subroutine uf_carga_libres ();integer li_activos, li_i, li_j=0, li_permanente, li_estatus, li_row, li_num_asignacion, li_existe
integer li_temp_dia, li_perma_dia,  li_cupo_real, li_reservados
string ls_salon, ls_observaciones, ls_clase_aula, is_salon
integer li_periodo_inicio, li_periodo_final, li_anio_inicio, li_anio_final
integer li_periodo_hoy, li_anio_hoy

st_salon.text='Salón: ----'
SetPointer(HourGlass!)

is_salon = istr_reservacion.salon

dw_csal_salones_disponibles.reset()
dw_csal_salones_disponibles.SetReDraw(false)	

dw_csal_salon_activo.SetFilter('')
dw_csal_salon_activo.Filter()
dw_csal_salon_activo.retrieve()

dw_csal_salon_activo.SetFilter("clase_aula = 'SALON'")
dw_csal_salon_activo.Filter()

li_activos=dw_csal_salon_activo.rowcount()
li_reservados=dw_csal_salones_reservados.rowcount()

for li_i=1 to li_activos
	
	ls_salon=dw_csal_salon_activo.GetItemString(li_i,"cve_salon")
	li_cupo_real=dw_csal_salon_activo.GetItemNumber(li_i,"cupo_real")
	ls_clase_aula=dw_csal_salon_activo.GetItemString(li_i,"clase_aula")
	li_estatus=0
	ls_observaciones=''		
		
	//Verificar si hay temporales ese dia y hora en otra fecha
	
	if li_reservados>0 then
		li_num_asignacion=0
		if (dw_csal_salones_reservados.Find("cve_salon='"+ls_salon+"' and estatus=1",1,li_reservados))>0 then goto sigue
		if (dw_csal_salones_reservados.Find("cve_salon='"+ls_salon+"' and estatus=2",1,li_reservados))>0 then goto sigue
	end if

	li_j=li_j+1
		
	dw_csal_salones_disponibles.insertrow(0)
	dw_csal_salones_disponibles.SetItem(li_j, "cve_salon",ls_salon)	
	dw_csal_salones_disponibles.SetItem(li_j, "cupo_real",li_cupo_real)	
	dw_csal_salones_disponibles.SetItem(li_j, "estatus_salon",li_estatus)
	dw_csal_salones_disponibles.SetItem(li_j, "tipo_reservacion",f_select_nombre_estatus(li_estatus))
	dw_csal_salones_disponibles.SetItem(li_j, "observacion",ls_observaciones)
	dw_csal_salones_disponibles.SetItem(li_j, "clase_aula",ls_clase_aula)
	dw_csal_salones_disponibles.SetItem(li_j, "num_asignacion",li_num_asignacion)
	
	sigue:

next
	

dw_csal_salones_disponibles.SetSort(is_sort_disponibles)
dw_csal_salones_disponibles.Sort()

li_existe = dw_csal_salones_disponibles.Find("cve_salon='"+is_salon+"'",1,dw_csal_salones_disponibles.RowCount())

if li_existe > 0 then 
	dw_csal_salones_disponibles.ScrollToRow(li_existe)
elseif dw_csal_salones_disponibles.RowCount() = 0 then
	istr_reservacion.salon = ''
end if

st_libres.text="Salones Disponibles: "+string(dw_csal_salones_disponibles.rowcount())
SetPointer(Arrow!)

dw_csal_salones_disponibles.SetReDraw(true)	


end subroutine

public subroutine uf_carga_reservados ();integer li_i, li_control=0, li_materia, li_temp_dia, li_perma_dia, li_lapso_actual, li_total=0, li_tempo=0
integer li_j, li_lapso=0, li_dias, li_dia, li_cve_dia, li_k, li_dia_fecha, li_dias_lapso
date ld_fecha_inicio, ld_fecha_final, ld_fecha
string ls_lapso, ls_fecha, ls_titulo, ls_filtro

ls_titulo=this.title
this.title='Cargando...'
SetPointer(HourGlass!)

dw_csal_salones_reservados.reset()
dw_csal_salones_reservados.SetReDraw(false)

//Sólo ese día de la semana y hora
dw_csal_salones_fecha_temporales_dia.retrieve(istr_reservacion.periodo,istr_reservacion.anio,istr_reservacion.cve_dia,istr_reservacion.hora_inicio,istr_reservacion.hora_final,istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)
dw_csal_salones_hora_permanentes.retrieve(istr_reservacion.periodo,istr_reservacion.anio,istr_reservacion.cve_dia,istr_reservacion.hora_inicio,istr_reservacion.hora_final)

li_temp_dia=dw_csal_salones_fecha_temporales_dia.rowcount()
li_perma_dia=dw_csal_salones_hora_permanentes.rowcount()

	//Permanentes en ese día de la semana y hora
	for li_i=1 to li_perma_dia

		li_control=li_control+1
		dw_csal_salones_reservados.insertrow(0)
		dw_csal_salones_reservados.SetItem(li_control, "cve_salon", dw_csal_salones_hora_permanentes.GetItemString(li_i,"cve_salon"))	
		dw_csal_salones_reservados.SetItem(li_control, "cve_materia", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_materia"))	
		dw_csal_salones_reservados.SetItem(li_control, "cve_profesor", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_profesor"))	
		dw_csal_salones_reservados.SetItem(li_control, "cve_dia", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_dia"))	
		dw_csal_salones_reservados.SetItem(li_control, "hora_inicio", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"hora_inicio"))	
		dw_csal_salones_reservados.SetItem(li_control, "hora_final", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"hora_final"))	
		dw_csal_salones_reservados.SetItem(li_control, "cve_grupo", dw_csal_salones_hora_permanentes.GetItemString(li_i,"cve_grupo"))	
		dw_csal_salones_reservados.SetItem(li_control, "inscritos", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"grupos_inscritos"))	
		dw_csal_salones_reservados.SetItem(li_control, "estatus", 1)	
		dw_csal_salones_reservados.SetItem(li_control, "lapso_completo", 0)	

		dw_csal_salones_reservados.SetItem(li_control, "tipo_reservacion",f_select_nombre_estatus(1))	
		dw_csal_salones_reservados.SetItem(li_control, "nom_dia",f_select_nombre_dia(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_dia")))		
		dw_csal_salones_reservados.SetItem(li_control, "lapso",'PERIODO ESCOLAR')
		dw_csal_salones_reservados.SetItem(li_control, "horario",string(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"hora_final")))
		dw_csal_salones_reservados.SetItem(li_control, "nom_profesor",f_select_nombre_profesor(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_profesor")))		
		dw_csal_salones_reservados.SetItem(li_control, "nom_materia",f_select_nombre_materia(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_materia")))		
		if f_valida_tiene_asimiladas(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_materia"),dw_csal_salones_hora_permanentes.GetItemString(li_i,"cve_grupo"),istr_reservacion.periodo,istr_reservacion.anio)>0 then dw_csal_salones_reservados.SetItem(li_control, "asimiladas",'**')
		if f_valida_es_asimilada(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_materia"),dw_csal_salones_hora_permanentes.GetItemString(li_i,"cve_grupo"),istr_reservacion.periodo,istr_reservacion.anio)>0 then dw_csal_salones_reservados.SetItem(li_control, "asimiladas",'*')
	
	next		

	
	//Temporales en ese día de la semana y hora en todo el periodo
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
	
dw_csal_salones_reservados.SetReDraw(true)

li_total=dw_csal_salones_reservados.rowcount()
li_tempo=li_total - li_perma_dia
this.title=ls_titulo
SetPointer(Arrow!)
end subroutine

public subroutine uf_cambia_salon ();integer li_libre
string ls_salon

ls_salon = istr_reservacion.salon

if istr_reservacion.salon = '' then
	messagebox('Aviso','Debe indicar el salón al que desea cambiar la clase')	
	return
end if	

//Validar si sigue disponible
li_libre = uf_verifica_disponble(ls_salon)

if li_libre = 0 then
	messagebox('Aviso','El salón ya no se encuentra disponible')
	return
else
	istr_reservacion.salon=ls_salon
	if f_update_salon_actual(istr_reservacion.salon,istr_reservacion.salon_anterior, istr_reservacion.cve_dia, istr_reservacion.hora_inicio, istr_reservacion.cve_materia,istr_reservacion.grupo) = 1 then
		f_insert_reservacion_cambio(istr_reservacion)
		uf_aprobar(istr_reservacion.id_solicitud,istr_reservacion.num_asignacion)
		w_csal_solicitudes_salon.uf_carga_solicitudes()	
		messagebox('Aviso','Cambio de salón aprobado')
		close(this)
	end if
end if

end subroutine

public function integer uf_verifica_disponble (string p_salon);integer li_existe=0

uf_actualiza()

li_existe = dw_csal_salones_disponibles.Find("cve_salon='"+p_salon+"'",1,dw_csal_salones_disponibles.RowCount())

if li_existe >0 then return 1 else return 0

end function

public subroutine uf_actualiza ();dw_csal_salon_activo.reset()
dw_csal_salones_hora_permanentes.reset()
dw_csal_salones_fecha_temporales_dia.reset() 
dw_csal_salones_reservados_lapso.reset()

dw_csal_salon_activo.SetReDraw(false)
dw_csal_salones_hora_permanentes.SetReDraw(false)
dw_csal_salones_fecha_temporales_dia.SetReDraw(false)
dw_csal_salones_reservados_lapso.SetReDraw(false)
		 
uf_carga_reservados()	
uf_carga_libres()

dw_csal_salon_activo.SetReDraw(true) 
dw_csal_salones_hora_permanentes.SetReDraw(true)
dw_csal_salones_fecha_temporales_dia.SetReDraw(true)
dw_csal_salones_reservados_lapso.SetReDraw(true)
	

end subroutine

public subroutine uf_aprobar (long p_solicitud, long p_asignacion);update dbo.spre_sol_reserva_salon
set estatus=1,
num_asignacion=:p_asignacion,
cve_salon=:istr_reservacion.salon
where id_solicitud=:p_solicitud
using gtr_sumuia;

if gtr_sumuia.sqlcode<>0 then
	messagebox("Error al aprobar "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)	
else
	commit using gtr_sumuia;
end if		
					
end subroutine

public subroutine uf_rechazar (long p_solicitud);update dbo.spre_sol_reserva_salon
set estatus=2
where id_solicitud=:p_solicitud
using gtr_sumuia;

if gtr_sumuia.sqlcode<>0 then
	messagebox("Error al rechazar "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)	
else
	commit using gtr_sumuia;
end if		
					
end subroutine

on w_csal_salon_permanente_sol.create
this.cb_rechazar=create cb_rechazar
this.dw_csal_salon_ficha=create dw_csal_salon_ficha
this.dw_csal_salones_reservados_lapso=create dw_csal_salones_reservados_lapso
this.dw_csal_salones_reservados=create dw_csal_salones_reservados
this.dw_csal_salones_hora_permanentes=create dw_csal_salones_hora_permanentes
this.dw_csal_salones_fecha_temporales_dia=create dw_csal_salones_fecha_temporales_dia
this.cb_aprobar=create cb_aprobar
this.st_salon=create st_salon
this.dw_csal_salon_activo=create dw_csal_salon_activo
this.dw_csal_salones_disponibles=create dw_csal_salones_disponibles
this.st_libres=create st_libres
this.Control[]={this.cb_rechazar,&
this.dw_csal_salon_ficha,&
this.dw_csal_salones_reservados_lapso,&
this.dw_csal_salones_reservados,&
this.dw_csal_salones_hora_permanentes,&
this.dw_csal_salones_fecha_temporales_dia,&
this.cb_aprobar,&
this.st_salon,&
this.dw_csal_salon_activo,&
this.dw_csal_salones_disponibles,&
this.st_libres}
end on

on w_csal_salon_permanente_sol.destroy
destroy(this.cb_rechazar)
destroy(this.dw_csal_salon_ficha)
destroy(this.dw_csal_salones_reservados_lapso)
destroy(this.dw_csal_salones_reservados)
destroy(this.dw_csal_salones_hora_permanentes)
destroy(this.dw_csal_salones_fecha_temporales_dia)
destroy(this.cb_aprobar)
destroy(this.st_salon)
destroy(this.dw_csal_salon_activo)
destroy(this.dw_csal_salones_disponibles)
destroy(this.st_libres)
end on

event open;integer li_row
string ls_tipo_reservacion, ls_materia
istr_reservacion =message.powerobjectparm

ls_materia=istr_reservacion.materia+' (GRUPO '+istr_reservacion.grupo+')'

dw_csal_salon_ficha.insertrow(0)
dw_csal_salon_ficha.SetItem(1, "salon", istr_reservacion.salon)	
dw_csal_salon_ficha.SetItem(1, "observaciones", istr_reservacion.observaciones)
dw_csal_salon_ficha.SetItem(1, "horario", f_select_nombre_dia(istr_reservacion.cve_dia)+' '+string(istr_reservacion.hora_inicio)+' A '+string(istr_reservacion.hora_final))
dw_csal_salon_ficha.SetItem(1, "profesor", istr_reservacion.profesor)		
dw_csal_salon_ficha.SetItem(1, "materia", ls_materia)
dw_csal_salon_ficha.SetItem(1, "indistinto", istr_reservacion.indistinto)
dw_csal_salon_ficha.SetItem(1, "salon_anterior", istr_reservacion.salon_anterior)
dw_csal_salon_ficha.SetItem(1, "permanente", istr_reservacion.permanente)
st_salon.text='Salon: ' + istr_reservacion.salon
cb_aprobar.SetFocus()

post uf_actualiza()
 
end event

type cb_rechazar from commandbutton within w_csal_salon_permanente_sol
integer x = 3734
integer y = 669
integer width = 538
integer height = 106
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Rechazar"
end type

event clicked;uf_rechazar(istr_reservacion.id_solicitud)
w_csal_solicitudes_salon.uf_carga_solicitudes()	
messagebox('Aviso','Cambio de salón rechazado')
close(w_csal_salon_permanente_sol)

end event

type dw_csal_salon_ficha from datawindow within w_csal_salon_permanente_sol
integer x = 59
integer y = 42
integer width = 4224
integer height = 570
integer taborder = 10
string title = "Ficha de Reservación"
string dataobject = "d_csal_salon_datos_solicitud"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_csal_salones_reservados_lapso from datawindow within w_csal_salon_permanente_sol
boolean visible = false
integer x = 2670
integer y = 1459
integer width = 998
integer height = 826
integer taborder = 30
string title = "none"
string dataobject = "d_csal_salones_reservados_lapso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type dw_csal_salones_reservados from datawindow within w_csal_salon_permanente_sol
boolean visible = false
integer x = 1631
integer y = 909
integer width = 6426
integer height = 650
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_csal_salones_semana"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_csal_salones_hora_permanentes from datawindow within w_csal_salon_permanente_sol
boolean visible = false
integer x = 2816
integer y = 1491
integer width = 998
integer height = 288
integer taborder = 40
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

type dw_csal_salones_fecha_temporales_dia from datawindow within w_csal_salon_permanente_sol
boolean visible = false
integer x = 2728
integer y = 1482
integer width = 998
integer height = 349
integer taborder = 30
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

type cb_aprobar from commandbutton within w_csal_salon_permanente_sol
integer x = 3160
integer y = 669
integer width = 538
integer height = 106
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Aprobar"
end type

event clicked;uf_cambia_salon()
end event

type st_salon from statictext within w_csal_salon_permanente_sol
integer x = 2527
integer y = 669
integer width = 567
integer height = 106
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 31182271
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_csal_salon_activo from datawindow within w_csal_salon_permanente_sol
boolean visible = false
integer x = 4440
integer y = 877
integer width = 132
integer height = 90
integer taborder = 30
string title = "none"
string dataobject = "d_csal_salon_activo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_escolar)
end event

type dw_csal_salones_disponibles from datawindow within w_csal_salon_permanente_sol
integer x = 51
integer y = 829
integer width = 4228
integer height = 1427
integer taborder = 20
string dataobject = "d_csal_salones_disponibles"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer li_estatus

if row>0 then
	istr_reservacion.salon=this.GetItemString(row,"cve_salon")	
	istr_reservacion.estatus_salon=this.GetItemNumber(row,"estatus_salon")
	istr_reservacion.cupo_real=this.GetItemNumber(row,"cupo_real")
	st_salon.text='Salón: '+istr_reservacion.salon
end if

	if dwo.Type = "text" then
		
		choose case string(dwo.Name)
	
			case 'cve_salon_t'
				is_sort_disponibles="#1A" 
				this.Modify("cve_salon_t.background.color='11527407'")
				this.Modify("cupo_real_t.background.color='15793151'")
				this.Modify("observacion_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")

			case 'cupo_real_t'
				is_sort_disponibles="#2A #1A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("cupo_real_t.background.color='11527407'")
				this.Modify("observacion_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")		
				
			case 'observacion_t'	
				is_sort_disponibles="#3A #1A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("cupo_real_t.background.color='15793151'")
				this.Modify("observacion_t.background.color='11527407'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")	
				
			case 'tipo_reservacion_t'		
				is_sort_disponibles="#5A #1A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("cupo_real_t.background.color='15793151'")
				this.Modify("observacion_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='11527407'")	
				
		end choose
			
		this.SetSort(is_sort_disponibles) 
		this.Sort() 
		
	end if
	
end event

event itemfocuschanged;if row>0 then
	istr_reservacion.salon=this.GetItemString(row,"cve_salon")	
	istr_reservacion.estatus_salon=this.GetItemNumber(row,"estatus_salon")
	istr_reservacion.cupo_real=this.GetItemNumber(row,"cupo_real")
	st_salon.text='Salón: '+istr_reservacion.salon
end if
end event

type st_libres from statictext within w_csal_salon_permanente_sol
integer x = 51
integer y = 749
integer width = 768
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Salones Disponibles"
boolean focusrectangle = false
end type

