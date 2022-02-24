$PBExportHeader$w_csal_salon_temporal.srw
forward
global type w_csal_salon_temporal from window
end type
type cb_cancelar from commandbutton within w_csal_salon_temporal
end type
type cb_buscar from commandbutton within w_csal_salon_temporal
end type
type dw_csal_salones_reservados_lapso from datawindow within w_csal_salon_temporal
end type
type dw_csal_salones_fecha_temporales_dia from datawindow within w_csal_salon_temporal
end type
type dw_csal_salones_hora_permanentes from datawindow within w_csal_salon_temporal
end type
type dw_csal_salones_reservados from datawindow within w_csal_salon_temporal
end type
type st_nombre_profesor from statictext within w_csal_salon_temporal
end type
type st_nombre_materia from statictext within w_csal_salon_temporal
end type
type dw_csal_materias_profesor_grupo from u_basedw within w_csal_salon_temporal
end type
type dw_csal_materias_profesores_grupos from u_basedw within w_csal_salon_temporal
end type
type dw_csal_materias_profesor from u_basedw within w_csal_salon_temporal
end type
type dw_csal_materias from u_basedw within w_csal_salon_temporal
end type
type sle_materia from singlelineedit within w_csal_salon_temporal
end type
type dw_csal_profesor from u_basedw within w_csal_salon_temporal
end type
type rb_materia from radiobutton within w_csal_salon_temporal
end type
type sle_profesor from singlelineedit within w_csal_salon_temporal
end type
type rb_profesor from radiobutton within w_csal_salon_temporal
end type
type em_fecha_inicio from editmask within w_csal_salon_temporal
end type
type em_fecha_final from editmask within w_csal_salon_temporal
end type
type st_inicio from statictext within w_csal_salon_temporal
end type
type st_fin from statictext within w_csal_salon_temporal
end type
type cbx_periodo from checkbox within w_csal_salon_temporal
end type
type st_observaciones from statictext within w_csal_salon_temporal
end type
type mle_observaciones from multilineedit within w_csal_salon_temporal
end type
type cb_reservar from commandbutton within w_csal_salon_temporal
end type
type st_salon from statictext within w_csal_salon_temporal
end type
type dw_csal_salon_activo from datawindow within w_csal_salon_temporal
end type
type dw_csal_salones_disponibles from datawindow within w_csal_salon_temporal
end type
type st_libres from statictext within w_csal_salon_temporal
end type
type dw_csal_salon_ficha from datawindow within w_csal_salon_temporal
end type
type st_dia from statictext within w_csal_salon_temporal
end type
type st_horario from statictext within w_csal_salon_temporal
end type
type st_hora from statictext within w_csal_salon_temporal
end type
type gb_clase from groupbox within w_csal_salon_temporal
end type
type em_hora_inicio from editmask within w_csal_salon_temporal
end type
type em_hora_final from editmask within w_csal_salon_temporal
end type
type ddlb_dia from dropdownlistbox within w_csal_salon_temporal
end type
end forward

global type w_csal_salon_temporal from window
integer width = 4348
integer height = 3245
boolean titlebar = true
string title = "Reservación temporal de salón"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_cancelar cb_cancelar
cb_buscar cb_buscar
dw_csal_salones_reservados_lapso dw_csal_salones_reservados_lapso
dw_csal_salones_fecha_temporales_dia dw_csal_salones_fecha_temporales_dia
dw_csal_salones_hora_permanentes dw_csal_salones_hora_permanentes
dw_csal_salones_reservados dw_csal_salones_reservados
st_nombre_profesor st_nombre_profesor
st_nombre_materia st_nombre_materia
dw_csal_materias_profesor_grupo dw_csal_materias_profesor_grupo
dw_csal_materias_profesores_grupos dw_csal_materias_profesores_grupos
dw_csal_materias_profesor dw_csal_materias_profesor
dw_csal_materias dw_csal_materias
sle_materia sle_materia
dw_csal_profesor dw_csal_profesor
rb_materia rb_materia
sle_profesor sle_profesor
rb_profesor rb_profesor
em_fecha_inicio em_fecha_inicio
em_fecha_final em_fecha_final
st_inicio st_inicio
st_fin st_fin
cbx_periodo cbx_periodo
st_observaciones st_observaciones
mle_observaciones mle_observaciones
cb_reservar cb_reservar
st_salon st_salon
dw_csal_salon_activo dw_csal_salon_activo
dw_csal_salones_disponibles dw_csal_salones_disponibles
st_libres st_libres
dw_csal_salon_ficha dw_csal_salon_ficha
st_dia st_dia
st_horario st_horario
st_hora st_hora
gb_clase gb_clase
em_hora_inicio em_hora_inicio
em_hora_final em_hora_final
ddlb_dia ddlb_dia
end type
global w_csal_salon_temporal w_csal_salon_temporal

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
public subroutine uf_cambiar_dia ()
public subroutine uf_cambio_materia (string ps_texto)
public subroutine uf_cambio_profesor (string ps_texto)
public subroutine uf_marca_profesor ()
public subroutine uf_marca_materia ()
public subroutine uf_actualiza ()
public function string uf_nombre_dia (integer p_dia)
public subroutine uf_reserva_salon ()
public subroutine uf_limpia ()
public function integer uf_verifica_disponble (string p_salon)
public function integer uf_verifica_fechas ()
public subroutine uf_nueva_reservacion ()
public subroutine uf_sube_controles ()
public subroutine uf_cancela_salon ()
end prototypes

