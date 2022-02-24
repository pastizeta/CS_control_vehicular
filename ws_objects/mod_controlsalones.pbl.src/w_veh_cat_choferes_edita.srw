$PBExportHeader$w_veh_cat_choferes_edita.srw
forward
global type w_veh_cat_choferes_edita from window
end type
type dw_estatus from u_basedw within w_veh_cat_choferes_edita
end type
type st_7 from statictext within w_veh_cat_choferes_edita
end type
type st_6 from statictext within w_veh_cat_choferes_edita
end type
type sle_contraseniac from singlelineedit within w_veh_cat_choferes_edita
end type
type sle_contrasenia from singlelineedit within w_veh_cat_choferes_edita
end type
type st_5 from statictext within w_veh_cat_choferes_edita
end type
type sle_materno from singlelineedit within w_veh_cat_choferes_edita
end type
type st_4 from statictext within w_veh_cat_choferes_edita
end type
type sle_paterno from singlelineedit within w_veh_cat_choferes_edita
end type
type st_3 from statictext within w_veh_cat_choferes_edita
end type
type sle_nombre from singlelineedit within w_veh_cat_choferes_edita
end type
type st_1 from statictext within w_veh_cat_choferes_edita
end type
type cb_guardar from commandbutton within w_veh_cat_choferes_edita
end type
type gb_titulo from groupbox within w_veh_cat_choferes_edita
end type
end forward

global type w_veh_cat_choferes_edita from window
integer width = 2770
integer height = 1124
boolean titlebar = true
string title = "Chofer"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_estatus dw_estatus
st_7 st_7
st_6 st_6
sle_contraseniac sle_contraseniac
sle_contrasenia sle_contrasenia
st_5 st_5
sle_materno sle_materno
st_4 st_4
sle_paterno sle_paterno
st_3 st_3
sle_nombre sle_nombre
st_1 st_1
cb_guardar cb_guardar
gb_titulo gb_titulo
end type
global w_veh_cat_choferes_edita w_veh_cat_choferes_edita

type variables
long il_id=0
integer ii_estatus, li_asignado=0

datastore ids_catalogo
DatawindowChild idwc_estatus

end variables

forward prototypes
public function long uf_ultimo_id ()
end prototypes

public function long uf_ultimo_id ();long ll_id

select isnull(max(id),100)
into :ll_id
from dbo.via_cat_choferes
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

on w_veh_cat_choferes_edita.create
this.dw_estatus=create dw_estatus
this.st_7=create st_7
this.st_6=create st_6
this.sle_contraseniac=create sle_contraseniac
this.sle_contrasenia=create sle_contrasenia
this.st_5=create st_5
this.sle_materno=create sle_materno
this.st_4=create st_4
this.sle_paterno=create sle_paterno
this.st_3=create st_3
this.sle_nombre=create sle_nombre
this.st_1=create st_1
this.cb_guardar=create cb_guardar
this.gb_titulo=create gb_titulo
this.Control[]={this.dw_estatus,&
this.st_7,&
this.st_6,&
this.sle_contraseniac,&
this.sle_contrasenia,&
this.st_5,&
this.sle_materno,&
this.st_4,&
this.sle_paterno,&
this.st_3,&
this.sle_nombre,&
this.st_1,&
this.cb_guardar,&
this.gb_titulo}
end on

on w_veh_cat_choferes_edita.destroy
destroy(this.dw_estatus)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.sle_contraseniac)
destroy(this.sle_contrasenia)
destroy(this.st_5)
destroy(this.sle_materno)
destroy(this.st_4)
destroy(this.sle_paterno)
destroy(this.st_3)
destroy(this.sle_nombre)
destroy(this.st_1)
destroy(this.cb_guardar)
destroy(this.gb_titulo)
end on

event open;integer li_i

dw_estatus.settransobject(gtr_cv)
dw_estatus.getchild('descripcion',idwc_estatus)
idwc_estatus.settransobject(gtr_cv)

idwc_estatus.Retrieve()
if idwc_estatus.RowCount()>0 then dw_estatus.insertrow(0)

il_id = Message.DoubleParm	
ids_catalogo =  create datastore
ids_catalogo.dataobject ='d_veh_cat_choferes_edit'
ids_catalogo.settransobject(gtr_cv)

if il_id>0 then
	ids_catalogo.Retrieve(il_id)
	sle_nombre.text=ids_catalogo.GetItemString(1,'nombre')
	sle_paterno.text=ids_catalogo.GetItemString(1,'paterno')
	sle_materno.text=ids_catalogo.GetItemString(1,'materno')
	sle_contrasenia.text=ids_catalogo.GetItemString(1,'contrasenia')
	sle_contraseniac.text=ids_catalogo.GetItemString(1,'contrasenia')
	ii_estatus=ids_catalogo.GetItemNumber(1,'estatus')
	dw_estatus.setitem(1,'descripcion',ids_catalogo.GetItemString(1,'descr'))
	li_asignado=ids_catalogo.GetItemNumber(1,'asignado')
