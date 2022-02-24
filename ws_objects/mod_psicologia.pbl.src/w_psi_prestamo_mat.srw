$PBExportHeader$w_psi_prestamo_mat.srw
$PBExportComments$Permite capturar los materiales a prestar
forward
global type w_psi_prestamo_mat from w_gen_prestamo_mat
end type
type dw_presolicitud from datawindow within w_psi_prestamo_mat
end type
type st_3 from statictext within w_psi_prestamo_mat
end type
end forward

global type w_psi_prestamo_mat from w_gen_prestamo_mat
integer width = 3760
integer height = 3158
dw_presolicitud dw_presolicitud
st_3 st_3
end type
global w_psi_prestamo_mat w_psi_prestamo_mat

type variables
integer ii_folio_presolici, ii_cvedepto_ren, ii_cvearea_ren, ii_folio_presol_ren, ii_solicitantesid_ren
string is_carrera
n_transportar regreso_ren
long il_modo_renovacion
datetime idt_fecha_hoy

integer il_tipo_usuario=1

integer ii_presolicitud=0
end variables

forward prototypes
public function string wf_busca_alumno (long al_cuenta)
public function string wf_busca_alumno_dca (long al_cuenta)
public function integer wf_actualiza_inventario ()
public function string wf_busca_alumno_dca1 (long al_cuenta)
public function integer wf_valida_existe_presolicitud (integer ai_cvedepto, integer ai_cvearea, long al_solicitanteid)
public function integer wf_valida_materiales (long ll_folio_presolici)
public subroutine wf_carga_presolicitud (long al_cuenta)
public subroutine wf_abre_ventana_presolici (integer ai_cvedepto, integer ai_cvearea, long al_solicitanteid)
public function integer wf_aplica_renovacion (integer ar_cvedepto, integer ar_foliopresol)
public function integer wf_status_pm_inv (string as_serie, string as_material, integer ai_grupo, ref integer ai_tiempoprestamo)
public function integer wf_valida_prestamo_mio (integer pi_cvegrupo, string ps_cvematerial, string ps_num_serie)
end prototypes

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

public function integer wf_actualiza_inventario ();integer li_row, li_diasprestamo = 0, listatus, liCveGrupo, li_mio
long llMaxFolio, llRow
string lsUpdate, lsTUpdate, lsCveMaterial, lsNoSerie

for llRow = 1 to dw_cap.RowCount()
	lsNoSerie = dw_cap.getitemstring(llRow,'num_serie')
	lsCveMaterial = dw_cap.getitemstring(llRow,'cvematerial')
	liCveGrupo = dw_cap.getitemnumber(llRow,'cvegrupo')
///next
						
	listatus = wf_status_pm_inv (lsNoSerie,lsCveMaterial,liCveGrupo, iiDiasPrestamo)


	if listatus = 1 then
//		if wf_asigna_folio() = true then
//			if dw_solicitud.update()>0 then
//				commit using gtr_sumuia;
//				if dw_interesado.update()>0 then
//					commit using gtr_sumuia;
//					if dw_cap.update()>0 then
//						commit using gtr_sumuia;

//						for llRow = 1 to dw_cap.RowCount()
//							lsNoSerie = dw_cap.getitemstring(llRow,'num_serie')
//							lsCveMaterial = dw_cap.getitemstring(llRow,'cvematerial')

							UPDATE dbo.spre_inventario  
							SET dbo.spre_inventario.stauts = 2//,dbo.spre_inventario.tiempo_prestamo = :iiDiasPrestamo  
							WHERE ( dbo.spre_inventario.cvedepto = :gi_depto ) AND  
									( dbo.spre_inventario.cvearea = :gi_area ) AND  
									( dbo.spre_inventario.cvematerial = :lsCveMaterial ) AND  
									( dbo.spre_inventario.num_serie = :lsNoSerie ) AND
									( dbo.spre_inventario.cvegrupo = :liCveGrupo )
									
							using gtr_sumuia;
//						next
//						commit using gtr_sumuia;
//						messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
//						sle_cuenta.text=""
//						wf_limpia_forma()


//					else
//						rollback using gtr_sumuia;
//					messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
//					end if
//				else
//					rollback using gtr_sumuia;
//					messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
//				end if
//			else
//				rollback using gtr_sumuia;
//				messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
//			end if
//		else
//			rollback using gtr_sumuia;
//			messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
//		end if
	elseif listatus = 2 and dw_cap.RowCount() > 0 then
		//Verificar si me lo prestaron a mí y si hoy vence mi préstamo
		li_mio = wf_valida_prestamo_mio(liCveGrupo,lsCveMaterial,lsNoSerie)
		if li_mio=0 then
			messagebox("Atención","El material se encuentra en prestamo",exclamation!)
			rollback using gtr_sumuia;
			return -1
			EXIT
		end if
	elseif (listatus <> 1) and (listatus <> 2) and dw_cap.RowCount() > 0 then
		rollback using gtr_sumuia;		
		messagebox("Atención","La Serie indicada del Material no existe",exclamation!)
		return -1
		EXIT
	else
		rollback using gtr_sumuia;		
		messagebox("Atención","Falta indicar datos",exclamation!)
		return -1
		EXIT
	end if

NEXT

//commit using gtr_sumuia;
//						messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
//						sle_cuenta.text=""
//						wf_limpia_forma()	
//						
						
	
RETURN 0
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

public function integer wf_valida_existe_presolicitud (integer ai_cvedepto, integer ai_cvearea, long al_solicitanteid);integer li_registros
string ls_fecha

ls_fecha = String(idt_fecha_hoy, "yyyymmdd")

