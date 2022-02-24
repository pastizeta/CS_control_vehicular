$PBExportHeader$w_csal_salones_reservar.srw
forward
global type w_csal_salones_reservar from window
end type
type cb_1 from commandbutton within w_csal_salones_reservar
end type
type st_nombre_materia from statictext within w_csal_salones_reservar
end type
type st_nombre_profesor from statictext within w_csal_salones_reservar
end type
type sle_materia from singlelineedit within w_csal_salones_reservar
end type
type sle_profesor from singlelineedit within w_csal_salones_reservar
end type
type st_mensaje from statictext within w_csal_salones_reservar
end type
type dw_csal_profesor from u_basedw within w_csal_salones_reservar
end type
type dw_csal_materias_profesores_grupos from u_basedw within w_csal_salones_reservar
end type
type dw_csal_materias from u_basedw within w_csal_salones_reservar
end type
type rb_materia from radiobutton within w_csal_salones_reservar
end type
type rb_profesor from radiobutton within w_csal_salones_reservar
end type
type dw_csal_materias_profesor_grupo from u_basedw within w_csal_salones_reservar
end type
type dw_csal_materias_profesor from u_basedw within w_csal_salones_reservar
end type
type st_salon from statictext within w_csal_salones_reservar
end type
type st_dia from statictext within w_csal_salones_reservar
end type
type st_1 from statictext within w_csal_salones_reservar
end type
type dw_csal_salones_reservados_lapso from datawindow within w_csal_salones_reservar
end type
type cbx_periodo from checkbox within w_csal_salones_reservar
end type
type st_fin from statictext within w_csal_salones_reservar
end type
type st_inicio from statictext within w_csal_salones_reservar
end type
type st_error from statictext within w_csal_salones_reservar
end type
type mle_observaciones from multilineedit within w_csal_salones_reservar
end type
type em_hora_inicio from editmask within w_csal_salones_reservar
end type
type ddlb_dia from dropdownlistbox within w_csal_salones_reservar
end type
type em_hora_final from editmask within w_csal_salones_reservar
end type
type rb_temporal from radiobutton within w_csal_salones_reservar
end type
type st_7 from statictext within w_csal_salones_reservar
end type
type st_6 from statictext within w_csal_salones_reservar
end type
type st_4 from statictext within w_csal_salones_reservar
end type
type dw_csal_salones_disponibles from datawindow within w_csal_salones_reservar
end type
type dw_csal_salon_activo from datawindow within w_csal_salones_reservar
end type
type st_libres from statictext within w_csal_salones_reservar
end type
type st_reservados from statictext within w_csal_salones_reservar
end type
type gb_reservacion from groupbox within w_csal_salones_reservar
end type
type gb_dia from groupbox within w_csal_salones_reservar
end type
type dw_csal_salones_reservados from datawindow within w_csal_salones_reservar
end type
type gb_observaciones from groupbox within w_csal_salones_reservar
end type
type gb_1 from groupbox within w_csal_salones_reservar
end type
type gb_horario from groupbox within w_csal_salones_reservar
end type
type mc_fecha_final from monthcalendar within w_csal_salones_reservar
end type
type mc_fecha_inicio from monthcalendar within w_csal_salones_reservar
end type
type cb_reservar from commandbutton within w_csal_salones_reservar
end type
type cb_refrescar from commandbutton within w_csal_salones_reservar
end type
type dw_csal_salones_fecha_temporales_dia from datawindow within w_csal_salones_reservar
end type
type dw_csal_salones_hora_permanentes from datawindow within w_csal_salones_reservar
end type
type dw_csal_salones_hora_temporales_dia from datawindow within w_csal_salones_reservar
end type
type em_fecha_final from editmask within w_csal_salones_reservar
end type
type rb_cambio from radiobutton within w_csal_salones_reservar
end type
type st_periodo from statictext within w_csal_salones_reservar
end type
type gb_empleado from groupbox within w_csal_salones_reservar
end type
type em_fecha_inicio from editmask within w_csal_salones_reservar
end type
end forward

global type w_csal_salones_reservar from window
integer width = 6579
integer height = 2973
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
st_nombre_materia st_nombre_materia
st_nombre_profesor st_nombre_profesor
sle_materia sle_materia
sle_profesor sle_profesor
st_mensaje st_mensaje
dw_csal_profesor dw_csal_profesor
dw_csal_materias_profesores_grupos dw_csal_materias_profesores_grupos
dw_csal_materias dw_csal_materias
rb_materia rb_materia
rb_profesor rb_profesor
dw_csal_materias_profesor_grupo dw_csal_materias_profesor_grupo
dw_csal_materias_profesor dw_csal_materias_profesor
st_salon st_salon
st_dia st_dia
st_1 st_1
dw_csal_salones_reservados_lapso dw_csal_salones_reservados_lapso
cbx_periodo cbx_periodo
st_fin st_fin
st_inicio st_inicio
st_error st_error
mle_observaciones mle_observaciones
em_hora_inicio em_hora_inicio
ddlb_dia ddlb_dia
em_hora_final em_hora_final
rb_temporal rb_temporal
st_7 st_7
st_6 st_6
st_4 st_4
dw_csal_salones_disponibles dw_csal_salones_disponibles
dw_csal_salon_activo dw_csal_salon_activo
st_libres st_libres
st_reservados st_reservados
gb_reservacion gb_reservacion
gb_dia gb_dia
dw_csal_salones_reservados dw_csal_salones_reservados
gb_observaciones gb_observaciones
gb_1 gb_1
gb_horario gb_horario
mc_fecha_final mc_fecha_final
mc_fecha_inicio mc_fecha_inicio
cb_reservar cb_reservar
cb_refrescar cb_refrescar
dw_csal_salones_fecha_temporales_dia dw_csal_salones_fecha_temporales_dia
dw_csal_salones_hora_permanentes dw_csal_salones_hora_permanentes
dw_csal_salones_hora_temporales_dia dw_csal_salones_hora_temporales_dia
em_fecha_final em_fecha_final
rb_cambio rb_cambio
st_periodo st_periodo
gb_empleado gb_empleado
em_fecha_inicio em_fecha_inicio
end type
global w_csal_salones_reservar w_csal_salones_reservar

type variables
str_csal_salones_reservacion istr_reservacion

//Temporal 1 Cambio, 2 Temporal, 3 Prereservacion Extraordinaria 

string is_error_hora='', is_error_fecha='', is_error_dia=''

string is_sort_reservados="#17A #5A #1A", is_sort_disponibles="#1A"

DatawindowChild idwc_materias_profesor, idwc_materias_profesor_grupo
DatawindowChild idwc_materias, idwc_materias_profesores_grupos
DatawindowChild idwc_profesor, idw_incidencia


integer ii_lapso_foco=0

end variables

