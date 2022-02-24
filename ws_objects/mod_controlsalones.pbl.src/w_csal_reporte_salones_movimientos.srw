$PBExportHeader$w_csal_reporte_salones_movimientos.srw
forward
global type w_csal_reporte_salones_movimientos from window
end type
type cbx_limpiar from checkbox within w_csal_reporte_salones_movimientos
end type
type mc_fecha_final from monthcalendar within w_csal_reporte_salones_movimientos
end type
type mc_fecha_inicio from monthcalendar within w_csal_reporte_salones_movimientos
end type
type dw_csal_profesor from u_basedw within w_csal_reporte_salones_movimientos
end type
type dw_csal_salones_cambios_conteo_profesor from datawindow within w_csal_reporte_salones_movimientos
end type
type dw_csal_salones_cambios_conteo from datawindow within w_csal_reporte_salones_movimientos
end type
type cbx_fechas from checkbox within w_csal_reporte_salones_movimientos
end type
type em_fecha_final from editmask within w_csal_reporte_salones_movimientos
end type
type st_1 from statictext within w_csal_reporte_salones_movimientos
end type
type em_fecha_inicio from editmask within w_csal_reporte_salones_movimientos
end type
type st_materia from statictext within w_csal_reporte_salones_movimientos
end type
type st_salon from statictext within w_csal_reporte_salones_movimientos
end type
type sle_salon from singlelineedit within w_csal_reporte_salones_movimientos
end type
type st_profesor from statictext within w_csal_reporte_salones_movimientos
end type
type dw_csal_materias_grupo from u_basedw within w_csal_reporte_salones_movimientos
end type
type dw_csal_materias from u_basedw within w_csal_reporte_salones_movimientos
end type
type cb_filtrar from commandbutton within w_csal_reporte_salones_movimientos
end type
type cbx_extraordinarias from checkbox within w_csal_reporte_salones_movimientos
end type
type cbx_temporales from checkbox within w_csal_reporte_salones_movimientos
end type
type st_periodo from statictext within w_csal_reporte_salones_movimientos
end type
type st_anio from statictext within w_csal_reporte_salones_movimientos
end type
type dw_csal_salones_temporales from datawindow within w_csal_reporte_salones_movimientos
end type
type dw_csal_salones_cambios from datawindow within w_csal_reporte_salones_movimientos
end type
type cb_cargar from commandbutton within w_csal_reporte_salones_movimientos
end type
type sle_periodo from singlelineedit within w_csal_reporte_salones_movimientos
end type
type sle_anio from singlelineedit within w_csal_reporte_salones_movimientos
end type
type gb_filtros from groupbox within w_csal_reporte_salones_movimientos
end type
type gb_parametros from groupbox within w_csal_reporte_salones_movimientos
end type
type rb_cambios from radiobutton within w_csal_reporte_salones_movimientos
end type
type rb_temporales from radiobutton within w_csal_reporte_salones_movimientos
end type
type dw_csal_rep_salones_temporales from datawindow within w_csal_reporte_salones_movimientos
end type
type dw_csal_rep_salones_cambios from datawindow within w_csal_reporte_salones_movimientos
end type
end forward

global type w_csal_reporte_salones_movimientos from window
integer width = 6674
integer height = 2920
boolean titlebar = true
string title = "Reporte de Salones Temporales y Cambios"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cbx_limpiar cbx_limpiar
mc_fecha_final mc_fecha_final
mc_fecha_inicio mc_fecha_inicio
dw_csal_profesor dw_csal_profesor
dw_csal_salones_cambios_conteo_profesor dw_csal_salones_cambios_conteo_profesor
dw_csal_salones_cambios_conteo dw_csal_salones_cambios_conteo
cbx_fechas cbx_fechas
em_fecha_final em_fecha_final
st_1 st_1
em_fecha_inicio em_fecha_inicio
st_materia st_materia
st_salon st_salon
sle_salon sle_salon
st_profesor st_profesor
dw_csal_materias_grupo dw_csal_materias_grupo
dw_csal_materias dw_csal_materias
cb_filtrar cb_filtrar
cbx_extraordinarias cbx_extraordinarias
cbx_temporales cbx_temporales
st_periodo st_periodo
st_anio st_anio
dw_csal_salones_temporales dw_csal_salones_temporales
dw_csal_salones_cambios dw_csal_salones_cambios
cb_cargar cb_cargar
sle_periodo sle_periodo
sle_anio sle_anio
gb_filtros gb_filtros
gb_parametros gb_parametros
rb_cambios rb_cambios
rb_temporales rb_temporales
dw_csal_rep_salones_temporales dw_csal_rep_salones_temporales
dw_csal_rep_salones_cambios dw_csal_rep_salones_cambios
end type
global w_csal_reporte_salones_movimientos w_csal_reporte_salones_movimientos

type variables
DatawindowChild idwc_materias, idwc_materias_grupo, idwc_profesor

string is_salon='', is_grupo='', is_sort='#1A #7A #9A #14A'
long il_profesor=0, il_materia=0
date id_fecha_inicio, id_fecha_final
integer ii_anio, ii_periodo

end variables

forward prototypes
public subroutine uf_cargar_cambios ()
public subroutine uf_cargar_temporales ()
public subroutine uf_filtrar_cambios ()
public subroutine uf_filtrar_temporales ()
public subroutine uf_desactivar ()
public subroutine uf_apaga_fecha_final ()
public subroutine uf_apaga_fecha_inicio ()
end prototypes

public subroutine uf_cargar_cambios ();integer li_cambio, li_i,  li_lapso_actual, li_temp_dia, li_cambiados
integer li_cve_dia, li_dias_lapso, li_dia_fecha, li_k
string ls_lapso='', ls_fecha='', ls_salon_actual='', ls_cambiados=''
date ld_fecha_inicio, ld_fecha_final, ld_fecha


