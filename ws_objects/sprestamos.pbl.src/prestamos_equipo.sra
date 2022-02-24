$PBExportHeader$prestamos_equipo.sra
$PBExportComments$Generated Application Object
forward
global type prestamos_equipo from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
integer gi_depto,gi_area, giUsuarioId, giUsuarioNivel, giUsuarioCve
string gs_pass,gs_usuario, gs_path,gs_password, gs_tlector, gs_depto
string gs_ok, gsGupoUsuario, gsAsignadoA
string gs_startupfile = "control_vehicular.ini"
transaction gtr_personal, gtr_decse, gtr_tesoreria, gtr_sce, gtr_web,gtr_cv

datawindow dw
commandbutton actualizar, nuevo, eliminar
Datawindowchild gruposdepto

n_tr  gtr_sumuia, gtr_seguridad, gtr_escolar
n_cst_appmanager_admin gnv_app
mailSession ms_sesion

// Nvo sep2011
string gs_lector_activ

string gs_path_sistema,gs_deptocoor

integer gi_deptocoor 
integer gi_areamul=0

end variables
global type prestamos_equipo from application
string appname = "prestamos_equipo"
string appruntimeversion = "21.0.0.1288"
end type
global prestamos_equipo prestamos_equipo

type prototypes
//Function uLong GetVersionExA( Ref str_osversioninfo lpVersionInfo ) Library "kernel32.dll"
Subroutine keybd_event( int bVk, int bScan, int dwFlags, int dwExtraInfo) Library "user32.dll" 
Function boolean GetKeyboardState(ref integer kbarray[256])  Library "USER32.DLL"
Function boolean SetKeyboardState(ref integer kbarray[256]) Library "USER32.DLL"
Function boolean SetCurrentDirectory (ref string lpPathName) Library "KERNEL32.DLL" Alias for "SetCurrentDirectoryA;Ansi"
FUNCTION ulong GetCurrentDirectoryA(ulong BufferLen, ref string currentdir) LIBRARY "Kernel32.dll" alias for "GetCurrentDirectoryA;Ansi"
FUNCTION ulong FindWindowA (ulong Winhandle, string Wintitle) Library 'user32' alias for "FindWindowA;Ansi"

end prototypes

type variables

end variables

on prestamos_equipo.create
appname="prestamos_equipo"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on prestamos_equipo.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;gnv_app = create n_cst_appmanager_admin
gnv_app.event pfc_open(commandline)
open(w_login)

end event

event close;
disconnect using gtr_sumuia;
disconnect using gtr_escolar;
gnv_app.event pfc_close()
destroy gnv_app

GarbageCollect ( )

Restart()
end event

event connectionbegin;return gnv_app.event pfc_connectionbegin(userid,password,connectstring)
end event

event connectionend;gnv_app.event pfc_connectionend()
end event

event idle;gnv_app.event pfc_idle()
end event

event systemerror;gnv_app.event pfc_systemerror()
end event

