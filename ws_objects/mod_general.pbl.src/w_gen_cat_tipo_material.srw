$PBExportHeader$w_gen_cat_tipo_material.srw
forward
global type w_gen_cat_tipo_material from window
end type
type cb_nuevo2 from commandbutton within w_gen_cat_tipo_material
end type
type dw_tamano_material from datawindow within w_gen_cat_tipo_material
end type
type cb_actualizar2 from commandbutton within w_gen_cat_tipo_material
end type
type cb_eliminar2 from commandbutton within w_gen_cat_tipo_material
end type
type cb_eliminar from commandbutton within w_gen_cat_tipo_material
end type
type cb_actualizar from commandbutton within w_gen_cat_tipo_material
end type
type dw_tipo_material from datawindow within w_gen_cat_tipo_material
end type
type cb_nuevo from commandbutton within w_gen_cat_tipo_material
end type
type dw_materiales from datawindow within w_gen_cat_tipo_material
end type
type dw_grupo_material from datawindow within w_gen_cat_tipo_material
end type
type gb_2 from groupbox within w_gen_cat_tipo_material
end type
type gb_1 from groupbox within w_gen_cat_tipo_material
end type
type gb_3 from groupbox within w_gen_cat_tipo_material
end type
type gb_4 from groupbox within w_gen_cat_tipo_material
end type
end forward

global type w_gen_cat_tipo_material from window
integer width = 4385
integer height = 2074
boolean titlebar = true
string title = "Catálogo de Tipos y Tamaños"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_nuevo2 cb_nuevo2
dw_tamano_material dw_tamano_material
cb_actualizar2 cb_actualizar2
cb_eliminar2 cb_eliminar2
cb_eliminar cb_eliminar
cb_actualizar cb_actualizar
dw_tipo_material dw_tipo_material
cb_nuevo cb_nuevo
dw_materiales dw_materiales
dw_grupo_material dw_grupo_material
gb_2 gb_2
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
end type
global w_gen_cat_tipo_material w_gen_cat_tipo_material

type variables
string is_cvematerial=''
integer ii_cvegrupo=0, ii_cvetipo=0, ii_cvetamano=0
end variables

forward prototypes
public function integer f_ultimo_tamano ()
public function integer f_ultimo_tipo ()
end prototypes

public function integer f_ultimo_tamano ();integer li_tamano

	select max(cvetamano)
	into :li_tamano
	from dbo.spre_tamano_materiales
	where cvedepto =:gi_depto
	and cvearea =:gi_area
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máximo Tamaño de Material", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_tamano) then li_tamano=0

	return(li_tamano)
end function

public function integer f_ultimo_tipo ();integer li_tipo

	select max(cvetipo)
	into :li_tipo
	from dbo.spre_tipo_materiales
	where cvedepto =:gi_depto
	and cvearea =:gi_area
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máximo Tipo de Material", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_tipo) then li_tipo=0

	return(li_tipo)
end function

on w_gen_cat_tipo_material.create
this.cb_nuevo2=create cb_nuevo2
this.dw_tamano_material=create dw_tamano_material
this.cb_actualizar2=create cb_actualizar2
this.cb_eliminar2=create cb_eliminar2
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.dw_tipo_material=create dw_tipo_material
this.cb_nuevo=create cb_nuevo
this.dw_materiales=create dw_materiales
this.dw_grupo_material=create dw_grupo_material
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.cb_nuevo2,&
this.dw_tamano_material,&
this.cb_actualizar2,&
this.cb_eliminar2,&
this.cb_eliminar,&
this.cb_actualizar,&
this.dw_tipo_material,&
this.cb_nuevo,&
this.dw_materiales,&
this.dw_grupo_material,&
this.gb_2,&
this.gb_1,&
this.gb_3,&
this.gb_4}
end on

on w_gen_cat_tipo_material.destroy
destroy(this.cb_nuevo2)
destroy(this.dw_tamano_material)
destroy(this.cb_actualizar2)
destroy(this.cb_eliminar2)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.dw_tipo_material)
destroy(this.cb_nuevo)
destroy(this.dw_materiales)
destroy(this.dw_grupo_material)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;dw_grupo_material.settransobject(gtr_sumuia)
dw_materiales.settransobject(gtr_sumuia)
dw_tipo_material.settransobject(gtr_sumuia)
dw_tamano_material.settransobject(gtr_sumuia)