public subroutine uf_carga_libres ();integer li_activos, li_i, li_j=0, li_permanente, li_estatus, li_row, li_num_asignacion
integer li_temp_dia, li_perma_dia,  li_cupo_real, li_reservados
string ls_salon, ls_observaciones, ls_clase_aula
integer li_periodo_inicio, li_periodo_final, li_anio_inicio, li_anio_final
integer li_periodo_hoy, li_anio_hoy

istr_reservacion.salon=''
st_salon.text='Salón: ---'
SetPointer(HourGlass!)

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

st_libres.text="Salones Disponibles: "+string(dw_csal_salones_disponibles.rowcount())
SetPointer(Arrow!)

li_row=dw_csal_salones_disponibles.Find("cve_salon='"+istr_original.salon+"'",1,dw_csal_salones_disponibles.RowCount()) 
if li_row>0 then dw_csal_salones_disponibles.ScrollToRow (li_row)


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
dw_csal_salones_reservados.SetFilter('')
dw_csal_salones_reservados.Filter()

if istr_reservacion.lapso_completo=0 then
	
	//Sólo ese día de la semana y hora en ese rango de fechas
	dw_csal_salones_fecha_temporales_dia.retrieve(istr_reservacion.periodo,istr_reservacion.anio,istr_reservacion.cve_dia,istr_reservacion.hora_inicio,istr_reservacion.hora_final,istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)
	dw_csal_salones_hora_permanentes.retrieve(istr_reservacion.periodo,istr_reservacion.anio,istr_reservacion.cve_dia,istr_reservacion.hora_inicio,istr_reservacion.hora_final)

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

		
		//Temporales
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
		
	else
		
		//Lapso completo, todos los días de la semana y hora en ese rango de fechas
		li_dias=DaysAfter(istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)+1
		
		if li_dias>7 then li_dias=7
	
		li_dia=DayNumber(istr_reservacion.fecha_inicio) -2

		for li_j=1 to li_dias
			
			li_dia=li_dia+1
		
			if li_dia=7 then li_dia=0
		
			//Permanentes  todos los días de la semana y hora
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

			//Temporales  todos los días de la semana y hora en ese rango de fechas
			dw_csal_salones_fecha_temporales_dia.retrieve(istr_reservacion.periodo,istr_reservacion.anio,li_dia,istr_reservacion.hora_inicio,istr_reservacion.hora_final,istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)
			li_temp_dia=dw_csal_salones_fecha_temporales_dia.rowcount()
			
			for li_i=1 to li_temp_dia
				
				li_lapso_actual=dw_csal_salones_fecha_temporales_dia.GetItemNumber(li_i,"lapso_completo")
				if li_lapso_actual>0 then 
					if (dw_csal_salones_reservados_lapso.Find("lapso_completo="+string(li_lapso_actual),1,li_lapso))>0 then goto sigue 
				end if

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
					
					dw_csal_salones_reservados_lapso.SetItem(li_lapso, "nom_dia",f_select_nombre_dia(li_cve_dia))		
					dw_csal_salones_reservados_lapso.SetItem(li_lapso, "lapso",ls_lapso)
					
				else
					dw_csal_salones_reservados_lapso.SetItem(li_lapso, "nom_dia",'TODOS')
					dw_csal_salones_reservados_lapso.SetItem(li_lapso, "cve_dia",-1)
					dw_csal_salones_reservados_lapso.SetItem(li_lapso, "lapso",f_convierte_fecha_texto(ld_fecha_inicio)+' AL '+f_convierte_fecha_texto(ld_fecha_final))
				end if					
				
				
				sigue:
				
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
			li_materia=dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"cve_materia")
			if li_materia=0 then  dw_csal_salones_reservados.SetItem(li_i, "nom_materia","NO ASIGNADA") else	dw_csal_salones_reservados.SetItem(li_i, "nom_materia",f_select_nombre_materia(dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"cve_materia")))  
			if f_valida_tiene_asimiladas(dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"cve_materia"),dw_csal_salones_reservados_lapso.GetItemString(li_i,"cve_grupo"),istr_reservacion.periodo,istr_reservacion.anio)>0 then dw_csal_salones_reservados.SetItem(li_i, "asimiladas",'**')
			if f_valida_es_asimilada(dw_csal_salones_reservados_lapso.GetItemNumber(li_i,"cve_materia"),dw_csal_salones_reservados_lapso.GetItemString(li_i,"cve_grupo"),istr_reservacion.periodo,istr_reservacion.anio)>0 then dw_csal_salones_reservados.SetItem(li_i, "asimiladas",'*')
	
		next
		
	end if

