$PBExportHeader$w_veh_cat_servicios_edita.srw
forward
global type w_veh_cat_servicios_edita from window
end type
type cb_eliminar from commandbutton within w_veh_cat_servicios_edita
end type
type mle_descripcion from multilineedit within w_veh_cat_servicios_edita
end type
type cb_guardar from commandbutton within w_veh_cat_servicios_edita
end type
type gb_titulo from groupbox within w_veh_cat_servicios_edita
end type
end forward

global type w_veh_cat_servicios_edita from window
integer width = 2922
integer height = 1040
boolean titlebar = true
string title = "Servicio/Mantenimiento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_eliminar cb_eliminar
mle_descripcion mle_descripcion
cb_guardar cb_guardar
gb_titulo gb_titulo
end type
global w_veh_cat_servicios_edita w_veh_cat_servicios_edita

type variables
long il_id=0
datastore ids_catalogo
end variables

forward prototypes
public function long uf_ultimo_id ()
end prototypes

public function long uf_ultimo_id ();long ll_id

select isnull(max(id),0)
into :ll_id
from dbo.via_cat_servicios
using gtr_cv; 

if gtr_cv.SQLCode = -1 then 
	messagebox("Error WEB: Obtener id", gtr_cv.SQLErrText)	
	rollback using gtr_cv;
	return -1
else
	commit using gtr_cv;	
end if

return(ll_id)
end function

on w_veh_cat_servicios_edita.create
this.cb_eliminar=create cb_eliminar
this.mle_descripcion=create mle_descripcion
this.cb_guardar=create cb_guardar
this.gb_titulo=create gb_titulo
this.Control[]={this.cb_eliminar,&
this.mle_descripcion,&
this.cb_guardar,&
this.gb_titulo}
end on

on w_veh_cat_servicios_edita.destroy
destroy(this.cb_eliminar)
destroy(this.mle_descripcion)
destroy(this.cb_guardar)
destroy(this.gb_titulo)
end on

event open;integer li_i
il_id = Message.DoubleParm	

ids_catalogo =  create datastore
ids_catalogo.dataobject ='d_veh_cat_servicios_edit'
ids_catalogo.settransobject(gtr_cv)

if il_id>0 then
	ids_catalogo.Retrieve(il_id)
	mle_descripcion.text=ids_catalogo.GetItemString(1,'descripcion')
else
	if ids_catalogo.accepttext()=1 then
		li_i=ids_catalogo.insertrow(0)
		ids_catalogo.setcolumn(1)
	end if
end if

mle_descripcion.SetFocus()
end event

event close;CloseWithReturn(this,0)
end event

type cb_eliminar from commandbutton within w_veh_cat_servicios_edita
integer x = 2428
integer y = 758
integer width = 380
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Eliminar"
end type

event clicked;if il_id>0 then
	ids_catalogo.setitem(1,'activo',0)
	if ids_catalogo.update()>0 then
		commit using gtr_cv;
	else
		messagebox("Error: "+gtr_cv.sqlerrtext,"El catálogo no fue actualizado.",stopsign!)
		rollback using gtr_cv;
	end if
end if

CloseWithReturn(w_veh_cat_servicios_edita,0)

end event

type mle_descripcion from multilineedit within w_veh_cat_servicios_edita
integer x = 91
integer y = 154
integer width = 2710
integer height = 563
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_guardar from commandbutton within w_veh_cat_servicios_edita
integer x = 2004
integer y = 758
integer width = 380
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Guardar"
boolean default = true
end type

event clicked;string ls_descripcion

ls_descripcion=trim(mle_descripcion.text)

if len(ls_descripcion)=0 or len(ls_descripcion)>100 then
	messagebox('Aviso','La descripción no puede ser mayor a 100 caracteres')
	return
end if

if il_id=0 then
	il_id=uf_ultimo_id()+1
	ids_catalogo.setitem(1,'id',il_id)	
	ids_catalogo.setitem(1,'activo',1)	
end if

ids_catalogo.setitem(1,'descripcion',ls_descripcion)	

if ids_catalogo.update()>0 then
	commit using gtr_cv;
	CloseWithReturn(w_veh_cat_servicios_edita,0)
else
	messagebox("Error: "+gtr_cv.sqlerrtext,"El catálogo no fue actualizado.",stopsign!)
	rollback using gtr_cv;
end if

end event

type gb_titulo from groupbox within w_veh_cat_servicios_edita
integer x = 44
integer y = 35
integer width = 2823
integer height = 896
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Edición de Servicio/Mantenimiento"
end type

