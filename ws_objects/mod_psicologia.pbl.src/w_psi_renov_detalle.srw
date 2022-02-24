$PBExportHeader$w_psi_renov_detalle.srw
$PBExportComments$Muestra las presolicitudes capturadas para el alumno-profesor del departamento en cuestion
forward
global type w_psi_renov_detalle from w_sheet
end type
type st_2 from statictext within w_psi_renov_detalle
end type
type cb_aceptar from commandbutton within w_psi_renov_detalle
end type
type dw_solici_origen0 from u_dw within w_psi_renov_detalle
end type
type cb_salir from commandbutton within w_psi_renov_detalle
end type
type st_1 from statictext within w_psi_renov_detalle
end type
type dw_presolicitud from u_dw within w_psi_renov_detalle
end type
type dw_solicitud from u_dw within w_psi_renov_detalle
end type
end forward

global type w_psi_renov_detalle from w_sheet
integer width = 3671
integer height = 3200
string title = "Renovaciones  pendientes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 29534863
st_2 st_2
cb_aceptar cb_aceptar
dw_solici_origen0 dw_solici_origen0
cb_salir cb_salir
st_1 st_1
dw_presolicitud dw_presolicitud
dw_solicitud dw_solicitud
end type
global w_psi_renov_detalle w_psi_renov_detalle

type variables
n_transportar regreso, origen_ren
boolean ib_selecciona
//integer li_tipo
long sl_linea
end variables

forward prototypes
public function integer wf_valida_renovacion (integer ai_cvedepto, integer ai_cvearea, integer ai_folio_prestamo)
end prototypes

public function integer wf_valida_renovacion (integer ai_cvedepto, integer ai_cvearea, integer ai_folio_prestamo);integer li_registros

SELECT IsNull(count(*), 0)
   INTO :li_registros
  FROM spre_renovaciones
WHERE cvedepto = :ai_cvedepto
  	AND (folio_origen =  :ai_folio_prestamo or folio_destino = :ai_folio_prestamo)
  USING gtr_sumuia;

If IsNull(li_registros) Then
	li_registros = 0
End If

RETURN  li_registros
end function

on w_psi_renov_detalle.create
int iCurrent
call super::create
this.st_2=create st_2
this.cb_aceptar=create cb_aceptar
this.dw_solici_origen0=create dw_solici_origen0
this.cb_salir=create cb_salir
this.st_1=create st_1
this.dw_presolicitud=create dw_presolicitud
this.dw_solicitud=create dw_solicitud
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.dw_solici_origen0
this.Control[iCurrent+4]=this.cb_salir
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.dw_presolicitud
this.Control[iCurrent+7]=this.dw_solicitud
end on

on w_psi_renov_detalle.destroy
call super::destroy
destroy(this.st_2)
destroy(this.cb_aceptar)
destroy(this.dw_solici_origen0)
destroy(this.cb_salir)
destroy(this.st_1)
destroy(this.dw_presolicitud)
destroy(this.dw_solicitud)
end on

event open;call super::open;integer li_cvedepto, li_cvearea, li_folio_presol, li_folio_origen, li_folio_origen0

regreso = message.powerobjectparm
li_cvedepto = regreso.ii_parm1
li_cvearea = regreso.ii_parm2
li_folio_presol = regreso.ii_parm3
li_folio_origen = regreso.ii_parm4
li_folio_origen0 = regreso.ii_parm5

dw_presolicitud.setTransObject(gtr_sumuia)
dw_solicitud.setTransObject(gtr_sumuia)
dw_solici_origen0.setTransObject(gtr_sumuia)

If dw_presolicitud.Retrieve(li_cvedepto, li_folio_presol) = 0 Then
	MessageBox('Mensaje', 'No se encontro la información de la Pre-Solicitud de Renovación')
End If 

If dw_solicitud.Retrieve(li_cvedepto, li_folio_origen) = 0 Then
	MessageBox('Mensaje', 'No se encontro la información de la Solicitud Origen')
End If 

If li_folio_origen0 > 0 Then
	This.height = 3100
	dw_solici_origen0.visible = True
	dw_solici_origen0.Retrieve(li_cvedepto, li_folio_origen0)
Else
	dw_solici_origen0.visible = False
	This.height = 2200
End If

end event

event close;call super::close;if ib_selecciona then	
	CloseWithReturn(w_psi_pre_solicitud,regreso)
end if
end event

