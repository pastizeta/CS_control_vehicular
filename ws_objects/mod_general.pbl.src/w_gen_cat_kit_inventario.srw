$PBExportHeader$w_gen_cat_kit_inventario.srw
forward
global type w_gen_cat_kit_inventario from window
end type
type dw_kit_inventario from datawindow within w_gen_cat_kit_inventario
end type
type st_5 from statictext within w_gen_cat_kit_inventario
end type
type st_1 from statictext within w_gen_cat_kit_inventario
end type
type dw_matgrupo from u_basedw within w_gen_cat_kit_inventario
end type
type dw_grupomat from u_basedw within w_gen_cat_kit_inventario
end type
type dw_kit from datawindow within w_gen_cat_kit_inventario
end type
type dw_tipo from datawindow within w_gen_cat_kit_inventario
end type
type cb_eliminar from commandbutton within w_gen_cat_kit_inventario
end type
type cb_actualizar from commandbutton within w_gen_cat_kit_inventario
end type
type cb_agregar from commandbutton within w_gen_cat_kit_inventario
end type
type gb_kit from groupbox within w_gen_cat_kit_inventario
end type
type gb_tipo from groupbox within w_gen_cat_kit_inventario
end type
end forward

global type w_gen_cat_kit_inventario from window
integer width = 4601
integer height = 2272
boolean titlebar = true
string title = "Catálogo de Invenario en Kits"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_kit_inventario dw_kit_inventario
st_5 st_5
st_1 st_1
dw_matgrupo dw_matgrupo
dw_grupomat dw_grupomat
dw_kit dw_kit
dw_tipo dw_tipo
cb_eliminar cb_eliminar
cb_actualizar cb_actualizar
cb_agregar cb_agregar
gb_kit gb_kit
gb_tipo gb_tipo
end type
global w_gen_cat_kit_inventario w_gen_cat_kit_inventario

type variables
integer ii_tipo, ii_kit

long il_cvegrupo=0, il_sel_grupo=0
string is_cvemat='', is_sel_material=''
DatawindowChild idwc_grupomat, idwc_matgrupo


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

on w_gen_cat_kit_inventario.create
this.dw_kit_inventario=create dw_kit_inventario
this.st_5=create st_5
this.st_1=create st_1
this.dw_matgrupo=create dw_matgrupo
this.dw_grupomat=create dw_grupomat
this.dw_kit=create dw_kit
this.dw_tipo=create dw_tipo
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.cb_agregar=create cb_agregar
this.gb_kit=create gb_kit
this.gb_tipo=create gb_tipo
this.Control[]={this.dw_kit_inventario,&
this.st_5,&
this.st_1,&
this.dw_matgrupo,&
this.dw_grupomat,&
this.dw_kit,&
this.dw_tipo,&
this.cb_eliminar,&
this.cb_actualizar,&
this.cb_agregar,&
this.gb_kit,&
this.gb_tipo}
end on

on w_gen_cat_kit_inventario.destroy
destroy(this.dw_kit_inventario)
destroy(this.st_5)
destroy(this.st_1)
destroy(this.dw_matgrupo)
destroy(this.dw_grupomat)
destroy(this.dw_kit)
destroy(this.dw_tipo)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.cb_agregar)
destroy(this.gb_kit)
destroy(this.gb_tipo)
end on

event open;dw_tipo.settransobject(gtr_sumuia)
dw_kit.settransobject(gtr_sumuia)
dw_kit_inventario.settransobject(gtr_sumuia)

dw_tipo.Retrieve(gi_depto,gi_area,ii_tipo)
if dw_tipo.RowCount()>0 then dw_tipo.ScrollToRow(1)

dw_grupomat.settransobject(gtr_sumuia)
dw_grupomat.getchild('descripcion',idwc_grupomat)
idwc_grupomat.settransobject(gtr_sumuia)
idwc_grupomat.Retrieve(gi_depto,gi_area)
if idwc_grupomat.RowCount()>0 then dw_grupomat.insertrow(0)

dw_matgrupo.settransobject(gtr_sumuia)
dw_matgrupo.getchild('descripcion',idwc_matgrupo)
idwc_matgrupo.settransobject(gtr_sumuia)
dw_kit_inventario.Retrieve(gi_depto,gi_area,ii_tipo,ii_kit)


end event

type dw_kit_inventario from datawindow within w_gen_cat_kit_inventario
integer x = 48
integer y = 1146
integer width = 4048
integer height = 816
integer taborder = 50
string title = "none"
string dataobject = "d_gen_cat_kit_inventario_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then 
	il_sel_grupo=dw_kit_inventario.GetItemNumber(currentrow,'cvegrupo')
	is_sel_material=dw_kit_inventario.GetItemString(currentrow,'cvematerial')
end if
end event

type st_5 from statictext within w_gen_cat_kit_inventario
integer x = 40
integer y = 989
integer width = 293
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Material"
boolean focusrectangle = false
end type

type st_1 from statictext within w_gen_cat_kit_inventario
integer x = 44
integer y = 899
integer width = 293
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Grupo"
boolean focusrectangle = false
end type

