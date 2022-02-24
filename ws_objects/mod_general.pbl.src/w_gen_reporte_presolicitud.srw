$PBExportHeader$w_gen_reporte_presolicitud.srw
forward
global type w_gen_reporte_presolicitud from window
end type
type gb_2 from groupbox within w_gen_reporte_presolicitud
end type
type rb_text from radiobutton within w_gen_reporte_presolicitud
end type
type rb_excel from radiobutton within w_gen_reporte_presolicitud
end type
type cb_exportar from commandbutton within w_gen_reporte_presolicitud
end type
type cb_imprimir from commandbutton within w_gen_reporte_presolicitud
end type
type cb_buscar from commandbutton within w_gen_reporte_presolicitud
end type
type sle_folio_pres from singlelineedit within w_gen_reporte_presolicitud
end type
type sle_folio from singlelineedit within w_gen_reporte_presolicitud
end type
type rb_folio_pres from radiobutton within w_gen_reporte_presolicitud
end type
type rb_folio from radiobutton within w_gen_reporte_presolicitud
end type
type dw_reporte from datawindow within w_gen_reporte_presolicitud
end type
type st_2 from statictext within w_gen_reporte_presolicitud
end type
type dw_area from u_basedw within w_gen_reporte_presolicitud
end type
type st_area from statictext within w_gen_reporte_presolicitud
end type
type st_anio from statictext within w_gen_reporte_presolicitud
end type
type sle_anio from singlelineedit within w_gen_reporte_presolicitud
end type
type ddlb_periodo from dropdownlistbox within w_gen_reporte_presolicitud
end type
type st_periodo from statictext within w_gen_reporte_presolicitud
end type
type em_fecha_final from editmask within w_gen_reporte_presolicitud
end type
type st_1 from statictext within w_gen_reporte_presolicitud
end type
type em_fecha_inicio from editmask within w_gen_reporte_presolicitud
end type
type fecha from radiobutton within w_gen_reporte_presolicitud
end type
type st_cuenta from statictext within w_gen_reporte_presolicitud
end type
type dw_tipo_usuario from u_basedw within w_gen_reporte_presolicitud
end type
type rb_tipo_usuario from radiobutton within w_gen_reporte_presolicitud
end type
type gb_1 from groupbox within w_gen_reporte_presolicitud
end type
type sle_solicitante from singlelineedit within w_gen_reporte_presolicitud
end type
end forward

global type w_gen_reporte_presolicitud from window
integer width = 4030
integer height = 2646
boolean titlebar = true
string title = "Reporte de Presolicitudes"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
gb_2 gb_2
rb_text rb_text
rb_excel rb_excel
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_buscar cb_buscar
sle_folio_pres sle_folio_pres
sle_folio sle_folio
rb_folio_pres rb_folio_pres
rb_folio rb_folio
dw_reporte dw_reporte
st_2 st_2
dw_area dw_area
st_area st_area
st_anio st_anio
sle_anio sle_anio
ddlb_periodo ddlb_periodo
st_periodo st_periodo
em_fecha_final em_fecha_final
st_1 st_1
em_fecha_inicio em_fecha_inicio
fecha fecha
st_cuenta st_cuenta
dw_tipo_usuario dw_tipo_usuario
rb_tipo_usuario rb_tipo_usuario
gb_1 gb_1
sle_solicitante sle_solicitante
end type
global w_gen_reporte_presolicitud w_gen_reporte_presolicitud

type variables
integer ii_tipo_usuario=0, ii_cvearea=0, ii_periodo, ii_anio, ii_menu=1, ii_exportar=1

date idt_fecha_inicio, idt_fecha_final


DatawindowChild idwc_area, idwc_tipo_usuario

end variables

