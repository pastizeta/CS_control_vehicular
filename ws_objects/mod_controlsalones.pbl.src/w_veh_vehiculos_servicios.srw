$PBExportHeader$w_veh_vehiculos_servicios.srw
forward
global type w_veh_vehiculos_servicios from window
end type
type cb_eliminar from commandbutton within w_veh_vehiculos_servicios
end type
type dw_servicios from datawindow within w_veh_vehiculos_servicios
end type
type st_2 from statictext within w_veh_vehiculos_servicios
end type
type dw_servicio from u_basedw within w_veh_vehiculos_servicios
end type
type st_3 from statictext within w_veh_vehiculos_servicios
end type
type em_fecha_servicio from editmask within w_veh_vehiculos_servicios
end type
type st_1 from statictext within w_veh_vehiculos_servicios
end type
type mle_observaciones from multilineedit within w_veh_vehiculos_servicios
end type
type cb_guardar from commandbutton within w_veh_vehiculos_servicios
end type
type gb_titulo from groupbox within w_veh_vehiculos_servicios
end type
end forward

global type w_veh_vehiculos_servicios from window
integer width = 5442
integer height = 2330
boolean titlebar = true
string title = "Expediente de servicios"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_eliminar cb_eliminar
dw_servicios dw_servicios
st_2 st_2
dw_servicio dw_servicio
st_3 st_3
em_fecha_servicio em_fecha_servicio
st_1 st_1
mle_observaciones mle_observaciones
cb_guardar cb_guardar
gb_titulo gb_titulo
end type
global w_veh_vehiculos_servicios w_veh_vehiculos_servicios

type variables
long il_id=0, il_id_vehiculo=0
integer ii_servicio

datastore ids_servicio, ids_vehiculo
DatawindowChild idwc_servicio
end variables

forward prototypes
public function long uf_ultimo_id ()
public subroutine uf_limpia ()
end prototypes

public function long uf_ultimo_id ();long ll_id

select isnull(max(id),0)
into :ll_id
from dbo.via_vehiculo_expediente_servicio
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

public subroutine uf_limpia ();integer li_i

dw_servicios.Reset()
dw_servicios.Retrieve(0,il_id_vehiculo)

ids_servicio.Reset()
if ids_servicio.accepttext()=1 then
	li_i=ids_servicio.insertrow(0)
	ids_servicio.setcolumn(1)
end if

il_id=0
ii_servicio=0

dw_servicio.Reset()
idwc_servicio.Retrieve()
if idwc_servicio.RowCount()>0 then dw_servicio.insertrow(0)

em_fecha_servicio.text='00/00/0000'
mle_observaciones.text=''

end subroutine

on w_veh_vehiculos_servicios.create
this.cb_eliminar=create cb_eliminar
this.dw_servicios=create dw_servicios
this.st_2=create st_2
this.dw_servicio=create dw_servicio
this.st_3=create st_3
this.em_fecha_servicio=create em_fecha_servicio
this.st_1=create st_1
this.mle_observaciones=create mle_observaciones
this.cb_guardar=create cb_guardar
this.gb_titulo=create gb_titulo
this.Control[]={this.cb_eliminar,&
this.dw_servicios,&
this.st_2,&
this.dw_servicio,&
this.st_3,&
this.em_fecha_servicio,&
this.st_1,&
this.mle_observaciones,&
this.cb_guardar,&
this.gb_titulo}
end on

on w_veh_vehiculos_servicios.destroy
destroy(this.cb_eliminar)
destroy(this.dw_servicios)
destroy(this.st_2)
destroy(this.dw_servicio)
destroy(this.st_3)
destroy(this.em_fecha_servicio)
destroy(this.st_1)
destroy(this.mle_observaciones)
destroy(this.cb_guardar)
destroy(this.gb_titulo)
end on

event open;integer li_i

il_id_vehiculo = Message.DoubleParm	
dw_servicios.settransobject(gtr_cv)
dw_servicios.Retrieve(0,il_id_vehiculo)

dw_servicio.settransobject(gtr_cv)
dw_servicio.getchild('descripcion',idwc_servicio)
idwc_servicio.settransobject(gtr_cv)

idwc_servicio.Retrieve()
if idwc_servicio.RowCount()>0 then dw_servicio.insertrow(0)

ids_servicio =  create datastore
ids_servicio.dataobject ='d_veh_vehiculo_servicios_edit'
ids_servicio.settransobject(gtr_cv)

if ids_servicio.accepttext()=1 then
	li_i=ids_servicio.insertrow(0)
	ids_servicio.setcolumn(1)
end if

ids_vehiculo =  create datastore
ids_vehiculo.dataobject ='d_veh_cat_vehiculos_edit'
ids_vehiculo.settransobject(gtr_cv)
ids_vehiculo.Retrieve(il_id_vehiculo)
gb_titulo.text=ids_vehiculo.GetItemString(1,'descripcion')

mle_observaciones.SetFocus()

end event

event close;CloseWithReturn(this,0)
end event

