$PBExportHeader$w_cat_departamentos.srw
forward
global type w_cat_departamentos from w_modelo_cap
end type
end forward

global type w_cat_departamentos from w_modelo_cap
integer width = 2491
integer height = 1600
string title = "Catálogo de Departamentos"
end type
global w_cat_departamentos w_cat_departamentos

on w_cat_departamentos.create
call super::create
end on

on w_cat_departamentos.destroy
call super::destroy
end on

event open;call super::open;dw_cap.retrieve()
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_cat_departamentos
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_cat_departamentos
integer x = 1111
integer y = 1364
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_cat_departamentos
integer x = 1518
integer y = 1364
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_cat_departamentos
integer x = 704
integer y = 1364
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_cat_departamentos
integer x = 297
integer y = 1364
end type

type dw_cap from w_modelo_cap`dw_cap within w_cat_departamentos
integer width = 2405
integer height = 1240
string dataobject = "d_departamentos"
end type

event dw_cap::doubleclicked;call super::doubleclicked;OpenSheetWithParm(w_cat_areas, this.getitemnumber(row,1) , w_ppal, 2, Original!)
end event

