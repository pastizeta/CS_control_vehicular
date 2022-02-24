$PBExportHeader$w_sre_solicitud_espacio.srw
forward
global type w_sre_solicitud_espacio from window
end type
type cb_2 from commandbutton within w_sre_solicitud_espacio
end type
type dw_existereserv from datawindow within w_sre_solicitud_espacio
end type
type cb_actualizar from commandbutton within w_sre_solicitud_espacio
end type
type tab_datos from tab within w_sre_solicitud_espacio
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
type tabpage_equipo from userobject within tab_datos
end type
type cb_agrega_equipo from commandbutton within tabpage_equipo
end type
type cb_elimina_equipo from commandbutton within tabpage_equipo
end type
type dw_equipos_solicitud from datawindow within tabpage_equipo
end type
type tabpage_equipo from userobject within tab_datos
cb_agrega_equipo cb_agrega_equipo
cb_elimina_equipo cb_elimina_equipo
dw_equipos_solicitud dw_equipos_solicitud
end type
type tabpage_impresion from userobject within tab_datos
end type
type dw_impresion_pru from datawindow within tabpage_impresion
end type
type em_correo from editmask within tabpage_impresion
end type
type st_1 from statictext within tabpage_impresion
end type
type cb_1 from commandbutton within tabpage_impresion
end type
type dw_impresion from datawindow within tabpage_impresion
end type
type gb_1 from groupbox within tabpage_impresion
end type
type tabpage_impresion from userobject within tab_datos
dw_impresion_pru dw_impresion_pru
em_correo em_correo
st_1 st_1
cb_1 cb_1
dw_impresion dw_impresion
gb_1 gb_1
end type
type tab_datos from tab within w_sre_solicitud_espacio
tabpage_espacio tabpage_espacio
tabpage_general tabpage_general
tabpage_equipo tabpage_equipo
tabpage_impresion tabpage_impresion
end type
end forward

global type w_sre_solicitud_espacio from window
integer width = 3579
integer height = 2624
boolean titlebar = true
string title = "Solicitud de Espacio"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowstate windowstate = maximized!
long backcolor = 29534863
cb_2 cb_2
dw_existereserv dw_existereserv
cb_actualizar cb_actualizar
tab_datos tab_datos
end type
global w_sre_solicitud_espacio w_sre_solicitud_espacio

type variables
integer ii_tipo_movto, ii_status=0

string is_fecha_string , lsDesDepto = ''
long  il_fecha_ini, il_fecha_fin 

integer ii_grupo ,ii_cvecarralum,ii_existe=0, liStatus

integer ii_depto_x_ext, li_externo= 0
end variables

forward prototypes
public function integer wf_depto_x_respemp ()
public function n_transportar wf_busca_empleado (long al_nomina)
public subroutine wf_inicio_nueva (n_transportar uo_parametros)
public function integer wf_depto_x_respalumno (integer ai_carrera)
public function string wf_busca_alumno (long al_cuenta)
public subroutine wf_inicio_existente (n_transportar uo_parametros)
public subroutine wf_setextension_y_mail (long al_row, long al_emp, boolean ab_tel)
public function integer wf_getvestibulo (integer ai_vestibulo, ref n_ds ad_vestibulo)
end prototypes

public function integer wf_depto_x_respemp ();return 1
end function

public function n_transportar wf_busca_empleado (long al_nomina);string ls_nombrecompleto,ls_costo,ls_depto
integer liDepro
n_transportar uo_salida
//string ls_datossalida[]
setpointer(hourglass!)
if al_nomina<>0 then
    SELECT nombre+' '+isnull(appaterno,'') +' ' +isnull(apmaterno,'') as nombrecompleto,   
         depto,   
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
	
return uo_salida
end function

public subroutine wf_inicio_nueva (n_transportar uo_parametros);datawindowchild idwc_periodo


integer	li_dias,i,li_linea,li_periodo, liAno
datetime ldt_fecha_inicio,ldt_fecha_final,ldt_fecha
string ldt_fecha_inicio1,ldt_fecha_final1
string	lsPeriodo
integer	iAñoFecha

boolean	lb_convestibulo
long	ll_fnd, ll_vest, ll_nwr, ll_cvegrupo
n_ds	lds_material
lds_material = create n_ds
lds_material.dataobject = 'd_materiales'
lds_material.SetTransObject(gtr_sumuia)


ii_status=1
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

//		INSERTA DATOS DEL ESPACIO SOLICITADO		
//		22 Agosto 2007
	tab_datos.tabpage_espacio.dw_solicitud.insertrow(0)

	select cveperiodo 
	into :li_periodo
	from spre_periodos 

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
	tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'status',1)
	tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'cvedepto',gi_depto)
	tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'periodo',lsPeriodo)
	tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'tipo_solicitud',0)
	
	li_dias=daysafter(uo_parametros.id_parm1,uo_parametros.id_parm2)+1
	ldt_fecha_inicio=datetime(uo_parametros.id_parm1,time(uo_parametros.ii_parm2,uo_parametros.ii_parm6,0))
	ldt_fecha_final=datetime(uo_parametros.id_parm1,time(uo_parametros.ii_parm3,uo_parametros.ii_parm7 - 1,0))
	for i=1 to li_dias
		ll_nwr	=	tab_datos.tabpage_espacio.dw_detalle.insertrow(0)
		tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'cvematerial',uo_parametros.is_parm1)
		tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'cvegrupo',uo_parametros.ii_parm5)
		tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'descripcion',uo_parametros.is_parm2)
		tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'status',1)
		tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'consecutivo',ll_nwr)
		tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'cvedepto',gi_depto)
		tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'cvearea',gi_area)
		tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'fecha_inicio1',ldt_fecha_inicio)
		tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'fecha_inicio',ldt_fecha_inicio)
		tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'fecha_final1',ldt_fecha_final)
		tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'fecha_final',ldt_fecha_final)
		/*Cambio solicitado en Minuta del 2008-Oct-15 */
		/*Que los vestíbulos se agreguen de manera automática con excepción del*/
		/*vestíbulo de auditorio Sánchez Villaseñor*/
		/*2009-Ene-15 Omar Ugalde*/
		/*	La tabla spre_materiales tiene una columna vestibulo, para la cual los auditorios
			tienen un valor > a 100, y los vestíbulos en el valor del auditorio menos cien.
		*/
		if i = 1 then
			ll_fnd		=	lds_material.Retrieve(gi_depto,gi_area,uo_parametros.ii_parm5)
			ll_fnd		=	lds_material.find("cvematerial='"+string(uo_parametros.is_parm1)+"' and vestibulo > 100",1,lds_material.RowCount())
			if ll_fnd > 0 then 
				ll_vest	=	lds_material.GetItemNumber(ll_fnd,'vestibulo') -100
				ll_fnd	=	wf_getvestibulo(ll_vest,lds_material)
				if ll_fnd	>1 then ll_fnd = 1
			end if
		end if
		if ll_fnd > 0 then
			ll_nwr	=	tab_datos.tabpage_espacio.dw_detalle.insertrow(0)
			tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'cvematerial',lds_material.GetItemString(ll_fnd,'cvematerial'))
			ll_cvegrupo	=	lds_material.GetItemNumber(ll_fnd,'cvegrupo')
			tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'cvegrupo',lds_material.GetItemNumber(ll_fnd,'cvegrupo'))
			tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'descripcion',lds_material.GetItemString(ll_fnd,'descripcion'))
			tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'status',1)
			tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'consecutivo',ll_nwr)
			tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'cvedepto',lds_material.GetItemNumber(ll_fnd,'cvedepto'))
			tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'cvearea',lds_material.GetItemNumber(ll_fnd,'cvearea'))
			tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'fecha_inicio1',ldt_fecha_inicio)
			tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'fecha_inicio',ldt_fecha_inicio)
			tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'fecha_final1',ldt_fecha_final)
			tab_datos.tabpage_espacio.dw_detalle.setitem(ll_nwr,'fecha_final',ldt_fecha_final)
		end if
		/**********************************************/
		ldt_fecha_inicio=datetime(relativedate(uo_parametros.id_parm1,i),time(uo_parametros.ii_parm2,uo_parametros.ii_parm6,0))
		ldt_fecha_final=datetime(relativedate(uo_parametros.id_parm1,i),time(uo_parametros.ii_parm3,uo_parametros.ii_parm7 - 1,0))
		
	next

	tab_datos.tabpage_general.dw_solicitante.insertrow(0)
	tab_datos.tabpage_general.dw_solicitante.setitem(1,'cvedepto',gi_depto)
	destroy	lds_material
