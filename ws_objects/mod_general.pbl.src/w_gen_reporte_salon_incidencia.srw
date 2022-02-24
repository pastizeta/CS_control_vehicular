$PBExportHeader$w_gen_reporte_salon_incidencia.srw
forward
global type w_gen_reporte_salon_incidencia from window
end type
type sle_salon from singlelineedit within w_gen_reporte_salon_incidencia
end type
type rb_salon from radiobutton within w_gen_reporte_salon_incidencia
end type
type rb_todo from radiobutton within w_gen_reporte_salon_incidencia
end type
type dw_solicitud from datawindow within w_gen_reporte_salon_incidencia
end type
type sle_anio from singlelineedit within w_gen_reporte_salon_incidencia
end type
type st_anio from statictext within w_gen_reporte_salon_incidencia
end type
type ddlb_periodo from dropdownlistbox within w_gen_reporte_salon_incidencia
end type
type cb_imprimir from commandbutton within w_gen_reporte_salon_incidencia
end type
type dw_reporte from datawindow within w_gen_reporte_salon_incidencia
end type
type st_1 from statictext within w_gen_reporte_salon_incidencia
end type
type em_fecha_final from editmask within w_gen_reporte_salon_incidencia
end type
type em_fecha_inicio from editmask within w_gen_reporte_salon_incidencia
end type
type cb_buscar from commandbutton within w_gen_reporte_salon_incidencia
end type
type fecha from radiobutton within w_gen_reporte_salon_incidencia
end type
type rb_cuenta from radiobutton within w_gen_reporte_salon_incidencia
end type
type sle_solicitante from singlelineedit within w_gen_reporte_salon_incidencia
end type
type st_periodo from statictext within w_gen_reporte_salon_incidencia
end type
type gb_1 from groupbox within w_gen_reporte_salon_incidencia
end type
type cb_exportar from commandbutton within w_gen_reporte_salon_incidencia
end type
end forward

global type w_gen_reporte_salon_incidencia from window
integer width = 7058
integer height = 2896
boolean titlebar = true
string title = "Reporte de Incidencias en salones"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
sle_salon sle_salon
rb_salon rb_salon
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
fecha fecha
rb_cuenta rb_cuenta
sle_solicitante sle_solicitante
st_periodo st_periodo
gb_1 gb_1
cb_exportar cb_exportar
end type
global w_gen_reporte_salon_incidencia w_gen_reporte_salon_incidencia

type variables
integer ii_menu=0
integer ii_periodo, ii_anio, ii_todo=0
string is_consulta

end variables

on w_gen_reporte_salon_incidencia.create
this.sle_salon=create sle_salon
this.rb_salon=create rb_salon
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
this.fecha=create fecha
this.rb_cuenta=create rb_cuenta
this.sle_solicitante=create sle_solicitante
this.st_periodo=create st_periodo
this.gb_1=create gb_1
this.cb_exportar=create cb_exportar
this.Control[]={this.sle_salon,&
this.rb_salon,&
this.rb_todo,&
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
this.fecha,&
this.rb_cuenta,&
this.sle_solicitante,&
this.st_periodo,&
this.gb_1,&
this.cb_exportar}
end on

on w_gen_reporte_salon_incidencia.destroy
destroy(this.sle_salon)
destroy(this.rb_salon)
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
destroy(this.fecha)
destroy(this.rb_cuenta)
destroy(this.sle_solicitante)
destroy(this.st_periodo)
destroy(this.gb_1)
destroy(this.cb_exportar)
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

type sle_salon from singlelineedit within w_gen_reporte_salon_incidencia
integer x = 722
integer y = 300
integer width = 375
integer height = 76
integer taborder = 60
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
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type rb_salon from radiobutton within w_gen_reporte_salon_incidencia
integer x = 101
integer y = 316
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
string text = "Salón"
end type

event clicked;sle_solicitante.enabled=false
sle_salon.enabled=true
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false

ii_menu=2

sle_salon.SetFocus()
end event

type rb_todo from radiobutton within w_gen_reporte_salon_incidencia
integer x = 101
integer y = 508
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

event clicked;sle_solicitante.enabled=false
sle_salon.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false

ii_menu=0

end event

type dw_solicitud from datawindow within w_gen_reporte_salon_incidencia
boolean visible = false
integer x = 946
integer y = 952
integer width = 434
integer height = 188
integer taborder = 80
string title = "none"
string dataobject = "d_gen_rep_salon_incidencia_param"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_anio from singlelineedit within w_gen_reporte_salon_incidencia
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

type st_anio from statictext within w_gen_reporte_salon_incidencia
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

