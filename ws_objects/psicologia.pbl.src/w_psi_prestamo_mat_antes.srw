$PBExportHeader$w_psi_prestamo_mat_antes.srw
$PBExportComments$Permite capturar los materiales a prestar
forward
global type w_psi_prestamo_mat_antes from window
end type
type cbx_intercambio from checkbox within w_psi_prestamo_mat_antes
end type
type st_2 from statictext within w_psi_prestamo_mat_antes
end type
type ole_foto from olecustomcontrol within w_psi_prestamo_mat_antes
end type
type dw_interesado from u_dw within w_psi_prestamo_mat_antes
end type
type rb_2 from radiobutton within w_psi_prestamo_mat_antes
end type
type rb_1 from radiobutton within w_psi_prestamo_mat_antes
end type
type dw_cap from u_dw within w_psi_prestamo_mat_antes
end type
type dw_matdisp from u_dw within w_psi_prestamo_mat_antes
end type
type st_2a from statictext within w_psi_prestamo_mat_antes
end type
type dw_desc from datawindow within w_psi_prestamo_mat_antes
end type
type cbx_bus from checkbox within w_psi_prestamo_mat_antes
end type
type st_1 from statictext within w_psi_prestamo_mat_antes
end type
type dw_gpomat from u_dw within w_psi_prestamo_mat_antes
end type
type cb_actualiza from commandbutton within w_psi_prestamo_mat_antes
end type
type cb_eliminar from commandbutton within w_psi_prestamo_mat_antes
end type
type cb_nuevo from commandbutton within w_psi_prestamo_mat_antes
end type
type gb_1 from groupbox within w_psi_prestamo_mat_antes
end type
type dw_motivo from datawindow within w_psi_prestamo_mat_antes
end type
type cb_cerrar from commandbutton within w_psi_prestamo_mat_antes
end type
type dw_solicitud from u_dw within w_psi_prestamo_mat_antes
end type
type sle_cuenta from singlelineedit within w_psi_prestamo_mat_antes
end type
type gb_2 from groupbox within w_psi_prestamo_mat_antes
end type
end forward

shared variables

end variables

global type w_psi_prestamo_mat_antes from window
integer x = 14
integer y = 16
integer width = 3625
integer height = 2424
boolean titlebar = true
string title = "Prestamo material"
boolean controlmenu = true
boolean resizable = true
long backcolor = 29534863
cbx_intercambio cbx_intercambio
st_2 st_2
ole_foto ole_foto
dw_interesado dw_interesado
rb_2 rb_2
rb_1 rb_1
dw_cap dw_cap
dw_matdisp dw_matdisp
st_2a st_2a
dw_desc dw_desc
cbx_bus cbx_bus
st_1 st_1
dw_gpomat dw_gpomat
cb_actualiza cb_actualiza
cb_eliminar cb_eliminar
cb_nuevo cb_nuevo
gb_1 gb_1
dw_motivo dw_motivo
cb_cerrar cb_cerrar
dw_solicitud dw_solicitud
sle_cuenta sle_cuenta
gb_2 gb_2
end type
global w_psi_prestamo_mat_antes w_psi_prestamo_mat_antes

type variables
boolean sb_nuevo=false
integer ligpomat, liTotalMatPrestado =0
long sl_linea, il_cuenta
n_transportar regreso
n_transportar origen
datastore ids_MatAlmn, ids_MatProf, ids_StaPrestamo


integer ii_stauts, ii_tprestamo, ii_ligpomat , iiDiasPrestamo

end variables

forward prototypes
public subroutine wf_fecha_valida (ref datetime ad_fecha_final)
public subroutine wf_carga_foto (long li_cuenta, integer li_tipo)
public function n_transportar wf_busca_empleado (long al_nomina)
public function string wf_busca_alumno_dca (long al_cuenta)
public function string wf_busca_alumno_dca1 (long al_cuenta)
public subroutine wf_limpia_forma ()
public function string wf_busca_alumno (long al_cuenta)
public function integer wf_status_pm (string as_serie, string as_material, ref integer ai_tiempoprestamo)
public function boolean wf_asigna_folio ()
end prototypes

public subroutine wf_fecha_valida (ref datetime ad_fecha_final);//////////////////////////////////////////////////////////////////////////////
//	Function:		wf_fecha_valida
//	Arguments:		al_nomina por referencia
//	Returns:			Nada
//	Description:	Permite validar la fecha de entrega de material validando que 
//						en caso de ser fin de semana se recorra al siguiente dia habil
//////////////////////////////////////////////////////////////////////////////
string  daynameinicio 
daynameinicio = DayName(date(ad_fecha_final))
choose case daynameinicio
	case 'Saturday'
		ad_fecha_final = DateTime(RelativeDate(date (ad_fecha_final), 2), time('23:59:59'))
	case 'Sunday'
		ad_fecha_final = DateTime(RelativeDate(date (ad_fecha_final), 1), time('23:59:59'))
end choose
end subroutine

public subroutine wf_carga_foto (long li_cuenta, integer li_tipo);Blob lbl_foto
String ls_arch_ruta
SetNull(ls_arch_ruta)
	choose case li_tipo
		case 1
			ls_arch_ruta = f_archivo_gvbox(f_foto_alumno(li_cuenta))
		case 3
			ls_arch_ruta = f_archivo_gvbox(f_foto_profesor(li_cuenta))
		case 2
			ls_arch_ruta = f_archivo_gvbox(f_foto_alumno_dca(li_cuenta))
	end choose
	
	if li_tipo=0 then
		
	else
		
	end if
	IF IsNull(ls_arch_ruta) THEN 
		ole_foto.Object.FileName = ''
		messagebox('Aviso','El Alumno no tiene foto') 
	ELSE 
		ole_foto.Object.FileName = ls_arch_ruta
		ole_foto.visible=true
		ole_foto.object.autosize=2
	END IF

end subroutine

public function n_transportar wf_busca_empleado (long al_nomina);//////////////////////////////////////////////////////////////////////////////
//	Function:		wf_busca_empleado
//	Arguments:		al_nomina
//	Returns:			Objeto con la información del empleado
//	Description:	Permite consultar si el empleado es profesor del area 
//						en caso de ser afirmativo carga el nombre del mismo y las
//						materias que imparte en el semestre actual
//////////////////////////////////////////////////////////////////////////////

string ls_nombrecompleto,ls_costo,ls_depto
n_transportar uo_salida
datastore ids_MatReq
ids_MatReq =  create datastore 
ids_MatReq.dataobject ='d_psi_mat_act'
ids_MatReq.settransobject(gtr_sumuia)
if isvalid(ids_MatProf) then
	destroy ids_MatProf
	ids_MatProf =  create datastore 
	ids_MatProf.dataobject ='d_psi_matinscp'
	ids_MatProf.settransobject(gtr_sumuia)
else
		ids_MatProf =  create datastore 
		ids_MatProf.dataobject ='d_psi_matinscp'
		ids_MatProf.settransobject(gtr_sumuia)
		