//Excluir la reservación actual
ls_filtro='num_asignacion not in ('+string(istr_reservacion.num_asignacion)+')'
dw_csal_salones_reservados.SetFilter(ls_filtro)
dw_csal_salones_reservados.Filter()
dw_csal_salones_reservados.SetReDraw(true)

li_total=dw_csal_salones_reservados.rowcount()
li_tempo=li_total - li_perma_dia
this.title=ls_titulo
SetPointer(Arrow!)


end subroutine

public subroutine uf_cambiar_dia ();date ld_hoy, ld_fecha
integer li_i, li_numero


ld_hoy=today()

for li_i=1 to 7
				
	ld_fecha=RelativeDate(ld_hoy,li_i -1)
	li_numero=DayNumber(ld_fecha) -1
	
	if li_numero=istr_reservacion.cve_dia then 
	
		//Actualizar Inicio
		em_fecha_inicio.text=string(ld_fecha)
		istr_reservacion.fecha_inicio=ld_fecha
					
		//Actualizar Final
		em_fecha_final.text=string(ld_fecha)
		istr_reservacion.fecha_final=ld_fecha

  	end if
				
next
end subroutine

public subroutine uf_cambio_materia (string ps_texto);long ll_cve_materia

dw_csal_materias_profesores_grupos.Reset()
idwc_materias_profesores_grupos.Reset()

istr_reservacion.grupo='NA'
istr_reservacion.inscritos=0
istr_reservacion.profesor=''
istr_reservacion.cve_profesor=0

 if IsNumber(ps_texto) then

	ll_cve_materia=long(ps_texto)

	idwc_materias_profesores_grupos.retrieve(istr_reservacion.anio,istr_reservacion.periodo,ll_cve_materia)
	if idwc_materias_profesores_grupos.RowCount()>0 then dw_csal_materias_profesores_grupos.insertrow(0)

	istr_reservacion.cve_materia=ll_cve_materia
	istr_reservacion.materia=f_select_nombre_materia(istr_reservacion.cve_materia)
	sle_materia.text=string(ll_cve_materia)
	st_nombre_materia.text=istr_reservacion.materia

end if

end subroutine

public subroutine uf_cambio_profesor (string ps_texto);long ll_profesor

dw_csal_materias_profesor.reset()
dw_csal_materias_profesor_grupo.reset()

istr_reservacion.cve_materia=0
istr_reservacion.materia="NO ASIGNADA"
istr_reservacion.grupo="NA"
istr_reservacion.inscritos=0
 
 if IsNumber(ps_texto) then

	ll_profesor=long(ps_texto)
	istr_reservacion.cve_profesor=ll_profesor
	istr_reservacion.profesor=f_select_nombre_profesor(ll_profesor)
	
	sle_profesor.text=string(ll_profesor)
	st_nombre_profesor.text=istr_reservacion.profesor

	idwc_materias_profesor.retrieve(istr_reservacion.anio,istr_reservacion.periodo,ll_profesor)
	if idwc_materias_profesor.RowCount()>0 then dw_csal_materias_profesor.insertrow(0)

end if
end subroutine

public subroutine uf_marca_profesor ();sle_materia.enabled=false
dw_csal_materias.enabled=false
dw_csal_materias_profesores_grupos.enabled=false

sle_profesor.enabled=true
dw_csal_profesor.enabled=true
dw_csal_materias_profesor.enabled=true
dw_csal_materias_profesor_grupo.enabled=true

sle_materia.text=''
dw_csal_materias.Reset()
dw_csal_materias_profesores_grupos.Reset()

sle_profesor.text=''
st_nombre_profesor.text=''
st_nombre_materia.text=''
dw_csal_profesor.Reset()
idwc_profesor.Retrieve()
if idwc_profesor.RowCount()>0 then dw_csal_profesor.InsertRow(0)

dw_csal_materias_profesor.Reset()
dw_csal_materias_profesor_grupo.Reset()

end subroutine

public subroutine uf_marca_materia ();sle_profesor.enabled=false
dw_csal_profesor.enabled=false
dw_csal_materias_profesor.enabled=false
dw_csal_materias_profesor_grupo.enabled=false

sle_materia.enabled=true
dw_csal_materias.enabled=true
dw_csal_materias_profesores_grupos.enabled=true

sle_profesor.text=''
st_nombre_profesor.text=''
dw_csal_profesor.Reset()
dw_csal_materias_profesor.Reset()
dw_csal_materias_profesor_grupo.Reset()

sle_materia.text=''
dw_csal_materias.Reset()
idwc_materias.Reset()
idwc_materias.Retrieve(istr_reservacion.anio,istr_reservacion.periodo)
if idwc_materias.RowCount()>0 then dw_csal_materias.insertrow(0)