SELECT IsNull(count(*), 0)
   INTO :li_registros
  FROM spre_pre_solicitud
 WHERE cvedepto =:ai_cvedepto
     AND cvearea =:ai_cvearea
     AND solicitanteid =:al_solicitanteid
     AND status = 0
//	 AND convert(varchar(08), fecha_solicitud,112)  =  :ls_fecha
	 AND convert(varchar(08), fecha_inicio,112)  =  :ls_fecha
  USING gtr_sumuia;
  
If IsNull(li_registros) Then
	li_registros = 0
End If

RETURN  li_registros
end function

public function integer wf_valida_materiales (long ll_folio_presolici);integer li_resultado, li_req_firma, li_records, li_row
//variables de materiales
integer li_cvearea, li_cvegrupo
string ls_cvematerial, ls_num_serie
long ll_found, ll_nbr
datetime ld_fecha_ini, ld_fecha_fin
long ll_hora1, ll_minuto1, ll_hora2, ll_minuto2, ll_tot_min_ini, ll_tot_min_fin, ll_dias_diferencia, ll_tipo_prestamo_solici

li_resultado = 0
dw_cap.accepttext( )
	
li_records = dw_cap.rowcount()
If  li_records > 0 Then
	li_row = 1

	//Calcular el tiempo del prestamo
	ld_fecha_ini = dw_cap.getitemdatetime( li_row, "fecha_inicio")
	ld_fecha_fin = dw_cap.getitemdatetime( li_row, "fecha_final")
	ll_hora1 = Hour(Time(ld_fecha_ini))
	ll_minuto1 = Minute(Time(ld_fecha_ini))
	ll_hora2 = Hour(Time(ld_fecha_fin))
	ll_minuto2 = Minute(Time(ld_fecha_fin))
	
	ll_tipo_prestamo_solici = 0
	//Obtenemos los días de diferencia entre una fecha inicial y la final
	ll_dias_diferencia = DaysAfter(Date(ld_fecha_ini), Date(ld_fecha_fin))
	
	If  ll_dias_diferencia = 0 Then
		//Mismo día (Obtenemos los minutos totales del prestamo)
		ll_tot_min_ini = (ll_hora1 * 60) + ll_minuto1
		ll_tot_min_fin = (ll_hora2 * 60) + ll_minuto2
		
		If ( ll_tot_min_fin - ll_tot_min_ini ) > 180 Then
			ll_tipo_prestamo_solici = 1   //Tipo de Prestamo de la Solicitud es mayor a 3 Horas
		End If
	Else
		If ll_dias_diferencia >= 1 Then
			ll_tipo_prestamo_solici = 2   //Tipo de Prestamo de la Solicitud es mayor a 1 día
		End If
		
	End If

	If ( ll_tipo_prestamo_solici > 0 ) Then
		DO WHILE li_row <= li_records
				
				//Obtenemos los valores de los materiales del inventario
				li_cvearea = dw_cap.getitemnumber(li_row, "cvearea")
				li_cvegrupo = dw_cap.getitemnumber(li_row, "cvegrupo")
				ls_cvematerial = dw_cap.getitemstring(li_row, "cvematerial")
				ls_num_serie = dw_cap.getitemstring(li_row, "num_serie")
	
				//Valida si el material requiere firma y de que tipo...
				SELECT IsNull(req_firma, 0)
					 INTO :li_req_firma
				  FROM spre_inventario
				WHERE spre_inventario.cvedepto = :gi_depto
					AND spre_inventario.cvearea = :li_cvearea
					AND spre_inventario.cvematerial = :ls_cvematerial
					AND spre_inventario.cvegrupo = :li_cvegrupo
					AND spre_inventario.num_serie = :ls_num_serie
					AND spre_inventario.stauts = 1
					USING gtr_sumuia;
/*No se ocupa para este modulo de psicología */
				//Si la solicitud tiene un prestamo mayor a un día y en el inventario se tiene autorización de mas de 3 horas en el mismo día para dicho material
//				If ( ll_tipo_prestamo_solici = 2 ) and ( li_req_firma =  1 ) Then
//					Messagebox("Mensaje", "Este material requiere una autorización por el tiempo del préstamo solicitado...Num.Serie: " + ls_num_serie, StopSign!)
//					li_resultado = -1
//					EXIT
//				End If
//				
				//En caso de que si requiera firma
				If ( li_req_firma > 0 ) Then
					//Verificar que si se encuentra en la presolicitud
					If ( ll_folio_presolici > 0 ) Then
			 
						//buscamos el registro en los materiales de la presolicitud
						ll_nbr = dw_presolicitud.rowcount( )
						If ll_nbr > 0 Then
							ll_found = dw_presolicitud.find(  "num_serie = '" + ls_num_serie + "'" + " and cvegrupo = " + string(li_cvegrupo) + " and cvematerial = '" + ls_cvematerial + "'", 1, ll_nbr)
							If ll_found <= 0 Then
								Messagebox("Mensaje", "El material requiere autorización, debe anexarlo desde la presolicitud...Num.Serie: " + ls_num_serie, StopSign!)
								li_resultado = -1
								EXIT
							End If
						Else
							Messagebox("Mensaje", "El material requiere autorización debe solicitarlo por medio de una presolicitud...Num. Serie: " + ls_num_serie, StopSign!)
							li_resultado = -1
							EXIT
						End If
					Else
						Messagebox("Mensaje", "El material requiere autorización, debe anexarlo desde la presolicitud...Num.Serie: " + ls_num_serie, StopSign!)
						li_resultado = -1
						EXIT
					End If
				End If
			li_row = li_row + 1
		LOOP
	End If
End If

Return li_resultado
end function

