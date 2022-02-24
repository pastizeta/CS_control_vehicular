$PBExportHeader$w_controls_entrega_mat.srw
$PBExportComments$Permite realizar la entrega de materiales
forward
global type w_controls_entrega_mat from w_sheet
end type
type ole_credencial from olecustomcontrol within w_controls_entrega_mat
end type
type st_pesos from statictext within w_controls_entrega_mat
end type
type em_perdida_mat from editmask within w_controls_entrega_mat
end type
type cbx_perdida_mat from checkbox within w_controls_entrega_mat
end type
type st_1 from statictext within w_controls_entrega_mat
end type
type cbx_intercambio from checkbox within w_controls_entrega_mat
end type
type dw_solicitud from u_dw within w_controls_entrega_mat
end type
type sle_cuenta from singlelineedit within w_controls_entrega_mat
end type
type rb_2 from radiobutton within w_controls_entrega_mat
end type
type rb_1 from radiobutton within w_controls_entrega_mat
end type
type cb_cerrar from commandbutton within w_controls_entrega_mat
end type
type cb_actualiza from commandbutton within w_controls_entrega_mat
end type
type dw_interesado from u_dw within w_controls_entrega_mat
end type
type dw_matdisp from u_dw within w_controls_entrega_mat
end type
type gb_1 from groupbox within w_controls_entrega_mat
end type
end forward

global type w_controls_entrega_mat from w_sheet
integer x = 214
integer y = 221
integer width = 3406
integer height = 2088
string title = "Recepción material"
long backcolor = 29534863
ole_credencial ole_credencial
st_pesos st_pesos
em_perdida_mat em_perdida_mat
cbx_perdida_mat cbx_perdida_mat
st_1 st_1
cbx_intercambio cbx_intercambio
dw_solicitud dw_solicitud
sle_cuenta sle_cuenta
rb_2 rb_2
rb_1 rb_1
cb_cerrar cb_cerrar
cb_actualiza cb_actualiza
dw_interesado dw_interesado
dw_matdisp dw_matdisp
gb_1 gb_1
end type
global w_controls_entrega_mat w_controls_entrega_mat

type variables
boolean sb_nuevo=false
integer ligpomat, ii_status
long  ilRowSol
n_transportar regreso
n_transportar origen
datastore ids_MatAlmn, ids_MatProf, ids_StaPrestamo

integer ii_stauts ,ii_tprestamo 
integer ii_depto, ii_area, ii_grupo
string isCveMaterial, isNoSerie 

long il_cuenta
end variables

forward prototypes
public subroutine wf_limpia_forma ()
public function n_transportar wf_busca_empleado (integer al_nomina)
public function boolean wf_cambia_estatus (long agrlfolio, long argRow)
public function string wf_busca_alumno (long al_cuenta)
public subroutine wf_verifica_estatus ()
public subroutine wf_multa_x_paso_hora (long llrow)
public subroutine wf_perdidamat_elmismo_dia (integer llrow, decimal letotal)
public function long wf_busca_cuenta (string as_nchip)
end prototypes

public subroutine wf_limpia_forma ();dw_matdisp.Reset()
dw_interesado.Reset()
dw_solicitud.Reset()

dw_interesado.triggerevent("pfc_InsertRow")

end subroutine

public function n_transportar wf_busca_empleado (integer al_nomina);string ls_nombrecompleto,ls_costo,ls_depto
n_transportar uo_salida
//ids_MatProf
	if isvalid(ids_MatProf) then
		destroy ids_MatProf
		ids_MatProf =  create datastore 
		ids_MatProf.dataobject ='d_controls_matinscp'
		ids_MatProf.settransobject(gtr_sumuia)
	else
		ids_MatProf =  create datastore 
		ids_MatProf.dataobject ='d_controls_matinscp'
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
		else
			messagebox("Mensaje del Sistema","La clave ingresada no es valida",stopsign!)
		end if			
	end if
return uo_salida
end function

public function boolean wf_cambia_estatus (long agrlfolio, long argRow);//////////////////////////////////////////////////////////////////////////
//	Function:		wf_cambia_estatus
//	Arguments:		ninguno
//	Returns:			true
//	Description:	Asigna el estatus a la solicitud, dependiendo del estatus  
//						en el que se encuentren los materiales que la compones+
//						0-Normal (Material en prestamo)
//						1-Cerrada (Material en prestamo)
//						2-Entregada parcialmente (Se entrego material, pero, otros continuan en prestamo)
//						3-Muta (Algun material no se entrego a tiempo)
//////////////////////////////////////////////////////////////////////////
long llTotStatus, llRow, llTRow, llStatus, llNoenStatus
string lsTFilter
dw_matdisp.AcceptText()

	llTRow =  dw_matdisp.RowCount()
	if llTRow > 0 then
		for llRow =3 to 0 STEP -1
			
			lsTFilter = "spre_sol_materiales_status in ( " + string(llRow) +" )"
			dw_matdisp.setFilter(lsTFilter)	
			dw_matdisp. Filter()	
			
			llNoenStatus=  dw_matdisp.FilteredCount()	
			llTotStatus= llTRow - llNoenStatus
			choose case llRow
				case 3
					if llTotStatus > 0 then 
						// Existe algun material que con multa
						dw_solicitud.setitem(argRow,'spre_solicitud_status',3)
						dw_solicitud.AcceptText()
						exit
					end if
				case 2
					if llTotStatus > 0 then
						// No entrega algun material
						dw_solicitud.setitem(argRow,'spre_solicitud_status',2)
						dw_solicitud.AcceptText()
						exit
					end if
				case 1
					if ( llTotStatus > 0) and  ( llTotStatus = llTRow ) then
						// Se entrego todo el material
						dw_solicitud.setitem(argRow,'spre_solicitud_status',1)
						dw_solicitud.AcceptText()
						exit
					end if
			end choose
		next		
	end if
lsTFilter = ""
			dw_matdisp.setFilter(lsTFilter)	
			dw_matdisp. Filter()	
return true

end function

public function string wf_busca_alumno (long al_cuenta);string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
boolean lb_error=true
if isvalid(ids_MatAlmn) then
	destroy ids_MatAlmn
	ids_MatAlmn =  create datastore 
	ids_MatAlmn.dataobject ='d_controls_matinsc'
	ids_MatAlmn.settransobject(gtr_sumuia)
