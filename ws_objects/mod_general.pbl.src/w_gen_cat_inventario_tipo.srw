$PBExportHeader$w_gen_cat_inventario_tipo.srw
forward
global type w_gen_cat_inventario_tipo from window
end type
type st_3 from statictext within w_gen_cat_inventario_tipo
end type
type st_2 from statictext within w_gen_cat_inventario_tipo
end type
type st_1 from statictext within w_gen_cat_inventario_tipo
end type
type dw_inventario from datawindow within w_gen_cat_inventario_tipo
end type
type dw_tamano_material from datawindow within w_gen_cat_inventario_tipo
end type
type cb_actualizar from commandbutton within w_gen_cat_inventario_tipo
end type
type dw_tipo_material from datawindow within w_gen_cat_inventario_tipo
end type
type cb_nuevo from commandbutton within w_gen_cat_inventario_tipo
end type
type dw_materiales from datawindow within w_gen_cat_inventario_tipo
end type
type dw_grupo_material from datawindow within w_gen_cat_inventario_tipo
end type
type gb_2 from groupbox within w_gen_cat_inventario_tipo
end type
type gb_1 from groupbox within w_gen_cat_inventario_tipo
end type
type gb_3 from groupbox within w_gen_cat_inventario_tipo
end type
type gb_4 from groupbox within w_gen_cat_inventario_tipo
end type
type gb_5 from groupbox within w_gen_cat_inventario_tipo
end type
end forward

global type w_gen_cat_inventario_tipo from window
integer width = 5098
integer height = 2320
boolean titlebar = true
string title = "Catálogo de Inventario"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
st_3 st_3
st_2 st_2
st_1 st_1
dw_inventario dw_inventario
dw_tamano_material dw_tamano_material
cb_actualizar cb_actualizar
dw_tipo_material dw_tipo_material
cb_nuevo cb_nuevo
dw_materiales dw_materiales
dw_grupo_material dw_grupo_material
gb_2 gb_2
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
end type
global w_gen_cat_inventario_tipo w_gen_cat_inventario_tipo

type variables
string is_cvematerial='', is_num_serie='', is_sort='#5A'
integer ii_cvegrupo=0, ii_cvetipo=0, ii_cvetamano=0


DatawindowChild idwc_tipo, idwc_tamano
end variables

on w_gen_cat_inventario_tipo.create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_inventario=create dw_inventario
this.dw_tamano_material=create dw_tamano_material
this.cb_actualizar=create cb_actualizar
this.dw_tipo_material=create dw_tipo_material
this.cb_nuevo=create cb_nuevo
this.dw_materiales=create dw_materiales
this.dw_grupo_material=create dw_grupo_material
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.Control[]={this.st_3,&
this.st_2,&
this.st_1,&
this.dw_inventario,&
this.dw_tamano_material,&
this.cb_actualizar,&
this.dw_tipo_material,&
this.cb_nuevo,&
this.dw_materiales,&
this.dw_grupo_material,&
this.gb_2,&
this.gb_1,&
this.gb_3,&
this.gb_4,&
this.gb_5}
end on

on w_gen_cat_inventario_tipo.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_inventario)
destroy(this.dw_tamano_material)
destroy(this.cb_actualizar)
destroy(this.dw_tipo_material)
destroy(this.cb_nuevo)
destroy(this.dw_materiales)
destroy(this.dw_grupo_material)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;dw_grupo_material.settransobject(gtr_sumuia)
dw_materiales.settransobject(gtr_sumuia)
dw_tipo_material.settransobject(gtr_sumuia)
dw_tamano_material.settransobject(gtr_sumuia)
dw_inventario.settransobject(gtr_sumuia)

dw_inventario.getchild('cvetipo',idwc_tipo)
idwc_tipo.settransobject(gtr_sumuia)

dw_inventario.getchild('cvetamano',idwc_tamano)
idwc_tamano.settransobject(gtr_sumuia)

