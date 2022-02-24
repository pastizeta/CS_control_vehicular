$PBExportHeader$w_cat_areas.srw
forward
global type w_cat_areas from w_modelo_cap
end type
end forward

global type w_cat_areas from w_modelo_cap
integer width = 2290
string title = "Catálogo de Áreas"
end type
global w_cat_areas w_cat_areas

type variables
integer li_depto
end variables

on w_cat_areas.create
call super::create
end on

on w_cat_areas.destroy
call super::destroy
end on

event open;call super::open;li_depto=Message.DoubleParm	

dw_cap.retrieve(li_depto)
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_cat_areas
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_cat_areas
integer x = 1033
integer y = 1360
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_cat_areas
integer x = 1440
integer y = 1360
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_cat_areas
integer x = 626
integer y = 1360
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_cat_areas
integer x = 219
integer y = 1360
end type

event cb_nuevo::clicked;call super::clicked;dw_cap.setitem(dw_cap.getrow(),'cvedepto',li_depto)
end event

type dw_cap from w_modelo_cap`dw_cap within w_cat_areas
integer width = 2121
string dataobject = "d_areas"
end type