else
		ids_MatAlmn =  create datastore 
		ids_MatAlmn.dataobject ='d_controls_matinsc'
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
	FROM         v_sce_alumnos INNER JOIN
                      v_sce_academicos ON v_sce_alumnos.cuenta = v_sce_academicos.cuenta INNER JOIN
                      v_sce_carreras ON v_sce_academicos.cve_carrera = v_sce_carreras.cve_carrera LEFT OUTER JOIN
                      v_sce_banderas_inscrito ON v_sce_alumnos.cuenta = v_sce_banderas_inscrito.cuenta
	   WHERE v_sce_alumnos.cuenta = :al_cuenta
 		and v_sce_carreras.cve_carrera in (select cve_carrera from v_sce_carreras  where cve_coordinacion in (select cve_coordinacion from v_sce_coordinaciones ))using gtr_sumuia;
		if gtr_sumuia.sqlcode=0 then
			//TODO OK
			if  isnull(ll_cuenta_inscrito) then
				messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
			else
				ids_MatAlmn.retrieve(ll_cuenta_inscrito)
			end if
			
		else
			messagebox("Mensaje del Sistema","Alumno NO inscrito en el area de Psicología",stopsign!)

		end if			
	end if
return ls_nombrecompleto
end function

public subroutine wf_verifica_estatus ();//////////////////////////////////////////////////////////////////////////
//	Function:		wf_verifica_estatus
//	Arguments:		ninguno
//	Returns:			true
//	Description:	Verifica el estatus del material solicitado en el caso de
//						haber un retraso asigna la multa correspondiente e inserta 
//						en la base de datos el registro. Aquí no se asigna el total 
//						días que se presto el material debido a que posible no se 
//						entregue el material
//////////////////////////////////////////////////////////////////////////
boolean 	lbRetraso = false
date 		ldFechaEntrega, ldSumDia, ldFechaEntrega_2
decimal 	leTotal, leMontoatraso, leTotMontoatraso
integer 	liDiasRestraso, liTotDiasRestraso, liDiasRestrasoT
long 		llRow=0, llMaxFolio, llNoFolio, llGpoMat, ll_sqlcode, llMaxFolioDet, llCount,llMaxid
string 	lsNoSerie, lsCveMat, lsDiaNom
setnull(llMaxFolio)	
setnull(llMaxid)
datetime ldFechaEntrega_1, ldFechaEntrega_3