public subroutine wf_carga_presolicitud (long al_cuenta);//////////////////////////////////////////////////////////////////////////////
//	Description:	Permite cargar la información de la presolicitud 
//////////////////////////////////////////////////////////////////////////////
string columna, ls_nulo, ls_desmat
long /*cuenta, */  ll_hora1, ll_minuto1, ll_hora2, ll_minuto2
integer li_param=0 ,li_cve_empresa,li_tipo, li_records, li_row, li_fecha_band
datetime ld_date, ld_fecha_inicio, ld_fecha_fin

//variables de materiales
integer li_cvearea, li_cvegrupo
string ls_cvematerial, ls_num_serie
long ll_found, ll_nbr


SetNull(ls_nulo)

dw_presolicitud.settransobject( gtr_sumuia)
dw_presolicitud.retrieve(gi_depto, gi_area, al_cuenta, ii_folio_presolici)
li_records = dw_presolicitud.rowcount()

If  li_records > 0 Then
	
	ii_presolicitud=1
	li_row = 1
	
	DO WHILE li_row <= li_records
		If 	dw_presolicitud.getitemnumber(li_row, "folio") = ii_folio_presolici Then
			// Asigna las fechas de inicio y fin
			If li_fecha_band = 0 Then
				ld_fecha_inicio = dw_presolicitud.getitemdatetime( li_row, "fecha_inicio")
				ld_fecha_fin = dw_presolicitud.getitemdatetime( li_row, "fecha_fin" )
				ll_hora1 = Hour(Time(ld_fecha_inicio))
				ll_minuto1 = Minute(Time(ld_fecha_inicio))
				ll_hora2 = Hour(Time(ld_fecha_fin))
				ll_minuto2 = Minute(Time(ld_fecha_fin))
				
				//Asigna fecha y hora inicial
				dw_criterios.setitem(dw_criterios.getrow(), "fechaini", ld_fecha_inicio)   
				dw_criterios.setitem(dw_criterios.getrow(), "horarioini", ll_hora1)   
				dw_criterios.setitem(dw_criterios.getrow(), "minutoini", ll_minuto1)   
				//Asigna fecha y hora final
				dw_criterios.setitem(dw_criterios.getrow(), "fechafin", ld_fecha_fin)   
				dw_criterios.setitem(dw_criterios.getrow(), "horariofin", ll_hora2)   
				dw_criterios.setitem(dw_criterios.getrow(), "minutofin", ll_minuto2)   
				
				dw_solicitud.setitem(dw_solicitud.getrow(), "fecha_inicio", ld_fecha_inicio)
				dw_solicitud.setitem(dw_solicitud.getrow(), "fecha_fin", ld_fecha_fin)
				
				cb_buscar.event clicked( )
				li_fecha_band = 1 
			End If
			
			//Obtenemos los valores de los materiales del inventario
			li_cvearea = dw_presolicitud.getitemnumber(li_row, "cvearea")
			li_cvegrupo = dw_presolicitud.getitemnumber(li_row, "cvegrupo")
			ls_cvematerial = dw_presolicitud.getitemstring(li_row, "cvematerial")
			ls_num_serie = dw_presolicitud.getitemstring(li_row, "num_serie")
			ls_desmat = dw_presolicitud.getitemstring(li_row,"descripcion")
			
			//buscamos el registro
			ll_nbr = dw_busqueda_1.rowcount( )
			ll_found = dw_busqueda_1.find(  "num_serie = '" + ls_num_serie + "'" + " and cvegrupo = " + string(li_cvegrupo) + " and cvematerial = '" + ls_cvematerial + "'", 1, ll_nbr)
			
			if ll_found =0 then
				messagebox('Aviso','El material '+ls_desmat+' ['+ls_num_serie+'] ya no se encuentra disponible.')
			end if
			
			dw_busqueda_1.event doubleclicked( 0 , 0,ll_found, dw_busqueda_1.object)
		End If
		li_row = li_row + 1
	LOOP
	
	ii_presolicitud=0
	dw_busqueda_1.dataobject='d_gen_matdisp'
	dw_busqueda_1.settransobject(gtr_sumuia)
	dw_busqueda_1.reset()
	
else
	messagebox('Aviso', 'El material que desea confirmar ya no se encuentra disponible para su préstamo.')
End If


end subroutine

public subroutine wf_abre_ventana_presolici (integer ai_cvedepto, integer ai_cvearea, long al_solicitanteid);//////////////////////////////////////////////////////////////////////////////
//	Description:	Permite cargar la información relacionada a la clave del, 
//						solicitante, nombre, grupo, y nombre del profesor en el caso 
//						de que el solicitante sea un alumno
//////////////////////////////////////////////////////////////////////////////
string nombre,apat,amat,columna, data, verifica, ls_prepa, lstipo
long cuenta
integer li_param=0 ,li_cve_empresa,li_tipo
datetime ld_date


//integer li_solicitanteid


//li_solicitanteid = integer(trim(sle_cuenta.text))


//columna = 	dwo.name
//this.accepttext()

//	CHOOSE CASE columna
//		case "solicitantetel"
//			li_tipo =this.GetItemNumber(1,'tipo_prestamo')
//			cuenta =this.GetItemNumber(1,'solicitanteid')
			if al_solicitanteid > 0  then
//				dw_solicitud.setitem(1,'solicitanteid',cuenta)
//				choose case li_tipo
						
//					case 1
						origen.ii_parm1 = gi_depto
						origen.ii_parm2 = gi_area
						origen.il_parm2 = al_solicitanteid
												
						openwithparm(w_psi_pre_solicitud,origen)
						if isvalid(Message.PowerObjectParm) then
							regreso = message.powerobjectparm
							ii_folio_presolici = regreso.ii_parm3

						End If	
							
//							this.setitem(1,'solicitantegrupo',regreso.is_parm2)
//							this.setitem(1,'solicitanteprofesor',regreso.is_parm3)			
						end if

