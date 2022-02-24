$PBExportHeader$w_adm_prestamo_mat.srw
$PBExportComments$Permite capturar los materiales a prestar
forward
global type w_adm_prestamo_mat from window
end type
type st_1 from statictext within w_adm_prestamo_mat
end type
type dw_validasalon from datawindow within w_adm_prestamo_mat
end type
type cb_salir from commandbutton within w_adm_prestamo_mat
end type
type dw_reporte_mat from datawindow within w_adm_prestamo_mat
end type
type cbx_materiales from checkbox within w_adm_prestamo_mat
end type
type mle_1 from multilineedit within w_adm_prestamo_mat
end type
type cb_buscar from commandbutton within w_adm_prestamo_mat
end type
type cbx_ocupados from checkbox within w_adm_prestamo_mat
end type
type dw_criterios from datawindow within w_adm_prestamo_mat
end type
type cbx_intercambio from checkbox within w_adm_prestamo_mat
end type
type st_2 from statictext within w_adm_prestamo_mat
end type
type dw_interesado from u_dw within w_adm_prestamo_mat
end type
type rb_2 from radiobutton within w_adm_prestamo_mat
end type
type rb_1 from radiobutton within w_adm_prestamo_mat
end type
type dw_cap from u_dw within w_adm_prestamo_mat
end type
type dw_desc from datawindow within w_adm_prestamo_mat
end type
type dw_gpomat from u_dw within w_adm_prestamo_mat
end type
type cb_actualiza from commandbutton within w_adm_prestamo_mat
end type
type cb_eliminar from commandbutton within w_adm_prestamo_mat
end type
type dw_motivo from datawindow within w_adm_prestamo_mat
end type
type dw_solicitud from u_dw within w_adm_prestamo_mat
end type
type sle_cuenta from singlelineedit within w_adm_prestamo_mat
end type
type gb_2 from groupbox within w_adm_prestamo_mat
end type
type dw_busqueda from datawindow within w_adm_prestamo_mat
end type
type dw_busqueda_1 from datawindow within w_adm_prestamo_mat
end type
end forward

shared variables

end variables

global type w_adm_prestamo_mat from window
integer x = 15
integer y = 16
integer width = 3675
integer height = 2592
boolean titlebar = true
string title = "Prestamo material"
boolean controlmenu = true
boolean resizable = true
long backcolor = 29534863
st_1 st_1
dw_validasalon dw_validasalon
cb_salir cb_salir
dw_reporte_mat dw_reporte_mat
cbx_materiales cbx_materiales
mle_1 mle_1
cb_buscar cb_buscar
cbx_ocupados cbx_ocupados
dw_criterios dw_criterios
cbx_intercambio cbx_intercambio
st_2 st_2
dw_interesado dw_interesado
rb_2 rb_2
rb_1 rb_1
dw_cap dw_cap
dw_desc dw_desc
dw_gpomat dw_gpomat
cb_actualiza cb_actualiza
cb_eliminar cb_eliminar
dw_motivo dw_motivo
dw_solicitud dw_solicitud
sle_cuenta sle_cuenta
gb_2 gb_2
dw_busqueda dw_busqueda
dw_busqueda_1 dw_busqueda_1
end type
global w_adm_prestamo_mat w_adm_prestamo_mat

type variables
boolean sb_nuevo=false
integer ligpomat, liTotalMatPrestado =0
long sl_linea, il_cuenta
n_transportar regreso
n_transportar origen
datastore ids_MatAlmn, ids_MatProf, ids_StaPrestamo


integer ii_stauts, ii_tprestamo, ii_ligpomat , iiDiasPrestamo, li_tipo_grupo
datawindowchild idwc_tipoespacio,idwc_espacio

integer ii_status_sol, liEstatus, iiEstatusant
long llFolio, liGrupo

datetime idt_fecha_hoy

string ls_salon
integer ii_hora_inicio, ii_hora_final





end variables

forward prototypes
public subroutine wf_fecha_valida (ref datetime ad_fecha_final)
public subroutine wf_carga_foto (long li_cuenta, integer li_tipo)
public subroutine wf_status_pm (long al_folio)
public subroutine wf_verifica_status ()
public subroutine wf_crea_busqueda_1 (datetime ldt_fechaini, datetime ldt_fechafin)
public function string wf_busca_alumno_dca (long al_cuenta)
public function string wf_busca_alumno_dca1 (long al_cuenta)
public function n_transportar wf_busca_empleado (long al_nomina)
public function string wf_busca_alumno (long al_cuenta)
public function boolean wf_asigna_folio ()
public subroutine wf_limpia_forma ()
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

//	choose case li_tipo
//		case 1
//			ls_arch_ruta = f_archivo_gvbox(f_foto_alumno(li_cuenta))
//		case 3
//			ls_arch_ruta = f_archivo_gvbox(f_foto_profesor(li_cuenta))
//		case 2
//			ls_arch_ruta = f_archivo_gvbox(f_foto_alumno_dca(li_cuenta))
//	end choose
	
	if li_tipo=0 then
		
	else
		
	end if
//	IF IsNull(ls_arch_ruta) THEN 
//		ole_foto.Object.FileName = ''
//		messagebox('Aviso','El Alumno no tiene foto') 
//	ELSE 
//		ole_foto.Object.FileName = ls_arch_ruta
//		ole_foto.visible=true
//		ole_foto.object.autosize=2
//	END IF

end subroutine

public subroutine wf_status_pm (long al_folio);//////////////////////////////////////////////////////////////////////////
//	Function:		wf_verifica_pm
//	Arguments:		al_folio
//	Returns:			ninguno
//	Description:	Verifica el estatus del material solicitado en el caso de
//						haber un retraso asigna la multa correspondiente e inserta 
//						en la base de datos el registro. 
//////////////////////////////////////////////////////////////////////////
boolean lbRetraso = false
date ldFechaEntrega, ldSumDia
decimal leTotal, leMontoatraso, leTotMontoatraso
integer liAdeudo
long llRow, llMaxFolio, llNoFolio, llGpoMat, ll_sqlcode, llMaxFolioDet, llCount
string lsNoSerie, lsCveMat, lsDiaNom
setnull(llMaxFolio)	

liAdeudo = f_consulta_fechaentrega_com(al_folio)
if liAdeudo = 1 then
	//Se consulta si el folio tiene una multa cargada
	SELECT dbo.spre_com_multas.folio 
	INTO :llMaxFolio
	FROM dbo.spre_com_multas  
	WHERE ( dbo.spre_com_multas.folio = :al_folio )
				
	USING gtr_sumuia; 
	if isnull(llMaxFolio) then // No hay multa cargada se procede a preguntar
	
		integer Net
		Net = MessageBox("Información de adeudos", "La solicitud con folio: "+ string(al_folio)+ " presenta un adeudo" + "~n ¿Desea cargar el adeudo ahora?", &
		Exclamation!, OKCancel!, 2)
		
		IF Net = 1 THEN // El usuario decide cargar la multa
			if isnull(llMaxFolio) then 
			//se trae el maximo folio
				SELECT max(dbo.spre_com_multas.folio_multa)
				into :llMaxFolio
				FROM dbo.spre_com_multas  
				USING gtr_sumuia;		
				if isnull(llMaxFolio) then 
					llMaxFolio =1	
				ELSE
					llMaxFolio =1	+ llMaxFolio		
				end if
						
				// Se inserta la multa
				INSERT INTO dbo.spre_com_multas  
				( folio_multa,   
					folio,   
					fecha_carga,
					fecha_liberacion,
					status,
					usuario_carga,
					usuario_libera)  
				VALUES ( :llMaxFolio,   
					:al_folio,  
					getdate(),
					' ',
					0,
					:gs_usuario,
					' ')
					USING gtr_sumuia; 
					// Se consulta maximo folio para insertar el detalles de la multa
				
							
				ll_sqlcode = gtr_sumuia.SQLCode
				IF ll_sqlcode = 100 THEN
					Rollback Using gtr_sumuia;	
					MessageBox('Error Insertando la multa del material de la solicitud con folio:',al_folio, Exclamation!)
				ELSEIF ll_sqlcode = -1 THEN
					Rollback Using gtr_sumuia;	
					MessageBox('Error Insertando la multa del material','~rn' + gtr_sumuia.SQLErrText,StopSign!)
				ELSE
					Commit Using gtr_sumuia;
				END IF	
			end if
		end if		
	end if