on w_gen_reporte_presolicitud.create
this.gb_2=create gb_2
this.rb_text=create rb_text
this.rb_excel=create rb_excel
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_buscar=create cb_buscar
this.sle_folio_pres=create sle_folio_pres
this.sle_folio=create sle_folio
this.rb_folio_pres=create rb_folio_pres
this.rb_folio=create rb_folio
this.dw_reporte=create dw_reporte
this.st_2=create st_2
this.dw_area=create dw_area
this.st_area=create st_area
this.st_anio=create st_anio
this.sle_anio=create sle_anio
this.ddlb_periodo=create ddlb_periodo
this.st_periodo=create st_periodo
this.em_fecha_final=create em_fecha_final
this.st_1=create st_1
this.em_fecha_inicio=create em_fecha_inicio
this.fecha=create fecha
this.st_cuenta=create st_cuenta
this.dw_tipo_usuario=create dw_tipo_usuario
this.rb_tipo_usuario=create rb_tipo_usuario
this.gb_1=create gb_1
this.sle_solicitante=create sle_solicitante
this.Control[]={this.gb_2,&
this.rb_text,&
this.rb_excel,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_buscar,&
this.sle_folio_pres,&
this.sle_folio,&
this.rb_folio_pres,&
this.rb_folio,&
this.dw_reporte,&
this.st_2,&
this.dw_area,&
this.st_area,&
this.st_anio,&
this.sle_anio,&
this.ddlb_periodo,&
this.st_periodo,&
this.em_fecha_final,&
this.st_1,&
this.em_fecha_inicio,&
this.fecha,&
this.st_cuenta,&
this.dw_tipo_usuario,&
this.rb_tipo_usuario,&
this.gb_1,&
this.sle_solicitante}
end on

on w_gen_reporte_presolicitud.destroy
destroy(this.gb_2)
destroy(this.rb_text)
destroy(this.rb_excel)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_buscar)
destroy(this.sle_folio_pres)
destroy(this.sle_folio)
destroy(this.rb_folio_pres)
destroy(this.rb_folio)
destroy(this.dw_reporte)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.st_area)
destroy(this.st_anio)
destroy(this.sle_anio)
destroy(this.ddlb_periodo)
destroy(this.st_periodo)
destroy(this.em_fecha_final)
destroy(this.st_1)
destroy(this.em_fecha_inicio)
destroy(this.fecha)
destroy(this.st_cuenta)
destroy(this.dw_tipo_usuario)
destroy(this.rb_tipo_usuario)
destroy(this.gb_1)
destroy(this.sle_solicitante)
end on

event open;integer li_periodo, li_anio

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



end event

type gb_2 from groupbox within w_gen_reporte_presolicitud
boolean visible = false
integer x = 3471
integer y = 298
integer width = 289
integer height = 192
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
end type

type rb_text from radiobutton within w_gen_reporte_presolicitud
integer x = 3496
integer y = 403
integer width = 241
integer height = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Text"
end type

event clicked;ii_exportar=2
end event

type rb_excel from radiobutton within w_gen_reporte_presolicitud
integer x = 3496
integer y = 326
integer width = 241
integer height = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Excel"
boolean checked = true
end type

event clicked;ii_exportar=1
end event

type cb_exportar from commandbutton within w_gen_reporte_presolicitud
integer x = 3467
integer y = 224
integer width = 300
integer height = 90
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Exportar"
end type

event clicked;f_exportar_reporte(dw_reporte,ii_exportar,"Reporte de Presolicitudes")
end event

type cb_imprimir from commandbutton within w_gen_reporte_presolicitud
integer x = 3098
integer y = 342
integer width = 300
integer height = 90
integer taborder = 90
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

type cb_buscar from commandbutton within w_gen_reporte_presolicitud
integer x = 3098
integer y = 227
integer width = 300
integer height = 90
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Buscar"
end type

event clicked;integer li_row, li_pos, li_i, li_anio=-1, li_periodo=-1, li_tipo, li_in=0, li_existe=0
string ls_cuenta, ls_texto, ls_digito, ls_find=''
long ll_cuenta, ll_folio_presol=0, ll_folio=0

datastore lds_solicitud, lds_sol
lds_solicitud =  create datastore

lds_sol =  create datastore

ls_texto=trim(sle_solicitante.text)
ls_cuenta=ls_texto

dw_reporte.SetRedraw(false)
dw_reporte.Reset()

li_anio=ii_anio
li_periodo=ii_periodo


dw_reporte.SetRedraw(false)
dw_reporte.Reset()
dw_reporte.SetSort("")
dw_reporte.Sort()