type dw_matgrupo from u_basedw within w_gen_cat_kit_inventario
integer x = 366
integer y = 976
integer width = 1467
integer height = 80
integer taborder = 30
string dataobject = "d_gen_matgrupo_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;is_cvemat=this.gettext()

end event

type dw_grupomat from u_basedw within w_gen_cat_kit_inventario
integer x = 366
integer y = 883
integer width = 1467
integer height = 80
integer taborder = 20
string dataobject = "d_gen_grupomat_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then  il_cvegrupo=long(trim(this.gettext()))
is_cvemat=''
dw_matgrupo.Reset()
idwc_matgrupo.Retrieve(gi_depto,gi_area,il_cvegrupo)
if idwc_matgrupo.RowCount()>0 then dw_matgrupo.insertrow(0)


end event

type dw_kit from datawindow within w_gen_cat_kit_inventario
integer x = 2304
integer y = 90
integer width = 2117
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
dw_kit_inventario.Retrieve(gi_depto,gi_area,ii_tipo,ii_kit)


end event

type dw_tipo from datawindow within w_gen_cat_kit_inventario
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

event rowfocuschanged;if currentrow>0 then
	ii_tipo=dw_tipo.GetItemNumber(currentrow,'cvetipokit')
	ii_kit=0
	
	dw_kit.Reset()
	dw_kit.Retrieve(gi_depto,gi_area,ii_tipo)

	if dw_kit.RowCount()>0 then dw_kit.ScrollToRow(1)
end if


end event

type cb_eliminar from commandbutton within w_gen_cat_kit_inventario
integer x = 3697
integer y = 2016
integer width = 406
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

if dw_kit_inventario.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		dw_kit_inventario.update()
		commit using gtr_sumuia;
		
		//Eliminar
		delete from dbo.spre_materiales_kit_inventario
		where cvedepto=:gi_depto and cvearea=:gi_area and cvetipokit=:ii_tipo and cvekit=:ii_kit
		and cvegrupo=:il_sel_grupo and cvematerial=:is_sel_material
		using gtr_sumuia;
		
		if gtr_sumuia.SQLCode = -1 then 
			messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
			rollback using gtr_sumuia;
		else
			messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
			commit using gtr_sumuia;	
		end if		
		
		dw_kit_inventario.Retrieve(gi_depto,gi_area,ii_tipo,ii_kit)
		if dw_kit_inventario.RowCount()>0 then dw_kit_inventario.ScrollToRow(1)		

	end if
	
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_kit_inventario
integer x = 3273
integer y = 2016
integer width = 369
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
	
if dw_kit_inventario.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		if dw_kit_inventario.update()>0 then
			commit using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
		else
			rollback using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
		end if

	end if

end if
	
end event

type cb_agregar from commandbutton within w_gen_cat_kit_inventario
integer x = 1883
integer y = 963
integer width = 464
integer height = 99
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Agregar"
end type

event clicked;integer li_existe=0
long ll_nva_linea
string ls_material, ls_grupo, ls_find

if il_cvegrupo>0 and is_cvemat<>'' then

	ls_find="cvegrupo="+string(il_cvegrupo)+" and cvematerial='"+is_cvemat+"'"
	li_existe=dw_kit_inventario.Find(ls_find,1,dw_kit_inventario.RowCount())
	
	if li_existe=0 then
		if dw_kit_inventario.accepttext()=1 then
			ll_nva_linea=dw_kit_inventario.insertrow(0)
			dw_kit_inventario.setcolumn(1)
			dw_kit_inventario.scrolltorow(ll_nva_linea)
		end if
		
		dw_kit_inventario.setitem(dw_kit_inventario.getrow(),'cvedepto',gi_depto)
		dw_kit_inventario.setitem(dw_kit_inventario.getrow(),'cvearea',gi_area)
		dw_kit_inventario.setitem(dw_kit_inventario.getrow(),'cvetipokit',ii_tipo)
		dw_kit_inventario.setitem(dw_kit_inventario.getrow(),'cvekit',ii_kit)
		dw_kit_inventario.setitem(dw_kit_inventario.getrow(),'cvegrupo',il_cvegrupo)
		dw_kit_inventario.setitem(dw_kit_inventario.getrow(),'cvematerial',is_cvemat)
		
		select a.descripcion, b.descripcion into :ls_grupo, :ls_material
		from dbo.spre_grupo_material a
		join dbo.spre_materiales b on a.cvedepto=b.cvedepto and a.cvearea=b.cvearea and a.cvegrupo=b.cvegrupo
		where a.cvedepto =:gi_depto and a.cvearea =:gi_area and a.cvegrupo =:il_cvegrupo and b.cvematerial=:is_cvemat
		using gtr_sumuia; 
		
		dw_kit_inventario.setitem(dw_kit_inventario.getrow(),'spre_grupo_material_grupo',ls_grupo)
		dw_kit_inventario.setitem(dw_kit_inventario.getrow(),'spre_materiales_material',ls_material)

	end if
	
end if
end event

type gb_kit from groupbox within w_gen_cat_kit_inventario
integer x = 2275
integer y = 26
integer width = 2205
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

type gb_tipo from groupbox within w_gen_cat_kit_inventario
integer x = 26
integer y = 26
integer width = 2198
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

