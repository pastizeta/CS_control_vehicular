$PBExportHeader$w_gral_busca_alms_empl.srw
$PBExportComments$Permite buscar alumnos y empleados
forward
global type w_gral_busca_alms_empl from w_sheet
end type
type dw_1 from u_dw within w_gral_busca_alms_empl
end type
type cb_1 from commandbutton within w_gral_busca_alms_empl
end type
type st_3 from statictext within w_gral_busca_alms_empl
end type
type st_2 from statictext within w_gral_busca_alms_empl
end type
type st_1 from statictext within w_gral_busca_alms_empl
end type
type sle_nombre from singlelineedit within w_gral_busca_alms_empl
end type
type sle_amaterno from singlelineedit within w_gral_busca_alms_empl
end type
type sle_apaterno from singlelineedit within w_gral_busca_alms_empl
end type
type rb_2 from radiobutton within w_gral_busca_alms_empl
end type
type rb_1 from radiobutton within w_gral_busca_alms_empl
end type
type gb_1 from groupbox within w_gral_busca_alms_empl
end type
end forward

global type w_gral_busca_alms_empl from w_sheet
integer x = 214
integer y = 221
integer width = 2784
integer height = 2580
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 29534863
dw_1 dw_1
cb_1 cb_1
st_3 st_3
st_2 st_2
st_1 st_1
sle_nombre sle_nombre
sle_amaterno sle_amaterno
sle_apaterno sle_apaterno
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
global w_gral_busca_alms_empl w_gral_busca_alms_empl

type variables
boolean ib_selecciona
integer iiselAlmEmpl
string isSyntax
n_transportar regreso
end variables

on w_gral_busca_alms_empl.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_nombre=create sle_nombre
this.sle_amaterno=create sle_amaterno
this.sle_apaterno=create sle_apaterno
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.sle_nombre
this.Control[iCurrent+7]=this.sle_amaterno
this.Control[iCurrent+8]=this.sle_apaterno
this.Control[iCurrent+9]=this.rb_2
this.Control[iCurrent+10]=this.rb_1
this.Control[iCurrent+11]=this.gb_1
end on

on w_gral_busca_alms_empl.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_nombre)
destroy(this.sle_amaterno)
destroy(this.sle_apaterno)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

event close;call super::close;
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	close
//
//	Arguments:
//	none
//
//	Returns:
//	long
//
//	Description:
//
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

if ib_selecciona then
	regreso.ii_parm1 = 1
	CloseWithReturn(w_gral_busca_alms_empl,regreso)
else
	regreso.ii_parm1 = 0
	CloseWithReturn(w_gral_busca_alms_empl,regreso)
	
end if
//
end event

type dw_1 from u_dw within w_gral_busca_alms_empl
integer x = 73
integer y = 640
integer width = 2606
integer height = 1648
integer taborder = 50
string dataobject = "d_gral_busca_empleados"
boolean hscrollbar = true
end type

event doubleclicked;call super::doubleclicked;
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	doubleclicked
//
//	Arguments:
//	integer	xpos	La distancia del puntero desde el lado izquierdo del espacio
//						de trabajo de la DataWindow. La distancia se da en pixeles.
//	integer	ypos	La distancia del puntero desde la parte superior del espacio
//						de trabajo de la DataWindow. La distancia se da en pixeles.
//	long		row	El número de la fila donde el usuario hizo clic.
//	dwobject	dwo	Una referencia al control dentro de la DataWindow debajo del
//						puntero donde el usuario hizo clic.
//
//	Returns: el nombre del empleado
//	
//
//	Description: Permite seleccionar el empleado buscado
//
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
	long llCuentaClave, llDeptoCarrera
	String lsNombreSeleccionado
	
	ib_selecciona = true
	
	choose case iiselAlmEmpl
		case 1
			llCuentaClave = dw_1.GetItemNumber(row,'v_sce_academicos_cuenta')
			llDeptoCarrera = dw_1.GetItemNumber(row,'cve_carrera')
			lsNombreSeleccionado =dw_1.GetItemString(row,'apaterno') +' '+dw_1.GetItemString(row,'amaterno')+' '+dw_1.GetItemString(row,'nombre')
			
		case 2
			llCuentaClave = dw_1.GetItemNumber(row,'empleado')
			llDeptoCarrera = long(dw_1.GetItemString(row,'empl_uia1_depto'))
			lsNombreSeleccionado =dw_1.GetItemString(row,'appaterno') +' '+dw_1.GetItemString(row,'apmaterno')+' '+dw_1.GetItemString(row,'nombre')
	end choose
	regreso.il_parm1 = llCuentaClave
	regreso.is_parm1 =lsNombreSeleccionado
	regreso.il_parm2 = llDeptoCarrera
	close(parent)

end event

type cb_1 from commandbutton within w_gral_busca_alms_empl
integer x = 1655
integer y = 164
integer width = 407
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;String lsNom, lsCuenta, lsCarr, lsSyn,  lsDepto, lsCve, lsWhere
lsSyn = isSyntax