if dw_matdisp.rowcount() >0 then
	
	for llRow = 1 to dw_matdisp.rowcount()
		//		Se genera multa por horas de entrega extemporanéa
		//		Obtenemos Fecha fin con minutos del prestamo
		ldFechaEntrega_1 = Datetime(dw_matdisp.GetItemDateTime(llRow,'spre_sol_materiales_fecha_final'))
		ldFechaEntrega = Date(ldFechaEntrega_1)
		//		Obtenemos Fecha de hoy sin minutos
		ldFechaEntrega_2 = date(f_fecha_hora_servidor())		
		ldFechaEntrega_3 = f_fecha_hora_servidor()
		
		if ldFechaEntrega = ldFechaEntrega_2 then
			if ldFechaEntrega_1 < f_fecha_hora_servidor() then
				//		Perdida de material - Se asigna importe por perdida.
				if cbx_perdida_mat.checked then
					leTotal = double(string(em_perdida_mat.text))
					//		Esta función se encargara de generar la multa por perdida el mismo día
					wf_perdidamat_elmismo_dia(llRow,leTotal)
					lbRetraso = false
				else
					//		Esta función se encargara de generar la multa por horas extemporáneas.
					wf_multa_x_paso_hora(llRow)
					lbRetraso = false
				end if
			end if
		else
			//		Se genera multa por dias de entrega extemporanéa
			ldFechaEntrega = Date(dw_matdisp.GetItemDateTime(llRow,'spre_sol_materiales_fecha_final'))
			liDiasRestrasoT = DaysAfter(ldFechaEntrega, today()) 
			ldSumDia = ldFechaEntrega
			liDiasRestraso = 0
			For llCount = 1 to liDiasRestrasoT 		
				lsDiaNom = DayName(ldSumDia)
				If lsDiaNom <> "Saturday" and lsDiaNom <> "Sunday" Then	
					liDiasRestraso = liDiasRestraso +1
				end if
				ldSumDia = RelativeDate(ldSumDia, 1)
			Next
			if liDiasRestraso > 0 then			
				dw_matdisp.SetItem(llRow, 'spre_sol_materiales_status', 3)	
				lbRetraso = true
				llNoFolio = dw_matdisp.getitemnumber(llRow, 'spre_sol_materiales_folio')	
				leTotal = dw_matdisp.getitemnumber(llRow, 'spre_materiales_multa')	
				liTotDiasRestraso = liTotDiasRestraso + liDiasRestraso
				leMontoatraso= (liDiasRestraso * leTotal)
				leTotMontoatraso = leTotMontoatraso + leMontoatraso
			end if
		end if
	next
		if lbRetraso then
			//		Perdida de material - Se asigna importe por perdida.
			if cbx_perdida_mat.checked then
				leTotMontoatraso = double(string(em_perdida_mat.text))
				leMontoatraso = double(string(em_perdida_mat.text))
			end if
			// 		
			
			//Se consulta si el folio tiene una multa cargada
			SELECT dbo.spre_multas.folio_multa  
				into :llMaxFolio
				FROM dbo.spre_multas  
				WHERE ( dbo.spre_multas.folio = :llNoFolio ) AND  
						( dbo.spre_multas.cvedepto = :gi_depto )  
				USING gtr_sumuia; 
				if isnull(llMaxFolio) then // No hay multa cargada se procede a preguntar
			
					integer Net, Neta
					Net = MessageBox("Información de adeudos", "La solicitud con folio: "+ string(llNoFolio)+ " presenta un adeudo de: " + String(leMontoatraso,"$#,###,##0.00") + "~n ¿Desea cargar el adeudo ahora o esperar hasta la entrega del material?", &
					Exclamation!, OKCancel!, 2)
		
					IF Net = 1 THEN // El usuario decide cargar la multa
							if isnull(llMaxFolio) then 
							//se trae el maximo folio
							SELECT max(dbo.spre_multas.folio_multa)
							into :llMaxFolio
							FROM dbo.spre_multas
							WHERE dbo.spre_multas.cvedepto = 5
							USING gtr_sumuia;		
							if isnull(llMaxFolio) then 
								llMaxFolio =1	
							ELSE
								llMaxFolio =1	+ llMaxFolio		
							end if
						
							// Se inserta la multa
							INSERT INTO dbo.spre_multas  
							( folio_multa,   
							  folio,   
							  importe,   
							  saldo,   
							  cvedepto,
							  fcaja,
							  foperacion,
							  fcorte,
							  fechacarga,
							  usuario)  
							VALUES ( :llMaxFolio,   
							  :llNoFolio,   
							  :leTotMontoatraso,   
							  :leTotMontoatraso,   
							  :gi_depto,
							  0,
							  0,
							  0,
							  getdate(),
							  :gs_usuario)
							  USING gtr_sumuia; 
							  // Se consulta maximo folio para insertar el detalles de la multa
							SELECT max(dbo.spre_materiales_multas.id_multa)
							into :llMaxFolioDet
							FROM dbo.spre_materiales_multas 
							WHERE dbo.spre_materiales_multas.cvedepto = 5
							USING gtr_sumuia;	
							if isnull(llMaxFolioDet) then 
								llMaxFolioDet =1	
							else
								llMaxFolioDet =1	+ llMaxFolioDet		
							end if 
							for llRow = 1 to dw_matdisp.rowcount()
								
								ldFechaEntrega = Date(dw_matdisp.GetItemDateTime(llRow,'spre_sol_materiales_fecha_final'))
								liDiasRestrasoT = DaysAfter(ldFechaEntrega, today()) 
								ldSumDia = ldFechaEntrega
								liDiasRestraso = 0
								For llCount = 1 to liDiasRestrasoT 		
									lsDiaNom = DayName(ldSumDia)
									If lsDiaNom <> "Saturday" and lsDiaNom <> "Sunday" Then	
										liDiasRestraso = liDiasRestraso +1
									end if
									ldSumDia = RelativeDate(ldSumDia, 1)
								Next
								
								
								if liDiasRestraso > 0 then	
									lsNoSerie = dw_matdisp.getitemstring(llRow, 'spre_sol_materiales_num_serie')
									lsCveMat = dw_matdisp.getitemstring(llRow, 'spre_sol_materiales_cvematerial')	
									llGpoMat = dw_matdisp.getitemnumber(llRow, 'spre_sol_materiales_cvegrupo')	
									leTotal = dw_matdisp.getitemnumber(llRow, 'spre_materiales_multa')	
									leMontoatraso= (liDiasRestraso * leTotal)
									//		Perdida de material - Se asigna importe por perdida.
									if cbx_perdida_mat.checked then
										leMontoatraso = double(string(em_perdida_mat.text))
									end if
									// 		
									INSERT INTO dbo.spre_materiales_multas  
										( id_multa,
											folio_multa,   
											cvedepto,   
											cvearea,   
											cvematerial,   
											cvegrupo,   
											num_serie,   
											status,   
											importe)  
									VALUES (:llMaxFolioDet, 
											:llMaxFolio,   
											:gi_depto,   
											:gi_area,   
											:lsCveMat,   
											:llGpoMat,   
											:lsNoSerie,   
											0,   
											:leMontoatraso)  
											USING gtr_sumuia;	
											
								end if
							llMaxFolioDet = llMaxFolioDet+ 1
							next
							ll_sqlcode = gtr_sumuia.SQLCode
							IF ll_sqlcode = 100 THEN
								Rollback Using gtr_sumuia;	
								MessageBox('Error Insertando la multa del material: ',lsCveMat ,Exclamation!)
							ELSEIF ll_sqlcode = -1 THEN
								Rollback Using gtr_sumuia;	
								MessageBox('Error Insertando la multa del material: ',lsCveMat+'~n'+gtr_sumuia.SQLErrText,StopSign!)
							ELSE
								Commit Using gtr_sumuia;
							END IF	
						end if
					else
						Net = MessageBox("Información de Amonestación", " ¿Desea generar registro de Amonestación?", &
						Exclamation!, OKCancel!, 2)
						
						
						IF Net = 1 THEN // El usuario decide cargar Amonestación
							//se trae el maximo folio
							SELECT max(spre_control_salones.id_control)
							into :llMaxid
							FROM spre_control_salones
							USING gtr_sumuia;		
							if isnull(llMaxid) then 
								llMaxid =1	
							ELSE
								llMaxid =1	+ llMaxid		
							end if
							
							// Se inserta la amonestación
							INSERT INTO dbo.spre_control_salones 
										( id_control,
											solicitanteid,   
											estatus,   
											fecha_generacion)  
							VALUES (:llMaxid,
										:il_cuenta,
										1, // estatus de amonestación
										getdate())  
							USING gtr_sumuia;
							IF ll_sqlcode = 100 THEN
								Rollback Using gtr_sumuia;	
								MessageBox('Error Insertando la Amonestación: ',lsCveMat ,Exclamation!)
							ELSEIF ll_sqlcode = -1 THEN
								Rollback Using gtr_sumuia;	
								MessageBox('Error Insertando la Amonestación: ',lsCveMat+'~n'+gtr_sumuia.SQLErrText,StopSign!)
							ELSE
								Commit Using gtr_sumuia;
								messagebox("Mensaje del sistema","El registro de Amonestación se actualizo con éxito",exclamation!)
							END IF	
						end if 

				end if
			end if	
		end if
end if


end subroutine

public subroutine wf_multa_x_paso_hora (long llrow);////////////////////////////////////////////////////////////////////////////
//	Function:		wf_multa_x_paso_hora
//	Arguments:		ninguno
//	Returns:			true
//	Description:		Generación de multa
//						Se genera multa si ya paso de la hora establecida para entrega 
//						del material.
//////////////////////////////////////////////////////////////////////////
boolean lbRetraso = false
decimal leTotal, leMontoatraso, leTotMontoatraso
integer liDiasRestraso
long llMaxFolio, llNoFolio, llGpoMat, ll_sqlcode, llMaxFolioDet, llCount
string lsNoSerie, lsCveMat
setnull(llMaxFolio)	

dw_matdisp.SetItem(llRow, 'spre_sol_materiales_status', 3)	
lbRetraso = true
llNoFolio = dw_matdisp.getitemnumber(llRow, 'spre_sol_materiales_folio')	
leTotal = dw_matdisp.getitemnumber(llRow, 'spre_materiales_multa')	
leMontoatraso= leTotal
leTotMontoatraso = leTotal
			