//	li_linea=tab_datos.tabpage_equipo.dw_equipos_solicitud.insertrow(0)
//	tab_datos.tabpage_equipo.dw_equipos_solicitud.setitem(li_linea,'cvedepto',gi_depto)
//	tab_datos.tabpage_equipo.dw_equipos_solicitud.setitem(li_linea,'folio',tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'folio'))
//	tab_datos.tabpage_equipo.dw_equipos_solicitud.setitem(li_linea,'cveequipo',0)	
//	tab_datos.tabpage_equipo.dw_equipos_solicitud.setitem(li_linea,'cantidad',0)	
		
end subroutine

public function integer wf_depto_x_respalumno (integer ai_carrera);
integer liCveCoord
//ii_cvecarralum=0

setpointer(hourglass!)

if ai_carrera<>0 then


	SELECT cve_coordinacion 
   INTO :liCveCoord    	
	FROM v_sce_carreras 
	WHERE ( cve_carrera = :ai_carrera  )
	using gtr_sumuia;
	if gtr_sumuia.sqlcode=0 then
//		TODO OK
		if  isnull(liCveCoord) then
			messagebox("Mensaje del Sistema","No existe clave de cooordinación",exclamation!)
		else
			
			SELECT cve_depto  
   		INTO :ii_depto_x_ext    	
			FROM v_sce_coordinaciones 
			WHERE ( cve_coordinacion = :liCveCoord  )
			using gtr_sumuia;
			if gtr_sumuia.sqlcode=0 then
				//  Obtenemos departamento del responsable
				if  isnull(liCveCoord) then
					messagebox("Mensaje del Sistema","No existe clave de depto.",exclamation!)
				end if
			else
				messagebox("Mensaje del Sistema","El depto. no existe",stopsign!)
			end if
		end if
	else
		messagebox("Mensaje del Sistema","La carrera no existe",stopsign!)
	end if	
	
	
	
end if

return ii_depto_x_ext
end function

public function string wf_busca_alumno (long al_cuenta);string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
boolean lb_error=true
integer li_cvecarrera
ii_cvecarralum=0

setpointer(hourglass!)
if al_cuenta<>0 then

  SELECT v_sce_banderas_inscrito.cuenta,   
	         v_sce_alumnos.nombre+ ' ' + v_sce_alumnos.apaterno+' ' +v_sce_alumnos.amaterno as nombre_completo  ,
			v_sce_carreras.carrera, v_sce_carreras.cve_carrera
   INTO :ll_cuenta_inscrito,   
	        	:ls_nombrecompleto,
			:ls_carrera,
			:ii_cvecarralum
	FROM         v_sce_alumnos INNER JOIN
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

public subroutine wf_inicio_existente (n_transportar uo_parametros);long		ll_rwc
long		ll_folio
integer	iAñoFecha, li_periodo
datetime ld_fechafin, ld_fechaini, ldt_fecha
string lsperiodo, ld_fechafin1, ld_fechaini1
datawindowchild idwc_periodo,idwc_soldepto,idwc_respdepto,idwc_avaldepto
ll_folio=uo_parametros.il_parm4
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

//		INSERTA DATOS DEL ESPACIO SOLICITADO		
//		22 Agosto 2007
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

tab_datos.tabpage_impresion.dw_impresion_pru.getchild('sol_depto',idwc_soldepto)
tab_datos.tabpage_impresion.dw_impresion_pru.getchild('resp_depto',idwc_respdepto)
tab_datos.tabpage_impresion.dw_impresion_pru.getchild('aval_depto',idwc_avaldepto)

idwc_soldepto.settransobject(gtr_personal)
idwc_respdepto.settransobject(gtr_personal)
idwc_avaldepto.settransobject(gtr_personal)
idwc_soldepto.retrieve()
idwc_respdepto.retrieve()
idwc_avaldepto.retrieve()

tab_datos.tabpage_general.dw_solicitante.retrieve(ll_folio,gi_depto)
ll_rwc = tab_datos.tabpage_espacio.dw_solicitud.retrieve(ll_folio,gi_depto)
tab_datos.tabpage_espacio.dw_detalle.retrieve(ll_folio,gi_depto,gi_area,ii_grupo)
tab_datos.tabpage_equipo.dw_equipos_solicitud.retrieve(ll_folio,gi_depto)
tab_datos.tabpage_impresion.dw_impresion.retrieve(gi_depto,ll_folio,ii_grupo)
tab_datos.tabpage_impresion.dw_impresion_pru.retrieve(gi_depto,ll_folio,ii_grupo)

ii_status=tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'status')
tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'periodo',lsPeriodo)

