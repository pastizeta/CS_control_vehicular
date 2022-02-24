$PBExportHeader$w_pba_prestamo_mat.srw
forward
global type w_pba_prestamo_mat from w_gen_prestamo_mat
end type
end forward

global type w_pba_prestamo_mat from w_gen_prestamo_mat
end type
global w_pba_prestamo_mat w_pba_prestamo_mat

on w_pba_prestamo_mat.create
call super::create
end on

on w_pba_prestamo_mat.destroy
call super::destroy
end on

type cb_2 from w_gen_prestamo_mat`cb_2 within w_pba_prestamo_mat
end type

type cb_corresp from w_gen_prestamo_mat`cb_corresp within w_pba_prestamo_mat
end type

type cb_1 from w_gen_prestamo_mat`cb_1 within w_pba_prestamo_mat
end type

type st_1 from w_gen_prestamo_mat`st_1 within w_pba_prestamo_mat
end type

type em_folio from w_gen_prestamo_mat`em_folio within w_pba_prestamo_mat
end type

type cbx_cancelacion from w_gen_prestamo_mat`cbx_cancelacion within w_pba_prestamo_mat
end type

type cbx_prestamoact from w_gen_prestamo_mat`cbx_prestamoact within w_pba_prestamo_mat
end type

type cb_salir from w_gen_prestamo_mat`cb_salir within w_pba_prestamo_mat
end type

type dw_reporte_mat from w_gen_prestamo_mat`dw_reporte_mat within w_pba_prestamo_mat
end type

type cbx_materiales from w_gen_prestamo_mat`cbx_materiales within w_pba_prestamo_mat
end type

type mle_1 from w_gen_prestamo_mat`mle_1 within w_pba_prestamo_mat
end type

type cb_buscar from w_gen_prestamo_mat`cb_buscar within w_pba_prestamo_mat
end type

type cbx_ocupados from w_gen_prestamo_mat`cbx_ocupados within w_pba_prestamo_mat
end type

type dw_criterios from w_gen_prestamo_mat`dw_criterios within w_pba_prestamo_mat
end type

type cbx_intercambio from w_gen_prestamo_mat`cbx_intercambio within w_pba_prestamo_mat
end type

type st_2 from w_gen_prestamo_mat`st_2 within w_pba_prestamo_mat
end type

type ole_foto from w_gen_prestamo_mat`ole_foto within w_pba_prestamo_mat
end type

type dw_interesado from w_gen_prestamo_mat`dw_interesado within w_pba_prestamo_mat
end type

type rb_2 from w_gen_prestamo_mat`rb_2 within w_pba_prestamo_mat
end type

type rb_1 from w_gen_prestamo_mat`rb_1 within w_pba_prestamo_mat
end type

type dw_cap from w_gen_prestamo_mat`dw_cap within w_pba_prestamo_mat
end type

type dw_desc from w_gen_prestamo_mat`dw_desc within w_pba_prestamo_mat
end type

type dw_gpomat from w_gen_prestamo_mat`dw_gpomat within w_pba_prestamo_mat
end type

type cb_actualiza from w_gen_prestamo_mat`cb_actualiza within w_pba_prestamo_mat
end type

type cb_eliminar from w_gen_prestamo_mat`cb_eliminar within w_pba_prestamo_mat
end type

type dw_motivo from w_gen_prestamo_mat`dw_motivo within w_pba_prestamo_mat
end type

type dw_solicitud from w_gen_prestamo_mat`dw_solicitud within w_pba_prestamo_mat
end type

type sle_cuenta from w_gen_prestamo_mat`sle_cuenta within w_pba_prestamo_mat
end type

type gb_2 from w_gen_prestamo_mat`gb_2 within w_pba_prestamo_mat
end type

type gb_1 from w_gen_prestamo_mat`gb_1 within w_pba_prestamo_mat
end type

type dw_busqueda from w_gen_prestamo_mat`dw_busqueda within w_pba_prestamo_mat
end type

type dw_busqueda_1 from w_gen_prestamo_mat`dw_busqueda_1 within w_pba_prestamo_mat
end type

type ole_1 from w_gen_prestamo_mat`ole_1 within w_pba_prestamo_mat
end type