this.title='Cargando... '
SetPointer(HourGlass!)

dw_csal_salones_cambios_conteo.Reset()
dw_csal_salones_cambios_conteo_profesor.Reset()
dw_csal_rep_salones_cambios.reset()

dw_csal_rep_salones_cambios.SetRedraw(false)
dw_csal_salones_cambios.reset()
dw_csal_salones_temporales.reset()

	dw_csal_salones_cambios_conteo.retrieve(ii_periodo,ii_anio)
	dw_csal_salones_cambios_conteo_profesor.retrieve(ii_periodo,ii_anio)
	dw_csal_salones_cambios.retrieve(ii_periodo,ii_anio)
	li_cambio=dw_csal_salones_cambios.rowcount()

	for li_i=1 to li_cambio
		
		ls_salon_actual=f_select_salon_actual(dw_csal_salones_cambios.GetItemNumber(li_i,"cve_dia"),dw_csal_salones_cambios.GetItemNumber(li_i,"hora_inicio"),dw_csal_salones_cambios.GetItemNumber(li_i,"cve_materia"),dw_csal_salones_cambios.GetItemString(li_i,"cve_grupo"),ii_periodo,ii_anio)

		dw_csal_rep_salones_cambios.insertrow(0)
		dw_csal_rep_salones_cambios.SetItem(li_i, "cve_salon", ls_salon_actual)	
		dw_csal_rep_salones_cambios.SetItem(li_i, "cve_materia", dw_csal_salones_cambios.GetItemNumber(li_i,"cve_materia"))	
		dw_csal_rep_salones_cambios.SetItem(li_i, "cve_profesor", dw_csal_salones_cambios.GetItemNumber(li_i,"cve_profesor"))	
		dw_csal_rep_salones_cambios.SetItem(li_i, "cve_dia", dw_csal_salones_cambios.GetItemNumber(li_i,"cve_dia"))	
		dw_csal_rep_salones_cambios.SetItem(li_i, "hora_inicio", dw_csal_salones_cambios.GetItemNumber(li_i,"hora_inicio"))	
		dw_csal_rep_salones_cambios.SetItem(li_i, "hora_final", dw_csal_salones_cambios.GetItemNumber(li_i,"hora_final"))	
		dw_csal_rep_salones_cambios.SetItem(li_i, "fecha_movimiento", dw_csal_salones_cambios.GetItemDateTime(li_i,"fecha_movimiento"))	
		dw_csal_rep_salones_cambios.SetItem(li_i, "cve_grupo", dw_csal_salones_cambios.GetItemString(li_i,"cve_grupo"))	
		dw_csal_rep_salones_cambios.SetItem(li_i, "estatus", 1)
		dw_csal_rep_salones_cambios.SetItem(li_i, "lapso_completo",0)
		dw_csal_rep_salones_cambios.SetItem(li_i, "observaciones", dw_csal_salones_cambios.GetItemString(li_i,"observaciones"))	
		dw_csal_rep_salones_cambios.SetItem(li_i, "salon_anterior", dw_csal_salones_cambios.GetItemString(li_i,"cve_salon"))
		dw_csal_rep_salones_cambios.SetItem(li_i, "num_asignacion", dw_csal_salones_cambios.GetItemNumber(li_i,"num_asignacion"))	
	
		dw_csal_rep_salones_cambios.SetItem(li_i, "tipo_reservacion",f_select_nombre_estatus(1))
		dw_csal_rep_salones_cambios.SetItem(li_i, "nom_dia",f_select_nombre_dia(dw_csal_salones_cambios.GetItemNumber(li_i,"cve_dia")))	
		dw_csal_rep_salones_cambios.SetItem(li_i, "lapso",'PERIODO ESCOLAR')
		dw_csal_rep_salones_cambios.SetItem(li_i, "horario",string(dw_csal_salones_cambios.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_salones_cambios.GetItemNumber(li_i,"hora_final")))
		dw_csal_rep_salones_cambios.SetItem(li_i, "nom_profesor",f_select_nombre_profesor(dw_csal_salones_cambios.GetItemNumber(li_i,"cve_profesor")))		
		dw_csal_rep_salones_cambios.SetItem(li_i, "nom_materia",f_select_nombre_materia(dw_csal_salones_cambios.GetItemNumber(li_i,"cve_materia")))		
			
	next
	

//Salones
li_cambiados=dw_csal_salones_cambios_conteo.RowCount()

li_i=1
do while li_i<=3 and li_i<=li_cambiados
	if dw_csal_salones_cambios_conteo.GetItemNumber(li_i,"cuenta")>1 then
		ls_cambiados=ls_cambiados+', '+dw_csal_salones_cambios_conteo.GetItemString(li_i,"cve_salon")+" ("+string(dw_csal_salones_cambios_conteo.GetItemNumber(li_i,"cuenta"))+" veces)"
		li_i=li_i+1
	else
		li_i=li_cambiados+1
	end if
	
loop

ls_cambiados=mid(ls_cambiados,3)
if ls_cambiados<>'' then dw_csal_rep_salones_cambios.object.t_cambios_salones.text="Salones con más cambios: "+ls_cambiados &
else dw_csal_rep_salones_cambios.object.t_cambios_salones.text=''


//Profesores
li_cambiados=dw_csal_salones_cambios_conteo_profesor.RowCount()

li_i=1
ls_cambiados=''
do while li_i<=3 and li_i<=li_cambiados
	
	if dw_csal_salones_cambios_conteo_profesor.GetItemNumber(li_i,"cuenta")>1 then
		ls_cambiados=ls_cambiados+', '+f_select_nombre_profesor(dw_csal_salones_cambios_conteo_profesor.GetItemNumber(li_i,"cve_profesor"))+" ("+string(dw_csal_salones_cambios_conteo_profesor.GetItemNumber(li_i,"cuenta"))+" veces)"
		li_i=li_i+1
	else
		li_i=li_cambiados+1
	end if
	
