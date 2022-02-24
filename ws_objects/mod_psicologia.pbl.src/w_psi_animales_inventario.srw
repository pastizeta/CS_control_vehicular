$PBExportHeader$w_psi_animales_inventario.srw
forward
global type w_psi_animales_inventario from window
end type
type cb_guardar from commandbutton within w_psi_animales_inventario
end type
type cb_nuevo from commandbutton within w_psi_animales_inventario
end type
type st_reservaciones from statictext within w_psi_animales_inventario
end type
type dw_inventario from datawindow within w_psi_animales_inventario
end type
type gb_1 from groupbox within w_psi_animales_inventario
end type
end forward

global type w_psi_animales_inventario from window
integer width = 6671
integer height = 2054
boolean titlebar = true
string title = "Inventario de animales"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_guardar cb_guardar
cb_nuevo cb_nuevo
st_reservaciones st_reservaciones
dw_inventario dw_inventario
gb_1 gb_1
end type
global w_psi_animales_inventario w_psi_animales_inventario

type variables

end variables

forward prototypes
public subroutine f_cargar_reporte ()
public subroutine uf_cargar_inventario ()
end prototypes

public subroutine f_cargar_reporte ();
dw_inventario.SetRedraw(false)
dw_inventario.Retrieve()
dw_inventario.SetRedraw(true)


end subroutine

public subroutine uf_cargar_inventario ();integer li_actualiza

openwithparm(w_psi_animales_inventario_carga,0)
li_actualiza=Message.DoubleParm

if li_actualiza = 1 then f_cargar_reporte()
end subroutine

on w_psi_animales_inventario.create
this.cb_guardar=create cb_guardar
this.cb_nuevo=create cb_nuevo
this.st_reservaciones=create st_reservaciones
this.dw_inventario=create dw_inventario
this.gb_1=create gb_1
this.Control[]={this.cb_guardar,&
this.cb_nuevo,&
this.st_reservaciones,&
this.dw_inventario,&
this.gb_1}
end on

on w_psi_animales_inventario.destroy
destroy(this.cb_guardar)
destroy(this.cb_nuevo)
destroy(this.st_reservaciones)
destroy(this.dw_inventario)
destroy(this.gb_1)
end on

event open;dw_inventario.settransobject(gtr_sumuia)
post f_cargar_reporte()
end event

type cb_guardar from commandbutton within w_psi_animales_inventario
integer x = 5138
integer y = 1802
integer width = 519
integer height = 131
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar"
end type

event clicked;integer li_i, NET

if dw_inventario.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 			
		
		if dw_inventario.update()>0 then
			commit using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
		else
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito. "+gtr_sumuia.SQLErrText,stopsign!)
			rollback using gtr_sumuia;
		end if
		
		dw_inventario.Reset()
		dw_inventario.Retrieve()

	end if

end if
	

end event

type cb_nuevo from commandbutton within w_psi_animales_inventario
integer x = 5687
integer y = 1802
integer width = 933
integer height = 131
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Agregar animales a inventario"
end type

event clicked;uf_cargar_inventario()
end event

type st_reservaciones from statictext within w_psi_animales_inventario
integer x = 3504
integer y = 2653
integer width = 812
integer height = 74
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Reservaciones: 0"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_inventario from datawindow within w_psi_animales_inventario
integer x = 95
integer y = 99
integer width = 6484
integer height = 1629
integer taborder = 30
string title = "none"
string dataobject = "d_psi_animales_inventario"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_psi_animales_inventario
integer x = 51
integer y = 22
integer width = 6576
integer height = 1738
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Inventario"
end type

