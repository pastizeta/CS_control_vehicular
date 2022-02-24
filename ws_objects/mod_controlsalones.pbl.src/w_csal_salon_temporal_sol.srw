$PBExportHeader$w_csal_salon_temporal_sol.srw
forward
global type w_csal_salon_temporal_sol from window
end type
type cb_rechazar from commandbutton within w_csal_salon_temporal_sol
end type
type dw_csal_solicitud from datawindow within w_csal_salon_temporal_sol
end type
type dw_csal_salon_ficha from datawindow within w_csal_salon_temporal_sol
end type
type dw_csal_salones_reservados_lapso from datawindow within w_csal_salon_temporal_sol
end type
type dw_csal_salones_fecha_temporales_dia from datawindow within w_csal_salon_temporal_sol
end type
type dw_csal_salones_hora_permanentes from datawindow within w_csal_salon_temporal_sol
end type
type dw_csal_salones_reservados from datawindow within w_csal_salon_temporal_sol
end type
type cb_aprobar from commandbutton within w_csal_salon_temporal_sol
end type
type st_salon from statictext within w_csal_salon_temporal_sol
end type
type dw_csal_salon_activo from datawindow within w_csal_salon_temporal_sol
end type
type dw_csal_salones_disponibles from datawindow within w_csal_salon_temporal_sol
end type
type st_libres from statictext within w_csal_salon_temporal_sol
end type
end forward

global type w_csal_salon_temporal_sol from window
integer width = 4400
integer height = 2211
boolean titlebar = true
string title = "Reservación temporal de salón"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_rechazar cb_rechazar
dw_csal_solicitud dw_csal_solicitud
dw_csal_salon_ficha dw_csal_salon_ficha
dw_csal_salones_reservados_lapso dw_csal_salones_reservados_lapso
dw_csal_salones_fecha_temporales_dia dw_csal_salones_fecha_temporales_dia
dw_csal_salones_hora_permanentes dw_csal_salones_hora_permanentes
dw_csal_salones_reservados dw_csal_salones_reservados
cb_aprobar cb_aprobar
st_salon st_salon
dw_csal_salon_activo dw_csal_salon_activo
dw_csal_salones_disponibles dw_csal_salones_disponibles
st_libres st_libres
end type
global w_csal_salon_temporal_sol w_csal_salon_temporal_sol

type variables
str_csal_salones_reservacion istr_reservacion, istr_original
string is_sort_disponibles="#1A"

DatawindowChild idwc_materias_profesor, idwc_materias_profesor_grupo
DatawindowChild idwc_materias, idwc_materias_profesores_grupos
DatawindowChild idwc_profesor



end variables

forward prototypes
public subroutine uf_carga_libres ()
public subroutine uf_carga_reservados ()
public subroutine uf_actualiza ()
public subroutine uf_reserva_salon ()
public function integer uf_verifica_disponble (string p_salon)
public function string uf_nombre_dia (integer p_dia)
public subroutine uf_aprobar (long p_solicitud, long p_asignacion)
public subroutine uf_rechazar (long p_solicitud)
end prototypes

public subroutine uf_carga_libres ();integer li_activos, li_i, li_j=0, li_permanente, li_estatus, li_row, li_num_asignacion
integer li_temp_dia, li_perma_dia,  li_cupo_real, li_reservados, li_existe
string ls_salon, ls_observaciones, ls_clase_aula, is_salon
integer li_periodo_inicio, li_periodo_final, li_anio_inicio, li_anio_final
integer li_periodo_hoy, li_anio_hoy

istr_reservacion.salon=''
st_salon.text='Salón: ---'
SetPointer(HourGlass!)

is_salon = istr_reservacion.salon

dw_csal_salones_disponibles.reset()
dw_csal_salones_disponibles.SetReDraw(false)	

dw_csal_salon_activo.SetFilter('')
dw_csal_salon_activo.Filter()
dw_csal_salon_activo.retrieve()

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
dw_csal_salones_disponibles.SetReDraw(true)

