$PBExportHeader$w_gral_busca_directores.srw
$PBExportComments$Permite buscar alumnos y empleados
forward
global type w_gral_busca_directores from w_sheet
end type
type dw_1 from u_dw within w_gral_busca_directores
end type
type cb_1 from commandbutton within w_gral_busca_directores
end type
type st_3 from statictext within w_gral_busca_directores
end type
type st_2 from statictext within w_gral_busca_directores
end type
type st_1 from statictext within w_gral_busca_directores
end type
type sle_nombre from singlelineedit within w_gral_busca_directores
end type
type sle_amaterno from singlelineedit within w_gral_busca_directores
end type
type sle_apaterno from singlelineedit within w_gral_busca_directores
end type
type rb_2 from radiobutton within w_gral_busca_directores
end type
type gb_1 from groupbox within w_gral_busca_directores
end type
end forward

global type w_gral_busca_directores from w_sheet
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
gb_1 gb_1
end type
global w_gral_busca_directores w_gral_busca_directores

type variables
boolean ib_selecciona
integer iiselAlmEmpl
string isSyntax
n_transportar regreso
end variables

on w_gral_busca_directores.create
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
this.Control[iCurrent+10]=this.gb_1
end on

on w_gral_busca_directores.destroy
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
	CloseWithReturn(w_gral_busca_directores,regreso)
else
	regreso.ii_parm1 = 0
	CloseWithReturn(w_gral_busca_directores,regreso)
	
end if
//
end event

type dw_1 from u_dw within w_gral_busca_directores
integer x = 73
integer y = 640
integer width = 2606
integer height = 1648
integer taborder = 50
string dataobject = "d_esp_gral_busca_directores"
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
// Agosto 2008 gmn.
//////////////////////////////////////////////////////////////////////////////

	long llCuentaClave
	String lsNombreSeleccionado, lsPuesto
	
	ib_selecciona = true
	
	choose case iiselAlmEmpl
		case 2
			llCuentaClave = dw_1.GetItemNumber(row,'empleado')
			lsNombreSeleccionado = string(dw_1.GetItemstring(row,'nombre'))
			lsPuesto = string(dw_1.GetItemstring(row,'nombrepuesto'))
	end choose
	regreso.il_parm1 = llCuentaClave
	regreso.is_parmdir1 = lsNombreSeleccionado
	regreso.is_parmdir2 = lsPuesto

	close(parent)

end event

type cb_1 from commandbutton within w_gral_busca_directores
integer x = 1883
integer y = 312
integer width = 407
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Buscar"
end type

event clicked;String lsNom, lsCuenta, lsCarr, lsSyn,  lsDepto, lsCve, lsWhere
lsSyn = isSyntax
choose case iiselAlmEmpl

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

type st_3 from statictext within w_gral_busca_directores
integer x = 210
integer y = 492
integer width = 567
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Nombre(s) :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_gral_busca_directores
integer x = 210
integer y = 368
integer width = 567
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Apellido materno :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_gral_busca_directores
integer x = 210
integer y = 244
integer width = 567
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Apellido paterno :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_nombre from singlelineedit within w_gral_busca_directores
integer x = 805
integer y = 464
integer width = 722
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_amaterno from singlelineedit within w_gral_busca_directores
integer x = 805
integer y = 336
integer width = 722
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_apaterno from singlelineedit within w_gral_busca_directores
integer x = 805
integer y = 208
integer width = 722
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type rb_2 from radiobutton within w_gral_busca_directores
integer x = 210
integer y = 116
integer width = 567
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "  Empleado"
borderstyle borderstyle = stylelowered!
end type

event clicked;iiselAlmEmpl=2
regreso.ii_parm2 = 2
dw_1.dataobject = "d_esp_gral_busca_directores"
dw_1.SetTransObject(gtr_personal)
isSyntax = dw_1.GetSQLSelect()
dw_1.visible = true
sle_apaterno.SetFocus()
end event

type gb_1 from groupbox within w_gral_busca_directores
integer x = 73
integer y = 32
integer width = 2601
integer height = 572
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 29534863
string text = "Buscar"
borderstyle borderstyle = stylelowered!
end type

