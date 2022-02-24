$PBExportHeader$w_gen_reporte_animales_asignacion.srw
forward
global type w_gen_reporte_animales_asignacion from window
end type
type rb_todo from radiobutton within w_gen_reporte_animales_asignacion
end type
type dw_solicitud from datawindow within w_gen_reporte_animales_asignacion
end type
type sle_inventario from singlelineedit within w_gen_reporte_animales_asignacion
end type
type sle_folio from singlelineedit within w_gen_reporte_animales_asignacion
end type
type rb_folio from radiobutton within w_gen_reporte_animales_asignacion
end type
type st_reservaciones from statictext within w_gen_reporte_animales_asignacion
end type
type st_2 from statictext within w_gen_reporte_animales_asignacion
end type
type sle_anio from singlelineedit within w_gen_reporte_animales_asignacion
end type
type st_anio from statictext within w_gen_reporte_animales_asignacion
end type
type ddlb_periodo from dropdownlistbox within w_gen_reporte_animales_asignacion
end type
type cb_imprimir from commandbutton within w_gen_reporte_animales_asignacion
end type
type dw_reporte from datawindow within w_gen_reporte_animales_asignacion
end type
type st_1 from statictext within w_gen_reporte_animales_asignacion
end type
type em_fecha_final from editmask within w_gen_reporte_animales_asignacion
end type
type em_fecha_inicio from editmask within w_gen_reporte_animales_asignacion
end type
type dw_tipo_usuario from u_basedw within w_gen_reporte_animales_asignacion
end type
type cb_buscar from commandbutton within w_gen_reporte_animales_asignacion
end type
type st_cuenta from statictext within w_gen_reporte_animales_asignacion
end type
type rb_status from radiobutton within w_gen_reporte_animales_asignacion
end type
type rb_inventario from radiobutton within w_gen_reporte_animales_asignacion
end type
type fecha from radiobutton within w_gen_reporte_animales_asignacion
end type
type rb_tipo_usuario from radiobutton within w_gen_reporte_animales_asignacion
end type
type sle_solicitante from singlelineedit within w_gen_reporte_animales_asignacion
end type
type st_periodo from statictext within w_gen_reporte_animales_asignacion
end type
type gb_1 from groupbox within w_gen_reporte_animales_asignacion
end type
type cb_exportar from commandbutton within w_gen_reporte_animales_asignacion
end type
type ddlb_estatus from dropdownlistbox within w_gen_reporte_animales_asignacion
end type
end forward

global type w_gen_reporte_animales_asignacion from window
integer width = 5870
integer height = 2896
boolean titlebar = true
string title = "Reporte de Asignación de animales"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
rb_todo rb_todo
dw_solicitud dw_solicitud
sle_inventario sle_inventario
sle_folio sle_folio
rb_folio rb_folio
st_reservaciones st_reservaciones
st_2 st_2
sle_anio sle_anio
st_anio st_anio
ddlb_periodo ddlb_periodo
cb_imprimir cb_imprimir
dw_reporte dw_reporte
st_1 st_1
em_fecha_final em_fecha_final
em_fecha_inicio em_fecha_inicio
dw_tipo_usuario dw_tipo_usuario
cb_buscar cb_buscar
st_cuenta st_cuenta
rb_status rb_status
rb_inventario rb_inventario
fecha fecha
rb_tipo_usuario rb_tipo_usuario
sle_solicitante sle_solicitante
st_periodo st_periodo
gb_1 gb_1
cb_exportar cb_exportar
ddlb_estatus ddlb_estatus
end type
global w_gen_reporte_animales_asignacion w_gen_reporte_animales_asignacion

type variables
integer ii_tipo_usuario=0, ii_estatus=0, ii_menu=0
integer ii_periodo, ii_anio, ii_todo=0
string is_consulta

DatawindowChild  idwc_tipo_usuario

end variables

