$PBExportHeader$w_csal_captura_datos_salon.srw
forward
global type w_csal_captura_datos_salon from window
end type
type cb_mobiliario from commandbutton within w_csal_captura_datos_salon
end type
type cb_refrescar from commandbutton within w_csal_captura_datos_salon
end type
type cb_guardar from commandbutton within w_csal_captura_datos_salon
end type
type sle_salon from singlelineedit within w_csal_captura_datos_salon
end type
type dw_csal_salon_activo from datawindow within w_csal_captura_datos_salon
end type
type sle_uia from singlelineedit within w_csal_captura_datos_salon
end type
type sle_cupo from singlelineedit within w_csal_captura_datos_salon
end type
type gb_cupo from groupbox within w_csal_captura_datos_salon
end type
type gb_uia from groupbox within w_csal_captura_datos_salon
end type
type gb_salon from groupbox within w_csal_captura_datos_salon
end type
end forward

global type w_csal_captura_datos_salon from window
integer width = 4018
integer height = 2432
boolean titlebar = true
string title = "Capturar campos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_mobiliario cb_mobiliario
cb_refrescar cb_refrescar
cb_guardar cb_guardar
sle_salon sle_salon
dw_csal_salon_activo dw_csal_salon_activo
sle_uia sle_uia
sle_cupo sle_cupo
gb_cupo gb_cupo
gb_uia gb_uia
gb_salon gb_salon
end type
global w_csal_captura_datos_salon w_csal_captura_datos_salon

forward prototypes
public subroutine uf_update_datos (integer p_cupo, string p_uia, string p_salon)
end prototypes

public subroutine uf_update_datos (integer p_cupo, string p_uia, string p_salon);
	update salon
	set cupo_real=:p_cupo,
	codigo_uia_proyector=:p_uia
	
	where cve_salon=:p_salon
	using gtr_escolar;
	

if gtr_escolar.sqlcode<>0 then
	messagebox("Error al actualizar los datos"+string(gtr_escolar.sqlcode), gtr_escolar.SQLErrText)	
	rollback using gtr_escolar;
else
	commit using gtr_escolar;
end if							
							
end subroutine

on w_csal_captura_datos_salon.create
this.cb_mobiliario=create cb_mobiliario
this.cb_refrescar=create cb_refrescar
this.cb_guardar=create cb_guardar
this.sle_salon=create sle_salon
this.dw_csal_salon_activo=create dw_csal_salon_activo
this.sle_uia=create sle_uia
this.sle_cupo=create sle_cupo
this.gb_cupo=create gb_cupo
this.gb_uia=create gb_uia
this.gb_salon=create gb_salon
this.Control[]={this.cb_mobiliario,&
this.cb_refrescar,&
this.cb_guardar,&
this.sle_salon,&
this.dw_csal_salon_activo,&
this.sle_uia,&
this.sle_cupo,&
this.gb_cupo,&
this.gb_uia,&
this.gb_salon}
end on

on w_csal_captura_datos_salon.destroy
destroy(this.cb_mobiliario)
destroy(this.cb_refrescar)
destroy(this.cb_guardar)
destroy(this.sle_salon)
destroy(this.dw_csal_salon_activo)
destroy(this.sle_uia)
destroy(this.sle_cupo)
destroy(this.gb_cupo)
destroy(this.gb_uia)
destroy(this.gb_salon)
end on

event open;dw_csal_salon_activo.retrieve()
dw_csal_salon_activo.SetSort("#1A")
dw_csal_salon_activo.Sort()

if dw_csal_salon_activo.rowcount()>0 then dw_csal_salon_activo.SetFocus()


end event

type cb_mobiliario from commandbutton within w_csal_captura_datos_salon
integer x = 2862
integer y = 128
integer width = 562
integer height = 116
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Agregar mobiliario"
end type

event clicked;string ls_salon

ls_salon = sle_salon.text

if ls_salon <> '' then opensheetwithparm(w_csal_salon_mobiliario,ls_salon,w_ppal,0,Original!)
end event

type cb_refrescar from commandbutton within w_csal_captura_datos_salon
integer x = 3447
integer y = 128
integer width = 471
integer height = 116
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Mostrar Todos"
end type

event clicked;sle_salon.text=''
sle_cupo.text=''
sle_uia.text=''
cb_mobiliario.enabled=false

dw_csal_salon_activo.SetFilter( "")
dw_csal_salon_activo.Filter()
dw_csal_salon_activo.SetSort("#1A")
dw_csal_salon_activo.Sort()
end event

type cb_guardar from commandbutton within w_csal_captura_datos_salon
integer x = 2482
integer y = 128
integer width = 352
integer height = 116
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Guardar"
end type

event clicked;string ls_salon, ls_uia, ls_cupo
integer li_cupo=0

ls_salon=trim(sle_salon.text)
ls_uia=trim(sle_uia.text)
ls_cupo=trim(sle_cupo.text)

if isnumber(ls_cupo)=true then li_cupo=integer(ls_cupo)

if ls_salon<>'' then

	if li_cupo=0 and ls_uia='' then
		messagebox("Error","Debe introducir al menos el valor de cupo o de código uia")
	else
		uf_update_datos(li_cupo,ls_uia,ls_salon)
		dw_csal_salon_activo.retrieve()
		cb_mobiliario.enabled=false
	end if
	
else
	messagebox("Error", "Debe seleccionar un salón")
end if
end event

type sle_salon from singlelineedit within w_csal_captura_datos_salon
integer x = 101
integer y = 140
integer width = 411
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;dw_csal_salon_activo.SetFilter( "")
dw_csal_salon_activo.Filter()

dw_csal_salon_activo.SetFilter( "cve_salon='"+trim(this.text)+"'")
dw_csal_salon_activo.Filter()

cb_mobiliario.enabled=true
end event

type dw_csal_salon_activo from datawindow within w_csal_captura_datos_salon
integer x = 59
integer y = 340
integer width = 3863
integer height = 1928
integer taborder = 60
string title = "none"
string dataobject = "d_csal_salon_activo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_escolar)
end event

event clicked;
if row>0  then
	 sle_salon.text=this.GetItemString(row,"cve_salon") 
	 sle_cupo.text=string(this.GetItemNumber(row,"cupo_real")) 
	 sle_uia.text=this.GetItemString(row,"codigo_uia_proyector") 
	 cb_mobiliario.enabled=true
end if
end event

event doubleclicked;string ls_salon

if row>0  then
	 sle_salon.text=this.GetItemString(row,"cve_salon") 
	 sle_cupo.text=string(this.GetItemNumber(row,"cupo_real")) 
	 sle_uia.text=this.GetItemString(row,"codigo_uia_proyector") 
	 cb_mobiliario.enabled=true
	 
	ls_salon = sle_salon.text
	if ls_salon <> '' then opensheetwithparm(w_csal_salon_mobiliario,ls_salon,w_ppal,0,Original!)	 
end if





end event

type sle_uia from singlelineedit within w_csal_captura_datos_salon
integer x = 1221
integer y = 148
integer width = 613
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type sle_cupo from singlelineedit within w_csal_captura_datos_salon
integer x = 663
integer y = 140
integer width = 411
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type gb_cupo from groupbox within w_csal_captura_datos_salon
integer x = 617
integer y = 64
integer width = 512
integer height = 204
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Cupo"
end type

type gb_uia from groupbox within w_csal_captura_datos_salon
integer x = 1175
integer y = 64
integer width = 704
integer height = 204
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Código UIA"
end type

type gb_salon from groupbox within w_csal_captura_datos_salon
integer x = 59
integer y = 64
integer width = 512
integer height = 204
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Salón"
end type

