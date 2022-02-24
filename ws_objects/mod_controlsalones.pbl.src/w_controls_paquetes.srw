$PBExportHeader$w_controls_paquetes.srw
forward
global type w_controls_paquetes from w_modelo_cap
end type
end forward

global type w_controls_paquetes from w_modelo_cap
integer width = 2807
integer height = 1172
string title = "Detalle del paquete Cod uia"
end type
global w_controls_paquetes w_controls_paquetes

type variables
integer  ii_gpo_mat
end variables

on w_controls_paquetes.create
call super::create
end on

on w_controls_paquetes.destroy
call super::destroy
end on

event open;call super::open;ii_gpo_mat=Message.DoubleParm	
string DWfilter2

n_transportar uo_parametros
uo_parametros = Message.PowerObjectParm
w_controls_paquetes.X = 2450//ok.
w_controls_paquetes.Y =1330 //ok
w_controls_paquetes.width =2880 // ancho
w_controls_paquetes.height = 1280//largo

//uo_parametros.is_parmcoduia 	= this.GetItemString(row,'spre_inventario_cod_uia')
//			ls_paquete	= this.GetItemString(row,'spre_inventario_cod_uia')
//			uo_parametros.ii_parmgrupo	= this.GetItemNumber(row,'spre_inventario_cvegrupo')
//			uo_parametros.is_parmserien 	= this.GetItemString(row,'spre_inventario_num_serie')
//			uo_parametros.is_parmcvemat = this.GetItemString(row,'spre_inventario_cvematerial')

dw_cap.retrieve(uo_parametros.ii_parmgrupo,uo_parametros.is_parmcvemat,uo_parametros.is_parmserien,uo_parametros.is_parmcoduia)


end event

type dw_motivo from w_modelo_cap`dw_motivo within w_controls_paquetes
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_controls_paquetes
integer x = 1422
integer y = 900
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_controls_paquetes
integer x = 1824
integer y = 900
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_controls_paquetes
integer x = 1019
integer y = 900
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_controls_paquetes
integer x = 617
integer y = 900
end type

event cb_nuevo::clicked;call super::clicked;integer li_row
n_transportar uo_parametros
uo_parametros = Message.PowerObjectParm


for li_row = 1 to dw_cap.RowCount()
dw_cap.setItem(li_row,'spre_referencia_coduia_cvedepto',5)
dw_cap.setItem(li_row,'spre_referencia_coduia_cvemat',uo_parametros.is_parmcvemat)
dw_cap.setItem(li_row,'spre_referencia_coduia_num_serie',uo_parametros.is_parmserien)
dw_cap.setItem(li_row,'spre_referencia_coduia_cvegrupo',uo_parametros.ii_parmgrupo)
dw_cap.setItem(li_row,'spre_referencia_coduia_cod_uia',uo_parametros.is_parmcoduia)
next
end event

type dw_cap from w_modelo_cap`dw_cap within w_controls_paquetes
integer width = 2693
integer height = 804
string dataobject = "d_controls_paquetes_mat"
end type