forward prototypes
public subroutine uf_carga_reservados ()
public subroutine uf_carga_libres ()
public function string uf_nombre_dia (integer p_dia)
public subroutine uf_actualiza ()
public subroutine uf_carga_reservacion_cambio (integer pi_row)
public subroutine uf_apaga_fecha_inicio ()
public subroutine uf_apaga_fecha_final ()
public subroutine uf_cambio_fecha (date pd_fecha)
public subroutine uf_cambio_hora ()
public subroutine uf_limpiar ()
public subroutine uf_cambiar_dia ()
public subroutine uf_cambio_profesor (string ps_texto)
public subroutine uf_cambio_materia (string ps_texto)
end prototypes

public subroutine uf_carga_reservados ();integer li_i, li_control=0, li_materia, li_temp_dia, li_perma_dia, li_lapso_actual, li_total=0, li_tempo=0
integer li_j, li_lapso=0, li_dias, li_dia, li_cve_dia, li_k, li_dia_fecha, li_dias_lapso
date ld_fecha_inicio, ld_fecha_final, ld_fecha
string ls_lapso, ls_fecha, ls_titulo

ls_titulo=this.title
this.title='Cargando...'
SetPointer(HourGlass!)

st_reservados.text="Salones Ocupados: 0"
dw_csal_salones_reservados.reset()
dw_csal_salones_reservados.SetReDraw(false)


if istr_reservacion.temporal=1 then
	
	//Hacer Reservación Permanente
	
	dw_csal_salones_hora_temporales_dia.retrieve(istr_reservacion.periodo,istr_reservacion.anio,istr_reservacion.cve_dia,today(),istr_reservacion.hora_inicio,istr_reservacion.hora_final)
	dw_csal_salones_hora_permanentes.retrieve(istr_reservacion.periodo,istr_reservacion.anio,istr_reservacion.cve_dia,istr_reservacion.hora_inicio,istr_reservacion.hora_final)

	li_temp_dia=dw_csal_salones_hora_temporales_dia.rowcount()
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
			dw_csal_salones_reservados.SetItem(li_control, "lapso_completo",0)
	
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
			dw_csal_salones_reservados.SetItem(li_control, "cve_salon", dw_csal_salones_hora_temporales_dia.GetItemString(li_i,"cve_salon"))	
			dw_csal_salones_reservados.SetItem(li_control, "cve_materia", dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"cve_materia"))	
			dw_csal_salones_reservados.SetItem(li_control, "cve_profesor", dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"cve_profesor"))	
			dw_csal_salones_reservados.SetItem(li_control, "cve_dia", dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"cve_dia"))	
			dw_csal_salones_reservados.SetItem(li_control, "hora_inicio", dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"hora_inicio"))	
			dw_csal_salones_reservados.SetItem(li_control, "hora_final", dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"hora_final"))	
			dw_csal_salones_reservados.SetItem(li_control, "num_asignacion", dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"num_asignacion"))	
			dw_csal_salones_reservados.SetItem(li_control, "fecha_movimiento", dw_csal_salones_hora_temporales_dia.GetItemDateTime(li_i,"fecha_movimiento"))	
		 	dw_csal_salones_reservados.SetItem(li_control, "fecha_inicio", dw_csal_salones_hora_temporales_dia.GetItemDateTime(li_i,"fecha_inicio"))		
			dw_csal_salones_reservados.SetItem(li_control, "fecha_final",  dw_csal_salones_hora_temporales_dia.GetItemDateTime(li_i,"fecha_final"))	
			dw_csal_salones_reservados.SetItem(li_control, "cve_grupo", dw_csal_salones_hora_temporales_dia.GetItemString(li_i,"cve_grupo"))	
			dw_csal_salones_reservados.SetItem(li_control, "estatus", dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"estatus"))
			dw_csal_salones_reservados.SetItem(li_control, "lapso_completo", dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"lapso_completo"))	
			dw_csal_salones_reservados.SetItem(li_control, "observaciones", dw_csal_salones_hora_temporales_dia.GetItemString(li_i,"observaciones"))	
			dw_csal_salones_reservados.SetItem(li_control, "tipo_reservacion",f_select_nombre_estatus(dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"estatus")))		

			ld_fecha_inicio=date(dw_csal_salones_hora_temporales_dia.GetItemDateTime(li_i,"fecha_inicio"))
			ld_fecha_final=date(dw_csal_salones_hora_temporales_dia.GetItemDateTime(li_i,"fecha_final"))
			
			if (dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"lapso_completo"))=0 then	
				
				li_cve_dia=dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"cve_dia")
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
				dw_csal_salones_reservados.SetItem(li_control, "lapso",'lap1'/*ls_lapso*/)
				
			else
				dw_csal_salones_reservados.SetItem(li_control, "nom_dia",'TODOS')
				dw_csal_salones_reservados.SetItem(li_control,"cve_dia",-1)
				dw_csal_salones_reservados.SetItem(li_control, "lapso",'lap2'/*f_convierte_fecha_texto(ld_fecha_inicio)+' AL '+f_convierte_fecha_texto(ld_fecha_final)*/)
			end if
			
			dw_csal_salones_reservados.SetItem(li_control, "horario",string(dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"hora_final")))
			dw_csal_salones_reservados.SetItem(li_control, "nom_profesor",f_select_nombre_profesor(dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"cve_profesor")))		
			li_materia=dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"cve_materia")	
			if li_materia=0 then  dw_csal_salones_reservados.SetItem(li_control, "nom_materia","NO ASIGNADA") else	dw_csal_salones_reservados.SetItem(li_control, "nom_materia",f_select_nombre_materia(dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"cve_materia")))  
			if f_valida_tiene_asimiladas(dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"cve_materia"),dw_csal_salones_hora_temporales_dia.GetItemString(li_i,"cve_grupo"),istr_reservacion.periodo,istr_reservacion.anio)>0 then dw_csal_salones_reservados.SetItem(li_control, "asimiladas",'**')
			if f_valida_es_asimilada(dw_csal_salones_hora_temporales_dia.GetItemNumber(li_i,"cve_materia"),dw_csal_salones_hora_temporales_dia.GetItemString(li_i,"cve_grupo"),istr_reservacion.periodo,istr_reservacion.anio)>0 then dw_csal_salones_reservados.SetItem(li_control, "asimiladas",'*')

		next
		
else
	
	
	if istr_reservacion.lapso_completo=0 then
		
		//Sólo el día marcado

		//Hacer Reservación Temporal
	//	messagebox('',string(istr_reservacion.periodo)+' '+string(istr_reservacion.anio)+' '+string(istr_reservacion.cve_dia) +' ' +string(istr_reservacion.hora_inicio)+' '+string(istr_reservacion.hora_final)+' '+string(istr_reservacion.fecha_inicio)+' '+string(istr_reservacion.fecha_final))
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
			

			//Lapso completo
			
			//Hacer Reservación Temporal para todos los días del rango de fechas
			
			li_dias=DaysAfter(istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)+1
			
			if li_dias>7 then li_dias=7
		
			li_dia=DayNumber(istr_reservacion.fecha_inicio) -2

			for li_j=1 to li_dias
				
				li_dia=li_dia+1
			
				if li_dia=7 then li_dia=0
			
				//Permanentes
				
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

				//Temporales
				
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
	
end if

dw_csal_salones_reservados.SetSort(is_sort_reservados)
dw_csal_salones_reservados.Sort()
dw_csal_salones_reservados.SetReDraw(true)

