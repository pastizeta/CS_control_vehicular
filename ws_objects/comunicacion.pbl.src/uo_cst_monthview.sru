$PBExportHeader$uo_cst_monthview.sru
$PBExportComments$Objeto descendiente de uo_monthview. Personalizado para ser usado en w_calendario.
forward
global type uo_cst_monthview from uo_monthview
end type
end forward

global type uo_cst_monthview from uo_monthview
integer width = 850
integer height = 764
end type
global uo_cst_monthview uo_cst_monthview

on uo_cst_monthview.create
call super::create
end on

on uo_cst_monthview.destroy
call super::destroy
end on

type ole_1 from uo_monthview`ole_1 within uo_cst_monthview
integer x = 5
integer y = 28
end type

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

