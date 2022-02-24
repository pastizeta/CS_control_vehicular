$PBExportHeader$w_veh_cat_vehiculos_edita.srw
forward
global type w_veh_cat_vehiculos_edita from window
end type
type sle_placas from singlelineedit within w_veh_cat_vehiculos_edita
end type
type st_11 from statictext within w_veh_cat_vehiculos_edita
end type
type dw_tipo_vehiculo from datawindow within w_veh_cat_vehiculos_edita
end type
type st_10 from statictext within w_veh_cat_vehiculos_edita
end type
type cb_servicios from commandbutton within w_veh_cat_vehiculos_edita
end type
type st_9 from statictext within w_veh_cat_vehiculos_edita
end type
type dw_estatus from u_basedw within w_veh_cat_vehiculos_edita
end type
type st_8 from statictext within w_veh_cat_vehiculos_edita
end type
type st_7 from statictext within w_veh_cat_vehiculos_edita
end type
type sle_folio_seguro from singlelineedit within w_veh_cat_vehiculos_edita
end type
type em_fecha_adquisicion from editmask within w_veh_cat_vehiculos_edita
end type
type st_6 from statictext within w_veh_cat_vehiculos_edita
end type
type sle_num_motor from singlelineedit within w_veh_cat_vehiculos_edita
end type
type st_5 from statictext within w_veh_cat_vehiculos_edita
end type
type sle_anio from singlelineedit within w_veh_cat_vehiculos_edita
end type
type st_4 from statictext within w_veh_cat_vehiculos_edita
end type
type sle_modelo from singlelineedit within w_veh_cat_vehiculos_edita
end type
type st_3 from statictext within w_veh_cat_vehiculos_edita
end type
type sle_marca from singlelineedit within w_veh_cat_vehiculos_edita
end type
type sle_cupo from singlelineedit within w_veh_cat_vehiculos_edita
end type
type st_2 from statictext within w_veh_cat_vehiculos_edita
end type
type st_1 from statictext within w_veh_cat_vehiculos_edita
end type
type mle_descripcion from multilineedit within w_veh_cat_vehiculos_edita
end type
type cb_guardar from commandbutton within w_veh_cat_vehiculos_edita
end type
type gb_titulo from groupbox within w_veh_cat_vehiculos_edita
end type
end forward

global type w_veh_cat_vehiculos_edita from window
integer width = 2935
integer height = 1880
boolean titlebar = true
string title = "Vehículo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
sle_placas sle_placas
st_11 st_11
dw_tipo_vehiculo dw_tipo_vehiculo
st_10 st_10
cb_servicios cb_servicios
st_9 st_9
dw_estatus dw_estatus
st_8 st_8
st_7 st_7
sle_folio_seguro sle_folio_seguro
em_fecha_adquisicion em_fecha_adquisicion
st_6 st_6
sle_num_motor sle_num_motor
st_5 st_5
sle_anio sle_anio
st_4 st_4
sle_modelo sle_modelo
st_3 st_3
sle_marca sle_marca
sle_cupo sle_cupo
st_2 st_2
st_1 st_1
mle_descripcion mle_descripcion
cb_guardar cb_guardar
gb_titulo gb_titulo
end type
global w_veh_cat_vehiculos_edita w_veh_cat_vehiculos_edita

type variables
long il_id=0
integer ii_estatus, li_asignado=0
Int		ii_tipo_vehiculo

datastore ids_catalogo
DatawindowChild idwc_estatus
end variables

forward prototypes
public function long uf_ultimo_id ()
end prototypes

public function long uf_ultimo_id ();long ll_id

select isnull(max(id),0)
into :ll_id
from dbo.via_cat_vehiculos
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

