$PBExportHeader$w_com_cursos_prop.srw
$PBExportComments$Ventana utilizada para realizar la administración de los curso propédeuticos
forward
global type w_com_cursos_prop from w_modelo_cap
end type
end forward

global type w_com_cursos_prop from w_modelo_cap
integer width = 2025
end type
global w_com_cursos_prop w_com_cursos_prop

on w_com_cursos_prop.create
call super::create
end on

on w_com_cursos_prop.destroy
call super::destroy
end on

event open;dw_cap.Retrieve()
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_com_cursos_prop
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_com_cursos_prop
integer x = 997
integer y = 1348
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_com_cursos_prop
integer x = 1403
integer y = 1348
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_com_cursos_prop
integer x = 590
integer y = 1348
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_com_cursos_prop
integer x = 183
integer y = 1348
end type

type dw_cap from w_modelo_cap`dw_cap within w_com_cursos_prop
integer width = 1920
string dataobject = "d_com_cursos_prope"
end type

