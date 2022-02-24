$PBExportHeader$w_com_rep_consulta.srw
$PBExportComments$Reportes reserva espacios comunicación
forward
global type w_com_rep_consulta from pfc_w_sheet
end type
type rb_estatus from radiobutton within w_com_rep_consulta
end type
type rb_vencido from radiobutton within w_com_rep_consulta
end type
type rb_multa from radiobutton within w_com_rep_consulta
end type
type cbx_esp from checkbox within w_com_rep_consulta
end type
type cbx_mat from checkbox within w_com_rep_consulta
end type
type cb_1 from commandbutton within w_com_rep_consulta
end type
type cb_imprimir from commandbutton within w_com_rep_consulta
end type
type cb_generar from commandbutton within w_com_rep_consulta
end type
type dw_reporte_mat from u_dw within w_com_rep_consulta
end type
type gb_1 from groupbox within w_com_rep_consulta
end type
type gb_2 from groupbox within w_com_rep_consulta
end type
end forward

global type w_com_rep_consulta from pfc_w_sheet
integer width = 3803
integer height = 2760
windowstate windowstate = maximized!
long backcolor = 80269524
rb_estatus rb_estatus
rb_vencido rb_vencido
rb_multa rb_multa
cbx_esp cbx_esp
cbx_mat cbx_mat
cb_1 cb_1
cb_imprimir cb_imprimir
cb_generar cb_generar
dw_reporte_mat dw_reporte_mat
gb_1 gb_1
gb_2 gb_2
end type
global w_com_rep_consulta w_com_rep_consulta

on w_com_rep_consulta.create
int iCurrent
call super::create
this.rb_estatus=create rb_estatus
this.rb_vencido=create rb_vencido
this.rb_multa=create rb_multa
this.cbx_esp=create cbx_esp
this.cbx_mat=create cbx_mat
this.cb_1=create cb_1
this.cb_imprimir=create cb_imprimir
this.cb_generar=create cb_generar
this.dw_reporte_mat=create dw_reporte_mat
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_estatus
this.Control[iCurrent+2]=this.rb_vencido
this.Control[iCurrent+3]=this.rb_multa
this.Control[iCurrent+4]=this.cbx_esp
this.Control[iCurrent+5]=this.cbx_mat
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_imprimir
this.Control[iCurrent+8]=this.cb_generar
this.Control[iCurrent+9]=this.dw_reporte_mat
this.Control[iCurrent+10]=this.gb_1
this.Control[iCurrent+11]=this.gb_2
end on

on w_com_rep_consulta.destroy
call super::destroy
destroy(this.rb_estatus)
destroy(this.rb_vencido)
destroy(this.rb_multa)
destroy(this.cbx_esp)
destroy(this.cbx_mat)
destroy(this.cb_1)
destroy(this.cb_imprimir)
destroy(this.cb_generar)
destroy(this.dw_reporte_mat)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;rb_multa.visible = true
end event

type rb_estatus from radiobutton within w_com_rep_consulta
integer x = 1129
integer y = 164
integer width = 535
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estatus Solicitud  "
boolean lefttext = true
end type

event clicked;if this.checked then
	rb_vencido.checked = false
	rb_multa.checked = false	
end if
end event

type rb_vencido from radiobutton within w_com_rep_consulta
integer x = 1262
integer y = 244
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vencidos"
boolean lefttext = true
end type

event clicked;if this.checked then
	rb_estatus.checked = false
	rb_multa.checked = false	
end if
end event

type rb_multa from radiobutton within w_com_rep_consulta
integer x = 1262
integer y = 324
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Multas"
boolean lefttext = true
end type

event clicked;if this.checked then
	rb_estatus.checked = false
	rb_vencido.checked = false
end if
end event

type cbx_esp from checkbox within w_com_rep_consulta
integer x = 279
integer y = 308
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 700
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
	rb_multa.visible = false
	rb_estatus.checked = false
	rb_vencido.checked = false
	rb_multa.checked = false	
	dw_reporte_mat.reset()
