$PBExportHeader$w_psi_cat_pruebas.srw
forward
global type w_psi_cat_pruebas from window
end type
type dw_prueba from datawindow within w_psi_cat_pruebas
end type
type cb_actualizar from commandbutton within w_psi_cat_pruebas
end type
type cb_nuevo from commandbutton within w_psi_cat_pruebas
end type
type gb_prueba from groupbox within w_psi_cat_pruebas
end type
end forward

global type w_psi_cat_pruebas from window
integer width = 2498
integer height = 1725
boolean titlebar = true
string title = "Catálogo de Pruebas Psicológicas"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_prueba dw_prueba
cb_actualizar cb_actualizar
cb_nuevo cb_nuevo
gb_prueba gb_prueba
end type
global w_psi_cat_pruebas w_psi_cat_pruebas

type variables
integer ii_prueba
end variables

forward prototypes
public function integer f_ultima_prueba ()
end prototypes

public function integer f_ultima_prueba ();integer li_id

	select max(id)
	into :li_id
	from dbo.spre_cat_pruebas
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máxima Prueba", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_id) then li_id=0

	return(li_id)
end function

on w_psi_cat_pruebas.create
this.dw_prueba=create dw_prueba
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.gb_prueba=create gb_prueba
this.Control[]={this.dw_prueba,&
this.cb_actualizar,&
this.cb_nuevo,&
this.gb_prueba}
end on

on w_psi_cat_pruebas.destroy
destroy(this.dw_prueba)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.gb_prueba)
end on

event open;dw_prueba.settransobject(gtr_sumuia)

dw_prueba.Retrieve()
if dw_prueba.RowCount()>0 then dw_prueba.ScrollToRow(1)

end event

type dw_prueba from datawindow within w_psi_cat_pruebas
integer x = 73
integer y = 102
integer width = 2308
integer height = 1312
integer taborder = 10
string title = "none"
string dataobject = "d_psi_cat_pruebas_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_prueba=dw_prueba.GetItemNumber(currentrow,'id')
end event

type cb_actualizar from commandbutton within w_psi_cat_pruebas
integer x = 2110
integer y = 1507
integer width = 322
integer height = 99
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar"
end type

event clicked;integer li_nprueba, li_tipo, li_i, Net, li_prueba
	
if dw_prueba.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		li_prueba=f_ultima_prueba()
		
	
		for li_i=1 to dw_prueba.RowCount()
			if dw_prueba.GetItemNumber(li_i,'id')=0 then  
				li_prueba=li_prueba+1
				li_nprueba=li_prueba
				 dw_prueba.SetItem(li_i,'id',li_nprueba)
			end if
		next
	
		if dw_prueba.update()>0 then
			commit using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
		else
			rollback using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
		end if
		
		cb_nuevo.enabled=true
	
	end if

end if
	
end event

type cb_nuevo from commandbutton within w_psi_cat_pruebas
integer x = 1814
integer y = 1507
integer width = 300
integer height = 99
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Nuevo"
end type

event clicked;long ll_nva_linea

cb_nuevo.enabled=false

dw_prueba.setfocus()	

if dw_prueba.accepttext()=1 then
	ll_nva_linea=dw_prueba.insertrow(0)
	dw_prueba.setcolumn(1)
	dw_prueba.scrolltorow(ll_nva_linea)
end if

dw_prueba.setitem(dw_prueba.getrow(),'borrado',0)
dw_prueba.setitem(dw_prueba.getrow(),'id',0)
	

end event

type gb_prueba from groupbox within w_psi_cat_pruebas
integer x = 33
integer y = 35
integer width = 2395
integer height = 1421
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Pruebas Psicológicas"
end type

