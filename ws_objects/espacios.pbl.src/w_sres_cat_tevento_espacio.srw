$PBExportHeader$w_sres_cat_tevento_espacio.srw
forward
global type w_sres_cat_tevento_espacio from w_modelo_cap
end type
end forward

global type w_sres_cat_tevento_espacio from w_modelo_cap
integer width = 2222
string title = "Catálogo de Tipos de Eventos"
end type
global w_sres_cat_tevento_espacio w_sres_cat_tevento_espacio

on w_sres_cat_tevento_espacio.create
call super::create
end on

on w_sres_cat_tevento_espacio.destroy
call super::destroy
end on

event open;call super::open;dw_cap.retrieve()
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_sres_cat_tevento_espacio
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_sres_cat_tevento_espacio
integer x = 1051
integer y = 1364
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_sres_cat_tevento_espacio
integer x = 1458
integer y = 1364
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_sres_cat_tevento_espacio
integer x = 645
integer y = 1364
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_sres_cat_tevento_espacio
integer x = 238
integer y = 1364
end type

type dw_cap from w_modelo_cap`dw_cap within w_sres_cat_tevento_espacio
integer width = 2135
integer height = 1244
string dataobject = "d_sres_teventos_espacios"
end type

