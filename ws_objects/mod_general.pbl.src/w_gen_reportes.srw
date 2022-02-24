$PBExportHeader$w_gen_reportes.srw
$PBExportComments$Reporte Solicitud
forward
global type w_gen_reportes from pfc_w_sheet
end type
type rb_con from radiobutton within w_gen_reportes
end type
type rb_com from radiobutton within w_gen_reportes
end type
type rb_cor from radiobutton within w_gen_reportes
end type
type rb_sol from radiobutton within w_gen_reportes
end type
type cb_1 from commandbutton within w_gen_reportes
end type
type cb_imprimir from commandbutton within w_gen_reportes
end type
type cb_generar from commandbutton within w_gen_reportes
end type
type st_1 from statictext within w_gen_reportes
end type
type em_folio from editmask within w_gen_reportes
end type
type cbx_esp from checkbox within w_gen_reportes
end type
type cbx_mat from checkbox within w_gen_reportes
end type
type dw_reporte_mat from u_dw within w_gen_reportes
end type
type gb_1 from groupbox within w_gen_reportes
end type
type gb_tipsol from groupbox within w_gen_reportes
end type
end forward

global type w_gen_reportes from pfc_w_sheet
integer x = 214
integer width = 3803
integer height = 3411
windowstate windowstate = maximized!
long backcolor = 80269524
rb_con rb_con
rb_com rb_com
rb_cor rb_cor
rb_sol rb_sol
cb_1 cb_1
cb_imprimir cb_imprimir
cb_generar cb_generar
st_1 st_1
em_folio em_folio
cbx_esp cbx_esp
cbx_mat cbx_mat
dw_reporte_mat dw_reporte_mat
gb_1 gb_1
gb_tipsol gb_tipsol
end type
global w_gen_reportes w_gen_reportes

on w_gen_reportes.create
int iCurrent
call super::create
this.rb_con=create rb_con
this.rb_com=create rb_com
this.rb_cor=create rb_cor
this.rb_sol=create rb_sol
this.cb_1=create cb_1
this.cb_imprimir=create cb_imprimir
this.cb_generar=create cb_generar
this.st_1=create st_1
this.em_folio=create em_folio
this.cbx_esp=create cbx_esp
this.cbx_mat=create cbx_mat
this.dw_reporte_mat=create dw_reporte_mat
this.gb_1=create gb_1
this.gb_tipsol=create gb_tipsol
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_con
this.Control[iCurrent+2]=this.rb_com
this.Control[iCurrent+3]=this.rb_cor
this.Control[iCurrent+4]=this.rb_sol
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_imprimir
this.Control[iCurrent+7]=this.cb_generar
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.em_folio
this.Control[iCurrent+10]=this.cbx_esp
this.Control[iCurrent+11]=this.cbx_mat
this.Control[iCurrent+12]=this.dw_reporte_mat
this.Control[iCurrent+13]=this.gb_1
this.Control[iCurrent+14]=this.gb_tipsol
end on

on w_gen_reportes.destroy
call super::destroy
destroy(this.rb_con)
destroy(this.rb_com)
destroy(this.rb_cor)
destroy(this.rb_sol)
destroy(this.cb_1)
destroy(this.cb_imprimir)
destroy(this.cb_generar)
destroy(this.st_1)
destroy(this.em_folio)
destroy(this.cbx_esp)
destroy(this.cbx_mat)
destroy(this.dw_reporte_mat)
destroy(this.gb_1)
destroy(this.gb_tipsol)
end on

event open;call super::open;//SELECT descripcion
//into :gs_depto
//FROM		spre_departamentos
//WHERE	spre_departamentos.cvedepto =:gi_depto
//USING	gtr_sumuia;

choose case gi_depto
	case 1
		gs_depto='Reserva de espacios'
	case 2
		gs_depto='Departamento de Psicología'
	case 3
		gs_depto='Laboratorios de cómputo'
	case 4
		gs_depto='Departamento de Comunicación'
	case 5
		gs_depto='Departamento de Control de salones'
	case 6
		gs_depto='Departamento de Admisión'
	case 7
		gs_depto='Departamento de Posgrado'
	case 8
		gs_depto='Departamento de Diseño'
	case 9
		gs_depto='Departamento de Ingeniería'
	case 10
		gs_depto='Departamento de Diseño'
end choose


dw_reporte_mat.Modify("t_39.text='"+gs_depto+"'")
cbx_mat.Event clicked()

if gi_depto <> 4 then
	cbx_esp.visible = false
end if


end event

type rb_con from radiobutton within w_gen_reportes
boolean visible = false
integer x = 1638
integer y = 381
integer width = 549
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Formato Contraloría"
end type

type rb_com from radiobutton within w_gen_reportes
boolean visible = false
integer x = 1638
integer y = 307
integer width = 505
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Carta Compromiso"
end type

type rb_cor from radiobutton within w_gen_reportes
boolean visible = false
integer x = 1638
integer y = 237
integer width = 505
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Corresponsables"
end type

type rb_sol from radiobutton within w_gen_reportes
boolean visible = false
integer x = 1638
integer y = 163
integer width = 505
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solicitud de Material"
boolean checked = true
end type

type cb_1 from commandbutton within w_gen_reportes
integer x = 3127
integer y = 352
integer width = 351
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cerrar"
end type

event clicked;close(parent)
end event

type cb_imprimir from commandbutton within w_gen_reportes
integer x = 2728
integer y = 352
integer width = 351
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Imprimir"
end type

event clicked;integer Res