on w_veh_cat_vehiculos_edita.create
this.sle_placas=create sle_placas
this.st_11=create st_11
this.dw_tipo_vehiculo=create dw_tipo_vehiculo
this.st_10=create st_10
this.cb_servicios=create cb_servicios
this.st_9=create st_9
this.dw_estatus=create dw_estatus
this.st_8=create st_8
this.st_7=create st_7
this.sle_folio_seguro=create sle_folio_seguro
this.em_fecha_adquisicion=create em_fecha_adquisicion
this.st_6=create st_6
this.sle_num_motor=create sle_num_motor
this.st_5=create st_5
this.sle_anio=create sle_anio
this.st_4=create st_4
this.sle_modelo=create sle_modelo
this.st_3=create st_3
this.sle_marca=create sle_marca
this.sle_cupo=create sle_cupo
this.st_2=create st_2
this.st_1=create st_1
this.mle_descripcion=create mle_descripcion
this.cb_guardar=create cb_guardar
this.gb_titulo=create gb_titulo
this.Control[]={this.sle_placas,&
this.st_11,&
this.dw_tipo_vehiculo,&
this.st_10,&
this.cb_servicios,&
this.st_9,&
this.dw_estatus,&
this.st_8,&
this.st_7,&
this.sle_folio_seguro,&
this.em_fecha_adquisicion,&
this.st_6,&
this.sle_num_motor,&
this.st_5,&
this.sle_anio,&
this.st_4,&
this.sle_modelo,&
this.st_3,&
this.sle_marca,&
this.sle_cupo,&
this.st_2,&
this.st_1,&
this.mle_descripcion,&
this.cb_guardar,&
this.gb_titulo}
end on

on w_veh_cat_vehiculos_edita.destroy
destroy(this.sle_placas)
destroy(this.st_11)
destroy(this.dw_tipo_vehiculo)
destroy(this.st_10)
destroy(this.cb_servicios)
destroy(this.st_9)
destroy(this.dw_estatus)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.sle_folio_seguro)
destroy(this.em_fecha_adquisicion)
destroy(this.st_6)
destroy(this.sle_num_motor)
destroy(this.st_5)
destroy(this.sle_anio)
destroy(this.st_4)
destroy(this.sle_modelo)
destroy(this.st_3)
destroy(this.sle_marca)
destroy(this.sle_cupo)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_descripcion)
destroy(this.cb_guardar)
destroy(this.gb_titulo)
end on

event open;integer li_i

dw_estatus.settransobject(gtr_cv)
dw_estatus.getchild('descripcion',idwc_estatus)
idwc_estatus.settransobject(gtr_cv)

idwc_estatus.Retrieve()
if idwc_estatus.RowCount()>0 then dw_estatus.insertrow(0)

dw_tipo_vehiculo.SetTransObject ( gtr_cv )
dw_tipo_vehiculo.InsertRow ( 0 )

il_id = Message.DoubleParm	
ids_catalogo =  create datastore
ids_catalogo.dataobject ='d_veh_cat_vehiculos_edit'
ids_catalogo.settransobject(gtr_cv)

if il_id>0 then
	ids_catalogo.Retrieve(il_id)
	mle_descripcion.text=ids_catalogo.GetItemString(1,'descripcion')
	sle_cupo.text=string(ids_catalogo.GetItemNumber(1,'cupo'))
	sle_marca.text=ids_catalogo.GetItemString(1,'marca')
	sle_modelo.text=ids_catalogo.GetItemString(1,'modelo')
	sle_anio.text=string(ids_catalogo.GetItemNumber(1,'anio'))
	sle_num_motor.text=ids_catalogo.GetItemString(1,'num_motor')
	em_fecha_adquisicion.text=string(ids_catalogo.GetItemString(1,'fecha_adquisicion'))
	sle_folio_seguro.text=ids_catalogo.GetItemString(1,'folio_seguro')
	ii_estatus=ids_catalogo.GetItemNumber(1,'estatus')
	dw_estatus.setitem(1,'descripcion',ids_catalogo.GetItemString(1,'estatus_descr'))
	li_asignado=ids_catalogo.GetItemNumber(1,'asignado')
	dw_tipo_vehiculo.setitem(1,'id',ids_catalogo.GetItemNumber(1,'id_tipo_vehiculo'))
	ii_tipo_vehiculo= ids_catalogo.GetItemNumber(1,'id_tipo_vehiculo')
	sle_placas.Text = ids_catalogo.GetItemString(1,'placas')
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

type sle_placas from singlelineedit within w_veh_cat_vehiculos_edita
integer x = 1966
integer y = 600
integer width = 352
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
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within w_veh_cat_vehiculos_edita
integer x = 1312
integer y = 616
integer width = 265
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Placa:"
boolean focusrectangle = false
end type

