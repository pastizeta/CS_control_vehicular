$PBExportHeader$w_veh_cat_motivos_rechazo.srw
forward
global type w_veh_cat_motivos_rechazo from window
end type
type dw_catalogo from datawindow within w_veh_cat_motivos_rechazo
end type
type cb_nuevo from commandbutton within w_veh_cat_motivos_rechazo
end type
type gb_titulo from groupbox within w_veh_cat_motivos_rechazo
end type
end forward

global type w_veh_cat_motivos_rechazo from window
integer width = 3447
integer height = 1808
boolean titlebar = true
string title = "Catálogo de motivos de rechazo"
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
global w_veh_cat_motivos_rechazo w_veh_cat_motivos_rechazo

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

on w_veh_cat_motivos_rechazo.create
this.dw_catalogo=create dw_catalogo
this.cb_nuevo=create cb_nuevo
this.gb_titulo=create gb_titulo
this.Control[]={this.dw_catalogo,&
this.cb_nuevo,&
this.gb_titulo}
end on

on w_veh_cat_motivos_rechazo.destroy
destroy(this.dw_catalogo)
destroy(this.cb_nuevo)
destroy(this.gb_titulo)
end on

event open;dw_catalogo.settransobject(gtr_cv)

dw_catalogo.Retrieve(0)


end event

type dw_catalogo from datawindow within w_veh_cat_motivos_rechazo
integer x = 91
integer y = 128
integer width = 3223
integer height = 1340
integer taborder = 10
string title = "none"
string dataobject = "d_veh_cat_motivos_rechazo_edit"
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
	if isvalid(w_veh_cat_motivos_rechazo_edita) then close(w_veh_cat_motivos_rechazo_edita) 
	ll_id=dw_catalogo.GetItemNumber(row,'id')
	openwithparm(w_veh_cat_motivos_rechazo_edita,ll_id)
	li_respuesta=Message.DoubleParm
	dw_catalogo.Retrieve(0)
end if
end event

type cb_nuevo from commandbutton within w_veh_cat_motivos_rechazo
integer x = 2999
integer y = 1556
integer width = 379
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

if isvalid(w_veh_cat_motivos_rechazo_edita) then close(w_veh_cat_motivos_rechazo_edita) 
openwithparm(w_veh_cat_motivos_rechazo_edita,0)
li_respuesta=Message.DoubleParm

dw_catalogo.Retrieve(0)

end event

type gb_titulo from groupbox within w_veh_cat_motivos_rechazo
integer x = 50
integer y = 36
integer width = 3319
integer height = 1484
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Motivos de rechazo"
end type

