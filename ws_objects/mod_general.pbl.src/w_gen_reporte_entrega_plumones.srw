$PBExportHeader$w_gen_reporte_entrega_plumones.srw
forward
global type w_gen_reporte_entrega_plumones from window
end type
type rb_todo from radiobutton within w_gen_reporte_entrega_plumones
end type
type dw_solicitud from datawindow within w_gen_reporte_entrega_plumones
end type
type sle_anio from singlelineedit within w_gen_reporte_entrega_plumones
end type
type st_anio from statictext within w_gen_reporte_entrega_plumones
end type
type ddlb_periodo from dropdownlistbox within w_gen_reporte_entrega_plumones
end type
type cb_imprimir from commandbutton within w_gen_reporte_entrega_plumones
end type
type dw_reporte from datawindow within w_gen_reporte_entrega_plumones
end type
type st_1 from statictext within w_gen_reporte_entrega_plumones
end type
type em_fecha_final from editmask within w_gen_reporte_entrega_plumones
end type
type em_fecha_inicio from editmask within w_gen_reporte_entrega_plumones
end type
type cb_buscar from commandbutton within w_gen_reporte_entrega_plumones
end type
type rb_status from radiobutton within w_gen_reporte_entrega_plumones
end type
type fecha from radiobutton within w_gen_reporte_entrega_plumones
end type
type rb_cuenta from radiobutton within w_gen_reporte_entrega_plumones
end type
type sle_solicitante from singlelineedit within w_gen_reporte_entrega_plumones
end type
type st_periodo from statictext within w_gen_reporte_entrega_plumones
end type
type gb_1 from groupbox within w_gen_reporte_entrega_plumones
end type
type cb_exportar from commandbutton within w_gen_reporte_entrega_plumones
end type
type ddlb_estatus from dropdownlistbox within w_gen_reporte_entrega_plumones
end type
end forward

global type w_gen_reporte_entrega_plumones from window
integer width = 4100
integer height = 2301
boolean titlebar = true
string title = "Reporte de Entrega de plumones"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
rb_todo rb_todo
dw_solicitud dw_solicitud
sle_anio sle_anio
st_anio st_anio
ddlb_periodo ddlb_periodo
cb_imprimir cb_imprimir
dw_reporte dw_reporte
st_1 st_1
em_fecha_final em_fecha_final
em_fecha_inicio em_fecha_inicio
cb_buscar cb_buscar
rb_status rb_status
fecha fecha
rb_cuenta rb_cuenta
sle_solicitante sle_solicitante
st_periodo st_periodo
gb_1 gb_1
cb_exportar cb_exportar
ddlb_estatus ddlb_estatus
end type
global w_gen_reporte_entrega_plumones w_gen_reporte_entrega_plumones

type variables
integer ii_tipo_usuario=3, ii_estatus=0, ii_menu=0
integer ii_periodo, ii_anio, ii_todo=0
string is_consulta

end variables

on w_gen_reporte_entrega_plumones.create
this.rb_todo=create rb_todo
this.dw_solicitud=create dw_solicitud
this.sle_anio=create sle_anio
this.st_anio=create st_anio
this.ddlb_periodo=create ddlb_periodo
this.cb_imprimir=create cb_imprimir
this.dw_reporte=create dw_reporte
this.st_1=create st_1
this.em_fecha_final=create em_fecha_final
this.em_fecha_inicio=create em_fecha_inicio
this.cb_buscar=create cb_buscar
this.rb_status=create rb_status
this.fecha=create fecha
this.rb_cuenta=create rb_cuenta
this.sle_solicitante=create sle_solicitante
this.st_periodo=create st_periodo
this.gb_1=create gb_1
this.cb_exportar=create cb_exportar
this.ddlb_estatus=create ddlb_estatus
this.Control[]={this.rb_todo,&
this.dw_solicitud,&
this.sle_anio,&
this.st_anio,&
this.ddlb_periodo,&
this.cb_imprimir,&
this.dw_reporte,&
this.st_1,&
this.em_fecha_final,&
this.em_fecha_inicio,&
this.cb_buscar,&
this.rb_status,&
this.fecha,&
this.rb_cuenta,&
this.sle_solicitante,&
this.st_periodo,&
this.gb_1,&
this.cb_exportar,&
this.ddlb_estatus}
end on