end if
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
			ids_MatProf.retrieve(al_nomina)		
			ids_MatReq.Retrieve(al_nomina)
			liTotalMatPrestado =ids_MatReq.RowCount()
			dw_gpomat.enabled = true
		else
			if gtr_personal.sqlcode=-1 then
				messagebox("Mensaje del Sistema",gtr_personal.SQLErrText,stopsign!)
				sle_cuenta.text=""
				wf_limpia_forma()
			else
				
				messagebox("Mensaje del Sistema","La clave ingresada no es valida",stopsign!)
				sle_cuenta.text=""
				wf_limpia_forma()
			end if
		end if			
	end if
destroy ids_MatReq;
return uo_salida
end function

public function string wf_busca_alumno_dca (long al_cuenta);//////////////////////////////////////////////////////////////////////////////
//	Function:		wf_busca_alumno_dcs
//	Arguments:		al_cuenta
//	Returns:			Nombre alumno
//	Description:	Valida que el alumno este incrito en el area  y curse materias 
//						en el semestre actual. cuando esto es valido carga las materias
//						que cursa para poder realizar la validación del prestamo
//////////////////////////////////////////////////////////////////////////////

string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
integer liAnio, liPeriodo, li_mes
boolean lb_error=true
liAnio = Year(Today())

li_mes =	integer(string(today(),'m'))

CHOOSE CASE li_mes
	CASE 1,2,3,4,5
		liPeriodo = 0
		
	CASE 6,7
		liPeriodo = 1
		
	CASE 8,9,10,11,12
		liPeriodo = 2
		
END CHOOSE

datastore ids_MatReq
ids_MatReq =  create datastore 
ids_MatReq.dataobject ='d_psi_mat_act'
ids_MatReq.settransobject(gtr_sumuia)

if isvalid(ids_MatAlmn) then
	destroy ids_MatAlmn
	ids_MatAlmn =  create datastore 
	ids_MatAlmn.dataobject ='d_psi_matinsc_dca'
	ids_MatAlmn.settransobject(gtr_sumuia)
else
	ids_MatAlmn =  create datastore 
	ids_MatAlmn.dataobject ='d_psi_matinsc_dca'
	ids_MatAlmn.settransobject(gtr_sumuia)
		
end if
setpointer(hourglass!)
if al_cuenta<>0 then

  SELECT dbo.dca_alumnos_ext.no_folio_inter,   
         dbo.dca_alumnos_ext.s_lastname+' '+ dbo.dca_alumnos_ext.s_name as nombre_completo  ,   
         dbo.dca_alumnos_ext.major
  INTO :ll_cuenta_inscrito,   
		        :ls_nombrecompleto,
			  :ls_carrera
    FROM dbo.dca_alumnos_ext,   
         dbo.dcaPeriodoEstancia  
   WHERE ( dbo.dca_alumnos_ext.no_folio_inter = dbo.dcaPeriodoEstancia.noFolioCuenta ) AND
			  ( dbo.dca_alumnos_ext.no_folio_inter = :al_cuenta ) AND
         ( dbo.dcaPeriodoEstancia.anio = :liAnio ) AND
         ( dbo.dcaPeriodoEstancia.periodo = :liPeriodo )  
		using gtr_sumuia;
		
		if gtr_sumuia.sqlcode=0 then
			//TODO OK
			if  isnull(ll_cuenta_inscrito) then
				messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
				sle_cuenta.text=""
				wf_limpia_forma()
			else
				ids_MatAlmn.retrieve(ll_cuenta_inscrito)
				ids_MatReq.Retrieve(ll_cuenta_inscrito)
				liTotalMatPrestado =ids_MatReq.RowCount()
			end if
			
		else
			IF gtr_sumuia.SQLCode = -1 THEN 

				MessageBox("SQL error", gtr_sumuia.SQLErrText)
				sle_cuenta.text=""
				wf_limpia_forma()
			ELSE
				messagebox("Mensaje del Sistema","Alumno NO inscrito en el area de Psicología",stopsign!)
				
				sle_cuenta.text=""
				wf_limpia_forma()
			END IF
		end if			
	end if
	destroy ids_MatReq;
return ls_nombrecompleto

end function

public function string wf_busca_alumno_dca1 (long al_cuenta);
string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
integer liAnio, liPeriodo, li_mes
boolean lb_error=true
liAnio = Year(Today())

li_mes =	integer(string(today(),'m'))

CHOOSE CASE li_mes
	CASE 1,2,3,4,5
		liPeriodo = 0
		
	CASE 6,7
		liPeriodo = 1
		
	CASE 8,9,10,11,12
		liPeriodo = 2
		
END CHOOSE


  SELECT dbo.dca_alumnos_ext.no_folio_inter,   
         dbo.dca_alumnos_ext.s_lastname+' '+ dbo.dca_alumnos_ext.s_name as nombre_completo,
			dbo.dca_alumnos_ext.major
  INTO :ll_cuenta_inscrito, :ls_nombrecompleto, :ls_carrera
    FROM dbo.dca_alumnos_ext,   
         dbo.dcaPeriodoEstancia  
   WHERE ( dbo.dca_alumnos_ext.no_folio_inter = dbo.dcaPeriodoEstancia.noFolioCuenta ) AND
			  ( dbo.dca_alumnos_ext.no_folio_inter = :al_cuenta ) AND
         ( dbo.dcaPeriodoEstancia.anio = :liAnio ) AND
         ( dbo.dcaPeriodoEstancia.periodo = :liPeriodo )  
	using gtr_sumuia;
	
	if gtr_sumuia.sqlcode=100 then
		if  isnull(ll_cuenta_inscrito) or (ll_cuenta_inscrito = 0) then
			messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
			sle_cuenta.text=""
			wf_limpia_forma()
		end if
	elseif gtr_sumuia.sqlcode=0 then
		if  isnull(ll_cuenta_inscrito) or (ll_cuenta_inscrito = 0) then
			messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
			sle_cuenta.text=""
			wf_limpia_forma()
		else
			if ls_carrera = 'PSICOLOGÍA' then
				wf_carga_foto(long(ll_cuenta_inscrito),2)
			else
				messagebox("Mensaje del Sistema","Alumno NO inscrito en el area de Psicología",stopsign!)
				wf_carga_foto(long(ll_cuenta_inscrito),2)
			end if
		end if
	else
		IF gtr_sumuia.SQLCode = -1 THEN 
			MessageBox("SQL error", gtr_sumuia.SQLErrText)
		END IF
	end if			

return ls_nombrecompleto
end function

public subroutine wf_limpia_forma ();ole_foto.Object.FileName = ''
dw_cap.Reset()
dw_interesado.Reset()
dw_solicitud.Reset()
dw_desc.Reset()
//dw_matdisp.Reset()

dw_solicitud.triggerevent("pfc_InsertRow")
dw_interesado.insertrow(0)
dw_gpomat.insertrow(0)
dw_desc.insertrow(0)
liTotalMatPrestado =0

end subroutine

public function string wf_busca_alumno (long al_cuenta);//////////////////////////////////////////////////////////////////////////////
//	Function:		wf_busca_alumno
//	Arguments:		al_cuenta
//	Returns:			Nombre alumno
//	Description:	Valida que el alumno este incrito en el area y curse materias 
//						en el semestre actual. cuando esto es valido carga las materias
//						que cursa para poder realizar la validación del prestamo
//////////////////////////////////////////////////////////////////////////////

string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
boolean lb_error=true
datastore ids_MatReq
ids_MatReq =  create datastore 
ids_MatReq.dataobject ='d_psi_mat_act'
ids_MatReq.settransobject(gtr_sumuia)