li_existe = dw_csal_salones_disponibles.Find("cve_salon='"+is_salon+"'",1,dw_csal_salones_disponibles.RowCount())

if li_existe > 0 then 
	dw_csal_salones_disponibles.ScrollToRow(li_existe)
elseif dw_csal_salones_disponibles.RowCount() = 0 then
	istr_reservacion.salon = ''
end if

st_libres.text="Salones Disponibles: "+string(dw_csal_salones_disponibles.rowcount())
SetPointer(Arrow!)

li_row=dw_csal_salones_disponibles.Find("cve_salon='"+istr_original.salon+"'",1,dw_csal_salones_disponibles.RowCount()) 
if li_row>0 then dw_csal_salones_disponibles.ScrollToRow (li_row)


end subroutine

public subroutine uf_carga_reservados ();integer li_i, li_temp_dia, li_perma_dia, li_total=0, li_tempo=0
integer li_lapso=0, li_dia, li_k
date ld_fecha_inicio, ld_fecha_final
string ls_titulo

ls_titulo=this.title
this.title='Cargando...'
SetPointer(HourGlass!)

dw_csal_salones_reservados.reset()
dw_csal_salones_reservados.SetReDraw(false)
dw_csal_salones_reservados.SetFilter('')
dw_csal_salones_reservados.Filter()

for li_k=1 to dw_csal_solicitud.RowCount()
	li_dia = dw_csal_solicitud.GetItemNumber(li_k,"cve_dia")
	dw_csal_salones_hora_permanentes.retrieve(istr_reservacion.periodo,istr_reservacion.anio,li_dia,istr_reservacion.hora_inicio,istr_reservacion.hora_final)
	li_perma_dia=dw_csal_salones_hora_permanentes.rowcount()
	
	for li_i=1 to li_perma_dia
		
		li_lapso=li_lapso+1
		dw_csal_salones_reservados_lapso.insertrow(0)
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "cve_salon", dw_csal_salones_hora_permanentes.GetItemString(li_i,"cve_salon"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "cve_materia", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_materia"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "cve_profesor", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_profesor"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "cve_dia", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_dia"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "hora_inicio", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"hora_inicio"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "hora_final", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"hora_final"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "estatus", 1)
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "cve_grupo", dw_csal_salones_hora_permanentes.GetItemString(li_i,"cve_grupo"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "inscritos", dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"grupos_inscritos"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "lapso_completo", 0)
		dw_csal_salones_reservados_lapso.SetItem(li_lapso,"nom_dia",f_select_nombre_dia(dw_csal_salones_hora_permanentes.GetItemNumber(li_i,"cve_dia")))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "lapso",'PERIODO ESCOLAR')
		
	next 	
	
next


