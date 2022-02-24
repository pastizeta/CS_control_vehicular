$PBExportHeader$w_com_solicitud_espacio.srw
$PBExportComments$Solicitud de espacios laboratorios de comunicación
forward
global type w_com_solicitud_espacio from window
end type
type cb_2 from commandbutton within w_com_solicitud_espacio
end type
type cb_actualizar from commandbutton within w_com_solicitud_espacio
end type
type tab_datos from tab within w_com_solicitud_espacio
end type
type tabpage_espacio from userobject within tab_datos
end type
type cb_elimina_espacio from commandbutton within tabpage_espacio
end type
type dw_solicitud from datawindow within tabpage_espacio
end type
type dw_detalle from datawindow within tabpage_espacio
end type
type tabpage_espacio from userobject within tab_datos
cb_elimina_espacio cb_elimina_espacio
dw_solicitud dw_solicitud
dw_detalle dw_detalle
end type
type tabpage_general from userobject within tab_datos
end type
type dw_solicitante from datawindow within tabpage_general
end type
type tabpage_general from userobject within tab_datos
dw_solicitante dw_solicitante
end type
type tabpage_impresion from userobject within tab_datos
end type
type cb_1 from commandbutton within tabpage_impresion
end type
type dw_impresion from datawindow within tabpage_impresion
end type
type tabpage_impresion from userobject within tab_datos
cb_1 cb_1
dw_impresion dw_impresion
end type
type tab_datos from tab within w_com_solicitud_espacio
tabpage_espacio tabpage_espacio
tabpage_general tabpage_general
tabpage_impresion tabpage_impresion
end type
end forward

global type w_com_solicitud_espacio from window
integer width = 3580
integer height = 2173
boolean titlebar = true
string title = "Solicitud de Espacio"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 29534863
cb_2 cb_2
cb_actualizar cb_actualizar
tab_datos tab_datos
end type
global w_com_solicitud_espacio w_com_solicitud_espacio

type variables
integer ii_tipo_movto, ii_status=0

string is_fecha_string 
long  il_fecha_ini, il_fecha_fin 

integer ii_grupo 
end variables

forward prototypes
public function n_transportar wf_busca_empleado (long al_nomina)
public function string wf_busca_alumno (long al_cuenta)
public subroutine wf_inicio_nueva (n_transportar uo_parametros)
public subroutine wf_inicio_existente (n_transportar uo_parametros)
end prototypes

public function n_transportar wf_busca_empleado (long al_nomina);string ls_nombrecompleto,ls_costo,ls_depto
n_transportar uo_salida
//string ls_datossalida[]
setpointer(hourglass!)
if al_nomina<>0 then
    SELECT nombre+' '+isnull(appaterno,'') +' ' +isnull(apmaterno,'') as nombrecompleto,   
         ccosto,   
         nombredepto  
    INTO :ls_nombrecompleto,   
         :ls_costo,   
         :ls_depto  
    FROM empl_uia1  
   WHERE empl_uia1.empleado = :al_nomina   using gtr_personal;
		if gtr_personal.sqlcode=0 then
			//TODO OK
			uo_salida.is_parm1=ls_nombrecompleto
			uo_salida.il_parm1=long(ls_costo)
		else
			messagebox("Mensaje del Sistema","La cuenta ingresada no existe",stopsign!)
		end if			
	end if
	commit using gtr_personal;
return uo_salida
end function

public function string wf_busca_alumno (long al_cuenta);string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
boolean lb_error=true

setpointer(hourglass!)
if al_cuenta<>0 then

  SELECT v_sce_banderas_inscrito.cuenta,   
	         v_sce_alumnos.nombre+ ' ' + v_sce_alumnos.apaterno+' ' +v_sce_alumnos.amaterno as nombre_completo  ,
			v_sce_carreras.carrera
   INTO :ll_cuenta_inscrito,   
	       :ls_nombrecompleto,
		   :ls_carrera
	FROM    v_sce_alumnos INNER JOIN
                 v_sce_academicos ON v_sce_alumnos.cuenta = v_sce_academicos.cuenta INNER JOIN
                 v_sce_carreras ON v_sce_academicos.cve_carrera = v_sce_carreras.cve_carrera LEFT OUTER JOIN
                 v_sce_banderas_inscrito ON v_sce_alumnos.cuenta = v_sce_banderas_inscrito.cuenta
	   WHERE v_sce_alumnos.cuenta = :al_cuenta
	  using gtr_sumuia;
		if gtr_sumuia.sqlcode=0 then
			//TODO OK
			if  isnull(ll_cuenta_inscrito) then
				messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
			end if
		else
			messagebox("Mensaje del Sistema","La cuenta ingresada no existe",stopsign!)

		end if			
	end if
return ls_nombrecompleto
end function

public subroutine wf_inicio_nueva (n_transportar uo_parametros);datawindowchild idwc_periodo