if lbRetraso then 
	//Se consulta si el folio tiene una multa cargada
	SELECT dbo.spre_multas.folio_multa  
	into :llMaxFolio
	FROM dbo.spre_multas  
	WHERE ( dbo.spre_multas.folio = :llNoFolio ) AND  
			( dbo.spre_multas.cvedepto = :gi_depto )  
	USING gtr_sumuia; 
	if isnull(llMaxFolio) then 
		// No hay multa cargada se procede a preguntar
		integer Net
		Net = MessageBox("Información de adeudos", "La solicitud con folio: "+ string(llNoFolio)+ " presenta un adeudo de: " + String(leMontoatraso,"$#,###,##0.00") + "~n ¿Desea cargar el adeudo ahora o esperar hasta la entrega del material?", &
		Exclamation!, OKCancel!, 2)
		
		IF Net = 1 THEN
			// 		El usuario decide cargar la multa 
			if isnull(llMaxFolio) then 
				//		se trae el maximo folio
				SELECT max(dbo.spre_multas.folio_multa)
				into :llMaxFolio
				FROM dbo.spre_multas
				WHERE dbo.spre_multas.cvedepto = 5
				USING gtr_sumuia;		
				if isnull(llMaxFolio) then 
					llMaxFolio =1	
				else
					llMaxFolio =1	+ llMaxFolio		
				end if
							
				// 		Se inserta la multa
				INSERT INTO dbo.spre_multas  
				( folio_multa,   
				  folio,   
				  importe,   
				  saldo,   
				  cvedepto,
				  fcaja,
				  foperacion,
				  fcorte,
				  fechacarga,
				  usuario)  
					VALUES ( :llMaxFolio,   
					 :llNoFolio,   
					 :leTotMontoatraso,   
					 :leTotMontoatraso,   
					  :gi_depto,
					  0,
					  0,
					  0,
					  getdate(),
					  :gs_usuario)
					  USING gtr_sumuia; 
								  
					// 		Se consulta maximo folio para insertar el detalles de la multa
					SELECT max(dbo.spre_materiales_multas.id_multa)
					into :llMaxFolioDet
					FROM dbo.spre_materiales_multas 
					WHERE dbo.spre_materiales_multas.cvedepto = 5
					USING gtr_sumuia;	
					if isnull(llMaxFolioDet) then 
						llMaxFolioDet =1	
					else
						llMaxFolioDet =1	+ llMaxFolioDet		
					end if 
					for llRow = 1 to dw_matdisp.rowcount()
						liDiasRestraso = 1
						if liDiasRestraso > 0 then	
							lsNoSerie = dw_matdisp.getitemstring(llRow, 'spre_sol_materiales_num_serie')
							lsCveMat = dw_matdisp.getitemstring(llRow, 'spre_sol_materiales_cvematerial')	
							llGpoMat = dw_matdisp.getitemnumber(llRow, 'spre_sol_materiales_cvegrupo')	
							leTotal = dw_matdisp.getitemnumber(llRow, 'spre_materiales_multa')	
							leMontoatraso= leTotal
									
							INSERT INTO dbo.spre_materiales_multas  
								( id_multa,
								folio_multa,   
								cvedepto,   
								cvearea,   
								cvematerial,   
								cvegrupo,   
								num_serie,   
								status,   
								importe)  
								VALUES (:llMaxFolioDet, 
								:llMaxFolio,   
								:gi_depto,   
								:gi_area,   
								:lsCveMat,   
								:llGpoMat,   
								:lsNoSerie,   
								0,   
								:leMontoatraso)  
								USING gtr_sumuia;	
												
						end if
						llMaxFolioDet = llMaxFolioDet+ 1
					next
					ll_sqlcode = gtr_sumuia.SQLCode
					IF ll_sqlcode = 100 THEN
						Rollback Using gtr_sumuia;	
						MessageBox('Error Insertando la multa del material: ',lsCveMat ,Exclamation!)
					ELSEIF ll_sqlcode = -1 THEN
						Rollback Using gtr_sumuia;	
						MessageBox('Error Insertando la multa del material: ',lsCveMat+'~n'+gtr_sumuia.SQLErrText,StopSign!)
					ELSE
						Commit Using gtr_sumuia;
					END IF	
			end if
		end if 
	end if	
end if 


end subroutine

public subroutine wf_perdidamat_elmismo_dia (integer llrow, decimal letotal);////////////////////////////////////////////////////////////////////////////
//	Function:		wf_perdidamat_elmismo_dia
//	Arguments:		ninguno
//	Returns:			true
//	Description:		Generación de multa por perdida de material el mismo día del prestamo.

//////////////////////////////////////////////////////////////////////////
boolean lbRetraso = false
integer liDiasRestraso
long llMaxFolio, llNoFolio, llGpoMat, ll_sqlcode, llMaxFolioDet
string lsNoSerie, lsCveMat
setnull(llMaxFolio)	


dw_matdisp.SetItem(llRow, 'spre_sol_materiales_status', 3)	
lbRetraso = true
llNoFolio = dw_matdisp.getitemnumber(llRow, 'spre_sol_materiales_folio')	
			