for li_k=1 to dw_csal_solicitud.RowCount()
	li_dia = dw_csal_solicitud.GetItemNumber(li_k,"cve_dia")
	ld_fecha_inicio = date(dw_csal_solicitud.GetItemDateTime(li_k,"fecha_inicio"))
	ld_fecha_final = date(dw_csal_solicitud.GetItemDateTime(li_k,"fecha_final"))
	
	dw_csal_salones_fecha_temporales_dia.retrieve(istr_reservacion.periodo,istr_reservacion.anio,li_dia,istr_reservacion.hora_inicio,istr_reservacion.hora_final,ld_fecha_inicio,ld_fecha_final)
	li_temp_dia=dw_csal_salones_fecha_temporales_dia.rowcount()

	for li_i=1 to li_temp_dia

		li_lapso=li_lapso+1
		dw_csal_salones_reservados_lapso.insertrow(0)
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "cve_salon", dw_csal_salones_fecha_temporales_dia.GetItemString(li_i,"cve_salon"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "cve_materia", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_materia"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "cve_profesor", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_profesor"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "cve_dia", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"cve_dia"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "hora_inicio", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"hora_inicio"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "hora_final", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"hora_final"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "num_asignacion", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"num_asignacion"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "fecha_movimiento", dw_csal_salones_fecha_temporales_dia.GetItemDateTime(li_i,"fecha_movimiento"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "fecha_inicio", dw_csal_salones_fecha_temporales_dia.GetItemDateTime(li_i,"fecha_inicio"))		
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "fecha_final",  dw_csal_salones_fecha_temporales_dia.GetItemDateTime(li_i,"fecha_final"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "cve_grupo", dw_csal_salones_fecha_temporales_dia.GetItemString(li_i,"cve_grupo"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "estatus", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"estatus"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "lapso_completo", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"lapso_completo"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "observaciones", dw_csal_salones_fecha_temporales_dia.GetItemString(li_i,"observaciones"))	
		dw_csal_salones_reservados_lapso.SetItem(li_lapso, "lapso_completo", dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"lapso_completo"))		
		
	next
	
next


//Llenar Reservados
for li_i=1 to li_lapso
	
	dw_csal_salones_reservados.insertrow(0)
	dw_csal_salones_reservados.SetItem(li_i, "cve_salon", dw_csal_salones_reservados_lapso.GetItemString(li_i,"cve_salon"))	
	dw_csal_salones_reservados.SetItem(li_i, "cve_materia", dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"cve_materia"))	
	dw_csal_salones_reservados.SetItem(li_i, "cve_profesor", dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"cve_profesor"))	
	dw_csal_salones_reservados.SetItem(li_i, "cve_dia", dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"cve_dia"))	
	dw_csal_salones_reservados.SetItem(li_i, "hora_inicio", dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"hora_inicio"))	
	dw_csal_salones_reservados.SetItem(li_i, "hora_final", dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"hora_final"))	
	dw_csal_salones_reservados.SetItem(li_i, "num_asignacion", dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"num_asignacion"))	
	dw_csal_salones_reservados.SetItem(li_i, "fecha_movimiento", dw_csal_salones_reservados_lapso.GetItemDateTime(li_i,"fecha_movimiento"))	
	dw_csal_salones_reservados.SetItem(li_i, "fecha_inicio", dw_csal_salones_reservados_lapso.GetItemDateTime(li_i,"fecha_inicio"))		
	dw_csal_salones_reservados.SetItem(li_i, "fecha_final",  dw_csal_salones_reservados_lapso.GetItemDateTime(li_i,"fecha_final"))	
	dw_csal_salones_reservados.SetItem(li_i, "cve_grupo", dw_csal_salones_reservados_lapso.GetItemString(li_i,"cve_grupo"))	
	dw_csal_salones_reservados.SetItem(li_i, "inscritos", dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"inscritos"))	
	dw_csal_salones_reservados.SetItem(li_i, "estatus", dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"estatus"))	
	dw_csal_salones_reservados.SetItem(li_i, "lapso_completo", dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"lapso_completo"))	
	dw_csal_salones_reservados.SetItem(li_i, "observaciones", dw_csal_salones_reservados_lapso.GetItemString(li_i,"observaciones"))	

	dw_csal_salones_reservados.SetItem(li_i, "tipo_reservacion",f_select_nombre_estatus(dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"estatus")))		
	dw_csal_salones_reservados.SetItem(li_i, "nom_dia",dw_csal_salones_reservados_lapso.GetItemString(li_i,"nom_dia"))	
	dw_csal_salones_reservados.SetItem(li_i, "lapso",dw_csal_salones_reservados_lapso.GetItemString(li_i,"lapso"))	

	dw_csal_salones_reservados.SetItem(li_i, "horario",string(dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"hora_final")))
	dw_csal_salones_reservados.SetItem(li_i, "nom_profesor",f_select_nombre_profesor(dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"cve_profesor")))		

next

dw_csal_salones_reservados.SetReDraw(true)

li_total=dw_csal_salones_reservados.rowcount()
li_tempo=li_total - li_perma_dia
this.title=ls_titulo
SetPointer(Arrow!)


end subroutine

public subroutine uf_actualiza ();istr_reservacion.dia=uf_nombre_dia(istr_reservacion.cve_dia)

dw_csal_salon_activo.reset()
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

