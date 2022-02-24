$PBExportHeader$w_gen_reporte_prestamo_mat.srw
forward
global type w_gen_reporte_prestamo_mat from window
end type
type sle_folio from singlelineedit within w_gen_reporte_prestamo_mat
end type
type sle_folio_presol from singlelineedit within w_gen_reporte_prestamo_mat
end type
type rb_folio_presol from radiobutton within w_gen_reporte_prestamo_mat
end type
type rb_folio from radiobutton within w_gen_reporte_prestamo_mat
end type
type cbx_venta from checkbox within w_gen_reporte_prestamo_mat
end type
type cbx_agrupar from checkbox within w_gen_reporte_prestamo_mat
end type
type st_reservaciones from statictext within w_gen_reporte_prestamo_mat
end type
type st_3 from statictext within w_gen_reporte_prestamo_mat
end type
type cbx_todo from checkbox within w_gen_reporte_prestamo_mat
end type
type st_2 from statictext within w_gen_reporte_prestamo_mat
end type
type sle_anio from singlelineedit within w_gen_reporte_prestamo_mat
end type
type st_anio from statictext within w_gen_reporte_prestamo_mat
end type
type ddlb_periodo from dropdownlistbox within w_gen_reporte_prestamo_mat
end type
type cb_imprimir from commandbutton within w_gen_reporte_prestamo_mat
end type
type dw_reporte from datawindow within w_gen_reporte_prestamo_mat
end type
type dw_mat_material from u_basedw within w_gen_reporte_prestamo_mat
end type
type st_1 from statictext within w_gen_reporte_prestamo_mat
end type
type em_fecha_final from editmask within w_gen_reporte_prestamo_mat
end type
type em_fecha_inicio from editmask within w_gen_reporte_prestamo_mat
end type
type dw_tipo_usuario from u_basedw within w_gen_reporte_prestamo_mat
end type
type cb_buscar from commandbutton within w_gen_reporte_prestamo_mat
end type
type st_cuenta from statictext within w_gen_reporte_prestamo_mat
end type
type st_area from statictext within w_gen_reporte_prestamo_mat
end type
type rb_status from radiobutton within w_gen_reporte_prestamo_mat
end type
type rb_material from radiobutton within w_gen_reporte_prestamo_mat
end type
type fecha from radiobutton within w_gen_reporte_prestamo_mat
end type
type rb_tipo_usuario from radiobutton within w_gen_reporte_prestamo_mat
end type
type sle_solicitante from singlelineedit within w_gen_reporte_prestamo_mat
end type
type dw_mat_grupo from u_basedw within w_gen_reporte_prestamo_mat
end type
type dw_area from u_basedw within w_gen_reporte_prestamo_mat
end type
type st_periodo from statictext within w_gen_reporte_prestamo_mat
end type
type gb_1 from groupbox within w_gen_reporte_prestamo_mat
end type
type cb_exportar from commandbutton within w_gen_reporte_prestamo_mat
end type
type ddlb_estatus from dropdownlistbox within w_gen_reporte_prestamo_mat
end type
end forward

global type w_gen_reporte_prestamo_mat from window
integer width = 5683
integer height = 2896
boolean titlebar = true
string title = "Reporte de Préstamo de Materiales"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
sle_folio sle_folio
sle_folio_presol sle_folio_presol
rb_folio_presol rb_folio_presol
rb_folio rb_folio
cbx_venta cbx_venta
cbx_agrupar cbx_agrupar
st_reservaciones st_reservaciones
st_3 st_3
cbx_todo cbx_todo
st_2 st_2
sle_anio sle_anio
st_anio st_anio
ddlb_periodo ddlb_periodo
cb_imprimir cb_imprimir
dw_reporte dw_reporte
dw_mat_material dw_mat_material
st_1 st_1
em_fecha_final em_fecha_final
em_fecha_inicio em_fecha_inicio
dw_tipo_usuario dw_tipo_usuario
cb_buscar cb_buscar
st_cuenta st_cuenta
st_area st_area
rb_status rb_status
rb_material rb_material
fecha fecha
rb_tipo_usuario rb_tipo_usuario
sle_solicitante sle_solicitante
dw_mat_grupo dw_mat_grupo
dw_area dw_area
st_periodo st_periodo
gb_1 gb_1
cb_exportar cb_exportar
ddlb_estatus ddlb_estatus
end type
global w_gen_reporte_prestamo_mat w_gen_reporte_prestamo_mat

