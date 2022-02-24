$PBExportHeader$w_psi_animales_crias.srw
forward
global type w_psi_animales_crias from window
end type
type dw_crias from datawindow within w_psi_animales_crias
end type
type gb_1 from groupbox within w_psi_animales_crias
end type
end forward

global type w_psi_animales_crias from window
integer width = 3310
integer height = 1078
boolean titlebar = true
string title = "Proveedores"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_crias dw_crias
gb_1 gb_1
end type
global w_psi_animales_crias w_psi_animales_crias

type variables
str_animales_crias istr_animales_cria
end variables

on w_psi_animales_crias.create
this.dw_crias=create dw_crias
this.gb_1=create gb_1
this.Control[]={this.dw_crias,&
this.gb_1}
end on

on w_psi_animales_crias.destroy
destroy(this.dw_crias)
destroy(this.gb_1)
end on

event open;dw_crias.setTransObject(gtr_sumuia)


istr_animales_cria = message.PowerObjectParm

dw_crias.Retrieve(istr_animales_cria.sexo)

istr_animales_cria.nombre = ''
istr_animales_cria.proveedor = ''
istr_animales_cria.abreviacion = ''
end event

event close;CloseWithReturn(w_psi_animales_crias,istr_animales_cria)



end event

type dw_crias from datawindow within w_psi_animales_crias
integer x = 77
integer y = 99
integer width = 3131
integer height = 835
integer taborder = 10
string title = "none"
string dataobject = "d_psi_animales_crias"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;
if row>0 then
	istr_animales_cria.id_cria=this.GetItemNumber(row,'id_cria')
	istr_animales_cria.nombre=this.GetItemString(row,'nombre')
	istr_animales_cria.proveedor=this.GetItemString(row,'prov_descripcion')
	istr_animales_cria.abreviacion=this.GetItemString(row,'prov_abreviacion')
	istr_animales_cria.cvetipo=this.GetItemNumber(row,'cvetipo')
	close(parent)
end if

end event

type gb_1 from groupbox within w_psi_animales_crias
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
string text = "Animales"
end type