loop

ls_cambiados=mid(ls_cambiados,3)
if ls_cambiados<>'' then dw_csal_rep_salones_cambios.object.t_cambios_profesores.text="Profesores con más cambios: "+ls_cambiados  &
else  dw_csal_rep_salones_cambios.object.t_cambios_profesores.text=''


dw_csal_rep_salones_cambios.SetRedraw(true)
this.title='Reporte de Cambios de Salón'
SetPointer(Arrow!)

if dw_csal_rep_salones_cambios.rowcount()>0 then
	sle_salon.enabled=true
	dw_csal_profesor.enabled=true
	dw_csal_materias.enabled=true
	dw_csal_materias_grupo.enabled=true
	cb_filtrar.enabled=true
	cbx_limpiar.enabled=true
end if


end subroutine

public subroutine uf_cargar_temporales ();integer li_cambio, li_i, li_control=0, li_lapso_actual, li_temp_dia
integer li_cve_dia, li_dias_lapso, li_dia_fecha, li_k
string ls_lapso='', ls_fecha='', ls_salon_actual=''
date ld_fecha_inicio, ld_fecha_final, ld_fecha


this.title='Cargando... '
SetPointer(HourGlass!)

dw_csal_rep_salones_temporales.reset()
dw_csal_rep_salones_temporales.SetRedraw(false)
dw_csal_salones_temporales.reset()

	dw_csal_salones_temporales.retrieve(ii_periodo,ii_anio)
	
	li_temp_dia=dw_csal_salones_temporales.rowcount()
					
	for li_i=1 to li_temp_dia
					
		li_lapso_actual=dw_csal_salones_temporales.GetItemNumber(li_i,"lapso_completo")	
		if (dw_csal_rep_salones_temporales.Find("lapso_completo>0 and lapso_completo="+string(li_lapso_actual),1,li_control))>0 then goto sigue 

		li_control=li_control+1
		dw_csal_rep_salones_temporales.insertrow(0)
		dw_csal_rep_salones_temporales.SetItem(li_control, "cve_salon", dw_csal_salones_temporales.GetItemString(li_i,"cve_salon"))	
		dw_csal_rep_salones_temporales.SetItem(li_control, "cve_materia", dw_csal_salones_temporales.GetItemNumber(li_i,"cve_materia"))	
		dw_csal_rep_salones_temporales.SetItem(li_control, "cve_profesor", dw_csal_salones_temporales.GetItemNumber(li_i,"cve_profesor"))	
		
		dw_csal_rep_salones_temporales.SetItem(li_control, "cve_dia", dw_csal_salones_temporales.GetItemNumber(li_i,"cve_dia"))	
		dw_csal_rep_salones_temporales.SetItem(li_control, "hora_inicio", dw_csal_salones_temporales.GetItemNumber(li_i,"hora_inicio"))	
		dw_csal_rep_salones_temporales.SetItem(li_control, "hora_final", dw_csal_salones_temporales.GetItemNumber(li_i,"hora_final"))	
		dw_csal_rep_salones_temporales.SetItem(li_control, "fecha_movimiento", date(dw_csal_salones_temporales.GetItemDateTime(li_i,"fecha_movimiento")))	
		dw_csal_rep_salones_temporales.SetItem(li_control, "fecha_inicio", dw_csal_salones_temporales.GetItemDateTime(li_i,"fecha_inicio"))		
		dw_csal_rep_salones_temporales.SetItem(li_control, "fecha_final",  dw_csal_salones_temporales.GetItemDateTime(li_i,"fecha_final"))	
		dw_csal_rep_salones_temporales.SetItem(li_control, "cve_grupo", dw_csal_salones_temporales.GetItemString(li_i,"cve_grupo"))	
		dw_csal_rep_salones_temporales.SetItem(li_control, "estatus", dw_csal_salones_temporales.GetItemNumber(li_i,"estatus"))	
		dw_csal_rep_salones_temporales.SetItem(li_control, "lapso_completo", dw_csal_salones_temporales.GetItemNumber(li_i,"lapso_completo"))	
		dw_csal_rep_salones_temporales.SetItem(li_control, "observaciones", dw_csal_salones_temporales.GetItemString(li_i,"observaciones"))	
		
		dw_csal_rep_salones_temporales.SetItem(li_control, "tipo_reservacion", f_select_nombre_estatus(dw_csal_salones_temporales.GetItemNumber(li_i,"estatus")))	
		dw_csal_rep_salones_temporales.SetItem(li_control, "nom_dia", f_select_nombre_dia(dw_csal_salones_temporales.GetItemNumber(li_i,"cve_dia"))	)
		dw_csal_rep_salones_temporales.SetItem(li_control, "horario",string(dw_csal_salones_temporales.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_salones_temporales.GetItemNumber(li_i,"hora_final")))
		dw_csal_rep_salones_temporales.SetItem(li_control, "nom_profesor", f_select_nombre_profesor(dw_csal_salones_temporales.GetItemNumber(li_i,"cve_profesor")))	
		
		if dw_csal_salones_temporales.GetItemNumber(li_i,"cve_materia")=0 then dw_csal_rep_salones_temporales.SetItem(li_control, "nom_materia","NO ASIGNADA") else dw_csal_rep_salones_temporales.SetItem(li_control, "nom_materia",f_select_nombre_materia(dw_csal_salones_temporales.GetItemNumber(li_i,"cve_materia")))  
	
		ld_fecha_inicio=date(dw_csal_salones_temporales.GetItemDateTime(li_i,"fecha_inicio"))
		ld_fecha_final=date(dw_csal_salones_temporales.GetItemDateTime(li_i,"fecha_final"))
								
		if (dw_csal_salones_temporales.GetItemNumber(li_i,"lapso_completo"))=0 then	
						
			li_cve_dia=dw_csal_salones_temporales.GetItemNumber(li_i,"cve_dia")
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
						
			dw_csal_rep_salones_temporales.SetItem(li_control, "lapso",ls_lapso)
						
		else
			dw_csal_rep_salones_temporales.SetItem(li_control, "nom_dia",'TODOS')
			dw_csal_rep_salones_temporales.SetItem(li_control,"cve_dia",-1)
			dw_csal_rep_salones_temporales.SetItem(li_control, "lapso",f_convierte_fecha_texto(ld_fecha_inicio)+' AL '+f_convierte_fecha_texto(ld_fecha_final))
		end if					
					
		sigue:
					
	next