if isvalid(ids_MatAlmn) then
	destroy ids_MatAlmn
	ids_MatAlmn =  create datastore 
	ids_MatAlmn.dataobject ='d_psi_matinsc'
	ids_MatAlmn.settransobject(gtr_sumuia)
else
	ids_MatAlmn =  create datastore 
	ids_MatAlmn.dataobject ='d_psi_matinsc'
	ids_MatAlmn.settransobject(gtr_sumuia)
		
end if
setpointer(hourglass!)
if al_cuenta<>0 then
  SELECT v_sce_banderas_inscrito.cuenta,   
	         v_sce_alumnos.nombre+ ' ' + v_sce_alumnos.apaterno+' ' +v_sce_alumnos.amaterno as nombre_completo  ,
			v_sce_carreras.carrera
   INTO :ll_cuenta_inscrito,   
	        	:ls_nombrecompleto,
			  :ls_carrera
FROM		v_sce_alumnos INNER JOIN
		v_sce_academicos ON v_sce_alumnos.cuenta = v_sce_academicos.cuenta INNER JOIN
		v_sce_carreras ON v_sce_academicos.cve_carrera = v_sce_carreras.cve_carrera LEFT OUTER JOIN
		v_sce_banderas_inscrito ON v_sce_alumnos.cuenta = v_sce_banderas_inscrito.cuenta
WHERE v_sce_alumnos.cuenta = :al_cuenta
		and v_sce_carreras.cve_carrera in (select cve_carrera from v_sce_carreras  where cve_coordinacion in (select cve_coordinacion from v_sce_coordinaciones where cve_depto = 3500))using gtr_sumuia;
		if gtr_sumuia.sqlcode=0 then
			//TODO OK
			if  isnull(ll_cuenta_inscrito) then
				messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
				wf_limpia_forma()
				sle_cuenta.text=""
			else
				ids_MatAlmn.retrieve(ll_cuenta_inscrito)
				ids_MatReq.Retrieve(ll_cuenta_inscrito)
				liTotalMatPrestado =ids_MatReq.RowCount()
			end if
			
		else
			IF gtr_sumuia.SQLCode = -1 THEN 

				MessageBox("SQL error", gtr_sumuia.SQLErrText)
				sle_cuenta.text=""
				wf_limpia_forma()
			ELSE
				messagebox("Mensaje del Sistema","Alumno NO inscrito en el area de Psicología",stopsign!)
				wf_limpia_forma()
				sle_cuenta.text=""
			END IF
		end if			
	end if
	destroy ids_MatReq;
return ls_nombrecompleto
end function

public function integer wf_status_pm (string as_serie, string as_material, ref integer ai_tiempoprestamo);integer li_row

ids_StaPrestamo =  create datastore 
ids_StaPrestamo.dataobject ='d_psi_stautsprestamo'
ids_StaPrestamo.settransobject(gtr_sumuia)
li_row = ids_StaPrestamo.retrieve(gi_depto,gi_area,as_material,ii_ligpomat,as_serie)	
if li_row >= 1 and not isnull(li_row) then
	ii_stauts = ids_StaPrestamo.GetItemNumber(1,'stauts')
	ii_tprestamo = ids_StaPrestamo.GetitemNumber(1,'tiempo_prestamo')
	ii_tprestamo = ii_tprestamo + ai_tiempoprestamo
end if

destroy ids_StaPrestamo

if ii_stauts = 1 then
	ai_tiempoprestamo = ii_tprestamo
	return ii_stauts
else
	return ii_stauts
end if



end function

public function boolean wf_asigna_folio ();//////////////////////////////////////////////////////////////////////////
//	Function:		wf_asigna_folio
//	Arguments:		ninguno
//	Returns:			true
//	Description:	Asigna el folio a la solicitud, seleccionando el maximo 
//						para el departamento
//////////////////////////////////////////////////////////////////////////
long llMaxFolio, llRow
SELECT max(dbo.spre_solicitud.folio)
	into :llMaxFolio
	FROM dbo.spre_solicitud  
   WHERE ( dbo.spre_solicitud.cvedepto = :gi_depto ) 	

USING gtr_sumuia;

	if isnull(llMaxFolio) then 
		llMaxFolio =1	
	ELSE
		llMaxFolio =1	+ llMaxFolio		
	end if	
	dw_solicitud.setitem(1,'folio',llMaxFolio)
	// Modif: Oct.2005 GMN.
	dw_solicitud.setitem(1,'solicitanteid',il_cuenta)
	
	// ------
	dw_interesado.setItem(1,'cvedepto',gi_depto)
	dw_interesado.setitem(1,'folio',llMaxFolio)
	for llRow = 1 to dw_cap.RowCount()
		dw_cap.setitem(llRow,'folio',llMaxFolio)
	next
return true


end function

event open;//////////////////////////////////////////////////////////////////////////////
//	Event:			open
//	Arguments:		Ninguno
//	Returns:			pbm_open
//	Description:	Carga la forma y prepara la misma para poder realizar el
//						prestamo de materiales
//////////////////////////////////////////////////////////////////////////////
x=0
y=0
dw_solicitud.setTransObject(gtr_sumuia)
dw_solicitud.triggerevent("pfc_InsertRow")
dw_desc.insertrow(0)
dw_interesado.insertrow(0)
dw_interesado.setitem(1,'tipo_prestamo',1)
dw_interesado.setTransObject(gtr_sumuia)
dw_cap.setTransObject(gtr_sumuia)
dw_gpomat.Retrieve(gi_depto)


end event

on w_psi_prestamo_mat_antes.create
this.cbx_intercambio=create cbx_intercambio
this.st_2=create st_2
this.ole_foto=create ole_foto
this.dw_interesado=create dw_interesado
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_cap=create dw_cap
this.dw_matdisp=create dw_matdisp
this.st_2a=create st_2a
this.dw_desc=create dw_desc
this.cbx_bus=create cbx_bus
this.st_1=create st_1
this.dw_gpomat=create dw_gpomat
this.cb_actualiza=create cb_actualiza
this.cb_eliminar=create cb_eliminar
this.cb_nuevo=create cb_nuevo
this.gb_1=create gb_1
this.dw_motivo=create dw_motivo
this.cb_cerrar=create cb_cerrar
this.dw_solicitud=create dw_solicitud
this.sle_cuenta=create sle_cuenta
this.gb_2=create gb_2
this.Control[]={this.cbx_intercambio,&
this.st_2,&
this.ole_foto,&
this.dw_interesado,&
this.rb_2,&
this.rb_1,&
this.dw_cap,&
this.dw_matdisp,&
this.st_2a,&
this.dw_desc,&
this.cbx_bus,&
this.st_1,&
this.dw_gpomat,&
this.cb_actualiza,&
this.cb_eliminar,&
this.cb_nuevo,&
this.gb_1,&
this.dw_motivo,&
this.cb_cerrar,&
this.dw_solicitud,&
this.sle_cuenta,&
this.gb_2}
end on