if lbRetraso then 
	//Se consulta si el folio tiene una multa cargada
	SELECT dbo.spre_multas.folio_multa  
	into :llMaxFolio
	FROM dbo.spre_multas  
	WHERE ( dbo.spre_multas.folio = :llNoFolio ) AND  
			( dbo.spre_multas.cvedepto = :gi_depto )  
	USING gtr_sumuia; 
	if isnull(llMaxFolio) then 
		// No hay multa cargada se procede a preguntar
		integer Net
		Net = MessageBox("Información de adeudos", "La solicitud con folio: "+ string(llNoFolio)+ " presenta un adeudo de: " + String(leTotal,"$#,###,##0.00") + "~n ¿Desea cargar el adeudo ahora o esperar hasta la entrega del material?", &
		Exclamation!, OKCancel!, 2)
		
		IF Net = 1 THEN
			// 		El usuario decide cargar la multa 
			if isnull(llMaxFolio) then 
				//		se trae el maximo folio
				SELECT max(dbo.spre_multas.folio_multa)
				into :llMaxFolio
				FROM dbo.spre_multas
				WHERE dbo.spre_multas.cvedepto = 5
				USING gtr_sumuia;		
				if isnull(llMaxFolio) then 
					llMaxFolio =1	
				else
					llMaxFolio =1	+ llMaxFolio		
				end if
							
				// 		Se inserta la multa
				INSERT INTO dbo.spre_multas  
				( folio_multa,   
				  folio,   
				  importe,   
				  saldo,   
				  cvedepto,
				  fcaja,
				  foperacion,
				  fcorte,
				  fechacarga,
				  usuario)  
					VALUES ( :llMaxFolio,   
					 :llNoFolio,   
					 :leTotal,   
					 :leTotal,   
					  :gi_depto,
					  0,
					  0,
					  0,
					  getdate(),
					  :gs_usuario)
					  USING gtr_sumuia; 
								  
					// 		Se consulta maximo folio para insertar el detalles de la multa
					SELECT max(dbo.spre_materiales_multas.id_multa)
					into :llMaxFolioDet
					FROM dbo.spre_materiales_multas 
					WHERE dbo.spre_materiales_multas.cvedepto = 5
					USING gtr_sumuia;	
					if isnull(llMaxFolioDet) then 
						llMaxFolioDet =1	
					else
						llMaxFolioDet =1	+ llMaxFolioDet		
					end if 
					for llRow = 1 to dw_matdisp.rowcount()
						liDiasRestraso = 1
						if liDiasRestraso > 0 then	
							lsNoSerie = dw_matdisp.getitemstring(llRow, 'spre_sol_materiales_num_serie')
							lsCveMat = dw_matdisp.getitemstring(llRow, 'spre_sol_materiales_cvematerial')	
							llGpoMat = dw_matdisp.getitemnumber(llRow, 'spre_sol_materiales_cvegrupo')	
									
							INSERT INTO dbo.spre_materiales_multas  
								( id_multa,
								folio_multa,   
								cvedepto,   
								cvearea,   
								cvematerial,   
								cvegrupo,   
								num_serie,   
								status,   
								importe)  
								VALUES (:llMaxFolioDet, 
								:llMaxFolio,   
								:gi_depto,   
								:gi_area,   
								:lsCveMat,   
								:llGpoMat,   
								:lsNoSerie,   
								0,   
								:leTotal)  
								USING gtr_sumuia;	
												
						end if
						llMaxFolioDet = llMaxFolioDet+ 1
					next
					ll_sqlcode = gtr_sumuia.SQLCode
					IF ll_sqlcode = 100 THEN
						Rollback Using gtr_sumuia;	
						MessageBox('Error Insertando la multa del material: ',lsCveMat ,Exclamation!)
					ELSEIF ll_sqlcode = -1 THEN
						Rollback Using gtr_sumuia;	
						MessageBox('Error Insertando la multa del material: ',lsCveMat+'~n'+gtr_sumuia.SQLErrText,StopSign!)
					ELSE
						Commit Using gtr_sumuia;
					END IF	
			end if
		end if 
	end if	
end if 


end subroutine

public function long wf_busca_cuenta (string as_nchip);long ll_cuenta


//PRIMERO BUSCAMOS LOS ALUMNOS
  SELECT v_sce_alumnos.cuenta  
    INTO :ll_cuenta  
    FROM v_sce_alumnos  
   WHERE v_sce_alumnos.nchip_cl = :as_nchip using gtr_sumuia  ;

	if gtr_sumuia.sqlcode<>0 then
		//BUSCAMOS EN EMPLEADOS
	    SELECT empl_uia1.empleado  
	    INTO :ll_cuenta  
	    FROM empl_uia1  
	   WHERE empl_uia1.nchip_cl = :as_nchip   using gtr_personal;	
		if gtr_personal.sqlcode<>0 then
			SELECT empl_uia2.empleado  
			INTO :ll_cuenta  
			FROM empl_uia2  
			WHERE empl_uia2.nchip_cl = :as_nchip   using gtr_personal;	
			if gtr_personal.sqlcode<>0 then
				ll_cuenta=0
			else
				rb_2.checked=true
			end if
		else
			rb_2.checked=true
		end if
	else
		rb_1.checked=true
	end if
if ll_cuenta<>0 then
	sle_cuenta.text=string(ll_cuenta)
end if
return ll_cuenta


end function

on w_controls_entrega_mat.create
int iCurrent
call super::create
this.ole_credencial=create ole_credencial
this.st_pesos=create st_pesos
this.em_perdida_mat=create em_perdida_mat
this.cbx_perdida_mat=create cbx_perdida_mat
this.st_1=create st_1
this.cbx_intercambio=create cbx_intercambio
this.dw_solicitud=create dw_solicitud
this.sle_cuenta=create sle_cuenta
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_cerrar=create cb_cerrar
this.cb_actualiza=create cb_actualiza
this.dw_interesado=create dw_interesado
this.dw_matdisp=create dw_matdisp
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_credencial
this.Control[iCurrent+2]=this.st_pesos
this.Control[iCurrent+3]=this.em_perdida_mat
this.Control[iCurrent+4]=this.cbx_perdida_mat
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cbx_intercambio
this.Control[iCurrent+7]=this.dw_solicitud
this.Control[iCurrent+8]=this.sle_cuenta
this.Control[iCurrent+9]=this.rb_2
this.Control[iCurrent+10]=this.rb_1
this.Control[iCurrent+11]=this.cb_cerrar
this.Control[iCurrent+12]=this.cb_actualiza
this.Control[iCurrent+13]=this.dw_interesado
this.Control[iCurrent+14]=this.dw_matdisp
this.Control[iCurrent+15]=this.gb_1
end on

on w_controls_entrega_mat.destroy
call super::destroy
destroy(this.ole_credencial)
destroy(this.st_pesos)
destroy(this.em_perdida_mat)
destroy(this.cbx_perdida_mat)
destroy(this.st_1)
destroy(this.cbx_intercambio)
destroy(this.dw_solicitud)
destroy(this.sle_cuenta)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_cerrar)
destroy(this.cb_actualiza)
destroy(this.dw_interesado)
destroy(this.dw_matdisp)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//	Event:			open
//	Arguments:		Ninguno
//	Returns:			pbm_open
//	Description:	Carga la forma y prepara la misma para poder realizar la
//						entrega de materiales
//////////////////////////////////////////////////////////////////////////////
x=0
y=0


