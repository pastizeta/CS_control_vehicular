$PBExportHeader$w_sres_cat_equipo_solicitado.srw
forward
global type w_sres_cat_equipo_solicitado from w_modelo_cap
end type
end forward

global type w_sres_cat_equipo_solicitado from w_modelo_cap
integer width = 2322
integer height = 1600
string title = "Catálogo de Equipo Solicitado"
end type
global w_sres_cat_equipo_solicitado w_sres_cat_equipo_solicitado

on w_sres_cat_equipo_solicitado.create
call super::create
end on

on w_sres_cat_equipo_solicitado.destroy
call super::destroy
end on

event open;call super::open;dw_cap.retrieve()
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_sres_cat_equipo_solicitado
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_sres_cat_equipo_solicitado
integer x = 1083
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_sres_cat_equipo_solicitado
integer x = 1490
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_sres_cat_equipo_solicitado
integer x = 677
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_sres_cat_equipo_solicitado
integer x = 270
end type

type dw_cap from w_modelo_cap`dw_cap within w_sres_cat_equipo_solicitado
integer x = 37
integer width = 2171
integer height = 1224
string dataobject = "d_sres_equipos"
end type