end if


end subroutine

public subroutine wf_verifica_status ();
end subroutine

public subroutine wf_crea_busqueda_1 (datetime ldt_fechaini, datetime ldt_fechafin);string ls_criterio, ls_consulta, ls_asignado
integer li_valida = 0, li_valida_s = 0
boolean lb_pres_salon= false

ls_criterio = ''
ls_consulta = ''


ls_criterio+=" AND ( ( (fecha_inicio between '"+string (ldt_fechaini,'yyyy-mm-dd ')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd ')+"' )"
ls_criterio+= " OR (fecha_final between '"+string (ldt_fechaini,'yyyy-mm-dd ')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd ')+"' )  ) )"


if not isnull(dw_criterios.getitemnumber(1,'tipo_espacio')) then
		ls_criterio+=" WHERE ( spre_materiales.cvegrupo="+string(dw_criterios.getitemnumber(1,'tipo_espacio'))+" ) "
end if

if not isnull(dw_criterios.getitemstring(1,'espacio')) then
		ls_criterio+=" AND ( spre_materiales.cvematerial='"+dw_criterios.getitemstring(1,'espacio')+"' ) "
end if

ls_criterio+= " AND ( spre_inventario.stauts = 1 ) AND  ( spre_materiales.cvedepto = 6 ) AND  ( spre_materiales.cvearea = 1 ) "


ls_consulta=dw_busqueda_1.getsqlselect()+ls_criterio
mle_1.text=ls_consulta
dw_busqueda_1.setsqlselect(ls_consulta)
dw_busqueda_1.retrieve()     


end subroutine

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
integer liAnio, liPeriodo, li_mes, Res
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
ids_MatReq.dataobject ='d_adm_mat_act'
ids_MatReq.settransobject(gtr_sumuia)


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
				//		Modif: Prestamo de material sin estar inscrito, lo solicto el usuario
				//		Octubre 2006
				Res = MessageBox("Mensaje del Sistema","¿Desea prestar material sin estar Inscrito", &
								Question!, yesno!, 2)
				if Res = 2 then
					wf_limpia_forma()
					sle_cuenta.text=""			
				end if
//				//
//				sle_cuenta.text=""
//				wf_limpia_forma()
			else
				ids_MatReq.Retrieve(ll_cuenta_inscrito)
				liTotalMatPrestado =ids_MatReq.RowCount()
			end if
			
		else
			IF gtr_sumuia.SQLCode = -1 THEN 

				MessageBox("SQL error", gtr_sumuia.SQLErrText)
				sle_cuenta.text=""
				wf_limpia_forma()
			ELSE
				messagebox("Mensaje del Sistema","Alumno NO inscrito ",stopsign!)
				
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
integer liAnio, liPeriodo, li_mes, Res
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
			//		Modif: Prestamo de material sin estar inscrito, lo solicto el usuario
			//		Octubre 2006
			Res = MessageBox("Mensaje del Sistema","¿Desea prestar material sin estar Inscrito", &
								Question!, yesno!, 2)
			if Res = 2 then
				wf_limpia_forma()
				sle_cuenta.text=""			
			end if
	
		else
			wf_carga_foto(long(ll_cuenta_inscrito),2)

		end if
	else
		IF gtr_sumuia.SQLCode = -1 THEN 
			MessageBox("SQL error", gtr_sumuia.SQLErrText)
		END IF
	end if			

return ls_nombrecompleto
end function

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
ids_MatReq.dataobject ='d_adm_mat_act'
ids_MatReq.settransobject(gtr_sumuia)
if isvalid(ids_MatProf) then
	destroy ids_MatProf
	ids_MatProf =  create datastore 
	ids_MatProf.dataobject ='d_adm_matinscp'
	ids_MatProf.settransobject(gtr_sumuia)
else
		ids_MatProf =  create datastore 
		ids_MatProf.dataobject ='d_adm_matinscp'
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

public function string wf_busca_alumno (long al_cuenta);//////////////////////////////////////////////////////////////////////////////
//	Function:		wf_busca_alumno 
//	ok. control de salones
//	Arguments:		al_cuenta
//	Returns:			Nombre alumno
//	Description:	Valida que el alumno este incrito en el area y curse materias 
//						en el semestre actual. cuando esto es valido carga las materias
//						que cursa para poder realizar la validación del prestamo
//////////////////////////////////////////////////////////////////////////////

string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
boolean lb_error=true
integer Res


setpointer(hourglass!)
if al_cuenta<>0 then
  SELECT b.cuenta,   
	         a.nombre+ ' ' + a.apaterno+' ' +a.amaterno as nombre_completo  ,
			d.carrera
   INTO :ll_cuenta_inscrito,   
	        	:ls_nombrecompleto,
			  :ls_carrera
	    FROM v_sce_alumnos a,   
		         v_sce_banderas_inscrito  b,
				v_sce_academicos c,
				v_sce_carreras d
	   WHERE ( a.cuenta *= b.cuenta) and (  a.cuenta = :al_cuenta  ) and 
		( c.cuenta=a.cuenta)  and (c.cve_carrera=d.cve_carrera) 
		and d.cve_carrera in (select cve_carrera from v_sce_carreras  where cve_coordinacion in (select cve_coordinacion from v_sce_coordinaciones))using gtr_sumuia;
		if gtr_sumuia.sqlcode=0 then
			//TODO OK
			if  isnull(ll_cuenta_inscrito) then
				messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
			
				//		Modif: Prestamo de material sin estar inscrito, lo solicto el usuario
				//		Octubre 2006
				Res = MessageBox("Mensaje del Sistema","¿Desea prestar material sin estar Inscrito", &
								Question!, yesno!, 2)
				if Res = 2 then
					wf_limpia_forma()
					sle_cuenta.text=""			
				end if

			end if
			
		else
			IF gtr_sumuia.SQLCode = -1 THEN 

				MessageBox("SQL error", gtr_sumuia.SQLErrText)
				sle_cuenta.text=""
				wf_limpia_forma()

			END IF
		end if			
	end if
//	destroy ids_MatReq;
return ls_nombrecompleto
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
long ll_esadmon
//ldFechaEntrega_2 = date(f_fecha_hora_servidor())	

dw_solicitud.setTransObject(gtr_sumuia)
dw_solicitud.triggerevent("pfc_InsertRow")
dw_desc.insertrow(0)
dw_interesado.insertrow(0)
dw_interesado.setitem(1,'tipo_prestamo',1)
dw_interesado.setTransObject(gtr_sumuia)
dw_cap.setTransObject(gtr_sumuia)


//
idt_fecha_hoy= f_fecha_hora_servidor()
//


//CHILD TIPO DE ESPACIO
dw_criterios.settransobject(gtr_sumuia)
dw_criterios.getchild('tipo_espacio',idwc_tipoespacio)
idwc_tipoespacio.settransobject(gtr_sumuia)
idwc_tipoespacio.retrieve(gi_depto,gi_area)
idwc_tipoespacio.insertrow(1)
//CHILD ESPACIO


dw_criterios.settransobject(gtr_sumuia)
dw_criterios.getchild('espacio',idwc_espacio)
idwc_espacio.settransobject(gtr_sumuia)
idwc_espacio.retrieve(gi_depto,gi_area,1)
idwc_espacio.insertrow(1)
//
dw_criterios.insertrow(0)

cbx_ocupados.visible = false
cbx_materiales.visible = false
dw_busqueda.settransobject(gtr_sumuia)
dw_busqueda_1.settransobject(gtr_sumuia)