// NUEVO GLO
//ole_credencial.object.tlector=gs_tlector
//ole_credencial.object.inicializa()
timer(1.5)
sle_cuenta.setfocus()
em_perdida_mat.text = ''
em_perdida_mat.visible = false
em_perdida_mat.enabled = false
st_pesos.visible = false
dw_interesado.setTransObject(gtr_sumuia)
dw_solicitud.setTransObject(gtr_sumuia)
dw_interesado.triggerevent("pfc_InsertRow")


end event

event activate;call super::activate;//////////////////////////////////////////////////////////////////////////////
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
			dw_solicitud.Retrieve(uo_parametros.il_parm1)
			dw_interesado.setitem(1,'solicitantenombre',uo_parametros.is_parm2)
			dw_interesado.setitem(1,'tipo_prestamo',uo_parametros.ii_parm2)	
		end if
		 
	end if
end if

timer(1.5)
end event

event closequery;call super::closequery;if ( dw_matdisp.modifiedcount() >0  or dw_matdisp.modifiedcount() >0 ) then
	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
		cb_actualiza.triggerevent(clicked!)
	end if
end if	

timer(1.5)
end event

event timer;call super::timer;//string nchip=""
//long ll_cuenta
//nchip=ole_credencial.object.AutorizaChip()
//if nchip<>"" then
//	//INSERTO CREDENCIAL
//	ll_cuenta=wf_busca_cuenta(nchip)
//	if ll_cuenta=0 then	
//		messagebox("Mensaje del Sistema","Credencial Inválida",stopsign!)	
//	else
//		sle_cuenta.triggerevent(modified!)
//	end if
//end if

string nchip=""
long ll_cuenta
integer li_inicializa = 0

//nchip=ole_credencial.object.AutorizaChip()

IF this.windowstate = minimized! then
	li_inicializa = ole_credencial.object.inicializa()
	timer (0)
ELSE
	li_inicializa = ole_credencial.object.inicializa()
	//messagebox("Mensaje del Sistema",li_inicializa,stopsign!)	
	if li_inicializa = 0 Then
		timer (0)
	Else
		nchip=ole_credencial.object.LeerChipcl()
		//messagebox("Mensaje del Sistema",nchip,stopsign!)	
		ole_credencial.object.quit()
		
		if nchip<>"" then
			//INSERTO CREDENCIAL
			ll_cuenta=wf_busca_cuenta(nchip)
			if ll_cuenta=0 then	
				messagebox("Mensaje del Sistema","Credencial Inválida",stopsign!)	
			else
				sle_cuenta.triggerevent(modified!)
			end if
		end if	
	End if
END IF


end event

event deactivate;call super::deactivate;timer(0)
end event

type ole_credencial from olecustomcontrol within w_controls_entrega_mat
boolean visible = false
integer x = 78
integer y = 56
integer width = 1047
integer height = 136
integer taborder = 10
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_controls_entrega_mat.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_pesos from statictext within w_controls_entrega_mat
integer x = 1970
integer y = 396
integer width = 46
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "$"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_perdida_mat from editmask within w_controls_entrega_mat
integer x = 2043
integer y = 384
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type cbx_perdida_mat from checkbox within w_controls_entrega_mat
integer x = 1970
integer y = 284
integer width = 635
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 29534863
string text = "Perdida de material"
end type

event clicked;if this.checked then
	em_perdida_mat.visible = true
	em_perdida_mat.enabled = true
	st_pesos.visible = true
	setfocus(em_perdida_mat)
else
	em_perdida_mat.text = ''
	em_perdida_mat.visible = false
	em_perdida_mat.enabled = false
	st_pesos.visible = false
end if
end event

type st_1 from statictext within w_controls_entrega_mat
integer x = 2629
integer y = 28
integer width = 681
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 134217857
long backcolor = 29534863
string text = "Control de Salones"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_intercambio from checkbox within w_controls_entrega_mat
integer x = 101
integer y = 376
integer width = 398
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
boolean righttoleft = true
end type

event clicked;sle_cuenta.setfocus()
end event

type dw_solicitud from u_dw within w_controls_entrega_mat
integer x = 91
integer y = 1056
integer width = 2002
integer height = 356
integer taborder = 30
string dataobject = "d_controls_sol_act"
boolean border = false
end type

event rowfocuschanged;call super::rowfocuschanged;long llFolio
string lsCveMat

if currentrow >0 then
	
	selectrow(0,false)
	selectrow(currentrow,true)
	dw_matdisp.Reset()
	llFolio = dw_solicitud.getitemnumber(  currentrow, 'spre_solicitud_folio')	
	ii_status= dw_solicitud.getitemnumber(  currentrow, 'spre_solicitud_status')
	ilRowSol = currentrow
	IF dw_matdisp.Retrieve(gi_depto,gi_area,llFolio) = -1 THEN
		MessageBox("Error","Se encontro un error al consultar el material")
	ELSE
		wf_verifica_estatus()
		wf_cambia_estatus(llFolio, currentrow)
		
	END IF
else
	selectrow(0,false)
end if
end event

event itemchanged;call super::itemchanged;integer i, Net
integer Depto,Grupo,Area
string CveMat, NumSerie
if dwo.name='spre_solicitud_status' then
	CHOOSE CASE long(data)
		CASE 1
			Net = MessageBox("Mensaje del sistema ","Se cambiara el estatus a los materiales incluidos en la solicitud.~n ¿Desea continuar?", &
							Question!, yesno!, 2)
			if Net = 1 then				
				for i=1 to dw_matdisp.rowcount()
					if dw_matdisp.getitemnumber(i,'spre_sol_materiales_status') <> 1 then dw_matdisp.setitem(i,'spre_sol_materiales_status',1)
					// 	Se agrega este codigo para actualizar el status del material al ser
					//		actualizado el status a "entregado"
						Depto = dw_matdisp.getItemNumber(i, 'spre_sol_materiales_cvedepto')
						Area 	= dw_matdisp.getItemNumber(i, 'spre_sol_materiales_cvearea')
						CveMat = dw_matdisp.getItemString(i, 'spre_sol_materiales_cvematerial')
						Grupo  = dw_matdisp.getItemNumber(i, 'spre_sol_materiales_cvegrupo')
						NumSerie = dw_matdisp.getItemString(i, 'spre_sol_materiales_num_serie')
						UPDATE dbo.spre_inventario  
						SET dbo.spre_inventario.stauts = 1 
						WHERE ( dbo.spre_inventario.cvedepto = :Depto ) AND  
								( dbo.spre_inventario.cvearea = :Area ) AND  
								( dbo.spre_inventario.cvematerial = :CveMat ) AND 
								( dbo.spre_inventario.cvegrupo = :Grupo ) AND
								( dbo.spre_inventario.num_serie = :NumSerie ) 
						using gtr_sumuia;
						commit using gtr_sumuia;
					// -----
					
				next	
			end if
					
	END CHOOSE