//SE VALIDA SI EXISTE SOLICITUS RESERVADA O CONFIRMADA
datetime finicio,ffinal
string material
finicio = tab_datos.tabpage_espacio.dw_detalle.object.fecha_inicio1_1[1]
ffinal = tab_datos.tabpage_espacio.dw_detalle.object.fecha_final1_2[1]
material = tab_datos.tabpage_espacio.dw_detalle.object.cvematerial[1]
ii_existe= dw_existereserv.retrieve(gi_area,material,ii_grupo,finicio,ffinal)
if ii_existe = 1 then
	liStatus = dw_existereserv.object.status[1]
	if liStatus = 1 or liStatus = 2 then
	else
		liStatus = 0
	end if
end if

end subroutine

public subroutine wf_setextension_y_mail (long al_row, long al_emp, boolean ab_tel);string		ls_ext, ls_email

if al_row <= 0 or al_row > tab_datos.tabpage_general.dw_solicitante.Rowcount() then Return
if isnull(al_emp) or al_emp <=0 then return

SELECT extension, correo
into	:ls_ext, :ls_email
FROM spre_usuarios_validos
WHERE nomina =:al_emp
USING gtr_sumuia;

if gtr_sumuia.sqlcode < 0 or gtr_sumuia.sqlcode = 100 Then Return

if isnull(ls_ext) Then ls_ext = ''
if isnull(ls_email) Then ls_email = ''

if ab_tel then tab_datos.tabpage_general.dw_solicitante.SetItem(al_row,'sol_tel',ls_ext)
tab_datos.tabpage_general.dw_solicitante.Modify("t_email.text='"+ls_email+"'")
if tab_datos.tabpage_espacio.dw_solicitud.getitemstatus(1,0,primary!) = new! or &
 tab_datos.tabpage_espacio.dw_solicitud.getitemstatus(1,0,primary!) = newmodified! then
  tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'email_solicitante',ls_email)
end if
Return
end subroutine

public function integer wf_getvestibulo (integer ai_vestibulo, ref n_ds ad_vestibulo);string				ls_sql
n_cst_string		lsrv_string
long				ll_len, ll_pos

ad_vestibulo.dataobject	=	'd_materiales'
ad_vestibulo.SettransObject(gtr_sumuia)
ls_sql	=	ad_vestibulo.Describe("Datawindow.Table.Select")

ll_len	=	len(ls_sql)
ll_pos	=	pos(ls_sql,"WHERE")

ls_sql =left(ls_sql, ll_len - (ll_len - ll_pos) -1)

ls_sql	+=	"WHERE spre_materiales.vestibulo = "+string(ai_vestibulo)

ad_vestibulo.Modify("DataWindow.Table.Select='"+lsrv_string.of_GlobalReplace(ls_sql,"'","~~'")+"'")

Return ad_vestibulo.Retrieve(0,0,0)



end function

on w_sre_solicitud_espacio.create
this.cb_2=create cb_2
this.dw_existereserv=create dw_existereserv
this.cb_actualizar=create cb_actualizar
this.tab_datos=create tab_datos
this.Control[]={this.cb_2,&
this.dw_existereserv,&
this.cb_actualizar,&
this.tab_datos}
end on

on w_sre_solicitud_espacio.destroy
destroy(this.cb_2)
destroy(this.dw_existereserv)
destroy(this.cb_actualizar)
destroy(this.tab_datos)
end on

event open;
datawindowchild idwc_soldepto,idwc_respdepto,idwc_avaldepto

n_transportar uo_parametros
uo_parametros = Message.PowerObjectParm

tab_datos.tabpage_general.dw_solicitante.settransobject(gtr_sumuia)
tab_datos.tabpage_espacio.dw_solicitud.settransobject(gtr_sumuia)
tab_datos.tabpage_espacio.dw_detalle.settransobject(gtr_sumuia)
tab_datos.tabpage_equipo.dw_equipos_solicitud.settransobject(gtr_sumuia)
tab_datos.tabpage_impresion.dw_impresion.settransobject(gtr_sumuia)
tab_datos.tabpage_impresion.dw_impresion_pru.settransobject(gtr_sumuia)
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

cb_2.visible = false

if ii_tipo_movto =0 then
	//NUEVA
	wf_inicio_nueva(uo_parametros)
else
	//EXISTENTE
	wf_inicio_existente(uo_parametros)
	cb_2.visible = true
end if


end event

event activate;
actualizar=cb_actualizar
eliminar=tab_datos.tabpage_espacio.cb_elimina_espacio
dw=tab_datos.tabpage_impresion.dw_impresion
dw=tab_datos.tabpage_impresion.dw_impresion_pru


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

type cb_2 from commandbutton within w_sre_solicitud_espacio
integer x = 1115
integer y = 1932
integer width = 599
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Recalendarizar"
end type

event clicked;//		Recalendarización
//		Abril 2008 gmn.

n_transportar uo_parametros
//uo_parametros = Message.PowerObjectParm

string a
long i

i= 	tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'folio')
a= tab_datos.tabpage_espacio.dw_detalle.getitemstring(1,'cvematerial')

uo_parametros.il_parm1recal=	tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'folio')
uo_parametros.is_parm1recal=  tab_datos.tabpage_espacio.dw_detalle.getitemstring(1,'cvematerial')
uo_parametros.ii_parm2recal=	tab_datos.tabpage_espacio.dw_detalle.getitemnumber(1,'cvegrupo')

uo_parametros.id_parm1sol=date(tab_datos.tabpage_espacio.dw_solicitud.getitemdatetime(1,'fecha_inicio'))
uo_parametros.id_parm2sol=date(tab_datos.tabpage_espacio.dw_solicitud.getitemdatetime(1,'fecha_fin'))
uo_parametros.id_parm3sol=date(tab_datos.tabpage_espacio.dw_solicitud.getitemdatetime(1,'fecha_solicitud'))
uo_parametros.ii_parmstatus=tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'status')
	
opensheetwithparm(w_sres_busq_disp_recalendarizar,uo_parametros,w_ppal,0,original!)


end event

type dw_existereserv from datawindow within w_sre_solicitud_espacio
boolean visible = false
integer x = 82
integer y = 2480
integer width = 73
integer height = 36
integer taborder = 30
string title = "none"
string dataobject = "d_existereserv"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransobject(gtr_sumuia)
end event

type cb_actualizar from commandbutton within w_sre_solicitud_espacio
integer x = 466
integer y = 1932
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;long ll_folio,i, ll_id
long ll_cuenta
boolean lb_error=false