type variables
integer ii_tipo_usuario=0, ii_cvearea=0, ii_estatus=0, ii_grupo=0, ii_menu=1
integer ii_periodo, ii_anio, ii_todo=0, ii_exportar=1, ii_venta=0
string is_material=''

DatawindowChild idwc_area, idwc_tipo_usuario, idwc_material,idwc_grupo

date idt_fecha_inicio, idt_fecha_final

end variables

on w_gen_reporte_prestamo_mat.create
this.sle_folio=create sle_folio
this.sle_folio_presol=create sle_folio_presol
this.rb_folio_presol=create rb_folio_presol
this.rb_folio=create rb_folio
this.cbx_venta=create cbx_venta
this.cbx_agrupar=create cbx_agrupar
this.st_reservaciones=create st_reservaciones
this.st_3=create st_3
this.cbx_todo=create cbx_todo
this.st_2=create st_2
this.sle_anio=create sle_anio
this.st_anio=create st_anio
this.ddlb_periodo=create ddlb_periodo
this.cb_imprimir=create cb_imprimir
this.dw_reporte=create dw_reporte
this.dw_mat_material=create dw_mat_material
this.st_1=create st_1
this.em_fecha_final=create em_fecha_final
this.em_fecha_inicio=create em_fecha_inicio
this.dw_tipo_usuario=create dw_tipo_usuario
this.cb_buscar=create cb_buscar
this.st_cuenta=create st_cuenta
this.st_area=create st_area
this.rb_status=create rb_status
this.rb_material=create rb_material
this.fecha=create fecha
this.rb_tipo_usuario=create rb_tipo_usuario
this.sle_solicitante=create sle_solicitante
this.dw_mat_grupo=create dw_mat_grupo
this.dw_area=create dw_area
this.st_periodo=create st_periodo
this.gb_1=create gb_1
this.cb_exportar=create cb_exportar
this.ddlb_estatus=create ddlb_estatus
this.Control[]={this.sle_folio,&
this.sle_folio_presol,&
this.rb_folio_presol,&
this.rb_folio,&
this.cbx_venta,&
this.cbx_agrupar,&
this.st_reservaciones,&
this.st_3,&
this.cbx_todo,&
this.st_2,&
this.sle_anio,&
this.st_anio,&
this.ddlb_periodo,&
this.cb_imprimir,&
this.dw_reporte,&
this.dw_mat_material,&
this.st_1,&
this.em_fecha_final,&
this.em_fecha_inicio,&
this.dw_tipo_usuario,&
this.cb_buscar,&
this.st_cuenta,&
this.st_area,&
this.rb_status,&
this.rb_material,&
this.fecha,&
this.rb_tipo_usuario,&
this.sle_solicitante,&
this.dw_mat_grupo,&
this.dw_area,&
this.st_periodo,&
this.gb_1,&
this.cb_exportar,&
this.ddlb_estatus}
end on

on w_gen_reporte_prestamo_mat.destroy
destroy(this.sle_folio)
destroy(this.sle_folio_presol)
destroy(this.rb_folio_presol)
destroy(this.rb_folio)
destroy(this.cbx_venta)
destroy(this.cbx_agrupar)
destroy(this.st_reservaciones)
destroy(this.st_3)
destroy(this.cbx_todo)
destroy(this.st_2)
destroy(this.sle_anio)
destroy(this.st_anio)
destroy(this.ddlb_periodo)
destroy(this.cb_imprimir)
destroy(this.dw_reporte)
destroy(this.dw_mat_material)
destroy(this.st_1)
destroy(this.em_fecha_final)
destroy(this.em_fecha_inicio)
destroy(this.dw_tipo_usuario)
destroy(this.cb_buscar)
destroy(this.st_cuenta)
destroy(this.st_area)
destroy(this.rb_status)
destroy(this.rb_material)
destroy(this.fecha)
destroy(this.rb_tipo_usuario)
destroy(this.sle_solicitante)
destroy(this.dw_mat_grupo)
destroy(this.dw_area)
destroy(this.st_periodo)
destroy(this.gb_1)
destroy(this.cb_exportar)
destroy(this.ddlb_estatus)
end on