dw_csal_rep_salones_cambios.SetSort(is_sort)	
dw_csal_rep_salones_cambios.Sort()	
	
if dw_csal_rep_salones_temporales.rowcount()>0 then dw_csal_rep_salones_temporales.ScrollToRow(1)
dw_csal_rep_salones_temporales.SetFocus()

dw_csal_rep_salones_temporales.SetRedraw(true)
this.title='Reporte de Salones Reservados Temporalmente'
SetPointer(Arrow!)

if dw_csal_rep_salones_temporales.rowcount()>0 then
	cbx_temporales.enabled=true
	cbx_extraordinarias.enabled=true
	cbx_fechas.enabled=true
	sle_salon.enabled=true
	dw_csal_profesor.enabled=true
	dw_csal_materias.enabled=true
	dw_csal_materias_grupo.enabled=true
	cb_filtrar.enabled=true
	cbx_limpiar.enabled=true
end if


end subroutine

public subroutine uf_filtrar_cambios ();string ls_filtro='', ls_estatus='', is_grupo_asimilado
long ll_materia_asimilada=0

dw_csal_rep_salones_cambios.SetRedraw(false)
dw_csal_rep_salones_cambios.SetFilter(ls_filtro)
dw_csal_rep_salones_cambios.Filter()


//Salon
if is_salon<>'' then ls_filtro=ls_filtro+" and (cve_salon='"+is_salon+"') or (salon_anterior='"+is_salon+"')"

//Profesor
if il_profesor>0 then ls_filtro=ls_filtro+" and cve_profesor="+string(il_profesor)

//Materia
if il_materia>0 then 
	
	//Grupo
	if is_grupo<>'' then
	
		if f_valida_es_asimilada(il_materia,is_grupo,ii_periodo,ii_anio)>0 then
			
			f_select_padre_asimilada_valor(il_materia,is_grupo,ll_materia_asimilada,is_grupo_asimilado,ii_periodo,ii_anio)
			ls_filtro=ls_filtro+" and ((cve_materia="+string(il_materia)+" and cve_grupo='"+is_grupo+"') or (cve_materia="+string(ll_materia_asimilada)+" and cve_grupo='"+is_grupo_asimilado+"'))"
		else
			ls_filtro=ls_filtro+" and cve_materia="+string(il_materia)+" and cve_grupo='"+is_grupo+"'"
		end if

	else
	
		ls_filtro=ls_filtro+" and cve_materia="+string(il_materia)
	
	end if
			
end if

ls_filtro=mid(ls_filtro,6)

dw_csal_rep_salones_cambios.SetFilter(ls_filtro)
dw_csal_rep_salones_cambios.Filter()

dw_csal_rep_salones_cambios.SetSort('#1A #7A #9A #14A')	
dw_csal_rep_salones_cambios.Sort()
dw_csal_rep_salones_cambios.SetRedraw(true)


end subroutine

public subroutine uf_filtrar_temporales ();string ls_filtro='', ls_estatus='', is_grupo_asimilado
long ll_materia_asimilada=0


dw_csal_rep_salones_temporales.SetRedraw(false)
dw_csal_rep_salones_temporales.SetFilter(ls_filtro)
dw_csal_rep_salones_temporales.Filter()


//Estatus
estatus:
if cbx_temporales.checked=true then ls_estatus=ls_estatus+',2'
if cbx_extraordinarias.checked=true then ls_estatus=ls_estatus+',4'

ls_estatus=mid(ls_estatus,2)
ls_filtro=" and estatus in ("+ls_estatus+")"

if ls_filtro=" and estatus in ()" then 
	cbx_temporales.checked=true
	cbx_extraordinarias.checked=true
	goto estatus
end if


//Salon
if is_salon<>'' then ls_filtro=ls_filtro+" and cve_salon='"+is_salon+"'"

//Profesor
if il_profesor>0 then ls_filtro=ls_filtro+" and cve_profesor="+string(il_profesor)

//Materia
if il_materia>0 then 
	
	//Grupo
	if is_grupo<>'' then
	
		if f_valida_es_asimilada(il_materia,is_grupo,ii_periodo,ii_anio)>0 then
			
			f_select_padre_asimilada_valor(il_materia,is_grupo,ll_materia_asimilada,is_grupo_asimilado,ii_periodo,ii_anio)
			ls_filtro=ls_filtro+" and ((cve_materia="+string(il_materia)+" and cve_grupo='"+is_grupo+"') or (cve_materia="+string(ll_materia_asimilada)+" and cve_grupo='"+is_grupo_asimilado+"'))"
		else
			ls_filtro=ls_filtro+" and cve_materia="+string(il_materia)+" and cve_grupo='"+is_grupo+"'"
		end if

	else
	
		ls_filtro=ls_filtro+" and cve_materia="+string(il_materia)
	
	end if
			
end if


//Fechas
if cbx_fechas.checked=true then 
	ls_filtro=ls_filtro+" and ((fecha_inicio >= "+string(id_fecha_inicio)+" and "+string(id_fecha_final)+" >= fecha_inicio) or (fecha_inicio <= "+string(id_fecha_inicio)+" and "+string(id_fecha_inicio)+" <= fecha_final))"
end if

ls_filtro=mid(ls_filtro,6)

