$PBExportHeader$w_csal_prestamo_mat.srw
$PBExportComments$Permite capturar los materiales a prestar
forward
global type w_csal_prestamo_mat from w_gen_prestamo_mat
end type
end forward

global type w_csal_prestamo_mat from w_gen_prestamo_mat
integer width = 3844
integer height = 3104
boolean center = true
end type
global w_csal_prestamo_mat w_csal_prestamo_mat

forward prototypes
public function string wf_busca_alumno (long al_cuenta)
public function long wf_valida_cuenta (long al_cuenta)
end prototypes

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
	   WHERE  v_sce_alumnos.cuenta = :al_cuenta
	and v_sce_carreras.cve_carrera in (select cve_carrera from v_sce_carreras  where cve_coordinacion in (select cve_coordinacion from v_sce_coordinaciones))using gtr_sumuia;
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

li_multi = 0
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
	Messagebox("Aviso","La cuenta "+string(al_cuenta)+ " tiene  material en préstamo en el área: "&
	+ls_area+"~r~nFolio: "+string(ll_folio) &
	+" con fecha de vencimiento: "+string(lft_vence)+" !!!"/*+"~r~nNo se puede realizar el préstamo."*/,information!)
	//return 1
end if

return 0
end function

on w_csal_prestamo_mat.create
call super::create
end on

on w_csal_prestamo_mat.destroy
call super::destroy
end on

event open;call super::open;dw_interesado.Dataobject = 'd_csal_solmaterial'
dw_interesado.insertrow(0)
dw_interesado.setitem(1,'tipo_prestamo',1)
dw_interesado.setTransObject(gtr_sumuia)

idwc_espacio.retrieve(gi_depto,gi_area,1)
idwc_espacio.insertrow(1)


end event

event activate;                        ////////////////////////////////////////////////////////////////////////////////
////	Event:			activate
////	Arguments:		Ninguno
////	Returns:			pbm_activate
////	Description:	Permite asignar la clave y el tipo de solicitante
////////////////////////////////////////////////////////////////////////////////

//n_transportar uo_parametros
//uo_parametros = Message.PowerObjectParm

timer(1.5)
//
//if isvalid(Message.PowerObjectParm) then
//	if uo_parametros.is_parm1="BUSQUEDA" then
//		if uo_parametros.is_parm5='solicitanteid' then
//			dw_interesado.setitem(1,'solicitanteid',uo_parametros.il_parm1)
//			dw_solicitud.setitem(1,'solicitanteid',uo_parametros.il_parm1)
//			dw_interesado.setitem(1,'solicitantenombre',uo_parametros.is_parm2)
//			dw_interesado.setitem(1,'tipo_prestamo',uo_parametros.ii_parm2)	
//			choose case uo_parametros.ii_parm2
//				case 1,2
//					if isvalid(ids_MatAlmn) then
//						destroy ids_MatAlmn
//						ids_MatAlmn =  create datastore 
//						ids_MatAlmn.dataobject ='d_csal_matinsc'
//						ids_MatAlmn.settransobject(gtr_sumuia)
//						ids_MatAlmn.retrieve(uo_parametros.il_parm1)
//					else                                   
//						ids_MatAlmn =  create datastore 
//						ids_MatAlmn.dataobject ='d_csal_matinsc'
//						ids_MatAlmn.settransobject(gtr_sumuia)
//						ids_MatAlmn.retrieve(uo_parametros.il_parm1)
//					end if	
//				case 3
//					if isvalid(ids_MatProf) then
//						destroy ids_MatProf
//						ids_MatProf =  create datastore 
//						ids_MatProf.dataobject ='d_csal_matinscp'
//						ids_MatProf.settransobject(gtr_sumuia)
//						ids_MatProf.retrieve(uo_parametros.il_parm1)
//					else
//						ids_MatProf =  create datastore 
//						ids_MatProf.dataobject ='d_csal_matinscp'
//						ids_MatProf.settransobject(gtr_sumuia)
//						ids_MatProf.retrieve(uo_parametros.il_parm1)
//					end if
//			end choose
//		end if
//	 
//	end if
//end if
end event

type ole_1 from w_gen_prestamo_mat`ole_1 within w_csal_prestamo_mat
end type

type cb_materias from w_gen_prestamo_mat`cb_materias within w_csal_prestamo_mat
integer x = 2531
end type

event cb_materias::clicked;string nombre,apat,amat,columna, data, verifica, ls_prepa, lstipo
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
					openwithparm(w_csal_mat_insc,origen)
					if isvalid(Message.PowerObjectParm) then
						regreso = message.powerobjectparm
						dw_interesado.setitem(1,'solicitantegrupo',regreso.is_parm2)
						dw_interesado.setitem(1,'solicitanteprofesor',regreso.is_parm3)		
						dw_interesado.setitem(1,'cve_salon',regreso.is_parm11)
						dw_interesado.setitem(1,'hora_inicio',regreso.ii_parm9)
						dw_interesado.setitem(1,'hora_final',regreso.ii_parm10)
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
				openwithparm(w_csal_mat_insc,origen)
				if isvalid(Message.PowerObjectParm) then
					regreso = message.powerobjectparm
					dw_interesado.setitem(1,'solicitantegrupo',regreso.is_parm2)
					//		Se reciben parametros del profesor.gmn. mayo 2008
					dw_interesado.setitem(1,'solicitanteprofesor',regreso.is_parm3)	
					dw_interesado.setitem(1,'cve_salon',regreso.is_parm11)
					dw_interesado.setitem(1,'hora_inicio',regreso.ii_parm9)
					dw_interesado.setitem(1,'hora_final',regreso.ii_parm10)
							
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

