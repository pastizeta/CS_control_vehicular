$PBExportHeader$w_dis_entrega_mat.srw
forward
global type w_dis_entrega_mat from w_gen_entrega_mat
end type
end forward

global type w_dis_entrega_mat from w_gen_entrega_mat
integer x = 214
end type
global w_dis_entrega_mat w_dis_entrega_mat

on w_dis_entrega_mat.create
call super::create
end on

on w_dis_entrega_mat.destroy
call super::destroy
end on

event open;x=0
y=0

dw_matdisp.dataobject ='d_dis_mat_prestado'
dw_solicitud.dataobject ='d_dis_sol_act'

dw_interesado.setTransObject(gtr_sumuia)
dw_solicitud.setTransObject(gtr_sumuia)
dw_matdisp.setTransObject(gtr_sumuia)
dw_interesado.triggerevent("pfc_InsertRow")

timer(1.5)

This.title = This.title + ' (' + gs_depto + ')'
end event

type ole_1 from w_gen_entrega_mat`ole_1 within w_dis_entrega_mat
end type

type cbx_intercambio from w_gen_entrega_mat`cbx_intercambio within w_dis_entrega_mat
end type

type st_1 from w_gen_entrega_mat`st_1 within w_dis_entrega_mat
end type

type dw_solicitud from w_gen_entrega_mat`dw_solicitud within w_dis_entrega_mat
end type

event dw_solicitud::itemchanged;call super::itemchanged;integer	i
string		ls_status
if dwo.name='spre_solicitud_status' then
	CHOOSE CASE long(data)
		CASE 1
			
			
			for i=1 to dw_matdisp.rowcount()
				if dw_matdisp.getitemnumber(i,'spre_sol_materiales_status') = 3 then	 
					 dw_matdisp.setitem(i,'spre_sol_materiales_fecha_entrega',DateTime(Today(),Now()))
				end if
				 dw_matdisp.setitem(i,'spre_sol_materiales_status',1)
			next

	END CHOOSE
end if
end event

type sle_cuenta from w_gen_entrega_mat`sle_cuenta within w_dis_entrega_mat
end type

type rb_2 from w_gen_entrega_mat`rb_2 within w_dis_entrega_mat
end type

type rb_1 from w_gen_entrega_mat`rb_1 within w_dis_entrega_mat
end type

type cb_cerrar from w_gen_entrega_mat`cb_cerrar within w_dis_entrega_mat
end type

type cb_actualiza from w_gen_entrega_mat`cb_actualiza within w_dis_entrega_mat
end type

type dw_interesado from w_gen_entrega_mat`dw_interesado within w_dis_entrega_mat
end type

type dw_matdisp from w_gen_entrega_mat`dw_matdisp within w_dis_entrega_mat
end type

type gb_1 from w_gen_entrega_mat`gb_1 within w_dis_entrega_mat
end type

