$PBExportHeader$w_gen_prestamo_mat.srw
$PBExportComments$Permite capturar los materiales a prestar
forward
global type w_gen_prestamo_mat from window
end type
type ole_1 from olecustomcontrol within w_gen_prestamo_mat
end type
type cb_materias from commandbutton within w_gen_prestamo_mat
end type
type cb_corresp from commandbutton within w_gen_prestamo_mat
end type
type cb_1 from commandbutton within w_gen_prestamo_mat
end type
type st_1 from statictext within w_gen_prestamo_mat
end type
type em_folio from editmask within w_gen_prestamo_mat
end type
type cbx_cancelacion from checkbox within w_gen_prestamo_mat
end type
type cbx_prestamoact from checkbox within w_gen_prestamo_mat
end type
type cb_salir from commandbutton within w_gen_prestamo_mat
end type
type dw_reporte_mat from datawindow within w_gen_prestamo_mat
end type
type cbx_materiales from checkbox within w_gen_prestamo_mat
end type
type mle_1 from multilineedit within w_gen_prestamo_mat
end type
type cb_buscar from commandbutton within w_gen_prestamo_mat
end type
type cbx_ocupados from checkbox within w_gen_prestamo_mat
end type
type dw_criterios from datawindow within w_gen_prestamo_mat
end type
type cbx_intercambio from checkbox within w_gen_prestamo_mat
end type
type st_2 from statictext within w_gen_prestamo_mat
end type
type dw_interesado from u_dw within w_gen_prestamo_mat
end type
type rb_2 from radiobutton within w_gen_prestamo_mat
end type
type rb_1 from radiobutton within w_gen_prestamo_mat
end type
type dw_cap from u_dw within w_gen_prestamo_mat
end type
type dw_desc from datawindow within w_gen_prestamo_mat
end type
type dw_gpomat from u_dw within w_gen_prestamo_mat
end type
type cb_actualiza from commandbutton within w_gen_prestamo_mat
end type
type cb_eliminar from commandbutton within w_gen_prestamo_mat
end type
type dw_motivo from datawindow within w_gen_prestamo_mat
end type
type dw_solicitud from u_dw within w_gen_prestamo_mat
end type
type sle_cuenta from singlelineedit within w_gen_prestamo_mat
end type
type gb_2 from groupbox within w_gen_prestamo_mat
end type
type gb_1 from groupbox within w_gen_prestamo_mat
end type
type dw_busqueda from datawindow within w_gen_prestamo_mat
end type
type dw_busqueda_1 from datawindow within w_gen_prestamo_mat
end type
type gb_3 from groupbox within w_gen_prestamo_mat
end type
type gb_4 from groupbox within w_gen_prestamo_mat
end type
type dw_foto from datawindow within w_gen_prestamo_mat
end type
type oleobject_2 from oleobject within w_gen_prestamo_mat
end type
type oleobject_1 from oleobject within w_gen_prestamo_mat
end type
end forward

shared variables

end variables

global type w_gen_prestamo_mat from window
integer x = 15
integer y = 16
integer width = 3738
integer height = 3158
boolean titlebar = true
string title = "Prestamo material"
boolean controlmenu = true
boolean resizable = true
long backcolor = 29534863
ole_1 ole_1
cb_materias cb_materias
cb_corresp cb_corresp
cb_1 cb_1
st_1 st_1
em_folio em_folio
cbx_cancelacion cbx_cancelacion
cbx_prestamoact cbx_prestamoact
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
gb_1 gb_1
dw_busqueda dw_busqueda
dw_busqueda_1 dw_busqueda_1
gb_3 gb_3
gb_4 gb_4
dw_foto dw_foto
oleobject_2 oleobject_2
oleobject_1 oleobject_1
end type
global w_gen_prestamo_mat w_gen_prestamo_mat

type variables
boolean sb_nuevo=false
integer ligpomat, liTotalMatPrestado =0
long sl_linea, il_cuenta
n_transportar regreso
n_transportar origen
datastore ids_MatAlmn, ids_MatProf, ids_StaPrestamo
//Datastore PFC
n_ds		ids_Corresp	//Corresponsables del préstamo

// Variable que lee del lector de chip
String nchip

integer ii_stauts, ii_tprestamo, ii_ligpomat , iiDiasPrestamo, li_tipo_grupo
datawindowchild idwc_tipoespacio,idwc_espacio

integer ii_status_sol, liEstatus, iiEstatusant
long llFolio, liGrupo




end variables

forward prototypes
public subroutine wf_fecha_valida (ref datetime ad_fecha_final)
public subroutine wf_carga_foto (long li_cuenta, integer li_tipo)
public function n_transportar wf_busca_empleado (long al_nomina)
public subroutine wf_limpia_forma ()
public subroutine wf_status_pm (long al_folio)
public subroutine wf_verifica_status ()
public subroutine wf_crea_busqueda_1 (datetime ldt_fechaini, datetime ldt_fechafin)
public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin)
public function string wf_busca_alumno_dca (long al_cuenta)
public function string wf_busca_alumno (long al_cuenta)
public function string wf_busca_alumno_dca1 (long al_cuenta)
public function boolean wf_asigna_folio ()
public function long wf_valida_cuenta (long al_cuenta)
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
Blob lblob_foto_bd
Integer li_registro

SetNull(ls_arch_ruta)
//	choose case li_tipo
//		case 1
//			ls_arch_ruta = f_archivo_gvbox2(f_foto_alumno(li_cuenta))
//		case 3
//			ls_arch_ruta = f_archivo_gvbox2(f_foto_profesor(li_cuenta))
//		case 2
//			ls_arch_ruta = f_archivo_gvbox2(f_foto_alumno_dca(li_cuenta))
//	end choose

//	if li_tipo=0 then
//		
//	else
//		
//	end if
//	IF IsNull(ls_arch_ruta) THEN 
//		ole_foto.Object.FileName = ''
//		dw_imagen.reset()
//		messagebox('Aviso','El Alumno no tiene foto') 
//	ELSE 
//		ole_foto.Object.FileName = ls_arch_ruta
//		ole_foto.visible=true
//		ole_foto.object.autosize=2
//	END IF

	choose case li_tipo
		case 1
//			lblob_foto_bd = f_foto_alumno(li_cuenta)
			ls_arch_ruta = f_archivo_gvbox2(f_foto_alumno(li_cuenta))
		case 3
//			lblob_foto_bd = f_foto_profesor(li_cuenta)
			ls_arch_ruta = f_archivo_gvbox2(f_foto_profesor(li_cuenta))
		case 2
//			lblob_foto_bd = f_foto_alumno_dca(li_cuenta)
			ls_arch_ruta = f_archivo_gvbox2(f_foto_alumno_dca(li_cuenta))
	end choose
	
	if li_tipo=0 then
		
	else
		
	end if
	IF IsNull(ls_arch_ruta) THEN 
		dw_foto.reset()
		dw_foto.Modify ( "p_1.FileName='uia-n.jpg'" )
		messagebox('Aviso','El Alumno no tiene foto') 
	ELSE 
		li_registro = dw_foto.insertrow(0)
		dw_foto.setitem(li_registro, "name", "pruebas")
		dw_foto.Modify ( "p_1.FileName='" + ls_arch_ruta + "'" )
	END IF

//
//	if IsNull(lblob_foto_bd) then
//		dw_foto.Modify ( "p_1.FileName='uia-n.jpg'" )
////		No_existe_foto = true
//	else
////		ls_archivo = f_archivo_gvbox(lblob_foto_bd)
//		dw_foto.Modify ( "p_1.FileName='" + ls_arch_ruta + "'" )
////		No_existe_foto = false
//	end if	

//	PrintSetPrinter ("\\credencialesnew\CREDENEW") 

//
//	if li_tipo=0 then
//		
//	else
//		
//	end if
//	IF IsNull(ls_arch_ruta) THEN 
//		ole_foto.Object.FileName = ''
//		messagebox('Aviso','El Alumno no tiene foto') 
//	ELSE 
//		li_registro = dw_foto.insertrow(0)
//		dw_foto.setitem(li_registro, "name", "pruebas")
//	END IF
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
		commit using gtr_personal;
	end if
destroy ids_MatReq;
return uo_salida
end function

public subroutine wf_limpia_forma ();//ole_foto.Object.FileName = ''
dw_cap.Reset()
dw_interesado.Reset()
dw_solicitud.Reset()
dw_busqueda.reset()
dw_busqueda_1.reset()
dw_desc.Reset()
dw_criterios.reset()
ids_Corresp.Reset()
dw_foto.reset( )
dw_foto.Modify ( "p_1.FileName=''" )

dw_solicitud.triggerevent("pfc_InsertRow")
dw_interesado.insertrow(0)
dw_gpomat.insertrow(0)
dw_desc.insertrow(0)
liTotalMatPrestado =0
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
idwc_espacio.retrieve(gi_depto,gi_area,0)	
idwc_espacio.insertrow(1)					
//
dw_criterios.insertrow(0)
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