public subroutine uf_reserva_salon ();integer li_libre, li_k
long ll_num_asignacion, ll_solicitud
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

	for li_k=1 to dw_csal_solicitud.RowCount()
		ll_solicitud = dw_csal_solicitud.GetItemNumber(li_k,"id_solicitud")
		istr_reservacion.cve_dia = dw_csal_solicitud.GetItemNumber(li_k,"cve_dia")
		istr_reservacion.fecha_inicio = date(dw_csal_solicitud.GetItemDateTime(li_k,"fecha_inicio"))
		istr_reservacion.fecha_final = date(dw_csal_solicitud.GetItemDateTime(li_k,"fecha_final"))
		istr_reservacion.fecha_movimiento = today()
		istr_reservacion.estatus_reservacion = 2
		istr_reservacion.lapso_completo = 0
	
		ll_num_asignacion = f_select_reservacion_id()
		
		f_insert_reservacion_temporal_nueva(istr_reservacion,ll_num_asignacion)
		uf_aprobar(ll_solicitud,ll_num_asignacion)
	next

	w_csal_solicitudes_salon.uf_carga_solicitudes()	
	messagebox('Aviso','Solicitud aprobada')
	close(this)

end if


end subroutine

public function integer uf_verifica_disponble (string p_salon);integer li_existe=0

uf_actualiza()

li_existe = dw_csal_salones_disponibles.Find("cve_salon='"+p_salon+"'",1,dw_csal_salones_disponibles.RowCount())

if li_existe >0 then return 1 else return 0

end function

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

on w_csal_salon_temporal_sol.create
this.cb_rechazar=create cb_rechazar
this.dw_csal_solicitud=create dw_csal_solicitud
this.dw_csal_salon_ficha=create dw_csal_salon_ficha
this.dw_csal_salones_reservados_lapso=create dw_csal_salones_reservados_lapso
this.dw_csal_salones_fecha_temporales_dia=create dw_csal_salones_fecha_temporales_dia
this.dw_csal_salones_hora_permanentes=create dw_csal_salones_hora_permanentes
this.dw_csal_salones_reservados=create dw_csal_salones_reservados
this.cb_aprobar=create cb_aprobar
this.st_salon=create st_salon
this.dw_csal_salon_activo=create dw_csal_salon_activo
this.dw_csal_salones_disponibles=create dw_csal_salones_disponibles
this.st_libres=create st_libres
this.Control[]={this.cb_rechazar,&
this.dw_csal_solicitud,&
this.dw_csal_salon_ficha,&
this.dw_csal_salones_reservados_lapso,&
this.dw_csal_salones_fecha_temporales_dia,&
this.dw_csal_salones_hora_permanentes,&
this.dw_csal_salones_reservados,&
this.cb_aprobar,&
this.st_salon,&
this.dw_csal_salon_activo,&
this.dw_csal_salones_disponibles,&
this.st_libres}
end on

on w_csal_salon_temporal_sol.destroy
destroy(this.cb_rechazar)
destroy(this.dw_csal_solicitud)
destroy(this.dw_csal_salon_ficha)
destroy(this.dw_csal_salones_reservados_lapso)
destroy(this.dw_csal_salones_fecha_temporales_dia)
destroy(this.dw_csal_salones_hora_permanentes)
destroy(this.dw_csal_salones_reservados)
destroy(this.cb_aprobar)
destroy(this.st_salon)
destroy(this.dw_csal_salon_activo)
destroy(this.dw_csal_salones_disponibles)
destroy(this.st_libres)
end on

event open;integer  li_i
string ls_materia, ls_horario=''

istr_reservacion =message.powerobjectparm
istr_original=message.powerobjectparm
 
ls_materia=istr_reservacion.materia+' (GRUPO '+istr_reservacion.grupo+')'

dw_csal_solicitud.retrieve(istr_reservacion.periodo,istr_reservacion.anio,-1,-1,-1,istr_reservacion.id_lapso_solicitud)
dw_csal_solicitud.SetSort('#13A')
dw_csal_solicitud.Sort()