type st_2 from statictext within w_psi_renov_detalle
integer x = 78
integer y = 1096
integer width = 635
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Prestamos Anteriores"
boolean focusrectangle = false
end type

type cb_aceptar from commandbutton within w_psi_renov_detalle
integer x = 3259
integer y = 292
integer width = 361
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Renovar"
end type

event clicked;integer li_cvedepto, li_cvearea, li_folio_presol, li_idsolicitante, li_folio_prestamo_origen
long ll_num_renovaciones
If dw_presolicitud.rowcount( ) > 0 Then
	li_cvedepto = dw_presolicitud.getitemnumber( dw_presolicitud.getrow( ) , "spre_pre_solicitud_cvedepto")
	li_cvearea = dw_presolicitud.getitemnumber( dw_presolicitud.getrow( ), "spre_pre_sol_materiales_cvearea")
	li_folio_presol = dw_presolicitud.getitemnumber( dw_presolicitud.getrow( ), "folio")
	li_idsolicitante = dw_presolicitud.getitemnumber( dw_presolicitud.getrow( ), "spre_pre_solicitud_solicitanteid")
	li_folio_prestamo_origen = dw_presolicitud.getitemnumber( dw_presolicitud.getrow( ), "folio_origen")

	ll_num_renovaciones = wf_valida_renovacion (li_cvedepto, li_cvearea, li_folio_prestamo_origen)
	
	If ll_num_renovaciones >= 2  Then
		MessageBox('Mensaje', 'El número de Renovaciones posibles para ese préstamo ('+ string(li_folio_prestamo_origen) + ') ya se han realizado, favor de verificar...')
	Else
		origen_ren.ii_parm1 = li_cvedepto
		origen_ren.ii_parm2 = li_cvearea
		origen_ren.ii_parm3 = li_folio_presol
		origen_ren.ii_parm4 = li_idsolicitante
	
		OpenWithParm(w_psi_prestamo_mat, origen_ren)	
	End If
End If


end event

type dw_solici_origen0 from u_dw within w_psi_renov_detalle
boolean visible = false
integer x = 78
integer y = 2064
integer width = 3127
integer height = 856
integer taborder = 30
string dataobject = "d_psi_detalle_solicitud"
boolean border = false
end type

event doubleclicked;call super::doubleclicked;long li_autorizada

li_autorizada = This.getitemnumber( row, "autorizada")

If li_autorizada = 1 Then
	ib_selecciona = true
	regreso.ii_parm3= this.GetItemNumber(row,'folio')		
	close(parent)
Else
	MessageBox("Mensaje", "No se puede cargar una presolicitud que no ha sido autorizada...")
End If
end event

event itemfocuschanged;call super::itemfocuschanged;sl_linea=row
if row>0 then
	selectrow(0,false)
	selectrow(row,true)
else
	selectrow(0,false)
end if
end event

type cb_salir from commandbutton within w_psi_renov_detalle
integer x = 3259
integer y = 472
integer width = 361
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;Close(Parent)
end event

type st_1 from statictext within w_psi_renov_detalle
integer x = 1184
integer y = 52
integer width = 864
integer height = 64
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Detalle de la Renovación"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_presolicitud from u_dw within w_psi_renov_detalle
integer x = 78
integer y = 224
integer width = 3127
integer height = 856
integer taborder = 10
string dataobject = "d_psi_detalle_presolicitud"
boolean border = false
end type

event doubleclicked;call super::doubleclicked;long li_autorizada

li_autorizada = This.getitemnumber( row, "autorizada")

If li_autorizada = 1 Then
	ib_selecciona = true
	regreso.ii_parm3= this.GetItemNumber(row,'folio')		
	close(parent)
Else
	MessageBox("Mensaje", "No se puede cargar una presolicitud que no ha sido autorizada...")
End If
end event

event itemfocuschanged;call super::itemfocuschanged;sl_linea=row
if row>0 then
	selectrow(0,false)
	selectrow(row,true)
else
	selectrow(0,false)
end if
end event

type dw_solicitud from u_dw within w_psi_renov_detalle
integer x = 78
integer y = 1176
integer width = 3127
integer height = 856
integer taborder = 10
string dataobject = "d_psi_detalle_solicitud"
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

li_autorizada = This.getitemnumber( row, "autorizada")

If li_autorizada = 1 Then
	ib_selecciona = true
	regreso.ii_parm3= this.GetItemNumber(row,'folio')		
	close(parent)
Else
	MessageBox("Mensaje", "No se puede cargar una presolicitud que no ha sido autorizada...")
End If
end event

