$PBExportHeader$w_cat_esp_grupos_mat.srw
forward
global type w_cat_esp_grupos_mat from w_modelo_cap
end type
end forward

global type w_cat_esp_grupos_mat from w_modelo_cap
integer width = 2208
end type
global w_cat_esp_grupos_mat w_cat_esp_grupos_mat

on w_cat_esp_grupos_mat.create
call super::create
end on

on w_cat_esp_grupos_mat.destroy
call super::destroy
end on

event open;call super::open;dw_cap.retrieve(gi_depto,gi_area)

w_cat_esp_grupos_mat.title = "Catálogo de tipos de espacios"
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_cat_esp_grupos_mat
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_cat_esp_grupos_mat
integer x = 1088
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_cat_esp_grupos_mat
integer x = 1490
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_cat_esp_grupos_mat
integer x = 686
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_cat_esp_grupos_mat
integer x = 283
end type

event cb_nuevo::clicked;call super::clicked;dw_cap.setitem(dw_cap.getrow(),'cvedepto',gi_depto)
/*2009-02-04 La clasificación de los materiales será por área también*/
dw_cap.setitem(dw_cap.getrow(),'cvearea',gi_area)
end event

type dw_cap from w_modelo_cap`dw_cap within w_cat_esp_grupos_mat
integer width = 2066
string dataobject = "d_grupos_materiales"
end type

event dw_cap::doubleclicked;call super::doubleclicked;OpenSheetWithParm(w_cat_esp_material, this.getitemnumber(row,1) , w_ppal, 2, Original!)
end event

