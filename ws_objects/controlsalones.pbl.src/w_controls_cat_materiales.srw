$PBExportHeader$w_controls_cat_materiales.srw
forward
global type w_controls_cat_materiales from w_modelo_cap
end type
end forward

global type w_controls_cat_materiales from w_modelo_cap
end type
global w_controls_cat_materiales w_controls_cat_materiales

type variables
integer ii_gpo_mat
end variables

on w_controls_cat_materiales.create
call super::create
end on

on w_controls_cat_materiales.destroy
call super::destroy
end on

event open;call super::open;ii_gpo_mat=Message.DoubleParm	
string DWfilter2
dw_cap.retrieve(gi_depto,gi_area)

	if ii_gpo_mat <> 0 then
		DWfilter2 = "cvegrupo =  "+ string(ii_gpo_mat) 
		dw_cap.SetFilter(DWfilter2)
		dw_cap.Filter( )
		
	else
		DWfilter2 = "cvegrupo  > 0"
		dw_cap.SetFilter(DWfilter2)
		dw_cap.Filter( )
		
	end if
	
	datawindowchild	ldwch
	dw_cap.GetChild('cvegrupo',ldwch)
	ldwch.SetFilter('cvearea='+string(gi_area))
	ldwch.Filter()
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_controls_cat_materiales
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_controls_cat_materiales
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_controls_cat_materiales
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_controls_cat_materiales
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_controls_cat_materiales
end type

type dw_cap from w_modelo_cap`dw_cap within w_controls_cat_materiales
string dataobject = "d_controls_materiales"
end type

event dw_cap::constructor;call super::constructor;dw_cap.setitem(dw_cap.getrow(),'cvedepto',gi_depto)
dw_cap.setitem(dw_cap.getrow(),'cvearea',gi_area)
dw_cap.setitem(dw_cap.getrow(),'cvegrupo',ii_gpo_mat)
end event