dw_cap.visible = false
dw_cap.enabled = false

configurausuario(gs_usuario) 
ll_esadmon = Pos(gsGupoUsuario, "gpresteqadm") 
if ll_esadmon =0 then
	rb_2.checked = true
	// Se asignan valores de usuario firmado
	sle_cuenta.text = string(giUsuarioCve)
	sle_cuenta.enabled = false
	rb_1.enabled = false
	cbx_intercambio.enabled = false
	sle_cuenta.triggerevent( "activarbusq")
end If

end event

on w_adm_prestamo_mat.create
this.st_1=create st_1
this.dw_validasalon=create dw_validasalon
this.cb_salir=create cb_salir
this.dw_reporte_mat=create dw_reporte_mat
this.cbx_materiales=create cbx_materiales
this.mle_1=create mle_1
this.cb_buscar=create cb_buscar
this.cbx_ocupados=create cbx_ocupados
this.dw_criterios=create dw_criterios
this.cbx_intercambio=create cbx_intercambio
this.st_2=create st_2
this.dw_interesado=create dw_interesado
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_cap=create dw_cap
this.dw_desc=create dw_desc
this.dw_gpomat=create dw_gpomat
this.cb_actualiza=create cb_actualiza
this.cb_eliminar=create cb_eliminar
this.dw_motivo=create dw_motivo
this.dw_solicitud=create dw_solicitud
this.sle_cuenta=create sle_cuenta
this.gb_2=create gb_2
this.dw_busqueda=create dw_busqueda
this.dw_busqueda_1=create dw_busqueda_1
this.Control[]={this.st_1,&
this.dw_validasalon,&
this.cb_salir,&
this.dw_reporte_mat,&
this.cbx_materiales,&
this.mle_1,&
this.cb_buscar,&
this.cbx_ocupados,&
this.dw_criterios,&
this.cbx_intercambio,&
this.st_2,&
this.dw_interesado,&
this.rb_2,&
this.rb_1,&
this.dw_cap,&
this.dw_desc,&
this.dw_gpomat,&
this.cb_actualiza,&
this.cb_eliminar,&
this.dw_motivo,&
this.dw_solicitud,&
this.sle_cuenta,&
this.gb_2,&
this.dw_busqueda,&
this.dw_busqueda_1}
end on

on w_adm_prestamo_mat.destroy
destroy(this.st_1)
destroy(this.dw_validasalon)
destroy(this.cb_salir)
destroy(this.dw_reporte_mat)
destroy(this.cbx_materiales)
destroy(this.mle_1)
destroy(this.cb_buscar)
destroy(this.cbx_ocupados)
destroy(this.dw_criterios)
destroy(this.cbx_intercambio)
destroy(this.st_2)
destroy(this.dw_interesado)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_cap)
destroy(this.dw_desc)
destroy(this.dw_gpomat)
destroy(this.cb_actualiza)
destroy(this.cb_eliminar)
destroy(this.dw_motivo)
destroy(this.dw_solicitud)
destroy(this.sle_cuenta)
destroy(this.gb_2)
destroy(this.dw_busqueda)
destroy(this.dw_busqueda_1)
end on

type st_1 from statictext within w_adm_prestamo_mat
integer x = 2538
integer y = 32
integer width = 344
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 29534863
string text = "Admisión"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_validasalon from datawindow within w_adm_prestamo_mat
boolean visible = false
integer x = 2501
integer y = 1069
integer width = 132
integer height = 35
integer taborder = 50
string title = "none"
string dataobject = "d_controls_valida_salon"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type cb_salir from commandbutton within w_adm_prestamo_mat
integer x = 3178
integer y = 2256
integer width = 289
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Salir"
end type

event clicked;close(parent)
end event

type dw_reporte_mat from datawindow within w_adm_prestamo_mat
boolean visible = false
integer x = 3511
integer y = 2992
integer width = 69
integer height = 48
integer taborder = 130
string title = "none"
string dataobject = "d_com_rep_solicitud_mat"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type cbx_materiales from checkbox within w_adm_prestamo_mat
integer x = 2169
integer y = 717
integer width = 666
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 29534863
string text = " Ver Estado  Materiales"
end type

event clicked;if this.checked then
	dw_busqueda_1.object.txt_solicitud.visible=true
	dw_busqueda_1.object.r_3.visible=true
	dw_busqueda_1.object.spre_sol_materiales_folio.visible=true
	dw_busqueda_1.object.spre_sol_materiales_status.visible = false
//	dw_busqueda_1.setfilter('not isnull(spre_sol_materiales_folio)')
//	dw_busqueda_1.filter()
	dw_busqueda_1.setfilter('spre_sol_materiales_status in(0,5)')
	dw_busqueda_1.filter()
	dw_busqueda_1.title="Materiales Reservados"
else
	dw_busqueda_1.object.txt_solicitud.visible=false
	dw_busqueda_1.object.r_3.visible=false
	dw_busqueda_1.object.spre_sol_materiales_folio.visible=false
	dw_busqueda_1.setfilter('isnull(spre_sol_materiales_folio) or spre_sol_materiales_status in(1)')
	dw_busqueda_1.filter()
//	dw_busqueda_1.setfilter('spre_sol_materiales_status in(1)')
//	dw_busqueda_1.filter()
	dw_busqueda_1.title="Materiales Disponibles"
end if
end event

type mle_1 from multilineedit within w_adm_prestamo_mat
boolean visible = false
integer x = 3416
integer y = 2995
integer width = 69
integer height = 45
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_buscar from commandbutton within w_adm_prestamo_mat
integer x = 1759
integer y = 896
integer width = 289
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Buscar"
end type

event clicked;datetime ldt_fecha_hora_ini,ldt_fecha_hora_fin
integer li_hrsini,li_hrsfin, li_minini, li_minfin, liExiste
date ld_fechaini,ld_fechafin
string ls_asignado
//
ls_salon = regreso.is_parm11
ii_hora_inicio = regreso.ii_parm9
ii_hora_final = regreso.ii_parm10

ii_status_sol=dw_solicitud.getitemnumber(1,'status')	
li_tipo_grupo = dw_criterios.object.tipo_espacio[1]

dw_cap.visible = true
dw_cap.enabled = true
dw_busqueda_1.enabled = true
dw_busqueda_1.visible = true
dw_criterios.accepttext()
dw_busqueda_1.reset()
dw_busqueda_1.insertrow(0)

ld_fechaini=dw_criterios.getitemdate(1,'fechaini')
ld_fechafin=dw_criterios.getitemdate(1,'fechafin')
	
IF ld_fechaini < today() THEN
	messagebox("NO PROCEDE","La Fecha inicial no puede ser menor al día de hoy.")
	dw_criterios.reset()
	dw_criterios.insertrow(0)
	dw_busqueda_1.reset()
	return
END IF
	
if isnull(ld_fechaini) or isnull(ld_fechafin) then
	messagebox("Mensaje del Sistema", "Debe indicar la Fecha Inicial y Final",stopsign!)