integer	li_dias,i,li_linea,li_periodo, liAno
datetime ldt_fecha_inicio,ldt_fecha_final,ldt_fecha
string ldt_fecha_inicio1,ldt_fecha_final1
string	lsPeriodo
integer	iAñoFecha

ii_status=uo_parametros.ii_parm8
//CHILD PERIODO
tab_datos.tabpage_espacio.dw_solicitud.settransobject(gtr_sumuia)
tab_datos.tabpage_espacio.dw_solicitud.getchild('cveperiodo',idwc_periodo)
idwc_periodo.settransobject(gtr_sumuia)
idwc_periodo.retrieve(gi_depto)
ldt_fecha_inicio = datetime(uo_parametros.id_parm1, time(uo_parametros.ii_parm2,uo_parametros.ii_parm6,0))
ldt_fecha_final = datetime(uo_parametros.id_parm2, time(uo_parametros.ii_parm3,uo_parametros.ii_parm7 - 1 ,0))

iAñoFecha = integer(Mid(string(ldt_fecha_final,'dd/mm/yyyy'),7,4))
ldt_fecha_inicio1 = string(ldt_fecha_final,'dd/mm/yyyy')
ldt_fecha_final1 = string(ldt_fecha_final,'dd/mm/yyyy')


is_fecha_string = Mid(ldt_fecha_inicio1,7,4) + Mid(ldt_fecha_inicio1,4,2) + Mid(ldt_fecha_inicio1,1,2) //Año/Mes/Dia
il_fecha_ini = long(is_fecha_string)
is_fecha_string = Mid(ldt_fecha_final1,7,4) + Mid(ldt_fecha_final1,4,2) + Mid(ldt_fecha_final1,1,2) //Año/Mes/Dia
il_fecha_fin = long(is_fecha_string)	

//INSERTA DATOS DEL ESPACIO SOLICITADO		
	tab_datos.tabpage_espacio.dw_solicitud.insertrow(0)
	select cveperiodo 
	into :li_periodo
	from spre_periodos 
//	where cvedepto=:gi_depto and fecha_inicio between ldt_fecha_inicio1 and ldt_fecha_final1 using gtr_sumuia;
	where cvedepto=:gi_depto and
	spre_periodos.fecha_fin > :ldt_fecha_inicio and spre_periodos.fecha_inicio < :ldt_fecha_inicio 	
	using gtr_sumuia;
	
//		DESCRIPCIÓN DEL PERIODO CORRECTO GMN.
	SELECT dbo.spre_periodos.descripcion  
    INTO :lsPeriodo   
    FROM dbo.spre_periodos  
   WHERE ( dbo.spre_periodos.cvedepto =:gi_depto and anio =:iAñoFecha and cveperiodo=:li_periodo )
	using gtr_sumuia;
	

if uo_parametros.ii_parm7=0 then 
	uo_parametros.ii_parm7=60
	uo_parametros.ii_parm3= uo_parametros.ii_parm3 - 1
end if
	tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'fecha_solicitud',today())
	tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'cveperiodo',li_periodo)
	tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'fecha_inicio',datetime(uo_parametros.id_parm1, time(uo_parametros.ii_parm2,uo_parametros.ii_parm6,0)))
	tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'fecha_fin',datetime(uo_parametros.id_parm2, time(uo_parametros.ii_parm3,uo_parametros.ii_parm7 - 1 ,0)))
	tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'status',uo_parametros.ii_parm8)
	tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'cvedepto',gi_depto)
	tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'periodo',lsPeriodo)
	
	li_dias=daysafter(uo_parametros.id_parm1,uo_parametros.id_parm2)+1
	ldt_fecha_inicio=datetime(uo_parametros.id_parm1,time(uo_parametros.ii_parm2,uo_parametros.ii_parm6,0))
	ldt_fecha_final=datetime(uo_parametros.id_parm1,time(uo_parametros.ii_parm3,uo_parametros.ii_parm7 - 1,0))
	for i=1 to li_dias
		tab_datos.tabpage_espacio.dw_detalle.insertrow(0)
		tab_datos.tabpage_espacio.dw_detalle.setitem(i,'cvematerial',uo_parametros.is_parm1)
		tab_datos.tabpage_espacio.dw_detalle.setitem(i,'cvegrupo',uo_parametros.ii_parm5)
		tab_datos.tabpage_espacio.dw_detalle.setitem(i,'descripcion',uo_parametros.is_parm2)
		tab_datos.tabpage_espacio.dw_detalle.setitem(i,'status',ii_status)
		tab_datos.tabpage_espacio.dw_detalle.setitem(i,'consecutivo',i)
		tab_datos.tabpage_espacio.dw_detalle.setitem(i,'cvedepto',gi_depto)
		tab_datos.tabpage_espacio.dw_detalle.setitem(i,'cvearea',gi_area)
		tab_datos.tabpage_espacio.dw_detalle.setitem(i,'fecha_inicio1',ldt_fecha_inicio)
		tab_datos.tabpage_espacio.dw_detalle.setitem(i,'fecha_inicio',ldt_fecha_inicio)
		tab_datos.tabpage_espacio.dw_detalle.setitem(i,'fecha_final1',ldt_fecha_final)
		tab_datos.tabpage_espacio.dw_detalle.setitem(i,'fecha_final',ldt_fecha_final)
		
		ldt_fecha_inicio=datetime(relativedate(uo_parametros.id_parm1,i),time(uo_parametros.ii_parm2,uo_parametros.ii_parm6,0))
		ldt_fecha_final=datetime(relativedate(uo_parametros.id_parm1,i),time(uo_parametros.ii_parm3,uo_parametros.ii_parm7 - 1,0))
	next

	tab_datos.tabpage_general.dw_solicitante.insertrow(0)
	tab_datos.tabpage_general.dw_solicitante.setitem(1,'cvedepto',gi_depto)

