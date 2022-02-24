$PBExportHeader$w_tempo3.srw
forward
global type w_tempo3 from window
end type
type cb_3 from commandbutton within w_tempo3
end type
type cb_2 from commandbutton within w_tempo3
end type
type dw_1 from datawindow within w_tempo3
end type
type cb_1 from commandbutton within w_tempo3
end type
end forward

global type w_tempo3 from window
integer width = 3959
integer height = 1648
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
end type
global w_tempo3 w_tempo3

on w_tempo3.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.dw_1,&
this.cb_1}
end on

on w_tempo3.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;dw_1.settransobject(gtr_sumuia)

//	select isnull(max(no_reg),0)+1,:contenido from t_tempo3 using gtr_sce;

end event

type cb_3 from commandbutton within w_tempo3
integer x = 334
integer y = 1032
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Actualiza"
end type

event clicked;string contenido
long no_reg

dw_1.object.dato[dw_1.getrow()]='holitas'


if isnull(dw_1.object.no_reg[dw_1.getrow()]) then
	select isnull(max(no_reg),0)+1 into :no_reg from t_tempo3 using gtr_sumuia;


	dw_1.object.no_reg[dw_1.getrow()]=no_reg
end if



//insert into t_tempo3 
	//select isnull(max(no_reg),0)+1,:contenido from t_tempo3 using gtr_sce;
	
//insert into t_tempo3 
	//select isnull(max(no_reg),0)+1,:contenido from t_tempo3 using gtr_sumuia;


dw_1.update()
commit using gtr_sumuia;
end event

type cb_2 from commandbutton within w_tempo3
integer x = 329
integer y = 784
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "inserta dw"
end type

event clicked;if(dw_1.rowcount()<1) then
	dw_1.insertrow(0)
end if
end event

type dw_1 from datawindow within w_tempo3
integer x = 855
integer y = 676
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "dw_t_tempo3"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_tempo3
integer x = 370
integer y = 352
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;string contenido

contenido='holitas'

//insert into t_tempo3 
	//select isnull(max(no_reg),0)+1,:contenido from t_tempo3 using gtr_sce;
	
insert into t_tempo3 
	select isnull(max(no_reg),0)+1,:contenido from t_tempo3 using gtr_sumuia;
	

end event

