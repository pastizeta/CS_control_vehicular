$PBExportHeader$w_exportar.srw
$PBExportComments$Global de VEHICULOS por TIPO DE INCIDENTE
forward
global type w_exportar from window
end type
type dw_corporacion from u_basedw within w_exportar
end type
end forward

global type w_exportar from window
integer width = 2534
integer height = 1501
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_corporacion dw_corporacion
end type
global w_exportar w_exportar

on w_exportar.create
this.dw_corporacion=create dw_corporacion
this.Control[]={this.dw_corporacion}
end on

on w_exportar.destroy
destroy(this.dw_corporacion)
end on

type dw_corporacion from u_basedw within w_exportar
integer x = 219
integer y = 64
integer width = 622
integer height = 74
integer taborder = 10
boolean enabled = false
string dataobject = "d_cat_corporacion_forma_f"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("abreviacion", "abreviacion", "abreviacion")
end event