li_total=dw_csal_salones_reservados.rowcount()
li_tempo=li_total - li_perma_dia
this.title=ls_titulo
st_reservados.text="Salones Ocupados: "+string(li_total)+" (Permanentes: "+string(li_perma_dia)+", Temporales: "+string(li_tempo)+")"
SetPointer(Arrow!)

end subroutine

public subroutine uf_carga_libres ();integer li_activos, li_i, li_j=0, li_permanente, li_estatus, li_row, li_num_asignacion
integer li_temp_dia, li_perma_dia,  li_cupo_real, li_reservados
string ls_salon, ls_observaciones, ls_clase_aula
integer li_periodo_inicio, li_periodo_final, li_anio_inicio, li_anio_final
integer li_periodo_hoy, li_anio_hoy

istr_reservacion.salon=''
istr_reservacion.cupo_real=0
st_salon.text='Salón: ----'
st_libres.text='Cargando...'
SetPointer(HourGlass!)

dw_csal_salones_disponibles.reset()
dw_csal_salones_disponibles.SetReDraw(false)	

dw_csal_salon_activo.SetFilter('')
dw_csal_salon_activo.Filter()
dw_csal_salon_activo.retrieve()

if istr_reservacion.temporal = 1 then
	dw_csal_salon_activo.SetFilter("clase_aula = 'SALON'")
	dw_csal_salon_activo.Filter()
end if

//Verificar que si es reservación extraordinaria fuera de periodo
f_select_anio_periodo_actual(li_periodo_inicio,li_anio_inicio,istr_reservacion.fecha_inicio)
f_select_anio_periodo_actual(li_periodo_final,li_anio_final,istr_reservacion.fecha_final)
f_select_anio_periodo_actual(li_periodo_hoy,li_anio_hoy,today())

li_activos=dw_csal_salon_activo.rowcount()
li_reservados=dw_csal_salones_reservados.rowcount()

	for li_i=1 to li_activos
		
		ls_salon=dw_csal_salon_activo.GetItemString(li_i,"cve_salon")
		li_cupo_real=dw_csal_salon_activo.GetItemNumber(li_i,"cupo_real")
		ls_clase_aula=dw_csal_salon_activo.GetItemString(li_i,"clase_aula")
		li_estatus=0
		ls_observaciones=''		
			
			//Verificar si hay extraordinarios si hay temporales ese dia y hora en otra fecha
			
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


st_libres.text="Salones Disponibles: "+string(dw_csal_salones_disponibles.rowcount())
SetPointer(Arrow!)

dw_csal_salones_disponibles.SetReDraw(true)	

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

public subroutine uf_actualiza ();	istr_reservacion.dia=uf_nombre_dia(istr_reservacion.cve_dia)

	dw_csal_salon_activo.reset()
	dw_csal_salones_hora_permanentes.reset()
	dw_csal_salones_hora_temporales_dia.reset()
	dw_csal_salones_fecha_temporales_dia.reset() 
	dw_csal_salones_reservados_lapso.reset()
	
	dw_csal_salon_activo.SetReDraw(false)
	dw_csal_salones_hora_permanentes.SetReDraw(false)
	dw_csal_salones_hora_temporales_dia.SetReDraw(false)
	dw_csal_salones_fecha_temporales_dia.SetReDraw(false)
	dw_csal_salones_reservados_lapso.SetReDraw(false)
			 

	uf_carga_reservados()	
	uf_carga_libres()	
	
	dw_csal_salon_activo.SetReDraw(true) 
	dw_csal_salones_hora_permanentes.SetReDraw(true)
	dw_csal_salones_hora_temporales_dia.SetReDraw(true)
	dw_csal_salones_fecha_temporales_dia.SetReDraw(true)
	dw_csal_salones_reservados_lapso.SetReDraw(true)
	

end subroutine

public subroutine uf_carga_reservacion_cambio (integer pi_row);string ls_tipo_reservacion
integer li_reservados, li_foco
str_csal_salones_reservacion lstr_reservacion

this.title="Cambio de Salón Permanente"

ddlb_dia.enabled=false
em_hora_inicio.enabled=false
em_hora_final.enabled=false

em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
cbx_periodo.enabled=false
cbx_periodo.checked=false
rb_cambio.checked=true
rb_cambio.visible=true
rb_cambio.enabled=true 
rb_temporal.checked=false
rb_temporal.enabled=false
st_dia.visible=false
st_periodo.visible=true

rb_materia.checked=false
rb_materia.enabled=false
rb_profesor.checked=true
rb_profesor.enabled=false

sle_profesor.enabled=false
dw_csal_profesor.enabled=false

dw_csal_materias_profesor.enabled=false
dw_csal_materias_profesor_grupo.enabled=false

sle_materia.enabled=false
dw_csal_materias.enabled=false

dw_csal_materias_profesores_grupos.enabled=false
dw_csal_materias_profesor.reset()
dw_csal_materias_profesor_grupo.reset()

sle_materia.text=''
dw_csal_materias.reset()
dw_csal_materias_profesores_grupos.reset()

cb_reservar.text='Cambiar'

istr_reservacion.lapso_completo=0
istr_reservacion.temporal=1 
istr_reservacion.num_asignacion=dw_csal_salones_reservados.GetItemNumber(pi_row,"num_asignacion") 
istr_reservacion.materia=dw_csal_salones_reservados.GetItemString(pi_row,"nom_materia") 
istr_reservacion.cve_materia=dw_csal_salones_reservados.GetItemNumber(pi_row,"cve_materia") 
istr_reservacion.profesor=dw_csal_salones_reservados.GetItemString(pi_row,"nom_profesor") 
istr_reservacion.cve_profesor=dw_csal_salones_reservados.GetItemNumber(pi_row,"cve_profesor") 
istr_reservacion.dia=f_select_nombre_dia(dw_csal_salones_reservados.GetItemNumber(pi_row,"cve_dia"))
istr_reservacion.cve_dia=dw_csal_salones_reservados.GetItemNumber(pi_row,"cve_dia")
istr_reservacion.hora_inicio=dw_csal_salones_reservados.GetItemNumber(pi_row,"hora_inicio")
istr_reservacion.hora_final=dw_csal_salones_reservados.GetItemNumber(pi_row,"hora_final")
istr_reservacion.grupo=dw_csal_salones_reservados.GetItemString(pi_row,"cve_grupo")
istr_reservacion.salon_anterior=dw_csal_salones_reservados.GetItemString(pi_row,"cve_salon") 
istr_reservacion.observaciones=dw_csal_salones_reservados.GetItemString(pi_row,"observaciones") 

ddlb_dia.SelectItem(istr_reservacion.dia,1) 
em_hora_inicio.text=string(istr_reservacion.hora_inicio)
em_hora_final.text=string(istr_reservacion.hora_final)

st_nombre_profesor.text=string(istr_reservacion.profesor)
mle_observaciones.text=string(istr_reservacion.observaciones)
	
st_nombre_materia.text=istr_reservacion.materia + ' Grupo: ' + istr_reservacion.grupo