//				end choose
//			else
//				messagebox("Mensaje del Sistema","Es necesario ingresar la clave de profesor o alumno",stopsign!)
//			end if
//	end choose



end subroutine

public function integer wf_aplica_renovacion (integer ar_cvedepto, integer ar_foliopresol);Integer li_folio_origen, li_folio_prestamo, li_existe_renovacion, li_renov_ant, li_total_renov
String ls_idusuario

If ar_foliopresol > 0 Then
	//Valida si la presolicitud es una renovacion y se obtiene el valor del folio origen (Prestamo)
	SELECT IsNull(folio_origen, 0), IsNull(folio_prestamo, 0)
	   INTO :li_folio_origen, :li_folio_prestamo
	  FROM dbo.spre_pre_solicitud
	WHERE cvedepto = :ar_cvedepto
		AND folio = :ar_foliopresol
 	 USING gtr_sumuia;

	If li_folio_origen > 0 Then
		//Valida si la presolicitud es una renovacion
		SELECT IsNull(Count(*), 0)
			INTO :li_existe_renovacion
		  FROM dbo.spre_renovaciones
		WHERE cvedepto = :ar_cvedepto
			AND folio_origen = :li_folio_origen
		 USING gtr_sumuia;
		
		If li_existe_renovacion = 0 Then
			//Obtener el número de Renovaciones anteriores
			SELECT IsNull(Count(*), 0)
			   INTO :li_renov_ant
			  FROM dbo.spre_renovaciones
			WHERE cvedepto = :ar_cvedepto
				AND folio_destino = :li_folio_origen OR folio_origen = :li_folio_origen
			  USING gtr_sumuia;
			  
			If li_renov_ant >= 2 Then
				MessageBox('Mensaje del Sistema', 'No es posible realizar más de 2 renovaciones de un préstamo de materiales, folio presolicitud:' + string(ar_foliopresol))
				return -1
			Else
			  
				If li_renov_ant = 1 Then
					 li_total_renov = 2
				Else
					 li_total_renov = 1
				End If
				
				ls_idusuario = string(giUsuarioId)
			  
				//Insertar la nueva Renovación
				INSERT INTO dbo.spre_renovaciones ( cvedepto, folio_origen, folio_destino, num_renovacion, 
																	fecha_renovacion, fecha_entrega, usuario )
							SELECT 	cvedepto, folio_origen, folio_prestamo, :li_total_renov,
										fecha_inicio, fecha_fin, :ls_idusuario
							  FROM 	dbo.spre_pre_solicitud
							WHERE 	cvedepto = :ar_cvedepto
								AND 	folio = :ar_foliopresol
							 USING 	gtr_sumuia;
			End If
		End If
	End If
End If
Return 0
end function

public function integer wf_status_pm_inv (string as_serie, string as_material, integer ai_grupo, ref integer ai_tiempoprestamo);integer li_row

ids_StaPrestamo =  create datastore 
ids_StaPrestamo.dataobject ='d_psi_stautsprestamo'
ids_StaPrestamo.settransobject(gtr_sumuia)

//li_row = ids_StaPrestamo.retrieve(gi_depto,gi_area,as_material,ii_ligpomat,as_serie)	
//li_row = ids_StaPrestamo.retrieve(gi_depto,gi_area,as_material,liGrupo,as_serie)	
li_row = ids_StaPrestamo.retrieve(gi_depto,gi_area,as_material,ai_grupo,as_serie)	
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

public function integer wf_valida_prestamo_mio (integer pi_cvegrupo, string ps_cvematerial, string ps_num_serie);integer li_valido

	select count(*)
	into :li_valido
	from spre_sol_materiales
	join spre_solicitud on spre_sol_materiales.cvedepto=spre_solicitud.cvedepto
	and spre_sol_materiales.folio=spre_solicitud.folio
	where spre_solicitud.cvedepto=:gi_depto
	and spre_solicitud.solicitanteid=:il_cuenta
	and cast(spre_solicitud.fecha_fin as date) = getdate()
	and spre_sol_materiales.cvegrupo=:pi_cvegrupo
	and spre_sol_materiales.cvematerial=:ps_cvematerial
	and spre_sol_materiales.num_serie=:ps_num_serie

	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
			messagebox("Error SUMUIA: Validación Préstamo.", gtr_sumuia.SQLErrText)	
	end if
	
	
	return (li_valido)

end function

on w_psi_prestamo_mat.create
int iCurrent
call super::create
this.dw_presolicitud=create dw_presolicitud
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_presolicitud
this.Control[iCurrent+2]=this.st_3
end on

on w_psi_prestamo_mat.destroy
call super::destroy
destroy(this.dw_presolicitud)
destroy(this.st_3)
end on

event open;//////////////////////////////////////////////////////////////////////////////
//	Event:			open
//	Arguments:		Ninguno
//	Returns:			pbm_open
//	Description:	Carga la forma y prepara la misma para poder realizar el
//						prestamo de materiales
//////////////////////////////////////////////////////////////////////////////
idt_fecha_hoy = f_fecha_hora_servidor ()

IF IsValid(message.powerobjectparm) Then
	regreso_ren = message.powerobjectparm
	ii_cvedepto_ren = 	regreso_ren .ii_parm1
	ii_cvearea_ren = 	regreso_ren .ii_parm2
	ii_folio_presol_ren = 	regreso_ren .ii_parm3
	ii_solicitantesid_ren = 	regreso_ren .ii_parm4
	il_modo_renovacion = 1
	sle_cuenta.text = String(ii_solicitantesid_ren)
	sle_cuenta.enabled = False
	This.title = "Prestamo material (Modo Renovación)"
