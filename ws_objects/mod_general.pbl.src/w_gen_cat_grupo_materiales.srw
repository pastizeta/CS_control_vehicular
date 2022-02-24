$PBExportHeader$w_gen_cat_grupo_materiales.srw
forward
global type w_gen_cat_grupo_materiales from window
end type
type dw_grupo_material from datawindow within w_gen_cat_grupo_materiales
end type
type dw_area from datawindow within w_gen_cat_grupo_materiales
end type
type cb_eliminar from commandbutton within w_gen_cat_grupo_materiales
end type
type cb_actualizar from commandbutton within w_gen_cat_grupo_materiales
end type
type cb_nuevo from commandbutton within w_gen_cat_grupo_materiales
end type
type gb_grupo from groupbox within w_gen_cat_grupo_materiales
end type
type gb_area from groupbox within w_gen_cat_grupo_materiales
end type
end forward

global type w_gen_cat_grupo_materiales from window
integer width = 2608
integer height = 1984
boolean titlebar = true
string title = "Catálogo de Grupo de Materiales"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_grupo_material dw_grupo_material
dw_area dw_area
cb_eliminar cb_eliminar
cb_actualizar cb_actualizar
cb_nuevo cb_nuevo
gb_grupo gb_grupo
gb_area gb_area
end type
global w_gen_cat_grupo_materiales w_gen_cat_grupo_materiales

type variables
integer ii_cvegrupo=0, ii_cvearea, ii_tipo_espacio=0
end variables

forward prototypes
public function integer f_ultimo_grupo ()
end prototypes

public function integer f_ultimo_grupo ();integer li_grupo

	select max(cvegrupo)
	into :li_grupo
	from dbo.spre_grupo_material
	where cvedepto =:gi_depto
	and cvearea =:ii_cvearea
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máximo Grupo de Material", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_grupo) then li_grupo=0

	return(li_grupo)
end function

on w_gen_cat_grupo_materiales.create
this.dw_grupo_material=create dw_grupo_material
this.dw_area=create dw_area
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.gb_grupo=create gb_grupo
this.gb_area=create gb_area
this.Control[]={this.dw_grupo_material,&
this.dw_area,&
this.cb_eliminar,&
this.cb_actualizar,&
this.cb_nuevo,&
this.gb_grupo,&
this.gb_area}
end on

on w_gen_cat_grupo_materiales.destroy
destroy(this.dw_grupo_material)
destroy(this.dw_area)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.gb_grupo)
destroy(this.gb_area)
end on

event open;dw_area.settransobject(gtr_sumuia)
dw_grupo_material.settransobject(gtr_sumuia)

if gi_depto=8 and gi_area=3  then
	dw_grupo_material.object.descripcion_t.text = "Nombre"
	gb_grupo.text='Nombre'
	this.title='Catálogo de Nombres'
end if

//Carga

if gi_areamul=1 then
	ii_cvearea=-1
else
	ii_cvearea=gi_area
end if	

dw_area.Retrieve(gi_depto, ii_cvearea)
if dw_area.RowCount()>0 then dw_area.ScrollToRow(1)

if gi_depto=8 and ii_cvearea=1  then cb_eliminar.enabled=false

end event

type dw_grupo_material from datawindow within w_gen_cat_grupo_materiales
integer x = 55
integer y = 979
integer width = 2410
integer height = 723
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_grupomat_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_cvegrupo=dw_grupo_material.GetItemNumber(currentrow,'cvegrupo')
if (gi_depto=2 and ii_cvearea=1) or (gi_depto=2 and ii_cvearea=2) or (gi_depto=11)then
	//Psicología, CCD
	if ii_cvegrupo=6  then 
		//Espacios
		cb_eliminar.enabled=false 
		cb_actualizar.enabled=false
	else 
		cb_eliminar.enabled=true
		cb_actualizar.enabled=true
	end if
end if


end event

type dw_area from datawindow within w_gen_cat_grupo_materiales
integer x = 55
integer y = 90
integer width = 1880
integer height = 723
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_area"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;
if currentrow>0 then

	ii_cvearea=dw_area.GetItemNumber(currentrow,'cvearea')
	ii_tipo_espacio=dw_area.GetItemNumber(currentrow,'tipo_espacio')
	ii_cvegrupo=0
	
	dw_grupo_material.Reset()
	dw_grupo_material.Retrieve(gi_depto, ii_cvearea)

	if dw_grupo_material.RowCount()>0 then dw_grupo_material.ScrollToRow(1)

end if


end event

type cb_eliminar from commandbutton within w_gen_cat_grupo_materiales
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

if dw_grupo_material.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		li_row=dw_grupo_material.getrow()
		
		if dw_grupo_material.GetItemNumber(li_row,'borrable')=0 then
	
			//Eliminar
	
			update dbo.spre_grupo_material
			set activo=0
			where cvedepto=:gi_depto
			and cvearea=:ii_cvearea
			and cvegrupo=:ii_cvegrupo
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
				rollback using gtr_sumuia;
			else
				messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
				commit using gtr_sumuia;	
			end if		
	
	
			dw_grupo_material.Reset()
			dw_grupo_material.Retrieve(gi_depto, ii_cvearea)
			
		else
			if gi_depto=8 and gi_area=3  then
				messagebox('Aviso','Para borrar la categoría de Nombre, debe borrar primero las categorías de Función que tenga registradas.')
			else
				messagebox('Aviso','Para borrar la categoría de Grupo de Material, debe borrar primero las categorías de Material que tenga registradas.')	
			end if
		end if
		
	end if
		
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_grupo_materiales
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

event clicked;integer li_i, li_grupo, NET

if dw_grupo_material.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		li_grupo=f_ultimo_grupo()
	
		for li_i=1 to dw_grupo_material.RowCount()
			if dw_grupo_material.GetItemNumber(li_i,'activo')=-1 then  
				li_grupo=li_grupo+1
				dw_grupo_material.SetItem(li_i,'cvegrupo',li_grupo)
				dw_grupo_material.SetItem(li_i,'activo',1)
			end if
		next
		
		if dw_grupo_material.update()>0 then
			commit using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
		else
			rollback using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
		end if
		
	end if
	
end if
end event

type cb_nuevo from commandbutton within w_gen_cat_grupo_materiales
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

if gi_depto=8 and ii_cvearea=1 and dw_grupo_material.RowCount()>0  then
	messagebox('Aviso','No puede dar de alta otro Grupo.')
	return
end if

if ii_tipo_espacio=2 then 
	messagebox('Aviso','Para dar de alta un Laboratorio acuda al Catálogo de Áreas.')
	return
end if

dw_grupo_material.setfocus()	

if dw_grupo_material.accepttext()=1 then
	ll_nva_linea=dw_grupo_material.insertrow(0)
	dw_grupo_material.setcolumn(1)
	dw_grupo_material.scrolltorow(ll_nva_linea)
end if

dw_grupo_material.setitem(dw_grupo_material.getrow(),'cvedepto',gi_depto)
dw_grupo_material.setitem(dw_grupo_material.getrow(),'cvearea',ii_cvearea)
dw_grupo_material.setitem(dw_grupo_material.getrow(),'activo',-1)
dw_grupo_material.setitem(dw_grupo_material.getrow(),'borrable',0)
end event

type gb_grupo from groupbox within w_gen_cat_grupo_materiales
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
string text = "Grupo de Materiales"
end type

type gb_area from groupbox within w_gen_cat_grupo_materiales
integer x = 26
integer y = 26
integer width = 1957
integer height = 829
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Área"
end type

