$PBExportHeader$w_cat_esp_material.srw
forward
global type w_cat_esp_material from w_modelo_cap
end type
end forward

global type w_cat_esp_material from w_modelo_cap
integer width = 3936
end type
global w_cat_esp_material w_cat_esp_material

type variables
double ii_gpo_mat
end variables

on w_cat_esp_material.create
call super::create
end on

on w_cat_esp_material.destroy
call super::destroy
end on

event open;call super::open;ii_gpo_mat=Message.DoubleParm			
DataWindowChild dwc_tipos

dw_cap.GetChild("tipo_aula", dwc_tipos)
dwc_tipos.SetTransObject(gtr_sumuia)
dwc_tipos.Retrieve(ii_gpo_mat)
dw_cap.retrieve(gi_depto,gi_area,ii_gpo_mat)


/*La columna cvegrupo no acepta valores nulos*/
dw_cap.Modify("cvegrupo.initial='"+string(ii_gpo_mat)+"'")
dw_cap.Modify("cvedepto.initial='"+string(gi_depto)+"'")
dw_cap.Modify("cvearea.initial='"+string(gi_area)+"'")
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_cat_esp_material
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_cat_esp_material
integer x = 1938
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_cat_esp_material
integer x = 2341
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_cat_esp_material
integer x = 1536
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_cat_esp_material
integer x = 1134
end type

type dw_cap from w_modelo_cap`dw_cap within w_cat_esp_material
integer width = 3835
string dataobject = "d_sres_esp_materiales"
end type