Else
	il_modo_renovacion = 0
End If




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

//// Inicializar los campos con la fecha actual
//dw_criterios.SetItem(1,'fechaini', now())
//dw_criterios.SetItem(1,'fechafin', now())

date ld_fecha_ini, ld_fecha_fin

ld_fecha_ini=f_calcula_psi_fecha_habil(today(),0)
ld_fecha_fin=f_calcula_psi_fecha_habil(today(),2)

dw_criterios.SetItem(1,'fechaini',ld_fecha_ini)
dw_criterios.SetItem(1,'fechafin',ld_fecha_fin)

dw_criterios.SetItem(1,'horarioini',8)
dw_criterios.SetItem(1,'horariofin',20)
dw_criterios.SetItem(1,'minutoini',0)
dw_criterios.SetItem(1,'minutofin',0)

dw_solicitud.setitem(1,'fecha_inicio',datetime(ld_fecha_ini,time('08:00:00')))
dw_solicitud.setitem(1,'fecha_fin1_1',datetime(ld_fecha_fin,time('20:00:00')))

// Lector de Chip de contacto
//ole_1.object.TLector="Gemplus USB Smart Card Reader 0"
//ole_1.object.inicializa()

timer(1.5)
This.title = This.title + ' (' + gs_depto + ')'


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

type ole_1 from w_gen_prestamo_mat`ole_1 within w_psi_prestamo_mat
end type

type cb_materias from w_gen_prestamo_mat`cb_materias within w_psi_prestamo_mat
end type

type cb_corresp from w_gen_prestamo_mat`cb_corresp within w_psi_prestamo_mat
end type

type cb_1 from w_gen_prestamo_mat`cb_1 within w_psi_prestamo_mat
end type

type st_1 from w_gen_prestamo_mat`st_1 within w_psi_prestamo_mat
end type

type em_folio from w_gen_prestamo_mat`em_folio within w_psi_prestamo_mat
end type

type cbx_cancelacion from w_gen_prestamo_mat`cbx_cancelacion within w_psi_prestamo_mat
end type

type cbx_prestamoact from w_gen_prestamo_mat`cbx_prestamoact within w_psi_prestamo_mat
end type

type cb_salir from w_gen_prestamo_mat`cb_salir within w_psi_prestamo_mat
end type

type dw_reporte_mat from w_gen_prestamo_mat`dw_reporte_mat within w_psi_prestamo_mat
end type

type cbx_materiales from w_gen_prestamo_mat`cbx_materiales within w_psi_prestamo_mat
end type

type mle_1 from w_gen_prestamo_mat`mle_1 within w_psi_prestamo_mat
end type

type cb_buscar from w_gen_prestamo_mat`cb_buscar within w_psi_prestamo_mat
end type

event cb_buscar::clicked;datetime ldt_fecha_hora_ini,ldt_fecha_hora_fin
integer li_hrsini,li_hrsfin, li_minini, li_minfin
date ld_fechaini,ld_fechafin

ii_status_sol=dw_solicitud.getitemnumber(1,'status')	
li_tipo_grupo = dw_criterios.object.tipo_espacio[1]
		
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

//		messagebox('presolicitud',string(ii_presolicitud))
					if ii_presolicitud=1 then // Si es presolicitud
						dw_busqueda_1.dataobject='d_gen_matdisp_pre'
						dw_busqueda_1.settransobject(gtr_sumuia)
						wf_crea_busqueda_1(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
						dw_busqueda_1.setfilter('(isnull(spre_sol_materiales_folio) or status in (1,3) or (spre_solicitud_solicitanteid = '+string(il_cuenta)+' and spre_solicitud_fecha_fin=fecha_hoy'+'))')	
						dw_busqueda_1.filter()
						dw_busqueda_1.object.txt_solicitud.visible=false
						dw_busqueda_1.object.spre_sol_materiales_folio.visible=false
						dw_busqueda_1.title="Materiales Disponibles"
						cbx_materiales.checked = false
						
					else
						dw_busqueda_1.dataobject='d_gen_matdisp'
						dw_busqueda_1.settransobject(gtr_sumuia)
						wf_crea_busqueda_1(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
						dw_busqueda_1.setfilter('(isnull(spre_sol_materiales_folio) or status in (1,3))')
						dw_busqueda_1.filter()
						dw_busqueda_1.object.txt_solicitud.visible=false
						dw_busqueda_1.object.spre_sol_materiales_folio.visible=false
						dw_busqueda_1.title="Materiales Disponibles"
						cbx_materiales.checked = false
						
					end if

					
				else
					messagebox("Mensaje del Sistema", "La fecha final no puede ser anterior a la inicial",stopsign!)
				end if
			end if
		end if
	end if

end event

type cbx_ocupados from w_gen_prestamo_mat`cbx_ocupados within w_psi_prestamo_mat
end type

type dw_criterios from w_gen_prestamo_mat`dw_criterios within w_psi_prestamo_mat
end type

type cbx_intercambio from w_gen_prestamo_mat`cbx_intercambio within w_psi_prestamo_mat
end type

event cbx_intercambio::clicked;call super::clicked;if rb_1.checked=true then
	if this.checked=true then 
		il_tipo_usuario=2 
	else 
		il_tipo_usuario=1
	end if
else
	this.checked=false
end if
end event

type st_2 from w_gen_prestamo_mat`st_2 within w_psi_prestamo_mat
end type

type dw_interesado from w_gen_prestamo_mat`dw_interesado within w_psi_prestamo_mat
end type

event dw_interesado::itemfocuschanged;//////////////////////////////////////////////////////////////////////////////
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

