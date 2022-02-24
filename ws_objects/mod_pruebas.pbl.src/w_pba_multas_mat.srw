$PBExportHeader$w_pba_multas_mat.srw
forward
global type w_pba_multas_mat from w_gen_multas_mat
end type
end forward

global type w_pba_multas_mat from w_gen_multas_mat
end type
global w_pba_multas_mat w_pba_multas_mat

on w_pba_multas_mat.create
call super::create
end on

on w_pba_multas_mat.destroy
call super::destroy
end on

type st_5 from w_gen_multas_mat`st_5 within w_pba_multas_mat
end type

type cbx_intercambio from w_gen_multas_mat`cbx_intercambio within w_pba_multas_mat
end type

type st_4 from w_gen_multas_mat`st_4 within w_pba_multas_mat
end type

type st_3 from w_gen_multas_mat`st_3 within w_pba_multas_mat
end type

type st_2 from w_gen_multas_mat`st_2 within w_pba_multas_mat
end type

type st_1 from w_gen_multas_mat`st_1 within w_pba_multas_mat
end type

type em_operacion from w_gen_multas_mat`em_operacion within w_pba_multas_mat
end type

type em_corte from w_gen_multas_mat`em_corte within w_pba_multas_mat
end type

type em_caja from w_gen_multas_mat`em_caja within w_pba_multas_mat
end type

type dw_solicitud from w_gen_multas_mat`dw_solicitud within w_pba_multas_mat
end type

type sle_cuenta from w_gen_multas_mat`sle_cuenta within w_pba_multas_mat
end type

type rb_2 from w_gen_multas_mat`rb_2 within w_pba_multas_mat
end type

type rb_1 from w_gen_multas_mat`rb_1 within w_pba_multas_mat
end type

type cb_cerrar from w_gen_multas_mat`cb_cerrar within w_pba_multas_mat
end type

type cb_actualiza from w_gen_multas_mat`cb_actualiza within w_pba_multas_mat
end type

type dw_interesado from w_gen_multas_mat`dw_interesado within w_pba_multas_mat
end type

type gb_1 from w_gen_multas_mat`gb_1 within w_pba_multas_mat
end type

type gb_2 from w_gen_multas_mat`gb_2 within w_pba_multas_mat
end type