if gi_depto=8 and gi_area=3  then
	dw_grupo_material.object.descripcion_t.text = "Nombre"
	dw_materiales.object.descripcion_t.text = "Función"
	dw_tipo_material.object.cvegrupo_t.text= "Nombre"
	dw_tipo_material.object.cvematerial_t.text= "Función"
	dw_tamano_material.object.cvegrupo_t.text= "Nombre"
	dw_tamano_material.object.cvematerial_t.text= "Función"
	dw_inventario.object.cvegrupo_t.text= "Nombre"
	dw_inventario.object.cvematerial_t.text= "Función"
end if



//Carga

dw_grupo_material.Retrieve(gi_depto, gi_area)

if dw_grupo_material.RowCount()>0 then dw_grupo_material.ScrollToRow(1)

end event

type st_3 from statictext within w_gen_cat_inventario_tipo
integer x = 26
integer y = 2147
integer width = 2717
integer height = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "* Los materiales que cuenten con el mismo código de barras serán considerados iguales por el lector de barras."
boolean focusrectangle = false
end type

type st_2 from statictext within w_gen_cat_inventario_tipo
integer x = 26
integer y = 2086
integer width = 2373
integer height = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "* Sólo puede cambiarse el estatus de un material, si éste no se encuentra prestado."
boolean focusrectangle = false
end type

type st_1 from statictext within w_gen_cat_inventario_tipo
integer x = 29
integer y = 2026
integer width = 2052
integer height = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "* El Número de Serie no puede modificarse si el material fue alguna vez prestado."
boolean focusrectangle = false
end type

type dw_inventario from datawindow within w_gen_cat_inventario_tipo
integer x = 18
integer y = 982
integer width = 5021
integer height = 976
integer taborder = 40
string title = "none"
string dataobject = "d_gen_cat_inventario_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;integer li_tipo

if currentrow>0 then
	is_num_serie=dw_inventario.GetItemString(currentrow,'num_serie')
	li_tipo=dw_inventario.GetItemNumber(currentrow,'cvetipo')
	idwc_tamano.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial,li_tipo)
end if

end event

event itemchanged;datetime ldt_ahorita
ldt_ahorita=DateTime(Today(),Now())

if row>0 then
	
	this.SetItem(row,'ultima_modificacion',ldt_ahorita)
	
	if dwo.name='cvetipo' then 
		idwc_tamano.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial,integer(data))
		this.SetItem(row,'cvetamano',0)
	end if

end if

end event

type dw_tamano_material from datawindow within w_gen_cat_inventario_tipo
integer x = 3277
integer y = 90
integer width = 1028
integer height = 723
integer taborder = 20
string title = "none"
string dataobject = "d_gen_cat_tamano_material"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then

	is_num_serie=''
	
	dw_inventario.Reset()
	
	ii_cvetamano=dw_tamano_material.GetItemNumber(currentrow,'cvetamano')
	dw_inventario.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial,ii_cvetipo,ii_cvetamano)
	dw_inventario.SetSort(is_sort)
	dw_inventario.Sort()
	
	if dw_inventario.RowCount()>0 then 
		idwc_tipo.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial)
		dw_inventario.ScrollToRow(1)
	end if
end if

end event

type cb_actualizar from commandbutton within w_gen_cat_inventario_tipo
integer x = 4045
integer y = 2029
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

event clicked;integer li_i, li_tipo
string  ls_num_serie

if dw_inventario.RowCount()>0 then
	

	if dw_inventario.update()>0 then
		commit using gtr_sumuia;
		messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
	else
		rollback using gtr_sumuia;
		messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
	end if
	
	
	dw_inventario.Reset()
	dw_inventario.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial,ii_cvetipo,ii_cvetamano)
	

end if
end event

type dw_tipo_material from datawindow within w_gen_cat_inventario_tipo
integer x = 2136
integer y = 90
integer width = 1057
integer height = 723
integer taborder = 30
string title = "none"
string dataobject = "d_gen_cat_tipo_material"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then

	ii_cvetamano=0
	is_num_serie=''
	
	dw_tamano_material.Reset()
	dw_inventario.Reset()
	
	ii_cvetipo=dw_tipo_material.GetItemNumber(currentrow,'cvetipo')
	dw_tamano_material.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial,ii_cvetipo)

	if dw_tamano_material.RowCount()>0 then dw_tamano_material.ScrollToRow(2)

end if


end event

