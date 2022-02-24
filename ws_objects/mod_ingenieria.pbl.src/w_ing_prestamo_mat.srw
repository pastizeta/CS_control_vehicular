$PBExportHeader$w_ing_prestamo_mat.srw
$PBExportComments$Permite capturar los materiales a prestar
forward
global type w_ing_prestamo_mat from w_gen_prestamo_mat
end type
type gb_5 from groupbox within w_ing_prestamo_mat
end type
type em_num_serie from editmask within w_ing_prestamo_mat
end type
type st_3 from statictext within w_ing_prestamo_mat
end type
type st_depto from statictext within w_ing_prestamo_mat
end type
type dw_presolicitud from datawindow within w_ing_prestamo_mat
end type
end forward

global type w_ing_prestamo_mat from w_gen_prestamo_mat
integer width = 3972
integer height = 3482
gb_5 gb_5
em_num_serie em_num_serie
st_3 st_3
st_depto st_depto
dw_presolicitud dw_presolicitud
end type
global w_ing_prestamo_mat w_ing_prestamo_mat

type variables
integer ii_folio_presolici
string is_carrera

end variables

forward prototypes
public subroutine wf_carga_presolicitud (long al_cuenta)
public function integer wf_valida_materiales (long ll_folio_presolici)
public function string wf_busca_alumno (long al_cuenta)
public function n_transportar wf_busca_empleado (long al_nomina)
public function string wf_busca_alumno_dca1 (long al_cuenta)
public function integer wf_valida_existe_presolicitud (integer ai_cvedepto, integer ai_cvearea, long al_solicitanteid)
public subroutine wf_abre_ventana_presolici (integer ai_cvedepto, integer ai_cvearea, long al_solicitanteid)
end prototypes

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
dw_presolicitud.retrieve(gi_depto, gi_area,ii_folio_presolici)
li_records = dw_presolicitud.rowcount()
If  li_records > 0 Then
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
	dw_busqueda_1.reset()
else
	messagebox('Aviso', 'El material que desea confirmar ya no se encuentra disponible para su préstamo.')
end if
end subroutine

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
					
				//Si la solicitud tiene un prestamo mayor a un día y en el inventario se tiene autorización de mas de 3 horas en el mismo día para dicho material
				If ( ll_tipo_prestamo_solici = 2 ) and ( li_req_firma =  1 ) Then
					Messagebox("Mensaje", "Este material requiere una autorización por el tiempo del préstamo solicitado...Num.Serie: " + ls_num_serie, StopSign!)
					li_resultado = -1
					EXIT
				End If
				
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
	ids_MatAlmn.dataobject ='d_ing_matinsc'
	ids_MatAlmn.settransobject(gtr_sumuia)
else
	ids_MatAlmn =  create datastore 
	ids_MatAlmn.dataobject ='d_ing_matinsc'
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
//		and v_sce_carreras.cve_carrera in (select cve_carrera from v_sce_carreras  where /*cve_carrera = 2101 and */cve_coordinacion in (select cve_coordinacion from v_sce_coordinaciones where cve_depto = 2100))
using gtr_sumuia;
		if gtr_sumuia.sqlcode=0 then
			//TODO OK
			if  isnull(ll_cuenta_inscrito) then
				messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
				sle_cuenta.text=""
				wf_limpia_forma()
			else
				If gi_area = 1 Then
					If (UPPER(ls_carrera) = "INGENIERIA BIOMEDICA") Or (UPPER(ls_carrera) = "INGENIERÍA BIOMÉDICA") Or &
						(UPPER(ls_carrera) = "INGENIERÍA BIOMÉDICA - ESPAÑOL") Then
						ids_MatAlmn.retrieve(ll_cuenta_inscrito)
						ids_MatReq.Retrieve(ll_cuenta_inscrito)
						liTotalMatPrestado =ids_MatReq.RowCount()
					else
						messagebox("Mensaje del Sistema","Alumno NO inscrito en el area de Ingeniería Biomédica",stopsign!)
	//					wf_carga_foto(long(ll_cuenta_inscrito),2)
						sle_cuenta.text=""
						wf_limpia_forma()
					end if
				Else
						ids_MatAlmn.retrieve(ll_cuenta_inscrito)
						ids_MatReq.Retrieve(ll_cuenta_inscrito)
						liTotalMatPrestado =ids_MatReq.RowCount()
				End If
			end if
		else
			IF gtr_sumuia.SQLCode = -1 THEN 

				MessageBox("SQL error", gtr_sumuia.SQLErrText)
				sle_cuenta.text=""
				wf_limpia_forma()