uf_actualiza()

li_reservados=dw_csal_salones_reservados.rowcount()
li_foco=dw_csal_salones_reservados.Find("cve_salon='"+istr_reservacion.salon_anterior+"' and cve_dia="+string(istr_reservacion.cve_dia)+" and hora_inicio="+string(istr_reservacion.hora_inicio),1,li_reservados)
if li_foco>0 then dw_csal_salones_reservados.ScrollToRow(li_foco)

end subroutine

public subroutine uf_apaga_fecha_inicio ();mc_fecha_inicio.visible=false
end subroutine

public subroutine uf_apaga_fecha_final ();mc_fecha_final.visible=false
end subroutine

public subroutine uf_cambio_fecha (date pd_fecha);integer li_periodo_inicio, li_periodo_final, li_anio_inicio, li_anio_final
integer li_periodo_hoy, li_anio_hoy, li_i, li_errores=0
integer li_error_dia=1
string ls_inicio=''


st_libres.text="Salones Disponibles: 0"
st_reservados.text="Salones Ocupados: 0"
istr_reservacion.salon=''
istr_reservacion.cupo_real=0
st_salon.text='Salón: ----'
dw_csal_salones_disponibles.Reset()
dw_csal_salones_reservados.Reset()	

is_error_fecha=''
is_error_dia=''


if istr_reservacion.fecha_inicio=istr_reservacion.fecha_final and cbx_periodo.checked=true then
	cbx_periodo.checked=false
	istr_reservacion.lapso_completo=0
	ddlb_dia.enabled=true
	st_dia.visible=false
end if

//Verificar que el rango de fechas se encuentra en el periodo actual
f_select_anio_periodo_actual(li_periodo_inicio,li_anio_inicio,istr_reservacion.fecha_inicio)
f_select_anio_periodo_actual(li_periodo_final,li_anio_final,istr_reservacion.fecha_final)
f_select_anio_periodo_actual(li_periodo_hoy,li_anio_hoy,today())

if li_periodo_inicio=li_periodo_final and li_periodo_inicio=li_periodo_hoy and li_anio_inicio=li_anio_final and li_anio_inicio=li_anio_hoy and li_anio_hoy>0 then
	li_errores=0
	istr_reservacion.anio=li_anio_hoy
	istr_reservacion.periodo=li_periodo_hoy
else
	is_error_fecha='Para reservaciones temporales y cambio de salón las fechas deben encontrarse en el periodo escolar actual.'

	SetNull(istr_reservacion.periodo)
	SetNull(istr_reservacion.anio)
	
	sle_profesor.text=''
	st_nombre_profesor.text=''
	dw_csal_profesor.Reset()
	dw_csal_materias_profesor.Reset()
	dw_csal_materias_profesor_grupo.Reset()
	
	sle_materia.text=''
	st_nombre_materia.text=''
	dw_csal_materias.Reset()
	dw_csal_materias_profesores_grupos.Reset()
		
	idwc_materias_profesor.Reset() 
	idwc_materias_profesor_grupo.Reset()
	idwc_materias.Reset() 
	idwc_materias_profesores_grupos.Reset()
	
	istr_reservacion.profesor=''
	istr_reservacion.materia=''
	istr_reservacion.grupo=''
	istr_reservacion.cve_materia=0
	istr_reservacion.cve_profesor=0
	
	li_errores=1
	goto salir
	
end if

//Verificar que la fecha inicial sea mayor o igual que hoy
if istr_reservacion.fecha_inicio>=today() then 
	li_errores=0
else
	is_error_fecha= 'Las fechas deben se mayor al día de hoy.'
	li_errores=1
	goto salir		
end if

//Verificar que la fecha final sea mayor a la fecha inicial
if istr_reservacion.fecha_inicio<=istr_reservacion.fecha_final then 
	li_errores=0
else
	is_error_fecha= 'La fecha final debe ser mayor a la inicial.'
	li_errores=1
	goto salir	
end if

//Verificar que el día de la semana esté en el rango de fechas

if istr_reservacion.lapso_completo=0 then
	
	if f_valida_dia_enrango(istr_reservacion.cve_dia,istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)=1 then li_error_dia=0

	if li_error_dia=1 then
		is_error_dia= 'El día de la semana seleccionado debe encontrarse dentro del rango de fechas.'
		li_errores=1
		goto salir
	end if
	
end if


if is_error_hora<>'' then li_errores=1

salir:

st_mensaje.text=string(istr_reservacion.anio)+' '+string(istr_reservacion.periodo)

st_error.text=trim(ls_inicio+' '+is_error_dia+' '+is_error_fecha+' '+is_error_hora)

if li_errores=1 then
	cb_reservar.enabled=false
	cb_refrescar.enabled=false
	ls_inicio='Error:'
else
	uf_actualiza()
	cb_reservar.enabled=true
	cb_refrescar.enabled=true
end if
	
rb_temporal.SetFocus()




end subroutine

public subroutine uf_cambio_hora ();integer li_errores=0
string ls_inicio=''

st_libres.text="Salones Disponibles: 0"
st_reservados.text="Salones Ocupados: 0"
istr_reservacion.salon=''
istr_reservacion.cupo_real=0
st_salon.text='Salón: ----'
dw_csal_salones_disponibles.Reset()
dw_csal_salones_reservados.Reset()	

is_error_hora=''

if istr_reservacion.hora_final<=istr_reservacion.hora_inicio or istr_reservacion.hora_final>23 then
	is_error_hora= 'La hora final debe ser mayor a la inicial, con diferencia de al menos una hora.'
	li_errores=1	
end if

if is_error_fecha<>'' or is_error_dia<>'' then li_errores=1


if li_errores=1 then
	cb_reservar.enabled=false
	cb_refrescar.enabled=false
	ls_inicio='Error:'
else
	uf_actualiza()
	cb_reservar.enabled=true
	cb_refrescar.enabled=true
end if
	
rb_temporal.SetFocus()

st_error.text=trim(ls_inicio+' '+is_error_dia+' '+is_error_fecha+' '+is_error_hora)

end subroutine

public subroutine uf_limpiar ();if istr_reservacion.temporal=1 then 
	
	this.title="Reservación Temporal de Salón"
	istr_reservacion.temporal=2  
	em_fecha_inicio.enabled=true
	em_fecha_final.enabled=true
	cbx_periodo.enabled=true
	cbx_periodo.checked=false
	cb_reservar.text='Reservar'
	
	rb_cambio.checked=false
	rb_cambio.visible=false
	rb_cambio.enabled=false
	rb_temporal.checked=true
	rb_temporal.enabled=true
	st_periodo.visible=false

	ddlb_dia.enabled=true
	st_dia.visible=false
	em_hora_inicio.enabled=true
	em_hora_final.enabled=true
	
end if

istr_reservacion.salon_anterior=''
istr_reservacion.num_asignacion=0
istr_reservacion.materia=''
istr_reservacion.cve_materia=0
istr_reservacion.profesor=''
istr_reservacion.cve_profesor=0
istr_reservacion.grupo=''
istr_reservacion.observaciones=''

