$PBExportHeader$w_gen_cat_salon_incidencia.srw
forward
global type w_gen_cat_salon_incidencia from window
end type
type dw_incidencia from datawindow within w_gen_cat_salon_incidencia
end type
type cb_eliminar from commandbutton within w_gen_cat_salon_incidencia
end type
type cb_actualizar from commandbutton within w_gen_cat_salon_incidencia
end type
type cb_nuevo from commandbutton within w_gen_cat_salon_incidencia
end type
type gb_incidencia from groupbox within w_gen_cat_salon_incidencia
end type
end forward

global type w_gen_cat_salon_incidencia from window
integer width = 2319
integer height = 1754
boolean titlebar = true
string title = "Catálogo de incidencias en salones"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_incidencia dw_incidencia
cb_eliminar cb_eliminar
cb_actualizar cb_actualizar
cb_nuevo cb_nuevo
gb_incidencia gb_incidencia
end type
global w_gen_cat_salon_incidencia w_gen_cat_salon_incidencia

type variables
integer ii_incidencia
end variables

forward prototypes
public function integer f_ultimo_tipo ()
end prototypes

public function integer f_ultimo_tipo ();integer li_incidencia

	select max(cve_incidencia)
	into :li_incidencia
	from dbo.spre_cat_incidencias
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máxima incidencia", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_incidencia) then li_incidencia=0

	return(li_incidencia)
end function

on w_gen_cat_salon_incidencia.create
this.dw_incidencia=create dw_incidencia
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.gb_incidencia=create gb_incidencia
this.Control[]={this.dw_incidencia,&
this.cb_eliminar,&
this.cb_actualizar,&
this.cb_nuevo,&
this.gb_incidencia}
end on

on w_gen_cat_salon_incidencia.destroy
destroy(this.dw_incidencia)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.gb_incidencia)
end on

event open;dw_incidencia.settransobject(gtr_sumuia)

dw_incidencia.Retrieve()
if dw_incidencia.RowCount()>0 then dw_incidencia.ScrollToRow(1)

end event

type dw_incidencia from datawindow within w_gen_cat_salon_incidencia
integer x = 73
integer y = 102
integer width = 2110
integer height = 1312
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_salon_incidencia_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_incidencia=dw_incidencia.GetItemNumber(currentrow,'cve_incidencia')
end event

type cb_eliminar from commandbutton within w_gen_cat_salon_incidencia
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

if dw_incidencia.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		li_row=dw_incidencia.getrow()
		
			//Eliminar
			update dbo.spre_cat_incidencias
			set activo=0
			where cve_incidencia=:ii_incidencia
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
				rollback using gtr_sumuia;
			else
				messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
				commit using gtr_sumuia;	
			end if		
		
		dw_incidencia.Retrieve()
		if dw_incidencia.RowCount()>0 then dw_incidencia.ScrollToRow(1)		

	end if
	
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_salon_incidencia
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

event clicked;integer li_i, li_incidencia, NET
string ls_descripcion
	
if dw_incidencia.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		li_incidencia=f_ultimo_tipo()
	
		for li_i=1 to dw_incidencia.RowCount()

			if dw_incidencia.GetItemNumber(li_i,'activo')=-1 then  
				li_incidencia=li_incidencia+1
				dw_incidencia.SetItem(li_i,'cve_incidencia',li_incidencia)
				dw_incidencia.SetItem(li_i,'activo',1)
			end if
		next
	
		if dw_incidencia.update()>0 then
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

type cb_nuevo from commandbutton within w_gen_cat_salon_incidencia
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

dw_incidencia.setfocus()	

if dw_incidencia.accepttext()=1 then
	ll_nva_linea=dw_incidencia.insertrow(0)
	dw_incidencia.setcolumn(1)
	dw_incidencia.scrolltorow(ll_nva_linea)
end if

dw_incidencia.setitem(dw_incidencia.getrow(),'activo',-1)
	

end event

type gb_incidencia from groupbox within w_gen_cat_salon_incidencia
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
string text = "Incidencia en salones"
end type