//			ELSE
//				messagebox("Mensaje del Sistema","Alumno NO inscrito en el area de Ingeniería Biomédica",stopsign!)
//				wf_limpia_forma()
//				sle_cuenta.text=""
			END IF
		end if			
	end if
	destroy ids_MatReq;
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
integer li_prof_biomedica, li_nulo
n_transportar uo_salida
datastore ids_MatReq
datastore ids_Prof_BioMedica
ids_MatReq =  create datastore 
ids_MatReq.dataobject ='d_psi_mat_act'
ids_MatReq.settransobject(gtr_sumuia)

ids_Prof_BioMedica = create datastore 
ids_Prof_BioMedica.dataobject ='d_ing_profimp_ingbiomed'
ids_Prof_BioMedica.settransobject(gtr_sumuia)

SetNull(li_nulo)

if isvalid(ids_MatProf) then
	destroy ids_MatProf
	ids_MatProf =  create datastore 
	ids_MatProf.dataobject ='d_ing_matinscp'
	ids_MatProf.settransobject(gtr_sumuia)
else
		ids_MatProf =  create datastore 
		ids_MatProf.dataobject ='d_ing_matinscp'
		ids_MatProf.settransobject(gtr_sumuia)
		
end if
setpointer(hourglass!)
if al_nomina<>0 then
//	is_carrera = ''
	
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
			
			//Validamos si el profesor imparte alguna materia de la carrera INGENIERIA BIOMEDICA
			ids_Prof_BioMedica.retrieve(al_nomina)
			li_prof_biomedica = ids_Prof_BioMedica.RowCount()
			If gi_area = 1 and li_prof_biomedica <> 1 Then
				messagebox("Mensaje del Sistema","El profesor NO imparte clases en ninguna materia del area de Ingeniería Biomédica",stopsign!)
				sle_cuenta.text=""
				wf_limpia_forma()
			End If
		else
			if gtr_personal.sqlcode=-1 then
				messagebox("Mensaje del Sistema",gtr_personal.SQLErrText,stopsign!)
				sle_cuenta.text=""
				wf_limpia_forma()
//
//				dw_interesado.setitem(dw_interesado.getrow( ), "solicitanteid", li_nulo)
//				dw_interesado.accepttext( )
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
			If gi_area = 1 Then
				//Asignamos la descripcion de la carrera a la variable
				If (UPPER(ls_carrera) = "INGENIERIA BIOMEDICA") Or (UPPER(ls_carrera) = "INGENIERÍA BIOMÉDICA") Or &
					(UPPER(ls_carrera) = "INGENIERÍA BIOMÉDICA - ESPAÑOL") Then
	
					wf_carga_foto(long(ll_cuenta_inscrito),2)
				else
					messagebox("Mensaje del Sistema","Alumno NO inscrito en el area de Ingeniería Biomédica",stopsign!)
	//				wf_carga_foto(long(ll_cuenta_inscrito),2)
					sle_cuenta.text=""
					wf_limpia_forma()
				end if
			Else
				wf_carga_foto(long(ll_cuenta_inscrito),2)
			End If
		end if
	else
		IF gtr_sumuia.SQLCode = -1 THEN 
			MessageBox("SQL error", gtr_sumuia.SQLErrText)
		END IF
	end if			

return ls_nombrecompleto
end function

public function integer wf_valida_existe_presolicitud (integer ai_cvedepto, integer ai_cvearea, long al_solicitanteid);integer li_registros

SELECT IsNull(count(*), 0)
   INTO :li_registros
  FROM spre_pre_solicitud
 WHERE cvedepto =:ai_cvedepto
     AND cvearea =:ai_cvearea
     AND solicitanteid =:al_solicitanteid
     AND status = 0
  USING gtr_sumuia;
  