else
	//		Valida Fecha
	ldt_fecha_hora_ini=datetime(ld_fechaini,time("00:00"))
	ldt_fecha_hora_fin=datetime(ld_fechafin,time("00:00"))
				
		ldt_fecha_hora_fin=datetime(ld_fechafin,time("00:00"))
		dw_busqueda_1.dataobject='d_adm_matdispo'
		dw_busqueda_1.settransobject(gtr_sumuia)
		wf_crea_busqueda_1(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
		dw_busqueda_1.setfilter('(isnull(spre_sol_materiales_folio))')// or spre_sol_materiales_status in(1)')	
		dw_busqueda_1.filter()
//		dw_busqueda_1.setfilter('spre_sol_materiales_status in(1)')
//		dw_busqueda_1.filter()
		cbx_materiales.visible=true
		dw_busqueda_1.object.txt_solicitud.visible=false
		dw_busqueda_1.object.r_3.visible=false
		dw_busqueda_1.object.spre_sol_materiales_folio.visible=false
		dw_busqueda_1.title="Materiales Disponibles"
		cbx_materiales.checked = false
end if

end event

type cbx_ocupados from checkbox within w_adm_prestamo_mat
boolean visible = false
integer x = 3387
integer y = 874
integer width = 91
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 29534863
string text = " Ver Estado Espacios (ISLAS) "
end type

event clicked;if this.checked then
	dw_busqueda.object.txt_solicitud.visible=true
	dw_busqueda.object.folio.visible=true
	dw_busqueda.setfilter('not isnull(folio)')
	dw_busqueda.filter()
	dw_busqueda.setfilter('status in(0,5)')
	dw_busqueda.title="Espacios Reservados"
else
	dw_busqueda.object.txt_solicitud.visible=false
	dw_busqueda.object.folio.visible=false
	dw_busqueda.setfilter('isnull(folio)')
	dw_busqueda.filter()
	dw_busqueda.title="Espacios Disponibles"
end if
end event

type dw_criterios from datawindow within w_adm_prestamo_mat
integer x = 69
integer y = 707
integer width = 2074
integer height = 371
integer taborder = 40
string title = "none"
string dataobject = "d_adm_criterios_busqueda"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long llCuenta, llCta



llCta = long(left(trim(sle_cuenta.text),len(trim(sle_cuenta.text))-1))

if string(dwo.name)='tipo_espacio'then
	idwc_espacio.settransobject(gtr_sumuia)
	idwc_espacio.retrieve(gi_depto,gi_area,integer(data))
	
	liGrupo = long(data)
	
	
	
//	if data = string(1) then
//		SELECT solicitanteid INTO: llCuenta
//		FROM dbo.spre_histcursoprop
//		WHERE dbo.spre_histcursoprop.solicitanteid =:llCta AND
//				dbo.spre_histcursoprop.id_curso = 1
//		using gtr_sumuia;
//		if gtr_sumuia.SQLCode = -1 then
//			MessageBox("SQL error", gtr_sumuia.SQLErrText)
//		end if
//		
//		if isnull(llCuenta) or llCuenta = 0 then
//			Messagebox("Aviso","El alumno no ha cursado el Propedéutico de Camaras")
//		end if
//	end if	


//elseif string(dwo.name)='espacio' then

//	if liGrupo = 8 then
//			if data = string(4) or data = string(5) or data = string(6) or data = string(7) or data = string(8) or data = string(9) then
//				SELECT solicitanteid INTO: llCuenta
//				FROM dbo.spre_histcursoprop
//				WHERE dbo.spre_histcursoprop.solicitanteid =:llCta AND
//						dbo.spre_histcursoprop.id_curso = 4
//				using gtr_sumuia;
//				if gtr_sumuia.SQLCode = -1 then
//					MessageBox("SQL error", gtr_sumuia.SQLErrText)
//				end if
//		
//				if isnull(llCuenta) or llCuenta = 0 then
//					Messagebox("Aviso","El alumno no ha cursado el Propedéutico de Final Cut")
//				end if
//			elseif data = string(10) or data = string(11) then
//				SELECT solicitanteid INTO: llCuenta
//				FROM dbo.spre_histcursoprop
//				WHERE dbo.spre_histcursoprop.solicitanteid =:llCta AND
//						dbo.spre_histcursoprop.id_curso = 3
//				using gtr_sumuia;
//				if gtr_sumuia.SQLCode = -1 then
//					MessageBox("SQL error", gtr_sumuia.SQLErrText)
//				end if
//		
//				if isnull(llCuenta) or llCuenta = 0 then
//					Messagebox("Aviso","El alumno no ha cursado el Propedéutico de Avid")
//				end if
//			end if
//	end if
end if
	





















//		SELECT solicitanteid INTO: llCuenta
//		FROM dbo.spre_histcursoprop
//		WHERE dbo.spre_histcursoprop.solicitanteid =:llCta AND
//				dbo.spre_histcursoprop.id_curso = 1
//		using gtr_sumuia;
//		if gtr_sumuia.SQLCode = -1 then
//			MessageBox("SQL error", gtr_sumuia.SQLErrText)
//		end if
//		
//		if isnull(llCuenta) or llCuenta = 0 then
//			Messagebox("Aviso","El alumno no ha cursado el Propedéutico")
//		end if
//	end if
		
//		if data = string(1) then
//		SELECT solicitanteid INTO: llCuenta
//		FROM dbo.spre_histcursoprop
//		WHERE dbo.spre_histcursoprop.solicitanteid =:llCta AND
//				dbo.spre_histcursoprop.id_curso = 1
//		using gtr_sumuia;
//		if gtr_sumuia.SQLCode = -1 then
//			MessageBox("SQL error", gtr_sumuia.SQLErrText)
//		end if
//		
//		if isnull(llCuenta) or llCuenta = 0 then
//			Messagebox("Aviso","El alumno no ha cursado el Propedéutico")
//		end if
//
//	idwc_espacio.insertrow(1)
//end if
end event

type cbx_intercambio from checkbox within w_adm_prestamo_mat
integer x = 102
integer y = 221
integer width = 432
integer height = 74
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Intercambio"
end type

type st_2 from statictext within w_adm_prestamo_mat
integer x = 607
integer y = 163
integer width = 208
integer height = 58
integer textsize = -8
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

type dw_interesado from u_dw within w_adm_prestamo_mat
integer x = 59
integer y = 426
integer width = 2794
integer height = 266
integer taborder = 30
string dataobject = "d_adm_solmaterial"
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
				
				this.setitem(1,'solicitantenombre',wf_busca_alumno_dca1(long(data)))
			
			CASE 3
				
				uo_parametros=wf_busca_empleado(long(data))
				this.setitem(1,'solicitantenombre',uo_parametros.is_parm1)
				
		END CHOOSE
		
	
END CHOOSE

end event

type rb_2 from radiobutton within w_adm_prestamo_mat
integer x = 91
integer y = 336
integer width = 344
integer height = 61
integer textsize = -8
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

type rb_1 from radiobutton within w_adm_prestamo_mat
integer x = 91
integer y = 154
integer width = 344
integer height = 74
integer textsize = -8
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

type dw_cap from u_dw within w_adm_prestamo_mat
integer x = 69
integer y = 1920
integer width = 2330
integer height = 515
integer taborder = 110
string dataobject = "d_adm_matsolcap"
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

event itemchanged;call super::itemchanged;integer i

if dwo.name='status' then
	liEstatus=this.getitemnumber(row,'status')
	
	
	CHOOSE CASE liEstatus

	CASE 0
			
		Messagebox("Aviso","No se puede actualizar el estatus del material prestado" + &
					" Para actualizar el estatus del material prestado : " + &
					" Debes generar la entrega del material por la opción: Entrega de Materiales")
		for i=1 to dw_cap.rowcount()
			if dw_cap.getitemnumber(i,'status')=0 then dw_cap.setitem(i,'status',0)
		next
				
	END CHOOSE		
end if



end event

type dw_desc from datawindow within w_adm_prestamo_mat
boolean visible = false
integer x = 3332
integer y = 2989
integer width = 69
integer height = 51
integer taborder = 40
string title = "none"
string dataobject = "dw_editor_1"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;//string desc
//accepttext()
//dw_matdisp.enabled= true
//
//if cbx_bus.checked = true then
//	desc = "%"+upper(getitemstring(getrow(),1))+"%"
//else
//	desc = upper(getitemstring(getrow(),1))+"%"
//end if
//
//dw_matdisp.retrieve(gi_depto,gi_area,ligpomat,desc)
end event

type dw_gpomat from u_dw within w_adm_prestamo_mat
boolean visible = false
integer x = 3222
integer y = 3005
integer width = 69
integer height = 35
integer taborder = 40
string title = "aa"
string dataobject = "d_dlb_grupos_mat_com"
boolean border = false
boolean hsplitscroll = true
end type

event constructor;call super::constructor;this.setTransObject(gtr_sumuia)
end event

event itemfocuschanged;call super::itemfocuschanged;////Realiza override
//
//if row >0 then
//	ligpomat = dw_gpomat.getitemnumber(  row, 'cvegrupo')
//	ii_ligpomat = ligpomat
//	IF dw_matdisp.Retrieve(gi_depto,gi_area,ligpomat,'%') = -1 THEN
//		MessageBox("Error","Se encontro un error al consultar los datos")
//	ELSE
//		dw_matdisp.SetFocus( )
//		
//	END IF
//
//end if
end event

type cb_actualiza from commandbutton within w_adm_prestamo_mat
integer x = 2593
integer y = 2042
integer width = 527
integer height = 122
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Actualizar"
end type

event clicked;integer 	li_row, li_diasprestamo = 0, listatus, lt_adeudo, Res, liAdeudo, li_resul, Net, i, li_ren
string	lsNoSerie, lsCveMaterial, lsSerie
long		llMaxFolio, llRow
datetime finicio,ffin
datastore lds_BorraSol


dw_reporte_mat.dataobject = "d_adm_rep_solicitud_equipo"
dw_reporte_mat.SetTransObject(gtr_sumuia)

//			MATERIAL NUEVO
if cbx_materiales.checked = false then
	for llRow = 1 to dw_cap.RowCount()
		lsNoSerie = dw_cap.getitemstring(llRow,'num_serie')
		lsCveMaterial = dw_cap.getitemstring(llRow,'cvematerial')
	next
		if dw_cap.RowCount() > 0 then
			if wf_asigna_folio() = true then
				if dw_solicitud.update()>0 then
					commit using gtr_sumuia;
					if dw_interesado.update()>0 then
						commit using gtr_sumuia;
						
						if dw_cap.update()>0 then
							commit using gtr_sumuia;
							messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
							integer li_parm_grupo[], li_param, li_i
							//
							llFolio = dw_cap.getitemnumber(1,'folio')
							for li_i = 1 to upperbound(li_parm_grupo[])
								li_parm_grupo[li_i] = 0
							next 
								
							li_param = 0
								
							For li_i =  1 to dw_cap.rowcount()
								li_param ++
								li_parm_grupo[li_param] = dw_cap.getItemnumber(li_i,"cvegrupo") 
							next					
							liEstatus=dw_cap.getitemnumber(1,'status')
							finicio = dw_cap.getitemdatetime(1,'fecha_inicio')
							ffin = dw_cap.getitemdatetime(1,'fecha_final')
							dw_reporte_mat.retrieve(gi_depto,llFolio,li_parm_grupo[])
							
							if liEstatus = 0 then
								dw_reporte_mat.object.t_tipo_solicitud.text = "Prestamo Activo"
								dw_reporte_mat.object.fecha_inicio[1] = string(finicio,"dd/mm/yyyy")
								dw_reporte_mat.object.fecha_fin[1] = string(ffin,"dd/mm/yyyy")
								dw_reporte_mat.object.h_ini[1] = string(finicio)
								dw_reporte_mat.object.h_fin[1] = string(ffin)

							end if
							
							Res = MessageBox("Mensaje del Sistema", "¿Desea Imprimir la solicitud del material", &
							Question!, yesno!, 2)
							if Res = 1 then
								dw_reporte_mat.print()
							end if
							wf_limpia_forma()	
							sle_cuenta.text = ''
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
		else
			messagebox("Atención","Falta indicar datos",exclamation!)
		end if
		
	dw_cap.visible = false
	dw_cap.enabled = false

//		ACTUALIZAR MATERIAL DE SOLICTUD
elseif cbx_materiales.checked = true  then
	li_ren = dw_cap.RowCount()
	if dw_cap.RowCount() > 0 then
		liEstatus=dw_cap.getitemnumber(1,'status')
		lsSerie = dw_cap.getitemstring(1,'num_serie')
		if liEstatus = 1 then
			wf_status_pm(llFolio)
		end if
		Net = MessageBox("Mensaje del Sistema", "Se han realizado cambios en el material, Desea guardarlos?", &
								Question!, yesno!, 2)					
		IF Net = 2 THEN
			sle_cuenta.text=""
			wf_limpia_forma()													
		ELSE
			for i=1 to dw_cap.RowCount()
				liEstatus=dw_cap.getitemnumber(i,'status')
				lsSerie = dw_cap.getitemstring(i,'num_serie')
				lsCveMaterial = dw_cap.getitemstring(i,'cvematerial')
				
				if liEstatus = 2 then
				
					lds_BorraSol =  create datastore 
					lds_BorraSol.dataobject ='d_com_borra_sol'
					lds_BorraSol.settransobject(gtr_sumuia)
					li_resul = lds_BorraSol.retrieve(llFolio,lsSerie)
					
					//	Consultamos si existe mas información en la solicitud
					if li_resul >= 1 then
						DELETE dbo.spre_sol_materiales 
						WHERE ( dbo.spre_sol_materiales.folio = :llFolio ) AND
							( dbo.spre_sol_materiales.num_serie = :lsSerie)	AND
							( dbo.spre_sol_materiales.cvematerial = :lsCveMaterial) AND
							( dbo.spre_sol_materiales.cvedepto = :gi_depto)
						using gtr_sumuia;
					else
						DELETE dbo.spre_prestamo_material
						WHERE ( dbo.spre_prestamo_material.folio = :llFolio )	AND
								( dbo.spre_prestamo_material.cvedepto = :gi_depto)
						using gtr_sumuia;
						
						DELETE dbo.spre_sol_materiales
						WHERE ( dbo.spre_sol_materiales.folio = :llFolio ) AND
								( dbo.spre_sol_materiales.cvedepto = :gi_depto)
						using gtr_sumuia;
						
						DELETE dbo.spre_solicitud
						WHERE ( dbo.spre_solicitud.folio = :llFolio ) AND
								( dbo.spre_solicitud.cvedepto = :gi_depto)
						using gtr_sumuia;
					end if
					
					commit using gtr_sumuia;
				else
					//	Se actualiza el estatus de la solicitud
					
					UPDATE dbo.spre_solicitud 
					SET dbo.spre_solicitud.status = :liEstatus  
					WHERE ( dbo.spre_solicitud.folio = :llFolio ) AND
							( dbo.spre_solicitud.cvedepto =:gi_depto)
					using gtr_sumuia;
					
				
					UPDATE dbo.spre_sol_materiales
					SET dbo.spre_sol_materiales.status = :liEstatus  
					WHERE ( dbo.spre_sol_materiales.folio = :llFolio ) AND
							( dbo.spre_sol_materiales.num_serie = :lsSerie) AND
							( dbo.spre_sol_materiales.cvedepto = :gi_depto)
					using gtr_sumuia;
					
					commit using gtr_sumuia;
				end if
			next
			
			messagebox("Mensaje del sistema","Los cambios han sido Actualizados con éxito",exclamation!)
			cbx_ocupados.visible = false
			cbx_materiales.visible = false
			
			Net = MessageBox("Mensaje del Sistema", "Desea efectuar otro cambio en la solicitud ?", &
								Question!, yesno!, 2)					
			if Net = 2 then
				sle_cuenta.text=""
				wf_limpia_forma()													
			end if
			
		end if
	end if
end if
end event

type cb_eliminar from commandbutton within w_adm_prestamo_mat
integer x = 2593
integer y = 2253
integer width = 527
integer height = 122
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Eliminar"
end type

event clicked;
  IF dw_cap.deleterow(dw_cap.getrow())<>1 THEN
		messagebox("Mensaje del sistema","El registro NO ha sido eliminado")		
  END IF	 



end event

type dw_motivo from datawindow within w_adm_prestamo_mat
boolean visible = false
integer x = 3529
integer y = 3005
integer width = 69
integer height = 35
integer taborder = 40
string dataobject = "d_dw_matinsc"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_solicitud from u_dw within w_adm_prestamo_mat
integer x = 936
integer y = 144
integer width = 1942
integer height = 227
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_com_detsolmaterial"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event pfc_postinsertrow;call super::pfc_postinsertrow;//////////////////////////////////////////////////////////////////////////////
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
//liDiaHorafp = f_calcula_fecha_entrega(liDiasol)
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
//		this.setItem(al_row,'fecha_inicio',liDiaHoraip)
//		this.setItem(al_row,'fecha_fin',liDiaHorafp)
		this.setItem(al_row,'status',0)
		this.setItem(al_row,'condicion',0)
		end if	
		Destroy lds_DiasAd
end event

type sle_cuenta from singlelineedit within w_adm_prestamo_mat
event activarbusq ( )
integer x = 530
integer y = 234
integer width = 333
integer height = 77
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
long ll_cuentab, ll_cuenta, ll_RowsPrestamo, retvalmulta, al_cuenta, lt_adeudo
string ls_digito, ls_digitov ,ls_cuenta, ls_nombre, ls_periodo
string ls_nombrecompleto

n_transportar uo_parametros

dw_criterios.setitem(1,'fechaini',date(f_fecha_hora_servidor()))
dw_criterios.setitem(1,'fechafin',date(f_fecha_hora_servidor()))
//dw_criterios.setitem(1,'horarioini',date(time("00:00")))
//dw_criterios.setitem(1,'horariofin',date(time("00:00")))


	if rb_1.checked = true then
		
		if cbx_intercambio.checked =  true then
			
			ll_cuentab = long(sle_cuenta.text)
			il_cuenta = ll_cuentab
			retvalmulta = f_valida_cuenta_controls(ll_cuentab)
			if retvalmulta = 1 then 
				messagebox("Mensaje del Sistema","El prestamo de material no se puede realizar debido al adeudo presentado")
				sle_cuenta.text=""
				return
			else
				SELECT count(*)  
				INTO :lt_adeudo
				FROM spre_solicitud
				WHERE
				solicitanteid = :ll_cuentab and cvedepto = 5 and
				status = 0 and
				fecha_fin < getdate() 
				using gtr_sumuia;
				if lt_adeudo >= 1 then
					messagebox("Mensaje del Sistema", "La clave ingresada presenta Adeudo, sin multa generada")
					sle_cuenta.text=""
					return
				end if
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
				
				retvalmulta = f_valida_cuenta_controls(ll_cuentab)
			if retvalmulta = 1 then
				
				messagebox("Atención","El prestamo de material no se puede realizar debido al adeudo presentado")
				sle_cuenta.text=""
				return
			else
				SELECT count(*)  
				INTO :lt_adeudo
				FROM spre_solicitud
				WHERE
				solicitanteid = :ll_cuentab and cvedepto = 5 and
				status = 0 and
				fecha_fin < getdate() 
				using gtr_sumuia;
				if lt_adeudo >= 1 then
					messagebox("Mensaje del Sistema", "La clave ingresada presenta Adeudo, sin multa generada")
					sle_cuenta.text=""
					return
				end if
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
			retvalmulta = f_valida_cuenta_controls(long(ls_cuenta))
			if retvalmulta = 1 then 
				messagebox("Atención","El prestamo de material no se puede realizar debido al adeudo presentado ")
				sle_cuenta.text=""
				return
			else
				SELECT count(*)  
				INTO :lt_adeudo
				FROM spre_solicitud
				WHERE
				solicitanteid = :ll_cuentab and cvedepto = 5 and
				status = 0 and
				fecha_fin < getdate() 
				using gtr_sumuia;
				if lt_adeudo >= 1 then
					messagebox("Mensaje del Sistema", "La clave ingresada presenta Adeudo, sin multa generada")
					sle_cuenta.text=""
					return
				end if
			end if
		
			dw_interesado.setitem(1,'tipo_prestamo',3)
		
			dw_interesado.setitem(1,'solicitanteid',long(ls_cuenta))
			uo_parametros=wf_busca_empleado(long(ls_cuenta))
			wf_carga_foto(long(ls_cuenta),3)
			dw_interesado.setitem(1,'solicitantenombre',uo_parametros.is_parm1)
			dw_interesado.setfocus()
		
	end if
	
	
	
//
//long ll_cuentab, ll_cuenta, ll_RowsPrestamo, retvalmulta, al_cuenta
//string ls_digito, ls_digitov ,ls_cuenta, ls_nombre, ls_periodo          
//string ls_nombrecompleto
//integer liCargaAdeudo, Net
//
//n_transportar uo_parametros
//	if rb_1.checked = true then
//		
//		if cbx_intercambio.checked =  true then
//					
//			ll_cuentab = long(sle_cuenta.text)
//			il_cuenta = ll_cuentab
//			retvalmulta = f_valida_cuenta_controls(ll_cuentab)
//			if retvalmulta = 1 then 
//				Net = MessageBox("AVISO", "El alumno presenta material vencido..." + "~n ¿Desea continuar con el prestamo ?", &
//					Exclamation!, OKCancel!, 2)
//				if Net = 1 then // Desea continuar con el prestamo
//					
//				else	
//					sle_cuenta.text=""
//					return
//				end if
//			end if
//			dw_interesado.setitem(1,'tipo_prestamo',2)
//			dw_interesado.setitem(1,'solicitanteid',long(ll_cuentab))
//			dw_interesado.setitem(1,'solicitantenombre',wf_busca_alumno_dca1(long(ll_cuentab)))
//
//		else
//	
//			if match(trim(sle_cuenta.text),'-')= true then
//				
//				ls_cuenta= trim(sle_cuenta.text)
//				ll_cuentab = long(left(trim(sle_cuenta.text),len(trim(sle_cuenta.text))-2))
//				ls_digito = upper(right(trim(sle_cuenta.text),1))
//				ls_digitov =obten_digito(ll_cuentab)
//				il_cuenta = ll_cuentab
//				
//			else
//				
//				ls_cuenta= left(trim(sle_cuenta.text),len(trim(sle_cuenta.text))-1)+'-'+right(trim(sle_cuenta.text),1)
//				ll_cuentab = long(left(trim(sle_cuenta.text),len(trim(sle_cuenta.text))-1))
//				ls_digito = upper(right(trim(sle_cuenta.text),1))
//				ls_digitov =obten_digito(ll_cuentab)
//				il_cuenta = ll_cuentab
//				
//			end if
//			if ls_digito =ls_digitov then
//				
//				retvalmulta = f_valida_cuenta_controls(ll_cuentab)
//			if retvalmulta = 1 then
//				//
//				Net = MessageBox("AVISO", "El alumno presenta material vencido..." + "~n ¿Desea continuar con el prestamo ?", &
//					Exclamation!, OKCancel!, 2)
//				if Net = 1 then // Desea continuar con el prestamo
//					
//				else	
//					sle_cuenta.text=""
//					return
//				end if
//			end if
//			
//			
//			dw_interesado.setitem(1,'tipo_prestamo',1)
//			dw_interesado.setitem(1,'solicitanteid',long(ll_cuentab))
//			wf_carga_foto(long(ll_cuentab),1)
//			dw_interesado.setitem(1,'solicitantenombre',wf_busca_alumno(long(ll_cuentab)))
//			dw_interesado.setfocus()
//			
//		else
//			
//			sle_cuenta.text=""
//			messagebox("Atención","La cuenta: "+ls_cuenta+" no existe o es incorrecta ")	
//		end if
//		END IF
//	
//		
//		
//	else
//		
//			ls_cuenta=trim(sle_cuenta.text)
//			il_cuenta = long(ls_cuenta)
//			retvalmulta = f_valida_cuenta_controls(long(ls_cuenta))
//			if retvalmulta = 1 then 
//
//				Net = MessageBox("AVISO", "Presenta material vencido..." + "~n ¿Desea continuar con el prestamo ?", &
//					Exclamation!, OKCancel!, 2)
//				if Net = 1 then // Desea continuar con el prestamo
//					
//				else	
//					sle_cuenta.text=""
//					return
//				end if
//			end if
//		
//			dw_interesado.setitem(1,'tipo_prestamo',3)
//		
//			dw_interesado.setitem(1,'solicitanteid',long(ls_cuenta))
//			uo_parametros=wf_busca_empleado(long(ls_cuenta))
//			wf_carga_foto(long(ls_cuenta),3)
//			dw_interesado.setitem(1,'solicitantenombre',uo_parametros.is_parm1)
//			dw_interesado.setfocus()
//		
//	end if
//	
//	
//	
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

type gb_2 from groupbox within w_adm_prestamo_mat
integer x = 22
integer y = 93
integer width = 892
integer height = 333
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 29534863
string text = "Buscar"
end type

type dw_busqueda from datawindow within w_adm_prestamo_mat
boolean visible = false
integer x = 3226
integer y = 1210
integer width = 336
integer height = 781
integer taborder = 120
boolean enabled = false
string title = "none"
string dataobject = "d_sres_com_busq_disp"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;n_transportar uo_parametros
integer li_tipo

if row>0 then
	//uo_parametros = create n_transportar
	
	if cbx_ocupados.checked then
		li_tipo=1
	else
		li_tipo=0
	end if
		uo_parametros.id_parm1=dw_criterios.getitemdate(1,'fechaini')
		uo_parametros.id_parm2=dw_criterios.getitemdate(1,'fechafin')
		uo_parametros.ii_parm1=li_tipo
		uo_parametros.ii_parm2=dw_criterios.getitemnumber(1,'horarioini')
		uo_parametros.ii_parm3=dw_criterios.getitemnumber(1,'horariofin')
		uo_parametros.ii_parm6=dw_criterios.getitemnumber(1,'minutoini')
		uo_parametros.ii_parm7=dw_criterios.getitemnumber(1,'minutofin')
		uo_parametros.ii_parm4=	this.getitemnumber(row,'folio')
		uo_parametros.is_parm1=this.getitemstring(row,'cvematerial')
		uo_parametros.ii_parm5=	this.getitemnumber(row,'cvegrupo')
		uo_parametros.is_parm2=this.getitemstring(row,'descripcion')
		uo_parametros.ii_parm8=ii_status_sol
	
	opensheetwithparm(w_com_solicitud_espacio,uo_parametros,w_ppal,0,original!)
	cbx_ocupados.visible = false
end if
end event

event rowfocuschanged;if currentrow>0 then
	selectrow(0,false)
	selectrow(currentrow,true)
else
	selectrow(0,false)
end if
end event

type dw_busqueda_1 from datawindow within w_adm_prestamo_mat
integer x = 51
integer y = 1120
integer width = 3065
integer height = 781
integer taborder = 90
boolean titlebar = true
string title = "Material disponible"
string dataobject = "d_adm_matdispo"
boolean minbox = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;integer 	liCveGpo, Net, lihri, lihrf, limti, limtf, liHoraini, liHorafin
long 		ll_nva_linea, llRowsMat, llIdSol, llRow, llTotMatFil, liTipoPrestamo, li_totKit
string 	lsNoSerie, lsCveMat, lsFilter, lsTFilter,lsCveSalon, ldt_fecha_inicio1
string 	lsNoSerieK, ldt_fecha_final1, ls_descripcion
datetime ldt_fecha_inicio,ldt_fecha_final,ldt_fecha
datetime ldFechaI, ldFechaF
datetime	ldt_fecha_hora_ini,ldt_fecha_hora_fin
integer	li_hrsini,li_hrsfin,li_minini,li_minfin, li_row, li_ren, li_dias, li_ind,i, j
date 		ld_fechaini,ld_fechafin

datastore lds_kitMaterial
lds_kitMaterial =  create datastore 
lds_kitMaterial.dataobject ='d_adm_kit'
lds_kitMaterial.settransobject(gtr_sumuia)
	
if cbx_materiales.checked = true then
	dw_cap.reset()
end if

//		Obtenemos Número de Folio
if dw_busqueda_1.RowCount() > 0 then
	for li_ren = 1 to dw_busqueda_1.RowCount()
		if dw_busqueda_1.IsSelected(li_ren) = true then
			llFolio = dw_busqueda_1.object.spre_sol_materiales_folio[li_ren]
		end if
	next	
end if

//		criterios
dw_criterios.accepttext()

ld_fechaini=dw_criterios.getitemdate(1,'fechaini')
ld_fechafin=dw_criterios.getitemdate(1,'fechafin')

	if isnull(ld_fechaini) or isnull(ld_fechafin) then
		messagebox("Mensaje del Sistema", "Debe indicar la Fecha Inicial y Final",stopsign!)
	else

			//VALIDA FECHA
			ldt_fecha_hora_ini=datetime(ld_fechaini,time("00:00"))
			ldt_fecha_hora_fin=datetime(ld_fechafin,time("00:00"))
			ldFechaI=ldt_fecha_hora_ini
			ldFechaF=ldt_fecha_hora_fin

				if not isnull(row) then
					if row<>0 then
						if cbx_materiales.checked = false  then
							// NUEVO
							lsNoSerie = this.getitemstring(row,'num_serie')
							lsCveMat  = this.getitemstring(row,'spre_inventario_cvematerial')
							liCveGpo  = this.GetItemNumber (row,'cvegrupo')
							llIdSol= dw_interesado.GetItemNumber (1,'solicitanteid')			
							li_dias=daysafter(ld_fechaini,ld_fechafin)+1						
							ldt_fecha_inicio=datetime(ld_fechaini,time("00:00"))
							ldt_fecha_final=datetime(ld_fechafin,time("00:00"))
							dw_solicitud.setitem(1,'fecha_inicio',datetime(ld_fechaini, time("00:00")))					
							dw_solicitud.setitem(1,'fecha_fin',datetime(ld_fechafin, time("00:00")))
			
								for i=1 to li_dias
									li_row = dw_cap.insertrow(0)
									
									SELECT spre_materiales.descripcion 
										INTO :ls_descripcion
										FROM spre_materiales  
										WHERE ( cvedepto = :gi_depto ) AND
												  ( cvematerial = :lsCveMat) AND
												  ( cvegrupo = :liCveGpo) AND
												  ( cvearea = :gi_area) 
										USING gtr_sumuia; 
									
									dw_cap.setitem(li_row,'num_serie',lsNoSerie)
									dw_cap.setitem(li_row,'cvematerial',lsCveMat)
									dw_cap.setitem(li_row,'cvegrupo',liCveGpo)
									dw_cap.setitem(li_row,'status',ii_status_sol)
									dw_cap.setitem(li_row,'consecutivo',li_row)
									dw_cap.setitem(li_row,'cvedepto',gi_depto)
									dw_cap.setitem(li_row,'cvearea',gi_area)
									dw_cap.setitem(li_row,'fecha_inicio_1',ldt_fecha_inicio)
									dw_cap.setitem(li_row,'fecha_inicio',ldt_fecha_inicio)
									dw_cap.setitem(li_row,'fecha_final1_1',ldt_fecha_final)
									dw_cap.setitem(li_row,'fecha_final',ldt_fecha_final)
									dw_cap.setitem(li_row,'cve_salon',lsCveSalon)
									dw_cap.setitem(li_row,'hora_inicio',li_hrsini)
									dw_cap.setitem(li_row,'hora_final',li_hrsfin)		
									dw_cap.setitem(li_row,'descripcion',ls_descripcion)
									ldt_fecha_inicio=datetime(relativedate(ld_fechaini,i),time("00:00"))
									dw_cap.scrolltorow(li_row)
								next
							
						//Se verifica si tiene es un paquete
							if isvalid(lds_kitMaterial) then
								lds_kitMaterial.reset()
								lds_kitMaterial.dataobject ='d_adm_kit'
								lds_kitMaterial.settransobject(gtr_sumuia)
								li_totKit =lds_kitMaterial.retrieve(gi_depto,lsNoSerie)
								li_totKit =lds_kitMaterial.rowcount()
							else                                   
								li_totKit =lds_kitMaterial.retrieve(gi_depto,lsNoSerie)
								li_totKit =lds_kitMaterial.rowcount()
								
							end if	
							if li_totKit >= 1 then
								for i = 1 to li_totKit
									lsNoSerieK = lds_kitMaterial.getitemstring(i,'num_serie')
									lsCveMat  = lds_kitMaterial.getitemstring(i,'cvematerial')
									liCveGpo  = lds_kitMaterial.GetItemNumber (i,'cvegrupo')
									ldt_fecha_inicio=datetime(ld_fechaini,time("00:00"))
										for j=1 to li_dias
										li_row = dw_cap.insertrow(0)
										
										SELECT spre_materiales.descripcion 
										INTO :ls_descripcion
										FROM spre_materiales  
										WHERE ( cvedepto = :gi_depto ) AND
												  ( cvematerial = :lsCveMat) AND
												  ( cvegrupo = :liCveGpo) AND
												  ( cvearea = :gi_area) 
										USING gtr_sumuia; 
										
										dw_cap.setitem(li_row,'num_serie',lsNoSerieK)
										dw_cap.setitem(li_row,'cvematerial',lsCveMat)
										dw_cap.setitem(li_row,'cvegrupo',liCveGpo)
										dw_cap.setitem(li_row,'status',ii_status_sol)
										dw_cap.setitem(li_row,'consecutivo',li_row)
										dw_cap.setitem(li_row,'cvedepto',gi_depto)
										dw_cap.setitem(li_row,'cvearea',gi_area)
										dw_cap.setitem(li_row,'fecha_inicio_1',ldt_fecha_inicio)
										dw_cap.setitem(li_row,'fecha_inicio',ldt_fecha_inicio)
										dw_cap.setitem(li_row,'fecha_final1_1',ldt_fecha_final)
										dw_cap.setitem(li_row,'fecha_final',ldt_fecha_final)	
										dw_cap.setitem(li_row,'descripcion',ls_descripcion)
										ldt_fecha_inicio=datetime(relativedate(ld_fechaini,j),time("00:00"))
										
									next
								next
								dw_cap.scrolltorow(li_row)
							end if
							
							
						else
							lsNoSerie = this.getitemstring(row,'num_serie')
							lsCveMat  = this.getitemstring(row,'spre_inventario_cvematerial')
							liCveGpo  = this.GetItemNumber(row,'cvegrupo')
							liEstatus = this.GetItemNumber(row,'status')
							llIdSol= dw_interesado.GetItemNumber (1,'solicitanteid')
							li_dias=daysafter(ld_fechaini,ld_fechafin)+1
							ldt_fecha_inicio=datetime(ld_fechaini,time("00:00"))
							ldt_fecha_final=datetime(ld_fechafin,time("00:00"))
							dw_solicitud.setitem(1,'fecha_inicio',datetime(ld_fechaini, time("00:00")))					
							dw_solicitud.setitem(1,'fecha_fin',datetime(ld_fechafin, time("00:00")))
							for i=1 to li_dias
								li_row=dw_cap.insertrow(0)
								SELECT spre_materiales.descripcion 
								INTO :ls_descripcion
								FROM spre_materiales  
								WHERE ( cvedepto = :gi_depto ) AND
												  ( cvematerial = :lsCveMat) AND
												  ( cvegrupo = :liCveGpo) AND
												  ( cvearea = :gi_area) 
								USING gtr_sumuia; 
								
								dw_cap.setitem(li_row,'num_serie',lsNoSerie)
								dw_cap.setitem(li_row,'cvematerial',lsCveMat)
								dw_cap.setitem(li_row,'cvegrupo',liCveGpo)
								dw_cap.setitem(li_row,'status',liEstatus)
								dw_cap.setitem(li_row,'consecutivo',li_row)
								dw_cap.setitem(li_row,'cvedepto',gi_depto)
								dw_cap.setitem(li_row,'cvearea',gi_area)
								dw_cap.setitem(li_row,'fecha_inicio_1',ldt_fecha_inicio)
								dw_cap.setitem(li_row,'fecha_inicio',ldt_fecha_inicio)
								dw_cap.setitem(li_row,'fecha_final1_1',ldt_fecha_final)
								dw_cap.setitem(li_row,'fecha_final',ldt_fecha_final)
								dw_cap.setitem(li_row,'cve_salon',lsCveSalon)
								dw_cap.setitem(li_row,'hora_inicio',li_hrsini)
								dw_cap.setitem(li_row,'hora_final',li_hrsfin)
								dw_cap.setitem(li_row,'descripcion',ls_descripcion)
								ldt_fecha_inicio=datetime(relativedate(ld_fechaini,i),time("00:00"))
								dw_cap.scrolltorow(li_row)
							next		
							if isvalid(lds_kitMaterial) then
								lds_kitMaterial.reset()
								lds_kitMaterial.dataobject ='d_adm_kit'
								lds_kitMaterial.settransobject(gtr_sumuia)
								lds_kitMaterial.retrieve(gi_depto,lsNoSerie)
								li_totKit =lds_kitMaterial.rowcount()
							else                                   
								lds_kitMaterial.retrieve(gi_depto,lsNoSerie)
								li_totKit =lds_kitMaterial.rowcount()
							end if
							if li_totKit >= 1 then
								for i = 1 to li_totKit									
									lsNoSerieK = lds_kitMaterial.getitemstring(i,'num_serie')
									lsCveMat  = lds_kitMaterial.getitemstring(i,'cvematerial')
									liCveGpo  = lds_kitMaterial.GetItemNumber (i,'cvegrupo')
									ldt_fecha_inicio=datetime(ld_fechaini,time("00:00"))
									for j=1 to li_dias
										li_row = dw_cap.insertrow(0)
										SELECT spre_materiales.descripcion 
										INTO :ls_descripcion
										FROM spre_materiales  
										WHERE ( cvedepto = :gi_depto ) AND
												  ( cvematerial = :lsCveMat) AND
												  ( cvegrupo = :liCveGpo) AND
												  ( cvearea = :gi_area) 
										USING gtr_sumuia; 
										dw_cap.setitem(li_row,'num_serie',lsNoSerieK)
										dw_cap.setitem(li_row,'cvematerial',lsCveMat)
										dw_cap.setitem(li_row,'cvegrupo',liCveGpo)
										dw_cap.setitem(li_row,'status',liEstatus)
										dw_cap.setitem(li_row,'consecutivo',li_row)
										dw_cap.setitem(li_row,'cvedepto',gi_depto)
										dw_cap.setitem(li_row,'cvearea',gi_area)
										dw_cap.setitem(li_row,'fecha_inicio_1',ldt_fecha_inicio)
										dw_cap.setitem(li_row,'fecha_inicio',ldt_fecha_inicio)
										dw_cap.setitem(li_row,'fecha_final1_1',ldt_fecha_final)
										dw_cap.setitem(li_row,'fecha_final',ldt_fecha_final)
										dw_cap.setitem(li_row,'cve_salon',lsCveSalon)
										dw_cap.setitem(li_row,'hora_inicio',li_hrsini)
										dw_cap.setitem(li_row,'hora_final',li_hrsfin)
										dw_cap.setitem(li_row,'descripcion',ls_descripcion)
										ldt_fecha_inicio=datetime(relativedate(ld_fechaini,j),time("00:00"))
								
									next
								next
								dw_cap.scrolltorow(li_row)
							end if
						end if
					end if
				end if
	end if
destroy lds_kitMaterial	
dw_cap.setfocus()
end event

event clicked;
	SelectRow(0, FALSE)
	IF row <> 0 THEN SelectRow(row, TRUE)
	this.event itemfocuschanged( row, dwo)

end event

event constructor;this.setTransObject(gtr_sumuia)

end event