end if
end event

type sle_cuenta from singlelineedit within w_controls_entrega_mat
event activarbusq ( )
integer x = 389
integer y = 284
integer width = 306
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

event activarbusq();long 		ll_cuentab, ll_cuenta, ll_RowsPrestamo
string 	ls_digito, ls_digitov ,ls_cuenta, ls_nombre, ls_periodo
n_transportar uo_parametros

	if rb_1.checked = true then
		// 	Se agrega Nov 2005.
		if cbx_intercambio.checked =  true then
			
			ll_cuentab = long(sle_cuenta.text)
			il_cuenta = ll_cuentab
			dw_interesado.retrieve(il_cuenta)
			ll_RowsPrestamo =dw_interesado.rowcount()
	
		//
		elseif match(trim(sle_cuenta.text),'-')= true then
			ls_cuenta= trim(sle_cuenta.text)
			il_cuenta = long(ls_cuenta)
		else
			ll_cuentab = long(sle_cuenta.text)
			il_cuenta = ll_cuentab
		end if
		il_cuenta = ll_cuentab
		if ls_digito =ls_digitov then
			dw_interesado.retrieve(long(ll_cuentab))
			ll_RowsPrestamo =dw_interesado.rowcount()
		else
			sle_cuenta.text=""
			messagebox("Atención","La cuenta: "+ls_cuenta+" no existe o es incorrecta ")	
		end if
		
	else	
			ls_cuenta= trim(sle_cuenta.text)
			ll_cuentab=long(ls_cuenta)
			il_cuenta = ll_cuentab
			dw_interesado.retrieve(long(ls_cuenta))
			ll_RowsPrestamo =dw_interesado.rowcount()
	end if
	if ll_RowsPrestamo >0 then
		//		Consultamos si existe amonestación 
		integer liCont
		SELECT count(*)
		into :liCont
		FROM spre_control_salones
		WHERE solicitanteid = :ll_cuentab
		USING gtr_sumuia;		
		if isnull(liCont)  or liCont= 0 then 
			//	No tiene Amonestaciones	
		else
			if liCont=1 then
				messagebox("Atención existe Amonestación","La cuenta presenta : "+ string(liCont) +" Amonestación")	
			elseif liCont > 1 then
				messagebox("Atención existe Amonestación","La cuenta presenta : "+ string(liCont) +" Amonestaciones")		
			end if
		end if
		
		dw_solicitud.retrieve(long(ll_cuentab))		
	else
		messagebox("Atención","La cuenta: "+sle_cuenta.text+" no tiene prestamos registrados en base de datos")	
	end if
end event

event modified;if trim(sle_cuenta.text) <>"" then 
	wf_limpia_forma()
	setpointer(Hourglass!)
	sle_cuenta.triggerevent( "activarbusq")
	setpointer(Arrow!)		

end if
end event

type rb_2 from radiobutton within w_controls_entrega_mat
integer x = 101
integer y = 520
integer width = 361
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

event clicked;cbx_intercambio.checked = false
cbx_intercambio.visible = false
sle_cuenta.text = ""
sle_cuenta.setfocus()
dw_interesado.reset()
dw_solicitud.reset()
dw_matdisp.reset()

end event

type rb_1 from radiobutton within w_controls_entrega_mat
integer x = 101
integer y = 292
integer width = 361
integer height = 60
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

event clicked;cbx_intercambio.visible = true
sle_cuenta.text = ""
sle_cuenta.setfocus()
dw_interesado.reset()
dw_solicitud.reset()
dw_matdisp.reset()

end event

type cb_cerrar from commandbutton within w_controls_entrega_mat
integer x = 2843
integer y = 1820
integer width = 320
integer height = 104
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Salir"
end type

event clicked;close(parent)
end event

type cb_actualiza from commandbutton within w_controls_entrega_mat
integer x = 2459
integer y = 1820
integer width = 320
integer height = 104
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Actualizar"
end type

event clicked;date ldFechaEntrega
integer liDiasRestraso
long llMaxFolio, llRow, llEstatus
string lsUpdate, lsTUpdate, lsCveMaterial, lsNoSerie= ''


		if dw_solicitud.update()>0 then
			commit using gtr_sumuia;
			if dw_matdisp.update()>0 then
				commit using gtr_sumuia;
					for llRow = 1 to dw_matdisp.RowCount()
						lsNoSerie = dw_matdisp.getitemstring(llRow,'spre_sol_materiales_num_serie')
						lsCveMaterial = dw_matdisp.getitemstring(llRow,'spre_sol_materiales_cvematerial')
						llEstatus = dw_matdisp.getitemnumber(llRow,'spre_sol_materiales_status')
						ldFechaEntrega = Date(dw_matdisp.GetItemDateTime(llRow,'spre_sol_materiales_fecha_inicio'))
						choose case llEstatus
							case 1
								liDiasRestraso = DaysAfter(ldFechaEntrega, today()) 
								UPDATE dbo.spre_inventario  
								SET dbo.spre_inventario.stauts = :llEstatus,
									dbo.spre_inventario.tiempo_prestamo= dbo.spre_inventario.tiempo_prestamo + :liDiasRestraso
								WHERE ( dbo.spre_inventario.cvedepto = :gi_depto ) AND  
										( dbo.spre_inventario.cvearea = :gi_area ) AND  
										( dbo.spre_inventario.cvematerial = :lsCveMaterial ) AND  
										( dbo.spre_inventario.num_serie = :lsNoSerie ) 
								using gtr_sumuia;
								commit using gtr_sumuia;
						end choose						
					next
					
					if IsNoSerie <> '' then
						IF gtr_sumuia.SQLDBCode = 0  Then	
						
							commit using gtr_sumuia;
							messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
							em_perdida_mat.text = ''
							em_perdida_mat.visible = false
							em_perdida_mat.enabled = false
							st_pesos.visible = false
							cbx_perdida_mat.checked = false
							wf_limpia_forma()
						Else
							messagebox("ATENCIÓN","Problemas al actualizar multas " + gtr_sumuia.SQLErrText ) 
							rollback Using gtr_sumuia;
						
						End if
					else
						messagebox("Atención", "Falta indicar datos")
					end if
					
					
				else
					rollback using gtr_sumuia;
					messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
				end if
			else
				rollback using gtr_sumuia;
				messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
			end if
	