If IsNull(li_registros) Then
	li_registros = 0
End If

RETURN  li_registros
end function

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
												
						openwithparm(w_ing_pre_solicitud,origen)
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

on w_ing_prestamo_mat.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.em_num_serie=create em_num_serie
this.st_3=create st_3
this.st_depto=create st_depto
this.dw_presolicitud=create dw_presolicitud
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.em_num_serie
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_depto
this.Control[iCurrent+5]=this.dw_presolicitud
end on

on w_ing_prestamo_mat.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.em_num_serie)
destroy(this.st_3)
destroy(this.st_depto)
destroy(this.dw_presolicitud)
end on

event open;call super::open;st_depto.text = gs_depto

dw_criterios.SetItem(1,'horarioini',hour(now()))
dw_criterios.SetItem(1,'horariofin',hour(now())+1)
dw_criterios.SetItem(1,'minutoini',0)
dw_criterios.SetItem(1,'minutofin',0)

end event

type ole_1 from w_gen_prestamo_mat`ole_1 within w_ing_prestamo_mat
end type

type cb_materias from w_gen_prestamo_mat`cb_materias within w_ing_prestamo_mat
end type

type cb_corresp from w_gen_prestamo_mat`cb_corresp within w_ing_prestamo_mat
end type

type cb_1 from w_gen_prestamo_mat`cb_1 within w_ing_prestamo_mat
end type

type st_1 from w_gen_prestamo_mat`st_1 within w_ing_prestamo_mat
end type

type em_folio from w_gen_prestamo_mat`em_folio within w_ing_prestamo_mat
end type

type cbx_cancelacion from w_gen_prestamo_mat`cbx_cancelacion within w_ing_prestamo_mat
end type

type cbx_prestamoact from w_gen_prestamo_mat`cbx_prestamoact within w_ing_prestamo_mat
end type

type cb_salir from w_gen_prestamo_mat`cb_salir within w_ing_prestamo_mat
end type

type dw_reporte_mat from w_gen_prestamo_mat`dw_reporte_mat within w_ing_prestamo_mat
end type

type cbx_materiales from w_gen_prestamo_mat`cbx_materiales within w_ing_prestamo_mat
end type

type mle_1 from w_gen_prestamo_mat`mle_1 within w_ing_prestamo_mat
end type

type cb_buscar from w_gen_prestamo_mat`cb_buscar within w_ing_prestamo_mat
end type

type cbx_ocupados from w_gen_prestamo_mat`cbx_ocupados within w_ing_prestamo_mat
end type

type dw_criterios from w_gen_prestamo_mat`dw_criterios within w_ing_prestamo_mat
end type

type cbx_intercambio from w_gen_prestamo_mat`cbx_intercambio within w_ing_prestamo_mat
end type

type st_2 from w_gen_prestamo_mat`st_2 within w_ing_prestamo_mat
end type

type dw_interesado from w_gen_prestamo_mat`dw_interesado within w_ing_prestamo_mat
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
						openwithparm(w_ing_mat_insc,origen)
						if isvalid(Message.PowerObjectParm) then
							regreso = message.powerobjectparm
							this.setitem(1,'solicitantegrupo',regreso.is_parm2)
							this.setitem(1,'solicitanteprofesor',regreso.is_parm3)			
						end if
//					case 3
//						origen.ii_parm1 = li_tipo
//						origen.il_parm1 = this.GetItemNumber(1,'solicitanteid')
//						openwithparm(w_ing_mat_insc,origen)
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

type rb_2 from w_gen_prestamo_mat`rb_2 within w_ing_prestamo_mat
end type

type rb_1 from w_gen_prestamo_mat`rb_1 within w_ing_prestamo_mat
end type

type dw_cap from w_gen_prestamo_mat`dw_cap within w_ing_prestamo_mat
end type

type dw_desc from w_gen_prestamo_mat`dw_desc within w_ing_prestamo_mat
end type

type dw_gpomat from w_gen_prestamo_mat`dw_gpomat within w_ing_prestamo_mat
end type

type cb_actualiza from w_gen_prestamo_mat`cb_actualiza within w_ing_prestamo_mat
end type

