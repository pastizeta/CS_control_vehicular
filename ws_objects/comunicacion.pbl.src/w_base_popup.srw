$PBExportHeader$w_base_popup.srw
$PBExportComments$Ancestro de ventana tipo popup que agrega la funcionalidad de algunas api's de windows.
forward
global type w_base_popup from w_popup
end type
end forward

global type w_base_popup from w_popup
string title = "Popup"
string icon = "uia.ico"
end type
global w_base_popup w_base_popup

type variables
n_cst_platformwin32 inv_platformwin32

str_msgparm istr_msgparm

window iw_parent
end variables

on w_base_popup.create
call super::create
end on

on w_base_popup.destroy
call super::destroy
end on

event open;call super::open;
//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  w_base_popup
//
//	Description:
//	Ancestro de ventana tipo popup que agrega la funcionalidad de algunas api's
//	de windows.
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
//	Crea el manejador de las api's de window y centra la ventana.
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
/* API's de windows.																		*/
/*----------------------------------------------------------------------*/

inv_platformwin32 = Create using "n_cst_platformwin32"

/*----------------------------------------------------------------------*/
/* Centramos la ventana.																*/
/*----------------------------------------------------------------------*/

this.of_SetBase(True)
this.inv_base.of_Center()

end event

event close;call super::close;
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	close
//
//	Arguments:
//	none
//
//	Returns:
//	long
//
//	Description:
//	Destruye al manejador de las api's de windows.
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
/* API's de windows.																		*/
/*----------------------------------------------------------------------*/

destroy inv_platformwin32
end event