type cb_corresp from w_gen_prestamo_mat`cb_corresp within w_csal_prestamo_mat
end type

type cb_1 from w_gen_prestamo_mat`cb_1 within w_csal_prestamo_mat
end type

type st_1 from w_gen_prestamo_mat`st_1 within w_csal_prestamo_mat
end type

type em_folio from w_gen_prestamo_mat`em_folio within w_csal_prestamo_mat
end type

type cbx_cancelacion from w_gen_prestamo_mat`cbx_cancelacion within w_csal_prestamo_mat
end type

type cbx_prestamoact from w_gen_prestamo_mat`cbx_prestamoact within w_csal_prestamo_mat
end type

type cb_salir from w_gen_prestamo_mat`cb_salir within w_csal_prestamo_mat
end type

type dw_reporte_mat from w_gen_prestamo_mat`dw_reporte_mat within w_csal_prestamo_mat
end type

type cbx_materiales from w_gen_prestamo_mat`cbx_materiales within w_csal_prestamo_mat
end type

type mle_1 from w_gen_prestamo_mat`mle_1 within w_csal_prestamo_mat
end type

type cb_buscar from w_gen_prestamo_mat`cb_buscar within w_csal_prestamo_mat
end type

type cbx_ocupados from w_gen_prestamo_mat`cbx_ocupados within w_csal_prestamo_mat
end type

type dw_criterios from w_gen_prestamo_mat`dw_criterios within w_csal_prestamo_mat
end type

type cbx_intercambio from w_gen_prestamo_mat`cbx_intercambio within w_csal_prestamo_mat
end type

type st_2 from w_gen_prestamo_mat`st_2 within w_csal_prestamo_mat
end type

type dw_interesado from w_gen_prestamo_mat`dw_interesado within w_csal_prestamo_mat
end type

event dw_interesado::itemchanged;//////////////////////////////////////////////////////////////////////////////
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
						openwithparm(w_csal_mat_insc,origen)
						if isvalid(Message.PowerObjectParm) then
							regreso = message.powerobjectparm
							this.setitem(1,'solicitantegrupo',regreso.is_parm2)
							this.setitem(1,'solicitanteprofesor',regreso.is_parm3)		
							this.setitem(1,'cve_salon',regreso.is_parm11)
							this.setitem(1,'hora_inicio',regreso.ii_parm9)
							this.setitem(1,'hora_final',regreso.ii_parm10)
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
						origen.il_parm1 = this.GetItemNumber(1,'solicitanteid')
							openwithparm(w_csal_mat_insc,origen)
						if isvalid(Message.PowerObjectParm) then
							regreso = message.powerobjectparm
							this.setitem(1,'solicitantegrupo',regreso.is_parm2)
							//		Se reciben parametros del profesor.gmn. mayo 2008
							this.setitem(1,'solicitanteprofesor',regreso.is_parm3)	
							this.setitem(1,'cve_salon',regreso.is_parm11)
							this.setitem(1,'hora_inicio',regreso.ii_parm9)
							this.setitem(1,'hora_final',regreso.ii_parm10)
							
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
	end choose

end event

type rb_2 from w_gen_prestamo_mat`rb_2 within w_csal_prestamo_mat
end type

type rb_1 from w_gen_prestamo_mat`rb_1 within w_csal_prestamo_mat
end type

type dw_cap from w_gen_prestamo_mat`dw_cap within w_csal_prestamo_mat
end type

type dw_desc from w_gen_prestamo_mat`dw_desc within w_csal_prestamo_mat
end type

type dw_gpomat from w_gen_prestamo_mat`dw_gpomat within w_csal_prestamo_mat
end type

type cb_actualiza from w_gen_prestamo_mat`cb_actualiza within w_csal_prestamo_mat
end type

type cb_eliminar from w_gen_prestamo_mat`cb_eliminar within w_csal_prestamo_mat
end type

type dw_motivo from w_gen_prestamo_mat`dw_motivo within w_csal_prestamo_mat
end type

type dw_solicitud from w_gen_prestamo_mat`dw_solicitud within w_csal_prestamo_mat
end type

type sle_cuenta from w_gen_prestamo_mat`sle_cuenta within w_csal_prestamo_mat
end type

event sle_cuenta::activarbusq;call super::activarbusq;//
//long ll_cuentab, ll_cuenta, ll_RowsPrestamo, retvalmulta, al_cuenta, lt_adeudo
//string ls_digito, ls_digitov ,ls_cuenta, ls_nombre, ls_periodo
//string ls_nombrecompleto
//
//n_transportar uo_parametros

