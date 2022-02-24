$PBExportHeader$w_psi_cat_dias_inhabiles.srw
$PBExportComments$Catalogo de días inhabiles
forward
global type w_psi_cat_dias_inhabiles from w_modelo_cap
end type
end forward

global type w_psi_cat_dias_inhabiles from w_modelo_cap
integer width = 1503
integer height = 1472
string title = "Calendario de Fechas periodo"
end type
global w_psi_cat_dias_inhabiles w_psi_cat_dias_inhabiles

on w_psi_cat_dias_inhabiles.create
call super::create
end on

on w_psi_cat_dias_inhabiles.destroy
call super::destroy
end on

event open;dw_cap.retrieve(gi_depto)
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_psi_cat_dias_inhabiles
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_psi_cat_dias_inhabiles
integer x = 1050
integer y = 1075
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_psi_cat_dias_inhabiles
integer x = 1050
integer y = 1206
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_psi_cat_dias_inhabiles
integer x = 1050
integer y = 934
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_psi_cat_dias_inhabiles
integer x = 1050
integer y = 797
end type

event cb_nuevo::clicked;call super::clicked;dw_cap.setitem(dw_cap.getrow(),'anio',year(today()))
end event

type dw_cap from w_modelo_cap`dw_cap within w_psi_cat_dias_inhabiles
integer x = 7
integer y = 29
integer width = 1002
integer height = 1290
string dataobject = "d_psi_dias_inhabiles"
end type