mle_observaciones.text=''

rb_profesor.checked=true
rb_profesor.enabled=true
rb_materia.checked=false
rb_materia.enabled=true

sle_profesor.enabled=true
dw_csal_profesor.enabled=true

dw_csal_materias_profesor.enabled=true
dw_csal_materias_profesor_grupo.enabled=true

sle_materia.enabled=false
dw_csal_materias.enabled=false
dw_csal_materias_profesores_grupos.enabled=false

sle_profesor.text=''
st_nombre_profesor.text=''
dw_csal_profesor.SetRedraw(false)
dw_csal_profesor.Reset()
idwc_profesor.Retrieve()
if idwc_profesor.RowCount()>0 then dw_csal_profesor.InsertRow(0)
dw_csal_profesor.SetRedraw(true)

dw_csal_materias_profesor.reset()
dw_csal_materias_profesor_grupo.reset()

sle_materia.text=''
st_nombre_materia.text=''
dw_csal_materias.reset()
dw_csal_materias_profesores_grupos.reset()
	
uf_carga_libres()
end subroutine

public subroutine uf_cambiar_dia ();date ld_hoy, ld_fecha
integer li_i, li_numero


ld_hoy=today()

for li_i=1 to 7
				
	ld_fecha=RelativeDate(ld_hoy,li_i -1)
	li_numero=DayNumber(ld_fecha) -1
	
	if li_numero=istr_reservacion.cve_dia then 
	
		//Actualizar Inicio
					
		mc_fecha_inicio.SetSelectedDate(ld_fecha)
		em_fecha_inicio.text=string(ld_fecha)
		istr_reservacion.fecha_inicio=ld_fecha
					
		//Actualizar Final
					
		mc_fecha_final.SetSelectedDate(ld_fecha)
		em_fecha_final.text=string(ld_fecha)
		istr_reservacion.fecha_final=ld_fecha

		is_error_fecha=''
		is_error_dia=''
					
  	end if
				
next
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

on w_csal_salones_reservar.create
this.cb_1=create cb_1
this.st_nombre_materia=create st_nombre_materia
this.st_nombre_profesor=create st_nombre_profesor
this.sle_materia=create sle_materia
this.sle_profesor=create sle_profesor
this.st_mensaje=create st_mensaje
this.dw_csal_profesor=create dw_csal_profesor
this.dw_csal_materias_profesores_grupos=create dw_csal_materias_profesores_grupos
this.dw_csal_materias=create dw_csal_materias
this.rb_materia=create rb_materia
this.rb_profesor=create rb_profesor
this.dw_csal_materias_profesor_grupo=create dw_csal_materias_profesor_grupo
this.dw_csal_materias_profesor=create dw_csal_materias_profesor
this.st_salon=create st_salon
this.st_dia=create st_dia
this.st_1=create st_1
this.dw_csal_salones_reservados_lapso=create dw_csal_salones_reservados_lapso
this.cbx_periodo=create cbx_periodo
this.st_fin=create st_fin
this.st_inicio=create st_inicio
this.st_error=create st_error
this.mle_observaciones=create mle_observaciones
this.em_hora_inicio=create em_hora_inicio
this.ddlb_dia=create ddlb_dia
this.em_hora_final=create em_hora_final
this.rb_temporal=create rb_temporal
this.st_7=create st_7
this.st_6=create st_6
this.st_4=create st_4
this.dw_csal_salones_disponibles=create dw_csal_salones_disponibles
this.dw_csal_salon_activo=create dw_csal_salon_activo
this.st_libres=create st_libres
this.st_reservados=create st_reservados
this.gb_reservacion=create gb_reservacion
this.gb_dia=create gb_dia
this.dw_csal_salones_reservados=create dw_csal_salones_reservados
this.gb_observaciones=create gb_observaciones
this.gb_1=create gb_1
this.gb_horario=create gb_horario
this.mc_fecha_final=create mc_fecha_final
this.mc_fecha_inicio=create mc_fecha_inicio
this.cb_reservar=create cb_reservar
this.cb_refrescar=create cb_refrescar
this.dw_csal_salones_fecha_temporales_dia=create dw_csal_salones_fecha_temporales_dia
this.dw_csal_salones_hora_permanentes=create dw_csal_salones_hora_permanentes
this.dw_csal_salones_hora_temporales_dia=create dw_csal_salones_hora_temporales_dia
this.em_fecha_final=create em_fecha_final
this.rb_cambio=create rb_cambio
this.st_periodo=create st_periodo
this.gb_empleado=create gb_empleado
this.em_fecha_inicio=create em_fecha_inicio
this.Control[]={this.cb_1,&
this.st_nombre_materia,&
this.st_nombre_profesor,&
this.sle_materia,&
this.sle_profesor,&
this.st_mensaje,&
this.dw_csal_profesor,&
this.dw_csal_materias_profesores_grupos,&
this.dw_csal_materias,&
this.rb_materia,&
this.rb_profesor,&
this.dw_csal_materias_profesor_grupo,&
this.dw_csal_materias_profesor,&
this.st_salon,&
this.st_dia,&
this.st_1,&
this.dw_csal_salones_reservados_lapso,&
this.cbx_periodo,&
this.st_fin,&
this.st_inicio,&
this.st_error,&
this.mle_observaciones,&
this.em_hora_inicio,&
this.ddlb_dia,&
this.em_hora_final,&
this.rb_temporal,&
this.st_7,&
this.st_6,&
this.st_4,&
this.dw_csal_salones_disponibles,&
this.dw_csal_salon_activo,&
this.st_libres,&
this.st_reservados,&
this.gb_reservacion,&
this.gb_dia,&
this.dw_csal_salones_reservados,&
this.gb_observaciones,&
this.gb_1,&
this.gb_horario,&
this.mc_fecha_final,&
this.mc_fecha_inicio,&
this.cb_reservar,&
this.cb_refrescar,&
this.dw_csal_salones_fecha_temporales_dia,&
this.dw_csal_salones_hora_permanentes,&
this.dw_csal_salones_hora_temporales_dia,&
this.em_fecha_final,&
this.rb_cambio,&
this.st_periodo,&
this.gb_empleado,&
this.em_fecha_inicio}
end on

