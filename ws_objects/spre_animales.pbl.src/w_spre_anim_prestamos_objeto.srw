$PBExportHeader$w_spre_anim_prestamos_objeto.srw
forward
global type w_spre_anim_prestamos_objeto from window
end type
type cb_1 from commandbutton within w_spre_anim_prestamos_objeto
end type
end forward

global type w_spre_anim_prestamos_objeto from window
integer width = 3959
integer height = 1648
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
end type
global w_spre_anim_prestamos_objeto w_spre_anim_prestamos_objeto

on w_spre_anim_prestamos_objeto.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_spre_anim_prestamos_objeto.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_spre_anim_prestamos_objeto
integer x = 297
integer y = 16
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;
//uo_1.inicializa(10566,3,"Cesar Ponce","2191034","El profesor","El usuario",2,2,gtr_sumuia) // intercambio
end event