//

choose case iiselAlmEmpl
//	case 1
//		
//
//		//SI NO SE CAPTURO NINGUN FILTRO MANDA MENSAJE DE AVISO
//		If sle_apaterno.Text = "" and sle_amaterno.Text = "" and sle_nombre.Text = "" Then
//			If MessageBox("Aviso", "No se capturó ningún criterio, esta busqueda puede tardar Varios Minutos, DESEA CONTINUAR ?", Question!, YesNo!, 2) = 2 Then Return
//		End If		
//		
//		//verifica que si se haya seleccionado el apellido paterno
//		IF sle_apaterno.Text <> "" THEN &	
//			lsWhere = lsWhere + " AND apaterno like '%" + sle_apaterno.Text + "%'"	
//		
//		//verifica que si se haya seleccionado el apellido materno
//		IF sle_amaterno.Text <> "" THEN &
//				lsWhere = lsWhere + " AND amaterno LIKE '%" + sle_amaterno.Text + "%'"
//		
//		//verifica que si se haya seleccionado el nombre	
//		IF sle_nombre.text <> "" THEN &
//				lsWhere = lsWhere + " AND nombre LIKE '%" + sle_nombre.text + "%'"
//				
//		lsSyn = lsSyn + lsWhere
	case 2
		
		//SI NO SE CAPTURO NINGUN FILTRO MANDA MENSAJE DE AVISO
		If sle_apaterno.Text = "" and sle_amaterno.Text = "" and sle_nombre.Text = "" Then
			If MessageBox("Aviso", "No se capturó ningún criterio, esta busqueda puede tardar Varios Minutos, DESEA CONTINUAR ?", Question!, YesNo!, 2) = 2 Then Return
		End If
		
		//verifica que si se haya seleccionado el apellido paterno
		IF sle_apaterno.Text <> "" THEN &	
			lsWhere = lsWhere + " AND appaterno like '%" + sle_apaterno.Text + "%'"	
		
			//verifica que si se haya seleccionado el apellido materno
		IF sle_amaterno.Text <> "" THEN &
				lsWhere = lsWhere + " AND apmaterno LIKE '%" + sle_amaterno.Text + "%'"
		
		
		//verifica que si se haya seleccionado el nombre
		IF sle_nombre.text <> "" THEN &
				lsWhere = lsWhere + " AND nombre LIKE '%" + sle_nombre.text + "%'"
				
		lsSyn = lsSyn + lsWhere
	case else 
		MessageBox("Aviso", "Seleccione el tipo de busqueda a realizar")
		return
end choose
	

//ASIGNA LA NUEVA SINTAXIS AL DW
		dw_1.SetSQLSelect(lsSyn)
		If dw_1.Retrieve() = 0 Then
			MessageBox("Aviso", "No existe información con el criterio seleccionado")
			Return
		End if
end event

type st_3 from statictext within w_gral_busca_alms_empl
integer x = 160
integer y = 464
integer width = 494
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Nombre(s) :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_gral_busca_alms_empl
integer x = 160
integer y = 336
integer width = 494
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Apellido materno :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_gral_busca_alms_empl
integer x = 160
integer y = 208
integer width = 494
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Apellido paterno :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_nombre from singlelineedit within w_gral_busca_alms_empl
integer x = 681
integer y = 464
integer width = 722
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_amaterno from singlelineedit within w_gral_busca_alms_empl
integer x = 681
integer y = 336
integer width = 722
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_apaterno from singlelineedit within w_gral_busca_alms_empl
integer x = 681
integer y = 208
integer width = 722
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type rb_2 from radiobutton within w_gral_busca_alms_empl
integer x = 667
integer y = 96
integer width = 402
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Empleado"
borderstyle borderstyle = stylelowered!
end type

event clicked;iiselAlmEmpl=2
regreso.ii_parm2 = 2
dw_1.dataobject = "d_gral_busca_empleados"
dw_1.SetTransObject(gtr_personal)
isSyntax = dw_1.GetSQLSelect()
dw_1.visible = true
sle_apaterno.SetFocus()
end event

type rb_1 from radiobutton within w_gral_busca_alms_empl
boolean visible = false
integer x = 2181
integer y = 464
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Alumno"
borderstyle borderstyle = stylelowered!
end type

event clicked;iiselAlmEmpl =1
regreso.ii_parm2 = 1
dw_1.dataobject = "d_gral_busca_alumnos"
dw_1.SetTransObject(gtr_sumuia)
isSyntax = dw_1.GetSQLSelect()
dw_1.visible = true
sle_apaterno.SetFocus()
end event

type gb_1 from groupbox within w_gral_busca_alms_empl
integer x = 73
integer y = 32
integer width = 2601
integer height = 572
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Buscar"
borderstyle borderstyle = stylelowered!
end type