on w_csal_salones_reservar.destroy
destroy(this.cb_1)
destroy(this.st_nombre_materia)
destroy(this.st_nombre_profesor)
destroy(this.sle_materia)
destroy(this.sle_profesor)
destroy(this.st_mensaje)
destroy(this.dw_csal_profesor)
destroy(this.dw_csal_materias_profesores_grupos)
destroy(this.dw_csal_materias)
destroy(this.rb_materia)
destroy(this.rb_profesor)
destroy(this.dw_csal_materias_profesor_grupo)
destroy(this.dw_csal_materias_profesor)
destroy(this.st_salon)
destroy(this.st_dia)
destroy(this.st_1)
destroy(this.dw_csal_salones_reservados_lapso)
destroy(this.cbx_periodo)
destroy(this.st_fin)
destroy(this.st_inicio)
destroy(this.st_error)
destroy(this.mle_observaciones)
destroy(this.em_hora_inicio)
destroy(this.ddlb_dia)
destroy(this.em_hora_final)
destroy(this.rb_temporal)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.dw_csal_salones_disponibles)
destroy(this.dw_csal_salon_activo)
destroy(this.st_libres)
destroy(this.st_reservados)
destroy(this.gb_reservacion)
destroy(this.gb_dia)
destroy(this.dw_csal_salones_reservados)
destroy(this.gb_observaciones)
destroy(this.gb_1)
destroy(this.gb_horario)
destroy(this.mc_fecha_final)
destroy(this.mc_fecha_inicio)
destroy(this.cb_reservar)
destroy(this.cb_refrescar)
destroy(this.dw_csal_salones_fecha_temporales_dia)
destroy(this.dw_csal_salones_hora_permanentes)
destroy(this.dw_csal_salones_hora_temporales_dia)
destroy(this.em_fecha_final)
destroy(this.rb_cambio)
destroy(this.st_periodo)
destroy(this.gb_empleado)
destroy(this.em_fecha_inicio)
end on

event open;integer li_periodo_fecha, li_anio_fecha, ii_actual=0
istr_reservacion =message.powerobjectparm
 
istr_reservacion.temporal=2
istr_reservacion.lapso_completo=0
ddlb_dia.SelectItem(istr_reservacion.dia,1)

em_hora_inicio.text= string(istr_reservacion.hora_inicio)
em_hora_final.text= string(istr_reservacion.hora_final)
rb_cambio.visible=false

em_fecha_inicio.text=string(istr_reservacion.fecha_inicio)
em_fecha_final.text=string(istr_reservacion.fecha_inicio)

mc_fecha_inicio.SetSelectedDate(istr_reservacion.fecha_inicio)
mc_fecha_final.SetSelectedDate(istr_reservacion.fecha_final)

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

f_select_anio_periodo_actual(istr_reservacion.periodo,istr_reservacion.anio,today())
f_select_anio_periodo_actual(li_periodo_fecha,li_anio_fecha,istr_reservacion.fecha_inicio)
if istr_reservacion.periodo=li_periodo_fecha and istr_reservacion.anio=li_anio_fecha and istr_reservacion.anio>0 then ii_actual=1


if istr_reservacion.fecha_inicio< today() /*or ii_actual=0*/ then uf_cambiar_dia()

post uf_actualiza()
end event

type cb_1 from commandbutton within w_csal_salones_reservar
integer x = 4158
integer y = 957
integer width = 399
integer height = 122
integer taborder = 240
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Limpiar"
end type

event clicked;uf_limpiar()

end event

type st_nombre_materia from statictext within w_csal_salones_reservar
integer x = 3248
integer y = 336
integer width = 2439
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
boolean focusrectangle = false
end type

type st_nombre_profesor from statictext within w_csal_salones_reservar
integer x = 3248
integer y = 118
integer width = 2436
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
boolean focusrectangle = false
end type

type sle_materia from singlelineedit within w_csal_salones_reservar
integer x = 2915
integer y = 336
integer width = 300
integer height = 80
integer taborder = 60
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

type sle_profesor from singlelineedit within w_csal_salones_reservar
integer x = 2915
integer y = 118
integer width = 300
integer height = 80
integer taborder = 110
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

type st_mensaje from statictext within w_csal_salones_reservar
boolean visible = false
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

type dw_csal_profesor from u_basedw within w_csal_salones_reservar
integer x = 2915
integer y = 211
integer width = 1364
integer height = 93
integer taborder = 110
string dataobject = "d_csal_profesor_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("profesor", "profesor", "profesor")
end event

event itemchanged;call super::itemchanged;sle_profesor.text=''
st_nombre_profesor.text=''

uf_cambio_profesor(trim(this.gettext()))

end event

type dw_csal_materias_profesores_grupos from u_basedw within w_csal_salones_reservar
integer x = 4323
integer y = 438
integer width = 1364
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

type dw_csal_materias from u_basedw within w_csal_salones_reservar
integer x = 2915
integer y = 438
integer width = 1364
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

type rb_materia from radiobutton within w_csal_salones_reservar
integer x = 2505
integer y = 333
integer width = 380
integer height = 74
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Materia"
end type

event clicked;sle_profesor.enabled=false
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

end event

type rb_profesor from radiobutton within w_csal_salones_reservar
integer x = 2505
integer y = 122
integer width = 380
integer height = 74
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Profesor"
boolean checked = true
end type

event clicked;sle_materia.enabled=false
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

end event

type dw_csal_materias_profesor_grupo from u_basedw within w_csal_salones_reservar
integer x = 5734
integer y = 208
integer width = 285
integer height = 96
integer taborder = 30
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

type dw_csal_materias_profesor from u_basedw within w_csal_salones_reservar
integer x = 4323
integer y = 208
integer width = 1364
integer height = 96
integer taborder = 200
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

type st_salon from statictext within w_csal_salones_reservar
integer x = 1821
integer y = 656
integer width = 519
integer height = 86
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 15793151
boolean enabled = false
string text = "Salón:"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_dia from statictext within w_csal_salones_reservar
boolean visible = false
integer x = 874
integer y = 112
integer width = 406
integer height = 74
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 15793151
string text = "TODOS"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_csal_salones_reservar
boolean visible = false
integer x = 4743
integer y = 1370
integer width = 922
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Temporales y Permanentes Lapso"
boolean focusrectangle = false
end type

type dw_csal_salones_reservados_lapso from datawindow within w_csal_salones_reservar
boolean visible = false
integer x = 4718
integer y = 1504
integer width = 998
integer height = 822
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

type cbx_periodo from checkbox within w_csal_salones_reservar
integer x = 1031
integer y = 531
integer width = 1167
integer height = 112
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 30520472
string text = "Todos los días del rango de fechas"
end type

event clicked;integer li_errores=0

if this.checked=true then

	if istr_reservacion.fecha_inicio<> istr_reservacion.fecha_final and is_error_fecha='' and is_error_hora='' then
	
		istr_reservacion.lapso_completo=1
		ddlb_dia.enabled=false
		st_dia.visible=true
		is_error_dia=''

	else
		
		this.checked=false
		goto salir
		
	end if
	
else
	
	istr_reservacion.lapso_completo=0
	ddlb_dia.enabled=true
	st_dia.visible=false

	if f_valida_dia_enrango(istr_reservacion.cve_dia,istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)=1 &
	then goto seguir

	uf_cambiar_dia()
	
end if

seguir:

st_error.text=''
uf_actualiza()
cb_reservar.enabled=true
cb_refrescar.enabled=true

salir:
end event

type st_fin from statictext within w_csal_salones_reservar
integer x = 1733
integer y = 365
integer width = 176
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

type st_inicio from statictext within w_csal_salones_reservar
integer x = 1057
integer y = 368
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

type st_error from statictext within w_csal_salones_reservar
integer x = 44
integer y = 806
integer width = 2297
integer height = 186
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 30520472
boolean focusrectangle = false
end type

type mle_observaciones from multilineedit within w_csal_salones_reservar
integer x = 2512
integer y = 672
integer width = 3895
integer height = 186
integer taborder = 220
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

