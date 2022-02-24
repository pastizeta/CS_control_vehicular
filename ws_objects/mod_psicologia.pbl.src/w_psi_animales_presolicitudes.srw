$PBExportHeader$w_psi_animales_presolicitudes.srw
forward
global type w_psi_animales_presolicitudes from window
end type
type cb_rechazar from commandbutton within w_psi_animales_presolicitudes
end type
type cb_aprobar from commandbutton within w_psi_animales_presolicitudes
end type
type cb_buscar from commandbutton within w_psi_animales_presolicitudes
end type
type st_mensaje from statictext within w_psi_animales_presolicitudes
end type
type dw_presolicitudes from datawindow within w_psi_animales_presolicitudes
end type
type dw_csal_solicitudes_temporales from datawindow within w_psi_animales_presolicitudes
end type
type dw_csal_solicitudes_permanente from datawindow within w_psi_animales_presolicitudes
end type
end forward

global type w_psi_animales_presolicitudes from window
integer width = 6510
integer height = 2474
boolean titlebar = true
string title = "Pre-solicitudes de asignación de animales"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_rechazar cb_rechazar
cb_aprobar cb_aprobar
cb_buscar cb_buscar
st_mensaje st_mensaje
dw_presolicitudes dw_presolicitudes
dw_csal_solicitudes_temporales dw_csal_solicitudes_temporales
dw_csal_solicitudes_permanente dw_csal_solicitudes_permanente
end type
global w_psi_animales_presolicitudes w_psi_animales_presolicitudes

type variables
date idt_fecha_ini_actual, idt_fecha_fin_actual
integer ii_anio, ii_periodo
end variables

forward prototypes
public function string uf_nombre_dia (integer p_dia)
public subroutine uf_actualiza ()
public function string uf_dia_semana (integer p_dia)
public function long uf_aprobar (integer p_row)
public function long uf_rechazar (integer p_row)
end prototypes

public function string uf_nombre_dia (integer p_dia);string ls_dia

choose case p_dia
	case 0
		ls_dia='Domingo'
	case 1
		ls_dia='Lunes'
	case 2
		ls_dia='Martes'
	case 3
		ls_dia='Miércoles'
	case 4
		ls_dia='Jueves'
	case 5
		ls_dia='Viernes'
	case 6
		ls_dia='Sábado'
end choose

return(ls_dia)
end function

public subroutine uf_actualiza ();dw_presolicitudes.reset()
dw_presolicitudes.SetReDraw(false)


if isnull(ii_periodo) or isnull(ii_anio)then
	messagebox('Aviso','Las fechas de reservación deben encontrarse en el periodo escolar actual')
else	
	dw_presolicitudes.Retrieve(ii_anio,ii_periodo)
end if

dw_presolicitudes.SetReDraw(true)

end subroutine

public function string uf_dia_semana (integer p_dia);string ls_dia = ''

choose case p_dia
	case 0
		ls_dia='Domingo'
	case 1
		ls_dia='Lunes'
	case 2	
		ls_dia='Martes'
	case 3
		ls_dia='Miércoles'
	case 4
		ls_dia='Jueves'
	case 5
		ls_dia='Viernes'
	case 6
		ls_dia='Sábado'
	case else
end choose

return (ls_dia)
end function

public function long uf_aprobar (integer p_row);long ll_folio

ll_folio=dw_presolicitudes.GetItemNumber(p_row,'folio')

//Actualizar presolicitud
update dbo.spre_animales_pre_asignacion
set estatus=1,
fecha_aprobado=getdate()
where folio=:ll_folio
using gtr_sumuia;

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
	return -1
end if

return 1

end function

public function long uf_rechazar (integer p_row);long ll_folio

ll_folio=dw_presolicitudes.GetItemNumber(p_row,'folio')

//Actualizar presolicitud
update dbo.spre_animales_pre_asignacion
set estatus=2,
fecha_rechazado=getdate()
where folio=:ll_folio
using gtr_sumuia;

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
	return -1
end if

return 1

end function

