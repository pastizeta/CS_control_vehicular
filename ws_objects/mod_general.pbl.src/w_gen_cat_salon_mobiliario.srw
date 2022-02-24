$PBExportHeader$w_gen_cat_salon_mobiliario.srw
forward
global type w_gen_cat_salon_mobiliario from window
end type
type dw_mobiliario from datawindow within w_gen_cat_salon_mobiliario
end type
type cb_eliminar from commandbutton within w_gen_cat_salon_mobiliario
end type
type cb_actualizar from commandbutton within w_gen_cat_salon_mobiliario
end type
type cb_nuevo from commandbutton within w_gen_cat_salon_mobiliario
end type
type gb_mobiliario from groupbox within w_gen_cat_salon_mobiliario
end type
end forward

global type w_gen_cat_salon_mobiliario from window
integer width = 2319
integer height = 1754
boolean titlebar = true
string title = "Catálogo de mobiliario de salones"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_mobiliario dw_mobiliario
cb_eliminar cb_eliminar
cb_actualizar cb_actualizar
cb_nuevo cb_nuevo
gb_mobiliario gb_mobiliario
end type
global w_gen_cat_salon_mobiliario w_gen_cat_salon_mobiliario

type variables
integer ii_mobiliario
end variables

forward prototypes
public function integer f_ultimo_tipo ()
end prototypes

public function integer f_ultimo_tipo ();integer li_mobiliario

	select max(cve_mobiliario)
	into :li_mobiliario
	from dbo.salon_catalogo_mobiliario
	using gtr_escolar; 
	
	if gtr_escolar.SQLCode = -1 then 
		messagebox("Error ESCOLAR: Obtener máxima mobiliario", gtr_escolar.SQLErrText)	
		rollback using gtr_escolar;
		return -1
	else
		commit using gtr_escolar;	
	end if
	
	if isNull(li_mobiliario) then li_mobiliario=0

	return(li_mobiliario)
end function

on w_gen_cat_salon_mobiliario.create
this.dw_mobiliario=create dw_mobiliario
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.gb_mobiliario=create gb_mobiliario
this.Control[]={this.dw_mobiliario,&
this.cb_eliminar,&
this.cb_actualizar,&
this.cb_nuevo,&
this.gb_mobiliario}
end on

on w_gen_cat_salon_mobiliario.destroy
destroy(this.dw_mobiliario)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.gb_mobiliario)
end on

event open;dw_mobiliario.settransobject(gtr_escolar)

dw_mobiliario.Retrieve()
if dw_mobiliario.RowCount()>0 then dw_mobiliario.ScrollToRow(1)

end event

type dw_mobiliario from datawindow within w_gen_cat_salon_mobiliario
integer x = 73
integer y = 102
integer width = 2110
integer height = 1312
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_salon_mobiliario_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_mobiliario=dw_mobiliario.GetItemNumber(currentrow,'cve_mobiliario')
end event

type cb_eliminar from commandbutton within w_gen_cat_salon_mobiliario
integer x = 1891
integer y = 1530
integer width = 300
integer height = 99
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Eliminar"
end type

event clicked;integer li_row, NET

if dw_mobiliario.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		li_row=dw_mobiliario.getrow()
		
			//Eliminar
			update dbo.salon_catalogo_mobiliario
			set activo=0
			where cve_mobiliario=:ii_mobiliario
			using gtr_escolar;
			
			if gtr_escolar.SQLCode = -1 then 
				messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
				rollback using gtr_escolar;
			else
				messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
				commit using gtr_escolar;	
			end if		
		
		dw_mobiliario.Retrieve()
		if dw_mobiliario.RowCount()>0 then dw_mobiliario.ScrollToRow(1)		

	end if
	
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_salon_mobiliario
integer x = 1562
integer y = 1530
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

event clicked;integer li_i, li_mobiliario, NET
string ls_descripcion
	
if dw_mobiliario.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		li_mobiliario=f_ultimo_tipo()
	
		for li_i=1 to dw_mobiliario.RowCount()

			if dw_mobiliario.GetItemNumber(li_i,'activo')=-1 then  
				li_mobiliario=li_mobiliario+1
				dw_mobiliario.SetItem(li_i,'cve_mobiliario',li_mobiliario)
				dw_mobiliario.SetItem(li_i,'activo',1)
			end if
		next
	
		if dw_mobiliario.update()>0 then
			commit using gtr_escolar;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
		else
			rollback using gtr_escolar;
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
		end if
		
		cb_nuevo.enabled=true
	
	end if

end if
	
end event

type cb_nuevo from commandbutton within w_gen_cat_salon_mobiliario
integer x = 1254
integer y = 1530
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

dw_mobiliario.setfocus()	

if dw_mobiliario.accepttext()=1 then
	ll_nva_linea=dw_mobiliario.insertrow(0)
	dw_mobiliario.setcolumn(1)
	dw_mobiliario.scrolltorow(ll_nva_linea)
end if

dw_mobiliario.setitem(dw_mobiliario.getrow(),'activo',-1)
	

end event

type gb_mobiliario from groupbox within w_gen_cat_salon_mobiliario
integer x = 33
integer y = 35
integer width = 2209
integer height = 1434
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Mobiliario de salones"
end type