on w_psi_prestamo_mat_antes.destroy
destroy(this.cbx_intercambio)
destroy(this.st_2)
destroy(this.ole_foto)
destroy(this.dw_interesado)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_cap)
destroy(this.dw_matdisp)
destroy(this.st_2a)
destroy(this.dw_desc)
destroy(this.cbx_bus)
destroy(this.st_1)
destroy(this.dw_gpomat)
destroy(this.cb_actualiza)
destroy(this.cb_eliminar)
destroy(this.cb_nuevo)
destroy(this.gb_1)
destroy(this.dw_motivo)
destroy(this.cb_cerrar)
destroy(this.dw_solicitud)
destroy(this.sle_cuenta)
destroy(this.gb_2)
end on

event closequery;if dw_cap.modifiedcount()>0 then
	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
		cb_actualiza.triggerevent(clicked!)
	end if
end if	
if dw_cap.deletedcount()>0 then
	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
		cb_actualiza.triggerevent(clicked!)
	end if
end if	
end event

event activate;//////////////////////////////////////////////////////////////////////////////
//	Event:			activate
//	Arguments:		Ninguno
//	Returns:			pbm_activate
//	Description:	Permite asignar la clave y el tipo de solicitante
//////////////////////////////////////////////////////////////////////////////
n_transportar uo_parametros
uo_parametros = Message.PowerObjectParm

if isvalid(Message.PowerObjectParm) then
	
	if uo_parametros.is_parm1="BUSQUEDA" then
		if uo_parametros.is_parm5='solicitanteid' then
			dw_interesado.setitem(1,'solicitanteid',uo_parametros.il_parm1)
			dw_solicitud.setitem(1,'solicitanteid',uo_parametros.il_parm1)
			dw_interesado.setitem(1,'solicitantenombre',uo_parametros.is_parm2)
			dw_interesado.setitem(1,'tipo_prestamo',uo_parametros.ii_parm2)	
			
			choose case uo_parametros.ii_parm2
				
				case 1,2
		
					if isvalid(ids_MatAlmn) then
						destroy ids_MatAlmn
						ids_MatAlmn =  create datastore 
						ids_MatAlmn.dataobject ='d_psi_matinsc'
						ids_MatAlmn.settransobject(gtr_sumuia)
						ids_MatAlmn.retrieve(uo_parametros.il_parm1)
					else
					
						ids_MatAlmn =  create datastore 
						ids_MatAlmn.dataobject ='d_psi_matinsc'
						ids_MatAlmn.settransobject(gtr_sumuia)
						ids_MatAlmn.retrieve(uo_parametros.il_parm1)
					end if	
				case 3
					
					if isvalid(ids_MatProf) then
						destroy ids_MatProf
						ids_MatProf =  create datastore 
						ids_MatProf.dataobject ='d_psi_matinscp'
						ids_MatProf.settransobject(gtr_sumuia)
						ids_MatProf.retrieve(uo_parametros.il_parm1)
					else
					
						ids_MatProf =  create datastore 
						ids_MatProf.dataobject ='d_psi_matinscp'
						ids_MatProf.settransobject(gtr_sumuia)
						ids_MatProf.retrieve(uo_parametros.il_parm1)
					end if
			end choose
		end if
	 
	end if
end if
end event

type cbx_intercambio from checkbox within w_psi_prestamo_mat_antes
integer x = 393
integer y = 100
integer width = 430
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Intercambio"
end type

type st_2 from statictext within w_psi_prestamo_mat_antes
integer x = 101
integer y = 260
integer width = 242
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Cuenta: "
boolean focusrectangle = false
end type

type ole_foto from olecustomcontrol within w_psi_prestamo_mat_antes
event paint ( )
event resize ( )
event click ( )
event dblclick ( )
event keydown ( integer keycode,  integer shift )
event keyup ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
integer x = 2930
integer y = 60
integer width = 622
integer height = 660
integer taborder = 30
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
string binarykey = "w_psi_prestamo_mat_antes.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_interesado from u_dw within w_psi_prestamo_mat_antes
integer x = 37
integer y = 388
integer width = 2793
integer height = 400
integer taborder = 30
string dataobject = "d_psi_solmaterial"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//	Description:	Llama a las funnciones wf_busca_alumno, wf_busca_empleado,
//						solo cuando se modifico la calve del solicitante
//////////////////////////////////////////////////////////////////////////////
n_transportar uo_parametros

long ll_cuenta_inscrito
string ls_nombrecompleto

long al_cuenta 
al_cuenta = long(data)

CHOOSE CASE dwo.name
	CASE 'solicitanteid'
	
		CHOOSE CASE this.getitemnumber(1,'tipo_prestamo')
			CASE 1
				
				this.setitem(1,'solicitantenombre',wf_busca_alumno(long(data)))
			CASE 2
				
				this.setitem(1,'solicitantenombre',wf_busca_alumno_dca(long(data)))
			
			CASE 3
				
				uo_parametros=wf_busca_empleado(long(data))
				this.setitem(1,'solicitantenombre',uo_parametros.is_parm1)
				
		END CHOOSE
		
	
END CHOOSE

end event

event itemfocuschanged;call super::itemfocuschanged;//////////////////////////////////////////////////////////////////////////////
//	Description:	Permite cargar la información relacionada a la clave del, 
//						solicitante, nombre, grupo, y nombre del profesor en el caso 
//						de que el solicitante sea un alumno
//////////////////////////////////////////////////////////////////////////////
string nombre,apat,amat,columna, data, verifica, ls_prepa, lstipo
long cuenta
integer li_param=0 ,li_cve_empresa,li_tipo
datetime ld_date

columna = 	dwo.name
this.accepttext()

	CHOOSE CASE columna
		case "solicitantetel"
			li_tipo =this.GetItemNumber(1,'tipo_prestamo')
			cuenta =this.GetItemNumber(1,'solicitanteid')
			if cuenta > 0  then
				dw_solicitud.setitem(1,'solicitanteid',cuenta)
				choose case li_tipo
						
					case 1
						origen.ii_parm1 = li_tipo
						origen.il_parm1 = this.GetItemNumber(1,'solicitanteid')
						openwithparm(w_psi_mat_insc,origen)
						if isvalid(Message.PowerObjectParm) then
							regreso = message.powerobjectparm
							this.setitem(1,'solicitantegrupo',regreso.is_parm2)
							this.setitem(1,'solicitanteprofesor',regreso.is_parm3)			
						end if
					case 3
						origen.ii_parm1 = li_tipo
						origen.il_parm1 = this.GetItemNumber(1,'solicitanteid')
						openwithparm(w_psi_mat_insc,origen)
						if isvalid(Message.PowerObjectParm) then
							regreso = message.powerobjectparm
							this.setitem(1,'solicitantegrupo',regreso.is_parm2)
						else
							integer Net
							Net = MessageBox("Mensaje del Sistema", "¿Desea continuar con el prestamo de material", &
									Question!, yesno!, 2)
							
							IF Net = 2 THEN
								sle_cuenta.text=""
								wf_limpia_forma()													
							END IF	
						end if
				end choose
			else
				messagebox("Mensaje del Sistema","Es necesario ingresar la clave de profesor o alumno",stopsign!)
			end if
	end choose

end event

type rb_2 from radiobutton within w_psi_prestamo_mat_antes
integer x = 32
integer y = 180
integer width = 343
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Profesor"
end type

event clicked;st_2.text = 'Clave :'
sle_cuenta.text = " "
cbx_intercambio.checked = false
cbx_intercambio.visible = false
end event