public subroutine wf_verifica_status ();////////////////////////////////////////////////////////////////////////////
////	Function:		wf_verifica_estatus
////	Arguments:		ninguno
////	Returns:			true
////	Description:	Verifica el estatus del material solicitado en el caso de
////						haber un retraso asigna la multa correspondiente e inserta 
////						en la base de datos el registro. Aquí no se asigna el total 
////						días que se presto el material debido a que posible no se 
////						entregue el material
////////////////////////////////////////////////////////////////////////////
//boolean 	lbRetraso = false
//date		ldFechaEntrega, ldSumDia
//decimal 	leTotal, leMontoatraso, leTotMontoatraso
//integer 	liDiasRestraso, liTotDiasRestraso, liDiasRestrasoT
//long 		llRow, llMaxFolio, llNoFolio, llGpoMat, ll_sqlcode, llMaxFolioDet, llCount
//string	lsNoSerie, lsCveMat, lsDiaNom
//setnull(llMaxFolio)	
//dw_matdisp.retrieve()
//if dw_matdisp.rowcount() >0 then
//	for llRow = 1 to dw_matdisp.rowcount()
//		ldFechaEntrega = Date(dw_matdisp.GetItemDateTime(llRow,'spre_sol_materiales_fecha_final'))
//		liDiasRestrasoT = DaysAfter(ldFechaEntrega, today()) 
//		ldSumDia = ldFechaEntrega
//		liDiasRestraso = 0
//		For llCount = 1 to liDiasRestrasoT 		
//			lsDiaNom = DayName(ldSumDia)
//			If lsDiaNom <> "Saturday" and lsDiaNom <> "Sunday" Then	
//				liDiasRestraso = liDiasRestraso +1
//			end if
//			ldSumDia = RelativeDate(ldSumDia, 1)
//		Next
//		if liDiasRestraso > 0 then			
//			dw_matdisp.SetItem(llRow, 'spre_sol_materiales_status', 3)	
//			lbRetraso = true
//			llNoFolio = dw_matdisp.getitemnumber(llRow, 'spre_sol_materiales_folio')	
////			leTotal = dw_matdisp.getitemnumber(llRow, 'spre_materiales_multa')	
////			liTotDiasRestraso = liTotDiasRestraso + liDiasRestraso
////			leMontoatraso= (liDiasRestraso * leTotal)
////			leTotMontoatraso = leTotMontoatraso + leMontoatraso
//		end if
//		
//	next
//		if lbRetraso then
//			//Se consulta si el folio tiene una multa cargada
//			SELECT dbo.spre_com_multas.folio_multa  
//				into :llMaxFolio
//				FROM dbo.spre_com_multas  
//				WHERE ( dbo.spre_com_multas.folio = :llNoFolio )  
//				USING gtr_sumuia; 
//				if isnull(llMaxFolio) then // No hay multa cargada se procede a preguntat
//			
//					integer Net
//					Net = MessageBox("Información de adeudos", "La solicitud con folio: "+ string(llNoFolio)+ " presenta un adeudo" + "~n ¿Desea cargar el adeudo ahora o esperar hasta la entrega del material?", &
//					Exclamation!, OKCancel!, 2)
//		
//					IF Net = 1 THEN // El usuario decide cargar la multa
//							if isnull(llMaxFolio) then 
//							//se trae el maximo folio
//							SELECT max(dbo.spre_com_multas.folio_multa)
//							into :llMaxFolio
//							FROM dbo.spre_com_multas  
//							USING gtr_sumuia;		
//							if isnull(llMaxFolio) then 
//								llMaxFolio =1	
//							ELSE
//								llMaxFolio =1	+ llMaxFolio		
//							end if
//						
//							// Se inserta la multa
//							INSERT INTO dbo.spre_com_multas  
//							( folio_multa,   
//							  folio,   
//							  fecha_carga,
//							  fecha_liberacion,
//							  status,
//							  usuario_carga,
//							  usuario_libera)  
//							VALUES ( :llMaxFolio,   
//							  :llNoFolio,   
//							  getdate(),
//							  '',
//							  1,
//							  :gs_usuario,
//							  ' ')
//							  USING gtr_sumuia; 
//
//							ll_sqlcode = gtr_sumuia.SQLCode
//							IF ll_sqlcode = 100 THEN
//								Rollback Using gtr_sumuia;	
//								MessageBox('Error Insertando la multa del Folio: ',string(llNoFolio), Exclamation!)
//							ELSEIF ll_sqlcode = -1 THEN
//								Rollback Using gtr_sumuia;	
//								MessageBox('Error Insertando la multa del Folio: ',string(llNoFolio)+'~n'+gtr_sumuia.SQLErrText,StopSign!)
//							ELSE
//								Commit Using gtr_sumuia;
//								MessageBox("Aviso",'Se genero la multa al Folio número: ' + string(llNoFolio),Exclamation!)
//							END IF	
//						end if
//					end if
//			end if	
//		end if
//end if
//
//
end subroutine

public subroutine wf_crea_busqueda_1 (datetime ldt_fechaini, datetime ldt_fechafin);string ls_criterio, ls_consulta

ls_criterio+=" AND (  (spre_sol_materiales.fecha_inicio between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' )"
ls_criterio+= " OR (spre_sol_materiales.fecha_final between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' )  "

//Si las horas solicitadas de préstamo están entre las de alguna solicitud, aparecerán como disponibles con
//las condiciones anteriores, por esa razón se agrega la siguiente condición:
ls_criterio+= " OR ('"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' between spre_sol_materiales.fecha_inicio and spre_sol_materiales.fecha_final) "+&
				 "  )"

ls_criterio+=" WHERE spre_materiales.cvedepto = "+string(gi_depto)+" AND spre_materiales.cvearea = "+string(gi_area)

if not isnull(dw_criterios.getitemnumber(1,'tipo_espacio')) then
		ls_criterio+=" AND ( spre_materiales.cvegrupo="+string(dw_criterios.getitemnumber(1,'tipo_espacio'))+" ) "
end if

if not isnull(dw_criterios.getitemstring(1,'espacio')) then
		ls_criterio+=" AND ( spre_materiales.cvematerial='"+dw_criterios.getitemstring(1,'espacio')+"' ) "
end if




ls_consulta=dw_busqueda_1.getsqlselect()+ls_criterio
mle_1.text=ls_consulta
dw_busqueda_1.setsqlselect(ls_consulta)
dw_busqueda_1.retrieve()
end subroutine

public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin);/*
string ls_criterio, ls_consulta

ls_criterio+=" AND  ( (fecha_inicio between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' )"
ls_criterio+= " OR (fecha_final between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' ) )"

if not isnull(dw_criterios.getitemnumber(1,'tipo_espacio')) then
		ls_criterio+=" WHERE ( spre_materiales.cvegrupo="+string(dw_criterios.getitemnumber(1,'tipo_espacio'))+" ) "
end if

if not isnull(dw_criterios.getitemstring(1,'espacio')) then
		ls_criterio+=" AND ( spre_materiales.cvematerial='"+dw_criterios.getitemstring(1,'espacio')+"' ) "
end if

ls_criterio+= " AND spre_materiales.cvedepto = 4 and spre_materiales.cvegrupo = 8"

ls_consulta=dw_busqueda.getsqlselect()+ls_criterio
mle_1.text=ls_consulta
dw_busqueda.setsqlselect(ls_consulta)
dw_busqueda.retrieve()

*/
string ls_criterio  = '', ls_consulta = ''
long i

If cbx_ocupados.checked Then
	ls_consulta = dw_busqueda.getsqlselect()
	
	ls_criterio=" AND ( spre_materiales.cvedepto="+string(gi_depto) +" AND spre_materiales.cvearea="+string(gi_area)+" ) AND ( spre_sol_materiales.status in (0,5) ) "
	ls_criterio+=" AND ((( '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' >= spre_sol_materiales.fecha_inicio) AND ( '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' <= spre_sol_materiales.fecha_final)) OR "
	ls_criterio+=" (( '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' >= spre_sol_materiales.fecha_inicio) AND ( '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' <= spre_sol_materiales.fecha_final)) OR "
	ls_criterio+=" (( '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' <= spre_sol_materiales.fecha_inicio) AND ( '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' >= spre_sol_materiales.fecha_final))) "
	
	if not isnull(dw_criterios.getitemnumber(1,'tipo_espacio')) then
			ls_criterio += " AND ( spre_materiales.cvegrupo="+string(dw_criterios.getitemnumber(1,'tipo_espacio'))+" ) "
	end if
	
	if not isnull(dw_criterios.getitemstring(1,'espacio')) then
			ls_criterio+=" AND ( spre_materiales.cvematerial='"+dw_criterios.getitemstring(1,'espacio')+"' ) "
	end if
	
	
	if not isnull(dw_criterios.getitemnumber(1,'cupo')) then
			ls_criterio+=" AND ( spre_materiales.cupo>="+string(dw_criterios.getitemnumber(1,'cupo'))+" ) "
	end if
Else
	ls_consulta = "SELECT DISTINCT B.descripcion, B.marca, B.tipo_aula, B.edificio, B.nivel, B.cupo, 	B.cvematerial, B.cvegrupo, B.cvedepto, B.cvearea, "
	ls_consulta = ls_consulta + "(SELECT COUNT(A.fecha_inicio) FROM spre_sol_materiales A WHERE  A.status IN (0,5) AND A.cvematerial = B.cvematerial "
	ls_consulta = ls_consulta + "AND A.cvedepto = B.cvedepto AND A.cvearea = B.cvearea AND A.cvegrupo = B.cvegrupo "
	ls_consulta = ls_consulta + "AND ((( '" + string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss') + "' >= A.fecha_inicio) AND ( '" + string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss') + "' <= A.fecha_final)) "
	ls_consulta = ls_consulta + "OR   (( '" + string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss') + "' >= A.fecha_inicio) AND ( '" + string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss') + "' <= A.fecha_final)) "
	ls_consulta = ls_consulta + "OR   (( '" + string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss') + "' <= A.fecha_inicio) AND ( '" + string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss') + "' >= A.fecha_final)))) as disponible "
	ls_consulta = ls_consulta + "FROM spre_materiales B WHERE B.cvedepto =" + string (gi_depto) + " AND B.cvearea = " + string (gi_area)
	
	if not isnull(dw_criterios.getitemnumber(1,'tipo_espacio')) then
			ls_criterio += " AND ( B.cvegrupo="+string(dw_criterios.getitemnumber(1,'tipo_espacio'))+" ) "
	end if
	
	if not isnull(dw_criterios.getitemstring(1,'espacio')) then
			ls_criterio+=" AND ( B.cvematerial='"+dw_criterios.getitemstring(1,'espacio')+"' ) "
	end if
	
	
	if not isnull(dw_criterios.getitemnumber(1,'cupo')) then
			ls_criterio+=" AND ( B.cupo>="+string(dw_criterios.getitemnumber(1,'cupo'))+" ) "
	end if
End if

ls_consulta = ls_consulta + ls_criterio
//mle_1.text=ls_consulta
dw_busqueda.setsqlselect(ls_consulta)
i = dw_busqueda.retrieve()	

i += 1
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
				messagebox("Mensaje del Sistema","Alumno NO inscrito en el area",stopsign!)
				
				sle_cuenta.text=""
				wf_limpia_forma()
			END IF
		end if			
	end if
	destroy ids_MatReq;
return ls_nombrecompleto

