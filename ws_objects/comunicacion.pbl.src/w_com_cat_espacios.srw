$PBExportHeader$w_com_cat_espacios.srw
$PBExportComments$Pantalla utilizada para realizar la captura de los espacios
forward
global type w_com_cat_espacios from w_modelo_cap
end type
end forward

global type w_com_cat_espacios from w_modelo_cap
integer width = 3474
string title = "Definición de Espacios"
end type
global w_com_cat_espacios w_com_cat_espacios

type variables
double ii_gpo_mat
end variables

on w_com_cat_espacios.create
call super::create
end on

on w_com_cat_espacios.destroy
call super::destroy
end on

event open;call super::open;ii_gpo_mat=Message.DoubleParm			
DataWindowChild dwc_tipos

dw_cap.GetChild("tipo_aula", dwc_tipos)
dwc_tipos.SetTransObject(gtr_sumuia)
dwc_tipos.Retrieve(ii_gpo_mat)
dw_cap.retrieve(gi_depto,gi_area,ii_gpo_mat)
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_com_cat_espacios
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_com_cat_espacios
integer x = 1696
integer y = 1344
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_com_cat_espacios
integer x = 2103
integer y = 1344
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_com_cat_espacios
integer x = 1289
integer y = 1344
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_com_cat_espacios
integer x = 882
integer y = 1344
end type

event cb_nuevo::clicked;call super::clicked;dw_cap.setitem(dw_cap.getrow(),'cvedepto',gi_depto)
dw_cap.setitem(dw_cap.getrow(),'cvearea',gi_area)
dw_cap.setitem(dw_cap.getrow(),'cvegrupo',ii_gpo_mat)

end event

type dw_cap from w_modelo_cap`dw_cap within w_com_cat_espacios
integer x = 37
integer width = 3369
string dataobject = "d_com_espacios"
end type