if gi_depto=8 and gi_area=3  then
	dw_grupo_material.object.descripcion_t.text = "Nombre"
	dw_materiales.object.descripcion_t.text = "Función"
	dw_tipo_material.object.cvegrupo_t.text= "Nombre"
	dw_tipo_material.object.cvematerial_t.text= "Función"
	dw_tamano_material.object.cvegrupo_t.text= "Nombre"
	dw_tamano_material.object.cvematerial_t.text= "Función"
end if

//Carga

dw_grupo_material.Retrieve(gi_depto, gi_area)

if dw_grupo_material.RowCount()>0 then dw_grupo_material.ScrollToRow(1)


end event

type cb_nuevo2 from commandbutton within w_gen_cat_tipo_material
integer x = 3379
integer y = 1818
integer width = 300
integer height = 99
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Nuevo"
end type

event clicked;integer li_guardado, li_i
string ls_descripcion

if ii_cvegrupo>0 and is_cvematerial<>'' and ii_cvetipo>0 then

	li_guardado=dw_tipo_material.GetItemNumber(dw_tipo_material.getrow(),'activo')
	
	if li_guardado=-1 then
		messagebox('Aviso','No puede agregar un registro si el Tipo de Material seleccionado no ha sido guardado.',stopsign!)
		return
	end if
	
	long ll_nva_linea
	dw_tamano_material.setfocus()		
	if dw_tamano_material.accepttext()=1 then
		ll_nva_linea=dw_tamano_material.insertrow(0)
		dw_tamano_material.setcolumn(1)
		dw_tamano_material.scrolltorow(ll_nva_linea)
	end if
	
	dw_tamano_material.setitem(dw_tamano_material.getrow(),'cvedepto',gi_depto)
	dw_tamano_material.setitem(dw_tamano_material.getrow(),'cvearea',gi_area)
	dw_tamano_material.setitem(dw_tamano_material.getrow(),'cvegrupo',ii_cvegrupo)
	dw_tamano_material.setitem(dw_tamano_material.getrow(),'cvematerial',is_cvematerial)
	dw_tamano_material.setitem(dw_tamano_material.getrow(),'cvetipo',ii_cvetipo)
	dw_tamano_material.setitem(dw_tamano_material.getrow(),'activo',-1)
	
else
	if gi_depto=8 and gi_area=3  then
		messagebox('Atención','Debe seleccionar las categorías de Nombre, Función y Tipo.')
	else
		messagebox('Atención','Debe seleccionar las categorías de Grupo, Material y Tipo.')
	end if
end if
end event

type dw_tamano_material from datawindow within w_gen_cat_tipo_material
integer x = 2117
integer y = 1008
integer width = 2169
integer height = 781
integer taborder = 20
string title = "none"
string dataobject = "d_gen_cat_tamano_material_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then
	ii_cvetamano=dw_tamano_material.GetItemNumber(currentrow,'cvetamano')
end if

end event

type cb_actualizar2 from commandbutton within w_gen_cat_tipo_material
integer x = 3686
integer y = 1818
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

event clicked;integer li_i, li_tamano
string ls_descripcion

if dw_tamano_material.RowCount()>0 then

	li_tamano=f_ultimo_tamano()
	
	for li_i=1 to dw_tamano_material.RowCount()
		if dw_tamano_material.GetItemNumber(li_i,'activo')=-1 then  
			li_tamano=li_tamano+1
			dw_tamano_material.SetItem(li_i,'activo',1)
			dw_tamano_material.SetItem(li_i,'cvetamano',li_tamano)
		end if
	next
	
	if dw_tamano_material.update()>0 then
		commit using gtr_sumuia;
		messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
	else
		rollback using gtr_sumuia;
		messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
	end if
	
	dw_tamano_material.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial,ii_cvetipo)
	if dw_tamano_material.RowCount()>0 then dw_tamano_material.ScrollToRow(1)
	
end if
end event

type cb_eliminar2 from commandbutton within w_gen_cat_tipo_material
integer x = 3994
integer y = 1818
integer width = 300
integer height = 99
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Eliminar"
end type

event clicked;integer li_borrar=0, li_row
string ls_descripcion
str_disp_categoria lstr_disp_categoria
 