end function

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
integer Res
datastore ids_MatReq
ids_MatReq =  create datastore 
ids_MatReq.dataobject ='d_psi_mat_act'
ids_MatReq.settransobject(gtr_sumuia)

if isvalid(ids_MatAlmn) then	destroy ids_MatAlmn
ids_MatAlmn =  create datastore 
ids_MatAlmn.dataobject ='d_com_matinsc'
ids_MatAlmn.settransobject(gtr_sumuia)

setpointer(hourglass!)
if al_cuenta = 0 then 
	destroy ids_MatReq;
	return ""
end if
 
 SELECT v_sce_banderas_inscrito.cuenta,   
	         v_sce_alumnos.nombre+ ' ' + v_sce_alumnos.apaterno+' ' +v_sce_alumnos.amaterno as nombre_completo  ,
			v_sce_carreras.carrera
INTO 		:ll_cuenta_inscrito,   
	        	:ls_nombrecompleto,
			:ls_carrera
FROM      v_sce_alumnos	INNER JOIN	v_sce_academicos ON 
				v_sce_alumnos.cuenta = v_sce_academicos.cuenta
									INNER JOIN	v_sce_carreras ON
				v_sce_academicos.cve_carrera = v_sce_carreras.cve_carrera 
									LEFT OUTER JOIN	v_sce_banderas_inscrito ON
				v_sce_alumnos.cuenta = v_sce_banderas_inscrito.cuenta
WHERE	v_sce_alumnos.cuenta = :al_cuenta
USING	gtr_sumuia;
		
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
						
		//
//				wf_limpia_forma()
//				sle_cuenta.text=""
		
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
		messagebox("Mensaje del Sistema","El alumno no existe",stopsign!)
		wf_limpia_forma()
		sle_cuenta.text=""
	END IF
end if			

	
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
			//
//			sle_cuenta.text=""
//			wf_limpia_forma()
		else
			//if ls_carrera = 'COMUNICACIÓN' then
				//wf_carga_foto(long(ll_cuenta_inscrito),2)
//			else
	//			messagebox("Mensaje del Sistema","Alumno NO inscrito en el area de Comunicación",stopsign!)
				wf_carga_foto(long(ll_cuenta_inscrito),2)
		//	end if
		end if
	else
		IF gtr_sumuia.SQLCode = -1 THEN 
			MessageBox("SQL error", gtr_sumuia.SQLErrText)
		END IF
	end if			

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

public function long wf_valida_cuenta (long al_cuenta);integer	li_tipopres, li_multi
long		ll_row, ll_folio
string		ls_depto,ls_area
datetime	lft_vence
datastore lds_DiasAd

if rb_1.checked and not cbx_intercambio.checked then li_tipopres = 1
if rb_1.checked and cbx_intercambio.checked then	li_tipopres = 2
if rb_2.checked then li_tipopres = 3

//Parámetro para consultar multas y préstamos activos en otras áreas del
//departamento, solicitado por comunicación: depto = 4
//Se desactivará la consulta de multas y prestamos activos interareas para comunicación
//if gi_depto = 4 then li_multi = 1

lds_DiasAd =  create datastore

li_multi=0
//Informar si tiene multas
//Número de materiales en multa (con saldo > 0)
lds_DiasAd.dataobject ='dw_gen_consulta_multas'
lds_DiasAd.settransobject(gtr_sumuia)	
lds_DiasAd.Retrieve(al_cuenta,li_tipopres,gi_depto,gi_area,li_multi)
ll_row = lds_DiasAd.Rowcount()

if ll_row > 0 then 
	ls_area = lds_DiasAd.GetitemString(1,'area')
	ll_folio = lds_DiasAd.GetItemNumber(1,'folio_multa')
	Messagebox("Aviso","La cuenta "+string(al_cuenta)+ " presenta una multa en el área: "&
	+ls_area+"~r~nFolio: "+string(ll_folio)+"~r~nNo se puede realizar el préstamo.",stopsign!)
	return 1
end if

//Informar si tiene material en préstamo
//El usuario quiere prestar aunque se tenga material en préstamo

lds_DiasAd.dataobject ='dw_gen_consulta_prestamos_activos'
lds_DiasAd.settransobject(gtr_sumuia)	
lds_DiasAd.Retrieve(al_cuenta,li_tipopres,gi_depto,gi_area,li_multi)
ll_row = lds_DiasAd.Rowcount()

if ll_row > 0 then
	ls_area = lds_DiasAd.GetitemString(1,'area')
	ll_folio = lds_DiasAd.GetItemNumber(1,'folio')
	lft_vence = lds_DiasAd.GetItemDatetime(1,'fecha_fin')
	Messagebox("Aviso","La cuenta "+string(al_cuenta)+ " tiene material en préstamo en el área: "&
	+ls_area+"~r~nFolio: "+string(ll_folio) &
	+" con fecha de vencimiento: "+string(lft_vence)+" !!!"/*+"~r~nNo se puede realizar el préstamo."*/,information!)
	//return 1
end if

return 0
	



end function

event open;//////////////////////////////////////////////////////////////////////////////
//	Event:			open
//	Arguments:		Ninguno
//	Returns:			pbm_open
//	Description:	Carga la forma y prepara la misma para poder realizar el
//						prestamo de materiales
//////////////////////////////////////////////////////////////////////////////
SELECT descripcion
into :gs_depto
FROM		spre_departamentos
WHERE	spre_departamentos.cvedepto =:gi_depto
USING	gtr_sumuia;
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




//CHILD TIPO DE ESPACIO
dw_criterios.settransobject(gtr_sumuia)
dw_criterios.getchild('tipo_espacio',idwc_tipoespacio)
idwc_tipoespacio.settransobject(gtr_sumuia)
idwc_tipoespacio.retrieve(gi_depto,gi_area)		//dif w_com_prestamo_mat
idwc_tipoespacio.insertrow(1)

//CHILD ESPACIO
dw_criterios.settransobject(gtr_sumuia)
dw_criterios.getchild('espacio',idwc_espacio)
idwc_espacio.settransobject(gtr_sumuia)
idwc_espacio.retrieve(gi_depto,gi_area,0)		//dif w_com_prestamo_mat (cero en vez de uno) idwc_espacio.retrieve(gi_depto,gi_area,1)
idwc_espacio.insertrow(1)					
//
dw_criterios.insertrow(0)

cbx_ocupados.visible = false
cbx_materiales.visible = false
dw_busqueda.settransobject(gtr_sumuia)
dw_busqueda_1.settransobject(gtr_sumuia)

dw_cap.visible = false
dw_cap.enabled = false

sle_cuenta.setfocus()

//Depto de diseño solicitó poder capturar el email del solicitante:
if gi_depto = 8 then dw_solicitud.Modify("email_solicitante_t.visible = 1 email_solicitante.visible = 1")

//Depto de comunicación, solicitó capturar corresponsables del préstamo
//Se solicita deshabilitar la captura de corresponsables 2009-08-19
//if gi_depto = 4 then cb_corresp.visible = true
ids_Corresp	= create n_ds
ids_Corresp.DataObject = 'dw_gen_corresponsables_sol'
ids_Corresp.SetTransObject(gtr_sumuia)

// Inicializar los campos con la fecha actual
dw_criterios.SetItem(1,'fechaini', now())
dw_criterios.SetItem(1,'fechafin', now())

// Lector de Chip de contacto
//ole_1.object.TLector="Gemplus USB Smart Card Reader 0"
//ole_1.object.inicializa()

timer(1.5)

This.title = This.title + ' (' + gs_depto + ')'

dw_foto.SetTransObject(gtr_sumuia)


end event

on w_gen_prestamo_mat.create
this.ole_1=create ole_1
this.cb_materias=create cb_materias
this.cb_corresp=create cb_corresp
this.cb_1=create cb_1
this.st_1=create st_1
this.em_folio=create em_folio
this.cbx_cancelacion=create cbx_cancelacion
this.cbx_prestamoact=create cbx_prestamoact
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
this.gb_1=create gb_1
this.dw_busqueda=create dw_busqueda
this.dw_busqueda_1=create dw_busqueda_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.dw_foto=create dw_foto
this.oleobject_2=create oleobject_2
this.oleobject_1=create oleobject_1
this.Control[]={this.ole_1,&
this.cb_materias,&
this.cb_corresp,&
this.cb_1,&
this.st_1,&
this.em_folio,&
this.cbx_cancelacion,&
this.cbx_prestamoact,&
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
this.gb_1,&
this.dw_busqueda,&
this.dw_busqueda_1,&
this.gb_3,&
this.gb_4,&
this.dw_foto}
end on

on w_gen_prestamo_mat.destroy
destroy(this.ole_1)
destroy(this.cb_materias)
destroy(this.cb_corresp)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.em_folio)
destroy(this.cbx_cancelacion)
destroy(this.cbx_prestamoact)
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
destroy(this.gb_1)
destroy(this.dw_busqueda)
destroy(this.dw_busqueda_1)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.dw_foto)
destroy(this.oleobject_2)
destroy(this.oleobject_1)
end on

event closequery;//if dw_cap.modifiedcount()>0 then
//	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
//		cb_actualiza.triggerevent(clicked!)
//	end if
//end if	
//if dw_cap.deletedcount()>0 then
//	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
//		cb_actualiza.triggerevent(clicked!)
//	end if
//end if	

//Chip de contacto
//ole_1.object.desconectar()
timer(1.5)
end event

event activate;//////////////////////////////////////////////////////////////////////////////
//	Event:			activate
//	Arguments:		Ninguno
//	Returns:			pbm_activate
//	Description:	Permite asignar la clave y el tipo de solicitante
//////////////////////////////////////////////////////////////////////////////
/* 
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
*/

//This.WindowState = Maximized!
timer(1.5)
end event

event close;if isvalid(ids_Corresp) then	destroy ids_Corresp

end event

event timer;
string a="", ls_nomina = "", ls_mensaje = ""
integer li_inicializa = 0

long ll_cuenta

//If gs_lector_activ = "1" Then
//	// Lector de chip de contacto
//	a=ole_1.object.AutorizaChip()
//End  If


IF this.windowstate = minimized! then
	If gs_lector_activ = "1" Then
		li_inicializa = ole_1.object.inicializa()
	End If
	timer (0)