boolean  lb_ok=false
string ls_syntax, docname, named,ls_dwsyntax
string ls_email, ls_destinatario, ls_destinatario1, ls_error,ls_named,ls_docname
			
integer li_ind, li_ganador, li_id, li_email, liEstatussol,liTipo,li_row

string ls_ruta


tab_datos.tabpage_espacio.dw_solicitud.AcceptText()

datawindowchild idwc_soldepto,idwc_respdepto,idwc_avaldepto

if isnull(tab_datos.tabpage_espacio.dw_solicitud.object.email_solicitante[1]) then
	messagebox("ATENCIÓN","Debe indicar su correo electrónico." ,Exclamation!, OK! )
else
	if isnull(tab_datos.tabpage_general.dw_solicitante.object.sol_tipo[1]) then
		messagebox("ATENCIÓN","Debe seleccionar el tipo de solicitante" ,Exclamation!, OK! )
	else
		if isnull(tab_datos.tabpage_general.dw_solicitante.object.cvetevento[1]) then
			messagebox("ATENCIÓN","Debe seleccionar el Tipo de Evento" ,Exclamation!, OK! )
		else
			if isnull(tab_datos.tabpage_general.dw_solicitante.object.resp_tipo[1]) then
				messagebox("ATENCIÓN","Debe seleccionar el tipo de responsable" ,Exclamation!, OK! )
			else
			
				if ii_tipo_movto=0 then
				
					//ASIGNA EL FOLIO
					SELECT isnull(max(folio),0)+1 
					into :ll_folio
					from spre_solicitud 
					where cvedepto=:gi_depto
					using gtr_sumuia;
					tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'folio',ll_folio)
					tab_datos.tabpage_general.dw_solicitante.setitem(1,'folio',ll_folio)
					
					//		SE AGREGA PARA GUARDAR EN spre_solicitud EL solicitanteid y que no se registre en 0
					ll_cuenta=tab_datos.tabpage_general.dw_solicitante.getitemnumber(1,'sol_num')
					tab_datos.tabpage_espacio.dw_solicitud.setitem(1,'solicitanteid',ll_cuenta)
					
					if li_externo = 3 then
						tab_datos.tabpage_general.dw_solicitante.setitem(1,'sol_num',0)
					end if
				
					for i=1 to tab_datos.tabpage_espacio.dw_detalle.rowcount()
						tab_datos.tabpage_espacio.dw_detalle.setitem(i,'folio',ll_folio)		
					next	
					for i=1 to tab_datos.tabpage_equipo.dw_equipos_solicitud.rowcount()
						tab_datos.tabpage_equipo.dw_equipos_solicitud.setitem(i,'folio',ll_folio)
					next
					
					//			VALIDA EQUIPO REQUERIDO
					if tab_datos.tabpage_equipo.dw_equipos_solicitud.rowcount()= 0 then
						tab_datos.tabpage_general.dw_solicitante.setitem(1,'con_equipo_requerido',0)
					else
						if (isnull(tab_datos.tabpage_equipo.dw_equipos_solicitud.object.cveequipo[1]) OR tab_datos.tabpage_equipo.dw_equipos_solicitud.object.cveequipo[1] = 0) then
							tab_datos.tabpage_general.dw_solicitante.setitem(1,'con_equipo_requerido',0)
						else
							tab_datos.tabpage_general.dw_solicitante.setitem(1,'con_equipo_requerido',1)
						end if	
					end if
					//
				
					if tab_datos.tabpage_espacio.dw_solicitud.update()<>1 then lb_error=true
					if tab_datos.tabpage_espacio.dw_detalle.update()<>1 then lb_error=true
					if tab_datos.tabpage_general.dw_solicitante.update()<>1 then lb_error=true
					if tab_datos.tabpage_equipo.dw_equipos_solicitud.update()<>1 then lb_error=true
					
					if not(lb_error) then
						commit using gtr_sumuia;
						ii_tipo_movto=1
						 messagebox("Mensaje del Sistema","La información se ha registrado con exito, el reporte de impresion se encuentra listo",information!)
						 
						//CHILD DEPTOS IMPRESION
						tab_datos.tabpage_impresion.dw_impresion.getchild('sol_depto',idwc_soldepto)
						tab_datos.tabpage_impresion.dw_impresion.getchild('resp_depto',idwc_respdepto)
						tab_datos.tabpage_impresion.dw_impresion.getchild('aval_depto',idwc_avaldepto)
						
						tab_datos.tabpage_impresion.dw_impresion_pru.getchild('sol_depto',idwc_soldepto)
						tab_datos.tabpage_impresion.dw_impresion_pru.getchild('resp_depto',idwc_respdepto)
						tab_datos.tabpage_impresion.dw_impresion_pru.getchild('aval_depto',idwc_avaldepto)
				
						idwc_soldepto.settransobject(gtr_personal)
						idwc_respdepto.settransobject(gtr_personal)
						idwc_avaldepto.settransobject(gtr_personal)
						idwc_soldepto.retrieve()
						idwc_respdepto.retrieve()
						idwc_avaldepto.retrieve()
						tab_datos.tabpage_impresion.dw_impresion.retrieve(gi_depto,ll_folio,ii_grupo)
						tab_datos.tabpage_impresion.dw_impresion_pru.retrieve(gi_depto,ll_folio,ii_grupo)
						ii_status=tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'status')
					else
						rollback using gtr_sumuia;
						 messagebox("Mensaje del Sistema","Ha ocurrido un error al almacenar la información, revisela e intente nuevamente",stopsign!)
					end if
				else
					
					ll_folio=tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'folio')
							
					//			VALIDA EQUIPO REQUERIDO
					if tab_datos.tabpage_equipo.dw_equipos_solicitud.rowcount()= 0 then
						tab_datos.tabpage_general.dw_solicitante.setitem(1,'con_equipo_requerido',0)
					else
						if (isnull(tab_datos.tabpage_equipo.dw_equipos_solicitud.object.cveequipo[1]) OR isnull(tab_datos.tabpage_equipo.dw_equipos_solicitud.object.cveequipo[1]= 0))then
							tab_datos.tabpage_general.dw_solicitante.setitem(1,'con_equipo_requerido',0)
						else
							tab_datos.tabpage_general.dw_solicitante.setitem(1,'con_equipo_requerido',1)
						end if	
					end if
					//

					//
					if tab_datos.tabpage_espacio.dw_solicitud.update()<>1 then lb_error=true
					if tab_datos.tabpage_espacio.dw_detalle.update()<>1 then lb_error=true 
					if tab_datos.tabpage_equipo.dw_equipos_solicitud.update()<>1 then lb_error=true 
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
						
						tab_datos.tabpage_impresion.dw_impresion_pru.getchild('sol_depto',idwc_soldepto)
						tab_datos.tabpage_impresion.dw_impresion_pru.getchild('resp_depto',idwc_respdepto)
						tab_datos.tabpage_impresion.dw_impresion_pru.getchild('aval_depto',idwc_avaldepto)
						
						idwc_soldepto.settransobject(gtr_personal)
						idwc_respdepto.settransobject(gtr_personal)
						idwc_avaldepto.settransobject(gtr_personal)
						idwc_soldepto.retrieve()
						idwc_respdepto.retrieve()
						idwc_avaldepto.retrieve()
						tab_datos.tabpage_impresion.dw_impresion.retrieve(gi_depto,ll_folio,ii_grupo)
						tab_datos.tabpage_impresion.dw_impresion_pru.retrieve(gi_depto,ll_folio,ii_grupo)
						ii_status=tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'status')
					else
						rollback using gtr_sumuia;
						 messagebox("Mensaje del Sistema","Ha ocurrido un error al almacenar la información, revisela e intente nuevamente",stopsign!)
						 
					end if
					//
				end if
				
				if not(lb_error) then
				//		Si todo se guardo bien se envía correo al solicitante.
				//		Agosto 2007
					if tab_datos.tabpage_equipo.dw_equipos_solicitud.RowCount() > 0 then
						tab_datos.tabpage_impresion.dw_impresion.object.t_conequipo.text = "* Con Equipo Solicitado"
					end if
					
					//	-------------------------		ENVIANDO CORREO ELECTRONICO DE ACTUALIZACIÓN 		---------------------
						
						
						mailReturnCode mrc_estado
						mailMessage m_respuesta
						mailFileDescription m_archivo
						
						if tab_datos.tabpage_espacio.dw_solicitud.RowCount() > 0 then
							
								liTipo = tab_datos.tabpage_general.dw_solicitante.GetItemNumber(1,'sol_tipo')