dw_csal_rep_salones_temporales.SetFilter(ls_filtro)
dw_csal_rep_salones_temporales.Filter()

dw_csal_rep_salones_cambios.SetSort(is_sort)	
dw_csal_rep_salones_cambios.Sort()

dw_csal_rep_salones_temporales.SetRedraw(true)
end subroutine

public subroutine uf_desactivar ();cbx_temporales.checked=true
cbx_extraordinarias.checked=true

cbx_temporales.enabled=false
cbx_extraordinarias.enabled=false
cbx_fechas.enabled=false

em_fecha_inicio.enabled=false
em_fecha_final.enabled=false

sle_salon.enabled=false
dw_csal_profesor.enabled=false
dw_csal_materias.enabled=false
dw_csal_materias_grupo.enabled=false	
cb_filtrar.enabled=false
cbx_limpiar.enabled=false
		
sle_salon.text=''
cbx_fechas.checked=false

dw_csal_profesor.Reset()
idwc_profesor.Reset()
		
dw_csal_materias.Reset()
idwc_materias.Reset()

dw_csal_materias_grupo.Reset()
idwc_materias_grupo.Reset()


is_salon=''
il_profesor=0
il_materia=0
is_grupo=''
end subroutine

public subroutine uf_apaga_fecha_final ();mc_fecha_final.visible=false
end subroutine

public subroutine uf_apaga_fecha_inicio ();mc_fecha_inicio.visible=false
end subroutine

on w_csal_reporte_salones_movimientos.create
this.cbx_limpiar=create cbx_limpiar
this.mc_fecha_final=create mc_fecha_final
this.mc_fecha_inicio=create mc_fecha_inicio
this.dw_csal_profesor=create dw_csal_profesor
this.dw_csal_salones_cambios_conteo_profesor=create dw_csal_salones_cambios_conteo_profesor
this.dw_csal_salones_cambios_conteo=create dw_csal_salones_cambios_conteo
this.cbx_fechas=create cbx_fechas
this.em_fecha_final=create em_fecha_final
this.st_1=create st_1
this.em_fecha_inicio=create em_fecha_inicio
this.st_materia=create st_materia
this.st_salon=create st_salon
this.sle_salon=create sle_salon
this.st_profesor=create st_profesor
this.dw_csal_materias_grupo=create dw_csal_materias_grupo
this.dw_csal_materias=create dw_csal_materias
this.cb_filtrar=create cb_filtrar
this.cbx_extraordinarias=create cbx_extraordinarias
this.cbx_temporales=create cbx_temporales
this.st_periodo=create st_periodo
this.st_anio=create st_anio
this.dw_csal_salones_temporales=create dw_csal_salones_temporales
this.dw_csal_salones_cambios=create dw_csal_salones_cambios
this.cb_cargar=create cb_cargar
this.sle_periodo=create sle_periodo
this.sle_anio=create sle_anio
this.gb_filtros=create gb_filtros
this.gb_parametros=create gb_parametros
this.rb_cambios=create rb_cambios
this.rb_temporales=create rb_temporales
this.dw_csal_rep_salones_temporales=create dw_csal_rep_salones_temporales
this.dw_csal_rep_salones_cambios=create dw_csal_rep_salones_cambios
this.Control[]={this.cbx_limpiar,&
this.mc_fecha_final,&
this.mc_fecha_inicio,&
this.dw_csal_profesor,&
this.dw_csal_salones_cambios_conteo_profesor,&
this.dw_csal_salones_cambios_conteo,&
this.cbx_fechas,&
this.em_fecha_final,&
this.st_1,&
this.em_fecha_inicio,&
this.st_materia,&
this.st_salon,&
this.sle_salon,&
this.st_profesor,&
this.dw_csal_materias_grupo,&
this.dw_csal_materias,&
this.cb_filtrar,&
this.cbx_extraordinarias,&
this.cbx_temporales,&
this.st_periodo,&
this.st_anio,&
this.dw_csal_salones_temporales,&
this.dw_csal_salones_cambios,&
this.cb_cargar,&
this.sle_periodo,&
this.sle_anio,&
this.gb_filtros,&
this.gb_parametros,&
this.rb_cambios,&
this.rb_temporales,&
this.dw_csal_rep_salones_temporales,&
this.dw_csal_rep_salones_cambios}
end on

on w_csal_reporte_salones_movimientos.destroy
destroy(this.cbx_limpiar)
destroy(this.mc_fecha_final)
destroy(this.mc_fecha_inicio)
destroy(this.dw_csal_profesor)
destroy(this.dw_csal_salones_cambios_conteo_profesor)
destroy(this.dw_csal_salones_cambios_conteo)
destroy(this.cbx_fechas)
destroy(this.em_fecha_final)
destroy(this.st_1)
destroy(this.em_fecha_inicio)
destroy(this.st_materia)
destroy(this.st_salon)
destroy(this.sle_salon)
destroy(this.st_profesor)
destroy(this.dw_csal_materias_grupo)
destroy(this.dw_csal_materias)
destroy(this.cb_filtrar)
destroy(this.cbx_extraordinarias)
destroy(this.cbx_temporales)
destroy(this.st_periodo)
destroy(this.st_anio)
destroy(this.dw_csal_salones_temporales)
destroy(this.dw_csal_salones_cambios)
destroy(this.cb_cargar)
destroy(this.sle_periodo)
destroy(this.sle_anio)
destroy(this.gb_filtros)
destroy(this.gb_parametros)
destroy(this.rb_cambios)
destroy(this.rb_temporales)
destroy(this.dw_csal_rep_salones_temporales)
destroy(this.dw_csal_rep_salones_cambios)
end on

event open;dw_csal_salones_cambios.setTransObject(gtr_sumuia)
dw_csal_salones_temporales.setTransObject(gtr_sumuia)
dw_csal_salones_cambios_conteo.setTransObject(gtr_sumuia)
dw_csal_salones_cambios_conteo_profesor.setTransObject(gtr_sumuia)