event cb_actualiza::clicked;integer 	li_row, li_diasprestamo = 0, listatus, lt_adeudo, Res, liAdeudo, li_resul, Net, i, li_ren
string	lsNoSerie, lsCveMaterial, lsSerie, ls_corr_n, ls_rep[]
long		llMaxFolio, llRow, ll_tipo, ll_folio, ll_j
datetime finicio,ffin
datastore lds_BorraSol


If sle_cuenta.text = '' Or sle_cuenta.text = ' ' Or IsNull(sle_cuenta.text)  Then
	messagebox("Atención","Falta indicar el número de Cuenta",exclamation!)
	return -1
End If

//Se ejecutan las validaciones de los materiales del prestamo
If wf_valida_materiales (ii_folio_presolici) = -1 Then
	return -1 
End If

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
	
	//En caso de tratarse de una presolicitud previamente cargada actualizamos el estatus de esta.
	If ii_folio_presolici > 0 Then
		UPDATE dbo.spre_pre_solicitud
			 SET dbo.status = 1,  // Procesada
			 folio_prestamo = :ll_folio
		WHERE cvedepto = :gi_depto
			AND folio = :ii_folio_presolici
			using gtr_sumuia;
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

type cb_eliminar from w_gen_prestamo_mat`cb_eliminar within w_ing_prestamo_mat
end type

type dw_motivo from w_gen_prestamo_mat`dw_motivo within w_ing_prestamo_mat
end type

type dw_solicitud from w_gen_prestamo_mat`dw_solicitud within w_ing_prestamo_mat
end type

type sle_cuenta from w_gen_prestamo_mat`sle_cuenta within w_ing_prestamo_mat
integer weight = 400
end type

event sle_cuenta::modified;if trim(sle_cuenta.text) <>"" then 
	wf_limpia_forma()
	IF KeyDown (keyEnter!) THEN
		
//		//Validar que existan presolicitudes
//		If wf_valida_existe_presolicitud (gi_depto, integer(trim(sle_cuenta.text))) > 0 Then
//			//Llamar ventana de presolicitudes (obtener folio de presolicitud)
//			wf_abre_ventana_presolici (gi_depto, integer(trim(sle_cuenta.text)))
//			
//			If ii_folio_presolici > 0 Then 
//				Messagebox('PRUEBAS', 'RESULTADO ' + string(ii_folio_presolici) )
//				//cargar datos de presolicitud en caso de existir
//			End If
//		End If
		
		
		setpointer(Hourglass!)
		sle_cuenta.triggerevent( "activarbusq")

//		// codigo nuevo
//		string columna
//		long cuenta
//
//		columna = 	dw_interesado.getcolumnname( )
//		dw_interesado.accepttext( )
//		//Se reinicia la var global con el folio de la presolicitud
//		ii_folio_presolici = 0
//		
//			CHOOSE CASE columna
//				case "solicitanteid"
//					cuenta =dw_interesado.GetItemNumber(1,'solicitanteid')
//					if cuenta > 0  then
//		
//						//Validar que existan presolicitudes
//						If wf_valida_existe_presolicitud (gi_depto, cuenta) > 0 Then
//							//Llamar ventana de presolicitudes (obtener folio de presolicitud)
//							wf_abre_ventana_presolici (gi_depto, cuenta)
//							
//							If ii_folio_presolici > 0 Then 
//								//cargar datos de presolicitud en caso de existir
//								wf_carga_presolicitud (cuenta)
//							End If
//						End If
//		
//					end if
//			end choose
//		// --------FIN COD NUEVO
//
		setpointer(Arrow!)		
		//nva lineaSFF 26092011
		timer(1.5)
	END IF
end if
end event

event sle_cuenta::activarbusq;call super::activarbusq;dw_criterios.SetItem(1,'horarioini',hour(now()))
dw_criterios.SetItem(1,'horariofin',hour(now())+1)
dw_criterios.SetItem(1,'minutoini',0)
dw_criterios.SetItem(1,'minutofin',0)

		// codigo nuevo
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
		// --------FIN COD NUEVO