choose case ii_menu

	case 1

		//Tipo de Usuario
		if ii_tipo_usuario=1 then

			li_pos=pos(ls_texto,'-')
			
			if li_pos>0 then
				ls_cuenta=left(ls_texto,len(ls_texto) - 2)
				ls_digito=right(ls_texto,1)
			else
				ls_cuenta=left(ls_texto,len(ls_texto) - 1)
				ls_digito=right(ls_texto,1)
			end if			
			
		end if
		
		if isNumber(ls_cuenta) then ll_cuenta=Long(ls_cuenta)
		
		lds_solicitud.dataobject ='d_gen_rep_presol_usuario'
		lds_sol.dataobject ='d_gen_rep_presol_usuario'
		lds_solicitud.settransobject(gtr_sumuia)	
		lds_sol.settransobject(gtr_sumuia)	
		
		if ll_cuenta=0 then ll_cuenta=-1
		li_tipo=ii_tipo_usuario
		if ii_tipo_usuario=0 then li_tipo=-1
		lds_solicitud.Retrieve(gi_depto,ii_cvearea,ll_cuenta,li_tipo,li_anio,li_periodo)
		lds_sol.Retrieve(gi_depto,ii_cvearea,ll_cuenta,li_tipo,li_anio,li_periodo)

	case 2

		//Fecha
		lds_solicitud.dataobject ='d_gen_rep_presol_fecha'
		lds_sol.dataobject ='d_gen_rep_presol_fecha'
		lds_solicitud.settransobject(gtr_sumuia)	
		lds_sol.settransobject(gtr_sumuia)	
		
		lds_solicitud.Retrieve(gi_depto,ii_cvearea,DateTime(idt_fecha_inicio,Time('00:00:00')),DateTime(idt_fecha_final,Time('23:59:59')),li_anio,li_periodo)	
		lds_sol.Retrieve(gi_depto,ii_cvearea,DateTime(idt_fecha_inicio,Time('00:00:00')),DateTime(idt_fecha_final,Time('23:59:59')),li_anio,li_periodo)	

	case 3

		//Folio Solicitud
		lds_solicitud.dataobject ='d_gen_rep_presol_folio'
		lds_sol.dataobject ='d_gen_rep_presol_folio'
		lds_solicitud.settransobject(gtr_sumuia)	
		lds_sol.settransobject(gtr_sumuia)			
		
		if isNumber(trim(sle_folio.text)) then ll_folio = long(trim(sle_folio.text))
		ll_folio_presol=f_select_folio_presol(gi_depto,ii_cvearea,ll_folio)

		lds_solicitud.Retrieve(gi_depto,ii_cvearea,ll_folio_presol)
		lds_sol.Retrieve(gi_depto,ii_cvearea,ll_folio_presol)

	case 4
		
		//Folio Presolicitud
		lds_solicitud.dataobject ='d_gen_rep_presol_folio'
		lds_sol.dataobject ='d_gen_rep_presol_folio'
		lds_solicitud.settransobject(gtr_sumuia)	
		lds_sol.settransobject(gtr_sumuia)	
		
		if isNumber(trim(sle_folio_pres.text)) then ll_folio_presol = long(trim(sle_folio_pres.text))

		lds_solicitud.Retrieve(gi_depto,ii_cvearea,ll_folio_presol)
		lds_sol.Retrieve(gi_depto,ii_cvearea,ll_folio_presol)
		
end choose


li_row = lds_solicitud.RowCount()
lds_solicitud.SetSort("#1A")
lds_solicitud.Sort()

if li_row>0 then
	lds_sol.SetFilter("folio_origen = 0")
	lds_sol.Filter()
	lds_sol.SetSort("#1A")
	lds_sol.Sort()
	li_row = lds_sol.RowCount()
end if


