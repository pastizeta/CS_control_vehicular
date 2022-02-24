$PBExportHeader$w_gen_cat_animales_proveedor.srw
forward
global type w_gen_cat_animales_proveedor from window
end type
type dw_proveedor from datawindow within w_gen_cat_animales_proveedor
end type
type cb_eliminar from commandbutton within w_gen_cat_animales_proveedor
end type
type cb_actualizar from commandbutton within w_gen_cat_animales_proveedor
end type
type cb_nuevo from commandbutton within w_gen_cat_animales_proveedor
end type
type gb_proveedor from groupbox within w_gen_cat_animales_proveedor
end type
end forward

global type w_gen_cat_animales_proveedor from window
integer width = 1843
integer height = 1754
boolean titlebar = true
string title = "Catálogo de Proveedores de animales"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_proveedor dw_proveedor
cb_eliminar cb_eliminar
cb_actualizar cb_actualizar
cb_nuevo cb_nuevo
gb_proveedor gb_proveedor
end type
global w_gen_cat_animales_proveedor w_gen_cat_animales_proveedor

type variables
integer ii_cveproveedor
end variables

forward prototypes
public function integer f_ultimo_proveedor ()
end prototypes

public function integer f_ultimo_proveedor ();integer li_proveedor

	select max(cveproveedor)
	into :li_proveedor
	from dbo.spre_animales_proveedores
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máxima proveedor", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_proveedor) then li_proveedor=0

	return(li_proveedor)
end function

on w_gen_cat_animales_proveedor.create
this.dw_proveedor=create dw_proveedor
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.gb_proveedor=create gb_proveedor
this.Control[]={this.dw_proveedor,&
this.cb_eliminar,&
this.cb_actualizar,&
this.cb_nuevo,&
this.gb_proveedor}
end on

on w_gen_cat_animales_proveedor.destroy
destroy(this.dw_proveedor)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.gb_proveedor)
end on

event open;dw_proveedor.settransobject(gtr_sumuia)

dw_proveedor.Retrieve(gi_depto)
if dw_proveedor.RowCount()>0 then dw_proveedor.ScrollToRow(1)

end event

type dw_proveedor from datawindow within w_gen_cat_animales_proveedor
integer x = 73
integer y = 102
integer width = 1653
integer height = 1312
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_animales_proveedor_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_cveproveedor=dw_proveedor.GetItemNumber(currentrow,'cveproveedor')
end event

type cb_eliminar from commandbutton within w_gen_cat_animales_proveedor
integer x = 1481
integer y = 1546
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

if dw_proveedor.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		li_row=dw_proveedor.getrow()
		
			//Eliminar
			update dbo.spre_animales_proveedores
			set activo=0
			where cveproveedor=:ii_cveproveedor
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
				rollback using gtr_sumuia;
			else
				messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
				commit using gtr_sumuia;	
			end if		
		
		dw_proveedor.Retrieve(gi_depto)
		if dw_proveedor.RowCount()>0 then dw_proveedor.ScrollToRow(1)		

	end if
	
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_animales_proveedor
integer x = 1163
integer y = 1546
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

event clicked;integer li_i, li_proveedor, NET
string ls_descripcion
	
if dw_proveedor.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		li_proveedor=f_ultimo_proveedor()
	
		for li_i=1 to dw_proveedor.RowCount()

			if dw_proveedor.GetItemNumber(li_i,'activo')=-1 then  
				li_proveedor=li_proveedor+1
				dw_proveedor.SetItem(li_i,'cveproveedor',li_proveedor)
				dw_proveedor.SetItem(li_i,'activo',1)
			end if
		next
	
		if dw_proveedor.update()>0 then
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

type cb_nuevo from commandbutton within w_gen_cat_animales_proveedor
integer x = 867
integer y = 1546
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

dw_proveedor.setfocus()	

if dw_proveedor.accepttext()=1 then
	ll_nva_linea=dw_proveedor.insertrow(0)
	dw_proveedor.setcolumn(1)
	dw_proveedor.scrolltorow(ll_nva_linea)
end if

dw_proveedor.setitem(dw_proveedor.getrow(),'activo',-1)
	

end event

type gb_proveedor from groupbox within w_gen_cat_animales_proveedor
integer x = 33
integer y = 35
integer width = 1741
integer height = 1434
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Proveedores de animales"
end type

