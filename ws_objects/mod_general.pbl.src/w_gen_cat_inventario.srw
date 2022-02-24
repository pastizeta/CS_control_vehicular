$PBExportHeader$w_gen_cat_inventario.srw
forward
global type w_gen_cat_inventario from window
end type
type rb_venta from radiobutton within w_gen_cat_inventario
end type
type rb_prestamo from radiobutton within w_gen_cat_inventario
end type
type st_5 from statictext within w_gen_cat_inventario
end type
type st_4 from statictext within w_gen_cat_inventario
end type
type dw_area from datawindow within w_gen_cat_inventario
end type
type st_3 from statictext within w_gen_cat_inventario
end type
type st_2 from statictext within w_gen_cat_inventario
end type
type st_1 from statictext within w_gen_cat_inventario
end type
type dw_inventario from datawindow within w_gen_cat_inventario
end type
type cb_actualizar from commandbutton within w_gen_cat_inventario
end type
type cb_nuevo from commandbutton within w_gen_cat_inventario
end type
type dw_materiales from datawindow within w_gen_cat_inventario
end type
type dw_grupo_material from datawindow within w_gen_cat_inventario
end type
type gb_grupo from groupbox within w_gen_cat_inventario
end type
type gb_material from groupbox within w_gen_cat_inventario
end type
type gb_inventario from groupbox within w_gen_cat_inventario
end type
type gb_area from groupbox within w_gen_cat_inventario
end type
type gb_venta from groupbox within w_gen_cat_inventario
end type
end forward

global type w_gen_cat_inventario from window
integer width = 5554
integer height = 2472
boolean titlebar = true
string title = "Catálogo de Inventario"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
rb_venta rb_venta
rb_prestamo rb_prestamo
st_5 st_5
st_4 st_4
dw_area dw_area
st_3 st_3
st_2 st_2
st_1 st_1
dw_inventario dw_inventario
cb_actualizar cb_actualizar
cb_nuevo cb_nuevo
dw_materiales dw_materiales
dw_grupo_material dw_grupo_material
gb_grupo gb_grupo
gb_material gb_material
gb_inventario gb_inventario
gb_area gb_area
gb_venta gb_venta
end type
global w_gen_cat_inventario w_gen_cat_inventario

type variables
string is_cvematerial='', is_num_serie='', is_sort='#5A'
integer ii_cvegrupo=0, ii_cvearea, ii_tipo_espacio=0
integer ii_disponibilidad=0

DatawindowChild idwc_tipo, idwc_tamano


end variables

on w_gen_cat_inventario.create
this.rb_venta=create rb_venta
this.rb_prestamo=create rb_prestamo
this.st_5=create st_5
this.st_4=create st_4
this.dw_area=create dw_area
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_inventario=create dw_inventario
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.dw_materiales=create dw_materiales
this.dw_grupo_material=create dw_grupo_material
this.gb_grupo=create gb_grupo
this.gb_material=create gb_material
this.gb_inventario=create gb_inventario
this.gb_area=create gb_area
this.gb_venta=create gb_venta
this.Control[]={this.rb_venta,&
this.rb_prestamo,&
this.st_5,&
this.st_4,&
this.dw_area,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_inventario,&
this.cb_actualizar,&
this.cb_nuevo,&
this.dw_materiales,&
this.dw_grupo_material,&
this.gb_grupo,&
this.gb_material,&
this.gb_inventario,&
this.gb_area,&
this.gb_venta}
end on

on w_gen_cat_inventario.destroy
destroy(this.rb_venta)
destroy(this.rb_prestamo)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.dw_area)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_inventario)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.dw_materiales)
destroy(this.dw_grupo_material)
destroy(this.gb_grupo)
destroy(this.gb_material)
destroy(this.gb_inventario)
destroy(this.gb_area)
destroy(this.gb_venta)
end on

event open;dw_area.settransobject(gtr_sumuia)
dw_grupo_material.settransobject(gtr_sumuia)
dw_materiales.settransobject(gtr_sumuia)
dw_inventario.settransobject(gtr_sumuia)


if gi_depto<>2 then
	gb_venta.visible=false
	rb_prestamo.visible=false
	rb_venta.visible=false
	rb_venta.visible=false
end if

//Carga

if gi_areamul=1 then
	ii_cvearea=-1
else
	ii_cvearea=gi_area
end if	

dw_area.Retrieve(gi_depto, ii_cvearea)
if dw_area.RowCount()>0 then dw_area.ScrollToRow(1)



end event

type rb_venta from radiobutton within w_gen_cat_inventario
boolean visible = false
integer x = 4631
integer y = 332
integer width = 571
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Venta material"
end type

event clicked;gb_material.text='Material VENTA'

is_cvematerial=''
is_num_serie=''
ii_disponibilidad=1

