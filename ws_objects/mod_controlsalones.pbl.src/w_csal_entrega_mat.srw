$PBExportHeader$w_csal_entrega_mat.srw
$PBExportComments$Permite capturar los materiales a prestar
forward
global type w_csal_entrega_mat from w_gen_entrega_mat
end type
type cbx_perdida_mat from checkbox within w_csal_entrega_mat
end type
type em_perdida_mat from editmask within w_csal_entrega_mat
end type
type st_pesos from statictext within w_csal_entrega_mat
end type
end forward

global type w_csal_entrega_mat from w_gen_entrega_mat
cbx_perdida_mat cbx_perdida_mat
em_perdida_mat em_perdida_mat
st_pesos st_pesos
end type
global w_csal_entrega_mat w_csal_entrega_mat

type variables
long il_cuenta
end variables

forward prototypes
public subroutine wf_verifica_estatus ()
public subroutine wf_multa_x_paso_hora (long llrow)
public subroutine wf_perdidamat_elmismo_dia (integer llrow, decimal letotal)
end prototypes

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
								MessageBox('Error Insertando la multa del material: ',lsCveMat ,Exclamation!)
								Rollback Using gtr_sumuia;	
							ELSEIF ll_sqlcode = -1 THEN
								MessageBox('Error Insertando la multa del material: ',lsCveMat+'~n'+gtr_sumuia.SQLErrText,StopSign!)
								Rollback Using gtr_sumuia;	
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
				WHERE dbo.spre_multas.cvedepto =:gi_depto
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
				WHERE dbo.spre_multas.cvedepto =: gi_depto
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
					WHERE dbo.spre_materiales_multas.cvedepto = :gi_depto
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

on w_csal_entrega_mat.create
int iCurrent
call super::create
this.cbx_perdida_mat=create cbx_perdida_mat
this.em_perdida_mat=create em_perdida_mat
this.st_pesos=create st_pesos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_perdida_mat
this.Control[iCurrent+2]=this.em_perdida_mat
this.Control[iCurrent+3]=this.st_pesos
end on

on w_csal_entrega_mat.destroy
call super::destroy
destroy(this.cbx_perdida_mat)
destroy(this.em_perdida_mat)
destroy(this.st_pesos)
end on

event open;call super::open;em_perdida_mat.text = ''
em_perdida_mat.visible = false
em_perdida_mat.enabled = false
st_pesos.visible = false


This.title = 'Recepción material (Sistema de Control de Salones)'

end event

type ole_1 from w_gen_entrega_mat`ole_1 within w_csal_entrega_mat
end type

type cbx_intercambio from w_gen_entrega_mat`cbx_intercambio within w_csal_entrega_mat
end type

type st_1 from w_gen_entrega_mat`st_1 within w_csal_entrega_mat
end type

type dw_solicitud from w_gen_entrega_mat`dw_solicitud within w_csal_entrega_mat
end type

event dw_solicitud::itemchanged;integer i, Net
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

type sle_cuenta from w_gen_entrega_mat`sle_cuenta within w_csal_entrega_mat
end type

event sle_cuenta::activarbusq;
long ll_cuentab, ll_cuenta, ll_RowsPrestamo
string ls_digito, ls_digitov ,ls_cuenta, ls_nombre, ls_periodo
n_transportar uo_parametros
	if rb_1.checked = true then
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
			dw_interesado.retrieve(long(ll_cuentab),gi_depto,gi_area)
			ll_RowsPrestamo =dw_interesado.rowcount()
		else
			sle_cuenta.text=""
			messagebox("Atención","La cuenta: "+ls_cuenta+" no existe o es incorrecta ")	
		end if
		
	else	
			ls_cuenta= trim(sle_cuenta.text)
			ll_cuentab=long(trim(sle_cuenta.text))
			il_cuenta=ll_cuentab
			dw_interesado.retrieve(long(ls_cuenta),gi_depto,gi_area)
			ll_RowsPrestamo =dw_interesado.rowcount()
	end if
	if ll_RowsPrestamo >0 then
		//	Consultamos si existe amonestación 
		integer liCont
		SELECT count(*)
		into :liCont
		FROM spre_control_salones
		WHERE solicitanteid = :il_cuenta
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
		
		dw_solicitud.retrieve(long(ll_cuentab),gi_depto,gi_area)
	else
		messagebox("Atención","La cuenta: "+sle_cuenta.text+" no tiene prestamos registrados en base de datos")	
	end if
end event

type rb_2 from w_gen_entrega_mat`rb_2 within w_csal_entrega_mat
end type

type rb_1 from w_gen_entrega_mat`rb_1 within w_csal_entrega_mat
end type

type cb_cerrar from w_gen_entrega_mat`cb_cerrar within w_csal_entrega_mat
end type

type cb_actualiza from w_gen_entrega_mat`cb_actualiza within w_csal_entrega_mat
end type

event cb_actualiza::clicked;date ldFechaEntrega
integer liDiasRestraso
long llMaxFolio, llRow, llEstatus
string lsUpdate, lsTUpdate, lsCveMaterial, lsNoSerie
if dw_solicitud.update(true,false)< 0 then
	rollback using gtr_sumuia;
	messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
	return
end if
if dw_matdisp.update(true,false) < 0 then
	rollback using gtr_sumuia;
	messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
	return
end if
			
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
				dbo.spre_inventario.tiempo_prestamo=:liDiasRestraso
			WHERE ( dbo.spre_inventario.cvedepto = :gi_depto ) AND  
					( dbo.spre_inventario.cvearea = :gi_area ) AND  
					( dbo.spre_inventario.cvematerial = :lsCveMaterial ) AND  
					( dbo.spre_inventario.num_serie = :lsNoSerie ) 
			using gtr_sumuia;
			if gtr_sumuia.sqlcode < 0 then
				rollback using gtr_sumuia;
				messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
				return
			end if
	end choose						
next
commit using gtr_sumuia;
dw_solicitud.ResetUpdate()
dw_matdisp.ResetUpdate()
messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
em_perdida_mat.text = ''
em_perdida_mat.visible = false
em_perdida_mat.enabled = false
st_pesos.visible = false
cbx_perdida_mat.checked = false
wf_limpia_forma()

end event

type dw_interesado from w_gen_entrega_mat`dw_interesado within w_csal_entrega_mat
end type

type dw_matdisp from w_gen_entrega_mat`dw_matdisp within w_csal_entrega_mat
end type

event dw_matdisp::itemchanged;decimal leMontoatraso
integer i, liStatusM, Net
long llRow, llMaxFolio, llNoFolio, llGpoMat, ll_sqlcode, llMaxFolioDet
string lsNoSerie, lsCveMat
datetime ldt_actual

integer li_row, Depto,Grupo,Area
string CveMat,NumSerie

ldt_actual=DateTime(today(),now())


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
			
			if IsNull(this.GetItemDateTime(row,"spre_sol_materiales_fecha_entrega")) then this.SetItem(row,"spre_sol_materiales_fecha_entrega",ldt_actual)
			
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

type gb_1 from w_gen_entrega_mat`gb_1 within w_csal_entrega_mat
end type

type cbx_perdida_mat from checkbox within w_csal_entrega_mat
integer x = 2026
integer y = 74
integer width = 622
integer height = 74
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Perdida de Material"
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

type em_perdida_mat from editmask within w_csal_entrega_mat
integer x = 2026
integer y = 179
integer width = 344
integer height = 93
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type st_pesos from statictext within w_csal_entrega_mat
integer x = 1935
integer y = 202
integer width = 88
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "$"
alignment alignment = center!
boolean focusrectangle = false
end type