on w_psi_animales_presolicitudes.create
this.cb_rechazar=create cb_rechazar
this.cb_aprobar=create cb_aprobar
this.cb_buscar=create cb_buscar
this.st_mensaje=create st_mensaje
this.dw_presolicitudes=create dw_presolicitudes
this.dw_csal_solicitudes_temporales=create dw_csal_solicitudes_temporales
this.dw_csal_solicitudes_permanente=create dw_csal_solicitudes_permanente
this.Control[]={this.cb_rechazar,&
this.cb_aprobar,&
this.cb_buscar,&
this.st_mensaje,&
this.dw_presolicitudes,&
this.dw_csal_solicitudes_temporales,&
this.dw_csal_solicitudes_permanente}
end on

on w_psi_animales_presolicitudes.destroy
destroy(this.cb_rechazar)
destroy(this.cb_aprobar)
destroy(this.cb_buscar)
destroy(this.st_mensaje)
destroy(this.dw_presolicitudes)
destroy(this.dw_csal_solicitudes_temporales)
destroy(this.dw_csal_solicitudes_permanente)
end on

event open;f_select_anio_periodo_actual_fechas(ii_periodo,ii_anio,today(), idt_fecha_ini_actual, idt_fecha_fin_actual)

dw_presolicitudes.setTransObject(gtr_sumuia)
post uf_actualiza()

end event

type cb_rechazar from commandbutton within w_psi_animales_presolicitudes
integer x = 1090
integer y = 86
integer width = 410
integer height = 106
integer taborder = 150
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Rechazar"
end type

event clicked;integer li_i, li_click, li_disponible=0, Net, li_respuesta
long ll_folio

Net = messagebox("Atención",'¿Desea rechazar las solicitudes marcadas?', Question!, yesno!, 2)
if Net = 1 then 
	for li_i = 1 to dw_presolicitudes.RowCount() 
		li_click=dw_presolicitudes.GetItemNumber(li_i,'cbox')
		ll_folio=dw_presolicitudes.GetItemNumber(li_i,'folio')
		if li_click = 1 then 
			li_respuesta = uf_rechazar(li_i)
			if li_respuesta > 0 then messagebox('Aviso', 'Pre-solicitud con folio ' + string (ll_folio) + ' ha sido rechazada')
		end if
	next
	uf_actualiza()
end if

end event

type cb_aprobar from commandbutton within w_psi_animales_presolicitudes
integer x = 589
integer y = 86
integer width = 410
integer height = 106
integer taborder = 150
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Aprobar"
end type

event clicked;integer li_i, li_click, li_respuesta=0, Net
long ll_folio

Net = messagebox("Atención",'¿Desea autorizar las solicitudes marcadas?', Question!, yesno!, 2)
if Net = 1 then 
	for li_i = 1 to dw_presolicitudes.RowCount() 
		li_click=dw_presolicitudes.GetItemNumber(li_i,'cbox')
		ll_folio=dw_presolicitudes.GetItemNumber(li_i,'folio')
		if li_click = 1 then 
			li_respuesta = uf_aprobar(li_i)
			if li_respuesta > 0 then messagebox('Aviso', 'Pre-solicitud con folio ' + string (ll_folio) + ' ha sido aprobada')
		end if
	next
	uf_actualiza()
end if	
end event

type cb_buscar from commandbutton within w_psi_animales_presolicitudes
integer x = 62
integer y = 86
integer width = 410
integer height = 106
integer taborder = 160
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Consultar"
end type

event clicked;uf_actualiza()
end event

type st_mensaje from statictext within w_psi_animales_presolicitudes
integer x = 80
integer y = 445
integer width = 819
integer height = 173
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
boolean focusrectangle = false
end type

type dw_presolicitudes from datawindow within w_psi_animales_presolicitudes
integer x = 37
integer y = 275
integer width = 6385
integer height = 2035
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_psi_animales_presolicitudes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer li_click = 0

if string(dwo.name) = 'cbox' and row > 0 then
	li_click=this.GetItemNumber(row,'cbox')
	if li_click = 0 then li_click = 1 else li_click = 0
	this.SetItem(row,'cbox',li_click)
end if
end event

type dw_csal_solicitudes_temporales from datawindow within w_psi_animales_presolicitudes
boolean visible = false
integer x = 1518
integer y = 176
integer width = 1463
integer height = 240
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_csal_salones_solicitudes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type dw_csal_solicitudes_permanente from datawindow within w_psi_animales_presolicitudes
boolean visible = false
integer width = 1514
integer height = 262
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_csal_salones_solicitudes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

