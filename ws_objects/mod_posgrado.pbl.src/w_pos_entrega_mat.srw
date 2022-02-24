$PBExportHeader$w_pos_entrega_mat.srw
forward
global type w_pos_entrega_mat from w_gen_entrega_mat
end type
end forward

global type w_pos_entrega_mat from w_gen_entrega_mat
end type
global w_pos_entrega_mat w_pos_entrega_mat

on w_pos_entrega_mat.create
call super::create
end on

on w_pos_entrega_mat.destroy
call super::destroy
end on

type ole_1 from w_gen_entrega_mat`ole_1 within w_pos_entrega_mat
end type

type cbx_intercambio from w_gen_entrega_mat`cbx_intercambio within w_pos_entrega_mat
end type

type st_1 from w_gen_entrega_mat`st_1 within w_pos_entrega_mat
end type

type dw_solicitud from w_gen_entrega_mat`dw_solicitud within w_pos_entrega_mat
end type

type sle_cuenta from w_gen_entrega_mat`sle_cuenta within w_pos_entrega_mat
end type

type rb_2 from w_gen_entrega_mat`rb_2 within w_pos_entrega_mat
end type

type rb_1 from w_gen_entrega_mat`rb_1 within w_pos_entrega_mat
end type

type cb_cerrar from w_gen_entrega_mat`cb_cerrar within w_pos_entrega_mat
end type

type cb_actualiza from w_gen_entrega_mat`cb_actualiza within w_pos_entrega_mat
end type

type dw_interesado from w_gen_entrega_mat`dw_interesado within w_pos_entrega_mat
end type

type dw_matdisp from w_gen_entrega_mat`dw_matdisp within w_pos_entrega_mat
end type

type gb_1 from w_gen_entrega_mat`gb_1 within w_pos_entrega_mat
end type