type rb_2 from w_gen_prestamo_mat`rb_2 within w_psi_prestamo_mat
integer weight = 700
end type

event rb_2::clicked;call super::clicked;If il_modo_renovacion = 1 Then
	sle_cuenta.text = String(ii_solicitantesid_ren)
	sle_cuenta.triggerevent( "activarbusq")
End If	

il_tipo_usuario=0

cbx_intercambio.checked=false
end event

type rb_1 from w_gen_prestamo_mat`rb_1 within w_psi_prestamo_mat
end type

event rb_1::clicked;call super::clicked;If il_modo_renovacion = 1 Then
	sle_cuenta.text = String(ii_solicitantesid_ren)
	sle_cuenta.triggerevent( "activarbusq")
End If	

if cbx_intercambio.checked=true then il_tipo_usuario=2 else il_tipo_usuario=1
end event

type dw_cap from w_gen_prestamo_mat`dw_cap within w_psi_prestamo_mat
integer width = 2684
end type

type dw_desc from w_gen_prestamo_mat`dw_desc within w_psi_prestamo_mat
end type

type dw_gpomat from w_gen_prestamo_mat`dw_gpomat within w_psi_prestamo_mat
end type

type cb_actualiza from w_gen_prestamo_mat`cb_actualiza within w_psi_prestamo_mat
integer x = 3226
integer y = 2330
integer width = 369
end type

event cb_actualiza::clicked;integer 	li_row, li_diasprestamo = 0, listatus, lt_adeudo, Res, liAdeudo, li_resul, Net, i, li_ren, li_result_renov
string	lsNoSerie, lsCveMaterial, lsSerie, ls_corr_n, ls_rep[]
long		llMaxFolio, llRow, ll_tipo, ll_folio, ll_j
integer li_dias_retraso, li_cuenta, li_suspendido, li_periodo, li_anio
datetime finicio,ffin
datastore lds_BorraSol

If sle_cuenta.text = '' Or sle_cuenta.text = ' ' Or IsNull(sle_cuenta.text)  Then
	messagebox("Atención","Falta indicar el número de Cuenta",exclamation!)
	return -1
End If

If il_modo_renovacion = 1 And sle_cuenta.text <> String(ii_solicitantesid_ren) Then
	messagebox("Atención","Está en modo RENOVACION no se puede elegir un Solicitante distinto",exclamation!)
	return -1
End If	

li_cuenta= dw_interesado.getitemnumber(1,'solicitanteid')
f_select_anio_periodo_actual(li_periodo,li_anio,today())
li_suspendido=f_select_psi_solicitante_bloqueado(gi_depto,gi_area,li_anio,li_periodo,li_cuenta, il_tipo_usuario)

if li_suspendido=1 then

	messagebox("Atención","El usuario excedió los días de retraso permitidos al entregar material, el servicio de reservación queda suspendido.",exclamation!)
	return -1

end if


//Se ejecutan las validaciones de los materiales del prestamo
//If wf_valida_materiales (ii_folio_presolici) = -1 Then
//	return -1 
//End If

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

	if dw_cap.rowcount()>0 then
		dw_solicitud.setitem(1,'fecha_inicio',dw_cap.GetItemDatetime(1,'fecha_inicio'))
		dw_solicitud.setitem(1,'fecha_fin1_1',dw_cap.GetItemDatetime(1,'fecha_final1_1'))
	end if	
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
	//Nva Linea 23/11/2011
	If wf_actualiza_inventario ()= -1 then
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
	
	//En caso de tratarse de una presolicitud previamente cargada actualizamos el estatus
	If ii_folio_presolici > 0 Then
		UPDATE dbo.spre_pre_solicitud
			 SET status = 1,  // Procesada
				   folio_prestamo = :ll_folio
		WHERE cvedepto = :gi_depto
			AND folio = :ii_folio_presolici
			using gtr_sumuia;
			// En esta funcion se validara q sea una renovacion y se aplicara
			li_result_renov = wf_aplica_renovacion (gi_depto, ii_folio_presolici)
			
			If li_result_renov = -1 Then
				rollback using gtr_sumuia;
				return -1
			End If
	End If

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

type cb_eliminar from w_gen_prestamo_mat`cb_eliminar within w_psi_prestamo_mat
integer x = 2809
integer y = 2330
integer width = 369
end type

type dw_motivo from w_gen_prestamo_mat`dw_motivo within w_psi_prestamo_mat
end type

type dw_solicitud from w_gen_prestamo_mat`dw_solicitud within w_psi_prestamo_mat
end type

event dw_solicitud::pfc_postinsertrow;call super::pfc_postinsertrow;//////////////////////////////////////////////////////////////////////////////
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
		end if	
		Destroy lds_DiasAd
end event

type sle_cuenta from w_gen_prestamo_mat`sle_cuenta within w_psi_prestamo_mat
end type

event sle_cuenta::activarbusq;call super::activarbusq;	
date ld_fecha_ini, ld_fecha_fin

ld_fecha_ini=f_calcula_psi_fecha_habil(today(),0)
ld_fecha_fin=f_calcula_psi_fecha_habil(today(),2)

dw_criterios.SetItem(1,'fechaini',ld_fecha_ini)
dw_criterios.SetItem(1,'fechafin',ld_fecha_fin)

dw_criterios.SetItem(1,'horarioini',8)
dw_criterios.SetItem(1,'horariofin',20)
dw_criterios.SetItem(1,'minutoini',0)
dw_criterios.SetItem(1,'minutofin',0)

dw_solicitud.setitem(1,'fecha_inicio',datetime(ld_fecha_ini,time('08:00:00')))
dw_solicitud.setitem(1,'fecha_fin1_1',datetime(ld_fecha_fin,time('20:00:00')))