for li_i=1 to li_row
	
	//PreSolicitud
	li_in=li_in+1
	dw_reporte.insertrow(0)
	dw_reporte.SetItem(li_in,'folio',lds_sol.GetItemNumber(li_i,'folio'))
	dw_reporte.SetItem(li_in,'solicitud','S')	
	dw_reporte.SetItem(li_in,'solicitanteid',lds_sol.GetItemNumber(li_i,'solicitanteid'))	
	dw_reporte.SetItem(li_in,'fecha_inicio',lds_sol.GetItemDateTime(li_i,'fecha_inicio'))	
	dw_reporte.SetItem(li_in,'fecha_fin',lds_sol.GetItemDateTime(li_i,'fecha_fin'))	
	dw_reporte.SetItem(li_in,'solicitantenombre',lds_sol.GetItemString(li_i,'solicitantenombre'))	
	dw_reporte.SetItem(li_in,'folio_prestamo',lds_sol.GetItemNumber(li_i,'folio_prestamo'))	
	ls_find="folio_origen="+string(lds_sol.GetItemNumber(li_i,'folio_prestamo'))
	li_existe=lds_solicitud.Find(ls_find,1,lds_solicitud.RowCount())

	//Renovación 1
	if li_existe>0 then
		li_in=li_in+1
		dw_reporte.insertrow(0)
		dw_reporte.SetItem(li_in,'folio',lds_solicitud.GetItemNumber(li_existe,'folio'))
		dw_reporte.SetItem(li_in,'solicitud','    R1')	
		dw_reporte.SetItem(li_in,'solicitanteid',lds_solicitud.GetItemNumber(li_existe,'solicitanteid'))	
		dw_reporte.SetItem(li_in,'fecha_inicio',lds_solicitud.GetItemDateTime(li_existe,'fecha_inicio'))	
		dw_reporte.SetItem(li_in,'fecha_fin',lds_solicitud.GetItemDateTime(li_existe,'fecha_fin'))	
		dw_reporte.SetItem(li_in,'solicitantenombre',lds_solicitud.GetItemString(li_existe,'solicitantenombre'))	
		dw_reporte.SetItem(li_in,'folio_prestamo',lds_solicitud.GetItemNumber(li_existe,'folio_prestamo'))	
		ls_find="folio_origen="+string(lds_solicitud.GetItemNumber(li_existe,'folio_prestamo'))
		li_existe=lds_solicitud.Find(ls_find,1,lds_solicitud.RowCount())		

		//Renovación 2
		if li_existe>0 then
			li_in=li_in+1
			dw_reporte.insertrow(0)
			dw_reporte.SetItem(li_in,'folio',lds_solicitud.GetItemNumber(li_existe,'folio'))
			dw_reporte.SetItem(li_in,'solicitud','    R2')	
			dw_reporte.SetItem(li_in,'solicitanteid',lds_solicitud.GetItemNumber(li_existe,'solicitanteid'))	
			dw_reporte.SetItem(li_in,'fecha_inicio',lds_solicitud.GetItemDateTime(li_existe,'fecha_inicio'))	
			dw_reporte.SetItem(li_in,'fecha_fin',lds_solicitud.GetItemDateTime(li_existe,'fecha_fin'))	
			dw_reporte.SetItem(li_in,'solicitantenombre',lds_solicitud.GetItemString(li_existe,'solicitantenombre'))	
			dw_reporte.SetItem(li_in,'folio_prestamo',lds_solicitud.GetItemNumber(li_existe,'folio_prestamo'))	
			ls_find="folio_origen="+string(lds_solicitud.GetItemNumber(li_existe,'folio_prestamo'))
			li_existe=lds_solicitud.Find(ls_find,1,lds_solicitud.RowCount())		
		end if		
		
	end if
	
next

dw_reporte.SetRedraw(true)
end event

type sle_folio_pres from singlelineedit within w_gen_reporte_presolicitud
integer x = 2706
integer y = 349
integer width = 322
integer height = 70
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
borderstyle borderstyle = stylelowered!
end type

type sle_folio from singlelineedit within w_gen_reporte_presolicitud
integer x = 2706
integer y = 240
integer width = 322
integer height = 70
integer taborder = 60
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

type rb_folio_pres from radiobutton within w_gen_reporte_presolicitud
integer x = 2183
integer y = 349
integer width = 512
integer height = 77
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Folio PreSolicitud"
end type

event clicked;dw_tipo_usuario.enabled=false
sle_solicitante.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
sle_folio.enabled=false
sle_folio_pres.enabled=true

ii_menu=4
sle_solicitante.text=''
sle_folio.text=''
sle_folio_pres.text=''

dw_reporte.Reset()
sle_folio_pres.SetFocus()
end event

type rb_folio from radiobutton within w_gen_reporte_presolicitud
integer x = 2183
integer y = 240
integer width = 505
integer height = 77
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Folio Solicitud"
end type

event clicked;dw_tipo_usuario.enabled=false
sle_solicitante.enabled=false
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
sle_folio.enabled=true
sle_folio_pres.enabled=false

