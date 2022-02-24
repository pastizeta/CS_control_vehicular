$PBExportHeader$w_cat_periodos.srw
forward
global type w_cat_periodos from w_modelo_cap
end type
end forward

global type w_cat_periodos from w_modelo_cap
integer width = 2843
integer height = 1624
string title = "Calendario de Fechas periodo"
end type
global w_cat_periodos w_cat_periodos

on w_cat_periodos.create
call super::create
end on

on w_cat_periodos.destroy
call super::destroy
end on

event open;call super::open;dw_cap.retrieve(gi_depto)
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_cat_periodos
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_cat_periodos
integer x = 1394
integer y = 1364
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_cat_periodos
integer x = 1801
integer y = 1364
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_cat_periodos
integer x = 987
integer y = 1364
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_cat_periodos
integer x = 581
integer y = 1364
end type

event cb_nuevo::clicked;call super::clicked;dw_cap.setitem(dw_cap.getrow(),'cvedepto',gi_depto)
end event

type dw_cap from w_modelo_cap`dw_cap within w_cat_periodos
integer x = 9
integer y = 28
integer width = 2779
integer height = 1288
string dataobject = "d_periodos"
end type