if dw_tamano_material.RowCount()>0 then
	
	li_row=dw_tamano_material.getrow()
	
	if dw_tamano_material.GetItemNumber(li_row,'activo')=1 then

		lstr_disp_categoria=f_valida_borra_tamano_material(gi_depto,gi_area,ii_cvegrupo,is_cvematerial,ii_cvetipo,ii_cvetamano)
	

		if lstr_disp_categoria.inventario>0 then
			messagebox('Atención','Primero debe eliminar los registros del Inventario con Tamaño: '+string(ii_cvetamano),exclamation!)
			li_borrar=-1
		end if
		
		
		if li_borrar=-1 then return

		//Eliminar

		ls_descripcion=dw_tamano_material.GetItemString(li_row,'descripcion')
		
		update dbo.spre_tamano_materiales
		set activo=0,
		descripcion=:ls_descripcion
		where cvedepto=:gi_depto
		and cvearea=:gi_area
		and cvegrupo=:ii_cvegrupo
		and cvematerial=:is_cvematerial
		and cvetipo=:ii_cvetipo
		and cvetamano=:ii_cvetamano
		using gtr_sumuia;
		
		if gtr_sumuia.SQLCode = -1 then 
			messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
			rollback using gtr_sumuia;
		else
			messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
			commit using gtr_sumuia;	
		end if		

		ii_cvetamano=0
		dw_tamano_material.Reset()
		dw_tamano_material.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial,ii_cvetipo)
		if dw_tamano_material.RowCount()>0 then dw_tamano_material.ScrollToRow(1)
	
		
	else
		dw_tamano_material.DeleteRow(li_row)
	end if
	
end if

end event

type cb_eliminar from commandbutton within w_gen_cat_tipo_material
integer x = 1726
integer y = 1818
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

event clicked;integer li_borrar=0, li_row
string ls_descripcion
str_disp_categoria lstr_disp_categoria

if dw_tipo_material.RowCount()>0 then
	
	li_row=dw_tipo_material.getrow()
	
	if dw_tipo_material.GetItemNumber(li_row,'activo')=1 then

		lstr_disp_categoria=f_valida_borra_tipo_material(gi_depto,gi_area,ii_cvegrupo,is_cvematerial,ii_cvetipo)
	
		if lstr_disp_categoria.tamano>0 then
			messagebox('Atención','Primero debe eliminar los registros del Catálogo de Tamaño con Tipo: '+string(ii_cvetipo),exclamation!)
			li_borrar=-1
		end if
		
		if lstr_disp_categoria.inventario>0 then
			messagebox('Atención','Primero debe dar de baja los registros del Inventario con Tipo: '+string(dw_tipo_material.GetItemNumber(li_row,'cvetipo')),exclamation!)
			li_borrar=-1
		end if
		
		
		if li_borrar=-1 then return

		//Eliminar

		ls_descripcion=dw_tipo_material.GetItemString(li_row,'descripcion')
		
		update dbo.spre_tipo_materiales
		set activo=0,
		descripcion=:ls_descripcion
		where cvedepto=:gi_depto
		and cvearea=:gi_area
		and cvegrupo=:ii_cvegrupo
		and cvematerial=:is_cvematerial
		and cvetipo=:ii_cvetipo
		using gtr_sumuia;
		
		if gtr_sumuia.SQLCode = -1 then 
			messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
			rollback using gtr_sumuia;
		else
			messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
			commit using gtr_sumuia;	
		end if		

		ii_cvetipo=0
		ii_cvetamano=0
		dw_tipo_material.Reset()
		dw_tamano_material.Reset()
		dw_tipo_material.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial)
		
		if dw_tipo_material.RowCount()>0 then
			ii_cvetipo=dw_tipo_material.GetItemNumber(1,'cvetipo')
			dw_tamano_material.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial,ii_cvetipo)
			
			if dw_tamano_material.RowCount()>0 then dw_tamano_material.ScrollToRow(1)
		
		end if		
		
	else
		dw_tipo_material.DeleteRow(li_row)
	end if
	
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_tipo_material
integer x = 1419
integer y = 1818
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

event clicked;integer li_i, li_tipo, NET
string ls_descripcion

