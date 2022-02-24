$PBExportHeader$w_comn_prestamo_mat.srw
forward
global type w_comn_prestamo_mat from w_gen_prestamo_mat
end type
end forward

global type w_comn_prestamo_mat from w_gen_prestamo_mat
end type
global w_comn_prestamo_mat w_comn_prestamo_mat

on w_comn_prestamo_mat.create
call super::create
end on

on w_comn_prestamo_mat.destroy
call super::destroy
end on

type ole_1 from w_gen_prestamo_mat`ole_1 within w_comn_prestamo_mat
end type

type cb_corresp from w_gen_prestamo_mat`cb_corresp within w_comn_prestamo_mat
end type

type cb_1 from w_gen_prestamo_mat`cb_1 within w_comn_prestamo_mat
end type

type st_1 from w_gen_prestamo_mat`st_1 within w_comn_prestamo_mat
end type

type em_folio from w_gen_prestamo_mat`em_folio within w_comn_prestamo_mat
end type

type cbx_cancelacion from w_gen_prestamo_mat`cbx_cancelacion within w_comn_prestamo_mat
end type

type cbx_prestamoact from w_gen_prestamo_mat`cbx_prestamoact within w_comn_prestamo_mat
end type

type cb_salir from w_gen_prestamo_mat`cb_salir within w_comn_prestamo_mat
end type

type dw_reporte_mat from w_gen_prestamo_mat`dw_reporte_mat within w_comn_prestamo_mat
end type

type cbx_materiales from w_gen_prestamo_mat`cbx_materiales within w_comn_prestamo_mat
end type

type mle_1 from w_gen_prestamo_mat`mle_1 within w_comn_prestamo_mat
end type

type cb_buscar from w_gen_prestamo_mat`cb_buscar within w_comn_prestamo_mat
end type

type cbx_ocupados from w_gen_prestamo_mat`cbx_ocupados within w_comn_prestamo_mat
end type

type dw_criterios from w_gen_prestamo_mat`dw_criterios within w_comn_prestamo_mat
end type

type cbx_intercambio from w_gen_prestamo_mat`cbx_intercambio within w_comn_prestamo_mat
end type

type st_2 from w_gen_prestamo_mat`st_2 within w_comn_prestamo_mat
end type

type dw_interesado from w_gen_prestamo_mat`dw_interesado within w_comn_prestamo_mat
end type

event dw_interesado::itemfocuschanged;call super::itemfocuschanged;//////////////////////////////////////////////////////////////////////////////
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
						openwithparm(w_comn_mat_insc,origen)
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

type rb_2 from w_gen_prestamo_mat`rb_2 within w_comn_prestamo_mat
end type

type rb_1 from w_gen_prestamo_mat`rb_1 within w_comn_prestamo_mat
end type

type dw_cap from w_gen_prestamo_mat`dw_cap within w_comn_prestamo_mat
end type

type dw_desc from w_gen_prestamo_mat`dw_desc within w_comn_prestamo_mat
end type

type dw_gpomat from w_gen_prestamo_mat`dw_gpomat within w_comn_prestamo_mat
end type

type cb_actualiza from w_gen_prestamo_mat`cb_actualiza within w_comn_prestamo_mat
end type

type cb_eliminar from w_gen_prestamo_mat`cb_eliminar within w_comn_prestamo_mat
end type

type dw_motivo from w_gen_prestamo_mat`dw_motivo within w_comn_prestamo_mat
end type

type dw_solicitud from w_gen_prestamo_mat`dw_solicitud within w_comn_prestamo_mat
end type

type sle_cuenta from w_gen_prestamo_mat`sle_cuenta within w_comn_prestamo_mat
end type

type gb_2 from w_gen_prestamo_mat`gb_2 within w_comn_prestamo_mat
end type

type gb_1 from w_gen_prestamo_mat`gb_1 within w_comn_prestamo_mat
end type

type dw_busqueda from w_gen_prestamo_mat`dw_busqueda within w_comn_prestamo_mat
end type

type dw_busqueda_1 from w_gen_prestamo_mat`dw_busqueda_1 within w_comn_prestamo_mat
end type

type gb_3 from w_gen_prestamo_mat`gb_3 within w_comn_prestamo_mat
end type

type gb_4 from w_gen_prestamo_mat`gb_4 within w_comn_prestamo_mat
end type

