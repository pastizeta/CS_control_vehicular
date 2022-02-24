$PBExportHeader$w_gen_cambia_area.srw
forward
global type w_gen_cambia_area from window
end type
type dw_catalogo from datawindow within w_gen_cambia_area
end type
type cb_cambiar from commandbutton within w_gen_cambia_area
end type
type gb_titulo from groupbox within w_gen_cambia_area
end type
end forward

global type w_gen_cambia_area from window
integer width = 2933
integer height = 1341
boolean titlebar = true
string title = "Cambia de área"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_catalogo dw_catalogo
cb_cambiar cb_cambiar
gb_titulo gb_titulo
end type
global w_gen_cambia_area w_gen_cambia_area

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
using gtr_web; 

if gtr_web.SQLCode = -1 then 
	messagebox("Error WEB: Obtener id", gtr_web.SQLErrText)	
	rollback using gtr_web;
	return -1
else
	commit using gtr_web;	
end if

return(li_id)
end function

on w_gen_cambia_area.create
this.dw_catalogo=create dw_catalogo
this.cb_cambiar=create cb_cambiar
this.gb_titulo=create gb_titulo
this.Control[]={this.dw_catalogo,&
this.cb_cambiar,&
this.gb_titulo}
end on

on w_gen_cambia_area.destroy
destroy(this.dw_catalogo)
destroy(this.cb_cambiar)
destroy(this.gb_titulo)
end on

event open;integer li_i

dw_catalogo.settransobject(gtr_sumuia)
dw_catalogo.Retrieve(gi_depto)

for li_i=1 to dw_catalogo.Rowcount()
	if dw_catalogo.GetItemNumber(li_i,'cvearea')=gi_area then dw_catalogo.SetItem(li_i,'cbox',1)
next
end event

type dw_catalogo from datawindow within w_gen_cambia_area
integer x = 91
integer y = 128
integer width = 2706
integer height = 835
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cambia_area"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer li_check, li_i

if row>0 then
	li_check=dw_catalogo.GetItemNumber(row,'cbox')
	
	for li_i=1 to dw_catalogo.Rowcount()
		if li_check=0 and row=li_i then 
			dw_catalogo.SetItem(li_i,'cbox',1)
		else
			dw_catalogo.SetItem(li_i,'cbox',0)
		end if
	next
end if
end event

type cb_cambiar from commandbutton within w_gen_cambia_area
integer x = 2117
integer y = 1072
integer width = 739
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cambiar área"
end type

event clicked;integer li_i, li_check, li_marcado=0, li_row

for li_i=1 to dw_catalogo.Rowcount()
	li_check=dw_catalogo.GetItemNumber(li_i,'cbox')
	if li_check=1 then 
		li_marcado=li_marcado+1
		li_row=li_i
	end if
next

if li_marcado=0 then
	messagebox('Aviso','Debe seleccionar el área')
elseif li_marcado > 1 then
	messagebox('Aviso','Debe seleccionar sólo un área')
else
	gi_area=dw_catalogo.GetItemNumber(li_row,'cvearea')
	messagebox('Aviso','Se ha cambiado el área')
	close(w_gen_cambia_area)
end if
end event

type gb_titulo from groupbox within w_gen_cambia_area
integer x = 51
integer y = 35
integer width = 2809
integer height = 982
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Áreas"
end type

