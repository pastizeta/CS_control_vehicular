$PBExportHeader$w_ccd_presolicitudes_espacio.srw
forward
global type w_ccd_presolicitudes_espacio from window
end type
type cb_rechazar from commandbutton within w_ccd_presolicitudes_espacio
end type
type cb_aprobar from commandbutton within w_ccd_presolicitudes_espacio
end type
type cb_buscar from commandbutton within w_ccd_presolicitudes_espacio
end type
type st_mensaje from statictext within w_ccd_presolicitudes_espacio
end type
type dw_presolicitudes from datawindow within w_ccd_presolicitudes_espacio
end type
type dw_csal_solicitudes_temporales from datawindow within w_ccd_presolicitudes_espacio
end type
type dw_csal_solicitudes_permanente from datawindow within w_ccd_presolicitudes_espacio
end type
end forward

global type w_ccd_presolicitudes_espacio from window
integer width = 6513
integer height = 2474
boolean titlebar = true
string title = "Pre-solicitudes de espacio"
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
global w_ccd_presolicitudes_espacio w_ccd_presolicitudes_espacio

type variables
date idt_fecha_ini_actual, idt_fecha_fin_actual
integer ii_anio, ii_periodo
end variables

forward prototypes
public function string uf_nombre_dia (integer p_dia)
public subroutine uf_actualiza ()
public function string uf_dia_semana (integer p_dia)
public function long uf_aprobar (integer p_row)
public function integer uf_disponible (integer p_row)
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
	dw_presolicitudes.Retrieve(gi_depto,gi_area,ii_anio,ii_periodo)
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

public function long uf_aprobar (integer p_row);long ll_folio, ll_solicitante, ll_presol
datetime ldt_fecha_inicio, ldt_fecha_final, ldt_fecha_hoy
integer li_status=0,li_tipo_usuario, li_consec=1, li_cvegrupo, li_asistentes
string ls_observaciones='',ls_cvematerial,ls_num_serie,ls_sol_nombre,ls_actividad,ls_correo

ll_presol=dw_presolicitudes.GetItemNumber(p_row,'folio')
ldt_fecha_inicio=dw_presolicitudes.GetItemDateTime(p_row,'fecha_inicio')
ldt_fecha_final=dw_presolicitudes.GetItemDateTime(p_row,'fecha_final')
ll_solicitante=dw_presolicitudes.GetItemNumber(p_row,'solicitanteid')
li_tipo_usuario=dw_presolicitudes.GetItemNumber(p_row,'tipo_solicitud')
ls_sol_nombre=dw_presolicitudes.GetItemString(p_row,'solicitantenombre')
ls_observaciones=dw_presolicitudes.GetItemString(p_row,'observaciones')
ls_actividad=dw_presolicitudes.GetItemString(p_row,'actividad')
li_asistentes=dw_presolicitudes.GetItemNumber(p_row,'asistentes')
li_cvegrupo=dw_presolicitudes.GetItemNumber(p_row,'cvegrupo')
ls_cvematerial=dw_presolicitudes.GetItemString(p_row,'cvematerial')
ls_num_serie=dw_presolicitudes.GetItemString(p_row,'num_serie')
ls_correo=dw_presolicitudes.GetItemString(p_row,'email_solicitante')
ldt_fecha_hoy= DateTime(today(),now())

//Insertar Solicitud

select max(folio) into :ll_folio from dbo.spre_solicitud where cvedepto =:gi_depto
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener Máximo Folio Solicitud", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return -1
end if
	
if isNull(ll_folio) then ll_folio=0

ll_folio=ll_folio+1

//Insertar Solicitud
insert into dbo.spre_solicitud
(cvedepto, folio, solicitanteid, status, cveperiodo, condicion, fecha_solicitud, fecha_inicio, 
fecha_fin, tipo_solicitud, observaciones, actividad, asistentes, email_solicitante)
 
values
(:gi_depto, :ll_folio, :ll_solicitante, :li_status, :ii_periodo, 0, :ldt_fecha_hoy, :ldt_fecha_inicio,
:ldt_fecha_final, :li_tipo_usuario, :ls_observaciones, :ls_actividad, :li_asistentes, :ls_correo)

using gtr_sumuia;	

