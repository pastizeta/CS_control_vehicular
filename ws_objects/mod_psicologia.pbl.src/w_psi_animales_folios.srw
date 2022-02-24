$PBExportHeader$w_psi_animales_folios.srw
forward
global type w_psi_animales_folios from window
end type
type dw_solicitudes from datawindow within w_psi_animales_folios
end type
type gb_2 from groupbox within w_psi_animales_folios
end type
end forward

global type w_psi_animales_folios from window
integer y = 19
integer width = 1335
integer height = 1040
boolean titlebar = true
string title = "Folios de asignaciones vigentes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_solicitudes dw_solicitudes
gb_2 gb_2
end type
global w_psi_animales_folios w_psi_animales_folios

type variables
long il_folio=0

str_animales_crias istr_folio



end variables

on w_psi_animales_folios.create
this.dw_solicitudes=create dw_solicitudes
this.gb_2=create gb_2
this.Control[]={this.dw_solicitudes,&
this.gb_2}
end on

on w_psi_animales_folios.destroy
destroy(this.dw_solicitudes)
destroy(this.gb_2)
end on

event open;integer li_carga=0, li_i
string ls_find

istr_folio = message.powerobjectparm

dw_solicitudes.setTransObject(gtr_sumuia)
if dw_solicitudes.Retrieve(istr_folio.tipo_usuario,istr_folio.solicitanteid) > 0 then li_carga=1 

istr_folio.folio=0

if li_carga = 0 then
	close(this)
end if 


end event

event close;CloseWithReturn(w_psi_animales_folios,istr_folio)



end event

type dw_solicitudes from datawindow within w_psi_animales_folios
integer x = 91
integer y = 86
integer width = 1123
integer height = 746
integer taborder = 20
string dataobject = "d_psi_animales_folios_solicitante"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row>0 then
	istr_folio.folio=this.GetItemNumber(row,'folio')
	close(parent)
end if

end event

type gb_2 from groupbox within w_psi_animales_folios
integer x = 37
integer y = 10
integer width = 1240
integer height = 883
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Folios"
end type