//								if liTipo = 3 then
//									ll_id = 0
//								elseif (liTipo = 1 or liTipo = 2) then
									ll_id=tab_datos.tabpage_general.dw_solicitante.getitemnumber(1,'sol_num')
//								end if
								
								liEstatussol = tab_datos.tabpage_espacio.dw_solicitud.GetItemNumber(1,'status')
								ls_email = trim (tab_datos.tabpage_espacio.dw_solicitud.GetItemString(1,'email_solicitante'))
								ls_destinatario1 =trim(tab_datos.tabpage_general.dw_solicitante.GetItemString(1,'sol_nombre'))
								
									if ls_email= "" then
										messagebox("Aviso",'No existe direccion de correo para enviar e-mail')
									else
			
										//		AVISO SEGÚN ESTATUS	------------
										CHOOSE CASE liEstatussol
											CASE 1
												ls_destinatario = "¡Aviso de reservado.!~n~n" + "       " + "Folio No." + "  " + string(ll_folio) + ".~n~n" + &
												ls_destinatario1 + " " + "("+string(ll_id)+")" + ".~n~n" + &
												" El espacio que solicitó ha sido reservado. Sírvase registrar el total de sus requerimientos, " + &	
												" por lo menos diez días hábiles antes del evento. De no ser así, el Sistema cancelará la " + &
												" reservación automáticamente. " + &
												" Cabe mencionar que, después de esta fecha, no se aceptarán modificaciones a los requerimientos " + &
												" registrados. "
												
											CASE 2 
												ls_destinatario = "¡Aviso de confirmado.!~n~n" + "       " + "Folio No." + "  " + string(ll_folio) + ".~n~n" + &
												ls_destinatario1 + " " + "("+string(ll_id)+")" + ".~n~n" + &
												" Su reservación ha quedado debidamente confirmada. El día del evento, a la hora indicada en su" + &	
												" formato, se le hará entrega del espacio y, en su caso, de los requerimientos solicitados." 
											
											CASE 3 
												ls_destinatario = "¡Aviso de cancelado por no confirmar!~n~n" + "       " + "Folio No." + "  " + string(ll_folio) + ".~n~n" + &
												ls_destinatario1 + " " + "("+string(ll_id)+")" + ".~n~n" + &
												" Su reservación ha sido cancelada por no haber realizado en tiempo y forma los trámites" + &	
												" correspondientes. "
												
											CASE 4
												ls_destinatario = "¡Aviso de cancelado!~n~n" + "       " + "Folio No." + "  " + string(ll_folio) + ".~n~n" + &
												ls_destinatario1 + " " + "("+string(ll_id)+")" + ".~n~n" + &
												" En atención a su solicitud, su reservación ha quedado cancelada. "
												
											CASE 5
												ls_destinatario = "¡Aviso de no disponible!~n~n" + "       " + "Folio No." + "  " + string(ll_folio) + ".~n~n" + &
												ls_destinatario1 + " " + "("+string(ll_id)+")" + ".~n~n" + &
												" El espacio que usted solicitó no se encuentra disponible. "
										END CHOOSE		
										
										//------------------------
										
										ms_sesion = CREATE mailSession
										mrc_estado= ms_sesion.mailLogon(mailNewSession!)
											
										IF mrc_estado <> mailReturnSuccess! THEN
											messagebox("Aviso Importante",'No se puede conectar al servidor de correo')
											return
										end if
								
										m_archivo.filetype=mailAttach!
												
										m_respuesta.Subject  = 'Reservación de Espacio'
										m_respuesta.NoteText =ls_destinatario 
											
										m_respuesta.Recipient[1].RecipientType = mailTo!
										m_respuesta.Recipient[1].name = ls_email
										mrc_estado = ms_sesion.mailSend(m_respuesta)
										
										IF mrc_estado <> mailReturnSuccess! THEN
											messagebox("Aviso","El correo no fue enviado, Favor de verificar su correo")
											lb_ok = false
										else
											messagebox("Aviso","El correo ha sido enviado")
										end if
										ms_sesion.mailLogoff( )
										DESTROY ms_sesion
										
									end if
						end if
					
				//-------------------	FIN DE ENVIO DE CORREO 	------------------------------------------
				end if	// Todo bien ok.
			end if  
		end if
	end if
end if
end event

type tab_datos from tab within w_sre_solicitud_espacio
integer x = 46
integer y = 56
integer width = 3397
integer height = 1768
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
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_espacio tabpage_espacio
tabpage_general tabpage_general
tabpage_equipo tabpage_equipo
tabpage_impresion tabpage_impresion
end type