dw_csal_materias_profesores_grupos.Reset()

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

public subroutine uf_reserva_salon ();integer li_ocupado, li_libre
string ls_salon

ls_salon = istr_reservacion.salon
if uf_verifica_fechas() = 0 then 
	uf_limpia()
	return
end if

if dw_csal_salones_disponibles.RowCount() = 0 then
	messagebox('Aviso','Presione Buscar Salones para verificar que el salón elegido está disponible.')	
	return
end if

if istr_reservacion.salon = '' then
	messagebox('Aviso','Debe indicar el salón que desea reservar')	
	return
end if	

if mle_observaciones.text = '' then
	messagebox('Aviso','Debe indicar el tipo de evento u observaciones de la reservación')
	return
end if

if istr_reservacion.cve_profesor = 0 and istr_reservacion.cve_materia = 0 then
	messagebox('Aviso','Debe indicar profesor o materia del evento')
	return
end if

//Validar si sigue disponible
li_libre = uf_verifica_disponble(ls_salon)

if li_libre = 0 then
	messagebox('Aviso','El salón ya no se encuentra disponible')
	return
else
	istr_reservacion.salon=ls_salon

	//Original
	if istr_reservacion.num_asignacion > 0 then
		if  istr_original.lapso_completo = 0 then
			//Conserva id
			f_delete_reservacion_temporal(istr_reservacion.num_asignacion)
		else
			//Conserva lapso, se asignan nuevas id
			f_delete_reservacion_lapso_temporal(istr_original.lapso_completo)
			istr_reservacion.num_asignacion = 0
		end if
	end if

	//Nueva resevación
	uf_nueva_reservacion()

	w_csal_prestamo_salon_dia.uf_carga_reservados()	
	messagebox('Aviso','Reservación actualizada')
	close(this)
end if


end subroutine

public subroutine uf_limpia ();istr_reservacion.salon=''
istr_reservacion.cupo_real=0
st_salon.text='Salón: ----'
dw_csal_salones_disponibles.Reset()
dw_csal_salones_reservados.Reset()	

st_libres.text='Salones Disponibles'

cb_buscar.SetFocus()
end subroutine

public function integer uf_verifica_disponble (string p_salon);integer li_existe=0

uf_actualiza()

li_existe = dw_csal_salones_disponibles.Find("cve_salon='"+p_salon+"'",1,dw_csal_salones_disponibles.RowCount())

if li_existe >0 then return 1 else return 0

end function

public function integer uf_verifica_fechas ();integer li_periodo_actual, li_anio_actual, li_periodo_ini, li_anio_ini, li_periodo_fin, li_anio_fin

//Verificar horas
if istr_reservacion.hora_final<=istr_reservacion.hora_inicio or istr_reservacion.hora_final>23 then
	messagebox ('Aviso','La hora final debe ser mayor a la inicial, con diferencia de al menos una hora.')
	return 0
end if

//Verificar que el rango de fechas se encuentra en el periodo actual
f_select_anio_periodo_actual(li_periodo_ini,li_anio_ini,istr_reservacion.fecha_inicio)
f_select_anio_periodo_actual(li_periodo_fin,li_anio_fin,istr_reservacion.fecha_final)
f_select_anio_periodo_actual(li_periodo_actual,li_anio_actual,today())

if isnull(li_anio_actual) or isnull(li_periodo_ini) or isnull(li_anio_fin) or isnull(li_periodo_fin) or li_anio_ini<>li_anio_actual or li_periodo_ini<>li_periodo_actual or li_anio_fin<>li_anio_actual or li_periodo_fin<>li_periodo_actual then
	messagebox('Aviso','Las fechas de reservación deben encontrarse en el periodo escolar actual')
	return 0
end if

//Verificar que la fecha inicial sea mayor o igual que hoy
if istr_reservacion.fecha_inicio<today() then 
	messagebox('Aviso','Las fechas deben se mayor al día de hoy.')
	return 0
end if

//Verificar que la fecha final sea mayor a la fecha inicial
if istr_reservacion.fecha_inicio>istr_reservacion.fecha_final then 
	messagebox('Aviso','La fecha final debe ser mayor a la inicial.')
	return 0
end if

//Verificar que el día de la semana esté en el rango de fechas
if istr_reservacion.lapso_completo=0 then
	if f_valida_dia_enrango(istr_reservacion.cve_dia,istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)<>1 then
		messagebox('Aviso','El día de la semana debe encontrarse en el rango de fechas.')
		return 0
	end if
end if

return 1

end function

public subroutine uf_nueva_reservacion ();integer li_dias, li_dia, li_i
long ll_num_asignacion,  ll_lapso
ll_num_asignacion = istr_reservacion.num_asignacion

if istr_reservacion.lapso_completo=0 then
	//Reservación única
	if ll_num_asignacion = 0 then ll_num_asignacion = f_select_reservacion_id()
	f_insert_reservacion_temporal_nueva(istr_reservacion,ll_num_asignacion)
