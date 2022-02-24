$PBExportHeader$w_psi_reporte_renovaciones.srw
forward
global type w_psi_reporte_renovaciones from w_gen_rep_consulta
end type
type em_fecha from editmask within w_psi_reporte_renovaciones
end type
type st_1 from statictext within w_psi_reporte_renovaciones
end type
type dw_renov_detalle from datawindow within w_psi_reporte_renovaciones
end type
type gb_3 from groupbox within w_psi_reporte_renovaciones
end type
end forward

global type w_psi_reporte_renovaciones from w_gen_rep_consulta
integer width = 4946
integer height = 3016
string title = "Reporte de Renovaciones"
em_fecha em_fecha
st_1 st_1
dw_renov_detalle dw_renov_detalle
gb_3 gb_3
end type
global w_psi_reporte_renovaciones w_psi_reporte_renovaciones

type variables
Datetime idt_fecha 
end variables

on w_psi_reporte_renovaciones.create
int iCurrent
call super::create
this.em_fecha=create em_fecha
this.st_1=create st_1
this.dw_renov_detalle=create dw_renov_detalle
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_fecha
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_renov_detalle
this.Control[iCurrent+4]=this.gb_3
end on

on w_psi_reporte_renovaciones.destroy
call super::destroy
destroy(this.em_fecha)
destroy(this.st_1)
destroy(this.dw_renov_detalle)
destroy(this.gb_3)
end on

event open;Date ld_fechahoy 

ld_fechahoy  = Date(f_fecha_hora_servidor())
dw_reporte_mat.dataobject = "d_psi_rep_renovaciones"
dw_reporte_mat.SetTransObject(gtr_sumuia)

dw_renov_detalle.Modify("DataWindow.Print.Preview.Outline = 'No'") 
dw_renov_detalle.SetTransObject(gtr_sumuia)
em_fecha.text = string(datetime(ld_fechahoy),"dd/mm/yyyy")
end event

type rb_estatus from w_gen_rep_consulta`rb_estatus within w_psi_reporte_renovaciones
boolean visible = false
integer x = 4078
integer y = 64
integer width = 87
end type

type rb_vencido from w_gen_rep_consulta`rb_vencido within w_psi_reporte_renovaciones
boolean visible = false
integer x = 4183
integer y = 56
integer width = 78
end type

type rb_multa from w_gen_rep_consulta`rb_multa within w_psi_reporte_renovaciones
boolean visible = false
integer x = 4320
integer y = 56
integer width = 78
end type

type cbx_esp from w_gen_rep_consulta`cbx_esp within w_psi_reporte_renovaciones
boolean visible = false
integer x = 3758
integer y = 44
integer width = 110
end type

type cbx_mat from w_gen_rep_consulta`cbx_mat within w_psi_reporte_renovaciones
boolean visible = false
integer x = 3611
integer y = 48
integer width = 78
end type

type cb_1 from w_gen_rep_consulta`cb_1 within w_psi_reporte_renovaciones
integer x = 3067
integer y = 152
end type

type cb_imprimir from w_gen_rep_consulta`cb_imprimir within w_psi_reporte_renovaciones
integer x = 2405
integer y = 152
end type

type cb_generar from w_gen_rep_consulta`cb_generar within w_psi_reporte_renovaciones
integer x = 1765
integer y = 152
integer weight = 400
end type

event cb_generar::clicked;Integer li_row
String ls_fecha
Integer li_cvedepto, li_folio2, li_folio1, li_folio0