on w_gen_reporte_animales_asignacion.create
this.rb_todo=create rb_todo
this.dw_solicitud=create dw_solicitud
this.sle_inventario=create sle_inventario
this.sle_folio=create sle_folio
this.rb_folio=create rb_folio
this.st_reservaciones=create st_reservaciones
this.st_2=create st_2
this.sle_anio=create sle_anio
this.st_anio=create st_anio
this.ddlb_periodo=create ddlb_periodo
this.cb_imprimir=create cb_imprimir
this.dw_reporte=create dw_reporte
this.st_1=create st_1
this.em_fecha_final=create em_fecha_final
this.em_fecha_inicio=create em_fecha_inicio
this.dw_tipo_usuario=create dw_tipo_usuario
this.cb_buscar=create cb_buscar
this.st_cuenta=create st_cuenta
this.rb_status=create rb_status
this.rb_inventario=create rb_inventario
this.fecha=create fecha
this.rb_tipo_usuario=create rb_tipo_usuario
this.sle_solicitante=create sle_solicitante
this.st_periodo=create st_periodo
this.gb_1=create gb_1
this.cb_exportar=create cb_exportar
this.ddlb_estatus=create ddlb_estatus
this.Control[]={this.rb_todo,&
this.dw_solicitud,&
this.sle_inventario,&
this.sle_folio,&
this.rb_folio,&
this.st_reservaciones,&
this.st_2,&
this.sle_anio,&
this.st_anio,&
this.ddlb_periodo,&
this.cb_imprimir,&
this.dw_reporte,&
this.st_1,&
this.em_fecha_final,&
this.em_fecha_inicio,&
this.dw_tipo_usuario,&
this.cb_buscar,&
this.st_cuenta,&
this.rb_status,&
this.rb_inventario,&
this.fecha,&
this.rb_tipo_usuario,&
this.sle_solicitante,&
this.st_periodo,&
this.gb_1,&
this.cb_exportar,&
this.ddlb_estatus}
end on

on w_gen_reporte_animales_asignacion.destroy
destroy(this.rb_todo)
destroy(this.dw_solicitud)
destroy(this.sle_inventario)
destroy(this.sle_folio)
destroy(this.rb_folio)
destroy(this.st_reservaciones)
destroy(this.st_2)
destroy(this.sle_anio)
destroy(this.st_anio)
destroy(this.ddlb_periodo)
destroy(this.cb_imprimir)
destroy(this.dw_reporte)
destroy(this.st_1)
destroy(this.em_fecha_final)
destroy(this.em_fecha_inicio)
destroy(this.dw_tipo_usuario)
destroy(this.cb_buscar)
destroy(this.st_cuenta)
destroy(this.rb_status)
destroy(this.rb_inventario)
destroy(this.fecha)
destroy(this.rb_tipo_usuario)
destroy(this.sle_solicitante)
destroy(this.st_periodo)
destroy(this.gb_1)
destroy(this.cb_exportar)
destroy(this.ddlb_estatus)
end on

event open;integer li_periodo, li_anio

//Usuario
dw_tipo_usuario.settransobject(gtr_sumuia)
dw_tipo_usuario.getchild('tipo_usuario',idwc_tipo_usuario)
idwc_tipo_usuario.settransobject(gtr_sumuia)

em_fecha_inicio.text=string(Today())
em_fecha_final.text=string(Today())

idwc_tipo_usuario.Retrieve(gi_depto,gi_area)
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


dw_solicitud.settransobject(gtr_sumuia)
is_consulta = dw_solicitud.getsqlselect()
end event

type rb_todo from radiobutton within w_gen_reporte_animales_asignacion
integer x = 2674
integer y = 444
integer width = 503
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Todo"
boolean checked = true
end type

event clicked;dw_tipo_usuario.enabled=false
sle_solicitante.enabled=false
ddlb_estatus.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
sle_inventario.enabled=false
sle_folio.enabled=false

ii_menu=0

end event

type dw_solicitud from datawindow within w_gen_reporte_animales_asignacion
boolean visible = false
integer x = 2464
integer y = 904
integer width = 434
integer height = 188
integer taborder = 80
string title = "none"
string dataobject = "d_gen_rep_animales_asignacion_param"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_inventario from singlelineedit within w_gen_reporte_animales_asignacion
integer x = 3150
integer y = 324
integer width = 320
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
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

type sle_folio from singlelineedit within w_gen_reporte_animales_asignacion
integer x = 3150
integer y = 208
integer width = 320
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
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

type rb_folio from radiobutton within w_gen_reporte_animales_asignacion
integer x = 2674
integer y = 220
integer width = 288
integer height = 76
integer textsize = -9
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
sle_inventario.enabled=false
sle_folio.enabled=true

ii_menu=5

sle_folio.SetFocus()
end event

type st_reservaciones from statictext within w_gen_reporte_animales_asignacion
integer x = 4983
integer y = 2672
integer width = 814
integer height = 76
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

type st_2 from statictext within w_gen_reporte_animales_asignacion
integer x = 2144
integer y = 216
integer width = 366
integer height = 80
integer textsize = -9
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