else	
	//Reservación para cada día.
	if istr_reservacion.lapso_completo=1 then
		if istr_original.lapso_completo>0 then ll_lapso = istr_original.lapso_completo else ll_lapso = f_select_lapso_completo_max() + 1
		istr_reservacion.lapso_completo=ll_lapso
	end if

	li_dias=DaysAfter(istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)+1
	if li_dias>7 then li_dias=7
	li_dia=DayNumber(istr_reservacion.fecha_inicio) -2

	//Primer día
	li_dia=li_dia+1
	if li_dia=7 then li_dia=0
	istr_reservacion.cve_dia=li_dia
	if ll_num_asignacion = 0 then ll_num_asignacion = f_select_reservacion_id()
	f_insert_reservacion_temporal_nueva(istr_reservacion,ll_num_asignacion)

	//Siguientes días
	for li_i=2 to li_dias
		li_dia=li_dia+1
		if li_dia=7 then li_dia=0
		istr_reservacion.cve_dia=li_dia
		ll_num_asignacion = f_select_reservacion_id()
		f_insert_reservacion_temporal_nueva(istr_reservacion,ll_num_asignacion)
	next

end if

end subroutine

public subroutine uf_sube_controles ();integer li_y
	
li_y = 700
dw_csal_salon_ficha.visible = false
dw_csal_materias.y = dw_csal_materias.y - li_y
dw_csal_materias_profesor.y = dw_csal_materias_profesor.y - li_y
dw_csal_materias_profesor_grupo.y = dw_csal_materias_profesor_grupo.y - li_y
dw_csal_materias_profesores_grupos.y = dw_csal_materias_profesores_grupos.y - li_y
dw_csal_profesor.y = dw_csal_profesor.y - li_y
dw_csal_salones_disponibles.y = dw_csal_salones_disponibles.y - li_y

st_dia.y = st_dia.y - li_y
st_fin.y = st_fin.y - li_y
st_hora.y = st_hora.y - li_y
st_horario.y = st_horario.y - li_y
st_inicio.y = st_inicio.y - li_y
st_libres.y = st_libres.y - li_y
st_nombre_materia.y = st_nombre_materia.y - li_y
st_nombre_profesor.y = st_nombre_profesor.y - li_y
st_observaciones.y = st_observaciones.y - li_y
st_salon.y = st_salon.y - li_y
cbx_periodo.y = cbx_periodo.y - li_y
cb_buscar.y = cb_buscar.y - li_y
cb_reservar.y = cb_reservar.y - li_y
cb_cancelar.y = cb_cancelar.y - li_y
ddlb_dia.y = ddlb_dia.y - li_y
gb_clase.y = gb_clase.y - li_y
mle_observaciones.y = mle_observaciones.y - li_y
rb_materia.y = rb_materia.y - li_y
rb_profesor.y = rb_profesor.y - li_y
sle_materia.y = sle_materia.y - li_y
sle_profesor.y = sle_profesor.y - li_y
em_fecha_final.y = em_fecha_final.y - li_y
em_fecha_inicio.y = em_fecha_inicio.y - li_y
em_hora_final.y = em_hora_final.y - li_y
em_hora_inicio.y = em_hora_inicio.y - li_y

w_csal_salon_temporal.height = w_csal_salon_temporal.height - li_y + 100
end subroutine

public subroutine uf_cancela_salon ();if  istr_original.lapso_completo = 0 then
	f_delete_reservacion_temporal(istr_reservacion.num_asignacion)
else
	f_delete_reservacion_lapso_temporal(istr_original.lapso_completo)
end if

w_csal_prestamo_salon_dia.uf_carga_reservados()	
messagebox('Aviso','Reservación eliminada')
close(this)



end subroutine

