$PBExportHeader$w_psi_renov_pend.srw
$PBExportComments$Muestra las presolicitudes capturadas para el alumno-profesor del departamento en cuestion
forward
global type w_psi_renov_pend from w_sheet
end type
type cb_salir from commandbutton within w_psi_renov_pend
end type
type st_2 from statictext within w_psi_renov_pend
end type
type cb_buscar from commandbutton within w_psi_renov_pend
end type
type dw_mat_cursos from u_dw within w_psi_renov_pend
end type
end forward

global type w_psi_renov_pend from w_sheet
integer width = 3849
integer height = 1552
string title = "Renovaciones  pendientes"
long backcolor = 29534863
cb_salir cb_salir
st_2 st_2
cb_buscar cb_buscar
dw_mat_cursos dw_mat_cursos
end type
global w_psi_renov_pend w_psi_renov_pend

type variables
n_transportar origen, regreso
boolean ib_selecciona
//integer li_tipo
long sl_linea
String is_fecha_hoy
end variables

on w_psi_renov_pend.create
int iCurrent
call super::create
this.cb_salir=create cb_salir
this.st_2=create st_2
this.cb_buscar=create cb_buscar
this.dw_mat_cursos=create dw_mat_cursos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_salir
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.cb_buscar
this.Control[iCurrent+4]=this.dw_mat_cursos
end on

on w_psi_renov_pend.destroy
call super::destroy
destroy(this.cb_salir)
destroy(this.st_2)
destroy(this.cb_buscar)
destroy(this.dw_mat_cursos)
end on

event open;call super::open;integer li_cvedepto, li_cvearea
long ll_cuentaProf
String  ls_fecha

ls_fecha = String(Date(f_fecha_hora_servidor()))
is_fecha_hoy = Mid(ls_fecha, 7, 4) + Mid(ls_fecha, 4, 2) + Mid(ls_fecha, 1, 2)

//regreso = message.powerobjectparm
//li_cvedepto = regreso.ii_parm1
//li_cvearea = regreso.ii_parm2
//ll_cuentaProf = regreso.il_parm2
//

//li_cvedepto = gi_depto
//li_cvearea = gi_area
//ll_cuentaProf = regreso.il_parm2
//
dw_mat_cursos.setTransObject(gtr_sumuia)
dw_mat_cursos.Retrieve(gi_depto, gi_area, is_fecha_hoy)

end event

event close;call super::close;if ib_selecciona then	
	CloseWithReturn(w_psi_pre_solicitud,regreso)
end if
end event

type cb_salir from commandbutton within w_psi_renov_pend
integer x = 681
integer y = 1316
integer width = 402
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Salir"
end type

event clicked;Close(Parent)
end event

type st_2 from statictext within w_psi_renov_pend
integer x = 1445
integer y = 116
integer width = 846
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Renovaciones Pendientes"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_buscar from commandbutton within w_psi_renov_pend
integer x = 128
integer y = 1316
integer width = 402
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;Integer li_solicitante
SetPointer(HourGlass!)

if dw_mat_cursos.Retrieve(gi_depto, gi_area, is_fecha_hoy) = 0 then
	ib_selecciona  = false
end if 



end event

type dw_mat_cursos from u_dw within w_psi_renov_pend
integer x = 69
integer y = 320
integer width = 3694
integer height = 948
integer taborder = 10
string dataobject = "d_psi_renov_pend"
boolean border = false
end type

event itemfocuschanged;call super::itemfocuschanged;sl_linea=row
if row>0 then
	selectrow(0,false)
	selectrow(row,true)
else
	selectrow(0,false)
end if
end event

event doubleclicked;call super::doubleclicked;long li_autorizada

If row > 0 Then
	li_autorizada = This.getitemnumber( row, "autorizada")
	
	If li_autorizada = 1 Then
		origen.ii_parm1 = This.getitemnumber( row, "cvedepto")
		origen.ii_parm2 = This.getitemnumber( row, "cvearea")
		origen.ii_parm3 = This.getitemnumber( row, "folio")
		origen.ii_parm4 = This.getitemnumber( row, "folio_origen")
		origen.ii_parm5 = This.getitemnumber( row, "folio_origen0")	
		ib_selecciona = true
		OpenwithParm(w_psi_renov_detalle, origen)
	Else
		MessageBox("Mensaje", "No se puede cargar la solicitud de Renovación...")
	End If
End If
end event

event clicked;call super::clicked;This.scrolltorow(row)
end event