type sle_anio from singlelineedit within w_gen_reporte_animales_asignacion
integer x = 978
integer y = 44
integer width = 210
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
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

type st_anio from statictext within w_gen_reporte_animales_asignacion
integer x = 814
integer y = 56
integer width = 155
integer height = 52
integer textsize = -9
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

type ddlb_periodo from dropdownlistbox within w_gen_reporte_animales_asignacion
integer x = 283
integer y = 44
integer width = 462
integer height = 380
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Primavera","Verano","Otoño","Todo el año"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text(index)
	case 'Primavera'
		ii_periodo=0
	case 'Verano'
		ii_periodo=1
	case 'Otoño'
		ii_periodo=2
	case 'Todo el año'
		ii_periodo=-1
end choose

sle_anio.SetFocus()
end event

type cb_imprimir from commandbutton within w_gen_reporte_animales_asignacion
integer x = 5376
integer y = 328
integer width = 320
integer height = 100
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Imprimir"
end type

event clicked;dw_reporte.print()
end event

type dw_reporte from datawindow within w_gen_reporte_animales_asignacion
integer x = 37
integer y = 668
integer width = 5774
integer height = 1888
integer taborder = 30
string title = "none"
string dataobject = "d_gen_rep_animales_asignacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_gen_reporte_animales_asignacion
integer x = 1125
integer y = 436
integer width = 78
integer height = 60
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

type em_fecha_final from editmask within w_gen_reporte_animales_asignacion
integer x = 1234
integer y = 428
integer width = 375
integer height = 76
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

type em_fecha_inicio from editmask within w_gen_reporte_animales_asignacion
integer x = 722
integer y = 428
integer width = 375
integer height = 76
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

type dw_tipo_usuario from u_basedw within w_gen_reporte_animales_asignacion
integer x = 722
integer y = 212
integer width = 631
integer height = 76
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_gen_cat_tipo_usuario_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("area", "area", "area")
end event

event itemchanged;call super::itemchanged;ii_tipo_usuario=long(this.gettext())
sle_solicitante.SetFocus()

end event

type cb_buscar from commandbutton within w_gen_reporte_animales_asignacion
integer x = 5376
integer y = 216
integer width = 320
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Buscar"
end type

event clicked;string ls_consulta, ls_filtro = '', ls_tipo, ls_cuenta, ls_estatus, ls_fecha, ls_inventario, ls_folio
integer li_i

dw_reporte.SetRedraw(false)
dw_reporte.SetFilter('')
dw_reporte.Filter()
dw_reporte.Reset()
dw_solicitud.Reset()

choose case ii_menu
	case 1

		ls_tipo = string(ii_tipo_usuario)
		ls_filtro = ls_filtro + " and a.tipo_solicitud = " + ls_tipo
		
		ls_cuenta = trim(sle_solicitante.text)
		if isNumber(ls_cuenta) then ls_filtro = ls_filtro + " and a.solicitanteid = " + ls_cuenta

	case 2

		ls_estatus = string(ii_estatus)
		ls_filtro = ls_filtro + " and b.estatus = " + ls_estatus

	case 3

		ls_fecha = "'" + mid(em_fecha_inicio.text,7,4)  + '/' + mid(em_fecha_inicio.text,4,2) + '/' + mid(em_fecha_inicio.text,1,2) + " 00:00:00'"
		ls_fecha = ls_fecha + " and '" + mid(em_fecha_final.text,7,4)  + '/' + mid(em_fecha_final.text,4,2) + '/' + mid(em_fecha_final.text,1,2) + " 23:59:59'"
		ls_filtro = ls_filtro + " and a.fecha_asignacion between " + ls_fecha
	
	case 4

		ls_inventario = trim(sle_inventario.text)
		if isNumber(ls_inventario) then ls_filtro = ls_filtro + " and b.id_inventario = " + ls_inventario	else ls_filtro = ' and 0 = -1'

	case 5

		ls_folio = trim(sle_folio.text)
		if isNumber(ls_folio) then ls_filtro = ls_filtro + " and a.folio = " + ls_folio	else ls_filtro =  ' and 0 = -1'

end choose

if ii_todo = 0 then	
	ls_filtro = ls_filtro + " and a.anio = " + string(ii_anio)
	if ii_periodo >=0 then ls_filtro = ls_filtro + " and a.cveperiodo = " + string(ii_periodo)
end if
	

ls_consulta = is_consulta + ls_filtro
dw_solicitud.setsqlselect(ls_consulta)
dw_solicitud.Retrieve()

