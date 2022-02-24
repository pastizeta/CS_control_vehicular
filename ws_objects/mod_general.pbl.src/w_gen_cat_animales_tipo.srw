$PBExportHeader$w_gen_cat_animales_tipo.srw
forward
global type w_gen_cat_animales_tipo from window
end type
type dw_tipo from datawindow within w_gen_cat_animales_tipo
end type
type cb_eliminar from commandbutton within w_gen_cat_animales_tipo
end type
type cb_actualizar from commandbutton within w_gen_cat_animales_tipo
end type
type cb_nuevo from commandbutton within w_gen_cat_animales_tipo
end type
type gb_tipo from groupbox within w_gen_cat_animales_tipo
end type
end forward

global type w_gen_cat_animales_tipo from window
integer width = 1785
integer height = 1754
boolean titlebar = true
string title = "Catálogo de Tipos de animales"
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
gb_tipo gb_tipo
end type
global w_gen_cat_animales_tipo w_gen_cat_animales_tipo

type variables
integer ii_cvetipo
end variables

forward prototypes
public function integer f_ultimo_tipo ()
end prototypes

public function integer f_ultimo_tipo ();integer li_tipo

	select max(cvetipo)
	into :li_tipo
	from dbo.spre_animales_tipo
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máxima tipo", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_tipo) then li_tipo=0

	return(li_tipo)
end function

on w_gen_cat_animales_tipo.create
this.dw_tipo=create dw_tipo
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.gb_tipo=create gb_tipo
this.Control[]={this.dw_tipo,&
this.cb_eliminar,&
this.cb_actualizar,&
this.cb_nuevo,&
this.gb_tipo}
end on

on w_gen_cat_animales_tipo.destroy
destroy(this.dw_tipo)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.gb_tipo)
end on

event open;dw_tipo.settransobject(gtr_sumuia)

dw_tipo.Retrieve(gi_depto)
if dw_tipo.RowCount()>0 then dw_tipo.ScrollToRow(1)

end event

type dw_tipo from datawindow within w_gen_cat_animales_tipo
integer x = 73
integer y = 102
integer width = 1532
integer height = 1312
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_animales_tipo_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_cvetipo=dw_tipo.GetItemNumber(currentrow,'cvetipo')
end event

type cb_eliminar from commandbutton within w_gen_cat_animales_tipo
integer x = 1371
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

if dw_tipo.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		li_row=dw_tipo.getrow()
		
			//Eliminar
			update dbo.spre_animales_tipo
			set activo=0
			where cvetipo=:ii_cvetipo
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
				rollback using gtr_sumuia;
			else
				messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
				commit using gtr_sumuia;	
			end if		
		
		dw_tipo.Retrieve(gi_depto)
		if dw_tipo.RowCount()>0 then dw_tipo.ScrollToRow(1)		

	end if
	
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_animales_tipo
integer x = 1053
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

event clicked;integer li_i, li_tipo, NET
string ls_descripcion
	
if dw_tipo.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		li_tipo=f_ultimo_tipo()
	
		for li_i=1 to dw_tipo.RowCount()

			if dw_tipo.GetItemNumber(li_i,'activo')=-1 then  
				li_tipo=li_tipo+1
				dw_tipo.SetItem(li_i,'cvetipo',li_tipo)
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

type cb_nuevo from commandbutton within w_gen_cat_animales_tipo
integer x = 757
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

dw_tipo.setfocus()	

if dw_tipo.accepttext()=1 then
	ll_nva_linea=dw_tipo.insertrow(0)
	dw_tipo.setcolumn(1)
	dw_tipo.scrolltorow(ll_nva_linea)
end if

dw_tipo.setitem(dw_tipo.getrow(),'activo',-1)
	

end event

type gb_tipo from groupbox within w_gen_cat_animales_tipo
integer x = 33
integer y = 35
integer width = 1646
integer height = 1434
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Tipo de animales"
end type