//	li_linea=tab_datos.tabpage_equipo.dw_equipos_solicitud.insertrow(0)
//	tab_datos.tabpage_equipo.dw_equipos_solicitud.setitem(li_linea,'cvedepto',gi_depto)
//	tab_datos.tabpage_equipo.dw_equipos_solicitud.setitem(li_linea,'folio',tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'folio'))
//	tab_datos.tabpage_equipo.dw_equipos_solicitud.setitem(li_linea,'cveequipo',0)	
//	tab_datos.tabpage_equipo.dw_equipos_solicitud.setitem(li_linea,'cantidad',0)	
		
end subroutine

public subroutine wf_inicio_existente (n_transportar uo_parametros);
integer li_folio, iAñoFecha, li_periodo
datetime ld_fechafin, ld_fechaini, ldt_fecha
string lsperiodo, ld_fechafin1, ld_fechaini1
datawindowchild idwc_periodo,idwc_soldepto,idwc_respdepto,idwc_avaldepto
li_folio=uo_parametros.ii_parm4
ii_grupo = uo_parametros.ii_parm5


//CHILD PERIODO
tab_datos.tabpage_espacio.dw_solicitud.settransobject(gtr_sumuia)
tab_datos.tabpage_espacio.dw_solicitud.getchild('cveperiodo',idwc_periodo)
idwc_periodo.settransobject(gtr_sumuia)
idwc_periodo.retrieve(gi_depto)

// 
ld_fechaini = datetime(uo_parametros.id_parm1, time(uo_parametros.ii_parm2,uo_parametros.ii_parm6,0))
ld_fechafin = datetime(uo_parametros.id_parm2, time(uo_parametros.ii_parm3,uo_parametros.ii_parm7 - 1 ,0))
iAñoFecha = integer(Mid(string(ld_fechafin,'dd/mm/yyyy'),7,4))

ld_fechaini1 = string(ld_fechafin,'dd/mm/yyyy')
ld_fechafin1 = string(ld_fechafin,'dd/mm/yyyy')


is_fecha_string = Mid(ld_fechaini1,7,4) + Mid(ld_fechaini1,4,2) + Mid(ld_fechaini1,1,2) //Año/Mes/Dia
il_fecha_ini = long(is_fecha_string)
is_fecha_string = Mid(ld_fechafin1,7,4) + Mid(ld_fechafin1,4,2) + Mid(ld_fechafin1,1,2) //Año/Mes/Dia
il_fecha_fin = long(is_fecha_string)	

//INSERTA DATOS DEL ESPACIO SOLICITADO		
	tab_datos.tabpage_espacio.dw_solicitud.insertrow(0)
	select cveperiodo 
	into :li_periodo
	from spre_periodos 
	where cvedepto=:gi_depto and
	spre_periodos.fecha_fin > :ld_fechaini and spre_periodos.fecha_inicio < :ld_fechaini
	using gtr_sumuia;
	
//		DESCRIPCIÓN DEL PERIODO CORRECTO GMN.
	SELECT dbo.spre_periodos.descripcion  
   INTO :lsPeriodo   
   FROM dbo.spre_periodos  
   WHERE ( dbo.spre_periodos.cvedepto =:gi_depto and anio =:iAñoFecha and cveperiodo=:li_periodo )
	using gtr_sumuia;
	
// ---

//CHILD DEPTOS IMPRESION
tab_datos.tabpage_impresion.dw_impresion.getchild('sol_depto',idwc_soldepto)
tab_datos.tabpage_impresion.dw_impresion.getchild('resp_depto',idwc_respdepto)
tab_datos.tabpage_impresion.dw_impresion.getchild('aval_depto',idwc_avaldepto)
idwc_soldepto.settransobject(gtr_personal)
idwc_respdepto.settransobject(gtr_personal)
idwc_avaldepto.settransobject(gtr_personal)
idwc_soldepto.retrieve()
idwc_respdepto.retrieve()
idwc_avaldepto.retrieve()

