$PBExportHeader$uo_cst_datetimepicker.sru
$PBExportComments$Objeto descendiente de uo_datetimepicker. Personalizado para ser usado en w_periodo_aplica.
forward
global type uo_cst_datetimepicker from uo_datetimepicker
end type
end forward

global type uo_cst_datetimepicker from uo_datetimepicker
integer width = 402
integer height = 80
end type
global uo_cst_datetimepicker uo_cst_datetimepicker

on uo_cst_datetimepicker.create
call super::create
end on

on uo_cst_datetimepicker.destroy
call super::destroy
end on

type ole_1 from uo_datetimepicker`ole_1 within uo_cst_datetimepicker
integer width = 402
integer height = 80
integer textsize = -8
end type

event ole_1::constructor;call super::constructor;
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Arguments:
//	none
//
//	Returns:
//	long
//
//	Description:
//	Inicializa la propiedad font con los valores por default.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

//this.object.Font.Italic = TRUE
//this.object.Font.bold = TRUE
this.object.Font.Name = "Arial"
this.object.Font.Size = 8
end event

event ole_1::keydown;call super::keydown;
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	keydown
//
//	Arguments:
//	integer	keycode
//	integer	shift		Las teclas modificadoras y los botones de ratón que
//							son presionados. El valor de las banderas es la suma
//							de los valores para todas las teclas y botones
//							presionados.
//
//	Returns:
//	none
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

CHOOSE CASE keycode
	CASE 13
		keybd_event(9,0,0,0)
		keybd_event(9,0,2,0)		
//	CASE KeyUpArrow!,KeyLeftArrow!
//		keybd_event(16,0,0,0)
//		keybd_event(9,0,0,0)
//		keybd_event(16,0,2,0)
//		keybd_event(9,0,2,0)		
//	CASE KeyDownArrow!,KeyRightArrow!
//		keybd_event(9,0,0,0)
//		keybd_event(9,0,2,0)		
END CHOOSE

end event

