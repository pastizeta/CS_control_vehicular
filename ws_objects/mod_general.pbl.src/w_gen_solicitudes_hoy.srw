$PBExportHeader$w_gen_solicitudes_hoy.srw
forward
global type w_gen_solicitudes_hoy from window
end type
type dw_vencidas from datawindow within w_gen_solicitudes_hoy
end type
type dw_solicitudes from datawindow within w_gen_solicitudes_hoy
end type
type dw_presolicitudes from datawindow within w_gen_solicitudes_hoy
end type
type gb_1 from groupbox within w_gen_solicitudes_hoy
end type
type gb_3 from groupbox within w_gen_solicitudes_hoy
end type
type gb_2 from groupbox within w_gen_solicitudes_hoy
end type
end forward

global type w_gen_solicitudes_hoy from window
integer width = 2743
integer height = 2515
boolean titlebar = true
string title = "Solicitudes y Presolicitudes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_vencidas dw_vencidas
dw_solicitudes dw_solicitudes
dw_presolicitudes dw_presolicitudes
gb_1 gb_1
gb_3 gb_3
gb_2 gb_2
end type
global w_gen_solicitudes_hoy w_gen_solicitudes_hoy

type variables
long il_folio=0, il_folio_presol
integer vencido=0

str_sol_material istr_sol_material
end variables

on w_gen_solicitudes_hoy.create
this.dw_vencidas=create dw_vencidas
this.dw_solicitudes=create dw_solicitudes
this.dw_presolicitudes=create dw_presolicitudes
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.Control[]={this.dw_vencidas,&
this.dw_solicitudes,&
this.dw_presolicitudes,&
this.gb_1,&
this.gb_3,&
this.gb_2}
end on

on w_gen_solicitudes_hoy.destroy
destroy(this.dw_vencidas)
destroy(this.dw_solicitudes)
destroy(this.dw_presolicitudes)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_2)
end on

event open;integer li_carga=0
string ls_find
str_sol_material lstr_sol_material

lstr_sol_material = message.powerobjectparm

dw_presolicitudes.setTransObject(gtr_sumuia)
dw_solicitudes.setTransObject(gtr_sumuia)
dw_vencidas.setTransObject(gtr_sumuia)

if dw_presolicitudes.Retrieve(lstr_sol_material.cvedepto,lstr_sol_material.cvearea,lstr_sol_material.tipo_usuario,lstr_sol_material.solicitanteid) > 0 then li_carga=1 
if dw_solicitudes.Retrieve(lstr_sol_material.cvedepto,lstr_sol_material.cvearea,lstr_sol_material.tipo_usuario,lstr_sol_material.solicitanteid) > 0 then li_carga=1 

if dw_vencidas.Retrieve(lstr_sol_material.cvedepto,lstr_sol_material.cvearea,lstr_sol_material.tipo_usuario,lstr_sol_material.solicitanteid) > 0 then li_carga=1 

istr_sol_material.folio_presol=0
istr_sol_material.folio_solicitud=0
istr_sol_material.multa=0
istr_sol_material.status=0

if li_carga = 0 then
	close(this)
else

	if dw_vencidas.RowCount()>0 then
		ls_find="spre_solicitud_status=3"
		if dw_vencidas.Find(ls_find,1,dw_vencidas.RowCount())>0 then istr_sol_material.multa=1
	end if
		
end if 



end event

event close;CloseWithReturn(w_gen_solicitudes_hoy,istr_sol_material)



end event

type dw_vencidas from datawindow within w_gen_solicitudes_hoy
integer x = 77
integer y = 1718
integer width = 2538
integer height = 618
integer taborder = 30
string title = "none"
string dataobject = "d_gen_solicitudes_vencidas_hoy"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;
if row>0 then
	istr_sol_material.folio_presol=this.GetItemNumber(row,'spre_pre_solicitud_folio_presol')
	istr_sol_material.folio_solicitud=this.GetItemNumber(row,'spre_solicitud_folio')
	istr_sol_material.status=this.GetItemNumber(row,'spre_solicitud_status')
	close(parent)
end if

end event

type dw_solicitudes from datawindow within w_gen_solicitudes_hoy
integer x = 77
integer y = 938
integer width = 2538
integer height = 618
integer taborder = 20
string title = "none"
string dataobject = "d_gen_solicitudes_abiertas_hoy"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;
if row>0 then
	istr_sol_material.folio_presol=this.GetItemNumber(row,'spre_pre_solicitud_folio_presol')
	istr_sol_material.folio_solicitud=this.GetItemNumber(row,'spre_solicitud_folio')
	istr_sol_material.status=1
	close(parent)
end if

end event

type dw_presolicitudes from datawindow within w_gen_solicitudes_hoy
integer x = 77
integer y = 147
integer width = 2538
integer height = 618
integer taborder = 10
string title = "none"
string dataobject = "d_gen_presolicitudes_hoy"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;
if row>0 then
	if this.GetItemNumber(row,'autorizada')=0 then 
		messagebox('Aviso','Esta PreSolicitud debe ser aprobada primero.')
	else
		istr_sol_material.folio_presol=this.GetItemNumber(row,'spre_pre_solicitud_folio')
		istr_sol_material.folio_solicitud=0
		close(parent)
	end if
end if

end event

type gb_1 from groupbox within w_gen_solicitudes_hoy
integer x = 37
integer y = 58
integer width = 2651
integer height = 768
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "PreSolicitudes"
end type

type gb_3 from groupbox within w_gen_solicitudes_hoy
integer x = 37
integer y = 1632
integer width = 2651
integer height = 768
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Solicitudes Vencidas"
end type

type gb_2 from groupbox within w_gen_solicitudes_hoy
integer x = 37
integer y = 845
integer width = 2651
integer height = 768
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Solicitudes Vigentes"
end type