ii_menu=3
sle_solicitante.text=''
sle_folio.text=''
sle_folio_pres.text=''

dw_reporte.Reset()
sle_folio.SetFocus()
end event

type dw_reporte from datawindow within w_gen_reporte_presolicitud
integer x = 40
integer y = 534
integer width = 3924
integer height = 1997
integer taborder = 80
string title = "none"
string dataobject = "d_gen_rep_presol_reporte"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_gen_reporte_presolicitud
integer x = 1865
integer y = 262
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

type dw_area from u_basedw within w_gen_reporte_presolicitud
integer x = 1635
integer y = 38
integer width = 980
integer height = 77
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_gen_cat_area_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("area", "area", "area")
end event

event itemchanged;call super::itemchanged;ii_cvearea=long(this.gettext())

idwc_tipo_usuario.Reset()
dw_tipo_usuario.Reset()

idwc_tipo_usuario.Retrieve(gi_depto,ii_cvearea)
if idwc_tipo_usuario.RowCount()>0 then dw_tipo_usuario.insertrow(0)

dw_reporte.Reset()
ii_tipo_usuario=0
end event

type st_area from statictext within w_gen_reporte_presolicitud
integer x = 1467
integer y = 48
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

type st_anio from statictext within w_gen_reporte_presolicitud
integer x = 706
integer y = 48
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

type sle_anio from singlelineedit within w_gen_reporte_presolicitud
integer x = 848
integer y = 38
integer width = 212
integer height = 70
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

type ddlb_periodo from dropdownlistbox within w_gen_reporte_presolicitud
integer x = 267
integer y = 38
integer width = 406
integer height = 381
integer taborder = 10
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
sle_anio.SetFocus()
end event

type st_periodo from statictext within w_gen_reporte_presolicitud
integer x = 40
integer y = 48
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

type em_fecha_final from editmask within w_gen_reporte_presolicitud
integer x = 1221
integer y = 358
integer width = 490
integer height = 74
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
string text = "00/00/0000"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

event modified;idt_fecha_final=Date(this.text)

dw_reporte.Reset()

end event

type st_1 from statictext within w_gen_reporte_presolicitud
integer x = 1126
integer y = 362
integer width = 77
integer height = 58
boolean bringtotop = true
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

type em_fecha_inicio from editmask within w_gen_reporte_presolicitud
integer x = 607
integer y = 358
integer width = 490
integer height = 74
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
string text = "00/00/0000"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

event modified;idt_fecha_inicio=Date(this.text)

dw_reporte.Reset()

end event

type fecha from radiobutton within w_gen_reporte_presolicitud
integer x = 77
integer y = 352
integer width = 413
integer height = 77
boolean bringtotop = true
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
em_fecha_inicio.enabled=true
em_fecha_final.enabled=true
sle_folio.enabled=false
sle_folio_pres.enabled=false

ii_menu=2
sle_solicitante.text=''
sle_folio.text=''
sle_folio_pres.text=''

dw_reporte.Reset()

end event

type st_cuenta from statictext within w_gen_reporte_presolicitud
integer x = 1287
integer y = 253
integer width = 245
integer height = 61
boolean bringtotop = true
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

type dw_tipo_usuario from u_basedw within w_gen_reporte_presolicitud
integer x = 607
integer y = 246
integer width = 633
integer height = 77
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_gen_cat_tipo_usuario_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("area", "area", "area")
end event

event itemchanged;call super::itemchanged;ii_tipo_usuario=long(this.gettext())
sle_solicitante.SetFocus()

dw_reporte.Reset()

end event

type rb_tipo_usuario from radiobutton within w_gen_reporte_presolicitud
integer x = 77
integer y = 240
integer width = 512
integer height = 77
boolean bringtotop = true
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
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
sle_folio.enabled=false
sle_folio_pres.enabled=false

ii_menu=1
sle_solicitante.text=''
sle_folio.text=''
sle_folio_pres.text=''

dw_reporte.Reset()

end event

type gb_1 from groupbox within w_gen_reporte_presolicitud
integer x = 40
integer y = 157
integer width = 3913
integer height = 346
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
end type

type sle_solicitante from singlelineedit within w_gen_reporte_presolicitud
integer x = 1518
integer y = 246
integer width = 322
integer height = 70
integer taborder = 50
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

end event