// Codigo nuevo presolicitudes Oct2012 SFF
		string columna
		long cuenta

		columna = 	dw_interesado.getcolumnname( )
		dw_interesado.accepttext( )
		//Se reinicia la var global con el folio de la presolicitud
		ii_folio_presolici = 0
		
			CHOOSE CASE columna
				case "solicitanteid"
					cuenta =dw_interesado.GetItemNumber(1,'solicitanteid')
					if cuenta > 0  then
		
						//Validar que existan presolicitudes
						If wf_valida_existe_presolicitud (gi_depto, gi_area, cuenta) > 0 Then
							//Llamar ventana de presolicitudes (obtener folio de presolicitud)
							wf_abre_ventana_presolici (gi_depto, gi_area, cuenta)
							If ii_folio_presolici > 0 Then 
								//cargar datos de presolicitud en caso de existir
								wf_carga_presolicitud (cuenta)
							End If
						End If
		
					end if
			end choose
// --------FIN Cod Presolicitudes



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

event sle_cuenta::modified;ii_presolicitud=0
if trim(sle_cuenta.text) <>"" then 
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

type gb_2 from w_gen_prestamo_mat`gb_2 within w_psi_prestamo_mat
end type

type gb_1 from w_gen_prestamo_mat`gb_1 within w_psi_prestamo_mat
end type

type dw_busqueda from w_gen_prestamo_mat`dw_busqueda within w_psi_prestamo_mat
integer x = 51
integer y = 1286
end type

event dw_busqueda::doubleclicked;datetime ldFechaI, ldFechaF
integer liCveGpo, Net
long ll_nva_linea, llRowsMat, llIdSol, llRow, llTotMatFil, liTipoPrestamo
string lsNoSerie, lsCveMat, lsFilter, lsTFilter, lsDesMat
datastore ids_MatReq
ids_MatReq =  create datastore 
ids_MatReq.dataobject ='d_psi_mat_pre'
ids_MatReq.settransobject(gtr_sumuia)

n_transportar uo_parametros
integer li_tipo

string ls_nada

ls_nada = ''

dw_cap.reset()
if not isnull(row) then
	if row<>0 then
	
		lsNoSerie = this.getitemstring(row,'spre_inventario_num_serie')
		lsCveMat = this.getitemstring(row,'spre_inventario_cvematerial')
		liCveGpo = this.GetItemNumber (row,'spre_inventario_cvegrupo')
		lsDesMat =	this.getitemstring(row,'spre_materiales_descripcion')
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
					dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
					dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
					dw_cap.scrolltorow(ll_nva_linea)					
				else
					
					
							Net = messagebox("Atención3","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material"	, &
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
									dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
									dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
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
						dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
						dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
						dw_cap.scrolltorow(ll_nva_linea)			
					else
						Net = messagebox("Atención4","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material"	, &
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
										dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
										dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
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
				dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
				dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
				dw_cap.scrolltorow(ll_nva_linea)					
			else
					
					Net = messagebox("Atención5","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material"	, &
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
							dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
							dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
							dw_cap.scrolltorow(ll_nva_linea)			
																		
					END IF			
			end if
			
		END If

	end if
end if

dw_cap.setfocus()


//CODIGO DEL EVENTO PADRE


//if row>0 then
//	//uo_parametros = create n_transportar
//	
//	if cbx_ocupados.checked then
//		li_tipo=1
//	else
//		li_tipo=0
//	end if
//		uo_parametros.id_parm1=dw_criterios.getitemdate(1,'fechaini')
//		uo_parametros.id_parm2=dw_criterios.getitemdate(1,'fechafin')
//		uo_parametros.ii_parm1=li_tipo
//		uo_parametros.ii_parm2=dw_criterios.getitemnumber(1,'horarioini')
//		uo_parametros.ii_parm3=dw_criterios.getitemnumber(1,'horariofin')
//		uo_parametros.ii_parm6=dw_criterios.getitemnumber(1,'minutoini')
//		uo_parametros.ii_parm7=dw_criterios.getitemnumber(1,'minutofin')
//		uo_parametros.ii_parm4=	this.getitemnumber(row,'folio')
//		uo_parametros.is_parm1=this.getitemstring(row,'cvematerial')
//		uo_parametros.ii_parm5=	this.getitemnumber(row,'cvegrupo')
//		uo_parametros.is_parm2=this.getitemstring(row,'descripcion')
//		uo_parametros.ii_parm8=ii_status_sol
//	Reset()
//	opensheetwithparm(w_com_solicitud_espacio,uo_parametros,w_ppal,0,original!)
//	cbx_ocupados.visible = false
//end if
end event

event dw_busqueda::clicked;call super::clicked;string ls_nada


ls_nada = ''
end event

type dw_busqueda_1 from w_gen_prestamo_mat`dw_busqueda_1 within w_psi_prestamo_mat
integer x = 51
integer y = 1286
end type

event dw_busqueda_1::doubleclicked;datetime ldFechaI, ldFechaF
date 		ld_fechaini,ld_fechafin
integer liCveGpo, Net=1, li_hrsini,li_hrsfin,li_minini,li_minfin
long ll_nva_linea, llRowsMat, llIdSol, llRow, llTotMatFil, liTipoPrestamo, llReservadoUId
string lsNoSerie, lsCveMat, lsFilter, lsTFilter, lsReservadoNombre, ls_fnd, lsDesMat
n_cst_string	lob_tmp
datastore ids_MatReq
ids_MatReq =  create datastore 
ids_MatReq.dataobject ='d_psi_mat_pre'
ids_MatReq.settransobject(gtr_sumuia)

n_transportar uo_parametros
integer li_tipo

string ls_nada
ls_nada = ''

if cbx_materiales.checked = true then
	dw_cap.reset()
end if