dw_csal_salon_ficha.insertrow(0)
dw_csal_salon_ficha.SetItem(1, "salon", istr_reservacion.salon)	
dw_csal_salon_ficha.SetItem(1, "observaciones", istr_reservacion.observaciones)

ls_horario = string(istr_reservacion.hora_inicio)+' A '+string(istr_reservacion.hora_final)
istr_reservacion.fecha_inicio=date(dw_csal_solicitud.GetItemDateTime(1,"fecha_inicio"))

for li_i =1 to dw_csal_solicitud.RowCount()
	ls_horario = ls_horario + ', ' + f_select_nombre_dia(dw_csal_solicitud.GetItemNumber(li_i,"cve_dia")) + ' ' + string(date(dw_csal_solicitud.GetItemDateTime(li_i,"fecha_inicio"))) 
	istr_reservacion.fecha_final=date(dw_csal_solicitud.GetItemDateTime(li_i,"fecha_final"))
next

dw_csal_salon_ficha.SetItem(1, "horario", ls_horario)
dw_csal_salon_ficha.SetItem(1, "profesor", istr_reservacion.profesor)		
dw_csal_salon_ficha.SetItem(1, "materia", ls_materia)
dw_csal_salon_ficha.SetItem(1, "indistinto", istr_reservacion.indistinto)
dw_csal_salon_ficha.SetItem(1, "salon_anterior", istr_reservacion.salon_anterior)
dw_csal_salon_ficha.SetItem(1, "permanente", istr_reservacion.permanente)
st_salon.text='Salon: ' + istr_reservacion.salon
cb_aprobar.SetFocus()

post uf_actualiza()




/*integer li_row, li_cve_dia, li_dias_lapso, li_k, li_dia_fecha
string ls_tipo_reservacion, ls_materia, ls_lapso, ls_fecha, ls_dia, ls_profesor, ls_filtro
date ld_fecha

istr_reservacion =message.powerobjectparm
istr_original=message.powerobjectparm
 
//Días
ls_dia = istr_reservacion.dia
if ls_dia = 'SABADO' then ls_dia = 'SÁBADO'
if ls_dia = 'MIERCOLES' then ls_dia = 'MIÉRCOLES'
ddlb_dia.SelectItem(ls_dia,1)

em_hora_inicio.text= string(istr_reservacion.hora_inicio)
em_hora_final.text= string(istr_reservacion.hora_final)
em_fecha_inicio.text=string(istr_reservacion.fecha_inicio)
em_fecha_final.text=string(istr_reservacion.fecha_final)

//Profesor
dw_csal_profesor.settransobject(gtr_escolar)
dw_csal_profesor.getchild('profesor',idwc_profesor)
idwc_profesor.settransobject(gtr_escolar)
idwc_profesor.Retrieve()
if idwc_profesor.RowCount()>0 then dw_csal_profesor.InsertRow(0)

//Materias de un Profesor
dw_csal_materias_profesor.settransobject(gtr_escolar)
dw_csal_materias_profesor.getchild('materias_materia',idwc_materias_profesor)
idwc_materias_profesor.settransobject(gtr_escolar)

//Grupos de Materias de un Profesor
dw_csal_materias_profesor_grupo.settransobject(gtr_escolar)
dw_csal_materias_profesor_grupo.getchild('gpo',idwc_materias_profesor_grupo)
idwc_materias_profesor_grupo.settransobject(gtr_escolar)

//Materias
dw_csal_materias.settransobject(gtr_escolar)
dw_csal_materias.getchild('materia',idwc_materias)
idwc_materias.settransobject(gtr_escolar)

//Grupos y Profesores de una Materia
dw_csal_materias_profesores_grupos.settransobject(gtr_escolar)
dw_csal_materias_profesores_grupos.getchild('gpo',idwc_materias_profesores_grupos)
idwc_materias_profesores_grupos.settransobject(gtr_escolar)


//if istr_reservacion.fecha_inicio< today() /*or ii_actual=0*/ then uf_cambiar_dia()

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
dw_csal_salon_ficha.SetItem(1, "estatus",2)
mle_observaciones.text=istr_reservacion.observaciones

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
	cbx_periodo.checked=true
