$PBExportHeader$w_gen_cat_tipo_kit.srw
forward
global type w_gen_cat_tipo_kit from window
end type
type dw_tipo from datawindow within w_gen_cat_tipo_kit
end type
type cb_eliminar from commandbutton within w_gen_cat_tipo_kit
end type
type cb_actualizar from commandbutton within w_gen_cat_tipo_kit
end type
type cb_nuevo from commandbutton within w_gen_cat_tipo_kit
end type
type gb_kit from groupbox within w_gen_cat_tipo_kit
end type
end forward

global type w_gen_cat_tipo_kit from window
integer width = 2319
integer height = 1754
boolean titlebar = true
string title = "Catálogo de tipos de kit"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_tipo dw_tipo
cb_eliminar cb_eliminar
cb_actualizar cb_actualizar
cb_nuevo cb_nuevo
gb_kit gb_kit
end type
global w_gen_cat_tipo_kit w_gen_cat_tipo_kit

type variables
integer ii_tipo
end variables

forward prototypes
public function integer f_ultimo_tipo ()
end prototypes

public function integer f_ultimo_tipo ();integer li_tipo

	select max(cvetipokit)
	into :li_tipo
	from dbo.spre_materiales_tipo_kit
	where cvedepto=:gi_depto
	and cvearea=:gi_area
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máxima tipo de kit", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_tipo) then li_tipo=0

	return(li_tipo)
end function

on w_gen_cat_tipo_kit.create
this.dw_tipo=create dw_tipo
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.gb_kit=create gb_kit
this.Control[]={this.dw_tipo,&
this.cb_eliminar,&
this.cb_actualizar,&
this.cb_nuevo,&
this.gb_kit}
end on

on w_gen_cat_tipo_kit.destroy
destroy(this.dw_tipo)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.gb_kit)
end on

event open;dw_tipo.settransobject(gtr_sumuia)

dw_tipo.Retrieve(gi_depto,gi_area)
if dw_tipo.RowCount()>0 then dw_tipo.ScrollToRow(1)

end event

type dw_tipo from datawindow within w_gen_cat_tipo_kit
integer x = 73
integer y = 102
integer width = 2110
integer height = 1312
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_tipo_kit_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_tipo=dw_tipo.GetItemNumber(currentrow,'cvetipokit')
end event

type cb_eliminar from commandbutton within w_gen_cat_tipo_kit
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

if dw_tipo.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		li_row=dw_tipo.getrow()
		
			//Eliminar
			update dbo.spre_materiales_tipo_kit
			set activo=0
			where cvedepto=:gi_depto and cvearea=:gi_area and cvetipokit=:ii_tipo
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
				rollback using gtr_sumuia;
			else
				messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
				commit using gtr_sumuia;	
			end if		
		
		dw_tipo.Retrieve(gi_depto,gi_area)
		if dw_tipo.RowCount()>0 then dw_tipo.ScrollToRow(1)		

	end if
	
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_tipo_kit
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

event clicked;integer li_i, li_tipo, NET
string ls_descripcion
	
if dw_tipo.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		li_tipo=f_ultimo_tipo()
	
		for li_i=1 to dw_tipo.RowCount()

			if dw_tipo.GetItemNumber(li_i,'activo')=-1 then  
				li_tipo=li_tipo+1
				dw_tipo.SetItem(li_i,'cvetipokit',li_tipo)
				dw_tipo.SetItem(li_i,'activo',1)
			end if
		next
	
		if dw_tipo.update()>0 then
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

type cb_nuevo from commandbutton within w_gen_cat_tipo_kit
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

dw_tipo.setfocus()	

if dw_tipo.accepttext()=1 then
	ll_nva_linea=dw_tipo.insertrow(0)
	dw_tipo.setcolumn(1)
	dw_tipo.scrolltorow(ll_nva_linea)
end if

dw_tipo.setitem(dw_tipo.getrow(),'cvedepto',gi_depto)
dw_tipo.setitem(dw_tipo.getrow(),'cvearea',gi_area)
dw_tipo.setitem(dw_tipo.getrow(),'activo',-1)
	

end event

type gb_kit from groupbox within w_gen_cat_tipo_kit
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
string text = "Tipos de kit"
end type