type em_hora_inicio from editmask within w_csal_salones_reservar
integer x = 1858
integer y = 122
integer width = 201
integer height = 77
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 33554431
borderstyle borderstyle = stylelowered!
string mask = "##########"
string minmax = "0~~23"
end type

event modified;istr_reservacion.hora_inicio=integer(trim(em_hora_inicio.text))
uf_cambio_hora()
end event

type ddlb_dia from dropdownlistbox within w_csal_salones_reservar
integer x = 1093
integer y = 122
integer width = 556
integer height = 349
integer taborder = 30
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

event selectionchanged;integer li_errores=0
string ls_inicio

istr_reservacion.cve_dia=(index -1)

if is_error_fecha<>'' or is_error_dia<>'' then goto cambiar

if f_valida_dia_enrango(istr_reservacion.cve_dia,istr_reservacion.fecha_inicio,istr_reservacion.fecha_final)=1 &
then goto seguir

cambiar:
uf_cambiar_dia()
		
seguir:

if is_error_fecha<>'' or is_error_hora<>'' then li_errores=1

if li_errores=1 then
	cb_reservar.enabled=false
	cb_refrescar.enabled=false
	ls_inicio='Error:'
else
	uf_actualiza()
	cb_reservar.enabled=true 
	cb_refrescar.enabled=true
end if
	
st_error.text=trim(ls_inicio+' '+is_error_dia+' '+is_error_fecha+' '+is_error_hora)

end event

type em_hora_final from editmask within w_csal_salones_reservar
integer x = 2096
integer y = 122
integer width = 201
integer height = 77
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "##########"
string minmax = "0~~23"
end type

event modified;istr_reservacion.hora_final=integer(trim(em_hora_final.text))
uf_cambio_hora()
end event

type rb_temporal from radiobutton within w_csal_salones_reservar
integer x = 84
integer y = 144
integer width = 874
integer height = 77
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Temporal (por un periodo)"
boolean checked = true
end type

type st_7 from statictext within w_csal_salones_reservar
boolean visible = false
integer x = 4751
integer y = 890
integer width = 413
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "temporal"
boolean focusrectangle = false
end type

type st_6 from statictext within w_csal_salones_reservar
boolean visible = false
integer x = 4751
integer y = 502
integer width = 413
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "permanente"
boolean focusrectangle = false
end type

type st_4 from statictext within w_csal_salones_reservar
boolean visible = false
integer x = 4751
integer y = 51
integer width = 413
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "temporal"
boolean focusrectangle = false
end type

type dw_csal_salones_disponibles from datawindow within w_csal_salones_reservar
integer x = 40
integer y = 2160
integer width = 4213
integer height = 662
integer taborder = 160
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

type dw_csal_salon_activo from datawindow within w_csal_salones_reservar
boolean visible = false
integer x = 5168
integer y = 64
integer width = 132
integer height = 86
integer taborder = 170
string title = "none"
string dataobject = "d_csal_salon_activo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_escolar)
end event

type st_libres from statictext within w_csal_salones_reservar
integer x = 40
integer y = 2077
integer width = 768
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Salones Disponibles"
boolean focusrectangle = false
end type

type st_reservados from statictext within w_csal_salones_reservar
integer x = 40
integer y = 1046
integer width = 3072
integer height = 86
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Salones Ocupados"
boolean focusrectangle = false
end type

type gb_reservacion from groupbox within w_csal_salones_reservar
integer x = 44
integer y = 42
integer width = 940
integer height = 445
integer taborder = 190
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Reservación"
end type

type gb_dia from groupbox within w_csal_salones_reservar
integer x = 1035
integer y = 42
integer width = 662
integer height = 205
integer taborder = 220
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Día:"
end type

type dw_csal_salones_reservados from datawindow within w_csal_salones_reservar
integer x = 40
integer y = 1136
integer width = 6429
integer height = 880
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
	 
	if isvalid(w_csal_ficha_salon) then close(w_csal_ficha_salon) 
	
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
	lstr_reservacion.periodo=istr_reservacion.periodo
	lstr_reservacion.anio=istr_reservacion.anio
	
	if (this.GetItemString(li_row,"nom_dia"))='TODOS' then lstr_reservacion.lapso='TODOS LOS DIAS DEL' else lstr_reservacion.lapso=this.GetItemString(li_row,"nom_dia")
	lstr_reservacion.lapso=lstr_reservacion.lapso+' '+this.GetItemString(li_row,"lapso")
	
	openwithparm(w_csal_ficha_salon_cambio, lstr_reservacion)
	ls_return=Message.StringParm


	choose case Message.StringParm

	case '1'
		//Se prepara para reservación temporal
		uf_carga_reservacion_cambio(li_row)
		cb_reservar.enabled=true
		cb_refrescar.enabled=true
		
	case '2'
		//Se hizo una cancelación
		
		ls_salon=istr_reservacion.salon
		li_cve_dia=istr_reservacion.cve_dia
		li_hora_inicio=istr_reservacion.hora_inicio
		
		uf_limpiar()
		uf_actualiza()
		li_reservados=dw_csal_salones_reservados.rowcount()

		li_foco=dw_csal_salones_reservados.Find("cve_salon='"+ls_salon+"' and cve_dia="+string(li_cve_dia)+" and hora_inicio="+string(li_hora_inicio),1,li_reservados)
		if li_foco>0 then dw_csal_salones_reservados.ScrollToRow(li_foco)

	end choose

end if

end event

event clicked;	if dwo.Type = "text" then
		
		choose case string(dwo.Name)
	
			case 'cve_salon_t'
				is_sort_disponibles="#1A #17A #5A"
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
				is_sort_disponibles="#15A #12A #1A #17A #5A"
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
				is_sort_disponibles="#12A #15A #1A #17A #5A"
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
				is_sort_disponibles="#14A #15A #12A #1A #17A #5A"
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
				is_sort_disponibles="#13A #17A #5A"
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
				is_sort_disponibles="#4A #5A #1A"
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
				is_sort_disponibles="#5A #6A #17A #1A"
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
				is_sort_disponibles="#18A #17A #5A #1A"
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
				is_sort_disponibles="#21A #17A #5A #1A"
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
				is_sort_disponibles="#22A #17A #5A"
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
				is_sort_disponibles="#2A #12A #1A #17A #5A"
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
				is_sort_disponibles="#3A #15A #12A #1A #17A #5A"
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

		this.SetSort(is_sort_disponibles) 
		this.Sort() 		
		
	end if
	
end event

type gb_observaciones from groupbox within w_csal_salones_reservar
integer x = 2469
integer y = 595
integer width = 3990
integer height = 298
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Tipo de evento, observaciones"
end type

type gb_1 from groupbox within w_csal_salones_reservar
integer x = 1031
integer y = 269
integer width = 1306
integer height = 218
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Periodo:"
end type

type gb_horario from groupbox within w_csal_salones_reservar
integer x = 1810
integer y = 42
integer width = 530
integer height = 205
integer taborder = 200
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Horario:"
end type