event open;integer li_periodo, li_anio

if gi_depto=2 then
	cbx_venta.x=1400	
	cbx_agrupar.visible=false
else
	cbx_venta.visible=false
end if

//Area
if gi_areamul=1 then
	dw_area.settransobject(gtr_sumuia)
	dw_area.getchild('area',idwc_area)
	idwc_area.settransobject(gtr_sumuia)
	
	idwc_area.Retrieve(gi_depto)
	if idwc_area.RowCount()>0 then 
		dw_area.insertrow(0)
		dw_area.SetItem(1,'area',idwc_area.GetItemString(1,'descripcion'))
		ii_cvearea=idwc_area.GetItemNumber(1,'cvearea')
	end if
else
	ii_cvearea=gi_area	
	dw_area.visible=false
	st_area.visible=false
end if

//Grupo
dw_mat_grupo.settransobject(gtr_escolar)
dw_mat_grupo.getchild('matgrupo',idwc_grupo)
idwc_grupo.settransobject(gtr_sumuia)
idwc_grupo.Retrieve(gi_depto,ii_cvearea)
if idwc_grupo.RowCount()>0 then dw_mat_grupo.insertrow(0)

//Material
dw_mat_material.settransobject(gtr_escolar)
dw_mat_material.getchild('material',idwc_material)
idwc_material.settransobject(gtr_sumuia)

//Usuario
dw_tipo_usuario.settransobject(gtr_sumuia)
dw_tipo_usuario.getchild('tipo_usuario',idwc_tipo_usuario)
idwc_tipo_usuario.settransobject(gtr_sumuia)

idt_fecha_inicio=Today()
idt_fecha_final=Today()
em_fecha_inicio.text=string(idt_fecha_inicio)
em_fecha_final.text=string(idt_fecha_final)

idwc_tipo_usuario.Retrieve(gi_depto,ii_cvearea)
if idwc_tipo_usuario.RowCount()>0 then dw_tipo_usuario.insertrow(0)


f_select_anio_periodo_actual(li_periodo,li_anio,today())

if not isNull(li_periodo) then
	
	ii_periodo=li_periodo
	ii_anio=li_anio
	
	choose case ii_periodo
	case 0
		ddlb_periodo.selectItem(2)
	case 1
		ddlb_periodo.selectItem(3)
	case 2
		ddlb_periodo.selectItem(1)
	end choose

	sle_anio.text=string(li_anio)
	
end if

if gi_depto=8 and ii_cvearea=1 then ddlb_estatus.InsertItem ('Cancelada',5)
if gi_depto=8 and ii_cvearea=1 then ddlb_estatus.InsertItem ('No llegó',6)


end event

type sle_folio from singlelineedit within w_gen_reporte_prestamo_mat
integer x = 3090
integer y = 208
integer width = 322
integer height = 74
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_folio_presol from singlelineedit within w_gen_reporte_prestamo_mat
integer x = 3090
integer y = 301
integer width = 322
integer height = 74
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type rb_folio_presol from radiobutton within w_gen_reporte_prestamo_mat
integer x = 2534
integer y = 301
integer width = 585
integer height = 77
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Folio Pre-solicitud"
end type

event clicked;dw_tipo_usuario.enabled=false
sle_solicitante.enabled=false
ddlb_estatus.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
dw_mat_grupo.enabled=false
dw_mat_material.enabled=false
sle_folio.enabled=false
sle_folio_presol.enabled=true

ii_menu=6

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
sle_folio_presol.SetFocus()
end event

type rb_folio from radiobutton within w_gen_reporte_prestamo_mat
integer x = 2534
integer y = 205
integer width = 289
integer height = 77
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Folio"
end type

event clicked;dw_tipo_usuario.enabled=false
sle_solicitante.enabled=false
ddlb_estatus.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
dw_mat_grupo.enabled=false
dw_mat_material.enabled=false
sle_folio.enabled=true
sle_folio_presol.enabled=false

ii_menu=5

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
sle_folio.SetFocus()
end event

type cbx_venta from checkbox within w_gen_reporte_prestamo_mat
integer x = 2662
integer y = 48
integer width = 336
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Venta"
end type

