$PBExportHeader$w_gen_cat_materiales.srw
forward
global type w_gen_cat_materiales from window
end type
type rb_venta from radiobutton within w_gen_cat_materiales
end type
type rb_prestamo from radiobutton within w_gen_cat_materiales
end type
type st_notas from statictext within w_gen_cat_materiales
end type
type dw_grupo_material from datawindow within w_gen_cat_materiales
end type
type dw_materiales from datawindow within w_gen_cat_materiales
end type
type dw_area from datawindow within w_gen_cat_materiales
end type
type cb_eliminar from commandbutton within w_gen_cat_materiales
end type
type cb_actualizar from commandbutton within w_gen_cat_materiales
end type
type cb_nuevo from commandbutton within w_gen_cat_materiales
end type
type gb_grupo from groupbox within w_gen_cat_materiales
end type
type gb_material from groupbox within w_gen_cat_materiales
end type
type gb_area from groupbox within w_gen_cat_materiales
end type
type gb_venta from groupbox within w_gen_cat_materiales
end type
end forward

global type w_gen_cat_materiales from window
integer width = 3471
integer height = 2246
boolean titlebar = true
string title = "Catálogo de Materiales"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
rb_venta rb_venta
rb_prestamo rb_prestamo
st_notas st_notas
dw_grupo_material dw_grupo_material
dw_materiales dw_materiales
dw_area dw_area
cb_eliminar cb_eliminar
cb_actualizar cb_actualizar
cb_nuevo cb_nuevo
gb_grupo gb_grupo
gb_material gb_material
gb_area gb_area
gb_venta gb_venta
end type
global w_gen_cat_materiales w_gen_cat_materiales

type variables
string is_cvematerial=''
integer ii_cvegrupo=0, ii_cvearea, ii_tipo_espacio=0
end variables

on w_gen_cat_materiales.create
this.rb_venta=create rb_venta
this.rb_prestamo=create rb_prestamo
this.st_notas=create st_notas
this.dw_grupo_material=create dw_grupo_material
this.dw_materiales=create dw_materiales
this.dw_area=create dw_area
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.gb_grupo=create gb_grupo
this.gb_material=create gb_material
this.gb_area=create gb_area
this.gb_venta=create gb_venta
this.Control[]={this.rb_venta,&
this.rb_prestamo,&
this.st_notas,&
this.dw_grupo_material,&
this.dw_materiales,&
this.dw_area,&
this.cb_eliminar,&
this.cb_actualizar,&
this.cb_nuevo,&
this.gb_grupo,&
this.gb_material,&
this.gb_area,&
this.gb_venta}
end on

on w_gen_cat_materiales.destroy
destroy(this.rb_venta)
destroy(this.rb_prestamo)
destroy(this.st_notas)
destroy(this.dw_grupo_material)
destroy(this.dw_materiales)
destroy(this.dw_area)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.gb_grupo)
destroy(this.gb_material)
destroy(this.gb_area)
destroy(this.gb_venta)
end on

event open;dw_area.settransobject(gtr_sumuia)
dw_grupo_material.settransobject(gtr_sumuia)
dw_materiales.settransobject(gtr_sumuia)

if gi_depto=8 and gi_area=3  then
	dw_grupo_material.object.descripcion_t.text = "Nombre"
	dw_materiales.object.cvegrupo_t.text = "Nombre"
	dw_materiales.object.descripcion_t.text = "Función"
	gb_grupo.text='Nombre'
	gb_material.text='Función'
	this.title='Catálogo de Funciones'
end if

if gi_depto=2 then
	st_notas.visible=false
	dw_materiales.dataobject = 'd_gen_cat_matgrupo_prestamo_edit'
	dw_materiales.settransobject(gtr_sumuia)
else
	gb_venta.visible=false
	rb_prestamo.visible=false
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

if gi_depto=8 and ii_cvearea=1  then cb_eliminar.enabled=false

end event