if dw_tipo_material.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		

		li_tipo=f_ultimo_tipo()
	
		for li_i=1 to dw_tipo_material.RowCount()
			if dw_tipo_material.GetItemNumber(li_i,'activo')=-1 then  
				li_tipo=li_tipo+1
				dw_tipo_material.SetItem(li_i,'activo',1)
				dw_tipo_material.SetItem(li_i,'cvetipo',li_tipo)
			end if
		next
		
		if dw_tipo_material.update()>0 then
			commit using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
		else
			rollback using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
		end if
		
		
		ii_cvetipo=0
		dw_tipo_material.Reset()
		dw_tamano_material.Reset()
		dw_tipo_material.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial)
		
		if dw_tipo_material.RowCount()>0 then
			ii_cvetipo=dw_tipo_material.GetItemNumber(1,'cvetipo')
			dw_tamano_material.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial,ii_cvetipo)
			
			if dw_tamano_material.RowCount()>0 then dw_tamano_material.ScrollToRow(1)
		
		end if
		
	end if
	
end if
end event

type dw_tipo_material from datawindow within w_gen_cat_tipo_material
integer x = 62
integer y = 1008
integer width = 1964
integer height = 781
integer taborder = 30
string title = "none"
string dataobject = "d_gen_cat_tipo_material_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then
	
	ii_cvetipo=dw_tipo_material.GetItemNumber(currentrow,'cvetipo')
	ii_cvetamano=0

	dw_tamano_material.Reset()
	
	dw_tamano_material.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial,ii_cvetipo)
	
	if dw_tamano_material.RowCount()>0 then dw_tamano_material.ScrollToRow(1)
	
end if


end event

type cb_nuevo from commandbutton within w_gen_cat_tipo_material
integer x = 1112
integer y = 1818
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

if ii_cvegrupo>0 and is_cvematerial<>'' then

	dw_tipo_material.setfocus()		
	if dw_tipo_material.accepttext()=1 then
		ll_nva_linea=dw_tipo_material.insertrow(0)
		dw_tipo_material.setcolumn(1)
		dw_tipo_material.scrolltorow(ll_nva_linea)
	end if
	

	dw_tipo_material.setitem(dw_tipo_material.getrow(),'cvedepto',gi_depto)
	dw_tipo_material.setitem(dw_tipo_material.getrow(),'cvearea',gi_area)
	dw_tipo_material.setitem(dw_tipo_material.getrow(),'cvegrupo',ii_cvegrupo)
	dw_tipo_material.setitem(dw_tipo_material.getrow(),'cvematerial',is_cvematerial)
	dw_tipo_material.setitem(dw_tipo_material.getrow(),'activo',-1)

else
	if gi_depto=8 and gi_area=3  then
		messagebox('Atención','Debe seleccionar las categorías de Nombre y Función.')
	else
		messagebox('Atención','Debe seleccionar las categorías de Grupo y Material.')
	end if
end if
end event

type dw_materiales from datawindow within w_gen_cat_tipo_material
integer x = 1792
integer y = 83
integer width = 1726
integer height = 723
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_matgrupo"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then
	
	is_cvematerial=dw_materiales.GetItemString(currentrow,'cvematerial')
	ii_cvetipo=0
	ii_cvetamano=0

	dw_tipo_material.Reset()
	dw_tamano_material.Reset()

	dw_tipo_material.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial)
	
	if dw_tipo_material.RowCount()>0 then dw_tipo_material.ScrollToRow(1)
	
end if
end event

type dw_grupo_material from datawindow within w_gen_cat_tipo_material
integer x = 62
integer y = 83
integer width = 1609
integer height = 723
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_grupomat"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then
	
	ii_cvegrupo=dw_grupo_material.GetItemNumber(currentrow,'cvegrupo')
	is_cvematerial=''
	ii_cvetipo=0
	ii_cvetamano=0
	
	dw_materiales.Reset()
	dw_tipo_material.Reset()
	dw_tamano_material.Reset()

	dw_materiales.Retrieve(gi_depto, gi_area,dw_grupo_material.GetItemNumber(currentrow,'cvegrupo'))
	
	if dw_materiales.RowCount()>0 then	dw_materiales.ScrollToRow(1)
	
end if
end event

type gb_2 from groupbox within w_gen_cat_tipo_material
integer x = 1759
integer y = 19
integer width = 1803
integer height = 829
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Función"
end type

type gb_1 from groupbox within w_gen_cat_tipo_material
integer x = 26
integer y = 938
integer width = 2041
integer height = 1008
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Tipo"
end type

type gb_3 from groupbox within w_gen_cat_tipo_material
integer x = 26
integer y = 19
integer width = 1690
integer height = 829
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Nombre"
end type

type gb_4 from groupbox within w_gen_cat_tipo_material
integer x = 2088
integer y = 938
integer width = 2235
integer height = 1008
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Tamaño"
end type