on w_gen_reporte_entrega_plumones.destroy
destroy(this.rb_todo)
destroy(this.dw_solicitud)
destroy(this.sle_anio)
destroy(this.st_anio)
destroy(this.ddlb_periodo)
destroy(this.cb_imprimir)
destroy(this.dw_reporte)
destroy(this.st_1)
destroy(this.em_fecha_final)
destroy(this.em_fecha_inicio)
destroy(this.cb_buscar)
destroy(this.rb_status)
destroy(this.fecha)
destroy(this.rb_cuenta)
destroy(this.sle_solicitante)
destroy(this.st_periodo)
destroy(this.gb_1)
destroy(this.cb_exportar)
destroy(this.ddlb_estatus)
end on

event open;integer li_periodo, li_anio

em_fecha_inicio.text=string(Today())
em_fecha_final.text=string(Today())

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

type rb_todo from radiobutton within w_gen_reporte_entrega_plumones
integer x = 102
integer y = 506
integer width = 505
integer height = 77
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

event clicked;sle_solicitante.enabled=false
ddlb_estatus.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false

ii_menu=0

end event

type dw_solicitud from datawindow within w_gen_reporte_entrega_plumones
boolean visible = false
integer x = 2465
integer y = 902
integer width = 432
integer height = 186
integer taborder = 80
string title = "none"
string dataobject = "d_gen_rep_entrega_plumones_param"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_anio from singlelineedit within w_gen_reporte_entrega_plumones
integer x = 980
integer y = 45
integer width = 212
integer height = 70
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

type st_anio from statictext within w_gen_reporte_entrega_plumones
integer x = 812
integer y = 54
integer width = 154
integer height = 51
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

type ddlb_periodo from dropdownlistbox within w_gen_reporte_entrega_plumones
integer x = 282
integer y = 45
integer width = 461
integer height = 381
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

type cb_imprimir from commandbutton within w_gen_reporte_entrega_plumones
integer x = 3584
integer y = 326
integer width = 322
integer height = 99
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

type dw_reporte from datawindow within w_gen_reporte_entrega_plumones
integer x = 37
integer y = 659
integer width = 3979
integer height = 1510
integer taborder = 30
string title = "none"
string dataobject = "d_gen_rep_entrega_plumones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_gen_reporte_entrega_plumones
integer x = 1126
integer y = 422
integer width = 77
integer height = 58
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

type em_fecha_final from editmask within w_gen_reporte_entrega_plumones
integer x = 1232
integer y = 416
integer width = 373
integer height = 74
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

type em_fecha_inicio from editmask within w_gen_reporte_entrega_plumones
integer x = 724
integer y = 416
integer width = 373
integer height = 74
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

type cb_buscar from commandbutton within w_gen_reporte_entrega_plumones
integer x = 3584
integer y = 214
integer width = 322
integer height = 99
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Buscar"
end type

event clicked;string ls_consulta, ls_filtro = '', ls_tipo, ls_cuenta, ls_estatus, ls_fecha
integer li_i

dw_reporte.SetRedraw(false)
dw_reporte.SetFilter('')
dw_reporte.Filter()
dw_reporte.Reset()
dw_solicitud.Reset()