end if

dw_csal_salon_ficha.SetItem(1, "lapso",upper(ls_lapso))
dw_csal_salon_ficha.SetItem(1, "horario_periodo",f_select_texto_horarios_materia(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "materias_asimiladas",f_select_texto_asimiladas(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "asimilada",f_valida_es_asimilada(istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
dw_csal_salon_ficha.SetItem(1, "salon_anterior",f_select_texto_salones_anteriores(istr_reservacion.cve_dia,istr_reservacion.hora_inicio,istr_reservacion.cve_materia,istr_reservacion.grupo,istr_reservacion.periodo,istr_reservacion.anio))
istr_reservacion.salon_anterior=istr_reservacion.salon

if istr_reservacion.cve_materia = 0 then
	ls_profesor=istr_reservacion.profesor+' [Clave: '+string(istr_reservacion.cve_profesor)+']'
	dw_csal_profesor.SetItem(1,'profesor',ls_profesor)
	uf_cambio_profesor(string(istr_reservacion.cve_profesor))
else
	rb_materia.checked=true
	uf_marca_materia()
	ls_materia=istr_reservacion.materia+' [Clave: '+string(istr_reservacion.cve_materia)+']'
	dw_csal_materias.SetItem(1,'materia',ls_materia)	
	uf_cambio_materia(string(istr_reservacion.cve_profesor))
end if

if istr_reservacion.num_asignacion = 0 then 
	uf_sube_controles()
else
	cb_cancelar.enabled=true
end if



uf_carga_reservados()
uf_carga_libres()


*/
end event

type cb_rechazar from commandbutton within w_csal_salon_temporal_sol
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

event clicked;integer li_k
long ll_solicitud

for li_k=1 to dw_csal_solicitud.RowCount()
	ll_solicitud = dw_csal_solicitud.GetItemNumber(li_k,"id_solicitud")
	uf_rechazar(ll_solicitud)
next	
	
w_csal_solicitudes_salon.uf_carga_solicitudes()	
messagebox('Aviso','Solicitud rechazada')
close(w_csal_salon_temporal_sol)

end event

type dw_csal_solicitud from datawindow within w_csal_salon_temporal_sol
boolean visible = false
integer x = 3515
integer y = 93
integer width = 1807
integer height = 525
integer taborder = 20
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

type dw_csal_salon_ficha from datawindow within w_csal_salon_temporal_sol
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

type dw_csal_salones_reservados_lapso from datawindow within w_csal_salon_temporal_sol
boolean visible = false
integer x = 1090
integer y = 1469
integer width = 998
integer height = 826
integer taborder = 50
string title = "none"
string dataobject = "d_csal_salones_reservados_lapso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type dw_csal_salones_fecha_temporales_dia from datawindow within w_csal_salon_temporal_sol
boolean visible = false
integer x = 1145
integer y = 1488
integer width = 998
integer height = 349
integer taborder = 60
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

type dw_csal_salones_hora_permanentes from datawindow within w_csal_salon_temporal_sol
boolean visible = false
integer x = 1232
integer y = 1501
integer width = 998
integer height = 288
integer taborder = 60
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

type dw_csal_salones_reservados from datawindow within w_csal_salon_temporal_sol
boolean visible = false
integer x = 51
integer y = 922
integer width = 6426
integer height = 650
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_csal_salones_semana"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_aprobar from commandbutton within w_csal_salon_temporal_sol
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

event clicked;uf_reserva_salon()
end event

type st_salon from statictext within w_csal_salon_temporal_sol
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

type dw_csal_salon_activo from datawindow within w_csal_salon_temporal_sol
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

type dw_csal_salones_disponibles from datawindow within w_csal_salon_temporal_sol
integer x = 51
integer y = 829
integer width = 4231
integer height = 1066
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

type st_libres from statictext within w_csal_salon_temporal_sol
integer x = 51
integer y = 749
integer width = 2191
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