Res = MessageBox("Mensaje del Sistema", "¿Desea Imprimir la solicitud del material", &
Question!, yesno!, 2)
if Res = 1 then
	dw_reporte_mat.Modify("t_39.text='"+gs_depto+"'")
	dw_reporte_mat.print()
end if
dw_reporte_mat.reset()
em_folio.text = ' '
cbx_mat.checked = false
cbx_esp.checked = false
end event

type cb_generar from commandbutton within w_gen_reportes
integer x = 2330
integer y = 352
integer width = 351
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Generar"
boolean default = true
end type

event clicked;long 		llfolio
integer	li_resul1, res, liEstatus, li_cvearea
datetime ldt_fechaini, ldt_fechafin, ldt_fechahoy
string		ls_do
llfolio = long(em_folio.text)

if gi_depto=10 then li_cvearea=-1 else li_cvearea=gi_area

//		Impresión Solicitud
if cbx_mat.checked then
	if rb_sol.checked then	ls_do	=	"d_gen_rep_solicitud_mat"
	if rb_cor.checked then	ls_do	=	"d_gen_rep_solicitud_corresp"
	if rb_com.checked then 	ls_do	=	"d_gen_rep_solicitud_carta_comp"
	if rb_con.checked then 	ls_do	=	"d_gen_rep_solicitud_formato_contraloria"
	dw_reporte_mat.dataobject = ls_do
	dw_reporte_mat.SetTransObject(gtr_sumuia)
	li_resul1	=	dw_reporte_mat.retrieve(gi_depto,llfolio,li_cvearea)
	
	if gi_depto <> 4 then dw_reporte_mat.Modify("t_39.text='"+gs_depto+"'")
	//t_1
	if rb_sol.checked then	 	
		if gi_depto=9 and li_cvearea=2 then
			dw_reporte_mat.object.cantidad_t.visible=true
			dw_reporte_mat.object.compute_cantidad.visible=true
		else
			if gi_depto=2 then
				dw_reporte_mat.object.cantidad_t.visible=true
				dw_reporte_mat.object.compute_cantidad.visible=true
			else
				dw_reporte_mat.object.cantidad_t.visible=false
				dw_reporte_mat.object.compute_cantidad.visible=false
			end if
		end if
	end if

	if li_resul1<= 0 then
		Messagebox("Aviso","No existen datos para la Solicitud con el número de folio: " + string(llfolio)) 
		em_folio.text = ' '
		//cbx_mat.checked = false
		cbx_esp.checked = false
	end if

elseif cbx_esp.checked then
	integer li_row
	dw_reporte_mat.dataobject = "d_com_rep_solicitud_esp" 
	dw_reporte_mat.SetTransObject(gtr_sumuia)
	li_row = dw_reporte_mat.retrieve(llfolio)
	
	if li_row >= 1 then
		liEstatus    = dw_reporte_mat.getitemnumber(1,'status')
		
		if liEstatus = 0 then						
			dw_reporte_mat.object.t_tipo_solicitud.text = "Prestamo Activo"
		elseif liEstatus = 1 then
			dw_reporte_mat.object.t_tipo_solicitud.text = "Entregado"
		elseif liEstatus = 2 then
			dw_reporte_mat.object.t_tipo_solicitud.text = "Cancelación"	
		elseif liEstatus = 5 then
			dw_reporte_mat.object.t_tipo_solicitud.text = "Reservación"
		end if
	end if
end if
end event

type st_1 from statictext within w_gen_reportes
integer x = 914
integer y = 90
integer width = 432
integer height = 58
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "No.Folio Solicitud"
boolean focusrectangle = false
end type

type em_folio from editmask within w_gen_reportes
integer x = 955
integer y = 173
integer width = 344
integer height = 99
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "######"
end type

type cbx_esp from checkbox within w_gen_reportes
integer x = 238
integer y = 282
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Espacios"
boolean lefttext = true
end type

event clicked;if this.checked then
	cbx_mat.checked = false
	dw_reporte_mat.dataobject = "d_com_rep_solicitud_esp"
	dw_reporte_mat.SetTransObject(gtr_sumuia)
	em_folio.text = ' '
end if

if gi_depto = 4 then
	gb_tipsol.visible	=	not this.checked
	rb_sol.visible		=	not this.checked
	rb_cor.visible		=	not this.checked
	rb_com.visible		=	not this.checked
	rb_con.visible		=	not this.checked
end if
end event

type cbx_mat from checkbox within w_gen_reportes
integer x = 238
integer y = 192
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Material"
boolean checked = true
boolean lefttext = true
end type

event clicked;if this.checked then
	cbx_esp.checked = false
	dw_reporte_mat.dataobject = "d_gen_rep_solicitud_mat"
	dw_reporte_mat.SetTransObject(gtr_sumuia)
	em_folio.text = ' '
end if

if gi_depto = 4 then
	gb_tipsol.visible	=	this.checked
	rb_sol.visible		=	this.checked
	rb_cor.visible		=	this.checked
	rb_com.visible		=	this.checked
	rb_con.visible		=	this.checked
end if
end event

type dw_reporte_mat from u_dw within w_gen_reportes
integer x = 113
integer y = 515
integer width = 3493
integer height = 2698
integer taborder = 20
string dataobject = "d_gen_rep_solicitud_mat"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;Settransobject(gtr_sumuia)
end event

type gb_1 from groupbox within w_gen_reportes
integer x = 124
integer y = 90
integer width = 625
integer height = 368
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo solicitud"
end type

type gb_tipsol from groupbox within w_gen_reportes
boolean visible = false
integer x = 1576
integer y = 90
integer width = 625
integer height = 368
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo de Reporte"
end type