dw_inventario.Reset()
dw_materiales.Reset()
dw_materiales.dataobject = 'd_gen_cat_matgrupo_venta'
dw_materiales.settransobject(gtr_sumuia)

dw_materiales.Retrieve(gi_depto, ii_cvearea, ii_cvegrupo)
if dw_materiales.RowCount()>0 then dw_materiales.ScrollToRow(1)
end event

type rb_prestamo from radiobutton within w_gen_cat_inventario
boolean visible = false
integer x = 4631
integer y = 248
integer width = 905
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Préstamo material/espacio"
boolean checked = true
end type

event clicked;gb_material.text='Material PRESTAMO'

is_cvematerial=''
is_num_serie=''
ii_disponibilidad=0

dw_inventario.Reset()
dw_materiales.Reset()
dw_materiales.dataobject = 'd_gen_cat_matgrupo_prestamo'
dw_materiales.settransobject(gtr_sumuia)

dw_materiales.Retrieve(gi_depto, ii_cvearea, ii_cvegrupo)
if dw_materiales.RowCount()>0 then dw_materiales.ScrollToRow(1)

end event

type st_5 from statictext within w_gen_cat_inventario
integer x = 50
integer y = 2276
integer width = 3214
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "* Si un material es Consumible hay que indicar la cantidad de unidades en existencia."
boolean focusrectangle = false
end type

type st_4 from statictext within w_gen_cat_inventario
integer x = 50
integer y = 2220
integer width = 3529
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "* Préstamo Máximo indica el máximo de unidades del artículo que se pueden pedir al mismo tiempo, si es 0 o vacío no hay límite."
boolean focusrectangle = false
end type

type dw_area from datawindow within w_gen_cat_inventario
integer x = 82
integer y = 100
integer width = 997
integer height = 724
integer taborder = 20
string title = "none"
string dataobject = "d_gen_cat_area"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then

	ii_cvearea=dw_area.GetItemNumber(currentrow,'cvearea')
	ii_tipo_espacio=dw_area.GetItemNumber(currentrow,'tipo_espacio')
	ii_cvegrupo=0
	is_cvematerial=''
	is_num_serie=''
	ii_disponibilidad=0
	
	dw_grupo_material.Reset()
	dw_materiales.Reset()
	dw_inventario.Reset()

	dw_grupo_material.Retrieve(gi_depto, ii_cvearea)
	if dw_grupo_material.RowCount()>0 then dw_grupo_material.ScrollToRow(1)

end if
end event

type st_3 from statictext within w_gen_cat_inventario
integer x = 50
integer y = 2156
integer width = 3168
integer height = 64
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

type st_2 from statictext within w_gen_cat_inventario
integer x = 50
integer y = 2096
integer width = 2779
integer height = 64
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

type st_1 from statictext within w_gen_cat_inventario
integer x = 50
integer y = 2036
integer width = 2587
integer height = 64
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

type dw_inventario from datawindow within w_gen_cat_inventario
integer x = 73
integer y = 992
integer width = 5330
integer height = 976
integer taborder = 40
string title = "none"
string dataobject = "d_gen_cat_inventario"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then is_num_serie=dw_inventario.GetItemString(currentrow,'num_serie')


end event

event itemchanged;datetime ldt_ahorita
ldt_ahorita=DateTime(Today(),Now())

if row>0 then
	
	this.SetItem(row,'ultima_modificacion',ldt_ahorita)

end if

end event

type cb_actualizar from commandbutton within w_gen_cat_inventario
integer x = 4366
integer y = 2048
integer width = 366
integer height = 100
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
string  ls_num_serie


if dw_inventario.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 			
		

		if dw_inventario.update()>0 then
			commit using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
			
		else
			rollback using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
		end if
		
		dw_inventario.Reset()
		dw_inventario.Retrieve(gi_depto, ii_cvearea,ii_cvegrupo,is_cvematerial)
		
		for li_i=1 to dw_inventario.RowCount()
			dw_inventario.SetItem(li_i,'prestamo_unitario',dw_inventario.GetItemNumber(1,'prestamo_unitario'))
		next
		
		if dw_inventario.update()>0 then
			commit using gtr_sumuia;
		end if
		
		dw_inventario.Reset()
		dw_inventario.Retrieve(gi_depto, ii_cvearea,ii_cvegrupo,is_cvematerial)
		
		
		if gi_depto=9 and ii_cvearea=2 then
			
			update spre_materiales
			set spre_materiales.disponibilidad=1
			where  spre_materiales.cvedepto=:gi_depto and spre_materiales.cvearea=:ii_cvearea
			and spre_materiales.cvegrupo=:ii_cvegrupo
			and spre_materiales.cvematerial in (select distinct spre_inventario.cvematerial
			from spre_inventario
			where  spre_materiales.cvedepto=spre_inventario.cvedepto 
			and spre_materiales.cvearea=spre_inventario.cvearea
			and spre_materiales.cvegrupo=spre_inventario.cvegrupo
			and spre_materiales.cvematerial=spre_inventario.cvematerial
			and spre_inventario.tipo_unidad=1)
			
			commit using gtr_sumuia;
			
		end if
	
	end if
	