type dw_tipo_vehiculo from datawindow within w_veh_cat_vehiculos_edita
integer x = 750
integer y = 1380
integer width = 1463
integer height = 104
integer taborder = 110
string title = "none"
string dataobject = "d_veh_cat_tipos_vehiculo_dropdown"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;ii_tipo_vehiculo = Integer ( data )
end event

type st_10 from statictext within w_veh_cat_vehiculos_edita
integer x = 91
integer y = 1424
integer width = 443
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Tipo Vehículo:"
boolean focusrectangle = false
end type

type cb_servicios from commandbutton within w_veh_cat_vehiculos_edita
integer x = 1563
integer y = 1560
integer width = 809
integer height = 128
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Expediente de servicios"
boolean default = true
end type

event clicked;if isvalid(w_veh_vehiculos_servicios) then close(w_veh_vehiculos_servicios) 
openwithparm(w_veh_vehiculos_servicios,il_id)
end event

type st_9 from statictext within w_veh_cat_vehiculos_edita
integer x = 91
integer y = 1276
integer width = 393
integer height = 100
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

type dw_estatus from u_basedw within w_veh_cat_vehiculos_edita
integer x = 750
integer y = 1260
integer width = 1330
integer height = 100
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_veh_cat_estatus_vehiculo_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;ii_estatus=long(this.gettext())

end event

type st_8 from statictext within w_veh_cat_vehiculos_edita
integer x = 1312
integer y = 1128
integer width = 617
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Folio de seguro:"
boolean focusrectangle = false
end type

type st_7 from statictext within w_veh_cat_vehiculos_edita
integer x = 91
integer y = 1128
integer width = 631
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Fecha adquisición:"
boolean focusrectangle = false
end type

type sle_folio_seguro from singlelineedit within w_veh_cat_vehiculos_edita
integer x = 1970
integer y = 1128
integer width = 832
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type em_fecha_adquisicion from editmask within w_veh_cat_vehiculos_edita
integer x = 750
integer y = 1128
integer width = 521
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_6 from statictext within w_veh_cat_vehiculos_edita
integer x = 1312
integer y = 1000
integer width = 617
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Número de motor:"
boolean focusrectangle = false
end type

type sle_num_motor from singlelineedit within w_veh_cat_vehiculos_edita
integer x = 1966
integer y = 996
integer width = 832
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_veh_cat_vehiculos_edita
integer x = 91
integer y = 1000
integer width = 265
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Año:"
boolean focusrectangle = false
end type

type sle_anio from singlelineedit within w_veh_cat_vehiculos_edita
integer x = 750
integer y = 996
integer width = 521
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_veh_cat_vehiculos_edita
integer x = 91
integer y = 872
integer width = 293
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Modelo:"
boolean focusrectangle = false
end type

type sle_modelo from singlelineedit within w_veh_cat_vehiculos_edita
integer x = 750
integer y = 864
integer width = 2039
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_veh_cat_vehiculos_edita
integer x = 91
integer y = 744
integer width = 315
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Marca:"
boolean focusrectangle = false
end type

type sle_marca from singlelineedit within w_veh_cat_vehiculos_edita
integer x = 750
integer y = 732
integer width = 2039
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_cupo from singlelineedit within w_veh_cat_vehiculos_edita
integer x = 750
integer y = 600
integer width = 352
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_veh_cat_vehiculos_edita
integer x = 91
integer y = 616
integer width = 265
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Cupo:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_veh_cat_vehiculos_edita
integer x = 91
integer y = 144
integer width = 457
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Descripción:"
boolean focusrectangle = false
end type

type mle_descripcion from multilineedit within w_veh_cat_vehiculos_edita
integer x = 91
integer y = 228
integer width = 2711
integer height = 324
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_guardar from commandbutton within w_veh_cat_vehiculos_edita
integer x = 2418
integer y = 1560
integer width = 379
integer height = 128
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Guardar"
boolean default = true
end type

event clicked;string ls_descripcion, ls_cupo, ls_marca, ls_modelo, ls_anio, ls_num_motor, ls_folio_seguro
string ls_diaf, ls_mesf, ls_aniof, ls_fecha_asignacion, ls_placas

