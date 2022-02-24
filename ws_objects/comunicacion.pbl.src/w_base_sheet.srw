$PBExportHeader$w_base_sheet.srw
$PBExportComments$Ancestro de ventana tipo sheet que agrega la funcionalidad de algunas api's de windows.
forward
global type w_base_sheet from w_sheet
end type
end forward

global type w_base_sheet from w_sheet
string title = "Sheet"
string icon = "uia.ico"
end type
global w_base_sheet w_base_sheet

type variables
n_cst_platformwin32 inv_platformwin32

str_msgparm istr_msgparm

end variables

on w_base_sheet.create
call super::create
end on

on w_base_sheet.destroy
call super::destroy
end on

event open;call super::open;
//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  w_base_sheet
//
//	Description:
//	Ancestro de ventana tipo sheet que agrega la funcionalidad de algunas api's
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
//	Crea el manejador de las api's de window.
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