type ddlb_periodo from dropdownlistbox within w_gen_reporte_salon_incidencia
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

type cb_imprimir from commandbutton within w_gen_reporte_salon_incidencia
integer x = 3584
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

type dw_reporte from datawindow within w_gen_reporte_salon_incidencia
integer x = 37
integer y = 660
integer width = 6944
integer height = 2068
integer taborder = 30
string title = "none"
string dataobject = "d_gen_rep_salon_incidencia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_gen_reporte_salon_incidencia
integer x = 1125
integer y = 424
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

type em_fecha_final from editmask within w_gen_reporte_salon_incidencia
integer x = 1234
integer y = 416
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

type em_fecha_inicio from editmask within w_gen_reporte_salon_incidencia
integer x = 722
integer y = 416
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

type cb_buscar from commandbutton within w_gen_reporte_salon_incidencia
integer x = 3584
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

event clicked;string ls_consulta, ls_filtro = '', ls_cuenta, ls_fecha, ls_salon
integer li_i

dw_reporte.SetRedraw(false)
dw_reporte.SetFilter('')
dw_reporte.Filter()
dw_reporte.Reset()
dw_solicitud.Reset()

choose case ii_menu
	case 1

		ls_cuenta = trim(sle_solicitante.text)
		if isNumber(ls_cuenta) then ls_filtro = ls_filtro + " and a.cve_profesor = " + ls_cuenta else ls_filtro = ls_filtro + " and 0 = -1"

	case 2

		ls_salon = upper(trim(sle_salon.text))
		ls_filtro = ls_filtro + " and upper(a.cve_salon) = '" + ls_salon + "'"

	case 3

		ls_fecha = "'" + mid(em_fecha_inicio.text,7,4)  + '/' + mid(em_fecha_inicio.text,4,2) + '/' + mid(em_fecha_inicio.text,1,2) + " 00:00:00'"
		ls_fecha = ls_fecha + " and '" + mid(em_fecha_final.text,7,4)  + '/' + mid(em_fecha_final.text,4,2) + '/' + mid(em_fecha_final.text,1,2) + " 23:59:59'"
		ls_filtro = ls_filtro + " and a.fecha_incidencia between " + ls_fecha
	
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
	dw_reporte.SetItem(li_i,'id',dw_solicitud.GetItemNumber(li_i,'id'))	
	dw_reporte.SetItem(li_i,'cve_profesor',dw_solicitud.GetItemNumber(li_i,'cve_profesor'))	
	dw_reporte.SetItem(li_i,'profesor',dw_solicitud.GetItemString(li_i,'profesor'))	
	dw_reporte.SetItem(li_i,'fecha',dw_solicitud.GetItemDateTime(li_i,'fecha_incidencia'))
	dw_reporte.SetItem(li_i,'cve_materia',dw_solicitud.GetItemNumber(li_i,'cve_materia'))	
	dw_reporte.SetItem(li_i,'materia',dw_solicitud.GetItemString(li_i,'materia'))	
	dw_reporte.SetItem(li_i,'incidencia',dw_solicitud.GetItemString(li_i,'incidencia'))	
	dw_reporte.SetItem(li_i,'observaciones',dw_solicitud.GetItemString(li_i,'observaciones'))	
	dw_reporte.SetItem(li_i,'salon',dw_solicitud.GetItemString(li_i,'cve_salon'))	
next

dw_reporte.SetSort("#1A")
dw_reporte.Sort()
dw_reporte.SetRedraw(true)


end event

type fecha from radiobutton within w_gen_reporte_salon_incidencia
integer x = 101
integer y = 412
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

event clicked;sle_solicitante.enabled=false
sle_salon.enabled=false
em_fecha_inicio.enabled=true
em_fecha_final.enabled=true

ii_menu=3

em_fecha_inicio.SetFocus()
end event

type rb_cuenta from radiobutton within w_gen_reporte_salon_incidencia
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
string text = "Cuenta"
end type

event clicked;sle_solicitante.enabled=true
sle_salon.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false

ii_menu=1

sle_solicitante.SetFocus()
end event

type sle_solicitante from singlelineedit within w_gen_reporte_salon_incidencia
integer x = 722
integer y = 208
integer width = 375
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

type st_periodo from statictext within w_gen_reporte_salon_incidencia
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

type gb_1 from groupbox within w_gen_reporte_salon_incidencia
integer x = 37
integer y = 140
integer width = 3977
integer height = 476
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

type cb_exportar from commandbutton within w_gen_reporte_salon_incidencia
integer x = 3584
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

event clicked;f_exportar_reporte(dw_reporte,0,"Reporte de Incidencia de salones")
end event