type rb_1 from radiobutton within w_psi_prestamo_mat_antes
integer x = 32
integer y = 96
integer width = 343
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Alumno"
boolean checked = true
end type

event clicked;st_2.text = 'Cuenta :'

sle_cuenta.text = " "


cbx_intercambio.visible = true
end event

type dw_cap from u_dw within w_psi_prestamo_mat_antes
integer x = 87
integer y = 1860
integer width = 2199
integer height = 372
integer taborder = 110
string dataobject = "d_psi_matsol"
end type

event retrieveend;call super::retrieveend;//
//long llRow
//if rowcount >0 then
//
//	for llRow=1 to rowcount
//		
//	next
//end if
end event

event itemchanged;call super::itemchanged;//long llRow
//string lsNoSerie, lsCveMaterial
//integer li_grupo
//if dw_cap.rowcount() >0 then
//	
//	for llRow=1 to dw_cap.rowcount()
//		lsNoSerie = dw_cap.getitemstring(llRow,'num_serie')
//		lsCveMaterial = dw_cap.getitemstring(llRow,'cvematerial')
//		li_grupo = dw_cap.getitemnumber(llRow,'cvegrupo')
//	next
//end if
end event

type dw_matdisp from u_dw within w_psi_prestamo_mat_antes
integer x = 73
integer y = 1204
integer width = 3035
integer height = 636
integer taborder = 100
boolean enabled = false
string title = "aa"
string dataobject = "d_psi_matdisp"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event clicked;call super::clicked;SelectRow(0, FALSE)
IF row <> 0 THEN SelectRow(row, TRUE)
this.event itemfocuschanged( row, dwo)
end event

event constructor;call super::constructor;this.setTransObject(gtr_sumuia)
this.ib_rmbmenu = FALSE
this.of_SetRowManager(TRUE)
this.of_SetSort(TRUE)
this.of_SetProperty(TRUE)
this.inv_sort.of_SetColumnHeader(TRUE)
end event

event doubleclicked;call super::doubleclicked;datetime ldFechaI, ldFechaF
integer liCveGpo, Net
long ll_nva_linea, llRowsMat, llIdSol, llRow, llTotMatFil, liTipoPrestamo
string lsNoSerie, lsCveMat, lsFilter, lsTFilter
datastore ids_MatReq
ids_MatReq =  create datastore 
ids_MatReq.dataobject ='d_psi_mat_pre'
ids_MatReq.settransobject(gtr_sumuia)

dw_cap.reset()
if not isnull(row) then
	if row<>0 then
	
//		lsNoSerie = this.getitemstring(row,'spre_inventario_num_serie') Gloria M
		lsCveMat = this.getitemstring(row,'spre_inventario_cvematerial')
		liCveGpo = this.GetItemNumber (row,'spre_inventario_cvegrupo')
		llIdSol= dw_solicitud.GetItemNumber(1,'solicitanteid')
		ldFechaI = dw_solicitud.GetItemDateTime(1,'fecha_inicio')
 		ldFechaF = dw_solicitud.GetItemDateTime(1,'fecha_fin')
		ids_MatReq.retrieve(gi_depto, gi_area, lsCveMat, liCveGpo)
		llRowsMat =ids_MatReq.rowcount()
		if llRowsMat > 0 then
			lsFilter =""
			for llRow = 1 to llRowsMat
				lsFilter = string(ids_MatReq.GetItemNumber (llRow,'cvemateria'))
				if Len(trim(lsFilter)) > 0 then 					
					if Len(trim(lsTFilter)) > 0 then 
						lsTFilter = lsTFilter +','+ lsFilter
					else
						lsTFilter = lsFilter 
					end if
				end if	
			next 
			liTipoPrestamo = dw_interesado.GetItemNumber (1,'tipo_prestamo')
			choose case liTipoPrestamo
				case 1,2
					if isvalid(ids_MatAlmn) then
						lsTFilter = "v_sce_mat_inscritas_cve_mat in ( " + lsTFilter +" )"
						ids_MatAlmn.setFilter(lsTFilter)
						ids_MatAlmn.filter()
						llTotMatFil = ids_MatAlmn.rowcount()
					else
						llTotMatFil =0
					end if
				case 3
					
					if isvalid(ids_MatProf) then
						lsTFilter = "v_sce_materias_cve_mat in ( " + lsTFilter +" )"
						ids_MatProf.setFilter(lsTFilter)
						ids_MatProf.filter()
						llTotMatFil = ids_MatProf.rowcount()
					else
						llTotMatFil =0
					end if
					
			end choose
			if llTotMatFil>0 then
				if dw_cap.rowcount() < (3 - liTotalMatPrestado)  then 	
					ll_nva_linea=dw_cap.insertrow(0)
					dw_cap.setItem(ll_nva_linea,'cvedepto',gi_depto)
					dw_cap.setItem(ll_nva_linea,'cvearea',gi_area)
					dw_cap.setItem(ll_nva_linea,'cvematerial',lsCveMat)				
					dw_cap.setItem(ll_nva_linea,'fecha_inicio',ldFechaI)
					dw_cap.setItem(ll_nva_linea,'fecha_final',ldFechaF)
					dw_cap.setItem(ll_nva_linea,'status',0)
					dw_cap.setItem(ll_nva_linea,'consecutivo',ll_nva_linea)
					dw_cap.setItem(ll_nva_linea,'cvegrupo',liCveGpo)
	//				dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie) Gloria
					dw_cap.scrolltorow(ll_nva_linea)					
				else
					
					
							Net = messagebox("Atención","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material"	, &
									Question!, yesno!, 2)
							
							IF Net = 1 THEN
									ll_nva_linea=dw_cap.insertrow(0)
									dw_cap.setItem(ll_nva_linea,'cvedepto',gi_depto)
									dw_cap.setItem(ll_nva_linea,'cvearea',gi_area)
									dw_cap.setItem(ll_nva_linea,'cvematerial',lsCveMat)				
									dw_cap.setItem(ll_nva_linea,'fecha_inicio',ldFechaI)
									dw_cap.setItem(ll_nva_linea,'fecha_final',ldFechaF)
									dw_cap.setItem(ll_nva_linea,'status',0)
									dw_cap.setItem(ll_nva_linea,'consecutivo',ll_nva_linea)
									dw_cap.setItem(ll_nva_linea,'cvegrupo',liCveGpo)
//									dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie) Gloria
									dw_cap.scrolltorow(ll_nva_linea)			
							
																			
							END IF	
				end if
			Else
				
			
				Net = messagebox("Atención","El solicitante no esta cursando ninguna materia que permita el prestamo del material~r~n¿Desea continuar con el prestamo de material"	, &
					Question!, yesno!, 2)
							
				IF Net = 1 THEN
					if dw_cap.rowcount() < (3 - liTotalMatPrestado)  then 	
						ll_nva_linea=dw_cap.insertrow(0)
						dw_cap.setItem(ll_nva_linea,'cvedepto',gi_depto)
						dw_cap.setItem(ll_nva_linea,'cvearea',gi_area)
						dw_cap.setItem(ll_nva_linea,'cvematerial',lsCveMat)				
						dw_cap.setItem(ll_nva_linea,'fecha_inicio',ldFechaI)
						dw_cap.setItem(ll_nva_linea,'fecha_final',ldFechaF)
						dw_cap.setItem(ll_nva_linea,'status',0)
						dw_cap.setItem(ll_nva_linea,'consecutivo',ll_nva_linea)
						dw_cap.setItem(ll_nva_linea,'cvegrupo',liCveGpo)