on w_csal_salon_temporal.create
this.cb_cancelar=create cb_cancelar
this.cb_buscar=create cb_buscar
this.dw_csal_salones_reservados_lapso=create dw_csal_salones_reservados_lapso
this.dw_csal_salones_fecha_temporales_dia=create dw_csal_salones_fecha_temporales_dia
this.dw_csal_salones_hora_permanentes=create dw_csal_salones_hora_permanentes
this.dw_csal_salones_reservados=create dw_csal_salones_reservados
this.st_nombre_profesor=create st_nombre_profesor
this.st_nombre_materia=create st_nombre_materia
this.dw_csal_materias_profesor_grupo=create dw_csal_materias_profesor_grupo
this.dw_csal_materias_profesores_grupos=create dw_csal_materias_profesores_grupos
this.dw_csal_materias_profesor=create dw_csal_materias_profesor
this.dw_csal_materias=create dw_csal_materias
this.sle_materia=create sle_materia
this.dw_csal_profesor=create dw_csal_profesor
this.rb_materia=create rb_materia
this.sle_profesor=create sle_profesor
this.rb_profesor=create rb_profesor
this.em_fecha_inicio=create em_fecha_inicio
this.em_fecha_final=create em_fecha_final
this.st_inicio=create st_inicio
this.st_fin=create st_fin
this.cbx_periodo=create cbx_periodo
this.st_observaciones=create st_observaciones
this.mle_observaciones=create mle_observaciones
this.cb_reservar=create cb_reservar
this.st_salon=create st_salon
this.dw_csal_salon_activo=create dw_csal_salon_activo
this.dw_csal_salones_disponibles=create dw_csal_salones_disponibles
this.st_libres=create st_libres
this.dw_csal_salon_ficha=create dw_csal_salon_ficha
this.st_dia=create st_dia
this.st_horario=create st_horario
this.st_hora=create st_hora
this.gb_clase=create gb_clase
this.em_hora_inicio=create em_hora_inicio
this.em_hora_final=create em_hora_final
this.ddlb_dia=create ddlb_dia
this.Control[]={this.cb_cancelar,&
this.cb_buscar,&
this.dw_csal_salones_reservados_lapso,&
this.dw_csal_salones_fecha_temporales_dia,&
this.dw_csal_salones_hora_permanentes,&
this.dw_csal_salones_reservados,&
this.st_nombre_profesor,&
this.st_nombre_materia,&
this.dw_csal_materias_profesor_grupo,&
this.dw_csal_materias_profesores_grupos,&
this.dw_csal_materias_profesor,&
this.dw_csal_materias,&
this.sle_materia,&
this.dw_csal_profesor,&
this.rb_materia,&
this.sle_profesor,&
this.rb_profesor,&
this.em_fecha_inicio,&
this.em_fecha_final,&
this.st_inicio,&
this.st_fin,&
this.cbx_periodo,&
this.st_observaciones,&
this.mle_observaciones,&
this.cb_reservar,&
this.st_salon,&
this.dw_csal_salon_activo,&
this.dw_csal_salones_disponibles,&
this.st_libres,&
this.dw_csal_salon_ficha,&
this.st_dia,&
this.st_horario,&
this.st_hora,&
this.gb_clase,&
this.em_hora_inicio,&
this.em_hora_final,&
this.ddlb_dia}
end on

on w_csal_salon_temporal.destroy
destroy(this.cb_cancelar)
destroy(this.cb_buscar)
destroy(this.dw_csal_salones_reservados_lapso)
destroy(this.dw_csal_salones_fecha_temporales_dia)
destroy(this.dw_csal_salones_hora_permanentes)
destroy(this.dw_csal_salones_reservados)
destroy(this.st_nombre_profesor)
destroy(this.st_nombre_materia)
destroy(this.dw_csal_materias_profesor_grupo)
destroy(this.dw_csal_materias_profesores_grupos)
destroy(this.dw_csal_materias_profesor)
destroy(this.dw_csal_materias)
destroy(this.sle_materia)
destroy(this.dw_csal_profesor)
destroy(this.rb_materia)
destroy(this.sle_profesor)
destroy(this.rb_profesor)
destroy(this.em_fecha_inicio)
destroy(this.em_fecha_final)
destroy(this.st_inicio)
destroy(this.st_fin)
destroy(this.cbx_periodo)
destroy(this.st_observaciones)
destroy(this.mle_observaciones)
destroy(this.cb_reservar)
destroy(this.st_salon)
destroy(this.dw_csal_salon_activo)
destroy(this.dw_csal_salones_disponibles)
destroy(this.st_libres)
destroy(this.dw_csal_salon_ficha)
destroy(this.st_dia)
destroy(this.st_horario)
destroy(this.st_hora)
destroy(this.gb_clase)
destroy(this.em_hora_inicio)
destroy(this.em_hora_final)
destroy(this.ddlb_dia)
end on

event open;integer li_row, li_cve_dia, li_dias_lapso, li_k, li_dia_fecha
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



end event

type cb_cancelar from commandbutton within w_csal_salon_temporal
integer x = 3441
integer y = 1453
integer width = 834
integer height = 106
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Cancelar reservación"
end type

event clicked;uf_cancela_salon()
end event

type cb_buscar from commandbutton within w_csal_salon_temporal
integer x = 3259
integer y = 778
integer width = 834
integer height = 106
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Buscar salones"
end type

event clicked;if uf_verifica_fechas() = 1 then uf_actualiza()
end event

type dw_csal_salones_reservados_lapso from datawindow within w_csal_salon_temporal
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

type dw_csal_salones_fecha_temporales_dia from datawindow within w_csal_salon_temporal
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

type dw_csal_salones_hora_permanentes from datawindow within w_csal_salon_temporal
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

type dw_csal_salones_reservados from datawindow within w_csal_salon_temporal
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

type st_nombre_profesor from statictext within w_csal_salon_temporal
integer x = 808
integer y = 1120
integer width = 2436
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
boolean focusrectangle = false
end type

type st_nombre_materia from statictext within w_csal_salon_temporal
integer x = 808
integer y = 1328
integer width = 2439
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
boolean focusrectangle = false
end type