else
	if ids_catalogo.accepttext()=1 then
		li_i=ids_catalogo.insertrow(0)
		ids_catalogo.setcolumn(1)
	end if
end if

sle_nombre.SetFocus()
end event

event close;CloseWithReturn(this,0)
end event

type dw_estatus from u_basedw within w_veh_cat_choferes_edita
integer x = 713
integer y = 700
integer width = 1330
integer height = 100
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_veh_cat_estatus_chofer_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;ii_estatus=long(this.gettext())

end event

type st_7 from statictext within w_veh_cat_choferes_edita
integer x = 91
integer y = 684
integer width = 599
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Estatus:"
boolean focusrectangle = false
end type

type st_6 from statictext within w_veh_cat_choferes_edita
integer x = 1490
integer y = 552
integer width = 389
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Confirmar:"
boolean focusrectangle = false
end type

type sle_contraseniac from singlelineedit within w_veh_cat_choferes_edita
integer x = 1888
integer y = 536
integer width = 754
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_contrasenia from singlelineedit within w_veh_cat_choferes_edita
integer x = 713
integer y = 536
integer width = 754
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_veh_cat_choferes_edita
integer x = 91
integer y = 552
integer width = 599
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Contraseña:"
boolean focusrectangle = false
end type

type sle_materno from singlelineedit within w_veh_cat_choferes_edita
integer x = 713
integer y = 404
integer width = 1929
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_veh_cat_choferes_edita
integer x = 91
integer y = 420
integer width = 599
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Apellido materno:"
boolean focusrectangle = false
end type

type sle_paterno from singlelineedit within w_veh_cat_choferes_edita
integer x = 713
integer y = 272
integer width = 1929
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_veh_cat_choferes_edita
integer x = 91
integer y = 288
integer width = 599
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Apellido paterno:"
boolean focusrectangle = false
end type

type sle_nombre from singlelineedit within w_veh_cat_choferes_edita
integer x = 713
integer y = 140
integer width = 1929
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_veh_cat_choferes_edita
integer x = 91
integer y = 156
integer width = 370
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Nombre:"
boolean focusrectangle = false
end type

type cb_guardar from commandbutton within w_veh_cat_choferes_edita
integer x = 2258
integer y = 832
integer width = 379
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Guardar"
boolean default = true
end type

event clicked;string ls_nombre, ls_paterno, ls_materno, ls_contrasenia, ls_contraseniac

ls_nombre=trim(sle_nombre.text)
ls_paterno=trim(sle_paterno.text)
ls_materno=trim(sle_materno.text)
ls_contrasenia=trim(sle_contrasenia.text)
ls_contraseniac=trim(sle_contraseniac.text)

if len(ls_nombre)=0 or len(ls_nombre)>50 then
	messagebox('Aviso','El nombre no puede ser mayor a 50 caracteres')
	sle_nombre.SetFocus()
	return
end if

if len(ls_paterno)=0 or len(ls_paterno)>50 then
	messagebox('Aviso','El apellido paterno no puede ser mayor a 50 caracteres')
	sle_paterno.SetFocus()
	return
end if

if len(ls_contrasenia)<8 or len(ls_contrasenia)>15 then
	messagebox('Aviso','La contraseña debe tener de 8 a 15 caracteres')
	sle_contrasenia.SetFocus()
	return
end if

if ls_contrasenia <> ls_contraseniac then
	messagebox('Aviso','Debe confirmar la contraseña')
	sle_contrasenia.SetFocus()
	return
end if

if ii_estatus = 0 then
	messagebox('Aviso','Debe indicar el estatus')
	dw_estatus.SetFocus()
	return
end if

if ii_estatus <> 1 and li_asignado > 0 then
	messagebox('Aviso','El chofer no puede cambiar de estatus porque se encuentra asignado a una solicitud vigente')
	dw_estatus.SetFocus()
	return	
end if

if il_id=0 then
	il_id=uf_ultimo_id()+1
	ids_catalogo.setitem(1,'id',il_id)
end if

ids_catalogo.setitem(1,'nombre',ls_nombre)
ids_catalogo.setitem(1,'paterno',ls_paterno)	
ids_catalogo.setitem(1,'materno',ls_materno)
ids_catalogo.setitem(1,'contrasenia',ls_contrasenia)	
ids_catalogo.setitem(1,'estatus',ii_estatus)	

if ids_catalogo.update()>0 then
	commit using gtr_cv;
	CloseWithReturn(w_veh_cat_choferes_edita,0)
else
	messagebox("Error: "+gtr_cv.sqlerrtext,"El catálogo no fue actualizado.",stopsign!)
	rollback using gtr_cv;
end if

end event

type gb_titulo from groupbox within w_veh_cat_choferes_edita
integer x = 46
integer y = 36
integer width = 2679
integer height = 988
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Edición de chofer"
end type