If em_fecha.text <> '' Then
	ls_fecha = Mid(em_fecha.text, 7, 4) + Mid(em_fecha.text, 4, 2) + Mid(em_fecha.text, 1, 2)
	li_row = dw_reporte_mat.retrieve(ls_fecha)
	If li_row <= 0 Then
		dw_renov_detalle.visible = False
		MessageBox('Mensaje', 'No se encontraron registros para la consulta realizada...')
	Else
		dw_renov_detalle.Object.DataWindow.Zoom = 92
		dw_renov_detalle.visible = True

		li_cvedepto = dw_reporte_mat.getitemnumber(dw_reporte_mat.getrow(), "cvedepto")
		li_folio2 = dw_reporte_mat.getitemnumber(dw_reporte_mat.getrow(), "folio_destino")
		li_folio1 = dw_reporte_mat.getitemnumber(dw_reporte_mat.getrow(), "folio_origen")
		li_folio0 = dw_reporte_mat.getitemnumber(dw_reporte_mat.getrow(), "folio_origen0")
		dw_renov_detalle.retrieve(li_cvedepto, li_folio2, li_folio1, li_folio0)
	End If
Else
	dw_renov_detalle.visible = False
	MessageBox('Mensaje', 'Debe indicar una fecha de consulta...')
End If	
				

end event

type dw_reporte_mat from w_gen_rep_consulta`dw_reporte_mat within w_psi_reporte_renovaciones
integer y = 292
integer width = 4658
integer height = 1224
string dataobject = "d_psi_rep_renovaciones"
end type

event dw_reporte_mat::itemfocuschanged;call super::itemfocuschanged;Integer li_cvedepto, li_folio2, li_folio1, li_folio0

//sl_linea=row
if row>0 then
	selectrow(0,false)
	selectrow(row,true)
else
	selectrow(0,false)
end if

If row > 0 Then
	li_cvedepto = dw_reporte_mat.object.cvedepto[row]
//	li_cvedepto = dw_reporte_mat.getitemnumber( row, "cvedepto")
	li_folio2 = dw_reporte_mat.getitemnumber( row, "folio_destino")
	li_folio1 = dw_reporte_mat.getitemnumber( row, "folio_origen")
	li_folio0 = dw_reporte_mat.getitemnumber( row, "folio_origen0")
//	dw_renov_detalle.visible = True
	dw_renov_detalle.retrieve(li_cvedepto, li_folio2, li_folio1, li_folio0)
End If
end event

event dw_reporte_mat::itemchanged;call super::itemchanged;Integer li_cvedepto, li_folio2, li_folio1, li_folio0

If row > 0 Then
	li_cvedepto = dw_reporte_mat.object.cvedepto[row]
//	li_cvedepto = dw_reporte_mat.getitemnumber( row, "cvedepto")
	li_folio2 = dw_reporte_mat.getitemnumber( row, "folio_destino")
	li_folio1 = dw_reporte_mat.getitemnumber( row, "folio_origen")
	li_folio0 = dw_reporte_mat.getitemnumber( row, "folio_origen0")
//	dw_renov_detalle.visible = True
	dw_renov_detalle.retrieve(li_cvedepto, li_folio2, li_folio1, li_folio0)
End If
end event

event dw_reporte_mat::doubleclicked;call super::doubleclicked;If row > 0 Then This.scrolltorow(row)
end event

type gb_1 from w_gen_rep_consulta`gb_1 within w_psi_reporte_renovaciones
boolean visible = false
integer x = 3474
integer y = 60
integer width = 91
integer height = 84
end type

type gb_2 from w_gen_rep_consulta`gb_2 within w_psi_reporte_renovaciones
boolean visible = false
integer x = 3959
integer y = 60
integer width = 78
integer height = 64
end type

type em_fecha from editmask within w_psi_reporte_renovaciones
integer x = 462
integer y = 148
integer width = 379
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_1 from statictext within w_psi_reporte_renovaciones
integer x = 155
integer y = 156
integer width = 288
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_renov_detalle from datawindow within w_psi_reporte_renovaciones
boolean visible = false
integer x = 114
integer y = 1560
integer width = 3483
integer height = 1296
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_psi_rep_detalle_mat_renov"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_psi_reporte_renovaciones
integer x = 123
integer y = 104
integer width = 960
integer height = 176
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

