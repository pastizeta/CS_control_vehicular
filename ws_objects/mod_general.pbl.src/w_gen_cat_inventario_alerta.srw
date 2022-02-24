$PBExportHeader$w_gen_cat_inventario_alerta.srw
forward
global type w_gen_cat_inventario_alerta from window
end type
type cb_exportar from commandbutton within w_gen_cat_inventario_alerta
end type
type dw_materiales from datawindow within w_gen_cat_inventario_alerta
end type
end forward

global type w_gen_cat_inventario_alerta from window
integer width = 4659
integer height = 1894
boolean titlebar = true
string title = "Alerta de materiales"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_exportar cb_exportar
dw_materiales dw_materiales
end type
global w_gen_cat_inventario_alerta w_gen_cat_inventario_alerta

type variables

end variables

on w_gen_cat_inventario_alerta.create
this.cb_exportar=create cb_exportar
this.dw_materiales=create dw_materiales
this.Control[]={this.cb_exportar,&
this.dw_materiales}
end on

on w_gen_cat_inventario_alerta.destroy
destroy(this.cb_exportar)
destroy(this.dw_materiales)
end on

event open;dw_materiales.settransobject(gtr_sumuia)
dw_materiales.Retrieve(gi_depto,gi_area)

if dw_materiales.RowCount()=0 then
	close(this)
end if
end event

type cb_exportar from commandbutton within w_gen_cat_inventario_alerta
integer x = 4250
integer y = 32
integer width = 300
integer height = 90
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Exportar"
end type

event clicked;f_exportar_reporte(dw_materiales,0,"")
end event

type dw_materiales from datawindow within w_gen_cat_inventario_alerta
integer x = 55
integer y = 157
integer width = 4498
integer height = 1683
integer taborder = 10
string title = "none"
string dataobject = "d_gen_inventario_alerta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