event clicked;if this.checked=true then 
	ii_venta=1 
	rb_status.enabled=false
	ddlb_estatus.enabled=false
else 	
	ii_venta=0
	rb_status.enabled=true
	ddlb_estatus.enabled=true
end if

ii_grupo=0
dw_mat_grupo.enabled=false
dw_mat_grupo.Reset()
idwc_grupo.Reset()
idwc_grupo.Retrieve(gi_depto,ii_cvearea)
if idwc_grupo.RowCount()>0 then dw_mat_grupo.insertrow(0)

is_material=''
dw_mat_material.Reset()
idwc_material.SetFilter('')
idwc_material.Filter()
idwc_material.Reset()

rb_tipo_usuario.checked=true
dw_tipo_usuario.enabled=true
sle_solicitante.enabled=true
ii_menu=1
dw_reporte.Reset()


end event

type cbx_agrupar from checkbox within w_gen_reporte_prestamo_mat
integer x = 102
integer y = 605
integer width = 625
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Agrupar por nombre"
end type

type st_reservaciones from statictext within w_gen_reporte_prestamo_mat
integer x = 4769
integer y = 2682
integer width = 816
integer height = 77
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Reservaciones: 0"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_gen_reporte_prestamo_mat
integer x = 2498
integer y = 515
integer width = 296
integer height = 51
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 30520472
string text = "*opcional"
boolean focusrectangle = false
end type

type cbx_todo from checkbox within w_gen_reporte_prestamo_mat
integer x = 1090
integer y = 48
integer width = 293
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Todo"
end type

event clicked;if this.checked=true then	
	ii_todo=1
	ddlb_periodo.enabled=false
	sle_anio.enabled=false
else 
	ii_todo=0
	ddlb_periodo.enabled=true
	sle_anio.enabled=true	
end if

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
end event

type st_2 from statictext within w_gen_reporte_prestamo_mat
integer x = 1997
integer y = 224
integer width = 296
integer height = 51
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 30520472
string text = "*opcional"
boolean focusrectangle = false
end type

type sle_anio from singlelineedit within w_gen_reporte_prestamo_mat
integer x = 841
integer y = 45
integer width = 208
integer height = 74
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event modified;if isnumber(trim(this.text)) then ii_anio=integer(trim(this.text))

end event

type st_anio from statictext within w_gen_reporte_prestamo_mat
integer x = 699
integer y = 58
integer width = 154
integer height = 51
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Año:"
boolean focusrectangle = false
end type