type rb_venta from radiobutton within w_gen_cat_materiales
boolean visible = false
integer x = 3024
integer y = 554
integer width = 688
integer height = 77
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

event clicked;dw_materiales.Reset()
dw_materiales.dataobject = 'd_gen_cat_matgrupo_venta_edit'
dw_materiales.settransobject(gtr_sumuia)

dw_materiales.Retrieve(gi_depto, ii_cvearea, ii_cvegrupo)
if dw_materiales.RowCount()>0 then dw_materiales.ScrollToRow(1)



end event

type rb_prestamo from radiobutton within w_gen_cat_materiales
boolean visible = false
integer x = 3028
integer y = 442
integer width = 863
integer height = 77
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

event clicked;dw_materiales.Reset()
dw_materiales.dataobject = 'd_gen_cat_matgrupo_prestamo_edit'
dw_materiales.settransobject(gtr_sumuia)

dw_materiales.Retrieve(gi_depto, ii_cvearea, ii_cvegrupo)
if dw_materiales.RowCount()>0 then dw_materiales.ScrollToRow(1)



end event

type st_notas from statictext within w_gen_cat_materiales
integer x = 59
integer y = 1824
integer width = 2359
integer height = 131
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "* Primero libre no permitirá elegir la unidad a PreSolicitar, se seleccionará la primera disponible."
boolean focusrectangle = false
end type

type dw_grupo_material from datawindow within w_gen_cat_materiales
integer x = 1207
integer y = 125
integer width = 1657
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

event rowfocuschanged;integer li_i=1

if currentrow>0 then

	ii_cvegrupo=dw_grupo_material.GetItemNumber(currentrow,'cvegrupo')
	is_cvematerial=''
	
	dw_materiales.Reset()

	dw_materiales.Retrieve(gi_depto, ii_cvearea,dw_grupo_material.GetItemNumber(currentrow,'cvegrupo'))

	if dw_materiales.RowCount()>0 then	
		dw_materiales.ScrollToRow(1)
		if ii_tipo_espacio>0 then
			for li_i=1 to dw_materiales.RowCount()
				dw_materiales.SetItem(li_i,'editable',0)
			next
		end if
	end if
end if



end event

type dw_materiales from datawindow within w_gen_cat_materiales
integer x = 84
integer y = 1014
integer width = 3244
integer height = 723
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_matgrupo_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then is_cvematerial=dw_materiales.GetItemString(currentrow,'cvematerial')
end event

type dw_area from datawindow within w_gen_cat_materiales
integer x = 80
integer y = 125
integer width = 998
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

event rowfocuschanged;if currentrow>0 then

	ii_cvearea=dw_area.GetItemNumber(currentrow,'cvearea')
	ii_tipo_espacio=dw_area.GetItemNumber(currentrow,'tipo_espacio')
	ii_cvegrupo=0
	is_cvematerial=''
	
	dw_grupo_material.Reset()
	dw_materiales.Reset()

	dw_grupo_material.Retrieve(gi_depto, ii_cvearea)
	if dw_grupo_material.RowCount()>0 then dw_grupo_material.ScrollToRow(1)

end if
end event

type cb_eliminar from commandbutton within w_gen_cat_materiales
integer x = 3057
integer y = 1821
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

if dw_materiales.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		li_row=dw_materiales.getrow()
		
		if dw_materiales.GetItemNumber(li_row,'borrable')=0 then
	
			//Eliminar
	
			update dbo.spre_materiales
			set activo=0
			where cvedepto=:gi_depto
			and cvearea=:ii_cvearea
			and cvegrupo=:ii_cvegrupo
			and cvematerial=:is_cvematerial
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
				rollback using gtr_sumuia;
			else
				messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
				commit using gtr_sumuia;	
			end if		
	
			dw_materiales.Reset()
			dw_materiales.Retrieve(gi_depto, ii_cvearea,ii_cvegrupo)
			
		else
			if gi_depto=8 and gi_area=3  then
				messagebox('Aviso','Para borrar la categoría de Función debe dar de Baja su Inventario')
			else
				messagebox('Aviso','Para borrar la categoría de Material debe dar de Baja su Inventario.')	
			end if
		end if
		
	end if
	
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_materiales
integer x = 2750
integer y = 1821
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