ELSE
	If gs_lector_activ = "1" Then
		// 14-03-11. Lector de Chip sin contacto
		li_inicializa = ole_1.object.inicializa()
	End If
	
//	if li_inicializa = 0 Then	
//		timer (0)
//	Else
		If gs_lector_activ = "1" Then
			a=ole_1.object.LeerChipcl()
			ole_1.object.quit()
		Else 
			//	TEMPORAL
//			a = "6B6CBEAF"
			timer (0)
		End If


	
		//if a <> "" then
		if a <> "0" AND a <> ""  then
		
			// Se busca el chip de la credencial, si es profesor
			If rb_2.checked Then 
				Select convert(varchar(20), empleado) as nomina
				Into :ls_nomina
				From empl_uia2   
				Where templ < 20 And tnom in (0,1,2,3)  
				And nchip_cl = :a
				Using gtr_personal;
				
				if gtr_personal.sqlcode=0 then
					sle_cuenta.text = ls_nomina
				Else
					ls_mensaje = "El número de nómina asignado a la credencial, ya no pertenece a la Comunidad."
				end if

			End If
			
			// Se busca el chip de la credencial, si es alumno
			If rb_1.checked Then 
				If cbx_intercambio.checked Then
					//Messagebox("Aviso","La cuenta de los alumnos de intercambio, deberán ser ingresada directamente en el campo de cuenta.")
					select                   convert(varchar(20), no_folio_inter) as cuenta
					into                       :ls_nomina
					from                     dca_alumnos_ext
					where  nchip_cl = :a
					Using gtr_sumuia;
					
					if gtr_sumuia.sqlcode=0 then
						sle_cuenta.text = ls_nomina
					Else
						ls_mensaje = "El número de cuenta del alumno de intercambio asignado a la credencial, no es válido."
					end if
					
				Else
					SELECT convert(varchar(20), A.cuenta) + D.digito as cuenta
					Into :ls_nomina
					FROM v_sce_alumnos A INNER JOIN v_sce_alumno_digito D ON A.cuenta = D.cuenta
					WHERE A.nchip_cl = :a
					Using gtr_sumuia;
						
					if gtr_sumuia.sqlcode=0 then
						sle_cuenta.text = ls_nomina
					Else
						ls_mensaje = "El número de cuenta del alumno asignado a la credencial, no es válido."
					end if

				End If
			End if 
			
			wf_limpia_forma()
			
			if (gtr_personal.sqlcode=0 or gtr_sumuia.sqlcode=0) and ls_nomina <> '' then
				commit using gtr_personal;
				setpointer(Hourglass!)
				sle_cuenta.triggerevent( "activarbusq")
				setpointer(Arrow!)		
			Else
				commit using gtr_personal;
				Messagebox("Aviso",ls_mensaje)
			end if
		end if
//	end if		
END IF

end event

event deactivate;timer(0)
end event

type ole_1 from olecustomcontrol within w_gen_prestamo_mat
boolean visible = false
integer x = 3745
integer y = 678
integer width = 157
integer height = 112
integer taborder = 80
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_gen_prestamo_mat.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type cb_materias from commandbutton within w_gen_prestamo_mat
integer x = 2527
integer y = 454
integer width = 336
integer height = 74
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Materias"
end type

event clicked;string nombre,apat,amat,columna, data, verifica, ls_prepa, lstipo
long cuenta
integer li_param=0 ,li_cve_empresa,li_tipo
datetime ld_date

li_tipo =dw_interesado.GetItemNumber(1,'tipo_prestamo')
cuenta =dw_interesado.GetItemNumber(1,'solicitanteid')


if cuenta > 0  then

	dw_solicitud.setitem(1,'solicitanteid',cuenta)
				
	choose case li_tipo
						
			case 1
					origen.ii_parm1 = li_tipo
					origen.il_parm1 = dw_interesado.GetItemNumber(1,'solicitanteid')
					openwithparm(w_gen_mat_insc,origen)
					if isvalid(Message.PowerObjectParm) then
						regreso = message.powerobjectparm
						dw_interesado.setitem(1,'solicitantegrupo',regreso.is_parm2)
						dw_interesado.setitem(1,'solicitanteprofesor',regreso.is_parm3)		
						// 	Se agrega este codigo 30-julio-2007 gmn.
						//	Asignamos en automático la hora de prestamo
						dw_criterios.setitem(1,'horarioini',regreso.ii_parm9)
						dw_criterios.setitem(1,'minutoini',00)
						dw_criterios.setitem(1,'horariofin',regreso.ii_parm10)
						dw_criterios.setitem(1,'minutofin',00)
						//	ok.
					end if

			case 3

				origen.ii_parm1 = li_tipo
				origen.il_parm1 = dw_interesado.GetItemNumber(1,'solicitanteid')
				openwithparm(w_gen_mat_insc,origen)
				if isvalid(Message.PowerObjectParm) then
					regreso = message.powerobjectparm
					dw_interesado.setitem(1,'solicitantegrupo',regreso.is_parm2)
					//		Se reciben parametros del profesor.gmn. mayo 2008
					dw_interesado.setitem(1,'solicitanteprofesor',regreso.is_parm3)	
					//		Asignamos por default horario 
					dw_criterios.setitem(1,'horarioini',regreso.ii_parm9)
					dw_criterios.setitem(1,'horariofin',regreso.ii_parm10)
					dw_criterios.setitem(1,'minutoini',00)
					dw_criterios.setitem(1,'minutofin',00)
							
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

end event

type cb_corresp from commandbutton within w_gen_prestamo_mat
boolean visible = false
integer x = 2809
integer y = 2176
integer width = 786
integer height = 109
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Captura de Corresponsables"
end type

event clicked;openwithparm(w_gen_corresponsables,ids_Corresp)
end event

type cb_1 from commandbutton within w_gen_prestamo_mat
integer x = 1668
integer y = 2637
integer width = 527
integer height = 160
integer taborder = 190
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Actualiza Solicitud"
end type

event clicked;datastore lds_BorraSolTot, lds_Consultafecha
integer li_resul, li_resul1, li_resul2, Net, Res
long li_ActualizaEst
datetime ldt_fechaini, ldt_fechafin, ldt_fechahoy


llFolio = long(em_folio.text)

lds_BorraSolTot =  create datastore 
//lds_BorraSolTot.dataobject ='d_com_cambia_estatus_sol'
lds_BorraSolTot.dataobject ='d_gen_cambia_estatus_sol'
lds_BorraSolTot.settransobject(gtr_sumuia)
li_resul = lds_BorraSoltot.retrieve(llFolio, gi_depto)


if li_resul > 1 then
	Messagebox("Aviso","No puede actualizar el estatus de la Solicitud: " + string(llFolio) )
end if

if li_resul = 1 then
	liEstatus= lds_BorraSolTot.getitemnumber(1,'status')
end if



if isnull(li_resul) OR li_resul = 0 then
	messagebox("Aviso","La Solicitud con número de Folio:" + string(llFolio) + " , No existe")
	cbx_prestamoact.checked = false
	cbx_cancelacion.checked = false
	em_folio.text = ' '
else
	
	if cbx_prestamoact.checked  then
		
			CHOOSE CASE liEstatus
				CASE 0 
					Messagebox("No procede","La solicitud actualmente presenta material con prestamo activo")
					cbx_prestamoact.checked = false
					em_folio.text = ' '
				CASE 3 
					Messagebox("No procede","La solicitud presenta multa ")
					cbx_prestamoact.checked = false
					em_folio.text = ' '
				CASE 5
					Net = MessageBox("Mensaje del Sistema", "Se han realizado cambios en la solicitud, Desea guardarlos?", &
									Question!, yesno!, 2)	
					if Net = 1 then
					//		Se actualiza el estatus de la solicitud a Prestamo activo
						
							UPDATE dbo.spre_solicitud 
							SET dbo.spre_solicitud.status = 0
							WHERE ( dbo.spre_solicitud.folio = :llFolio ) AND
									( dbo.spre_solicitud.cvedepto = :gi_depto)
							using gtr_sumuia;
							commit using gtr_sumuia;
							
							UPDATE dbo.spre_sol_materiales 
							SET dbo.spre_sol_materiales.status = 0
							WHERE ( dbo.spre_sol_materiales.folio = :llFolio ) AND
									( dbo.spre_sol_materiales.cvedepto = :gi_depto)
							using gtr_sumuia;
							
							commit using gtr_sumuia;
							cbx_cancelacion.checked = false
							em_folio.text = ' '
							
							
							//		Impresión Solicitud
						
//							dw_reporte_mat.dataobject = "d_com_rep_solicitud_mat_1"
							dw_reporte_mat.dataobject = "d_gen_rep_solicitud_mat_1"
							dw_reporte_mat.SetTransObject(gtr_sumuia)
							dw_reporte_mat.retrieve(llFolio, gi_depto)
														
							lds_Consultafecha =  create datastore 