type ddlb_periodo from dropdownlistbox within w_gen_reporte_prestamo_mat
integer x = 260
integer y = 45
integer width = 406
integer height = 381
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string item[] = {"Primavera","Verano","Otoño"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text(index)
	case 'Primavera'
		ii_periodo=0
	case 'Verano'
		ii_periodo=1
	case 'Otoño'
		ii_periodo=2
end choose

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'

sle_anio.SetFocus()
end event

type cb_imprimir from commandbutton within w_gen_reporte_prestamo_mat
integer x = 5186
integer y = 291
integer width = 304
integer height = 93
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Imprimir"
end type

event clicked;dw_reporte.print()
end event

type dw_reporte from datawindow within w_gen_reporte_prestamo_mat
integer x = 26
integer y = 733
integer width = 5573
integer height = 1888
integer taborder = 30
string title = "none"
string dataobject = "d_gen_rep_prestamo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_mat_material from u_basedw within w_gen_reporte_prestamo_mat
integer x = 1488
integer y = 506
integer width = 976
integer height = 77
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_csal_mat_matmaterial_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("material", "material", "material")
end event

event itemchanged;call super::itemchanged;is_material=this.gettext()

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
end event

type st_1 from statictext within w_gen_reporte_prestamo_mat
integer x = 1119
integer y = 410
integer width = 77
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "a"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fecha_final from editmask within w_gen_reporte_prestamo_mat
integer x = 1218
integer y = 403
integer width = 377
integer height = 77
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
string text = "00/00/0000"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;idt_fecha_final=Date(this.text)

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
end event

type em_fecha_inicio from editmask within w_gen_reporte_prestamo_mat
integer x = 720
integer y = 403
integer width = 377
integer height = 77
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
string text = "00/00/0000"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;idt_fecha_inicio=Date(this.text)

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
end event

type dw_tipo_usuario from u_basedw within w_gen_reporte_prestamo_mat
integer x = 720
integer y = 211
integer width = 633
integer height = 77
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_gen_cat_tipo_usuario_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("area", "area", "area")
end event

event itemchanged;call super::itemchanged;ii_tipo_usuario=long(this.gettext())
sle_solicitante.SetFocus()

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
end event

type cb_buscar from commandbutton within w_gen_reporte_prestamo_mat
integer x = 5186
integer y = 186
integer width = 304
integer height = 93
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Buscar"
end type

event clicked;integer li_row, li_pos, li_i, li_anio=-1, li_periodo=-1, li_tipo, li_estatus, li_in=0
string ls_cuenta, ls_texto, ls_digito,ls_filtro='', ls_fecha_inicio, ls_fecha_final
long ll_cuenta, ll_folio_anterior=0, ll_conteo=0, ll_folio=0, ll_folio_presol
datetime ldt_fecha_inicio, ldt_fecha_final

datastore lds_solicitud
lds_solicitud =  create datastore
ls_texto=trim(sle_solicitante.text)
ls_cuenta=ls_texto
if isNumber(trim(sle_folio.text)) then ll_folio=long(trim(sle_folio.text))
if isNumber(trim(sle_folio_presol.text)) then ll_folio_presol=long(trim(sle_folio_presol.text))

ldt_fecha_inicio=datetime(date(em_fecha_inicio.text),time('00:00:00'))
ldt_fecha_final=datetime(date(em_fecha_final.text),time('23:59:59'))


li_estatus=ii_estatus
if (ii_estatus=-1 or ii_estatus=-2) then ii_estatus=1

dw_reporte.SetRedraw(false)
dw_reporte.Reset()

if ii_todo=0 then
	li_anio=ii_anio
	li_periodo=ii_periodo
end if

if cbx_agrupar.checked=true then dw_reporte.dataobject ='d_gen_rep_prestamo_agrupado' else  dw_reporte.dataobject ='d_gen_rep_prestamo' 

dw_reporte.Reset()
dw_reporte.SetSort("")
dw_reporte.Sort()
dw_reporte.SetRedraw(false)

choose case ii_menu

	case 1

		//Tipo de Usuario
		if ii_tipo_usuario=1 then
/*
			li_pos=pos(ls_texto,'-')
			
			if li_pos>0 then
				ls_cuenta=left(ls_texto,len(ls_texto) - 2)
				ls_digito=right(ls_texto,1)
			else
				ls_cuenta=left(ls_texto,len(ls_texto) - 1)
				ls_digito=right(ls_texto,1)
			end if	*/		
			
		end if
		
		if isNumber(ls_cuenta) then ll_cuenta=Long(ls_cuenta)
		
		lds_solicitud.dataobject ='d_gen_rep_prestado_usuario'
		lds_solicitud.settransobject(gtr_sumuia)	
		
		if ll_cuenta=0 then ll_cuenta=-1
		li_tipo=ii_tipo_usuario
		if ii_tipo_usuario=0 then li_tipo=-1

		lds_solicitud.Retrieve(gi_depto,ii_cvearea,ll_cuenta,li_tipo,li_anio,li_periodo)
		
	case 2
		
		//Estatus de Solicitud
		lds_solicitud.dataobject ='d_gen_rep_prestado_estatus'
		lds_solicitud.settransobject(gtr_sumuia)	
		lds_solicitud.Retrieve(gi_depto,ii_cvearea,ii_estatus,li_anio,li_periodo)	

	case 3

		//Fecha
		lds_solicitud.dataobject ='d_gen_rep_prestado_fecha'
		lds_solicitud.settransobject(gtr_sumuia)
		lds_solicitud.Retrieve(gi_depto,ii_cvearea,DateTime(idt_fecha_inicio,Time('00:00:00')),DateTime(idt_fecha_final,Time('23:59:59')),li_anio,li_periodo)		
		//messagebox(string(gi_depto)+' '+string(ii_cvearea)+' ',string(ldt_fecha_inicio)+' '+string(ldt_fecha_final)+' '+string(li_anio)+' '+string(li_periodo))
		//lds_solicitud.Retrieve(gi_depto,ii_cvearea,ldt_fecha_inicio,ldt_fecha_final,li_anio,li_periodo)		
	case 4

		//Material
		lds_solicitud.dataobject ='d_gen_rep_prestado_material'
		lds_solicitud.settransobject(gtr_sumuia)	
		lds_solicitud.Retrieve(gi_depto,ii_cvearea,ii_grupo,is_material,li_anio,li_periodo)	

	case 5

		//Folio
		lds_solicitud.dataobject ='d_gen_rep_prestado_folio'
		lds_solicitud.settransobject(gtr_sumuia)	
		li_anio=-1
		li_periodo=-1
		lds_solicitud.Retrieve(gi_depto,ii_cvearea,ll_folio,li_anio,li_periodo)	

	case 6

		//Folio presolicitud
		lds_solicitud.dataobject ='d_gen_rep_prestado_folio'
		lds_solicitud.settransobject(gtr_sumuia)	
		li_anio=-1
		li_periodo=-1
		ll_folio=f_select_folio_folio_presol(gi_depto,ll_folio_presol,0)
		lds_solicitud.Retrieve(gi_depto,ii_cvearea,ll_folio,li_anio,li_periodo)	

end choose


//Filtros y campos
if gi_depto=9 and ii_cvearea=2 then
	dw_reporte.object.cantidad_t.visible=true
	dw_reporte.object.cantidad.visible=true
	dw_reporte.object.condicion.visible=true
else
	if gi_depto=2 then
		if ii_venta=0 then
			lds_solicitud.SetFilter("merma = 0")
		else
			lds_solicitud.SetFilter("merma = 1")	
			dw_reporte.object.fecha_entrega_t.visible=false
			dw_reporte.object.fecha_entrega.visible=false
			dw_reporte.object.fecha_final_t.visible=false
			dw_reporte.object.fecha_final.visible=false
			dw_reporte.object.multa_t.visible=false
			dw_reporte.object.multa.visible=false
			dw_reporte.object.cantidad_t.visible=true
			dw_reporte.object.cantidad.visible=true
			dw_reporte.object.compute_cantidad.visible=true
			dw_reporte.object.compute_costo_mat.visible=true
			dw_reporte.object.costo_mat.visible=true
			dw_reporte.object.costo_mat_t.visible=true
		end if
		lds_solicitud.Filter()
	end if
end if

li_row = lds_solicitud.RowCount()
lds_solicitud.SetSort("#3A #1A #5")
lds_solicitud.Sort()

for li_i=1 to li_row

	if li_estatus=-1 and isNull(lds_solicitud.GetItemDateTime(li_i,'spre_solicitud_fecha_cancelacion')) then goto sigue
	if li_estatus=-2 and lds_solicitud.GetItemNumber(li_i,'merma')=0 then goto sigue
	if li_estatus=1 and (not isNull(lds_solicitud.GetItemDateTime(li_i,'spre_solicitud_fecha_cancelacion')) or lds_solicitud.GetItemNumber(li_i,'merma')=1) then goto sigue
	
	li_in=li_in+1
	dw_reporte.insertrow(0)
	dw_reporte.SetItem(li_in,'folio',lds_solicitud.GetItemNumber(li_i,'spre_solicitud_folio'))	
	dw_reporte.SetItem(li_in,'solicitanteid',lds_solicitud.GetItemNumber(li_i,'spre_solicitud_solicitanteid'))	
	dw_reporte.SetItem(li_in,'solicitantenombre',lds_solicitud.GetItemString(li_i,'spre_prestamo_material_solicitantenombre'))	
	dw_reporte.SetItem(li_in,'tipo_usuario',lds_solicitud.GetItemString(li_i,'spre_tipo_usuario_tipo_usuario'))	
	dw_reporte.SetItem(li_in,'material_nombre',lds_solicitud.GetItemString(li_i,'spre_materiales_material_nombre'))	
	dw_reporte.SetItem(li_in,'num_serie',lds_solicitud.GetItemString(li_i,'spre_sol_materiales_num_serie'))	
	dw_reporte.SetItem(li_in,'fecha_inicio',lds_solicitud.GetItemDateTime(li_i,'spre_solicitud_fecha_inicio'))	
	dw_reporte.SetItem(li_in,'fecha_final',lds_solicitud.GetItemDateTime(li_i,'spre_solicitud_fecha_fin'))	
	dw_reporte.SetItem(li_in,'fecha_entrega',lds_solicitud.GetItemDateTime(li_i,'spre_sol_materiales_fecha_entrega'))	
	dw_reporte.SetItem(li_in,'estatus_nombre',lds_solicitud.GetItemString(li_i,'estatus_nombre'))	
	dw_reporte.SetItem(li_in,'cantidad',lds_solicitud.GetItemNumber(li_i,'cantidad'))	
	dw_reporte.SetItem(li_in,'merma',lds_solicitud.GetItemNumber(li_i,'merma'))	
	dw_reporte.SetItem(li_in,'condicion',lds_solicitud.GetItemNumber(li_i,'condicion'))	
	if ii_venta=1 then dw_reporte.SetItem(li_in,'costo_mat',lds_solicitud.GetItemDecimal(li_i,'costo_mat')*lds_solicitud.GetItemNumber(li_i,'cantidad'))	
	
	if lds_solicitud.GetItemNumber(li_i,'merma')=1 then 
		if (gi_depto=8 and ii_cvearea=1) then
			dw_reporte.SetItem(li_in,'estatus_nombre','No llegó')	
		else
			if gi_depto=2 then
				dw_reporte.SetItem(li_in,'estatus_nombre','Venta')	
			else
				dw_reporte.SetItem(li_in,'estatus_nombre','Merma')	
			end if
		end if	
	end if

	if lds_solicitud.GetItemNumber(li_i,'multa')=0 then dw_reporte.SetItem(li_in,'multa','Pendiente')
	if lds_solicitud.GetItemNumber(li_i,'multa')=1 then dw_reporte.SetItem(li_in,'multa','Pagada')
	if lds_solicitud.GetItemNumber(li_i,'multa')=2 then dw_reporte.SetItem(li_in,'multa','Condonada')
	if isNull(lds_solicitud.GetItemDateTime(li_i,'spre_solicitud_fecha_cancelacion'))=false then dw_reporte.SetItem(li_in,'estatus_nombre','Cancelada')

	if ll_folio_anterior<>lds_solicitud.GetItemNumber(li_i,'spre_solicitud_folio') then
		ll_folio_anterior=lds_solicitud.GetItemNumber(li_i,'spre_solicitud_folio')
		ll_conteo=ll_conteo+1
	end if
	
	sigue:
	
next

if cbx_agrupar.checked=true then
	dw_reporte.SetSort("#1A #5A #6A")
	dw_reporte.Sort()
end if

dw_reporte.SetRedraw(true)

if ii_venta=0 then
	st_reservaciones.text='Reservaciones: '+string(ll_conteo)
else
	st_reservaciones.text=''
end if

ii_estatus=li_estatus
end event

type st_cuenta from statictext within w_gen_reporte_prestamo_mat
integer x = 1404
integer y = 221
integer width = 249
integer height = 61
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Cuenta:"
boolean focusrectangle = false
end type

type st_area from statictext within w_gen_reporte_prestamo_mat
integer x = 1459
integer y = 58
integer width = 260
integer height = 51
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Area:"
boolean focusrectangle = false
end type

type rb_status from radiobutton within w_gen_reporte_prestamo_mat
integer x = 95
integer y = 307
integer width = 614
integer height = 77
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Estatus de Solicitud"
end type

event clicked;dw_tipo_usuario.enabled=false
sle_solicitante.enabled=false
ddlb_estatus.enabled=true
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
dw_mat_grupo.enabled=false
dw_mat_material.enabled=false
sle_folio.enabled=false
sle_folio_presol.enabled=false

ii_menu=2

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
ddlb_estatus.SetFocus()
end event

type rb_material from radiobutton within w_gen_reporte_prestamo_mat
integer x = 95
integer y = 499
integer width = 505
integer height = 77
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Grupo/Material"
end type

event clicked;dw_tipo_usuario.enabled=false
sle_solicitante.enabled=false
ddlb_estatus.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
dw_mat_grupo.enabled=true
dw_mat_material.enabled=true
sle_folio.enabled=false
sle_folio_presol.enabled=false

ii_menu=4

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
dw_mat_grupo.SetFocus()
end event

type fecha from radiobutton within w_gen_reporte_prestamo_mat
integer x = 95
integer y = 403
integer width = 410
integer height = 77
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Fechas"
end type

event clicked;dw_tipo_usuario.enabled=false
sle_solicitante.enabled=false
ddlb_estatus.enabled=false
em_fecha_inicio.enabled=true
em_fecha_final.enabled=true
dw_mat_grupo.enabled=false
dw_mat_material.enabled=false
sle_folio.enabled=false
sle_folio_presol.enabled=false

ii_menu=3

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
em_fecha_inicio.SetFocus()
end event

type rb_tipo_usuario from radiobutton within w_gen_reporte_prestamo_mat
integer x = 95
integer y = 205
integer width = 563
integer height = 77
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Tipo de Usuario"
boolean checked = true
end type

event clicked;dw_tipo_usuario.enabled=true
sle_solicitante.enabled=true
ddlb_estatus.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
dw_mat_grupo.enabled=false
dw_mat_material.enabled=false
sle_folio.enabled=false
sle_folio_presol.enabled=false

ii_menu=1

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
dw_tipo_usuario.SetFocus()
end event

type sle_solicitante from singlelineedit within w_gen_reporte_prestamo_mat
integer x = 1649
integer y = 208
integer width = 322
integer height = 74
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event modified;dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
end event

type dw_mat_grupo from u_basedw within w_gen_reporte_prestamo_mat
integer x = 720
integer y = 506
integer width = 735
integer height = 77
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_csal_mat_matgrupo_drop"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("matgrupo", "matgrupo", "matgrupo")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then ii_grupo=integer(trim(this.gettext()))

dw_mat_material.Reset()
idwc_material.Reset()


if gi_depto=2 then
	if ii_venta=1 then
		idwc_material.SetFilter("disponibilidad = 1")
	else
		idwc_material.SetFilter("disponibilidad = 0")
	end if	
	idwc_material.Filter()
end if

idwc_material.Retrieve(gi_depto,ii_cvearea,ii_grupo)
if idwc_material.RowCount()>0 then dw_mat_material.insertrow(0)

is_material='-1'
dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
end event

type dw_area from u_basedw within w_gen_reporte_prestamo_mat
integer x = 1627
integer y = 45
integer width = 976
integer height = 77
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_gen_cat_area_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("area", "area", "area")
end event

event itemchanged;call super::itemchanged;ii_cvearea=long(this.gettext())

idwc_grupo.Reset()
dw_mat_grupo.Reset()
idwc_material.Reset()
dw_mat_material.Reset()
idwc_tipo_usuario.Reset()
dw_tipo_usuario.Reset()

idwc_grupo.Retrieve(gi_depto,ii_cvearea)
if idwc_grupo.RowCount()>0 then dw_mat_grupo.insertrow(0)

idwc_tipo_usuario.Retrieve(gi_depto,ii_cvearea)
if idwc_tipo_usuario.RowCount()>0 then dw_tipo_usuario.insertrow(0)

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
ii_tipo_usuario=0
end event

type st_periodo from statictext within w_gen_reporte_prestamo_mat
integer x = 33
integer y = 58
integer width = 234
integer height = 51
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Periodo:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_gen_reporte_prestamo_mat
integer x = 26
integer y = 125
integer width = 5573
integer height = 589
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
end type

type cb_exportar from commandbutton within w_gen_reporte_prestamo_mat
integer x = 5186
integer y = 410
integer width = 304
integer height = 93
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Exportar"
end type

event clicked;f_exportar_reporte(dw_reporte,ii_exportar,"Reporte de Préstamo de Materiales")
end event

type ddlb_estatus from dropdownlistbox within w_gen_reporte_prestamo_mat
integer x = 720
integer y = 307
integer width = 494
integer height = 477
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean enabled = false
string item[] = {"Activa","Entregada","No Entregada","Multa"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text(index)
	case 'Activa'
		ii_estatus=0
	case 'Entregada'
		ii_estatus=1
	case 'No Entregada'
		ii_estatus=2
	case 'Multa'
		ii_estatus=3		
	case 'Cancelada'
		ii_estatus=-1
	case 'No llegó'
		ii_estatus=-2
end choose

dw_reporte.Reset()
st_reservaciones.text='Reservaciones: 0'
end event

