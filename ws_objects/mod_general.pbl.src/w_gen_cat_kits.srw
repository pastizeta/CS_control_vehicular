$PBExportHeader$w_gen_cat_kits.srw
forward
global type w_gen_cat_kits from window
end type
type dw_kit from datawindow within w_gen_cat_kits
end type
type dw_tipo from datawindow within w_gen_cat_kits
end type
type cb_eliminar from commandbutton within w_gen_cat_kits
end type
type cb_actualizar from commandbutton within w_gen_cat_kits
end type
type cb_nuevo from commandbutton within w_gen_cat_kits
end type
type gb_kit from groupbox within w_gen_cat_kits
end type
type gb_tipo from groupbox within w_gen_cat_kits
end type
end forward

global type w_gen_cat_kits from window
integer width = 2608
integer height = 1984
boolean titlebar = true
string title = "Catálogo de Kits"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_kit dw_kit
dw_tipo dw_tipo
cb_eliminar cb_eliminar
cb_actualizar cb_actualizar
cb_nuevo cb_nuevo
gb_kit gb_kit
gb_tipo gb_tipo
end type
global w_gen_cat_kits w_gen_cat_kits

type variables
integer ii_tipo, ii_kit
end variables

forward prototypes
public function integer f_ultimo_kit ()
end prototypes

public function integer f_ultimo_kit ();integer li_kit

	select max(cvekit)
	into :li_kit
	from dbo.spre_materiales_kits
	where cvedepto =:gi_depto
	and cvearea =:gi_area
	and cvetipokit =:ii_tipo
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máximo kit de Material", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_kit) then li_kit=0

	return(li_kit)
end function

on w_gen_cat_kits.create
this.dw_kit=create dw_kit
this.dw_tipo=create dw_tipo
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.gb_kit=create gb_kit
this.gb_tipo=create gb_tipo
this.Control[]={this.dw_kit,&
this.dw_tipo,&
this.cb_eliminar,&
this.cb_actualizar,&
this.cb_nuevo,&
this.gb_kit,&
this.gb_tipo}
end on

on w_gen_cat_kits.destroy
destroy(this.dw_kit)
destroy(this.dw_tipo)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.gb_kit)
destroy(this.gb_tipo)
end on

event open;dw_tipo.settransobject(gtr_sumuia)
dw_kit.settransobject(gtr_sumuia)

dw_tipo.Retrieve(gi_depto,gi_area,ii_tipo)
if dw_tipo.RowCount()>0 then dw_tipo.ScrollToRow(1)



end event

type dw_kit from datawindow within w_gen_cat_kits
integer x = 55
integer y = 979
integer width = 2410
integer height = 723
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_kit_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_kit=dw_kit.GetItemNumber(currentrow,'cvekit')

end event

type dw_tipo from datawindow within w_gen_cat_kits
integer x = 55
integer y = 90
integer width = 2125
integer height = 723
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_tipo_kit_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;
if currentrow>0 then

	ii_tipo=dw_tipo.GetItemNumber(currentrow,'cvetipokit')
	ii_kit=0
	
	dw_kit.Reset()
	dw_kit.Retrieve(gi_depto,gi_area,ii_tipo)

	if dw_kit.RowCount()>0 then dw_kit.ScrollToRow(1)

end if


end event

type cb_eliminar from commandbutton within w_gen_cat_kits
integer x = 2216
integer y = 1766
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

if dw_kit.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		li_row=dw_kit.getrow()
		
			//Eliminar
			update dbo.spre_materiales_kits
			set activo=0
			where cvedepto=:gi_depto and cvearea=:gi_area and cvetipokit=:ii_tipo
			and cvekit=:ii_kit
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
				rollback using gtr_sumuia;
			else
				messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
				commit using gtr_sumuia;	
			end if		
		
		dw_kit.Retrieve(gi_depto,gi_area,ii_tipo)
		if dw_kit.RowCount()>0 then dw_kit.ScrollToRow(1)		

	end if
	
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_kits
integer x = 1909
integer y = 1766
integer width = 300
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

event clicked;integer li_i, li_kit, NET
string ls_descripcion
	
if dw_kit.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		li_kit=f_ultimo_kit()
	
		for li_i=1 to dw_kit.RowCount()

			if dw_kit.GetItemNumber(li_i,'activo')=-1 then  
				li_kit=li_kit+1
				dw_kit.SetItem(li_i,'cvekit',li_kit)
				dw_kit.SetItem(li_i,'activo',1)
			end if
		next
	
		if dw_kit.update()>0 then
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

type cb_nuevo from commandbutton within w_gen_cat_kits
integer x = 1602
integer y = 1766
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

dw_kit.setfocus()	

if dw_kit.accepttext()=1 then
	ll_nva_linea=dw_kit.insertrow(0)
	dw_kit.setcolumn(1)
	dw_kit.scrolltorow(ll_nva_linea)
end if

dw_kit.setitem(dw_kit.getrow(),'cvedepto',gi_depto)
dw_kit.setitem(dw_kit.getrow(),'cvearea',gi_area)
dw_kit.setitem(dw_kit.getrow(),'cvetipokit',ii_tipo)
dw_kit.setitem(dw_kit.getrow(),'activo',-1)
end event

type gb_kit from groupbox within w_gen_cat_kits
integer x = 26
integer y = 918
integer width = 2491
integer height = 829
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Kits"
end type

type gb_tipo from groupbox within w_gen_cat_kits
integer x = 26
integer y = 26
integer width = 2512
integer height = 829
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Tipos de kits"
end type