tab_datos.tabpage_general.dw_solicitante.retrieve(li_folio,gi_depto)
tab_datos.tabpage_espacio.dw_solicitud.retrieve(li_folio,gi_depto)
tab_datos.tabpage_espacio.dw_detalle.retrieve(li_folio,gi_depto,gi_area,ii_grupo)
//tab_datos.tabpage_equipo.dw_equipos_solicitud.retrieve(li_folio,gi_depto)
tab_datos.tabpage_impresion.dw_impresion.retrieve(gi_depto,li_folio,ii_grupo)
ii_status=tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'status')
tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'periodo',lsPeriodo)


end subroutine

on w_com_solicitud_espacio.create
this.cb_2=create cb_2
this.cb_actualizar=create cb_actualizar
this.tab_datos=create tab_datos
this.Control[]={this.cb_2,&
this.cb_actualizar,&
this.tab_datos}
end on

on w_com_solicitud_espacio.destroy
destroy(this.cb_2)
destroy(this.cb_actualizar)
destroy(this.tab_datos)
end on

event open;datawindowchild idwc_soldepto,idwc_respdepto,idwc_avaldepto

n_transportar uo_parametros
uo_parametros = Message.PowerObjectParm

tab_datos.tabpage_general.dw_solicitante.settransobject(gtr_sumuia)
tab_datos.tabpage_espacio.dw_solicitud.settransobject(gtr_sumuia)
tab_datos.tabpage_espacio.dw_detalle.settransobject(gtr_sumuia)
//tab_datos.tabpage_equipo.dw_equipos_solicitud.settransobject(gtr_sumuia)
tab_datos.tabpage_impresion.dw_impresion.settransobject(gtr_sumuia)
ii_tipo_movto=uo_parametros.ii_parm1


tab_datos.tabpage_general.dw_solicitante.getchild('sol_depto',idwc_soldepto)
tab_datos.tabpage_general.dw_solicitante.getchild('resp_depto',idwc_respdepto)
tab_datos.tabpage_general.dw_solicitante.getchild('aval_depto',idwc_avaldepto)
idwc_soldepto.settransobject(gtr_personal)
idwc_respdepto.settransobject(gtr_personal)
idwc_avaldepto.settransobject(gtr_personal)
idwc_soldepto.retrieve()
idwc_respdepto.retrieve()
idwc_avaldepto.retrieve()
m_principal.m_archivo.m_imprimir.enabled=True
m_principal.m_archivo.m_imprimir.ToolbarItemVisible=True

if ii_tipo_movto =0 then
	//NUEVA
	wf_inicio_nueva(uo_parametros)
else
	//EXISTENTE
	wf_inicio_existente(uo_parametros)
end if


end event

event activate;

actualizar=cb_actualizar
eliminar=tab_datos.tabpage_espacio.cb_elimina_espacio
dw=tab_datos.tabpage_impresion.dw_impresion



n_transportar uo_parametros
uo_parametros = Message.PowerObjectParm

if isvalid(Message.PowerObjectParm) then
if uo_parametros.is_parm1="BUSQUEDA" then
	if uo_parametros.is_parm5='sol_num' then
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'sol_num',uo_parametros.il_parm1)
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'sol_nombre',uo_parametros.is_parm2)
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'sol_depto',integer(uo_parametros.is_parm4))
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'sol_tipo',uo_parametros.ii_parm2)		
	end if
	if uo_parametros.is_parm5='resp_num' then
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'resp_num',uo_parametros.il_parm1)
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'resp_nombre',uo_parametros.is_parm2)
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'resp_depto',integer(uo_parametros.is_parm4))
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'resp_tipo',uo_parametros.ii_parm2)		
	end if
	if uo_parametros.is_parm5='aval_num' then
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'aval_num',uo_parametros.il_parm1)
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'aval_nombre',uo_parametros.is_parm2)
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'aval_depto',integer(uo_parametros.is_parm4))
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'aval_tipo',uo_parametros.ii_parm2)		
	end if
end if
ii_grupo = uo_parametros.ii_parm5
end if
end event

type cb_2 from commandbutton within w_com_solicitud_espacio
integer x = 3182
integer y = 1779
integer width = 252
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Salir"
end type

event clicked;close(parent)
end event

type cb_actualizar from commandbutton within w_com_solicitud_espacio
integer x = 969
integer y = 1786
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualiza"
end type

event clicked;long ll_folio,i
long ll_cuenta
boolean lb_error=false
datawindowchild idwc_soldepto,idwc_respdepto,idwc_avaldepto