//Profesor
dw_csal_profesor.settransobject(gtr_escolar)
dw_csal_profesor.getchild('profesor',idwc_profesor)
idwc_profesor.settransobject(gtr_escolar)

//Materia
dw_csal_materias.settransobject(gtr_escolar)
dw_csal_materias.getchild('materia',idwc_materias)
idwc_materias.settransobject(gtr_escolar)

//Grupos de una Materia
dw_csal_materias_grupo.settransobject(gtr_escolar)
dw_csal_materias_grupo.getchild('gpo',idwc_materias_grupo)
idwc_materias_grupo.settransobject(gtr_escolar)

dw_csal_rep_salones_temporales.visible=false
dw_csal_rep_salones_cambios.visible=true

em_fecha_inicio.text=string(today())
em_fecha_final.text=string(today())
id_fecha_inicio=today()
id_fecha_final=today()

mc_fecha_inicio.SetSelectedDate(today())
mc_fecha_final.SetSelectedDate(today())

end event

type cbx_limpiar from checkbox within w_csal_reporte_salones_movimientos
integer x = 5481
integer y = 200
integer width = 357
integer height = 92
integer taborder = 160
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Limpiar"
end type

event clicked;sle_salon.text=''
cbx_temporales.checked=true
cbx_extraordinarias.checked=true

//Profesor
dw_csal_profesor.SetRedraw(false)
dw_csal_profesor.Reset()
idwc_profesor.Retrieve()
if idwc_profesor.RowCount()>0 then dw_csal_profesor.InsertRow(0)
dw_csal_profesor.SetRedraw(true)	
		
//Materia
dw_csal_materias.Reset()
idwc_materias.Reset()
idwc_materias.Retrieve(ii_anio,ii_periodo)
if idwc_materias.RowCount()>0 then dw_csal_materias.insertrow(0)

//Grupos de una Materia
dw_csal_materias_grupo.Reset()
idwc_materias_grupo.Reset()
		
is_salon=''
il_profesor=0
il_materia=0
is_grupo=''

if cbx_fechas.checked=true then 
	cbx_fechas.checked=false
	em_fecha_inicio.enabled=false
	em_fecha_final.enabled=false
end if

if rb_cambios.checked=true then
	dw_csal_rep_salones_cambios.SetRedraw(false)
	dw_csal_rep_salones_cambios.SetFilter('')
	dw_csal_rep_salones_cambios.Filter()
	dw_csal_rep_salones_cambios.SetRedraw(true)	
else
	dw_csal_rep_salones_temporales.SetRedraw(false)
	dw_csal_rep_salones_temporales.SetFilter('')
	dw_csal_rep_salones_temporales.Filter()
	dw_csal_rep_salones_temporales.SetRedraw(true)
end if


this.checked=false


end event

type mc_fecha_final from monthcalendar within w_csal_reporte_salones_movimientos
boolean visible = false
integer x = 2235
integer y = 68
integer width = 1033
integer height = 636
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

event datechanged;this.GetSelectedDate(id_fecha_final)
em_fecha_final.text=string(id_fecha_final)

cb_cargar.SetFocus()

end event

event losefocus;uf_apaga_fecha_final()
end event

type mc_fecha_inicio from monthcalendar within w_csal_reporte_salones_movimientos
boolean visible = false
integer x = 1870
integer y = 64
integer width = 1029
integer height = 636
integer taborder = 70
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

event datechanged;this.GetSelectedDate(id_fecha_inicio)
em_fecha_inicio.text=string(id_fecha_inicio)

cb_cargar.SetFocus()


end event

event losefocus;uf_apaga_fecha_inicio()
end event

type dw_csal_profesor from u_basedw within w_csal_reporte_salones_movimientos
integer x = 3744
integer y = 204
integer width = 1358
integer height = 92
integer taborder = 140
boolean enabled = false
string dataobject = "d_csal_profesor_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("profesor", "profesor", "profesor")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then il_profesor=long(trim(this.gettext()))




end event

type dw_csal_salones_cambios_conteo_profesor from datawindow within w_csal_reporte_salones_movimientos
boolean visible = false
integer x = 4978
integer y = 44
integer width = 320
integer height = 168
string title = "none"
string dataobject = "d_csal_salones_cambios_conteo_profesor"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_csal_salones_cambios_conteo from datawindow within w_csal_reporte_salones_movimientos
boolean visible = false
integer x = 5056
integer y = 672
integer width = 274
integer height = 124
string title = "none"
string dataobject = "d_csal_salones_cambios_conteo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_fechas from checkbox within w_csal_reporte_salones_movimientos
integer x = 1819
integer y = 60
integer width = 645
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
boolean enabled = false
string text = "Fecha Reservación"
end type

event clicked;if this.checked=true then
	em_fecha_inicio.enabled=true
	em_fecha_final.enabled=true
else
	em_fecha_inicio.enabled=false
	em_fecha_final.enabled=false
end if
end event

type em_fecha_final from editmask within w_csal_reporte_salones_movimientos
integer x = 3022
integer y = 68
integer width = 402
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
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

type st_1 from statictext within w_csal_reporte_salones_movimientos
integer x = 2953
integer y = 72
integer width = 41
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "-"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fecha_inicio from editmask within w_csal_reporte_salones_movimientos
integer x = 2528
integer y = 72
integer width = 402
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
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

type st_materia from statictext within w_csal_reporte_salones_movimientos
integer x = 3465
integer y = 84
integer width = 274
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Materia:"
boolean focusrectangle = false
end type

type st_salon from statictext within w_csal_reporte_salones_movimientos
integer x = 2898
integer y = 212
integer width = 197
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Salón:"
boolean focusrectangle = false
end type

type sle_salon from singlelineedit within w_csal_reporte_salones_movimientos
integer x = 3154
integer y = 208
integer width = 265
integer height = 92
integer taborder = 130
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;is_salon=trim(this.text)
end event