type cb_eliminar from commandbutton within w_veh_vehiculos_servicios
integer x = 4915
integer y = 1024
integer width = 380
integer height = 128
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Eliminar"
end type

event clicked;integer Net

if il_id>0 then
	Net = messagebox("Aviso",'El registro será eliminado. ¿Desea continuar?', Question!, yesno!, 2)
	if Net = 1 then
		ids_servicio.setitem(1,'activo',0)
		if ids_servicio.update()>0 then
			commit using gtr_cv;
			uf_limpia()
		else
			messagebox("Error: "+gtr_cv.sqlerrtext,"El registro no fue actualizado.",stopsign!)
			rollback using gtr_cv;
		end if
	end if
else
	uf_limpia()
end if



end event

type dw_servicios from datawindow within w_veh_vehiculos_servicios
integer x = 88
integer y = 134
integer width = 2527
integer height = 2038
integer taborder = 20
string title = "none"
string dataobject = "d_veh_vehiculo_servicios_edit"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	
	il_id=this.GetItemNumber(row,'id')
	ids_servicio.Retrieve(il_id,il_id_vehiculo)

	mle_observaciones.text=ids_servicio.GetItemString(1,'observaciones')
	em_fecha_servicio.text=string(ids_servicio.GetItemString(1,'fecha_servicio'))
	ii_servicio=ids_servicio.GetItemNumber(1,'id_servicio')
	dw_servicio.setitem(1,'descripcion',ids_servicio.GetItemString(1,'descr_servicio'))

	mle_observaciones.SetFocus()

end if
end event

type st_2 from statictext within w_veh_vehiculos_servicios
integer x = 2699
integer y = 259
integer width = 391
integer height = 99
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Servicio:"
boolean focusrectangle = false
end type

type dw_servicio from u_basedw within w_veh_vehiculos_servicios
integer x = 3357
integer y = 122
integer width = 1949
integer height = 99
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_veh_cat_servicios_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;ii_servicio=long(this.gettext())

end event

type st_3 from statictext within w_veh_vehiculos_servicios
integer x = 2699
integer y = 138
integer width = 633
integer height = 99
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Fecha servicio:"
boolean focusrectangle = false
end type

type em_fecha_servicio from editmask within w_veh_vehiculos_servicios
integer x = 3357
integer y = 243
integer width = 523
integer height = 112
integer taborder = 70
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

type st_1 from statictext within w_veh_vehiculos_servicios
integer x = 2699
integer y = 368
integer width = 497
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Observaciones:"
boolean focusrectangle = false
end type

type mle_observaciones from multilineedit within w_veh_vehiculos_servicios
integer x = 2699
integer y = 461
integer width = 2600
integer height = 509
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

type cb_guardar from commandbutton within w_veh_vehiculos_servicios
integer x = 4458
integer y = 1024
integer width = 380
integer height = 128
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Guardar"
boolean default = true
end type

event clicked;string ls_observaciones, ls_diaf, ls_mesf, ls_aniof, ls_fecha_servicio
datetime ldt_ahorita
ldt_ahorita=DateTime(Today(),Now())

ls_observaciones=trim(mle_observaciones.text)
ls_diaf=mid(em_fecha_servicio.text,1,2)
ls_mesf=mid(em_fecha_servicio.text,4,2)
ls_aniof=mid(em_fecha_servicio.text,7,4)
ls_fecha_servicio=ls_aniof+'/'+ls_mesf+'/'+ls_diaf

if len(ls_observaciones)=0 or len(ls_observaciones)>500 then
	messagebox('Aviso','Las observaciones no pueden ser mayores a 500 caracteres')
	mle_observaciones.SetFocus()
	return
end if

if ls_diaf = '00' then
	messagebox('Aviso','Debe indicar la fecha del servicio')
	em_fecha_servicio.SetFocus()
	return
end if

if ii_servicio = 0 then
	messagebox('Aviso','Debe indicar el servicio')
	dw_servicio.SetFocus()
	return
end if

if il_id=0 then
	il_id=uf_ultimo_id()+1
	ids_servicio.setitem(1,'id',il_id)
	ids_servicio.setitem(1,'id_vehiculo',il_id_vehiculo)
	ids_servicio.setitem(1,'fecha_registro',ldt_ahorita)
	ids_servicio.setitem(1,'activo',1)
end if

ids_servicio.setitem(1,'fecha_servicio',ls_fecha_servicio)	
ids_servicio.setitem(1,'id_servicio',ii_servicio)
ids_servicio.setitem(1,'observaciones',ls_observaciones)

if ids_servicio.update()>0 then
	commit using gtr_cv;
	messagebox('Aviso','El registro fue actualizado');
	uf_limpia()
else
	messagebox("Error: "+gtr_cv.sqlerrtext,"El registro no fue actualizado.",stopsign!)
	rollback using gtr_cv;
end if

end event

type gb_titulo from groupbox within w_veh_vehiculos_servicios
integer x = 44
integer y = 35
integer width = 5336
integer height = 2189
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Expediente de servicios"
end type