type dw_csal_materias_profesor_grupo from u_basedw within w_csal_salon_temporal
integer x = 3277
integer y = 1203
integer width = 282
integer height = 96
integer taborder = 60
string dataobject = "d_csal_materias_profesor_grupo_drop"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("gpo", "gpo", "gpo")
end event

event itemchanged;call super::itemchanged;integer li_grupos, li_row

istr_reservacion.grupo=this.gettext()

li_grupos=idwc_materias_profesor_grupo.rowcount()
li_row=idwc_materias_profesor_grupo.Find("gpo='"+istr_reservacion.grupo+"'",1,li_grupos)

istr_reservacion.inscritos=idwc_materias_profesor_grupo.GetItemNumber(li_row,"inscritos")	

end event

type dw_csal_materias_profesores_grupos from u_basedw within w_csal_salon_temporal
integer x = 1887
integer y = 1421
integer width = 1360
integer height = 93
integer taborder = 70
string dataobject = "d_csal_materias_profesores_grupos_drop"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("gpo", "gpo", "gpo")
end event

event itemchanged;call super::itemchanged;integer li_grupos, li_row

istr_reservacion.grupo=left(this.gettext(),pos(this.gettext(),'-')-1)
istr_reservacion.cve_profesor=long(right(this.gettext(),len(this.gettext()) -pos(this.gettext(),'-')))
istr_reservacion.profesor=f_select_nombre_profesor(istr_reservacion.cve_profesor)

li_grupos=idwc_materias_profesores_grupos.rowcount()
li_row=idwc_materias_profesores_grupos.Find("gpo='"+istr_reservacion.grupo+"'",1,li_grupos)

istr_reservacion.inscritos=idwc_materias_profesores_grupos.GetItemNumber(li_row,"inscritos")	

end event

type dw_csal_materias_profesor from u_basedw within w_csal_salon_temporal
integer x = 1887
integer y = 1203
integer width = 1360
integer height = 96
integer taborder = 50
string dataobject = "d_csal_materias_profesor_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("materias_materia", "materias_materia", "materias_materia")
end event

event itemchanged;call super::itemchanged;integer li_materias, li_row
long ll_cve_materia

ll_cve_materia=long(this.gettext())

dw_csal_materias_profesor_grupo.Reset()
idwc_materias_profesor_grupo.Reset()

idwc_materias_profesor_grupo.retrieve(istr_reservacion.anio,istr_reservacion.periodo,istr_reservacion.cve_profesor,ll_cve_materia)
if idwc_materias_profesor_grupo.RowCount()>0 then dw_csal_materias_profesor_grupo.insertrow(0)
  
li_materias=idwc_materias_profesor.rowcount()
li_row=idwc_materias_profesor.Find("grupos_cve_mat="+string(ll_cve_materia),1,li_materias)

istr_reservacion.cve_materia=ll_cve_materia
istr_reservacion.materia=idwc_materias_profesor.GetItemString(li_row,"materias_materia")	
istr_reservacion.grupo='NA'
istr_reservacion.inscritos=0


end event

type dw_csal_materias from u_basedw within w_csal_salon_temporal
integer x = 479
integer y = 1421
integer width = 1360
integer height = 93
integer taborder = 60
string dataobject = "d_csal_materia_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("materia", "materia", "materia")
end event

event itemchanged;call super::itemchanged;sle_materia.text=''
st_nombre_materia.text=''

uf_cambio_materia(trim(this.gettext()))

end event

type sle_materia from singlelineedit within w_csal_salon_temporal
integer x = 486
integer y = 1328
integer width = 304
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

event modified;st_nombre_materia.text=''

dw_csal_materias.Reset()
idwc_materias.Reset()
idwc_materias.Retrieve(istr_reservacion.anio,istr_reservacion.periodo)
if idwc_materias.RowCount()>0 then dw_csal_materias.insertrow(0)

uf_cambio_materia(trim(this.text))
end event

type dw_csal_profesor from u_basedw within w_csal_salon_temporal
integer x = 479
integer y = 1210
integer width = 1360
integer height = 93
integer taborder = 50
string dataobject = "d_csal_profesor_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("profesor", "profesor", "profesor")
end event

event itemchanged;call super::itemchanged;sle_profesor.text=''
st_nombre_profesor.text=''

uf_cambio_profesor(trim(this.gettext()))

end event

type rb_materia from radiobutton within w_csal_salon_temporal
integer x = 59
integer y = 1338
integer width = 380
integer height = 77
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Materia"
end type

event clicked;uf_marca_materia()
end event

type sle_profesor from singlelineedit within w_csal_salon_temporal
integer x = 486
integer y = 1120
integer width = 304
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event modified;st_nombre_profesor.text=''

dw_csal_profesor.Reset()
idwc_profesor.Retrieve()
if idwc_profesor.RowCount()>0 then dw_csal_profesor.InsertRow(0)

