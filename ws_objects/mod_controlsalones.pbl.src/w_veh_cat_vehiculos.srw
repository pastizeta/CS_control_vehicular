$PBExportHeader$w_veh_cat_vehiculos.srw
forward
global type w_veh_cat_vehiculos from window
end type
type dw_catalogo from datawindow within w_veh_cat_vehiculos
end type
type cb_nuevo from commandbutton within w_veh_cat_vehiculos
end type
type gb_titulo from groupbox within w_veh_cat_vehiculos
end type
end forward

global type w_veh_cat_vehiculos from window
integer width = 7142
integer height = 1808
boolean titlebar = true
string title = "Catálogo de vehículos"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_catalogo dw_catalogo
cb_nuevo cb_nuevo
gb_titulo gb_titulo
end type
global w_veh_cat_vehiculos w_veh_cat_vehiculos

type variables
integer ii_id
end variables

forward prototypes
public function integer f_ultimo_id ()
end prototypes

public function integer f_ultimo_id ();integer li_id

select isnull(max(id),0)
into :li_id
from dbo.via_cat_servicios
using gtr_cv; 

if gtr_cv.SQLCode = -1 then 
	messagebox("Error WEB: Obtener id", gtr_cv.SQLErrText)	
	rollback using gtr_cv;
	return -1
else
	commit using gtr_cv;	
end if

return(li_id)
end function

on w_veh_cat_vehiculos.create
this.dw_catalogo=create dw_catalogo
this.cb_nuevo=create cb_nuevo
this.gb_titulo=create gb_titulo
this.Control[]={this.dw_catalogo,&
this.cb_nuevo,&
this.gb_titulo}
end on

on w_veh_cat_vehiculos.destroy
destroy(this.dw_catalogo)
destroy(this.cb_nuevo)
destroy(this.gb_titulo)
end on

event open;dw_catalogo.settransobject(gtr_cv)

dw_catalogo.Retrieve(0)


end event

type dw_catalogo from datawindow within w_veh_cat_vehiculos
integer x = 91
integer y = 128
integer width = 6894
integer height = 1338
integer taborder = 10
string title = "none"
string dataobject = "d_veh_cat_vehiculos_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_id=dw_catalogo.GetItemNumber(currentrow,'id')
end event

event doubleclicked;integer li_respuesta
long ll_id

if row>0 then
	if isvalid(w_veh_cat_vehiculos_edita) then close(w_veh_cat_vehiculos_edita) 
	ll_id=dw_catalogo.GetItemNumber(row,'id')
	openwithparm(w_veh_cat_vehiculos_edita,ll_id)
	li_respuesta=Message.DoubleParm
	dw_catalogo.Retrieve(0)
end if
end event

type cb_nuevo from commandbutton within w_veh_cat_vehiculos
integer x = 674
integer y = 1555
integer width = 380
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Nuevo"
end type

event clicked;integer li_respuesta

if isvalid(w_veh_cat_vehiculos_edita) then close(w_veh_cat_vehiculos_edita) 
openwithparm(w_veh_cat_vehiculos_edita,0)
li_respuesta=Message.DoubleParm

dw_catalogo.Retrieve(0)

end event

type gb_titulo from groupbox within w_veh_cat_vehiculos
integer x = 51
integer y = 35
integer width = 6996
integer height = 1482
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Vehículos"
end type