//						dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie) Gloria
						dw_cap.scrolltorow(ll_nva_linea)			
					else
						Net = messagebox("Atención","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material"	, &
										Question!, yesno!, 2)
								
								IF Net = 1 THEN
										ll_nva_linea=dw_cap.insertrow(0)
										dw_cap.setItem(ll_nva_linea,'cvedepto',gi_depto)
										dw_cap.setItem(ll_nva_linea,'cvearea',gi_area)
										dw_cap.setItem(ll_nva_linea,'cvematerial',lsCveMat)				
										dw_cap.setItem(ll_nva_linea,'fecha_inicio',ldFechaI)
										dw_cap.setItem(ll_nva_linea,'fecha_final',ldFechaF)
										dw_cap.setItem(ll_nva_linea,'status',0)
										dw_cap.setItem(ll_nva_linea,'consecutivo',ll_nva_linea)
										dw_cap.setItem(ll_nva_linea,'cvegrupo',liCveGpo)
//										dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie) Gloria
										dw_cap.scrolltorow(ll_nva_linea)			
																			
								END IF			
					end if
				else
					sle_cuenta.text=""
					wf_limpia_forma()													
				END IF	
			end if
			//Se valida que el prestamo 
			
		else 
			
			if dw_cap.rowcount() < (3 - liTotalMatPrestado)  then 	
				ll_nva_linea=dw_cap.insertrow(0)
				dw_cap.setItem(ll_nva_linea,'cvedepto',gi_depto)
				dw_cap.setItem(ll_nva_linea,'cvearea',gi_area)
				dw_cap.setItem(ll_nva_linea,'cvematerial',lsCveMat)				
				dw_cap.setItem(ll_nva_linea,'fecha_inicio',ldFechaI)
				dw_cap.setItem(ll_nva_linea,'fecha_final',ldFechaF)
				dw_cap.setItem(ll_nva_linea,'status',0)
				dw_cap.setItem(ll_nva_linea,'consecutivo',ll_nva_linea)
				dw_cap.setItem(ll_nva_linea,'cvegrupo',liCveGpo)
//				dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie) Gloria
				dw_cap.scrolltorow(ll_nva_linea)					
			else
					
					Net = messagebox("Atención","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material"	, &
							Question!, yesno!, 2)
							
					IF Net = 1 THEN
							ll_nva_linea=dw_cap.insertrow(0)
							dw_cap.setItem(ll_nva_linea,'cvedepto',gi_depto)
							dw_cap.setItem(ll_nva_linea,'cvearea',gi_area)
							dw_cap.setItem(ll_nva_linea,'cvematerial',lsCveMat)				
							dw_cap.setItem(ll_nva_linea,'fecha_inicio',ldFechaI)
							dw_cap.setItem(ll_nva_linea,'fecha_final',ldFechaF)
							dw_cap.setItem(ll_nva_linea,'status',0)
							dw_cap.setItem(ll_nva_linea,'consecutivo',ll_nva_linea)
							dw_cap.setItem(ll_nva_linea,'cvegrupo',liCveGpo)
//							dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie) Gloria
							dw_cap.scrolltorow(ll_nva_linea)			
																		
					END IF			
			end if
			
		END If

	end if
end if

dw_cap.setfocus()


end event

event rowfocuschanged;call super::rowfocuschanged;if currentrow>0 then
	selectrow(0,false)
	selectrow(currentrow,true)
else
	selectrow(0,false)
end if
end event

type st_2a from statictext within w_psi_prestamo_mat_antes
integer x = 69
integer y = 984
integer width = 247
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Material"
boolean focusrectangle = false
end type

type dw_desc from datawindow within w_psi_prestamo_mat_antes
integer x = 329
integer y = 980
integer width = 1687
integer height = 104
integer taborder = 40
string title = "none"
string dataobject = "dw_editor"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;string desc
accepttext()
dw_matdisp.enabled= true

if cbx_bus.checked = true then
	desc = "%"+upper(getitemstring(getrow(),1))+"%"
else
	desc = upper(getitemstring(getrow(),1))+"%"
end if

dw_matdisp.retrieve(gi_depto,gi_area,ligpomat,desc)
end event

type cbx_bus from checkbox within w_psi_prestamo_mat_antes
integer x = 320
integer y = 1084
integer width = 960
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Busqueda de palabra intermedia "
boolean checked = true
end type

type st_1 from statictext within w_psi_prestamo_mat_antes
integer x = 69
integer y = 872
integer width = 247
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Grupo"
boolean focusrectangle = false
end type

type dw_gpomat from u_dw within w_psi_prestamo_mat_antes
integer x = 329
integer y = 876
integer width = 1797
integer height = 96
integer taborder = 40
string title = "aa"
string dataobject = "d_dlb_grupos_mat"
boolean border = false
boolean hsplitscroll = true
end type

event constructor;call super::constructor;this.setTransObject(gtr_sumuia)
end event

event itemfocuschanged;call super::itemfocuschanged;//Realiza override

if row >0 then
	ligpomat = dw_gpomat.getitemnumber(  row, 'cvegrupo')
	ii_ligpomat = ligpomat
	IF dw_matdisp.Retrieve(gi_depto,gi_area,ligpomat,'%') = -1 THEN
		MessageBox("Error","Se encontro un error al consultar los datos")
	ELSE
		dw_matdisp.SetFocus( )
		
	END IF

end if
end event

type cb_actualiza from commandbutton within w_psi_prestamo_mat_antes
integer x = 2350
integer y = 1984
integer width = 361
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;integer li_row, li_diasprestamo = 0, listatus
long llMaxFolio, llRow
string lsUpdate, lsTUpdate, lsCveMaterial, lsNoSerie

for llRow = 1 to dw_cap.RowCount()
	lsNoSerie = dw_cap.getitemstring(llRow,'num_serie')
	lsCveMaterial = dw_cap.getitemstring(llRow,'cvematerial')
next
						
listatus = wf_status_pm(lsNoSerie,lsCveMaterial,iiDiasPrestamo)


	if listatus = 1 then
		if wf_asigna_folio() = true then
			if dw_solicitud.update()>0 then
				commit using gtr_sumuia;
				if dw_interesado.update()>0 then
					commit using gtr_sumuia;
					if dw_cap.update()>0 then
						commit using gtr_sumuia;
						for llRow = 1 to dw_cap.RowCount()
							lsNoSerie = dw_cap.getitemstring(llRow,'num_serie')
			
							lsCveMaterial = dw_cap.getitemstring(llRow,'cvematerial')
							UPDATE dbo.spre_inventario  
							SET dbo.spre_inventario.stauts = 2//,dbo.spre_inventario.tiempo_prestamo = :iiDiasPrestamo  
							WHERE ( dbo.spre_inventario.cvedepto = :gi_depto ) AND  
									( dbo.spre_inventario.cvearea = :gi_area ) AND  
									( dbo.spre_inventario.cvematerial = :lsCveMaterial ) AND  
									( dbo.spre_inventario.num_serie = :lsNoSerie ) 
							using gtr_sumuia;
						next
						commit using gtr_sumuia;
						messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
						sle_cuenta.text=""
						wf_limpia_forma()
					else
						rollback using gtr_sumuia;
					messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
					end if
				else
					rollback using gtr_sumuia;
					messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
				end if
			else
				rollback using gtr_sumuia;
				messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
			end if
		else
			rollback using gtr_sumuia;
			messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
		end if
	elseif listatus = 2 and dw_cap.RowCount() > 0 then
		messagebox("Atención","El material se encuentra en prestamo",exclamation!)
	elseif (listatus <> 1) and (listatus <> 2) and dw_cap.RowCount() > 0 then
	
		messagebox("Atención","La Serie indicada del Material no existe",exclamation!)
	else
		messagebox("Atención","Falta indicar datos",exclamation!)
	end if

