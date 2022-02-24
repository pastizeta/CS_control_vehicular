$PBExportHeader$w_psi_autoriza_pre_solicitud.srw
$PBExportComments$Muestra las presolicitudes capturadas para el alumno-profesor del departamento en cuestion
forward
global type w_psi_autoriza_pre_solicitud from w_sheet
end type
type st_2 from statictext within w_psi_autoriza_pre_solicitud
end type
type em_folio from editmask within w_psi_autoriza_pre_solicitud
end type
type st_1 from statictext within w_psi_autoriza_pre_solicitud
end type
type em_idusuario from editmask within w_psi_autoriza_pre_solicitud
end type
type cb_salir from commandbutton within w_psi_autoriza_pre_solicitud
end type
type cb_aceptar from commandbutton within w_psi_autoriza_pre_solicitud
end type
type cb_consulta from commandbutton within w_psi_autoriza_pre_solicitud
end type
type dw_mat_cursos from u_dw within w_psi_autoriza_pre_solicitud
end type
end forward

global type w_psi_autoriza_pre_solicitud from w_sheet
integer width = 3950
integer height = 2266
string title = "Autorización de Presolicitudes de Prestamos de Psicología"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 29534863
st_2 st_2
em_folio em_folio
st_1 st_1
em_idusuario em_idusuario
cb_salir cb_salir
cb_aceptar cb_aceptar
cb_consulta cb_consulta
dw_mat_cursos dw_mat_cursos
end type
global w_psi_autoriza_pre_solicitud w_psi_autoriza_pre_solicitud

type variables
n_transportar regreso
boolean ib_selecciona
//integer li_tipo
long sl_linea
end variables

on w_psi_autoriza_pre_solicitud.create
int iCurrent
call super::create
this.st_2=create st_2
this.em_folio=create em_folio
this.st_1=create st_1
this.em_idusuario=create em_idusuario
this.cb_salir=create cb_salir
this.cb_aceptar=create cb_aceptar
this.cb_consulta=create cb_consulta
this.dw_mat_cursos=create dw_mat_cursos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.em_folio
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.em_idusuario
this.Control[iCurrent+5]=this.cb_salir
this.Control[iCurrent+6]=this.cb_aceptar
this.Control[iCurrent+7]=this.cb_consulta
this.Control[iCurrent+8]=this.dw_mat_cursos
end on

on w_psi_autoriza_pre_solicitud.destroy
call super::destroy
destroy(this.st_2)
destroy(this.em_folio)
destroy(this.st_1)
destroy(this.em_idusuario)
destroy(this.cb_salir)
destroy(this.cb_aceptar)
destroy(this.cb_consulta)
destroy(this.dw_mat_cursos)
end on

event open;call super::open;//integer li_cvedepto
//long ll_cuentaProf
//
//regreso = message.powerobjectparm
//li_cvedepto = regreso.ii_parm1
//ll_cuentaProf = regreso.il_parm2

//dw_mat_cursos.setTransObject(gtr_sumuia)
//if dw_mat_cursos.Retrieve(li_cvedepto, ll_cuentaProf) = 0 then
//	ib_selecciona  = false
//	close( this)
//end if 
//
//

dw_mat_cursos.setTransObject(gtr_sumuia)
em_idusuario.setfocus( )
end event

event close;call super::close;if ib_selecciona then	
	CloseWithReturn(w_psi_pre_solicitud,regreso)
end if
end event

type st_2 from statictext within w_psi_autoriza_pre_solicitud
integer x = 984
integer y = 90
integer width = 358
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Folio:"
boolean focusrectangle = false
end type

type em_folio from editmask within w_psi_autoriza_pre_solicitud
integer x = 1434
integer y = 90
integer width = 325
integer height = 67
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
string mask = "##########"
string minmax = "~~"
end type

type st_1 from statictext within w_psi_autoriza_pre_solicitud
integer x = 95
integer y = 90
integer width = 358
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solicitante:"
boolean focusrectangle = false
end type

type em_idusuario from editmask within w_psi_autoriza_pre_solicitud
integer x = 527
integer y = 90
integer width = 325
integer height = 67
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
string mask = "##########"
string minmax = "~~"
end type

type cb_salir from commandbutton within w_psi_autoriza_pre_solicitud
integer x = 1317
integer y = 1978
integer width = 402
integer height = 99
integer taborder = 50
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

type cb_aceptar from commandbutton within w_psi_autoriza_pre_solicitud
integer x = 658
integer y = 1981
integer width = 402
integer height = 99
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar"
end type

event clicked;if dw_mat_cursos.update(true,false) < 0 then
	rollback using gtr_sumuia;
	messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
Else
	commit using gtr_sumuia;
	messagebox("Mensaje","Actualización satisfactoria",none!)
end if
end event

type cb_consulta from commandbutton within w_psi_autoriza_pre_solicitud
integer x = 69
integer y = 1981
integer width = 402
integer height = 99
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consultar"
end type

event clicked;long ll_cuentaProf
long ll_folio

if isNumber(trim(em_folio.text)) then ll_folio=Long(trim(em_folio.text)) else SetNull(ll_folio)
if isNumber(trim(em_idusuario.text)) then ll_cuentaProf=Long(trim(em_idusuario.text)) else SetNull(ll_cuentaProf)

if dw_mat_cursos.Retrieve(gi_depto, gi_area, ll_cuentaProf, ll_folio) = 0 then
	Messagebox("Mensaje","No se han encontrado registros para la consulta realizada....")
end if 


//integer ls_cuentaProf
//string ls_folio
//
//ls_folio = trim(em_folio.text)
//ls_cuentaProf = em_idusuario.text
//If trim(ls_cuentaProf) = ''  Then SetNull(ls_cuentaProf)
//If trim(ls_folio) = ''  Then SetNull(ls_folio)
//
//if dw_mat_cursos.Retrieve(gi_depto, gi_area, ls_cuentaProf, ls_folio) = 0 then
//	Messagebox("Mensaje","No se han encontrado registros para la consulta realizada....")
//end if 
end event

type dw_mat_cursos from u_dw within w_psi_autoriza_pre_solicitud
integer x = 69
integer y = 202
integer width = 3855
integer height = 1725
integer taborder = 60
string dataobject = "d_psi_pre_solicitudes_aut"
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

event doubleclicked;call super::doubleclicked;ib_selecciona = true
regreso.ii_parm3= this.GetItemNumber(row,'folio')		
close(parent)

end event

event itemchanged;call super::itemchanged;If dwo.name = "autorizada" Then
	If This.getitemnumber( row, "status") = 1 Or This.getitemnumber( row, "status") = 2 Then
		Messagebox("Mensaje", "No se puede modificar una presolicitud con estatus Procesada o Cancelada...")
		return -1
	End If
End If
	
end event

