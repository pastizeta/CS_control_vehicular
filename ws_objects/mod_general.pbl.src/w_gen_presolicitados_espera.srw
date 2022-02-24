$PBExportHeader$w_gen_presolicitados_espera.srw
forward
global type w_gen_presolicitados_espera from window
end type
type dw_presolicitados from datawindow within w_gen_presolicitados_espera
end type
end forward

global type w_gen_presolicitados_espera from window
integer width = 3288
integer height = 854
boolean titlebar = true
string title = "Lista de Espera"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_presolicitados dw_presolicitados
end type
global w_gen_presolicitados_espera w_gen_presolicitados_espera

type variables
long il_folio=0
str_pres_control istr_pres_control
end variables

on w_gen_presolicitados_espera.create
this.dw_presolicitados=create dw_presolicitados
this.Control[]={this.dw_presolicitados}
end on

on w_gen_presolicitados_espera.destroy
destroy(this.dw_presolicitados)
end on

event open;str_lista_espera lstr_lista_espera

lstr_lista_espera = message.powerobjectparm

dw_presolicitados.setTransObject(gtr_sumuia)

if dw_presolicitados.Retrieve(lstr_lista_espera.cvedepto,lstr_lista_espera.cvearea,lstr_lista_espera.fecha_inicio,lstr_lista_espera.fecha_final) = 0 then
	close( this)
end if 

end event

event close;CloseWithReturn(w_gen_presolicitados_espera,istr_pres_control)



end event

type dw_presolicitados from datawindow within w_gen_presolicitados_espera
integer x = 15
integer y = 51
integer width = 3174
integer height = 669
integer taborder = 10
string title = "none"
string dataobject = "d_gen_presolicitados_espera"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row>0 then
	istr_pres_control.folio_presol=this.GetItemNumber(row,'spre_pre_solicitud_folio')
	istr_pres_control.solicitanteid=this.GetItemNumber(row,'spre_pre_solicitud_solicitanteid')
	istr_pres_control.tipo_prestamo=this.GetItemNumber(row,'spre_pre_solicitud_tipo_prestamo')
	close(parent)
end if

end event

