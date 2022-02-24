$PBExportHeader$w_psi_animales_proveedores.srw
forward
global type w_psi_animales_proveedores from window
end type
type dw_proveedores from datawindow within w_psi_animales_proveedores
end type
type gb_1 from groupbox within w_psi_animales_proveedores
end type
end forward

global type w_psi_animales_proveedores from window
integer width = 3310
integer height = 1078
boolean titlebar = true
string title = "Proveedores"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_proveedores dw_proveedores
gb_1 gb_1
end type
global w_psi_animales_proveedores w_psi_animales_proveedores

type variables
str_animales_proveedores istr_animales_proveedor




end variables

on w_psi_animales_proveedores.create
this.dw_proveedores=create dw_proveedores
this.gb_1=create gb_1
this.Control[]={this.dw_proveedores,&
this.gb_1}
end on

on w_psi_animales_proveedores.destroy
destroy(this.dw_proveedores)
destroy(this.gb_1)
end on

event open;dw_proveedores.setTransObject(gtr_sumuia)
dw_proveedores.Retrieve()

istr_animales_proveedor.nombre = ''
istr_animales_proveedor.abreviacion = ''
end event

event close;CloseWithReturn(w_psi_animales_proveedores,istr_animales_proveedor)



end event

type dw_proveedores from datawindow within w_psi_animales_proveedores
integer x = 77
integer y = 99
integer width = 3131
integer height = 835
integer taborder = 10
string title = "none"
string dataobject = "d_psi_animales_proveedores"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;
if row>0 then
	istr_animales_proveedor.nombre=this.GetItemString(row,'nombre')
	istr_animales_proveedor.abreviacion=this.GetItemString(row,'abreviacion')
	close(parent)
end if

end event

type gb_1 from groupbox within w_psi_animales_proveedores
integer x = 37
integer y = 13
integer width = 3226
integer height = 970
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Proveedores"
end type