on tab_datos.create
this.tabpage_espacio=create tabpage_espacio
this.tabpage_general=create tabpage_general
this.tabpage_equipo=create tabpage_equipo
this.tabpage_impresion=create tabpage_impresion
this.Control[]={this.tabpage_espacio,&
this.tabpage_general,&
this.tabpage_equipo,&
this.tabpage_impresion}
end on

on tab_datos.destroy
destroy(this.tabpage_espacio)
destroy(this.tabpage_general)
destroy(this.tabpage_equipo)
destroy(this.tabpage_impresion)
end on

event selectionchanged;//indices 0- 2

if newindex =1 then
	eliminar=this.tabpage_espacio.cb_elimina_espacio
else
	eliminar=this.tabpage_equipo.cb_elimina_equipo
	nuevo=this.tabpage_equipo.cb_agrega_equipo
end if


if tab_datos.tabpage_equipo.dw_equipos_solicitud.RowCount() > 0 then
	tab_datos.tabpage_impresion.dw_impresion.object.t_conequipo.text = "* Con Equipo Solicitado"
end if
end event

type tabpage_espacio from userobject within tab_datos
integer x = 18
integer y = 112
integer width = 3360
integer height = 1640
long backcolor = 29534863
string text = "Datos del Espacio"
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
integer x = 3003
integer y = 24
integer width = 343
integer height = 96
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
integer x = 27
integer y = 152
integer width = 3314
integer height = 496
integer taborder = 10
string title = "none"
string dataobject = "d_sres_solicitud"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;

integer i
n_transportar uo_parametros
//uo_parametros = Message.PowerObjectParm

if dwo.name='status' then
	CHOOSE CASE long(data)
		CASE 0	//	MUEVE A SOLICITADO
			CHOOSE CASE ii_status
				CASE 1,2,3,4,5,6
					messagebox('Mensaje del Sistema','No es posible cambiar el estado de la solicitud, DEBE GENERAR UNA NUEVA',stopsign!)
					dw_solicitud.setitem(row,'status',ii_status)
					dw_detalle.setitem(row,'status',ii_status)
			END CHOOSE
		CASE 1	//	MUEVE A RESERVADO
			CHOOSE CASE ii_status
				CASE 0
					if uo_parametros.ii_parm10 = 1 then
						messagebox('Mensaje del Sistema','No es posible Reservar, ya existe RESERVACIÓN para este espacio',stopsign!)
						dw_solicitud.setitem(row,'status',0)
					
					elseif uo_parametros.ii_parm11 = 1 then
						messagebox('Mensaje del Sistema','No es posible Reservar, ya existe CONFIRMACIÓN para este espacio',stopsign!)
						dw_solicitud.setitem(row,'status',0)
					else
						for i=1 to dw_detalle.rowcount()
							if dw_detalle.getitemnumber(i,'status')=0 then dw_detalle.setitem(i,'status',1)
						next
					end if
				CASE 1 //ESTABA RESERVADO, ESTA COMBINACION NO HACE NADA	
					for i=1 to dw_detalle.rowcount()
						if dw_detalle.getitemnumber(i,'status')=1 then dw_detalle.setitem(i,'status',1)
					next
				CASE 2 //ESTABA CONFIRMADO,  ESTA COMBINACION ES VALIDA PASA DE CONFIRMADO A APARTADO
					for i=1 to dw_detalle.rowcount()
						if dw_detalle.getitemnumber(i,'status')=2 then dw_detalle.setitem(i,'status',2)
						messagebox('Mensaje del Sistema','No es posible RESERVAR la solicitud debido a que se encuentra CONFIRMADA',stopsign!)
						dw_solicitud.setitem(row,'status',2)
					next
				CASE ELSE
					//
					if ii_existe = 1 and liStatus = 1 then
						messagebox('Mensaje del Sistema','No es posible Reservar, ya existe RESERVACIÓN para este espacio',stopsign!)
						dw_solicitud.setitem(row,'status',ii_status)
					
					elseif ii_existe =1 and liStatus = 2 then
						messagebox('Mensaje del Sistema','No es posible Reservar, ya existe CONFIRMACIÓN para este espacio',stopsign!)
						dw_solicitud.setitem(row,'status',ii_status)
					else
						for i=1 to dw_detalle.rowcount()
							dw_detalle.setitem(i,'status',1)
						next
					end if
					//
			END CHOOSE		
		
		CASE 2 //MUEVE A CONFIRMADO
			CHOOSE CASE ii_status
				CASE 0
					if uo_parametros.ii_parm11 = 1 then
						messagebox('Mensaje del Sistema','No es posible Confirmar, ya existe CONFIRMACIÓN para este espacio',stopsign!)
						dw_solicitud.setitem(row,'status',0)
					else
						for i=1 to dw_detalle.rowcount()
							if dw_detalle.getitemnumber(i,'status') < 2 then dw_detalle.setitem(i,'status',2)
						next
					end if
				CASE 1 //ESTABA APARTADO, ESTA COMBINACION ES VALIDA
					//REVISA QUE TENGA LISTA DE REQUERIMIENTOS
						if tab_datos.tabpage_equipo.dw_equipos_solicitud.find('cveequipo=0',1,tab_datos.tabpage_equipo.dw_equipos_solicitud.rowcount())=0 then
							//Los horarios apartados en el detalle pasan a confirmado
							for i=1 to dw_detalle.rowcount()
								if dw_detalle.getitemnumber(i,'status')=1 then dw_detalle.setitem(i,'status',2)
							next
						else
							messagebox('Mensaje del Sistema','No es posible CONFIRMAR la solicitud debido a que no tiene lista de requerimientos',stopsign!)
							this.setitem(row,'status',ii_status)
							this.SetItemStatus(row, 'status', Primary!, DataModified!)
						end if
				CASE 2 //ESTABA CONFIRMADO,  ESTA COMBINACION NO HACE NADA						
					for i=1 to dw_detalle.rowcount()
						if dw_detalle.getitemnumber(i,'status')<3 then dw_detalle.setitem(i,'status',2)
					next

				CASE ELSE
					//
					if ii_existe = 1 and liStatus = 1 then
						messagebox('Mensaje del Sistema','No es posible Confirmar, ya existe RESERVACIÓN para este espacio',stopsign!)
						dw_solicitud.setitem(row,'status',ii_status)
					
					elseif ii_existe =1 and liStatus = 2 then
						messagebox('Mensaje del Sistema','No es posible Confirmar, ya existe CONFIRMACIÓN para este espacio',stopsign!)
						dw_solicitud.setitem(row,'status',ii_status)
					else
						for i=1 to dw_detalle.rowcount()
							dw_detalle.setitem(i,'status',2)
						next
					end if
					//
			END CHOOSE		
			
		CASE 3,4,5,6 //ESTA CANCELANDO
			CHOOSE CASE ii_status
				CASE 0