type cb_nuevo from commandbutton within w_gen_cat_inventario_tipo
integer x = 3738
integer y = 2029
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
datetime ldt_ahorita

ldt_ahorita=DateTime(Today(),Now())

if ii_cvegrupo>0 and is_cvematerial<>'' then

	if ii_cvetipo>=0 and ii_cvetamano>=0 then 
		
		dw_inventario.setfocus()		
		if dw_inventario.accepttext()=1 then
			ll_nva_linea=dw_inventario.insertrow(0)
			dw_inventario.setcolumn(1)
			dw_inventario.scrolltorow(ll_nva_linea)
		end if
	
		dw_inventario.setitem(dw_inventario.getrow(),'cvedepto',gi_depto)
		dw_inventario.setitem(dw_inventario.getrow(),'cvearea',gi_area)
		dw_inventario.setitem(dw_inventario.getrow(),'cvegrupo',ii_cvegrupo)
		dw_inventario.setitem(dw_inventario.getrow(),'cvematerial',is_cvematerial)
		dw_inventario.setitem(dw_inventario.getrow(),'cvetipo',ii_cvetipo)
		dw_inventario.setitem(dw_inventario.getrow(),'cvetamano',ii_cvetamano)
		dw_inventario.setitem(dw_inventario.getrow(),'stauts',1)
		dw_inventario.setitem(dw_inventario.getrow(),'editable',-1)
		dw_inventario.setitem(dw_inventario.getrow(),'tiempo_prestamo',0)
		dw_inventario.setitem(dw_inventario.getrow(),'fecha_registro',ldt_ahorita)
		
	else
		messagebox('Atención','Las categorías de Todos los Tipos y Todos los Tamaños no pueden estar seleccionadas para dar de alta.')
	end if
else
	if gi_depto=8 and gi_area=3 then
		messagebox('Atención','Debe seleccionar las categorías de Nombre y Función.')
	else
		messagebox('Atención','Debe seleccionar las categorías de Grupo y Material.')
	end if
end if
end event

type dw_materiales from datawindow within w_gen_cat_inventario_tipo
integer x = 973
integer y = 90
integer width = 1075
integer height = 723
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_matgrupo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then

	is_cvematerial=dw_materiales.GetItemString(currentrow,'cvematerial')
	ii_cvetipo=0
	ii_cvetamano=0
	is_num_serie=''

	dw_tipo_material.Reset()
	dw_tamano_material.Reset()
	dw_inventario.Reset()

	dw_tipo_material.Retrieve(gi_depto, gi_area,ii_cvegrupo,is_cvematerial)

	if dw_tipo_material.RowCount()>0 then dw_tipo_material.ScrollToRow(2)
	
end if
end event

type dw_grupo_material from datawindow within w_gen_cat_inventario_tipo
integer x = 59
integer y = 90
integer width = 819
integer height = 723
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_grupomat"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then

	ii_cvegrupo=dw_grupo_material.GetItemNumber(currentrow,'cvegrupo')
	is_cvematerial=''
	ii_cvetipo=0
	ii_cvetamano=0
	is_num_serie=''
	
	dw_materiales.Reset()
	dw_tipo_material.Reset()
	dw_tamano_material.Reset()
	dw_inventario.Reset()

	dw_materiales.Retrieve(gi_depto, gi_area,dw_grupo_material.GetItemNumber(currentrow,'cvegrupo'))
	
	if dw_materiales.RowCount()>0 then	dw_materiales.ScrollToRow(1)
	
end if
end event

type gb_2 from groupbox within w_gen_cat_inventario_tipo
integer x = 940
integer y = 26
integer width = 1141
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

type gb_1 from groupbox within w_gen_cat_inventario_tipo
integer x = 2107
integer y = 26
integer width = 1123
integer height = 829
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

type gb_3 from groupbox within w_gen_cat_inventario_tipo
integer x = 7
integer y = 918
integer width = 5051
integer height = 1075
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Inventario"
end type

type gb_4 from groupbox within w_gen_cat_inventario_tipo
integer x = 3248
integer y = 26
integer width = 1093
integer height = 829
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

type gb_5 from groupbox within w_gen_cat_inventario_tipo
integer x = 26
integer y = 26
integer width = 889
integer height = 829
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Nombre"
end type