dw_criterios.setitem(1,'fechaini',date(f_fecha_hora_servidor()))
dw_criterios.setitem(1,'fechafin',date(f_fecha_hora_servidor()))

//
//if rb_1.checked = true then
//	if cbx_intercambio.checked =  true then
//			ll_cuentab = long(sle_cuenta.text)
//			il_cuenta = ll_cuentab
//			retvalmulta = f_valida_cuenta(ll_cuentab)
//			if retvalmulta = 1 then 
//				messagebox("Mensaje del Sistema","El prestamo de material no se puede realizar debido al adeudo presentado")
//				sle_cuenta.text=""
//				return
//			else
//				SELECT count(*)  
//				INTO :lt_adeudo
//				FROM spre_solicitud
//				WHERE
//				solicitanteid = :ll_cuentab and cvedepto = 5 and
//				status = 0 and
//				fecha_fin < getdate() 
//				using gtr_sumuia;
//				if lt_adeudo >= 1 then
//					messagebox("Mensaje del Sistema", "La clave ingresada presenta Adeudo, sin multa generada")
//					sle_cuenta.text=""
//					return
//				end if
//			end if
//			dw_interesado.setitem(1,'tipo_prestamo',2)
//			dw_interesado.setitem(1,'solicitanteid',long(ll_cuentab))
//			dw_interesado.setitem(1,'solicitantenombre',wf_busca_alumno_dca1(long(ll_cuentab)))
//	else
//			if match(trim(sle_cuenta.text),'-')= true then
//				ls_cuenta= trim(sle_cuenta.text)		
//				il_cuenta = ll_cuentab
//			else
//				ls_cuenta= sle_cuenta.text  
//				ll_cuentab=long(ls_cuenta) 
//				il_cuenta = ll_cuentab
//			end if
//			retvalmulta = f_valida_cuenta(ll_cuentab)
//			if retvalmulta = 1 then
//				messagebox("Atención","El prestamo de material no se puede realizar debido al adeudo presentado")
//				sle_cuenta.text=""
//				return
//			else
//				SELECT count(*)  
//				INTO :lt_adeudo
//				FROM spre_solicitud
//				WHERE
//				solicitanteid = :ll_cuentab and cvedepto = 5 and
//				status = 0 and
//				fecha_fin < getdate() 
//				using gtr_sumuia;
//				if lt_adeudo >= 1 then
//					messagebox("Mensaje del Sistema", "La clave ingresada presenta Adeudo, sin multa generada")
//					sle_cuenta.text=""
//					return
//				end if
//			end if
//			dw_interesado.setitem(1,'tipo_prestamo',1)
//			dw_interesado.setitem(1,'solicitanteid',long(ll_cuentab))
//			wf_carga_foto(long(ll_cuentab),1)
//			dw_interesado.setitem(1,'solicitantenombre',wf_busca_alumno(long(ll_cuentab)))
//			dw_interesado.setfocus()
//	end if	// si es intercam,bio
//elseif rb_1.checked = false then 
//			//	EMPLEADO		
//		ls_cuenta=trim(sle_cuenta.text)
//		il_cuenta = long(ls_cuenta)
//		retvalmulta = f_valida_cuenta(long(ls_cuenta))
//		if retvalmulta = 1 then 
//			messagebox("Atención","El prestamo de material no se puede realizar debido al adeudo presentado ")
//			sle_cuenta.text=""
//			return
//		else
//			SELECT count(*)  
//			INTO :lt_adeudo
//			FROM spre_solicitud
//			WHERE
//			solicitanteid = :il_cuenta and cvedepto = 5 and
//			status = 0 and
//			fecha_fin < getdate() 
//			using gtr_sumuia;
//			if lt_adeudo >= 1 then
//				messagebox("Mensaje del Sistema", "La clave ingresada presenta Adeudo, sin multa generada")
//				sle_cuenta.text=""
//				return
//			end if
//		end if
//		dw_interesado.setitem(1,'tipo_prestamo',3)
//		dw_interesado.setitem(1,'solicitanteid',long(ls_cuenta))
//		uo_parametros=wf_busca_empleado(long(ls_cuenta))
//		wf_carga_foto(long(ls_cuenta),3)
//		dw_interesado.setitem(1,'solicitantenombre',uo_parametros.is_parm1)
//		dw_interesado.setfocus()	
//end if
//	
//
end event

type gb_2 from w_gen_prestamo_mat`gb_2 within w_csal_prestamo_mat
end type

type gb_1 from w_gen_prestamo_mat`gb_1 within w_csal_prestamo_mat
end type

type dw_busqueda from w_gen_prestamo_mat`dw_busqueda within w_csal_prestamo_mat
end type

type dw_busqueda_1 from w_gen_prestamo_mat`dw_busqueda_1 within w_csal_prestamo_mat
end type

type gb_3 from w_gen_prestamo_mat`gb_3 within w_csal_prestamo_mat
end type

type gb_4 from w_gen_prestamo_mat`gb_4 within w_csal_prestamo_mat
end type

type dw_foto from w_gen_prestamo_mat`dw_foto within w_csal_prestamo_mat
end type