end if
end event

type cbx_mat from checkbox within w_com_rep_consulta
integer x = 279
integer y = 212
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Material"
boolean lefttext = true
end type

event clicked;if this.checked then
	cbx_esp.checked = false
	rb_multa.visible = true
	rb_estatus.checked = false
	rb_vencido.checked = false
	rb_multa.checked = false
	dw_reporte_mat.reset()
end if
end event

type cb_1 from commandbutton within w_com_rep_consulta
integer x = 3163
integer y = 336
integer width = 352
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Salir"
end type

event clicked;close(parent)
end event

type cb_imprimir from commandbutton within w_com_rep_consulta
integer x = 2761
integer y = 336
integer width = 352
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Imprimir"
end type

event clicked;integer Res


Res = MessageBox("Mensaje del Sistema", "¿Desea Imprimir Reporte?", &
Question!, yesno!, 2)
if Res = 1 then
	dw_reporte_mat.print()
end if
dw_reporte_mat.reset()
rb_vencido.checked = false
rb_multa.checked = false
rb_estatus.checked = false
cbx_mat.checked = false
cbx_esp.checked = false
end event

type cb_generar from commandbutton within w_com_rep_consulta
integer x = 2359
integer y = 336
integer width = 352
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Generar"
end type

event clicked;
integer	li_row

IF cbx_mat.checked = false and cbx_esp.checked = false then
	
	Messagebox("Aaviso","Debe de indicar un tipo de Solicitud.")
ELSE
	
	IF cbx_mat.checked then
		IF rb_vencido.checked = false and rb_multa.checked = false and rb_estatus.checked = false then
			Messagebox("Aaviso","Debe de indicar un tipo de Reporte de Material.")
		else
			if rb_vencido.checked then
				dw_reporte_mat.dataobject = "d_com_rep_mat_vencido"
				dw_reporte_mat.SetTransObject(gtr_sumuia)
				li_row = dw_reporte_mat.retrieve()
			elseif rb_multa.checked then
				dw_reporte_mat.dataobject = "d_com_rep_multas"
				dw_reporte_mat.SetTransObject(gtr_sumuia)
				li_row = dw_reporte_mat.retrieve()
			elseif rb_estatus.checked then
				dw_reporte_mat.dataobject = "d_com_rep_consultasol"
				dw_reporte_mat.SetTransObject(gtr_sumuia)
				li_row = dw_reporte_mat.retrieve()
			end if
		end if
	elseif cbx_esp.checked then
		IF rb_vencido.checked = false and rb_estatus.checked = false then
			Messagebox("Aaviso","Debe de indicar un tipo de Reporte de Espacios.")
		else
			IF rb_estatus.checked then
				dw_reporte_mat.dataobject = "d_com_rep_consultasol_isla"
				dw_reporte_mat.SetTransObject(gtr_sumuia)
				li_row = dw_reporte_mat.retrieve()
			elseif rb_vencido.checked then
				dw_reporte_mat.dataobject = "d_com_rep_isla_vencida"
				dw_reporte_mat.SetTransObject(gtr_sumuia)
				li_row = dw_reporte_mat.retrieve()
			END IF
		end if
	END IF 
	
END IF
end event

type dw_reporte_mat from u_dw within w_com_rep_consulta
integer x = 114
integer y = 484
integer width = 3493
integer height = 2052
integer taborder = 10
string dataobject = "d_com_rep_consultasol"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;Settransobject(gtr_sumuia)
end event

type gb_1 from groupbox within w_com_rep_consulta
integer x = 133
integer y = 64
integer width = 777
integer height = 368
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Consultar Tipo Solicitud:"
end type

type gb_2 from groupbox within w_com_rep_consulta
integer x = 978
integer y = 64
integer width = 800
integer height = 368
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Reporte:"
end type