if tab_datos.tabpage_general.dw_solicitante.getitemnumber(1,'sol_num') > 0 then

	if ii_tipo_movto=0 then
	
		//ASIGNA EL FOLIO
		SELECT isnull(max(folio),0)+1 
		into :ll_folio
		from spre_solicitud 
		where cvedepto=:gi_depto
		using gtr_sumuia;
		tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'folio',ll_folio)
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'folio',ll_folio)
		tab_datos.tabpage_general.dw_solicitante.setitem(1,'fechacarga',today())
		
		//		SE AGREGA PARA GUARDAR EN spre_solicitud EL solicitanteid y que no se registre en 0
		ll_cuenta=tab_datos.tabpage_general.dw_solicitante.getitemnumber(1,'sol_num')
		tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'solicitanteid',ll_cuenta)
	
		
		for i=1 to tab_datos.tabpage_espacio.dw_detalle.rowcount()
			tab_datos.tabpage_espacio.dw_detalle.setitem(i,'folio',ll_folio)		
		next	
	//	for i=1 to tab_datos.tabpage_equipo.dw_equipos_solicitud.rowcount()
	//		tab_datos.tabpage_equipo.dw_equipos_solicitud.setitem(i,'folio',ll_folio)
	//	next
	//else
	//	ll_folio=tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'folio')
	//end if
		if tab_datos.tabpage_espacio.dw_solicitud.update()<>1 then lb_error=true
		if tab_datos.tabpage_espacio.dw_detalle.update()<>1 then lb_error=true
		if tab_datos.tabpage_general.dw_solicitante.update()<>1 then lb_error=true
	//	if tab_datos.tabpage_equipo.dw_equipos_solicitud.update()<>1 then lb_error=true
		
		if not(lb_error) then
			commit using gtr_sumuia;
			ii_tipo_movto=1
			 messagebox("Mensaje del Sistema","La información se ha registrado con exito, el reporte de impresion se encuentra listo",information!)
			 
			//CHILD DEPTOS IMPRESION
			tab_datos.tabpage_impresion.dw_impresion.getchild('sol_depto',idwc_soldepto)
			tab_datos.tabpage_impresion.dw_impresion.getchild('resp_depto',idwc_respdepto)
			tab_datos.tabpage_impresion.dw_impresion.getchild('aval_depto',idwc_avaldepto)
			idwc_soldepto.settransobject(gtr_personal)
			idwc_respdepto.settransobject(gtr_personal)
			idwc_avaldepto.settransobject(gtr_personal)
			idwc_soldepto.retrieve()
			idwc_respdepto.retrieve()
			idwc_avaldepto.retrieve()
			tab_datos.tabpage_impresion.dw_impresion.retrieve(gi_depto,ll_folio,ii_grupo)
			ii_status=tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'status')
			if ii_status = 0 then
				tab_datos.tabpage_impresion.dw_impresion.object.t_tipo_solicitud.text = "Espacio Activo"
			elseif ii_status = 5 then
				tab_datos.tabpage_impresion.dw_impresion.object.t_tipo_solicitud.text = "Reservación"
			end if
		else
			rollback using gtr_sumuia;
			 messagebox("Mensaje del Sistema","Ha ocurrido un error al almacenar la información, revisela e intente nuevamente",stopsign!)
		end if
	else
		
		ll_folio=tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'folio')
		if tab_datos.tabpage_espacio.dw_solicitud.update()<>1 then lb_error=true
		if tab_datos.tabpage_espacio.dw_detalle.update()<>1 then lb_error=true //gloria hoy
	//	if tab_datos.tabpage_equipo.dw_equipos_solicitud.update()<>1 then lb_error=true //gloria
		//
		if tab_datos.tabpage_general.dw_solicitante.ModifiedCount() > 0 then
			
			if tab_datos.tabpage_general.dw_solicitante.update(true,true) = 1 then
				
			else
				rollback using gtr_sumuia;
				Messagebox("Algunos datos son incorrectos","Revise los datos")
				lb_error=false
			end if
		
		end if
	
		if not(lb_error) then
			commit using gtr_sumuia;
			ii_tipo_movto=1
			 messagebox("Mensaje del Sistema","La información se ha registrado con exito, el reporte de impresion se encuentra listo",information!)
			 
			//CHILD DEPTOS IMPRESION
			tab_datos.tabpage_impresion.dw_impresion.getchild('sol_depto',idwc_soldepto)
			tab_datos.tabpage_impresion.dw_impresion.getchild('resp_depto',idwc_respdepto)
			tab_datos.tabpage_impresion.dw_impresion.getchild('aval_depto',idwc_avaldepto)
			idwc_soldepto.settransobject(gtr_personal)
			idwc_respdepto.settransobject(gtr_personal)
			idwc_avaldepto.settransobject(gtr_personal)
			idwc_soldepto.retrieve()
			idwc_respdepto.retrieve()
			idwc_avaldepto.retrieve()
			tab_datos.tabpage_impresion.dw_impresion.retrieve(gi_depto,ll_folio,ii_grupo)
			ii_status=tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'status')
			if ii_status = 0 then
				tab_datos.tabpage_impresion.dw_impresion.object.t_tipo_solicitud.text = "Espacio Activo"
			elseif ii_status = 5 then
				tab_datos.tabpage_impresion.dw_impresion.object.t_tipo_solicitud.text = "Reservación"
			end if
		else
			rollback using gtr_sumuia;
			 messagebox("Mensaje del Sistema","Ha ocurrido un error al almacenar la información, revisela e intente nuevamente",stopsign!)
		end if
		//
	end if