for li_i=1 to dw_solicitud.Retrieve()
	dw_reporte.insertrow(0)
	dw_reporte.SetItem(li_i,'folio',dw_solicitud.GetItemNumber(li_i,'folio'))	
	dw_reporte.SetItem(li_i,'solicitanteid',dw_solicitud.GetItemNumber(li_i,'solicitanteid'))	
	dw_reporte.SetItem(li_i,'solicitantenombre',dw_solicitud.GetItemString(li_i,'solicitantenombre'))	
	dw_reporte.SetItem(li_i,'tipo_usuario',dw_solicitud.GetItemString(li_i,'tipo_usuario'))	
	dw_reporte.SetItem(li_i,'nombre',dw_solicitud.GetItemString(li_i,'nombre'))	
	dw_reporte.SetItem(li_i,'id_inventario',dw_solicitud.GetItemNumber(li_i,'id_inventario'))
	dw_reporte.SetItem(li_i,'fecha_asignacion',dw_solicitud.GetItemDateTime(li_i,'fecha_asignacion'))	
	dw_reporte.SetItem(li_i,'fecha_regreso',dw_solicitud.GetItemDateTime(li_i,'fecha_regreso'))	
	dw_reporte.SetItem(li_i,'estatus_nombre',dw_solicitud.GetItemString(li_i,'estatus_nombre'))	
	dw_reporte.SetItem(li_i,'observaciones',dw_solicitud.GetItemString(li_i,'observaciones'))	
	dw_reporte.SetItem(li_i,'motivo',dw_solicitud.GetItemString(li_i,'motivo'))
next


dw_reporte.SetSort("#1A")
dw_reporte.Sort()
dw_reporte.SetRedraw(true)


end event

type st_cuenta from statictext within w_gen_reporte_animales_asignacion
integer x = 1550
integer y = 220
integer width = 247
integer height = 60
integer textsize = -9
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

type rb_status from radiobutton within w_gen_reporte_animales_asignacion
integer x = 101
integer y = 332
integer width = 613
integer height = 76
integer textsize = -9
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
sle_inventario.enabled=false
sle_folio.enabled=false

ii_menu=2

ddlb_estatus.SetFocus()
end event

type rb_inventario from radiobutton within w_gen_reporte_animales_asignacion
integer x = 2674
integer y = 332
integer width = 503
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Id Inventario"
end type

event clicked;dw_tipo_usuario.enabled=false
sle_solicitante.enabled=false
ddlb_estatus.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
sle_inventario.enabled=true
sle_folio.enabled=false

ii_menu=4

sle_inventario.SetFocus()
end event

type fecha from radiobutton within w_gen_reporte_animales_asignacion
integer x = 101
integer y = 444
integer width = 411
integer height = 76
integer textsize = -9
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
sle_inventario.enabled=false
sle_folio.enabled=false

ii_menu=3

em_fecha_inicio.SetFocus()
end event

type rb_tipo_usuario from radiobutton within w_gen_reporte_animales_asignacion
integer x = 101
integer y = 220
integer width = 562
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Tipo de Usuario"
end type

event clicked;dw_tipo_usuario.enabled=true
sle_solicitante.enabled=true
ddlb_estatus.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
sle_inventario.enabled=false
sle_folio.enabled=false

ii_menu=1

dw_tipo_usuario.SetFocus()
end event

type sle_solicitante from singlelineedit within w_gen_reporte_animales_asignacion
integer x = 1797
integer y = 208
integer width = 320
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
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

type st_periodo from statictext within w_gen_reporte_animales_asignacion
integer x = 37
integer y = 56
integer width = 233
integer height = 52
integer textsize = -9
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

type gb_1 from groupbox within w_gen_reporte_animales_asignacion
integer x = 37
integer y = 140
integer width = 5774
integer height = 468
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

type cb_exportar from commandbutton within w_gen_reporte_animales_asignacion
integer x = 5376
integer y = 440
integer width = 320
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Exportar"
end type

event clicked;f_exportar_reporte(dw_reporte,0,"Reporte de Préstamo de Materiales")
end event

type ddlb_estatus from dropdownlistbox within w_gen_reporte_animales_asignacion
integer x = 722
integer y = 316
integer width = 494
integer height = 224
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean enabled = false
string item[] = {"Asignado","Regresado"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text(index)
	case 'Asignado'
		ii_estatus=1
	case 'Regresado'
		ii_estatus=2
end choose

end event