end event

type cb_eliminar from commandbutton within w_psi_prestamo_mat_antes
integer x = 2752
integer y = 1920
integer width = 361
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;
  IF dw_cap.deleterow(dw_cap.getrow())<>1 THEN
		messagebox("Mensaje del sistema","El registro NO ha sido eliminado")		
  END IF	 



end event

type cb_nuevo from commandbutton within w_psi_prestamo_mat_antes
boolean visible = false
integer x = 2761
integer y = 2132
integer width = 361
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;long ll_nva_linea, llTotalRenglones
llTotalRenglones = dw_cap.RowCount()	
setfocus()		
if llTotalRenglones <=  3 then

	if dw_cap.accepttext()=1 then
		ll_nva_linea=dw_cap.insertrow(0)
		dw_cap.setcolumn(1)
		dw_cap.scrolltorow(ll_nva_linea)
	end if
Else
	messagebox("Mensaje del sistema","Solo se pueden prestar 3 materiales como maximo")
end if

end event

type gb_1 from groupbox within w_psi_prestamo_mat_antes
boolean visible = false
integer x = 37
integer y = 808
integer width = 3520
integer height = 1468
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
boolean enabled = false
string text = "Mostrar disponibles para"
end type

type dw_motivo from datawindow within w_psi_prestamo_mat_antes
boolean visible = false
integer x = 370
integer y = 1900
integer width = 2853
integer height = 212
integer taborder = 40
string dataobject = "d_dw_matinsc"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_psi_prestamo_mat_antes
integer x = 2752
integer y = 2028
integer width = 361
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Salir"
end type

event clicked;close(parent)
end event

type dw_solicitud from u_dw within w_psi_prestamo_mat_antes
integer x = 846
integer y = 48
integer width = 2034
integer height = 228
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_psi_detsolmaterial"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event pfc_postinsertrow(long al_row);call super::pfc_postinsertrow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_postinsertrow
//	Arguments:		al_row
//	Returns:			None
//	Description:	Inserta los valores relacionados con la fecha de la solicitud, las fecha de entrega
//						el periodo al que pertenece la solicitud.
//////////////////////////////////////////////////////////////////////////////
date  liDiasol
datetime liDiaHora, liDiaHoraip, liDiaHorafp, ldFecha
integer li_dia, li_mes, li_año, li_periodo
long ll_TotDias, llck
string daynameinicio
time ltHora
datastore lds_DiasAd

li_dia =day(Today ( ))
li_mes = month(Today ( ))
li_año = year(Today ( ))
ltHora = now()
liDiasol= Date(li_año, li_mes, li_dia) 
liDiaHora= DateTime(Date(li_año, li_mes, li_dia), time('00:00:00'))
liDiaHoraip= DateTime(liDiasol, (ltHora))
liDiaHorafp = f_calcula_fecha_entrega(liDiasol)
iiDiasPrestamo = f_calcula_diasdeprestamo(liDiasol)


// daynameinicio = DayName(liDiasol)
//
//	choose case daynameinicio		
//		case 'Sunday'			
//			liDiaHorafp= DateTime(RelativeDate(liDiasol, 4),  time('23:59:59'))	
//		case 'Monday'
//			liDiaHorafp= DateTime(RelativeDate(liDiasol, 3), time('23:59:59'))
//	 	case 'Tuesday'			
//			liDiaHorafp= DateTime(RelativeDate(liDiasol, 3), time('23:59:59'))
//			
//	 	case 'Wednesday'			
//			liDiaHorafp= DateTime(RelativeDate(liDiasol, 5), time('23:59:59'))
//			
//		case 'Thursday'			
// 			liDiaHorafp= DateTime(RelativeDate(liDiasol, 5), time('23:59:59'))
//			 
//		case 'Friday'			
//			liDiaHorafp= DateTime(RelativeDate(liDiasol, 5), time('23:59:59'))
//			
//		case 'Saturday'			
//			liDiaHorafp= DateTime(RelativeDate(liDiasol, 5), time('23:59:59'))	
//	end choose
//
//		lds_DiasAd =  create datastore 
//		
//		lds_DiasAd.dataobject ='d_psi_dias_desc'
//		lds_DiasAd.settransobject(gtr_sumuia)	
//		lds_DiasAd.Retrieve( liDiaHoraip, liDiaHorafp )
// 		ll_TotDias = lds_DiasAd.Rowcount()		
//		if lds_DiasAd.Rowcount() > 0 then
//			ll_TotDias=0
//			for llck =1 to lds_DiasAd.Rowcount()
//				ldFecha =lds_DiasAd.GetItemDateTime(llck,'fecha')
//				if (  DayName(date(ldFecha)) ='Monday' or DayName(date(ldFecha)) ='Tuesday' or DayName(date(ldFecha)) ='Wednesday' or DayName(date(ldFecha)) ='Thursday' or DayName(date(ldFecha)) ='Friday'    )then
//					ll_TotDias = ll_TotDias + 1
//				end if
//			next 
//			choose case daynameinicio		
//				case 'Sunday'			
//					liDiaHorafp= DateTime(RelativeDate(liDiasol, 4 + ll_TotDias), time('23:59:59'))	
//					
//				case 'Monday'
//					liDiaHorafp= DateTime(RelativeDate(liDiasol, 3 + ll_TotDias), time('23:59:59'))
//				case 'Tuesday'			
//					liDiaHorafp= DateTime(RelativeDate(liDiasol, 3 + ll_TotDias), time('23:59:59'))
//					
//				case 'Wednesday'			
//					liDiaHorafp= DateTime(RelativeDate(liDiasol, 5 + ll_TotDias), time('23:59:59'))
//					
//				case 'Thursday'			
//					liDiaHorafp= DateTime(RelativeDate(liDiasol, 5 + ll_TotDias), time('23:59:59'))
//					 
//				case 'Friday'			
//					liDiaHorafp= DateTime(RelativeDate(liDiasol, 5 + ll_TotDias), time('23:59:59'))
//					
//				case 'Saturday'			
//					liDiaHorafp= DateTime(RelativeDate(liDiasol, 5 + ll_TotDias), time('23:59:59'))	
//			end choose
//			wf_fecha_valida(liDiaHorafp)
//		end if
		
		
		setnull(li_periodo)
 
		SELECT dbo.spre_periodos.cveperiodo
		into :li_periodo
		FROM dbo.spre_periodos  
		WHERE ( dbo.spre_periodos.cvedepto =:gi_depto ) 
		AND   ( getdate() between dbo.spre_periodos.fecha_inicio and dbo.spre_periodos.fecha_fin )   
		USING gtr_sumuia;
		
		if isnull(li_periodo) then 
			messagebox("ATENCIÓN","Problemas al consultar el periodo activo ~nEs necesario cargar el periodo activo " + gtr_sumuia.SQLErrText ) 		
		ELSE
			this.setItem(al_row,'cveperiodo',li_periodo)
			this.setItem(al_row,'cvedepto',gi_depto)