//							lds_Consultafecha.dataobject ='d_com_consulta_sol'
							lds_Consultafecha.dataobject ='d_gen_consulta_sol'
							lds_Consultafecha.settransobject(gtr_sumuia)
							li_resul1 = lds_Consultafecha.retrieve(llFolio, gi_depto)
							
							if li_resul1 >= 1 then
								ldt_fechaini = lds_Consultafecha.getitemdatetime(1,'fecha_inicio')
								ldt_fechafin = lds_Consultafecha.getitemdatetime(1,'fecha_fin')
								ldt_fechahoy = lds_Consultafecha.getitemdatetime(1,'fecha_hoy')
								
								dw_reporte_mat.object.t_tipo_solicitud.text = "Prestamo Activo"
								dw_reporte_mat.object.fecha_inicio[1] = string(ldt_fechaini,"dd/mm/yyyy")
								dw_reporte_mat.object.fecha_fin[1] = string(ldt_fechafin,"dd/mm/yyyy")
								dw_reporte_mat.object.h_ini[1] = string(ldt_fechaini)
								dw_reporte_mat.object.h_fin[1] = string(ldt_fechafin)
								dw_reporte_mat.object.fecha_solicitud_act[1] = string(ldt_fechahoy,"dd/mm/yyyy")
	
	
								Res = MessageBox("Mensaje del Sistema", "¿Desea Imprimir la solicitud del material", &
								Question!, yesno!, 2)
								if Res = 1 then
									dw_reporte_mat.print()
								end if
								wf_limpia_forma()	
							end if
							
						end if
			END CHOOSE
		
		
	end if
		
	if cbx_cancelacion.checked  then
		
			CHOOSE CASE liEstatus
				/*CASE 0 
					Messagebox("No procede","No puede cancelar una solictud con Prestamo Activo")
					cbx_cancelacion.checked = false
					em_folio.text = ' '
					*/
				CASE 3
					Messagebox("No procede","No puede cancelar una solictud con Multa")
					cbx_cancelacion.checked = false
					em_folio.text = ' '
				CASE ELSE
					
					Net = MessageBox("Mensaje del Sistema", "Será cancelada la Solicitud con Folio: " + string(llFolio) + ", Desea Cancelar?", &
									Question!, yesno!, 2)	
					if Net = 1 then
					// Cancela la solicitud
						DELETE dbo.spre_prestamo_material
						WHERE ( dbo.spre_prestamo_material.folio = :llFolio )	AND
								( dbo.spre_prestamo_material.cvedepto = :gi_depto)
						using gtr_sumuia;
						commit using gtr_sumuia;
								
						DELETE dbo.spre_sol_materiales
						WHERE ( dbo.spre_sol_materiales.folio = :llFolio ) AND
								( dbo.spre_sol_materiales.cvedepto = :gi_depto)
						using gtr_sumuia;
						commit using gtr_sumuia;
								
						DELETE dbo.spre_solicitud
						WHERE ( dbo.spre_solicitud.folio = :llFolio ) AND
								( dbo.spre_solicitud.cvedepto = :gi_depto)
						using gtr_sumuia;
						
						DELETE dbo.spre_com_espacios_islas
						WHERE cvedepto =:gi_depto
						AND folio =:llFolio
						using gtr_sumuia;
						
						commit using gtr_sumuia;
						cbx_cancelacion.checked = false
						em_folio.text = ' '
					end if
				
			END CHOOSE		
	
	end if	
end if
//
destroy lds_BorraSolTot
destroy lds_Consultafecha
end event

type st_1 from statictext within w_gen_prestamo_mat
integer x = 187
integer y = 2621
integer width = 402
integer height = 58
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "No. Folio Solicitud"
boolean focusrectangle = false
end type

type em_folio from editmask within w_gen_prestamo_mat
integer x = 208
integer y = 2698
integer width = 333
integer height = 99
integer taborder = 200
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "######"
end type

type cbx_cancelacion from checkbox within w_gen_prestamo_mat
integer x = 691
integer y = 2717
integer width = 600
integer height = 74
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 29534863
string text = "Cancelación total"
end type

event clicked;if this.checked then
	cbx_prestamoact.checked = false
end if
end event

type cbx_prestamoact from checkbox within w_gen_prestamo_mat
boolean visible = false
integer x = 691
integer y = 2650
integer width = 600
integer height = 74
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Prestamo Activo"
end type

event clicked;if this.checked then
	cbx_cancelacion.checked = false
end if
end event

type cb_salir from commandbutton within w_gen_prestamo_mat
integer x = 2820
integer y = 2784
integer width = 289
integer height = 112
integer taborder = 180
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

type dw_reporte_mat from datawindow within w_gen_prestamo_mat
boolean visible = false
integer x = 3511
integer y = 3043
integer width = 69
integer height = 48
integer taborder = 250
string title = "none"
string dataobject = "d_gen_rep_solicitud_mat"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type cbx_materiales from checkbox within w_gen_prestamo_mat
boolean visible = false
integer x = 2523
integer y = 1117
integer width = 841
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
	dw_busqueda_1.object.spre_sol_materiales_folio.visible=true
	dw_busqueda_1.object.status.visible = false
	dw_busqueda_1.setfilter('not isnull(spre_sol_materiales_folio)')
	dw_busqueda_1.filter()
	dw_busqueda_1.setfilter('status in(0,5)')
	dw_busqueda_1.filter()
	dw_busqueda_1.title="Materiales Reservados"
else
	dw_busqueda_1.object.txt_solicitud.visible=false
	dw_busqueda_1.object.spre_sol_materiales_folio.visible=false
	dw_busqueda_1.setfilter('isnull(spre_sol_materiales_folio)')
	dw_busqueda_1.filter()
	dw_busqueda_1.title="Materiales Disponibles"
end if
end event

type mle_1 from multilineedit within w_gen_prestamo_mat
boolean visible = false
integer x = 3416
integer y = 3050
integer width = 69
integer height = 45
integer taborder = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_buscar from commandbutton within w_gen_prestamo_mat
integer x = 1785
integer y = 1085
integer width = 289
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Buscar"
end type

event clicked;datetime ldt_fecha_hora_ini,ldt_fecha_hora_fin
integer li_hrsini,li_hrsfin, li_minini, li_minfin
date ld_fechaini,ld_fechafin

ii_status_sol=dw_solicitud.getitemnumber(1,'status')	

li_tipo_grupo = dw_criterios.object.tipo_espacio[1]
					