event clicked;integer li_i, NET

if dw_materiales.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 			
	
		for li_i=1 to dw_materiales.RowCount()
			if IsNull(dw_materiales.GetItemNumber(li_i,'multa')) then dw_materiales.setitem(li_i,'multa',0)
			if IsNull(dw_materiales.GetItemNumber(li_i,'activo')) then dw_materiales.setitem(li_i,'activo',1)
		next
		
		if dw_materiales.update()>0 then
			commit using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
		else
			rollback using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
		end if

		dw_materiales.Reset()
		dw_materiales.Retrieve(gi_depto, ii_cvearea,ii_cvegrupo)
		
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
			
			dw_materiales.Reset()
			dw_materiales.Retrieve(gi_depto, ii_cvearea,ii_cvegrupo)
			
		end if		
		
		
	end if
	
end if
end event

type cb_nuevo from commandbutton within w_gen_cat_materiales
integer x = 2443
integer y = 1821
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

if gi_depto=8 and ii_cvearea=1 and dw_materiales.RowCount()>0  then
	messagebox('Aviso','No puede dar de alta otro Material.')
	return
end if

if ii_tipo_espacio=2 and ii_cvegrupo=1 and is_cvematerial='1' then 
	messagebox('Aviso','Para dar de alta un Laboratorio acuda al Catálogo de Áreas.')
	return
end if

if ii_tipo_espacio=1 and ii_cvegrupo=1 and is_cvematerial='1' then 
	messagebox('Aviso','Para dar de alta un Foro acuda al Catálogo de Áreas.')
	return
end if

if gi_depto=2 and ii_cvearea=1 and ii_cvegrupo = 6 and rb_venta.checked=true  then
	messagebox('Aviso','Este Material no puede estar a la venta')
	return
end if


if ii_cvegrupo>0  then

	dw_materiales.setfocus()		
	if dw_materiales.accepttext()=1 then
		ll_nva_linea=dw_materiales.insertrow(0)
		dw_materiales.setcolumn(1)
		dw_materiales.scrolltorow(ll_nva_linea)
	end if

	dw_materiales.setitem(dw_materiales.getrow(),'cvedepto',gi_depto)
	dw_materiales.setitem(dw_materiales.getrow(),'cvearea',ii_cvearea)
	dw_materiales.setitem(dw_materiales.getrow(),'cvegrupo',ii_cvegrupo)
	dw_materiales.setitem(dw_materiales.getrow(),'multa',0)
	dw_materiales.setitem(dw_materiales.getrow(),'activo',1)
	dw_materiales.setitem(dw_materiales.getrow(),'editable',-1)
	dw_materiales.setitem(dw_materiales.getrow(),'borrable',0)

	if gi_depto=8 and ii_cvearea=3 then dw_materiales.setitem(dw_materiales.getrow(),'disponibilidad',1)
	if rb_venta.checked = true then dw_materiales.setitem(dw_materiales.getrow(),'disponibilidad',1)

else
	if gi_depto=8 and gi_area=3  then
		messagebox('Atención','Debe seleccionar la categoría de Función')
	else
		messagebox('Atención','Debe seleccionar las categoría de Grupo')
	end if
end if
end event

type gb_grupo from groupbox within w_gen_cat_materiales
integer x = 1163
integer y = 61
integer width = 1752
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

type gb_material from groupbox within w_gen_cat_materiales
integer x = 55
integer y = 954
integer width = 3310
integer height = 829
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Material"
end type

type gb_area from groupbox within w_gen_cat_materiales
integer x = 44
integer y = 61
integer width = 1079
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

type gb_venta from groupbox within w_gen_cat_materiales
boolean visible = false
integer x = 2995
integer y = 378
integer width = 922
integer height = 275
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

