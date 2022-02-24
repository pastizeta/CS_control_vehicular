$PBExportHeader$w_ppal.srw
forward
global type w_ppal from window
end type
type mdi_1 from mdiclient within w_ppal
end type
end forward

global type w_ppal from window
integer width = 2533
integer height = 1408
boolean titlebar = true
string title = "Sistema de Préstamos"
string menuname = "m_principal"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 67108864
mdi_1 mdi_1
end type
global w_ppal w_ppal

on w_ppal.create
if this.MenuName = "m_principal" then this.MenuID = create m_principal
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_ppal.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;string ls_file

gnv_app.of_setsecurity(true)
gs_password=gs_pass
gtr_seguridad=create n_tr
//gtr_seguridad.DBMS = ProfileString("control_vehicular.ini","SISPRE","DBMS","incorrecto")
//gtr_seguridad.Database = ProfileString("control_vehicular.ini","SISPRE","Database","incorrecto")
//gtr_seguridad.ServerName = ProfileString("control_vehicular.ini","SISPRE","ServerName","incorrecto")
gtr_seguridad.Autocommit=false
gtr_seguridad.LogId = gs_usuario
gtr_seguridad.LogPass = gs_password
connect using gtr_seguridad;



end event

event close;//disconnect using gtr_sumuia;
//disconnect using gtr_seguridad;
//disconnect using gtr_personal;


end event

type mdi_1 from mdiclient within w_ppal
long BackColor=268435456
end type