else
	Messagebox("Mensaje del Sistema","Debe cargar datos del solicitante")
end if
end event

type tab_datos from tab within w_com_solicitud_espacio
integer x = 48
integer y = 58
integer width = 3397
integer height = 1651
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 29534863
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_espacio tabpage_espacio
tabpage_general tabpage_general
tabpage_impresion tabpage_impresion
end type

on tab_datos.create
this.tabpage_espacio=create tabpage_espacio
this.tabpage_general=create tabpage_general
this.tabpage_impresion=create tabpage_impresion
this.Control[]={this.tabpage_espacio,&
this.tabpage_general,&
this.tabpage_impresion}
end on

on tab_datos.destroy
destroy(this.tabpage_espacio)
destroy(this.tabpage_general)
destroy(this.tabpage_impresion)
end on

event selectionchanged;//indices 0- 2

if newindex =1 then
	eliminar=this.tabpage_espacio.cb_elimina_espacio
//else
//	eliminar=this.tabpage_equipo.cb_elimina_equipo
//	nuevo=this.tabpage_equipo.cb_agrega_equipo
end if
end event

type tabpage_espacio from userobject within tab_datos
integer x = 15
integer y = 99
integer width = 3368
integer height = 1539
long backcolor = 29534863
string text = "Datos del Espacio (ISLA)"
long tabtextcolor = 33554432
long tabbackcolor = 29534863
long picturemaskcolor = 536870912
cb_elimina_espacio cb_elimina_espacio
dw_solicitud dw_solicitud
dw_detalle dw_detalle
end type

on tabpage_espacio.create
this.cb_elimina_espacio=create cb_elimina_espacio
this.dw_solicitud=create dw_solicitud
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_elimina_espacio,&
this.dw_solicitud,&
this.dw_detalle}
end on

on tabpage_espacio.destroy
destroy(this.cb_elimina_espacio)
destroy(this.dw_solicitud)
destroy(this.dw_detalle)
end on

type cb_elimina_espacio from commandbutton within tabpage_espacio
boolean visible = false
integer x = 2889
integer y = 58
integer width = 388
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Elimina"
end type

event clicked;if dw_detalle.rowcount()>1 then
	dw_detalle.deleterow(dw_detalle.getrow())
else
	messagebox("Mensaje del Sistema","No es posible eliminar el renglon ya que es la unica fecha apartada",stopsign!)
end if
end event

type dw_solicitud from datawindow within tabpage_espacio
integer x = 26
integer y = 64
integer width = 2542
integer height = 496
integer taborder = 10
string title = "none"
string dataobject = "d_com_solicitud"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;integer i

if dwo.name='status' then
	CHOOSE CASE long(data)
		CASE 0//MUEVE A ACTIVO
			CHOOSE CASE ii_status
				CASE 0 //ESTABA ACTIVO NO PASA NADA 
					for i=1 to dw_detalle.rowcount()
						if dw_detalle.getitemnumber(i,'status')=0 then dw_detalle.setitem(i,'status',0)
					next
				CASE 5 //ESTABA RESERVADO,  ESTA COMBINACION ES VALIDA PASA DE RESERVADO A ACTIVO
					for i=1 to dw_detalle.rowcount()
						if dw_detalle.getitemnumber(i,'status')=5 then dw_detalle.setitem(i,'status',0)
					next
				CASE ELSE	//ESTABA CANCELADO POR NO CONFIRMAR,POR EL SOLICITANTE,CANCELADO ESTA COMBINACION NO ES VALIDA, REPITE SOLICITUD
					messagebox('Mensaje del Sistema','No es posible CONFIRMAR la solicitud debido a que se encuentra CANCELADA',stopsign!)
					this.setitem(row,'status',3)
			END CHOOSE
		CASE 1 //MUEVE A ENTREGADO
			CHOOSE CASE ii_status
				CASE 0 //ESTABA CONFIRMADO,  ESTA COMBINACION NO HACE NADA						
					for i=1 to dw_detalle.rowcount()
						if dw_detalle.getitemnumber(i,'status')=0 then dw_detalle.setitem(i,'status',1)
					next
			END CHOOSE		
		CASE 2 //MUEVE A CONFIRMADO
			CHOOSE CASE ii_status
				CASE 0 //ESTABA CONFIRMADO,  ESTA COMBINACION NO HACE NADA						
					for i=1 to dw_detalle.rowcount()
						if dw_detalle.getitemnumber(i,'status')=0 then dw_detalle.setitem(i,'status',2)
					next
				CASE 5
					for i=1 to dw_detalle.rowcount()
						if dw_detalle.getitemnumber(i,'status')=5 then dw_detalle.setitem(i,'status',2)
					next
			END CHOOSE		