end event

type dw_interesado from u_dw within w_controls_entrega_mat
integer x = 105
integer y = 628
integer width = 2597
integer height = 392
integer taborder = 30
string dataobject = "d_controls_info_sol"
boolean border = false
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////////
//	Description:	Permite realizar la carga mediante la consulta de la  
//						credencial, para lo cual llama a la ventana w_psi_busqueda_uia
//////////////////////////////////////////////////////////////////////////////
//if dwo.name='solicitanteid' then
//	openwithparm(w_psi_busqueda_uia,string(dwo.name))
//	
//end if
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//	Description:	Llama a las funnciones wf_busca_alumno, wf_busca_empleado,
//						solo cuando se modifico la calve del solicitante
//////////////////////////////////////////////////////////////////////////////
n_transportar uo_parametros
CHOOSE CASE dwo.name
	CASE 'solicitanteid'
		CHOOSE CASE this.getitemnumber(1,'tipo_prestamo')
			CASE 1,2
				this.setitem(1,'solicitantenombre',wf_busca_alumno(long(data)))
			
			CASE 3
				uo_parametros=wf_busca_empleado(long(data))
				this.setitem(1,'solicitantenombre',uo_parametros.is_parm1)
				
		END CHOOSE


END CHOOSE
end event

type dw_matdisp from u_dw within w_controls_entrega_mat
integer x = 91
integer y = 1464
integer width = 3214
integer height = 268
integer taborder = 20
string dataobject = "d_controls_mat_prestado"
boolean border = false
end type

event clicked;call super::clicked;
if this.isselected( row) = true then 
 this.selectrow( row,false) 
else
 this.selectrow( row,true) 
end if
ii_status=this.getitemnumber(1,'spre_sol_materiales_status')

ii_depto		= this.getitemnumber(1,'spre_sol_materiales_cvedepto')
ii_area		= this.getitemnumber(1,'spre_sol_materiales_cvearea')
isCveMaterial 	= this.getitemstring(1,'spre_sol_materiales_cvematerial')
ii_grupo 	= this.getitemnumber(1,'spre_sol_materiales_cvegrupo')
isNoSerie 	= this.getitemstring(1,'spre_sol_materiales_num_serie')
end event

event constructor;call super::constructor;this.setTransObject(gtr_sumuia)
this.ib_rmbmenu = FALSE
this.of_SetRowManager(TRUE)
this.of_SetSort(TRUE)
this.of_SetProperty(TRUE)
this.inv_sort.of_SetColumnHeader(TRUE)
end event

event itemchanged;call super::itemchanged;decimal leMontoatraso
integer i, liStatusM, Net
long llRow, llMaxFolio, llNoFolio, llGpoMat, ll_sqlcode, llMaxFolioDet
string lsNoSerie, lsCveMat

integer li_row, Depto,Grupo,Area
string CveMat,NumSerie



//ldFechaEntrega = Date(dw_matdisp.GetItemDateTime(llRow,'spre_sol_materiales_fecha_final'))
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
//			leTotal = dw_matdisp.getitemnumber(llRow, 'spre_materiales_multa')	
//			liTotDiasRestraso = liTotDiasRestraso + liDiasRestraso
//			leMontoatraso= (liDiasRestraso * leTotal)
//			leTotMontoatraso = leTotMontoatraso + leMontoatraso
//		end if

if dwo.name='spre_sol_materiales_status' then
	CHOOSE CASE long(data)
		CASE 1 // Selecciona entregado
			CHOOSE CASE ii_status
				
				CASE 3	//Tenia multa, para permitir la entrega se valida el estatus de la multa en caso de que no se haya pagado se entrega y avisa al usuario
					lsNoSerie = dw_matdisp.getitemstring(row, 'spre_sol_materiales_num_serie')
					lsCveMat = dw_matdisp.getitemstring(row, 'spre_sol_materiales_cvematerial')	
					llGpoMat = dw_matdisp.getitemnumber(row, 'spre_sol_materiales_cvegrupo')	
						SELECT dbo.spre_materiales_multas.status,   
								dbo.spre_materiales_multas.importe  
						INTO  :liStatusM,
								:leMontoatraso
						FROM dbo.spre_materiales_multas  
						WHERE ( dbo.spre_materiales_multas.cvedepto = :gi_depto ) AND  
								( dbo.spre_materiales_multas.cvearea = :gi_area ) AND  
								( dbo.spre_materiales_multas.cvegrupo = :llGpoMat  ) AND  
								( dbo.spre_materiales_multas.cvematerial =:lsCveMat  ) AND  
								( dbo.spre_materiales_multas.num_serie =:lsNoSerie  ) 
						USING gtr_sumuia;
					if liStatusM = 0 then Net = MessageBox("Mensaje del sistema ","El material seleccionado tiene una multa generada por: " + string(leMontoatraso, "$#,##0") +"~n y no la pagado ¿Desea continuar?", &
							Exclamation!, OKCancel!, 2)

						IF Net = 1 THEN
						
						  this.setitem(row,'spre_sol_materiales_status',1)
						
						ELSE
						
						 this.setitem(row,'spre_sol_materiales_status',3)
						
						END IF
					
			END CHOOSE		
					
	END CHOOSE
end if
end event

type gb_1 from groupbox within w_controls_entrega_mat
integer x = 55
integer y = 212
integer width = 2715
integer height = 836
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Consultar"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
07w_controls_entrega_mat.bin 
2B00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003a610ca001cc09ae00000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe000000000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000004800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000452392cff41d0a9fca59122b62b36ca46000000003a610ca001cc09ae3a610ca001cc09ae00000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
26ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000b29300000048000800034757f20b000000200065005f00740078006e006500780074000017ab000800034757f20affffffe00065005f00740078006e0065007900740000038400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b29300000048000800034757f20b000000200065005f00740078006e006500780074000017ab000800034757f20affffffe00065005f00740078006e00650079007400000384000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000200000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17w_controls_entrega_mat.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