if not isnull(row) then
	
	if row<>0 then
		
		li_hrsini=dw_criterios.getitemnumber(1,'horarioini')
		li_hrsfin=dw_criterios.getitemnumber(1,'horariofin')
		li_minini=dw_criterios.getitemnumber(1,'minutoini')
		li_minfin=dw_criterios.getitemnumber(1,'minutofin')
		ld_fechaini=dw_criterios.getitemdate(1,'fechaini')
		ld_fechafin=dw_criterios.getitemdate(1,'fechafin')	
		ldFechaI =datetime(ld_fechaini,time(li_hrsini,li_minini,0))
		ldFechaF=datetime(ld_fechafin,time(li_hrsfin,li_minfin,0))
		
		
		lsNoSerie = this.getitemstring(row,'num_serie')
		lsCveMat = this.getitemstring(row,'cvematerial')
		liCveGpo = this.GetItemNumber (row,'cvegrupo')
		lsDesMat =	this.getitemstring(row,'spre_materiales_descripcion')
		llIdSol= dw_solicitud.GetItemNumber(1,'solicitanteid')
		ids_MatReq.retrieve(gi_depto, gi_area, lsCveMat, liCveGpo)
		llRowsMat =ids_MatReq.rowcount()
		
		
		ls_fnd = "cvematerial='"+lob_tmp.of_GlobalReplace(lsCveMat,"'","~~'")+"' and num_serie='"+lob_tmp.of_GlobalReplace(lsNoSerie,"'","~~'")+"'"
		if dw_cap.find(ls_fnd, 1, dw_cap.RowCount()) > 0 then
			MessageBox("Aviso","No se puede agregar el mismo material.")
			return
		end if
		
		llReservadoUId=f_select_psi_usuario_material(gi_depto,gi_area,lsCveMat,liCveGpo,lsNoSerie,ldfechai,ldfechaf,lsReservadoNombre)

		if llReservadoUId>0 then Net = messagebox("Atención","El material solicitado ya fue autorizado para la cuenta '"+string(llReservadoUId)+"' ~r~n¿Desea continuar con el prestamo de ese material?"	, &
			Question!, yesno!, 2)	
	
		IF Net = 1 THEN
	
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
							dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
							dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
							dw_cap.scrolltorow(ll_nva_linea)		
							
						else  
									
									
							Net = messagebox("Atención6","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material?"	, &
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
									dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
									dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
									dw_cap.scrolltorow(ll_nva_linea)			
																										
							END IF	
						
						end if  
						
					Else  
						
					
						Net = messagebox("Atención","El solicitante no esta cursando ninguna materia que permita el prestamo del material~r~n¿Desea continuar con el prestamo de material?"	, &
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
									dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
									dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
									dw_cap.scrolltorow(ll_nva_linea)		
									
								else 
									
									Net = messagebox("Atención7","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material?"	, &
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
													dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
													dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
													dw_cap.scrolltorow(ll_nva_linea)			
																						
											END IF			
								end if  
								
						ELSE  
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
						dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
						dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
						dw_cap.scrolltorow(ll_nva_linea)					
					else
							
							Net = messagebox("Atención8","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material?"	, &
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
									dw_cap.setItem(ll_nva_linea,'num_serie',lsNoSerie)
									dw_cap.setItem(ll_nva_linea,'spre_materiales_descripcion',lsDesMat)
									dw_cap.scrolltorow(ll_nva_linea)			
																				
							END IF	
	
					end if 		
	
				end if			
	
			END IF

		end if
end if

dw_cap.setfocus()


//CODIGO DEL EVENTO PADRE


//if row>0 then
//	//uo_parametros = create n_transportar
//	
//	if cbx_ocupados.checked then
//		li_tipo=1
//	else
//		li_tipo=0
//	end if
//		uo_parametros.id_parm1=dw_criterios.getitemdate(1,'fechaini')
//		uo_parametros.id_parm2=dw_criterios.getitemdate(1,'fechafin')
//		uo_parametros.ii_parm1=li_tipo
//		uo_parametros.ii_parm2=dw_criterios.getitemnumber(1,'horarioini')
//		uo_parametros.ii_parm3=dw_criterios.getitemnumber(1,'horariofin')
//		uo_parametros.ii_parm6=dw_criterios.getitemnumber(1,'minutoini')
//		uo_parametros.ii_parm7=dw_criterios.getitemnumber(1,'minutofin')
//		uo_parametros.ii_parm4=	this.getitemnumber(row,'folio')
//		uo_parametros.is_parm1=this.getitemstring(row,'cvematerial')
//		uo_parametros.ii_parm5=	this.getitemnumber(row,'cvegrupo')
//		uo_parametros.is_parm2=this.getitemstring(row,'descripcion')
//		uo_parametros.ii_parm8=ii_status_sol
//	Reset()
//	opensheetwithparm(w_com_solicitud_espacio,uo_parametros,w_ppal,0,original!)
//	cbx_ocupados.visible = false
//end if
end event

type gb_3 from w_gen_prestamo_mat`gb_3 within w_psi_prestamo_mat
end type

type gb_4 from w_gen_prestamo_mat`gb_4 within w_psi_prestamo_mat
end type

type dw_foto from w_gen_prestamo_mat`dw_foto within w_psi_prestamo_mat
end type

type dw_presolicitud from datawindow within w_psi_prestamo_mat
boolean visible = false
integer x = 3196
integer y = 1152
integer width = 358
integer height = 227
integer taborder = 250
boolean bringtotop = true
string title = "none"
string dataobject = "d_psi_pre_solicitudes_aut"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_psi_prestamo_mat
boolean visible = false
integer x = 3079
integer y = 851
integer width = 402
integer height = 51
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "none"
boolean focusrectangle = false
end type