//		CASE 3,4,5 //ESTA CANCELANDO
//			CHOOSE CASE ii_status
//				CASE 1,2 //ESTABA APARTADO, PUEDE CANCELARLO
//				Messagebox("Mensaje del Sistema","Recuerde que una vez cancelada la solicitud, podria requerir una nueva si desea reasignarla",exclamation!)
//				for i=1 to dw_detalle.rowcount()
//					dw_detalle.setitem(i,'status',3)
//				next
//				CASE ELSE	//ES INDISTINTO CAMBIAR EL RESTO DE LOS STATUS
//				for i=1 to dw_detalle.rowcount()
//					dw_detalle.setitem(i,'status',3)
//				next					
//			END CHOOSE					
END CHOOSE
end if
end event

type dw_detalle from datawindow within tabpage_espacio
integer x = 33
integer y = 611
integer width = 3313
integer height = 794
integer taborder = 20
string title = "Solicitu de Apartado de Espacios"
string dataobject = "d_com_materiales_solicitud"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;
if currentrow>0 then
	selectrow(0,false)
	selectrow(currentrow,true)
else
	selectrow(0,false)
end if
end event

type tabpage_general from userobject within tab_datos
integer x = 15
integer y = 99
integer width = 3368
integer height = 1539
long backcolor = 29534863
string text = "Datos Solicitante"
long tabtextcolor = 33554432
long tabbackcolor = 29534863
long picturemaskcolor = 536870912
dw_solicitante dw_solicitante
end type

on tabpage_general.create
this.dw_solicitante=create dw_solicitante
this.Control[]={this.dw_solicitante}
end on

on tabpage_general.destroy
destroy(this.dw_solicitante)
end on

type dw_solicitante from datawindow within tabpage_general
integer x = 216
integer y = 186
integer width = 2856
integer height = 896
integer taborder = 20
string title = "none"
string dataobject = "d_com_datos_evento"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;n_transportar uo_parametros
CHOOSE CASE dwo.name
	
	CASE 'sol_num'
		CHOOSE CASE this.getitemnumber(1,'sol_tipo')
			CASE 1
			this.setitem(1,'sol_nombre',wf_busca_alumno(long(data)))
			/*statementblock*/
			CASE 2
				uo_parametros=wf_busca_empleado(long(data))
				this.setitem(1,'sol_nombre',uo_parametros.is_parm1)
				this.setitem(1,'sol_depto',uo_parametros.il_parm1)
		END CHOOSE
	CASE 'sol_tipo'
		CHOOSE CASE integer(data)
			CASE 1
			this.setitem(1,'sol_nombre',wf_busca_alumno(getitemnumber(row,'sol_num')))
			/*statementblock*/
			CASE 2
				uo_parametros=wf_busca_empleado(getitemnumber(row,'sol_num'))
				this.setitem(1,'sol_nombre',uo_parametros.is_parm1)
				this.setitem(1,'sol_depto',uo_parametros.il_parm1)
			CASE 3 
				this.setitem(1,'sol_nombre','')
		END CHOOSE	
		
		CASE 'resp_num'
		CHOOSE CASE this.getitemnumber(1,'resp_tipo')
			CASE 1
			this.setitem(1,'resp_nombre',wf_busca_alumno(long(data)))
			/*statementblock*/
			CASE 2
				uo_parametros=wf_busca_empleado(long(data))
				this.setitem(1,'resp_nombre',uo_parametros.is_parm1)
				this.setitem(1,'resp_depto',uo_parametros.il_parm1)
		END CHOOSE
	CASE 'resp_tipo'
		CHOOSE CASE integer(data)
			CASE 1
			this.setitem(1,'resp_nombre',wf_busca_alumno(getitemnumber(row,'resp_num')))
			CASE 2
			uo_parametros=wf_busca_empleado(getitemnumber(row,'resp_num'))
			this.setitem(1,'resp_nombre',uo_parametros.is_parm1)
			this.setitem(1,'resp_depto',uo_parametros.il_parm1)
		END CHOOSE	
		



