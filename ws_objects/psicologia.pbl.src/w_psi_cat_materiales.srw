$PBExportHeader$w_psi_cat_materiales.srw
forward
global type w_psi_cat_materiales from w_modelo_cap
end type
end forward

global type w_psi_cat_materiales from w_modelo_cap
string title = "Definición de Materiales"
end type
global w_psi_cat_materiales w_psi_cat_materiales

type variables
integer ii_gpo_mat
end variables

on w_psi_cat_materiales.create
call super::create
end on

on w_psi_cat_materiales.destroy
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

type dw_motivo from w_modelo_cap`dw_motivo within w_psi_cat_materiales
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_psi_cat_materiales
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_psi_cat_materiales
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_psi_cat_materiales
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_psi_cat_materiales
end type

event cb_nuevo::clicked;call super::clicked;dw_cap.setitem(dw_cap.getrow(),'cvedepto',gi_depto)
dw_cap.setitem(dw_cap.getrow(),'cvearea',gi_area)
dw_cap.setitem(dw_cap.getrow(),'cvegrupo',ii_gpo_mat)

end event

type dw_cap from w_modelo_cap`dw_cap within w_psi_cat_materiales
integer width = 3547
string dataobject = "d_psi_materiales"
end type

event dw_cap::doubleclicked;call super::doubleclicked;str_baja_mat envio_mat

if row >0 then
	envio_mat.lscvemat = this.getitemstring(row,'cvematerial')
	envio_mat.licvegrupo = this.getitemnumber(row,'cvegrupo')
	choose case gi_depto
				
		case 2
			OpenSheetWithParm(w_psi_cat_inventario, envio_mat , w_ppal, 2, Original!)
	end choose
end if
end event

event dw_cap::constructor;call super::constructor;this.getchild('cvegrupo',gruposdepto)
gruposdepto.setTransObject(gtr_sumuia)
gruposdepto.Retrieve(gi_depto)
end event