//					messagebox('Mensaje del Sistema','No es posible cambiar el estado de la solicitud, DEBE GENERAR UNA NUEVA',stopsign!)
					dw_solicitud.setitem(row,'status',long(data))//ii_status)
					dw_detalle.setitem(row,'status',long(data))//,ii_status)
				CASE 1,2 //ESTABA RESERVADO O CONFIRMADO, PUEDE CANCELARLO
					Messagebox("Mensaje del Sistema","Recuerde que una vez cancelada la solicitud, podria requerir una nueva si desea reasignarla",exclamation!)
					for i=1 to dw_detalle.rowcount()
						dw_detalle.setitem(i,'status',long(data))
						dw_solicitud.setitem(row,'status',long(data))
						dw_solicitud.setitem(row,'fecha_cancelacion',f_fecha_hora_servidor())
					next
				CASE ELSE	//ES INDISTINTO CAMBIAR EL RESTO DE LOS STATUS
					for i=1 to dw_detalle.rowcount()
						dw_detalle.setitem(i,'status',long(data))
						dw_solicitud.setitem(row,'status',long(data))
						dw_solicitud.setitem(row,'fecha_cancelacion',f_fecha_hora_servidor())
					next					
			END CHOOSE
	END CHOOSE
end if
end event

type dw_detalle from datawindow within tabpage_espacio
integer x = 27
integer y = 668
integer width = 3314
integer height = 948
integer taborder = 20
string title = "Solicitud de Apartado de Espacios"
string dataobject = "d_spre_materiales_solicitud"
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

event sqlpreview;if 1=1 then
end if
end event

type tabpage_general from userobject within tab_datos
integer x = 18
integer y = 112
integer width = 3360
integer height = 1640
long backcolor = 29534863
string text = "Datos del Evento"
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
integer x = 27
integer y = 28
integer width = 2857
integer height = 1464
integer taborder = 20
string title = "none"
string dataobject = "d_spre_datos_evento"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;
n_transportar uo_parametros
CHOOSE CASE dwo.name
	
	CASE 'sol_num'
		CHOOSE CASE this.getitemnumber(1,'sol_tipo')
			CASE 1
			this.setitem(1,'sol_nombre',wf_busca_alumno(long(data)))
			this.setitem(1,'sol_depto',ii_cvecarralum)
			/*statementblock*/
			CASE 2
				uo_parametros=wf_busca_empleado(long(data))
				this.setitem(1,'sol_nombre',uo_parametros.is_parm1)
				this.setitem(1,'sol_depto',uo_parametros.il_parm1)
				/*Cambio solicitado en Minuta del 2008-Oct-15 Punto 5*/
				/*Que cuando el solicitante ponga su número de empleado, el sistema*/
				/*en automático arroje el correo electrónico y la extensión telefónica  */
				/*La extensión telefónica deberá existir en spre_usuarios_validos.extension*/
				/*2009-Ene-15 Omar Ugalde*/
				wf_setExtension_y_Mail(row,long(data),true)
				/**********************************************/
		END CHOOSE
	CASE 'sol_tipo'
		CHOOSE CASE integer(data)
			CASE 1
			this.setitem(1,'sol_nombre',wf_busca_alumno(getitemnumber(row,'sol_num')))
			this.setitem(1,'sol_depto',ii_cvecarralum)
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
				this.setitem(1,'resp_depto',ii_cvecarralum)
				
				//	Si es solicitado por un externo
				//	Se obtiene departamento del alumno
				//	16 Agosto 2007
				li_externo = this.getitemnumber(1,'sol_tipo')
				if li_externo = 3 then
					//		SE CANCELA QUE SE GRABE EL DEPTO DEL ALUMNO
					//		CUANDO EL SOLICITANTE ES EXTERO Y EL ALUMNO
					//		QUEDA COMO RESPONSABLE SOLICITO CARLOS BADO
					//		----QUEDA CVE DE CARRERA OK.gmn
					//		24/agosto/2007
//					ii_depto_x_ext= wf_depto_x_respalumno(ii_cvecarralum)
//					this.setitem(1,'sol_depto',ii_depto_x_ext)
					this.setitem(1,'sol_depto',ii_cvecarralum)
					this.setitem(1,'sol_num',long(data))
				end if
				//	
			
			/*statementblock*/
			CASE 2
				uo_parametros=wf_busca_empleado(long(data))
				this.setitem(1,'resp_nombre',uo_parametros.is_parm1)
				this.setitem(1,'resp_depto',uo_parametros.il_parm1)
				//	Si es solicitado por un externo
				//	Se obtiene departamento del empleado
				//	16 Agosto 2007
					li_externo = this.getitemnumber(1,'sol_tipo')
					if li_externo = 3 then
						this.setitem(1,'sol_depto',uo_parametros.il_parm1)
						this.setitem(1,'sol_num',long(data))
					end if
					
				// prueba
		END CHOOSE	
	CASE 'resp_tipo'
		CHOOSE CASE integer(data)
			CASE 1
			this.setitem(1,'resp_nombre',wf_busca_alumno(getitemnumber(row,'resp_num')))
			this.setitem(1,'resp_depto',ii_cvecarralum)
			CASE 2
			uo_parametros=wf_busca_empleado(getitemnumber(row,'resp_num'))
			this.setitem(1,'resp_nombre',uo_parametros.is_parm1)
			this.setitem(1,'resp_depto',uo_parametros.il_parm1)
		END CHOOSE	
		
CASE 'aval_num'
		CHOOSE CASE this.getitemnumber(1,'aval_tipo')
			CASE 1
			this.setitem(1,'aval_nombre',wf_busca_alumno(long(data)))
			this.setitem(1,'aval_depto',ii_cvecarralum)
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
			this.setitem(1,'aval_depto',ii_cvecarralum)
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
				
			case 'aval_nombre'
				this.setitem(1,'aval_tipo',liTipoEncontrado)
				this.setitem(1,'aval_num',llCuentaClave)
				this.setitem(1,'aval_nombre',lsNombre)
				this.setitem(1,'aval_depto',llDeptoCarrera)
				
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

event retrieveend;long	ll_sol_num, ll_sol_tipo
if rowcount <= 0 then return

ll_sol_num	=	getitemnumber(rowcount,'sol_num')
ll_sol_tipo	=	getitemnumber(rowcount,'sol_tipo')
if ll_sol_tipo = 2 then wf_setExtension_y_Mail(rowcount,ll_sol_num,false)
return 
end event