end event

type gb_2 from w_gen_prestamo_mat`gb_2 within w_ing_prestamo_mat
end type

type gb_1 from w_gen_prestamo_mat`gb_1 within w_ing_prestamo_mat
end type

type dw_busqueda from w_gen_prestamo_mat`dw_busqueda within w_ing_prestamo_mat
integer x = 84
integer y = 1302
end type

type dw_busqueda_1 from w_gen_prestamo_mat`dw_busqueda_1 within w_ing_prestamo_mat
end type

event dw_busqueda_1::doubleclicked;datetime ldFechaI, ldFechaF
date 		ld_fechaini,ld_fechafin
integer liCveGpo, Net=1, li_hrsini,li_hrsfin,li_minini,li_minfin
long ll_nva_linea, llRowsMat, llIdSol, llRow, llTotMatFil, liTipoPrestamo, llReservadoUId
string lsNoSerie, lsCveMat, lsFilter, lsTFilter, lsReservadoNombre, ls_fnd, lsDesMat
n_cst_string	lob_tmp
datastore ids_MatReq
ids_MatReq =  create datastore 
ids_MatReq.dataobject ='d_gen_mat_pre'
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
		llIdSol= dw_solicitud.GetItemNumber(1,'solicitanteid')
		lsDesMat =	this.getitemstring(row,'spre_materiales_descripcion')
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
									
									
//							Net = messagebox("Atención","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material?"	, &
//									Question!, yesno!, 2)
//							
//							IF Net = 1 THEN
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
																										
//							END IF	
						
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
									
//									Net = messagebox("Atención","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material?"	, &
//													Question!, yesno!, 2)
//				
//											IF Net = 1 THEN
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
																						
//											END IF			
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
							
//							Net = messagebox("Atención","El solicitante ya tiene 3 materiales prestado ~r~n¿Desea continuar con el prestamo de material?"	, &
//									Question!, yesno!, 2)
//									
//							IF Net = 1 THEN
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
																				
//							END IF	
	
					end if 		
	
				end if			
	
			END IF

		end if
end if

dw_cap.setfocus()


end event

type gb_3 from w_gen_prestamo_mat`gb_3 within w_ing_prestamo_mat
integer width = 3803
end type

type gb_4 from w_gen_prestamo_mat`gb_4 within w_ing_prestamo_mat
integer width = 3803
end type

type dw_foto from w_gen_prestamo_mat`dw_foto within w_ing_prestamo_mat
end type

type gb_5 from groupbox within w_ing_prestamo_mat
integer x = 3295
integer y = 1229
integer width = 410
integer height = 378
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "none"
end type

type em_num_serie from editmask within w_ing_prestamo_mat
integer x = 3215
integer y = 1312
integer width = 457
integer height = 77
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string minmax = "~~20"
end type

event modified;long ll_found, ll_nbr
string ls_num_serie

ls_num_serie = This.text

If LEN(ls_num_serie) > 0 Then
	//buscamos el registro
	ll_nbr = dw_busqueda_1.rowcount( )
	ll_found = dw_busqueda_1.find(  "num_serie = '" + ls_num_serie + "'", 1, ll_nbr)
	If ll_found > 0 Then
		If Messagebox("Aplicación", "Desea agregar el material con el numero de serie leído...", Question!, OkCancel!) = 1 Then
			dw_busqueda_1.event doubleclicked( 0 , 0,ll_found, dw_busqueda_1.object)
		End If
	Else
		Messagebox("Error", "No se puede localizar un material con el numero de serie leído...", Exclamation!)		
	End If
End If
end event

type st_3 from statictext within w_ing_prestamo_mat
integer x = 3222
integer y = 1245
integer width = 508
integer height = 61
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "No. Serie"
boolean focusrectangle = false
end type

type st_depto from statictext within w_ing_prestamo_mat
boolean visible = false
integer x = 1660
integer y = 1232
integer width = 362
integer height = 61
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_presolicitud from datawindow within w_ing_prestamo_mat
boolean visible = false
integer x = 3438
integer y = 1475
integer width = 322
integer height = 304
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_ing_pre_solicitudes_aut"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

