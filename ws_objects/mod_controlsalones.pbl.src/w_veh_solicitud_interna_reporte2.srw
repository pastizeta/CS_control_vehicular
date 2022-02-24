$PBExportHeader$w_veh_solicitud_interna_reporte2.srw
forward
global type w_veh_solicitud_interna_reporte2 from window
end type
type cb_2 from commandbutton within w_veh_solicitud_interna_reporte2
end type
type cb_1 from commandbutton within w_veh_solicitud_interna_reporte2
end type
type dw_1 from datawindow within w_veh_solicitud_interna_reporte2
end type
type gb_titulo from groupbox within w_veh_solicitud_interna_reporte2
end type
end forward

global type w_veh_solicitud_interna_reporte2 from window
integer width = 3877
integer height = 2320
boolean titlebar = true
string title = "Solicitud interna"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_titulo gb_titulo
end type
global w_veh_solicitud_interna_reporte2 w_veh_solicitud_interna_reporte2

type variables
long il_id=0, il_vehiculo=0, il_chofer=0

datastore ids_solicitud
DatawindowChild idwc_vehiculos_disponibles, idwc_choferes_disponibles

end variables

on w_veh_solicitud_interna_reporte2.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_titulo=create gb_titulo
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_titulo}
end on

on w_veh_solicitud_interna_reporte2.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_titulo)
end on

event open;il_id = Message.DoubleParm

dw_1.SetTransObject ( gtr_cv )
dw_1.Retrieve ( il_id )

end event

event close;CloseWithReturn(this,0)
end event

type cb_2 from commandbutton within w_veh_solicitud_interna_reporte2
integer x = 2098
integer y = 2040
integer width = 457
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Regresar"
end type

event clicked;CloseWithReturn(Parent,0)
end event

type cb_1 from commandbutton within w_veh_solicitud_interna_reporte2
integer x = 1230
integer y = 2040
integer width = 457
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Imprimir"
end type

event clicked;IF dw_1.RowCount ( ) > 0 THEN
//	// Imprimir a dos caras ...
//	dw_1.Object.DataWindow.Print.Duplex = 3
	dw_1.Print ( )
	MessageBox ( "Confirmación:" , "Se envió la impresión" )
END IF
end event

type dw_1 from datawindow within w_veh_solicitud_interna_reporte2
integer x = 133
integer y = 164
integer width = 3552
integer height = 1796
integer taborder = 10
string title = "none"
string dataobject = "d_veh_rpt_solicitud_interna_composite2"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_titulo from groupbox within w_veh_solicitud_interna_reporte2
integer x = 50
integer y = 44
integer width = 3739
integer height = 2172
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
end type