type tabpage_equipo from userobject within tab_datos
integer x = 18
integer y = 112
integer width = 3360
integer height = 1640
long backcolor = 29534863
string text = "Equipo Solicitado"
long tabtextcolor = 33554432
long tabbackcolor = 29534863
long picturemaskcolor = 536870912
cb_agrega_equipo cb_agrega_equipo
cb_elimina_equipo cb_elimina_equipo
dw_equipos_solicitud dw_equipos_solicitud
end type

on tabpage_equipo.create
this.cb_agrega_equipo=create cb_agrega_equipo
this.cb_elimina_equipo=create cb_elimina_equipo
this.dw_equipos_solicitud=create dw_equipos_solicitud
this.Control[]={this.cb_agrega_equipo,&
this.cb_elimina_equipo,&
this.dw_equipos_solicitud}
end on

on tabpage_equipo.destroy
destroy(this.cb_agrega_equipo)
destroy(this.cb_elimina_equipo)
destroy(this.dw_equipos_solicitud)
end on

type cb_agrega_equipo from commandbutton within tabpage_equipo
integer x = 2226
integer y = 164
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Agregar"
end type

event clicked;integer ll_nva_linea
if tab_datos.tabpage_espacio.dw_solicitud.RowCount() >0 then
	ll_nva_linea=dw_equipos_solicitud.insertrow(0)
	dw_equipos_solicitud.setcolumn(1)
	dw_equipos_solicitud.scrolltorow(ll_nva_linea)
	dw_equipos_solicitud.setitem(ll_nva_linea,'cvedepto',gi_depto)
	dw_equipos_solicitud.setitem(ll_nva_linea,'folio',tab_datos.tabpage_espacio.dw_solicitud.getitemnumber(1,'folio'))
	
end if
end event

type cb_elimina_equipo from commandbutton within tabpage_equipo
integer x = 2222
integer y = 40
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Elimina"
end type

event clicked;
if dw_equipos_solicitud.RowCount() >0 then
dw_equipos_solicitud.deleterow(dw_equipos_solicitud.getrow())
end if
end event

type dw_equipos_solicitud from datawindow within tabpage_equipo
integer x = 27
integer y = 28
integer width = 2158
integer height = 976
integer taborder = 30
string title = "none"
string dataobject = "d_sres_equipos_solicitud"
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

type tabpage_impresion from userobject within tab_datos
integer x = 18
integer y = 112
integer width = 3360
integer height = 1640
long backcolor = 29534863
string text = "Impresión"
long tabtextcolor = 33554432
long tabbackcolor = 29534863
long picturemaskcolor = 536870912
dw_impresion_pru dw_impresion_pru
em_correo em_correo
st_1 st_1
cb_1 cb_1
dw_impresion dw_impresion
gb_1 gb_1
end type

on tabpage_impresion.create
this.dw_impresion_pru=create dw_impresion_pru
this.em_correo=create em_correo
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_impresion=create dw_impresion
this.gb_1=create gb_1
this.Control[]={this.dw_impresion_pru,&
this.em_correo,&
this.st_1,&
this.cb_1,&
this.dw_impresion,&
this.gb_1}
end on

on tabpage_impresion.destroy
destroy(this.dw_impresion_pru)
destroy(this.em_correo)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_impresion)
destroy(this.gb_1)
end on

type dw_impresion_pru from datawindow within tabpage_impresion
integer x = 27
integer y = 28
integer width = 3232
integer height = 1208
integer taborder = 40
string title = "none"
string dataobject = "d_sres_rep_solicitud_pru"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_correo from editmask within tabpage_impresion
integer x = 951
integer y = 1320
integer width = 1170
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
maskdatatype maskdatatype = stringmask!
end type

type st_1 from statictext within tabpage_impresion
integer x = 279
integer y = 1340
integer width = 654
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Dirección correo electronico :"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within tabpage_impresion
integer x = 2208
integer y = 1300
integer width = 402
integer height = 124
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Enviar e-mail"
end type

event clicked;
boolean  lb_ok=false
string ls_syntax, docname, named,ls_dwsyntax
string ls_email, ls_destinatario, ls_destinatario1, ls_error,ls_named,ls_docname
long Folio

string ls_ruta

mailReturnCode mrc_estado
mailMessage m_respuesta
mailFileDescription m_archivo

if dw_impresion.RowCount() > 0 then
	
	Folio = dw_impresion.GetItemNumber(1,'folio')

	dw_impresion.SaveAs("C:\Solicitudes Espacio\ESPACIO"+string(Folio)+".HTML", &
	HTMLTable!,FALSE)
	
	ls_email = trim (em_correo.text)	
	ls_ruta = "C:\Solicitudes Espacio\ESPACIO"+string(Folio)+".html"
		
	if ls_email= "" then
		messagebox("Aviso",'No existe direccion de correo para enviar e-mail')
	else
		ls_destinatario1 =trim(dw_impresion.GetItemString(1,'sol_nombre'))
		ls_destinatario= "Estimado: " + ls_destinatario1 +" Le enviamos la Solicitud de Espacio Solicitada                                       "

		ms_sesion = CREATE mailSession
		mrc_estado= ms_sesion.mailLogon(mailNewSession!)
			
		IF mrc_estado <> mailReturnSuccess! THEN
			messagebox("Aviso Importante",'No se puede conectar al servidor de correo')
			return
		end if

		m_archivo.filetype=mailAttach!

		m_archivo.Filename=ls_ruta
		m_archivo.Pathname=ls_ruta
					
		m_respuesta.Subject  = 'Solicitud de Espacio'
		m_respuesta.NoteText =ls_destinatario 
		
		m_respuesta.AttachmentFile[1]=m_archivo
		
//		m_respuesta.Recipient[1].RecipientType = mailTo!
		m_respuesta.Recipient[1].name = ls_email
		mrc_estado = ms_sesion.mailSend(m_respuesta)
		
		IF mrc_estado <> mailReturnSuccess! THEN
			messagebox("Aviso","El correo no fue enviado, Favor de verificar su correo")
			lb_ok = false
		else
			messagebox("Aviso","El correo ha sido enviado")
			lb_ok = true
		END IF
		ms_sesion.mailLogoff( )
		DESTROY ms_sesion
		
	end if
end if



end event

type dw_impresion from datawindow within tabpage_impresion
boolean visible = false
integer x = 87
integer y = 1536
integer width = 3232
integer height = 36
integer taborder = 20
string title = "none"
string dataobject = "d_sres_rep_solicitud"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within tabpage_impresion
integer x = 37
integer y = 1252
integer width = 3227
integer height = 228
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Enviar Solicitud por correro electronico"
end type