//		this.setItem(al_row,'solicitanteid',il_cuenta)
		this.setItem(al_row,'fecha_solicitud',liDiaHora)
		this.setItem(al_row,'fecha_inicio',liDiaHoraip)
		this.setItem(al_row,'fecha_fin',liDiaHorafp)
		this.setItem(al_row,'status',0)
		this.setItem(al_row,'condicion',0)
		end if	
		Destroy lds_DiasAd
end event

type sle_cuenta from singlelineedit within w_psi_prestamo_mat_antes
event activarbusq ( )
integer x = 393
integer y = 248
integer width = 334
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event activarbusq();
long ll_cuentab, ll_cuenta, ll_RowsPrestamo, retvalmulta, al_cuenta
string ls_digito, ls_digitov ,ls_cuenta, ls_nombre, ls_periodo
string ls_nombrecompleto

n_transportar uo_parametros
	if rb_1.checked = true then
		
		if cbx_intercambio.checked =  true then
			
			ll_cuentab = long(sle_cuenta.text)
			il_cuenta = ll_cuentab
			retvalmulta = f_valida_cuenta(ll_cuentab)
			if retvalmulta = 1 then 
				messagebox("Atención","El prestamo de material no se puede realizar debido al adeudo presentado ")
				sle_cuenta.text=""
				return
			end if
			dw_interesado.setitem(1,'tipo_prestamo',2)
			dw_interesado.setitem(1,'solicitanteid',long(ll_cuentab))
			dw_interesado.setitem(1,'solicitantenombre',wf_busca_alumno_dca1(long(ll_cuentab)))

		else
	
			if match(trim(sle_cuenta.text),'-')= true then
				
				ls_cuenta= trim(sle_cuenta.text)
				ll_cuentab = long(left(trim(sle_cuenta.text),len(trim(sle_cuenta.text))-2))
				ls_digito = upper(right(trim(sle_cuenta.text),1))
				ls_digitov =obten_digito(ll_cuentab)
				il_cuenta = ll_cuentab
				
			else
				
				ls_cuenta= left(trim(sle_cuenta.text),len(trim(sle_cuenta.text))-1)+'-'+right(trim(sle_cuenta.text),1)
				ll_cuentab = long(left(trim(sle_cuenta.text),len(trim(sle_cuenta.text))-1))
				ls_digito = upper(right(trim(sle_cuenta.text),1))
				ls_digitov =obten_digito(ll_cuentab)
				il_cuenta = ll_cuentab
				
			end if
			if ls_digito =ls_digitov then
				
				retvalmulta = f_valida_cuenta(ll_cuentab)
			if retvalmulta = 1 then
				
				messagebox("Atención","El prestamo de material no se puede realizar debido al adeudo presentado ")
				sle_cuenta.text=""
				return
			end if
			
			
			dw_interesado.setitem(1,'tipo_prestamo',1)
			dw_interesado.setitem(1,'solicitanteid',long(ll_cuentab))
			wf_carga_foto(long(ll_cuentab),1)
			dw_interesado.setitem(1,'solicitantenombre',wf_busca_alumno(long(ll_cuentab)))
//			wf_carga_foto(long(ll_cuentab),1)
			dw_interesado.setfocus()
			
		else
			
			sle_cuenta.text=""
			messagebox("Atención","La cuenta: "+ls_cuenta+" no existe o es incorrecta ")	
		end if
		END IF
	
		
		
	else
		
			ls_cuenta=trim(sle_cuenta.text)
			il_cuenta = long(ls_cuenta)
			retvalmulta = f_valida_cuenta(long(ls_cuenta))
			if retvalmulta = 1 then 
				
				messagebox("Atención","El prestamo de material no se puede realizar debido al adeudo presentado ")
				sle_cuenta.text=""
				return
			end if
		
			dw_interesado.setitem(1,'tipo_prestamo',3)
		
			dw_interesado.setitem(1,'solicitanteid',long(ls_cuenta))
			uo_parametros=wf_busca_empleado(long(ls_cuenta))
			wf_carga_foto(long(ls_cuenta),3)
			dw_interesado.setitem(1,'solicitantenombre',uo_parametros.is_parm1)
			dw_interesado.setfocus()
		
	end if
	
	
	
end event

event modified;if trim(sle_cuenta.text) <>"" then 
	wf_limpia_forma()
	IF KeyDown (keyEnter!) THEN
		setpointer(Hourglass!)
		sle_cuenta.triggerevent( "activarbusq")
		setpointer(Arrow!)		
	END IF
end if
end event

type gb_2 from groupbox within w_psi_prestamo_mat_antes
integer x = 23
integer y = 24
integer width = 818
integer height = 332
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Buscar"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Ew_psi_prestamo_mat_antes.bin 
2C00000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000005fffffffe00000004fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000004a44234001cca3fb00000003000003800000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000006a0000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000029100000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004e7edc30011cf766f20004fa65d4237af000000004a3f685001cca3fb4a44234001cca3fb00000000000000000000000000000001fffffffe000000030000000400000005000000060000000700000008000000090000000a0000000b0000000cfffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
27ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00560047004f0042002e00580043004f00200058006f00430079007000690072006800670020007400630028002000290039003100360039002d0020003100200039003900200037006f004a00200065002e0043004f00200069006c00680070006e0061002000740000000100000000000000000000000000000000000000000000fffe00020105e7edc30011cf766f20004fa65d4237af00000001fb8f0821101b01640008ed8413c72e2b000000300000026100000012000001000000009800000101000000a000000102000000a800000103000000b000000104000000b800000105000000c000000106000000c800000107000000d000000108000000d800000109000000e00000010a000000ec0000010b000000f40000010c000000fc0000010d000001040000010e0000010c0000010f00000114000001100000011c000000000000012400000003000200000000000300000e0e000000030000110e000000030000006900000002000000010000000200000000000000020000000100000002000000000000000b000000000000000800000001000000000000000200000001000000020000000000000002000000000000000200000000000000043f800000000000043f8000000000000b0000000000000012000000000000000100010a0000000b0065706a007469646700726568000001060000000a6d7463646f687465010900640009000069660000616e656c1000656d100000017400000061706f777571737369746e610d00657a0a00000174000000626d75686c69616e00010e00000005006f6f7a000108006d00100000616600007579636e6d6173706e696c7001030067000c0000735f00006b636f74706f7270010700730007000069640000726568740001050000000900747561007a69736f01040065000c00006f620000726564726c797473010b0065000700007270000078746e69000101000000090078655f00746e6574010c0078000700007270000079746e69000102000000090078655f00746e6574010f0079000a0000727000007a746e69006d6f6f00000100000000097265765f6e6f69730000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000e0e0000110e000000690000000000ffffff0001000100000100010000000000000000000000003f8000003f80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000d00000034000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Ew_psi_prestamo_mat_antes.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