uf_cambio_profesor(trim(this.text))

end event

type rb_profesor from radiobutton within w_csal_salon_temporal
integer x = 59
integer y = 1123
integer width = 380
integer height = 77
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Profesor"
boolean checked = true
end type

event clicked;uf_marca_profesor()
end event

type em_fecha_inicio from editmask within w_csal_salon_temporal
integer x = 1924
integer y = 781
integer width = 508
integer height = 77
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
boolean border = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean dropdowncalendar = true
end type

event modified;istr_reservacion.fecha_inicio=date(em_fecha_inicio.text)
uf_limpia()
end event

type em_fecha_final from editmask within w_csal_salon_temporal
integer x = 2619
integer y = 781
integer width = 508
integer height = 77
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
boolean border = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean dropdowncalendar = true
end type

event modified;istr_reservacion.fecha_final=date(em_fecha_final.text)
uf_limpia()
end event

type st_inicio from statictext within w_csal_salon_temporal
integer x = 1704
integer y = 781
integer width = 208
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Inicio:"
boolean focusrectangle = false
end type

type st_fin from statictext within w_csal_salon_temporal
integer x = 2472
integer y = 781
integer width = 179
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Fin:"
boolean focusrectangle = false
end type

type cbx_periodo from checkbox within w_csal_salon_temporal
integer x = 1935
integer y = 864
integer width = 1167
integer height = 112
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 553648127
string text = "Todos los días del rango de fechas"
end type

event clicked;integer li_errores=0

if this.checked=true then
	if istr_reservacion.fecha_inicio<> istr_reservacion.fecha_final then
		istr_reservacion.lapso_completo=1
		ddlb_dia.enabled=false
	else
		this.checked=false
	end if
else
	istr_reservacion.lapso_completo=0
	ddlb_dia.enabled=true
	if f_valida_dia_enrango(istr_reservacion.cve_dia,istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)= 0 then uf_cambiar_dia()
end if

uf_limpia()

end event

type st_observaciones from statictext within w_csal_salon_temporal
integer x = 51
integer y = 1619
integer width = 1075
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Tipo de evento, observaciones:"
boolean focusrectangle = false
end type

type mle_observaciones from multilineedit within w_csal_salon_temporal
integer x = 51
integer y = 1706
integer width = 4231
integer height = 221
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean autovscroll = true
textcase textcase = upper!
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

event modified;istr_reservacion.observaciones=trim(this.text)

end event

type cb_reservar from commandbutton within w_csal_salon_temporal
integer x = 3441
integer y = 1584
integer width = 834
integer height = 106
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar reservación"
end type

event clicked;uf_reserva_salon()
end event

type st_salon from statictext within w_csal_salon_temporal
integer x = 2801
integer y = 1587
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

type dw_csal_salon_activo from datawindow within w_csal_salon_temporal
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

type dw_csal_salones_disponibles from datawindow within w_csal_salon_temporal
integer x = 51
integer y = 2048
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

type st_libres from statictext within w_csal_salon_temporal
integer x = 51
integer y = 1971
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

type dw_csal_salon_ficha from datawindow within w_csal_salon_temporal
integer x = 51
integer y = 16
integer width = 4228
integer height = 691
integer taborder = 10
string title = "Ficha de Reservación"
string dataobject = "d_csal_salon_datos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_dia from statictext within w_csal_salon_temporal
integer x = 51
integer y = 781
integer width = 179
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Día:"
boolean focusrectangle = false
end type

type st_horario from statictext within w_csal_salon_temporal
integer x = 805
integer y = 781
integer width = 307
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Horario:"
boolean focusrectangle = false
end type

type st_hora from statictext within w_csal_salon_temporal
integer x = 1243
integer y = 781
integer width = 80
integer height = 80
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

type gb_clase from groupbox within w_csal_salon_temporal
integer x = 48
integer y = 1091
integer width = 410
integer height = 403
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
end type

type em_hora_inicio from editmask within w_csal_salon_temporal
integer x = 1064
integer y = 781
integer width = 179
integer height = 77
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 33554431
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##########"
string minmax = "0~~23"
end type

event modified;istr_reservacion.hora_inicio=integer(trim(em_hora_inicio.text))
uf_limpia()
end event

type em_hora_final from editmask within w_csal_salon_temporal
integer x = 1331
integer y = 781
integer width = 179
integer height = 77
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##########"
string minmax = "0~~23"
end type

event modified;istr_reservacion.hora_final=integer(trim(em_hora_final.text))
uf_limpia()
end event

type ddlb_dia from dropdownlistbox within w_csal_salon_temporal
integer x = 256
integer y = 794
integer width = 486
integer height = 570
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 33554431
boolean allowedit = true
boolean sorted = false
string item[] = {"Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;istr_reservacion.cve_dia=(index -1)
if f_valida_dia_enrango(istr_reservacion.cve_dia,istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)= 0 then uf_cambiar_dia()

uf_limpia()
end event