end if
end event

type cb_nuevo from commandbutton within w_gen_cat_inventario
integer x = 4041
integer y = 2048
integer width = 302
integer height = 100
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

if ii_tipo_espacio=1 and ii_cvegrupo=1 and is_cvematerial='1' then 
	messagebox('Aviso','Para dar de alta un Foro acuda al Catálogo de Áreas.')
	return
end if


if ii_cvegrupo>0 and is_cvematerial<>'' then

		dw_inventario.setfocus()		
		if dw_inventario.accepttext()=1 then
			ll_nva_linea=dw_inventario.insertrow(0)
			dw_inventario.setcolumn(1)
			dw_inventario.scrolltorow(ll_nva_linea)
		end if

		dw_inventario.setitem(dw_inventario.getrow(),'cvedepto',gi_depto)
		dw_inventario.setitem(dw_inventario.getrow(),'cvearea',ii_cvearea)
		dw_inventario.setitem(dw_inventario.getrow(),'cvegrupo',ii_cvegrupo)
		dw_inventario.setitem(dw_inventario.getrow(),'cvematerial',is_cvematerial)
		dw_inventario.setitem(dw_inventario.getrow(),'stauts',1)
		dw_inventario.setitem(dw_inventario.getrow(),'editable',-1)
		dw_inventario.setitem(dw_inventario.getrow(),'tiempo_prestamo',0)
		dw_inventario.setitem(dw_inventario.getrow(),'fecha_registro',ldt_ahorita)
		
		if gi_depto=2 and ii_disponibilidad=1 then
			dw_inventario.setitem(dw_inventario.getrow(),'tipo_unidad',1)	
		end if

else
	messagebox('Atención','Debe seleccionar las categorías de Grupo y Material.')
end if
end event

type dw_materiales from datawindow within w_gen_cat_inventario
integer x = 2446
integer y = 100
integer width = 1874
integer height = 724
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_matgrupo_prestamo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then

	is_cvematerial=dw_materiales.GetItemString(currentrow,'cvematerial')
	is_num_serie=''
	ii_disponibilidad=dw_materiales.GetItemNumber(currentrow,'disponibilidad')

	dw_inventario.Reset()


	if gi_depto=2 then
		if ii_disponibilidad=0 then 
			gb_inventario.text='Inventario'
			if ii_cvegrupo = 6 then
				dw_inventario.dataobject = 'd_gen_cat_inventario_espacios'
			else
				dw_inventario.dataobject = 'd_gen_cat_inventario'
			end if
			dw_inventario.settransobject(gtr_sumuia)
			dw_inventario.Retrieve(gi_depto, ii_cvearea,ii_cvegrupo,is_cvematerial)
		else
			gb_inventario.text='Inventario VENTA'
			dw_inventario.dataobject = 'd_gen_cat_inventario_venta'
			dw_inventario.settransobject(gtr_sumuia)
			dw_inventario.Retrieve(gi_depto, ii_cvearea,ii_cvegrupo,is_cvematerial)
		end if
	else
			dw_inventario.Retrieve(gi_depto, ii_cvearea,ii_cvegrupo,is_cvematerial)
	end if

	dw_inventario.SetSort(is_sort)
	dw_inventario.Sort()	
	
	
	if dw_inventario.RowCount()>0 then dw_inventario.ScrollToRow(1)
	
end if



end event

type dw_grupo_material from datawindow within w_gen_cat_inventario
integer x = 1166
integer y = 100
integer width = 1184
integer height = 724
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
	is_num_serie=''
	ii_disponibilidad=0
	
	dw_materiales.Reset()
	dw_inventario.Reset()

	dw_materiales.Retrieve(gi_depto, ii_cvearea,dw_grupo_material.GetItemNumber(currentrow,'cvegrupo'))
	if dw_materiales.RowCount()>0 then	dw_materiales.ScrollToRow(1)
	
end if
end event

type gb_grupo from groupbox within w_gen_cat_inventario
integer x = 1138
integer y = 36
integer width = 1253
integer height = 828
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

type gb_material from groupbox within w_gen_cat_inventario
integer x = 2418
integer y = 36
integer width = 1947
integer height = 828
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Material"
end type

type gb_inventario from groupbox within w_gen_cat_inventario
integer x = 41
integer y = 928
integer width = 5403
integer height = 1076
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

type gb_area from groupbox within w_gen_cat_inventario
integer x = 50
integer y = 36
integer width = 1065
integer height = 828
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

type gb_venta from groupbox within w_gen_cat_inventario
boolean visible = false
integer x = 4581
integer y = 180
integer width = 955
integer height = 444
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
end type