type st_profesor from statictext within w_csal_reporte_salones_movimientos
integer x = 3456
integer y = 204
integer width = 270
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Profesor:"
boolean focusrectangle = false
end type

type dw_csal_materias_grupo from u_basedw within w_csal_reporte_salones_movimientos
integer x = 5175
integer y = 68
integer width = 210
integer height = 92
integer taborder = 90
boolean enabled = false
string dataobject = "d_csal_materias_grupos_drop"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("gpo", "gpo", "gpo")
end event

event itemchanged;call super::itemchanged;is_grupo=this.gettext()

end event

type dw_csal_materias from u_basedw within w_csal_reporte_salones_movimientos
integer x = 3744
integer y = 68
integer width = 1362
integer height = 92
integer taborder = 80
boolean enabled = false
string dataobject = "d_csal_materia_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("materia", "materia", "materia")
end event

event itemchanged;call super::itemchanged;il_materia=long(this.gettext())
is_grupo=''

dw_csal_materias_grupo.Reset()
idwc_materias_grupo.Reset()

idwc_materias_grupo.retrieve(ii_anio,ii_periodo,il_materia)
if idwc_materias_grupo.RowCount()>0 then dw_csal_materias_grupo.insertrow(0)

end event

type cb_filtrar from commandbutton within w_csal_reporte_salones_movimientos
integer x = 5166
integer y = 204
integer width = 242
integer height = 92
integer taborder = 150
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Filtrar"
end type

event clicked;if rb_cambios.checked=true then uf_filtrar_cambios() else uf_filtrar_temporales()
end event

type cbx_extraordinarias from checkbox within w_csal_reporte_salones_movimientos
integer x = 1819
integer y = 268
integer width = 562
integer height = 92
integer taborder = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Extraordinarias"
boolean checked = true
end type

type cbx_temporales from checkbox within w_csal_reporte_salones_movimientos
integer x = 1819
integer y = 160
integer width = 439
integer height = 92
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Temporales"
boolean checked = true
end type

type st_periodo from statictext within w_csal_reporte_salones_movimientos
integer x = 910
integer y = 208
integer width = 229
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Periodo:"
boolean focusrectangle = false
end type

type st_anio from statictext within w_csal_reporte_salones_movimientos
integer x = 978
integer y = 84
integer width = 160
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Año:"
boolean focusrectangle = false
end type

type dw_csal_salones_temporales from datawindow within w_csal_reporte_salones_movimientos
boolean visible = false
integer x = 5056
integer y = 456
integer width = 151
integer height = 80
string title = "none"
string dataobject = "d_csal_salones_temporales"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_csal_salones_cambios from datawindow within w_csal_reporte_salones_movimientos
boolean visible = false
integer x = 5038
integer y = 244
integer width = 270
integer height = 124
string title = "none"
string dataobject = "d_csal_salones_cambios"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cargar from commandbutton within w_csal_reporte_salones_movimientos
integer x = 1376
integer y = 60
integer width = 274
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cargar"
end type

event clicked;
if isnumber(trim(sle_anio.text)) then
	
	if isnumber(trim(sle_periodo.text)) then
		 
		ii_periodo=integer(	sle_periodo.text)
		ii_anio=integer(	sle_anio.text)
		
		uf_desactivar()
		
		if rb_cambios.checked=true then uf_cargar_cambios() else uf_cargar_temporales()

		idwc_materias.Retrieve(ii_anio,ii_periodo)
		if idwc_materias.RowCount()>0 then dw_csal_materias.insertrow(0)
		
		idwc_profesor.Retrieve()
		if idwc_profesor.RowCount()>0 then dw_csal_profesor.insertrow(0)
	
	else
		
		messagebox ("Error","Introduzca un valor de periodo correcto")
		
	end if
	
else
	
	messagebox ("Error","Introduzca un valor de año correcto")

end if


end event

type sle_periodo from singlelineedit within w_csal_reporte_salones_movimientos
integer x = 1157
integer y = 192
integer width = 178
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type sle_anio from singlelineedit within w_csal_reporte_salones_movimientos
integer x = 1157
integer y = 68
integer width = 183
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type gb_filtros from groupbox within w_csal_reporte_salones_movimientos
integer x = 1787
integer width = 4105
integer height = 404
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Filtros "
end type

type gb_parametros from groupbox within w_csal_reporte_salones_movimientos
integer x = 41
integer width = 1705
integer height = 404
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Parámetros"
end type

type rb_cambios from radiobutton within w_csal_reporte_salones_movimientos
integer x = 59
integer y = 96
integer width = 777
integer height = 92
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Cambios de Salón"
boolean checked = true
end type

event clicked;
dw_csal_rep_salones_temporales.visible=false

dw_csal_rep_salones_cambios.Reset()
dw_csal_rep_salones_cambios.visible=true

uf_desactivar()
end event

type rb_temporales from radiobutton within w_csal_reporte_salones_movimientos
integer x = 59
integer y = 196
integer width = 823
integer height = 92
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Reservaciones Temporales"
end type

event clicked;
dw_csal_rep_salones_cambios.visible=false

dw_csal_rep_salones_temporales.Reset()
dw_csal_rep_salones_temporales.visible=true

uf_desactivar()
end event

