$PBExportHeader$w_msg_procesando_correo.srw
forward
global type w_msg_procesando_correo from window
end type
type st_1 from statictext within w_msg_procesando_correo
end type
end forward

global type w_msg_procesando_correo from window
integer width = 1449
integer height = 280
boolean titlebar = true
string title = "Enviando correo"
boolean controlmenu = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
end type
global w_msg_procesando_correo w_msg_procesando_correo

on w_msg_procesando_correo.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_msg_procesando_correo.destroy
destroy(this.st_1)
end on

type st_1 from statictext within w_msg_procesando_correo
integer x = 37
integer y = 56
integer width = 1339
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