type mc_fecha_final from monthcalendar within w_csal_salones_reservar
boolean visible = false
integer x = 1525
integer y = 301
integer width = 1035
integer height = 637
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event datechanged;date ld_fecha

this.GetSelectedDate(ld_fecha)

em_fecha_final.text=string(ld_fecha)
istr_reservacion.fecha_final=date(em_fecha_final.text)
uf_cambio_fecha(istr_reservacion.fecha_final)



end event

event losefocus;uf_apaga_fecha_final()
end event

event clicked;date ld_fecha
this.GetSelectedDate(ld_fecha)

if ld_fecha=istr_reservacion.fecha_final then rb_temporal.SetFocus()

end event

type mc_fecha_inicio from monthcalendar within w_csal_salones_reservar
boolean visible = false
integer x = 1097
integer y = 298
integer width = 1028
integer height = 637
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event datechanged;date ld_fecha

this.GetSelectedDate(ld_fecha)

em_fecha_inicio.text=string(ld_fecha)
istr_reservacion.fecha_inicio=date(em_fecha_inicio.text)
uf_cambio_fecha(istr_reservacion.fecha_inicio)


end event

event losefocus;uf_apaga_fecha_inicio()
end event

event clicked;date ld_fecha
this.GetSelectedDate(ld_fecha)

if ld_fecha=istr_reservacion.fecha_inicio then rb_temporal.SetFocus()

end event

type cb_reservar from commandbutton within w_csal_salones_reservar
integer x = 4579
integer y = 957
integer width = 399
integer height = 122
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

event clicked;integer li_reservados, li_foco, li_cve_dia, li_hora_inicio, li_lapso 
integer li_mensaje, li_row, li_borra_extraordinaria=0
string ls_return, ls_salon

//Salon
if isNull(istr_reservacion.salon) or istr_reservacion.salon='' then 
	messagebox("Error", "Seleccionar una clave de salon válida") 
	goto salir
end if	

//Excluir los salon de DEC del cambio de salón
if istr_reservacion.temporal = 1 then
	if mid( istr_reservacion.salon,1,1) = 'G' then
		messagebox("Error", "No puede realizar cambio sobre este tipo de salón") 
		goto salir	
	end if
end if

//Observaciones
if isNull(istr_reservacion.observaciones) or istr_reservacion.observaciones='' then 
	if istr_reservacion.temporal=1 then messagebox("Error", "Indicar en observaciones el motivo de cambio de salón") else messagebox("Error", "Indicar en observaciones el motivo de su reservación") 
	goto salir
end if	

//Profesor
if isNull(istr_reservacion.profesor) or istr_reservacion.profesor='' or istr_reservacion.cve_profesor=0 then 
	messagebox("Error", "Introducir una clave de profesor válida") 
	goto salir
end if	

//Salon seleccionado
if istr_reservacion.estatus_salon>0 then
	li_mensaje = MessageBox("Aviso", "Existe una PreServación extraordinaria sin confirmar para ese salón. ¿Desea Continuar y Cancelar la PreReservación anterior?", Exclamation!, YesNo!, 2)

	if li_mensaje=1 then
		li_row=dw_csal_salones_disponibles.Find("cve_salon='"+istr_reservacion.salon+"'",1,dw_csal_salones_disponibles.rowcount())
		li_borra_extraordinaria=dw_csal_salones_disponibles.GetItemNumber(li_row,"num_asignacion")
	else
		goto salir
	end if
end if

istr_reservacion.estatus_reservacion=istr_reservacion.temporal
istr_reservacion.tipo_reservacion=f_select_nombre_estatus(istr_reservacion.estatus_reservacion)

if istr_reservacion.inscritos>istr_reservacion.cupo_real then 	messagebox('Aviso','Está reservando un salón con cupo de '+string(istr_reservacion.cupo_real)+' para una evento con '+string(istr_reservacion.inscritos)+' participantes.')

openwithparm(w_csal_ficha_salon_reservacion,istr_reservacion)
ls_return=Message.StringParm


if Message.StringParm='1' then
	
	ls_salon=istr_reservacion.salon
	li_cve_dia=istr_reservacion.cve_dia
	li_hora_inicio=istr_reservacion.hora_inicio
	
	if li_borra_extraordinaria>0 then f_delete_reservacion_temporal(li_borra_extraordinaria)
	
	uf_cambio_fecha(istr_reservacion.fecha_final)
	uf_limpiar()
	uf_actualiza()
	li_reservados=dw_csal_salones_reservados.rowcount()
	
	if ii_lapso_foco>0 then
		li_foco=dw_csal_salones_reservados.Find("lapso_completo="+string(ii_lapso_foco),1,li_reservados)
	else
		li_foco=dw_csal_salones_reservados.Find("cve_salon='"+ls_salon+"' and cve_dia="+string(li_cve_dia)+" and hora_inicio="+string(li_hora_inicio),1,li_reservados)
	end if
	
	if li_foco>0 then dw_csal_salones_reservados.ScrollToRow(li_foco)
	ii_lapso_foco=0

end if


salir:
end event

type cb_refrescar from commandbutton within w_csal_salones_reservar
integer x = 3734
integer y = 957
integer width = 399
integer height = 122
integer taborder = 230
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Refrescar"
end type

event clicked;uf_actualiza()

end event

type dw_csal_salones_fecha_temporales_dia from datawindow within w_csal_salones_reservar
boolean visible = false
integer x = 1836
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

type dw_csal_salones_hora_permanentes from datawindow within w_csal_salones_reservar
boolean visible = false
integer x = 1825
integer y = 605
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

type dw_csal_salones_hora_temporales_dia from datawindow within w_csal_salones_reservar
boolean visible = false
integer x = 2918
integer y = 381
integer width = 998
integer height = 349
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_csal_salones_temporales_hora_dia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type em_fecha_final from editmask within w_csal_salones_reservar
integer x = 1872
integer y = 358
integer width = 406
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
end type

event getfocus;if this.enabled=true then
	mc_fecha_final.visible=true
	mc_fecha_final.enabled=true
	mc_fecha_final.SetFocus()
end if
end event

type rb_cambio from radiobutton within w_csal_salones_reservar
integer x = 84
integer y = 275
integer width = 625
integer height = 77
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
boolean enabled = false
string text = "Cambio de salón"
boolean checked = true
end type

type st_periodo from statictext within w_csal_salones_reservar
boolean visible = false
integer x = 1057
integer y = 339
integer width = 1258
integer height = 112
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 30520472
string text = "                            PERIODO COMPLETO"
boolean focusrectangle = false
end type

type gb_empleado from groupbox within w_csal_salones_reservar
integer x = 2469
integer y = 42
integer width = 3994
integer height = 541
integer taborder = 210
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Profesor, Materia y Grupo:"
end type

type em_fecha_inicio from editmask within w_csal_salones_reservar
integer x = 1273
integer y = 358
integer width = 406
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
end type

event getfocus;if this.enabled=true then
	mc_fecha_inicio.visible=true
	mc_fecha_inicio.enabled=true
	mc_fecha_inicio.SetFocus()
end if
end event

