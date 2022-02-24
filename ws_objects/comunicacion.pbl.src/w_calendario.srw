$PBExportHeader$w_calendario.srw
$PBExportComments$Ventana ancestro que muestra un calendario derivado del objeto MonthView de Microsoft. Usado para seleccionar una fecha.
forward
global type w_calendario from w_base_popup
end type
type uo_calendario from uo_cst_monthview within w_calendario
end type
type cb_aplicar from commandbutton within w_calendario
end type
type cb_cerrar from commandbutton within w_calendario
end type
end forward

global type w_calendario from w_base_popup
integer width = 1061
integer height = 1032
string title = "Calendario"
long backcolor = 67108864
event ue_message ( )
uo_calendario uo_calendario
cb_aplicar cb_aplicar
cb_cerrar cb_cerrar
end type
global w_calendario w_calendario

type variables

end variables

event ue_message();
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	ue_message
//
//	Arguments:
//	none
//
//	Returns:
//	none
//
//	Description:
//	Inicializa el calendario con la fecha pasada por message.powerobjectparm.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

any la_data[]
//
istr_msgparm = message.powerobjectparm
la_data = istr_msgparm.data

this.uo_calendario.of_value(la_data[1])
end event

on w_calendario.create
int iCurrent
call super::create
this.uo_calendario=create uo_calendario
this.cb_aplicar=create cb_aplicar
this.cb_cerrar=create cb_cerrar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_calendario
this.Control[iCurrent+2]=this.cb_aplicar
this.Control[iCurrent+3]=this.cb_cerrar
end on

on w_calendario.destroy
call super::destroy
destroy(this.uo_calendario)
destroy(this.cb_aplicar)
destroy(this.cb_cerrar)
end on

event open;call super::open;
//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  w_calendario
//
//	Description:
//	Ventana ancestro que muestra un calendario derivado del objeto MonthView de
//	Microsoft. Usado para seleccionar una fecha.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	open
//
//	Arguments:
//	none
//
//	Returns:
//	long
//
//	Description:
//	Procesa los parámetros pasados por message.powerobjectparm a través del
//	evento ue_message().
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

/*----------------------------------------------------------------------*/
/* Iniciamos...																			*/
/*----------------------------------------------------------------------*/

event ue_message()

end event

type uo_calendario from uo_cst_monthview within w_calendario
integer width = 919
integer height = 732
integer taborder = 10
boolean border = true
borderstyle borderstyle = styleraised!
end type

on uo_calendario.destroy
call uo_cst_monthview::destroy
end on

type cb_aplicar from commandbutton within w_calendario
event ue_keydown pbm_keydown
integer x = 91
integer y = 788
integer width = 352
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aplicar"
end type

event ue_keydown;
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	ue_keydown
//
//	Arguments:
//	keycode			key
//	unsignedlong	keyflags
//						1=shift key
//						2=ctrl key
//						3=shift and ctrl keys
//
//	Returns:
//	long
//
//	Description:
//	Usa la función keybd_event (api de windows) para realizar una acción de
//	teclado.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

CHOOSE CASE key
	CASE KeyEnter!
		this.triggerevent(clicked!)
	CASE KeyUpArrow!,KeyLeftArrow!
		keybd_event(16,0,0,0)
		keybd_event(9,0,0,0)
		keybd_event(16,0,2,0)
		keybd_event(9,0,2,0)		
	CASE KeyDownArrow!,KeyRightArrow!
		keybd_event(9,0,0,0)
		keybd_event(9,0,2,0)		
END CHOOSE

end event

event clicked;
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Arguments:
//	none
//
//	Returns:
//	long
//
//	Description:
//	Asigna la fecha seleccionada en la variable istr_msgparm.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

any la_data[]

la_data[1] = parent.uo_calendario.of_value()
istr_msgparm.data = la_data
message.powerobjectparm = istr_msgparm

end event

type cb_cerrar from commandbutton within w_calendario
event remotesend pbm_ddepoke
event ue_keydown pbm_keydown
integer x = 457
integer y = 788
integer width = 352
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_keydown;
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	ue_keydown
//
//	Arguments:
//	keycode			key
//	unsignedlong	keyflags
//						1=shift key
//						2=ctrl key
//						3=shift and ctrl keys
//
//	Returns:
//	long
//
//	Description:
//	Usa la función keybd_event (api de windows) para realizar una acción de
//	teclado.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

//CHOOSE CASE key
//	CASE KeyEnter!
//		this.triggerevent(clicked!)
//	CASE KeyUpArrow!,KeyLeftArrow!
//		keybd_event(16,0,0,0)
//		keybd_event(9,0,0,0)
//		keybd_event(16,0,2,0)
//		keybd_event(9,0,2,0)		
//	CASE KeyDownArrow!,KeyRightArrow!
//		keybd_event(9,0,0,0)
//		keybd_event(9,0,2,0)		
//END CHOOSE

end event

event clicked;
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Arguments:
//	none
//
//	Returns:
//	long
//
//	Description:
//	Cierra la ventana.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

close (parent)
end event

