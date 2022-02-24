$PBExportHeader$w_sres_cat_materiales.srw
forward
global type w_sres_cat_materiales from w_modelo_cap
end type
end forward

global type w_sres_cat_materiales from w_modelo_cap
string title = "Definición de Espacios"
end type
global w_sres_cat_materiales w_sres_cat_materiales

type variables
double ii_gpo_mat
end variables

on w_sres_cat_materiales.create
call super::create
end on

on w_sres_cat_materiales.destroy
call super::destroy
end on

event open;call super::open;ii_gpo_mat=Message.DoubleParm			
DataWindowChild dwc_tipos

dw_cap.GetChild("tipo_aula", dwc_tipos)
dwc_tipos.SetTransObject(gtr_sumuia)
dwc_tipos.Retrieve(ii_gpo_mat)
dw_cap.retrieve(gi_depto,gi_area,ii_gpo_mat)
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_sres_cat_materiales
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_sres_cat_materiales
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_sres_cat_materiales
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_sres_cat_materiales
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_sres_cat_materiales
end type

event cb_nuevo::clicked;call super::clicked;dw_cap.setitem(dw_cap.getrow(),'cvedepto',gi_depto)
dw_cap.setitem(dw_cap.getrow(),'cvearea',gi_area)
dw_cap.setitem(dw_cap.getrow(),'cvegrupo',ii_gpo_mat)

end event

type dw_cap from w_modelo_cap`dw_cap within w_sres_cat_materiales
integer width = 3547
string dataobject = "d_sres_materiales"
end type