type dw_csal_rep_salones_temporales from datawindow within w_csal_reporte_salones_movimientos
integer x = 37
integer y = 420
integer width = 6546
integer height = 2348
string dataobject = "d_csal_rep_salones_temporales"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.Name='p_salvar' then f_exportar_reporte(dw_csal_rep_salones_temporales,1,"Reporte de Reservacion de Salon Temporal")


	if dwo.Type = "text" then
		
		choose case string(dwo.Name)
	
			case 'cve_salon_t'
				is_sort="#1A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='11527407'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("fecha_movimiento_t.background.color='15793151'")

			case 'nom_profesor_t'
				is_sort="#5A #3A #6A #1A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='11527407'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")

			case 'nom_materia_t'
				is_sort="#3A #6A #1A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='11527407'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("fecha_movimiento_t.background.color='15793151'")

			case 'cve_grupo_t'
				is_sort="#6A #3A #1A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='11527407'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("fecha_movimiento_t.background.color='15793151'")

			case 'tipo_reservacion_t'
				is_sort="#15A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='11527407'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")				
				this.Modify("fecha_movimiento_t.background.color='15793151'")

			case 'nom_dia_t'
				is_sort="#7A #9A #1A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='11527407'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")	
				this.Modify("fecha_movimiento_t.background.color='15793151'")
	
			case 'horario_t'
				is_sort="#9A #10A #7A #1A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='11527407'")
				this.Modify("lapso_t.background.color='15793151'")	
				this.Modify("fecha_movimiento_t.background.color='15793151'")

			case 'lapso_t'
				is_sort="#14A #7A #9A #1A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='11527407'")	
				this.Modify("fecha_movimiento_t.background.color='15793151'")
				
			case 'fecha_movimiento_t'
				is_sort="#19A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")	
				this.Modify("fecha_movimiento_t.background.color='11527407'")
				
		end choose

		this.SetSort(is_sort) 
		this.Sort() 		
		
	end if
	
end event

event doubleclicked;integer li_row
str_csal_salones_reservacion lstr_reservacion

if dwo.Type = "column" then
	
		if row>0 then

			li_row=row
			 
			if isvalid(w_csal_ficha_salon) then close(w_csal_ficha_salon) 

			lstr_reservacion.salon=this.GetItemString(li_row,"cve_salon") 
			lstr_reservacion.materia=this.GetItemString(li_row,"nom_materia") 
			lstr_reservacion.profesor=this.GetItemString(li_row,"nom_profesor") 
			lstr_reservacion.dia=this.GetItemString(li_row,"nom_dia") 
			lstr_reservacion.hora_inicio=this.GetItemNumber(li_row,"hora_inicio")
			lstr_reservacion.hora_final=this.GetItemNumber(li_row,"hora_final")
			lstr_reservacion.fecha_inicio=date(this.GetItemDateTime(li_row,"fecha_inicio"))
			lstr_reservacion.fecha_final=date(this.GetItemDateTime(li_row,"fecha_final"))
			lstr_reservacion.fecha_movimiento=this.GetItemDate(li_row,"fecha_movimiento")
			lstr_reservacion.grupo=this.GetItemString(li_row,"cve_grupo")
			lstr_reservacion.tipo_reservacion=this.GetItemString(li_row,"tipo_reservacion") 
			lstr_reservacion.observaciones=this.GetItemString(li_row,"observaciones") 
			lstr_reservacion.estatus_reservacion=this.GetItemNumber(li_row,"estatus") 
			lstr_reservacion.horario=this.GetItemString(li_row,"horario")
			lstr_reservacion.lapso_completo=this.GetItemNumber(li_row,"lapso_completo")
			lstr_reservacion.lapso=this.GetItemString(li_row,"lapso") 
			lstr_reservacion.cve_dia=this.GetItemNumber(li_row,"cve_dia") 
			lstr_reservacion.cve_materia=this.GetItemNumber(li_row,"cve_materia") 
			lstr_reservacion.periodo=ii_periodo
			lstr_reservacion.anio=ii_anio
			
			openwithparm(w_csal_ficha_salon, lstr_reservacion)
			
	end if
	
end if


end event

type dw_csal_rep_salones_cambios from datawindow within w_csal_reporte_salones_movimientos
integer x = 37
integer y = 420
integer width = 6546
integer height = 2348
string dataobject = "d_csal_rep_salones_cambios"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;integer li_row
str_csal_salones_reservacion lstr_reservacion

if dwo.Type = "column" then
	
		if row>0 then

			li_row=row
			 
			if isvalid(w_csal_ficha_salon) then close(w_csal_ficha_salon) 

			lstr_reservacion.salon=this.GetItemString(li_row,"cve_salon") 
			lstr_reservacion.materia=this.GetItemString(li_row,"nom_materia") 
			lstr_reservacion.profesor=this.GetItemString(li_row,"nom_profesor") 
			lstr_reservacion.dia=this.GetItemString(li_row,"nom_dia") 
			lstr_reservacion.hora_inicio=this.GetItemNumber(li_row,"hora_inicio")
			lstr_reservacion.hora_final=this.GetItemNumber(li_row,"hora_final")
			lstr_reservacion.fecha_movimiento=this.GetItemDate(li_row,"fecha_movimiento")
			lstr_reservacion.grupo=this.GetItemString(li_row,"cve_grupo")
			lstr_reservacion.tipo_reservacion=this.GetItemString(li_row,"tipo_reservacion") 
			lstr_reservacion.observaciones=this.GetItemString(li_row,"observaciones") 
			lstr_reservacion.estatus_reservacion=this.GetItemNumber(li_row,"estatus") 
			lstr_reservacion.horario=this.GetItemString(li_row,"horario")
			lstr_reservacion.lapso_completo=this.GetItemNumber(li_row,"lapso_completo")
			lstr_reservacion.lapso=this.GetItemString(li_row,"lapso") 
			lstr_reservacion.cve_dia=this.GetItemNumber(li_row,"cve_dia") 
			lstr_reservacion.cve_materia=this.GetItemNumber(li_row,"cve_materia") 
			lstr_reservacion.periodo=ii_periodo
			lstr_reservacion.anio=ii_anio
			
			openwithparm(w_csal_ficha_salon, lstr_reservacion)
			
	end if
	
end if


end event

event clicked;if dwo.Name='p_salvar' then f_exportar_reporte(dw_csal_rep_salones_cambios,1,"Reporte de Cambios de Salon ")
 
end event