choose case ii_menu
	case 1

		ls_tipo = string(ii_tipo_usuario)
		ls_filtro = ls_filtro + " and tipo_usuario = " + ls_tipo
		
		ls_cuenta = trim(sle_solicitante.text)
		if isNumber(ls_cuenta) then ls_filtro = ls_filtro + " and solicitanteid = " + ls_cuenta else ls_filtro = ls_filtro + " and 0 = -1"

	case 2

		ls_estatus = string(ii_estatus)
		ls_filtro = ls_filtro + " and estatus = " + ls_estatus

	case 3

		ls_fecha = "'" + mid(em_fecha_inicio.text,7,4)  + '/' + mid(em_fecha_inicio.text,4,2) + '/' + mid(em_fecha_inicio.text,1,2) + " 00:00:00'"
		ls_fecha = ls_fecha + " and '" + mid(em_fecha_final.text,7,4)  + '/' + mid(em_fecha_final.text,4,2) + '/' + mid(em_fecha_final.text,1,2) + " 23:59:59'"
		ls_filtro = ls_filtro + " and fecha between " + ls_fecha
	
end choose

if ii_todo = 0 then	
	ls_filtro = ls_filtro + " and anio = " + string(ii_anio)
	if ii_periodo >=0 then ls_filtro = ls_filtro + " and cveperiodo = " + string(ii_periodo)
end if
	

ls_consulta = is_consulta + ls_filtro

dw_solicitud.setsqlselect(ls_consulta)
dw_solicitud.Retrieve()

for li_i=1 to dw_solicitud.Retrieve()
	dw_reporte.insertrow(0)
	dw_reporte.SetItem(li_i,'folio',dw_solicitud.GetItemNumber(li_i,'id'))	
	dw_reporte.SetItem(li_i,'solicitanteid',dw_solicitud.GetItemNumber(li_i,'solicitanteid'))	
	dw_reporte.SetItem(li_i,'solicitantenombre',dw_solicitud.GetItemString(li_i,'solicitantenombre'))	
	dw_reporte.SetItem(li_i,'tipo_usuario',dw_solicitud.GetItemString(li_i,'tipo_nombre'))
	dw_reporte.SetItem(li_i,'fecha',dw_solicitud.GetItemDateTime(li_i,'fecha'))
	dw_reporte.SetItem(li_i,'estatus_nombre',dw_solicitud.GetItemString(li_i,'estatus_nombre'))
next


dw_reporte.SetSort("#1A")
dw_reporte.Sort()
dw_reporte.SetRedraw(true)


end event

type rb_status from radiobutton within w_gen_reporte_entrega_plumones
integer x = 102
integer y = 317
integer width = 611
integer height = 77
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

event clicked;sle_solicitante.enabled=false
ddlb_estatus.enabled=true
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false

ii_menu=2

ddlb_estatus.SetFocus()
end event

type fecha from radiobutton within w_gen_reporte_entrega_plumones
integer x = 102
integer y = 413
integer width = 413
integer height = 77
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

event clicked;sle_solicitante.enabled=false
ddlb_estatus.enabled=false
em_fecha_inicio.enabled=true
em_fecha_final.enabled=true

ii_menu=3

em_fecha_inicio.SetFocus()
end event

type rb_cuenta from radiobutton within w_gen_reporte_entrega_plumones
integer x = 102
integer y = 218
integer width = 560
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Cuenta"
end type

event clicked;sle_solicitante.enabled=true
ddlb_estatus.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false

ii_menu=1

sle_solicitante.SetFocus()
end event

type sle_solicitante from singlelineedit within w_gen_reporte_entrega_plumones
integer x = 724
integer y = 208
integer width = 373
integer height = 74
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

type st_periodo from statictext within w_gen_reporte_entrega_plumones
integer x = 37
integer y = 54
integer width = 234
integer height = 51
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

type gb_1 from groupbox within w_gen_reporte_entrega_plumones
integer x = 37
integer y = 138
integer width = 3975
integer height = 477
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

type cb_exportar from commandbutton within w_gen_reporte_entrega_plumones
integer x = 3584
integer y = 438
integer width = 322
integer height = 99
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

event clicked;f_exportar_reporte(dw_reporte,0,"Reporte de Entrega de plumones")
end event

type ddlb_estatus from dropdownlistbox within w_gen_reporte_entrega_plumones
integer x = 724
integer y = 307
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
string item[] = {"Entrega","Cambio"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text(index)
	case 'Entrega'
		ii_estatus=1
	case 'Cambio'
		ii_estatus=2
end choose

end event