ls_descripcion=trim(mle_descripcion.text)
ls_cupo=trim(sle_cupo.text)
ls_marca=trim(sle_marca.text)
ls_modelo=trim(sle_modelo.text)
ls_anio=trim(sle_anio.text)
ls_num_motor=trim(sle_num_motor.text)
ls_folio_seguro=trim(sle_folio_seguro.text)
ls_diaf=mid(em_fecha_adquisicion.text,1,2)
ls_mesf=mid(em_fecha_adquisicion.text,4,2)
ls_aniof=mid(em_fecha_adquisicion.text,7,4)
ls_fecha_asignacion=ls_aniof+'/'+ls_mesf+'/'+ls_diaf
ls_placas=trim(sle_placas.text)

if len(ls_descripcion)=0 or len(ls_descripcion)>100 then
	messagebox('Aviso','La descripción no puede ser mayor a 100 caracteres')
	mle_descripcion.SetFocus()
	return
end if

if ls_placas = '' or IsNull (ls_placas) then
	messagebox('Aviso','Escriba el número de placas')
	sle_placas.SetFocus()
	return
end if

if len(ls_cupo)=0 or ls_cupo='0' or isNumber(ls_cupo)=false then
	messagebox('Aviso','El cupo debe ser un valor numérico')
	return
end if

if len(ls_marca)=0 or len(ls_marca)>50 then
	messagebox('Aviso','La marca no puede ser mayor a 50 caracteres')
	sle_marca.SetFocus()
	return
end if

if len(ls_modelo)=0 or len(ls_modelo)>50 then
	messagebox('Aviso','El modelo no puede ser mayor a 50 caracteres')
	sle_modelo.SetFocus()
	return
end if

if len(ls_anio)=0 or ls_anio='0' or isNumber(ls_anio)=false then
	messagebox('Aviso','El año debe ser un valor numérico')
	sle_anio.SetFocus()
	return
end if

if len(ls_num_motor)>50 then
	messagebox('Aviso','El número de motor no puede ser mayor a 50 caracteres')
	sle_num_motor.SetFocus()
	return
end if

if len(ls_folio_seguro)>50 then
	messagebox('Aviso','El folio de seguro no puede ser mayor a 50 caracteres')
	sle_folio_seguro.SetFocus()
	return
end if

if ii_estatus = 0 then
	messagebox('Aviso','Debe indicar el estatus')
	dw_estatus.SetFocus()
	return
end if

if ii_estatus <> 1 and li_asignado > 0 then
	messagebox('Aviso','El vehículo no puede cambiar de estatus porque se encuentra asignado a una solicitud vigente')
	dw_estatus.SetFocus()
	return	
end if
if ii_tipo_vehiculo = 0 then
	messagebox('Aviso','Debe indicar el tipo de vehículo')
	dw_tipo_vehiculo.SetFocus()
	return
end if

if il_id=0 then
	il_id=uf_ultimo_id()+1
	ids_catalogo.setitem(1,'id',il_id)
end if

ids_catalogo.setitem(1,'descripcion',ls_descripcion)
ids_catalogo.setitem(1,'cupo',long(ls_cupo))	
ids_catalogo.setitem(1,'marca',ls_marca)
ids_catalogo.setitem(1,'modelo',ls_modelo)	
ids_catalogo.setitem(1,'anio',long(ls_anio))	
ids_catalogo.setitem(1,'num_motor',ls_num_motor)
ids_catalogo.setitem(1,'folio_seguro',ls_folio_seguro)	
ids_catalogo.setitem(1,'fecha_adquisicion',ls_fecha_asignacion)	
ids_catalogo.setitem(1,'estatus',ii_estatus)
ids_catalogo.setitem(1,'id_tipo_vehiculo',ii_tipo_vehiculo)
ids_catalogo.setitem(1,'placas',ls_placas)

if ids_catalogo.update()>0 then
	commit using gtr_cv;
	CloseWithReturn(w_veh_cat_vehiculos_edita,0)
else
	messagebox("Error: "+gtr_cv.sqlerrtext,"El catálogo no fue actualizado.",stopsign!)
	rollback using gtr_cv;
end if

end event

type gb_titulo from groupbox within w_veh_cat_vehiculos_edita
integer x = 46
integer y = 36
integer width = 2825
integer height = 1708
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Edición de vehículo"
end type