//Sólo comunicación (4) area 1 (TV) puede reservar ISLAS.
if li_tipo_grupo = 8 and gi_depto = 4 and gi_area = 1  then
	dw_busqueda_1.visible=false
	dw_busqueda_1.enabled = false
	dw_busqueda.enabled = true
	dw_busqueda.visible = true
	dw_criterios.accepttext()
	dw_busqueda.reset()
	dw_busqueda.insertrow(0)
	li_hrsini=dw_criterios.getitemnumber(1,'horarioini')
	li_hrsfin=dw_criterios.getitemnumber(1,'horariofin')
	li_minini=dw_criterios.getitemnumber(1,'minutoini')
	li_minfin=dw_criterios.getitemnumber(1,'minutofin')
	ld_fechaini=dw_criterios.getitemdate(1,'fechaini')
	ld_fechafin=dw_criterios.getitemdate(1,'fechafin')
	
	
	//Permiter fechas anteriores a la del día si es para consultar
	IF ld_fechaini < today() and not cbx_ocupados.checked THEN
		Messagebox("No Procede","La Fecha inicial no puede ser menor al día de hoy.")
		dw_criterios.reset()
		dw_criterios.insertrow(0)
		dw_busqueda.reset()
		return
	END IF 
	
	IF ld_fechaini = ld_fechafin then
		IF li_hrsini < li_hrsfin then
			 
		elseif li_hrsini = li_hrsfin then
			IF li_minini < li_minfin then
				
			else
				messagebox("Mensaje del Sistema","Verifica el Horario Inicial y Final.")
			END IF
		else
			messagebox("Mensaje del Sistema","Debe indicar el horario en formato 1-24 para horas.")
		END IF
	END IF
	
	if isnull(li_hrsini) or isnull(li_hrsfin) or isnull(li_minini) or isnull(li_minfin) then
		messagebox("Mensaje del Sistema", "Debe indicar el Horario Inicial y Final",stopsign!)
	else
		if isnull(ld_fechaini) or isnull(ld_fechafin) then
			messagebox("Mensaje del Sistema", "Debe indicar la Fecha Inicial y Final",stopsign!)
		else
			if ( li_hrsini>24 or li_hrsini<1 or li_hrsfin>24 or li_hrsfin<1 ) or (li_minini>59 or li_minini<0 or li_minfin>59 or li_minfin<0) then
				messagebox("Mensaje del Sistema", "Debe indicar el horario en formato 1-24 para horas y de 0-59 para los minutos",stopsign!)
			else
				//VALIDA FECHA
				ldt_fecha_hora_ini=datetime(ld_fechaini,time(li_hrsini,li_minini,0))
				ldt_fecha_hora_fin=datetime(ld_fechafin,time(li_hrsfin,li_minfin,0))
				
				if ldt_fecha_hora_fin > ldt_fecha_hora_ini then 
				
				//	if li_minfin=0 then li_minfin=60
				//	ldt_fecha_hora_fin=datetime(ld_fechafin,time(li_hrsfin - 1, li_minfin - 1,59))
					ldt_fecha_hora_fin=datetime(ld_fechafin,relativetime(time(li_hrsfin, li_minfin,0), -1 ) )
					If cbx_ocupados.checked Then
					dw_busqueda.dataobject='d_com_busq_sol'
					dw_busqueda.settransobject(gtr_sumuia)
					wf_crea_busqueda(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
					cbx_ocupados.visible=true
					dw_busqueda.title="Espacios Solicitados"
				Else
					dw_busqueda.dataobject='d_com_busq_disp'
					dw_busqueda.settransobject(gtr_sumuia)
					wf_crea_busqueda(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
					dw_busqueda.setfilter('folio = 0')					
					dw_busqueda.filter()
					cbx_ocupados.visible=true
					dw_busqueda.title="Espacios Disponibles"
				End if
					
					
					
					
					
					
					
					
					
					
					
					
					
					/*
					dw_busqueda.dataobject='d_sres_com_busq_disp'
					dw_busqueda.settransobject(gtr_sumuia)
					wf_crea_busqueda(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
					dw_busqueda.setfilter('(isnull(folio) or status in(1,2))')					
					dw_busqueda.filter()
					cbx_ocupados.visible=true
					dw_busqueda.object.txt_solicitud.visible=false
					dw_busqueda.object.folio.visible=false
					dw_busqueda.title="Espacios Disponibles"
					cbx_ocupados.checked=false
					*/
				else
					Messagebox("Mensaje del Sistema", "La fecha final no puede ser anterior a la inicial",stopsign!)
				end if
			end if
		end if
	end if
else
		
	dw_cap.visible = true
	dw_cap.enabled = true
	dw_busqueda.visible=false
	dw_busqueda.enabled = false
	dw_busqueda_1.enabled = true
	dw_busqueda_1.visible = true
	dw_criterios.accepttext()
	dw_busqueda_1.reset()
	dw_busqueda_1.insertrow(0)
	li_hrsini=dw_criterios.getitemnumber(1,'horarioini')
	li_hrsfin=dw_criterios.getitemnumber(1,'horariofin')
	li_minini=dw_criterios.getitemnumber(1,'minutoini')
	li_minfin=dw_criterios.getitemnumber(1,'minutofin')
	ld_fechaini=dw_criterios.getitemdate(1,'fechaini')
	ld_fechafin=dw_criterios.getitemdate(1,'fechafin')
	
	IF ld_fechaini < today() THEN
		messagebox("NO PROCEDE","La Fecha inicial no puede ser menor al día de hoy.")
		dw_criterios.reset()
		dw_criterios.insertrow(0)
		dw_busqueda_1.reset()
		return
	END IF

	IF ld_fechaini = ld_fechafin then 
		IF li_hrsini < li_hrsfin then
		elseif li_hrsini = li_hrsfin then
			IF li_minini < li_minfin then
				
			else
				messagebox("Mensaje del Sistema","Verifica el Horario Inicial y Final.")
			END IF
		else
			messagebox("Mensaje del Sistema","Debe indicar el horario en formato 1-24 para horas.")
		END IF
	END IF
	if isnull(li_hrsini) or isnull(li_hrsfin) or isnull(li_minini) or isnull(li_minfin) then
		messagebox("Mensaje del Sistema", "Debe indicar el Horario Inicial y Final",stopsign!)
	else
		if isnull(ld_fechaini) or isnull(ld_fechafin) then
			messagebox("Mensaje del Sistema", "Debe indicar la Fecha Inicial y Final",stopsign!)
		else
			if ( li_hrsini>24 or li_hrsini<1 or li_hrsfin>24 or li_hrsfin<1 ) or (li_minini>59 or li_minini<0 or li_minfin>59 or li_minfin<0) then
				messagebox("Mensaje del Sistema", "Debe indicar el horario en formato 1-24 para horas y de 0-59 para los minutos",stopsign!)
			else
				//VALIDA FECHA
				ldt_fecha_hora_ini=datetime(ld_fechaini,time(li_hrsini,li_minini,0))
				ldt_fecha_hora_fin=datetime(ld_fechafin,time(li_hrsfin,li_minfin,0))
				
				if ldt_fecha_hora_fin > ldt_fecha_hora_ini then 
					//if li_minfin=0 then li_minfin=60
					//ldt_fecha_hora_fin=datetime(ld_fechafin,time(li_hrsfin - 1, li_minfin - 1,59))
					ldt_fecha_hora_fin=datetime(ld_fechafin,relativetime(time(li_hrsfin, li_minfin,0), -1 ) )
					dw_busqueda_1.dataobject='d_gen_matdisp'
					dw_busqueda_1.settransobject(gtr_sumuia)
//					dw_busqueda_1.retrieve()  //glo
					wf_crea_busqueda_1(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
					dw_busqueda_1.setfilter('(isnull(spre_sol_materiales_folio) or status in (1,3))')	

					dw_busqueda_1.filter()
					//cbx_materiales.visible=true
					dw_busqueda_1.object.txt_solicitud.visible=false
					dw_busqueda_1.object.spre_sol_materiales_folio.visible=false
					dw_busqueda_1.title="Materiales Disponibles"
					cbx_materiales.checked = false
				else
					messagebox("Mensaje del Sistema", "La fecha final no puede ser anterior a la inicial",stopsign!)
				end if
			end if
		end if
	end if
end if
end event

type cbx_ocupados from checkbox within w_gen_prestamo_mat
integer x = 2523
integer y = 1008
integer width = 841
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 29534863
string text = " Ver Estado Espacios (ISLAS) "
end type

event clicked;/*if this.checked then
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
*/
cb_buscar.triggerevent(clicked!)
end event

type dw_criterios from datawindow within w_gen_prestamo_mat
integer x = 95
integer y = 922
integer width = 2074
integer height = 349
integer taborder = 70
string title = "none"
string dataobject = "d_gen_criterios_busqueda"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long llCuenta, llCta
string		ls_null
setnull(ls_null)


llCta = long(left(trim(sle_cuenta.text),len(trim(sle_cuenta.text))-1))

if string(dwo.name)='tipo_espacio'then
	idwc_espacio.settransobject(gtr_sumuia)
	idwc_espacio.retrieve(gi_depto,gi_area,integer(data))
	
	liGrupo = long(data)
	post setitem(row,'espacio',ls_null)



elseif string(dwo.name)='espacio' then

	if liGrupo = 8 then

	end if
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

type cbx_intercambio from checkbox within w_gen_prestamo_mat
integer x = 113
integer y = 192
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

type st_2 from statictext within w_gen_prestamo_mat
integer x = 622
integer y = 138
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

type dw_interesado from u_dw within w_gen_prestamo_mat
integer x = 73
integer y = 445
integer width = 2794
integer height = 400
integer taborder = 60
string dataobject = "d_gen_solmaterial"
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
						openwithparm(w_gen_mat_insc,origen)
						if isvalid(Message.PowerObjectParm) then
							regreso = message.powerobjectparm
							this.setitem(1,'solicitantegrupo',regreso.is_parm2)
							this.setitem(1,'solicitanteprofesor',regreso.is_parm3)			
						end if
//					case 3
//						origen.ii_parm1 = li_tipo
//						origen.il_parm1 = this.GetItemNumber(1,'solicitanteid')
////						openwithparm(w_com_mat_insc,origen)
//						if isvalid(Message.PowerObjectParm) then
//							regreso = message.powerobjectparm
//							this.setitem(1,'solicitantegrupo',regreso.is_parm2)
//						else
//							integer Net
//							Net = MessageBox("Mensaje del Sistema", "¿Desea continuar con el prestamo de material", &
//									Question!, yesno!, 2)
//							
//							IF Net = 2 THEN
//								sle_cuenta.text=""
//								wf_limpia_forma()													
//							END IF	
//						end if
				end choose
			else
				messagebox("Mensaje del Sistema","Es necesario ingresar la clave de profesor o alumno",stopsign!)
			end if
	end choose

end event

type rb_2 from radiobutton within w_gen_prestamo_mat
integer x = 106
integer y = 307
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
sle_cuenta.text = ""
cbx_intercambio.checked = false
cbx_intercambio.visible = false
sle_cuenta.setfocus( )

timer(1.5)
end event

type rb_1 from radiobutton within w_gen_prestamo_mat
integer x = 106
integer y = 125
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

sle_cuenta.text = ""
sle_cuenta.setfocus( )


cbx_intercambio.visible = true
timer(1.5)
end event

type dw_cap from u_dw within w_gen_prestamo_mat
integer x = 51
integer y = 2109
integer width = 2951
integer height = 346
integer taborder = 230
string dataobject = "d_gen_matsol"
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



//	CHOOSE CASE liEstatus
//		CASE 0 //ESTA COMO PRESTAMO ACTIVO, ESTA COMBINACION NO HACE NADA	
//			for i=1 to dw_cap.rowcount()
//				if dw_cap.getitemnumber(i,'status')=0 then dw_cap.setitem(i,'status',0)
//			next
//		CASE ELSE
//			messagebox('Mensaje del Sistema','No es posible CAMBIAR la solicitud debido a que se encuentra CANCELADA',stopsign!)
//			this.setitem(row,'status',2)
//	END CHOOSE		



end event

event clicked;call super::clicked;
//if cbx_materiales.checked then
//
//	liEstatus=this.getitemnumber(1,'status')
//	
//end if
end event

type dw_desc from datawindow within w_gen_prestamo_mat
boolean visible = false
integer x = 3332
integer y = 3040
integer width = 69
integer height = 51
integer taborder = 80
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

type dw_gpomat from u_dw within w_gen_prestamo_mat
boolean visible = false
integer x = 3222
integer y = 3056
integer width = 69
integer height = 35
integer taborder = 90
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

type cb_actualiza from commandbutton within w_gen_prestamo_mat
integer x = 3299
integer y = 2346
integer width = 296
integer height = 109
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Actualizar"
end type

event clicked;integer 	li_row, li_diasprestamo = 0, listatus, lt_adeudo, Res, liAdeudo, li_resul, Net, i, li_ren
string	lsNoSerie, lsCveMaterial, lsSerie, ls_corr_n, ls_rep[]
long		llMaxFolio, llRow, ll_tipo, ll_folio, ll_j
datetime finicio,ffin
datastore lds_BorraSol

//Se solicita deshabilitar los formatos de corresponsalbes, de carta compromiso y de contraloría
ls_rep[]={"d_gen_rep_solicitud_mat"}//,"d_gen_rep_solicitud_corresp","d_gen_rep_solicitud_carta_comp","d_gen_rep_solicitud_formato_contraloria"}

//			MATERIAL NUEVO
if cbx_materiales.checked = false then
	for llRow = 1 to dw_cap.RowCount()
		lsNoSerie = dw_cap.getitemstring(llRow,'num_serie')
		lsCveMaterial = dw_cap.getitemstring(llRow,'cvematerial')
	next
	if dw_cap.RowCount() <=  0 then
			messagebox("Atención","Falta indicar datos",exclamation!)
			return
	end if
	ll_tipo	=	dw_interesado.object.tipo_prestamo[1]
	if ll_tipo = 0 or isnull(ll_tipo) then
		messagebox("Atención","No ha indicado una cuenta válida",stopsign!)
		return
	end if
	if not wf_asigna_folio() then
		rollback using gtr_sumuia;
		messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
		return
	end if
	ll_folio	=	dw_solicitud.GetItemNumber(1,'folio')
	if dw_solicitud.update(true,false) < 0 then
		rollback using gtr_sumuia;
		messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
		return
	end if
	if dw_interesado.update(true,false)< 0 then
		rollback using gtr_sumuia;
		messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
		return
	end if
	if dw_cap.update(true,false) < 0 then
		rollback using gtr_sumuia;
		messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
		return
	end if
	//Sección para actualizar corresponsables del préstamo. Solicitado por el depto de
	//Comunicación 2008-02-25 OUP.
	if ids_Corresp.RowCount() > 0 then
		for ll_j = 1 to ids_Corresp.RowCount()
			ls_corr_n		=	ids_Corresp.GetitemString(ll_j,'solicitantenombre')
			if isnull(ls_corr_n) then
				ids_Corresp.DeleteRow(ll_j)
				ll_j --
				continue
			end if
			ids_Corresp.Setitem(ll_j,'folio',ll_folio)
			ids_Corresp.Setitem(ll_j,'cvedepto',gi_depto)
		next
		if	ids_Corresp.Update() < 0 Then
			rollback using gtr_sumuia;
			messagebox("ERROR del sistema","Error al actualizar corresponsables. Verifique!",stopsign!)
			return
		end if
	end if
			
	commit using gtr_sumuia;
	dw_interesado.ResetUpdate()
	dw_solicitud.ResetUpdate()
	dw_cap.ResetUpdate()
	messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito."+&
						"~r~nFolio Asignado: "+string(ll_folio),exclamation!)
			
	
	Res = MessageBox("Mensaje del Sistema", "¿Desea Imprimir la solicitud del material", &
															Question!, yesno!, 2)
	if Res = 1 then
		for ll_j = 1 to upperbound(ls_rep)
			dw_reporte_mat.dataobject = ls_rep[ll_j]
			if gi_depto <> 4 then dw_reporte_mat.Modify("t_39.text='"+gs_depto+"'")
			dw_reporte_mat.SettransObject(gtr_sumuia)
			dw_reporte_mat.Retrieve(gi_depto,ll_folio,gi_area)
			if dw_reporte_mat.RowCount() > 0 then dw_reporte_mat.Print()
			if gi_depto<> 4 then exit //Si el depto no es comunicación sale y no imprime los demás formatos
		next
	end if
	wf_limpia_forma()	
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
							( dbo.spre_solicitud.cvedepto = :gi_depto)
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

type cb_eliminar from commandbutton within w_gen_prestamo_mat
integer x = 3013
integer y = 2346
integer width = 278
integer height = 109
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
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

type dw_motivo from datawindow within w_gen_prestamo_mat
boolean visible = false
integer x = 3529
integer y = 3056
integer width = 69
integer height = 35
integer taborder = 100
string dataobject = "d_dw_matinsc"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_solicitud from u_dw within w_gen_prestamo_mat
integer x = 947
integer y = 192
integer width = 1942
integer height = 240
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_gen_detsolmaterial"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event pfc_postinsertrow;//////////////////////////////////////////////////////////////////////////////
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
//iiDiasPrestamo = f_calcula_diasdeprestamo(liDiasol)
liDiaHorafp = liDiaHoraip
iiDiasPrestamo = 0


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

		this.setItem(al_row,'fecha_solicitud',liDiaHora)
		this.setItem(al_row,'fecha_inicio',liDiaHoraip)
		this.setItem(al_row,'fecha_fin',liDiaHorafp)
		this.setItem(al_row,'status',0)
		this.setItem(al_row,'condicion',0)
	
		if gi_depto<>2 then
		// Inicializar los campos con la fecha actual
			dw_criterios.SetItem(1,'fechaini', liDiaHora)
			dw_criterios.SetItem(1,'fechafin', liDiaHora)
		end if
		
		end if	
		Destroy lds_DiasAd
/*
//////////////////////////////////////////////////////////////////////////////
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
			this.setItem(al_row,'fecha_solicitud',liDiaHora)
			this.setItem(al_row,'status',0)
			this.setItem(al_row,'condicion',0)
		end if	
		Destroy lds_DiasAd
		
		*/
end event

event itemerror;return 0
end event

type sle_cuenta from singlelineedit within w_gen_prestamo_mat
event activarbusq ( )
integer x = 545
integer y = 205
integer width = 333
integer height = 77
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event activarbusq();long ll_cuentab, ll_cuenta, ll_RowsPrestamo, retvalmulta, al_cuenta
string ls_digito, ls_digitov ,ls_cuenta, ls_nombre, ls_periodo
string ls_nombrecompleto
integer liCargaAdeudo, Net

n_transportar uo_parametros
	if rb_1.checked = true then
		
		if cbx_intercambio.checked =  true then
					
			ll_cuentab = long(sle_cuenta.text)
			il_cuenta = ll_cuentab
			retvalmulta = wf_valida_cuenta(ll_cuentab)
			if retvalmulta = 1 then 

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
				
				retvalmulta = wf_valida_cuenta(ll_cuentab)
			if retvalmulta = 1 then
				
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
			dw_foto.reset( )
			dw_foto.Modify ( "p_1.FileName=''" )
			messagebox("Atención","La cuenta: "+ls_cuenta+" no existe o es incorrecta ")	
		end if
		END IF
	
		
		
	else
		
			ls_cuenta=trim(sle_cuenta.text)
			il_cuenta = long(ls_cuenta)
			retvalmulta = wf_valida_cuenta(long(ls_cuenta))
			if retvalmulta = 1 then 
				
					sle_cuenta.text=""
					return
				
			end if
			uo_parametros=wf_busca_empleado(long(ls_cuenta))
			if trim(uo_parametros.is_parm1) = '' or isnull(uo_parametros.is_parm1) then
				return
			end if
			dw_interesado.setitem(1,'tipo_prestamo',3)
			dw_interesado.setitem(1,'solicitanteid',long(ls_cuenta))
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
		//nva lineaSFF 26092011
		timer(1.5)
	END IF
end if
end event

type gb_2 from groupbox within w_gen_prestamo_mat
integer x = 37
integer y = 64
integer width = 892
integer height = 333
integer taborder = 20
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

type gb_1 from groupbox within w_gen_prestamo_mat
integer x = 26
integer y = 2541
integer width = 2344
integer height = 352
integer taborder = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Actualiza estatus total por Solicitud"
end type

type dw_busqueda from datawindow within w_gen_prestamo_mat
integer x = 80
integer y = 1306
integer width = 3050
integer height = 781
integer taborder = 240
boolean titlebar = true
string dataobject = "d_gen_com_busq_disp"
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
	Reset()
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

type dw_busqueda_1 from datawindow within w_gen_prestamo_mat
integer x = 80
integer y = 1306
integer width = 3050
integer height = 781
integer taborder = 210
boolean titlebar = true
string title = "Material disponible"
string dataobject = "d_gen_matdisp"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;datetime ldFechaI, ldFechaF
integer liCveGpo, Net, lihri, lihrf, limti, limtf, li_j
long ll_nva_linea, llRowsMat, llIdSol, llRow, llTotMatFil, liTipoPrestamo
string lsNoSerie, lsCveMat, lsFilter, lsTFilter
datetime ldt_fecha_inicio,ldt_fecha_final,ldt_fecha
string ldt_fecha_inicio1,ldt_fecha_final1, ls_fnd, lsDesMat
decimal{2} ld_costom
integer	li_hrsini,li_hrsfin,li_minini,li_minfin, li_row, li_unitario, li_unitario_reserva
datetime	ldt_fecha_hora_ini,ldt_fecha_hora_fin
date 		ld_fechaini,ld_fechafin
n_cst_string	lob_tmp

if cbx_materiales.checked = true then
	dw_cap.reset()
end if

datastore ids_MatReq
ids_MatReq =  create datastore 
ids_MatReq.dataobject ='d_psi_mat_pre'
ids_MatReq.settransobject(gtr_sumuia)

//		Obtenemos Número de Folio
integer li_ren
if dw_busqueda_1.RowCount() > 0 then
	for li_ren = 1 to dw_busqueda_1.RowCount()
		if dw_busqueda_1.IsSelected(li_ren) = true then
			llFolio = dw_busqueda_1.object.spre_sol_materiales_folio[li_ren]
		end if
	next	
end if

//		criterios
dw_criterios.accepttext()

li_hrsini=dw_criterios.getitemnumber(1,'horarioini')
li_hrsfin=dw_criterios.getitemnumber(1,'horariofin')
li_minini=dw_criterios.getitemnumber(1,'minutoini')
li_minfin=dw_criterios.getitemnumber(1,'minutofin')
ld_fechaini=dw_criterios.getitemdate(1,'fechaini')
ld_fechafin=dw_criterios.getitemdate(1,'fechafin')

	
if isnull(li_hrsini) or isnull(li_hrsfin) or isnull(li_minini) or isnull(li_minfin) then
	messagebox("Mensaje del Sistema", "Debe indicar el Horario Inicial y Final",stopsign!)
	return
end if

if isnull(ld_fechaini) or isnull(ld_fechafin) then
	messagebox("Mensaje del Sistema", "Debe indicar la Fecha Inicial y Final",stopsign!)
	return
end if

if ( li_hrsini>24 or li_hrsini<1 or li_hrsfin>24 or li_hrsfin<1 ) or (li_minini>59 or li_minini<0 or li_minfin>59 or li_minfin<0) then
	messagebox("Mensaje del Sistema", "Debe indicar el horario en formato 1-24 para horas y de 0-59 para los minutos",stopsign!)
	return
end if

//VALIDA FECHA
ldt_fecha_hora_ini=datetime(ld_fechaini,time(li_hrsini,li_minini,0))
ldt_fecha_hora_fin=datetime(ld_fechafin,time(li_hrsfin,li_minfin,0))


ldFechaI=ldt_fecha_hora_ini
ldFechaF=ldt_fecha_hora_fin
integer li_dias, li_ind,i
			
if ldt_fecha_hora_fin < ldt_fecha_hora_ini then 
	return
end if
if isnull(row) then return
if row = 0 then return

/**************************************************************************************************************/
if cbx_materiales.checked = false  then
	
	// NUEVO

	lsNoSerie	=	this.getitemstring(row,'num_serie')
	lsCveMat		=	this.getitemstring(row,'cvematerial')
	liCveGpo		=	this.GetItemNumber (row,'cvegrupo')
	llIdSol			=	dw_interesado.GetItemNumber (1,'solicitanteid')
	ld_costom	=	this.GetItemDecimal(row,'costo_mat')		
	li_unitario     =  this.GetItemNumber(row,'spre_inventario_prestamo_unitario')
	lsDesMat 	=	this.getitemstring(row,'spre_materiales_descripcion')
	li_dias=daysafter(ld_fechaini,ld_fechafin)+1
		
	ldt_fecha_inicio=datetime(ld_fechaini,time(li_hrsini,li_minini,0))
	ldt_fecha_final=datetime(ld_fechafin,time(li_hrsfin,li_minfin,0))
	

	ls_fnd = "cvematerial='"+lob_tmp.of_GlobalReplace(lsCveMat,"'","~~'")+"' and num_serie='"+lob_tmp.of_GlobalReplace(lsNoSerie,"'","~~'")+"'"
	if dw_cap.find(ls_fnd, 1, dw_cap.RowCount()) > 0 then
		MessageBox("Aviso","No se puede agregar el mismo material!!!")
		return
	end if
	
	if li_unitario=1  then
		//Verificar selección actual
		ls_fnd = "cvematerial='"+lob_tmp.of_GlobalReplace(lsCveMat,"'","~~'")+"' and cvegrupo="+string(liCveGpo)+" and spre_inventario_prestamo_unitario=1"
		if dw_cap.find(ls_fnd, 1, dw_cap.RowCount()) > 0 then
			MessageBox("Aviso","Sólo puede solicitar el préstamo de uno de estos tipos de artículos a la vez.")
			return
		end if	
		
		//Verificar reservaciones anteriores
		if f_select_conteo_unitarios(gi_depto,gi_area,lsCveMat,liCveGpo,llIdSol,ldt_fecha_inicio,ldt_fecha_final)	>0 then
			MessageBox("Aviso","Sólo puede solicitar el préstamo de uno de estos tipos de artículos a la vez, usted ya tiene uno prestado.")
			return			
		end if
	end if
	

	dw_solicitud.setitem(1,'fecha_inicio',datetime(ld_fechaini, time(li_hrsini,li_minini,0)))					
	dw_solicitud.setitem(1,'fecha_fin',datetime(ld_fechafin, time(li_hrsfin,li_minfin,0)))

	//-- Se agrega
	ids_MatReq.retrieve(gi_depto, gi_area, lsCveMat, liCveGpo)
	llRowsMat =ids_MatReq.rowcount()
	if llRowsMat > 0 then															//1.2
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
			case 1
				if isvalid(ids_MatAlmn) then
					lsTFilter = "v_sce_mat_inscritas_cve_mat in ( " + lsTFilter +" )"
					ids_MatAlmn.setFilter(lsTFilter)
					ids_MatAlmn.filter()
					llTotMatFil = ids_MatAlmn.rowcount()
				else
					llTotMatFil =0
				end if
			case 2
				
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
	
				for i=1 to li_dias
					li_row = dw_cap.insertrow(0)
					
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
					dw_cap.setitem(li_row,'costo_mat',ld_costom)
					dw_cap.setitem(li_row,'spre_inventario_prestamo_unitario',li_unitario)
					dw_cap.setitem(li_row,'spre_materiales_descripcion',lsDesMat)
					ldt_fecha_inicio=datetime(relativedate(ld_fechaini,i),time(li_hrsini,li_minini,0))
//											ldt_fecha_final=datetime(relativedate(ld_fechafin,i),time(li_hrsfin,li_minfin - 1,0))
					
					
					dw_cap.scrolltorow(li_row)
				next
				i=0
			else
				/*
				Net = messagebox("Atención1","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material"	, &
						Question!, yesno!, 2)
				
				if Net = 1 then
					*/
				
					for i=1 to li_dias
						li_row = dw_cap.insertrow(0)
						
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
						dw_cap.setitem(li_row,'costo_mat',ld_costom)	
						dw_cap.setitem(li_row,'spre_inventario_prestamo_unitario',li_unitario)
						dw_cap.setitem(li_row,'spre_materiales_descripcion',lsDesMat)
						ldt_fecha_inicio=datetime(relativedate(ld_fechaini,i),time(li_hrsini,li_minini,0))
//												ldt_fecha_final=datetime(relativedate(ld_fechafin,i),time(li_hrsfin,li_minfin - 1,0))
						
					
						
						dw_cap.scrolltorow(li_row)	
					next
					i = 0
			//	end if	
			end if
		Else
			Net = messagebox("Atención","El solicitante no esta cursando ninguna materia que permita el prestamo del material~r~n¿Desea continuar con el prestamo de material"	, &
				Question!, yesno!, 2)	
			if Net = 1 then
				
				for i=1 to li_dias
					li_row =dw_cap.insertrow(0)
				
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
					dw_cap.setitem(li_row,'costo_mat',ld_costom)
					dw_cap.setitem(li_row,'spre_inventario_prestamo_unitario',li_unitario)
					dw_cap.setitem(li_row,'spre_materiales_descripcion',lsDesMat)
					ldt_fecha_inicio=datetime(relativedate(ld_fechaini,i),time(li_hrsini,li_minini,0))
					dw_cap.scrolltorow(li_row)
				next
				i= 0
			else
				sle_cuenta.text=""
				wf_limpia_forma()													
			end if	
		end if
	//Se valida 
	else 
		if dw_cap.rowcount() < (20 - liTotalMatPrestado)  then 	
			
			for i=1 to li_dias
				li_row=dw_cap.insertrow(0)
			
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
				dw_cap.setitem(li_row,'costo_mat',ld_costom)
				dw_cap.setitem(li_row,'spre_inventario_prestamo_unitario',li_unitario)
				dw_cap.setitem(li_row,'spre_materiales_descripcion',lsDesMat)
				ldt_fecha_inicio=datetime(relativedate(ld_fechaini,i),time(li_hrsini,li_minini,0))
//										ldt_fecha_final=datetime(relativedate(ld_fechaini,i),time(li_hrsfin,li_minfin - 1,0))
//										ldt_fecha_final=datetime(relativedate(ld_fechafin,i),time(li_hrsfin,li_minfin,0))
			
				
				dw_cap.scrolltorow(li_row)
			next
			i=0
		else
			/*
			Net = messagebox("Atención2","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material"	, &
					Question!, yesno!, 2)
			if Net = 1 then
			*/
				for i=1 to li_dias
					li_row=dw_cap.insertrow(0)
				
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
					dw_cap.setitem(li_row,'costo_mat',ld_costom)	
					dw_cap.setitem(li_row,'spre_inventario_prestamo_unitario',li_unitario)
					dw_cap.setitem(li_row,'spre_materiales_descripcion',lsDesMat)
					ldt_fecha_inicio=datetime(relativedate(ld_fechaini,i),time(li_hrsini,li_minini,0))
//											ldt_fecha_final=datetime(relativedate(ld_fechafin,i),time(li_hrsfin,li_minfin - 1,0))
					
			
					
					dw_cap.scrolltorow(li_row)
				next
				i=0
		//	end if			
		end if
	end if
/**************************************************************************************************************/
else	// YA EXISTE Y SE ACTUALIZA SU ESTADO
	lsNoSerie = this.getitemstring(row,'num_serie')
	lsCveMat  = this.getitemstring(row,'cvematerial')
	liCveGpo  = this.GetItemNumber(row,'cvegrupo')
	liEstatus = this.GetItemNumber(row,'status')
	lsDesMat =	this.getitemstring(row,'spre_materiales_descripcion')
	
	llIdSol= dw_interesado.GetItemNumber (1,'solicitanteid')
			
	li_dias=daysafter(ld_fechaini,ld_fechafin)+1
		
	ldt_fecha_inicio=datetime(ld_fechaini,time(li_hrsini,li_minini,0))
	ldt_fecha_final=datetime(ld_fechafin,time(li_hrsfin,li_minfin - 1,0))
	
	dw_solicitud.setitem(1,'fecha_inicio',datetime(ld_fechaini, time(li_hrsini,li_minini,0)))					
	dw_solicitud.setitem(1,'fecha_fin',datetime(ld_fechafin, time(li_hrsfin,li_minfin,0)))

	for i=1 to li_dias
		li_row=dw_cap.insertrow(0)
	
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
		dw_cap.setitem(li_row,'spre_inventario_prestamo_unitario',li_unitario)
		dw_cap.setitem(li_row,'spre_materiales_descripcion',lsDesMat)					
		ldt_fecha_inicio=datetime(relativedate(ld_fechaini,i),time(li_hrsini,li_minini,0))
		dw_cap.scrolltorow(li_row)
	next
end if


dw_cap.setfocus()
end event

event clicked;
	SelectRow(0, FALSE)
	IF row <> 0 THEN SelectRow(row, TRUE)
	this.event itemfocuschanged( row, dwo)
//
//
//if Isselected(row) then
//	SelectRow(row,false)
//else
//	SelectRow(row,true)
//end if
//
end event

event constructor;this.setTransObject(gtr_sumuia)
//this.ib_rmbmenu = FALSE
//this.of_SetRowManager(TRUE)
//this.of_SetSort(TRUE)
//this.of_SetProperty(TRUE)
//this.inv_sort.of_SetColumnHeader(TRUE)
end event

event rowfocuschanged;//if currentrow>0 then
//	selectrow(0,false)
//	selectrow(currentrow,true)
//else
//	selectrow(0,false)
//end if

//SelectRow(0, FALSE)
//IF this.row <> 0 THEN SelectRow(row, TRUE)
//this.event itemfocuschanged( row, dwo)
end event

type gb_3 from groupbox within w_gen_prestamo_mat
integer x = 18
integer y = 19
integer width = 3599
integer height = 835
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Solicitante"
end type

type gb_4 from groupbox within w_gen_prestamo_mat
integer x = 18
integer y = 861
integer width = 3599
integer height = 1629
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Material"
end type

type dw_foto from datawindow within w_gen_prestamo_mat
integer x = 2926
integer y = 160
integer width = 640
integer height = 666
boolean bringtotop = true
string title = "none"
string dataobject = "dw_foto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type oleobject_2 from oleobject within w_gen_prestamo_mat descriptor "pb_nvo" = "true" 
end type

on oleobject_2.create
call super::create
TriggerEvent( this, "constructor" )
end on

on oleobject_2.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

type oleobject_1 from oleobject within w_gen_prestamo_mat descriptor "pb_nvo" = "true" 
end type

on oleobject_1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on oleobject_1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


Start of PowerBuilder Binary Data Section : Do NOT Edit
02w_gen_prestamo_mat.bin 
2E00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000f28400a001ce3f6f00000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe000000000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000004800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000452392cff41d0a9fca59122b62b36ca4600000000f28400a001ce3f6ff28400a001ce3f6f00000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000b29300000048000800034757f20b000000200065005f00740078006e0065007800740000038e000800034757f20affffffe00065005f00740078006e006500790074000002e500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b29300000048000800034757f20b000000200065005f00740078006e0065007800740000038e000800034757f20affffffe00065005f00740078006e006500790074000002e5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000200000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12w_gen_prestamo_mat.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
