$PBExportHeader$w_comn_prestamo_cantidad.srw
forward
global type w_comn_prestamo_cantidad from window
end type
type cb_guardar from commandbutton within w_comn_prestamo_cantidad
end type
type st_1 from statictext within w_comn_prestamo_cantidad
end type
type sle_cantidad from singlelineedit within w_comn_prestamo_cantidad
end type
end forward

global type w_comn_prestamo_cantidad from window
integer width = 951
integer height = 400
boolean titlebar = true
string title = "Cantidad a Solicitar"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_guardar cb_guardar
st_1 st_1
sle_cantidad sle_cantidad
end type
global w_comn_prestamo_cantidad w_comn_prestamo_cantidad

type variables
integer ii_cantidad=0, ii_maximo
end variables

on w_comn_prestamo_cantidad.create
this.cb_guardar=create cb_guardar
this.st_1=create st_1
this.sle_cantidad=create sle_cantidad
this.Control[]={this.cb_guardar,&
this.st_1,&
this.sle_cantidad}
end on

on w_comn_prestamo_cantidad.destroy
destroy(this.cb_guardar)
destroy(this.st_1)
destroy(this.sle_cantidad)
end on

event open;ii_maximo = Message.DoubleParm	

end event

event close;CloseWithReturn(this,ii_cantidad)
end event

type cb_guardar from commandbutton within w_comn_prestamo_cantidad
integer x = 505
integer y = 147
integer width = 358
integer height = 93
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Enviar"
boolean default = true
end type

event clicked;

if isnumber(trim(sle_cantidad.text)) then
	ii_cantidad=integer(trim(sle_cantidad.text))
	if ii_cantidad<=ii_maximo then
		close(w_comn_prestamo_cantidad)
	else
		ii_cantidad=0
		messagebox('Atención','La cantidad máxima a solicitar es: '+string(ii_maximo))
	end if
else
	ii_cantidad=0
	messagebox('Atención','Introduzca una cantidad')
end if
end event

type st_1 from statictext within w_comn_prestamo_cantidad
integer x = 88
integer y = 51
integer width = 413
integer height = 61
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Cantidad"
boolean focusrectangle = false
end type

type sle_cantidad from singlelineedit within w_comn_prestamo_cantidad
integer x = 91
integer y = 150
integer width = 358
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