if gtr_sumuia.sqlcode<>0 then
	messagebox("Error al insertar la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
	return -1
end if	

//Insertar Solicitante
insert into dbo.spre_prestamo_material
(cvedepto, folio, tipo_prestamo, solicitanteid, solicitantenombre,
fechacarga, usuario)

values
(:gi_depto, :ll_folio, :li_tipo_usuario, :ll_solicitante, :ls_sol_nombre,
:ldt_fecha_hoy, :gs_usuario)

using gtr_sumuia;	

if gtr_sumuia.sqlcode<>0 then
	messagebox("Error al insertar solicitante a la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
	return -1
end if	

//Insertar Material
insert into dbo.spre_sol_materiales
(cvedepto, folio, consecutivo, cvearea, cvematerial, cvegrupo, num_serie,
status, fecha_inicio, fecha_final)
 
values
(:gi_depto, :ll_folio, :li_consec, :gi_area, :ls_cvematerial, :li_cvegrupo, :ls_num_serie,
:li_status, :ldt_fecha_inicio, :ldt_fecha_final)

using gtr_sumuia;	

if gtr_sumuia.sqlcode<>0 then
	messagebox("Error al insertar el material a la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
	return -1
end if	

//Actualizar presolicitud
update dbo.spre_pre_solicitud
set status=1,
fecha_autorizacion=getdate(),
folio_prestamo=:ll_folio
where cvedepto=:gi_depto and folio=:ll_presol
using gtr_sumuia;

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return -1;
end if

//Actualizar presolicitud materiales
update dbo.spre_pre_sol_materiales
set status=1
where cvedepto=:gi_depto and folio=:ll_presol
using gtr_sumuia;

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return -1;
end if

commit using gtr_sumuia;	

return (ll_folio)

end function

public function integer uf_disponible (integer p_row);datetime ldt_fecha_inicio, ldt_fecha_final,ldt_ahora
integer li_cvegrupo, li_existe, li_row
string ls_cvematerial, ls_num_serie, ls_find
datastore lds_reservados

ldt_fecha_inicio=dw_presolicitudes.GetItemDateTime(p_row,'fecha_inicio')
ldt_fecha_final=dw_presolicitudes.GetItemDateTime(p_row,'fecha_final')

lds_reservados =  create datastore
lds_reservados.dataobject ='d_psi_mat_reservados_consu_esp'
lds_reservados.settransobject(gtr_sumuia)

lds_reservados.Retrieve(gi_depto,gi_area,ldt_fecha_inicio,ldt_fecha_final)
li_row = lds_reservados.Rowcount()
	
if li_row>0 then

	li_cvegrupo=dw_presolicitudes.GetItemNumber(p_row,'cvegrupo')
	ls_cvematerial=dw_presolicitudes.GetItemString(p_row,'cvematerial')
	ls_num_serie=dw_presolicitudes.GetItemString(p_row,'num_serie')
	
	ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
	li_existe=lds_reservados.Find(ls_find,1,li_row)
	
	if li_existe>0 then return 0

end if

return 1
end function

public function long uf_rechazar (integer p_row);long ll_presol

ll_presol=dw_presolicitudes.GetItemNumber(p_row,'folio')

//Actualizar presolicitud
update dbo.spre_pre_solicitud
set status=2,
fecha_cancelacion=getdate()
where cvedepto=:gi_depto and folio=:ll_presol
using gtr_sumuia;

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
	return -1
end if

//Actualizar presolicitud materiales
update dbo.spre_pre_sol_materiales
set status=2
where cvedepto=:gi_depto and folio=:ll_presol
using gtr_sumuia;

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return -1
end if

commit using gtr_sumuia;	

return 1

end function

on w_ccd_presolicitudes_espacio.create
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

on w_ccd_presolicitudes_espacio.destroy
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

type cb_rechazar from commandbutton within w_ccd_presolicitudes_espacio
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

event clicked;integer li_i, li_click, li_disponible=0, Net
long ll_folio, ll_presol

Net = messagebox("Atención",'¿Desea rechazar las solicitudes marcadas?', Question!, yesno!, 2)
if Net = 1 then 
	for li_i = 1 to dw_presolicitudes.RowCount() 
		li_click=dw_presolicitudes.GetItemNumber(li_i,'cbox')
		ll_presol=dw_presolicitudes.GetItemNumber(li_i,'folio')
		if li_click = 1 then 
			ll_folio = uf_rechazar(li_i)
			if ll_folio > 0 then messagebox('Aviso', 'Pre-solicitud con folio ' + string (ll_presol) + ' ha sido rechazada')
		end if
	next
	uf_actualiza()
end if

end event

type cb_aprobar from commandbutton within w_ccd_presolicitudes_espacio
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

event clicked;integer li_i, li_click, li_disponible=0, Net
long ll_folio, ll_presol

Net = messagebox("Atención",'¿Desea autorizar las solicitudes marcadas?', Question!, yesno!, 2)
if Net = 1 then 
	for li_i = 1 to dw_presolicitudes.RowCount() 
		li_click=dw_presolicitudes.GetItemNumber(li_i,'cbox')
		ll_presol=dw_presolicitudes.GetItemNumber(li_i,'folio')
		if li_click = 1 then 
			//Verificar disponible
			li_disponible=uf_disponible(li_i)
			if li_disponible=1 then		
				ll_folio = uf_aprobar(li_i)
				if ll_folio > 0 then messagebox('Aviso', 'Pre-solicitud con folio ' + string (ll_presol) + ' ha sido aprobada')
			else
				messagebox('Aviso','El espacio para la Pre-solicitud con folio ' + string (ll_presol) +' ya no se encuentra disponible')
			end if	
		end if
	next
	uf_actualiza()
end if	
end event

type cb_buscar from commandbutton within w_ccd_presolicitudes_espacio
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

type st_mensaje from statictext within w_ccd_presolicitudes_espacio
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

type dw_presolicitudes from datawindow within w_ccd_presolicitudes_espacio
integer x = 37
integer y = 275
integer width = 6385
integer height = 2035
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_gen_presolicitudes_espacio"
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

type dw_csal_solicitudes_temporales from datawindow within w_ccd_presolicitudes_espacio
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

type dw_csal_solicitudes_permanente from datawindow within w_ccd_presolicitudes_espacio
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