CASE 'aval_num'
		CHOOSE CASE this.getitemnumber(1,'aval_tipo')
			CASE 1
			this.setitem(1,'aval_nombre',wf_busca_alumno(long(data)))
			/*statementblock*/
			CASE 2
				uo_parametros=wf_busca_empleado(long(data))
				this.setitem(1,'aval_nombre',uo_parametros.is_parm1)
				this.setitem(1,'aval_depto',uo_parametros.il_parm1)
		END CHOOSE
	CASE 'aval_tipo'
		CHOOSE CASE integer(data)
			CASE 1

			this.setitem(1,'aval_nombre',wf_busca_alumno(getitemnumber(row,'aval_num')))
			CASE 2
			uo_parametros=wf_busca_empleado(getitemnumber(row,'aval_num'))
			this.setitem(1,'aval_nombre',uo_parametros.is_parm1)
			this.setitem(1,'aval_depto',uo_parametros.il_parm1)
		END CHOOSE		

END CHOOSE
end event

event doubleclicked;integer liEncontrado, liTipoEncontrado
long llCuentaClave, llDeptoCarrera
String lsNombre

if dwo.name = 'sol_nombre' or dwo.name = 'resp_nombre' or dwo.name = 'aval_nombre' then
	n_transportar regreso
	open(w_gral_busca_alms_empl)
	regreso = message.powerobjectparm
	liEncontrado =regreso.ii_parm1
	IF liEncontrado = 1 THEN
		liTipoEncontrado = regreso.ii_parm2
		llCuentaClave= regreso.il_parm1
		lsNombre = regreso.is_parm1
		llDeptoCarrera = regreso.il_parm2
		choose case  dwo.name
			case 'sol_nombre'
				this.setitem(1,'sol_tipo',liTipoEncontrado)
				this.setitem(1,'sol_num',llCuentaClave)
				this.setitem(1,'sol_nombre',lsNombre)
				this.setitem(1,'sol_depto',llDeptoCarrera)
				
			case 'resp_nombre'
				this.setitem(1,'resp_tipo',liTipoEncontrado)
				this.setitem(1,'resp_num',llCuentaClave)
				this.setitem(1,'resp_nombre',lsNombre)
				this.setitem(1,'resp_depto',llDeptoCarrera)
		
		end choose
	END IF
end if
			
end event

event itemerror;
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	itemerror
//
//	Arguments:
//	long		row	El número de la fila que contiene el item cuyo nuevo
//						valor ha fallado en la validación.
//	dwobject	dwo	Una referencia a la columna que contiene el item.
//						Dwo es una referencia al control de columna, no el
//						nombre de la columna.
//	string	data	Los nuevos datos que el usuario especificó para el item.
//
//	Returns:
//	long				Fija el código de retorno para afectar el resultado del
//						evento:
//						0	(Defecto) Rechaza el valor de los datos y muestra una
//							ventana con el mensaje de error.
//						1	Rechaza el valor de los datos sin la ventana de mensaje.
//						2	Acepta el valor de los datos.
//						3	Rechaza el valor de los datos pero permite que cambie el
//							foco.
//
//	Description:
//	Verifica si el error sucedió en los campos infoemail, infofax o
//	infocorreoord.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////


	CHOOSE CASE dwo.name
			CASE 'sol_tipo'
				messagebox("ATENCIÓN","Debe seleccionar el tipo de solicitante" ,Exclamation!, OK! )
				return 1
			CASE 'resp_tipo'
				messagebox("ATENCIÓN","Debe seleccionar el tipo de responsable" ,Exclamation!, OK! )
				return 1
			CASE 'aval_tipo'
				messagebox("ATENCIÓN","Debe seleccionar el tipo de aval" ,Exclamation!, OK! )
				return 1
	END CHOOSE
end event

event itemfocuschanged;selecttext(1,100)
end event

type tabpage_impresion from userobject within tab_datos
integer x = 15
integer y = 99
integer width = 3368
integer height = 1539
long backcolor = 29534863
string text = "Impresión Solicitud"
long tabtextcolor = 33554432
long tabbackcolor = 29534863
long picturemaskcolor = 536870912
cb_1 cb_1
dw_impresion dw_impresion
end type

on tabpage_impresion.create
this.cb_1=create cb_1
this.dw_impresion=create dw_impresion
this.Control[]={this.cb_1,&
this.dw_impresion}
end on

on tabpage_impresion.destroy
destroy(this.cb_1)
destroy(this.dw_impresion)
end on

type cb_1 from commandbutton within tabpage_impresion
integer x = 2703
integer y = 1389
integer width = 618
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Impresión Solicitud"
end type

event clicked;integer Res

Res = MessageBox("Mensaje del Sistema", "¿Desea Imprimir la solicitud", &
					Question!, yesno!, 2)
if Res = 1 then
	dw_impresion.print()
end if
end event

type dw_impresion from datawindow within tabpage_impresion
integer x = 48
integer y = 32
integer width = 3273
integer height = 1328
integer taborder = 20
string title = "none"
string dataobject = "d_com_rep_solicitud"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

