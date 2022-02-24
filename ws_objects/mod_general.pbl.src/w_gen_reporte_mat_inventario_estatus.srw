$PBExportHeader$w_gen_reporte_mat_inventario_estatus.srw
forward
global type w_gen_reporte_mat_inventario_estatus from window
end type
type st_area from statictext within w_gen_reporte_mat_inventario_estatus
end type
type dw_area from u_basedw within w_gen_reporte_mat_inventario_estatus
end type
type cbx_solicitud from checkbox within w_gen_reporte_mat_inventario_estatus
end type
type st_1 from statictext within w_gen_reporte_mat_inventario_estatus
end type
type cbx_unitario from checkbox within w_gen_reporte_mat_inventario_estatus
end type
type cbx_limpiar from checkbox within w_gen_reporte_mat_inventario_estatus
end type
type dw_csal_mat_estatus from u_basedw within w_gen_reporte_mat_inventario_estatus
end type
type st_material from statictext within w_gen_reporte_mat_inventario_estatus
end type
type st_grupo from statictext within w_gen_reporte_mat_inventario_estatus
end type
type dw_csal_mat_grupo from u_basedw within w_gen_reporte_mat_inventario_estatus
end type
type cb_filtrar from commandbutton within w_gen_reporte_mat_inventario_estatus
end type
type dw_csal_mat_inventario from datawindow within w_gen_reporte_mat_inventario_estatus
end type
type cb_cargar from commandbutton within w_gen_reporte_mat_inventario_estatus
end type
type dw_rep_mat_inventario_estatus from datawindow within w_gen_reporte_mat_inventario_estatus
end type
type gb_filtros from groupbox within w_gen_reporte_mat_inventario_estatus
end type
type dw_csal_mat_material from u_basedw within w_gen_reporte_mat_inventario_estatus
end type
type dw_mat_prestamo_actual from datawindow within w_gen_reporte_mat_inventario_estatus
end type
end forward

global type w_gen_reporte_mat_inventario_estatus from window
integer width = 6176
integer height = 2896
boolean titlebar = true
string title = "Reporte de Estatus de Inventario"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
st_area st_area
dw_area dw_area
cbx_solicitud cbx_solicitud
st_1 st_1
cbx_unitario cbx_unitario
cbx_limpiar cbx_limpiar
dw_csal_mat_estatus dw_csal_mat_estatus
st_material st_material
st_grupo st_grupo
dw_csal_mat_grupo dw_csal_mat_grupo
cb_filtrar cb_filtrar
dw_csal_mat_inventario dw_csal_mat_inventario
cb_cargar cb_cargar
dw_rep_mat_inventario_estatus dw_rep_mat_inventario_estatus
gb_filtros gb_filtros
dw_csal_mat_material dw_csal_mat_material
dw_mat_prestamo_actual dw_mat_prestamo_actual
end type
global w_gen_reporte_mat_inventario_estatus w_gen_reporte_mat_inventario_estatus

type variables
DatawindowChild idwc_estatus, idwc_material, idwc_grupo
DatawindowChild idwc_area

string  is_sort='#3A #4A #5A'

integer il_estatus=0, il_grupo=-1, ii_cvearea, ii_tipou_sel
string is_material=''
integer ii_venta
end variables

forward prototypes
public subroutine uf_limpiar_filtro ()
public subroutine uf_carga_inventario (datetime p_fechahora)
end prototypes

public subroutine uf_limpiar_filtro ();cbx_unitario.checked=false
cbx_solicitud.checked=false

//Estatus
dw_csal_mat_estatus.Reset()
idwc_estatus.Retrieve()
if idwc_estatus.RowCount()>0 then dw_csal_mat_estatus.InsertRow(0)
	
//Materia
dw_csal_mat_material.Reset()
idwc_material.Reset()
idwc_material.Retrieve( gi_depto,ii_cvearea,il_grupo)
if idwc_material.RowCount()>0 then dw_csal_mat_material.insertrow(0)
	
//Grupo
dw_csal_mat_grupo.Reset()
idwc_grupo.Reset()
idwc_grupo.Retrieve(gi_depto,ii_cvearea)
if idwc_grupo.RowCount()>0 then dw_csal_mat_grupo.insertrow(0)
			
if gi_depto=10 then
	dw_area.Reset()
	idwc_area.Reset()
	idwc_area.Retrieve(gi_depto)
	if idwc_area.RowCount()>0 then dw_area.insertrow(0)
end if

if gi_depto=2 and gi_area=2 then
	idwc_grupo.SetFilter('cvegrupo <> 6')
	idwc_grupo.Filter()
end if
			
is_material=''
il_grupo=0
il_estatus=-1
end subroutine

public subroutine uf_carga_inventario (datetime p_fechahora);integer li_inventario, li_i, li_articulo, li_cvegrupo, li_prestamo
string ls_num_serie, ls_cvematerial

SetPointer(HourGlass!)

dw_csal_mat_inventario.reset()
dw_rep_mat_inventario_estatus.reset()
dw_rep_mat_inventario_estatus.SetRedraw(false)

dw_mat_prestamo_actual.reset()
dw_mat_prestamo_actual.SetFilter('')
dw_mat_prestamo_actual.Filter()

dw_csal_mat_inventario.retrieve(gi_depto,ii_cvearea)

if gi_depto=2 and gi_area=1 then
	dw_csal_mat_inventario.SetFilter('tipo_unidad=0')
	dw_csal_mat_inventario.Filter()
end if

if gi_depto=2 and gi_area=2 then
	dw_csal_mat_inventario.SetFilter('spre_inventario_cvegrupo<>6')
	dw_csal_mat_inventario.Filter()
end if


li_inventario=dw_csal_mat_inventario.rowcount()

	for li_i=1 to li_inventario
		
		dw_rep_mat_inventario_estatus.insertrow(0)
		dw_rep_mat_inventario_estatus.SetItem(li_i, "cvedepto", dw_csal_mat_inventario.GetItemNumber(li_i,"spre_inventario_cvedepto"))	
		dw_rep_mat_inventario_estatus.SetItem(li_i, "cvearea", dw_csal_mat_inventario.GetItemNumber(li_i,"spre_inventario_cvearea"))	
		dw_rep_mat_inventario_estatus.SetItem(li_i, "cvematerial", dw_csal_mat_inventario.GetItemString(li_i,"spre_inventario_cvematerial"))	
		dw_rep_mat_inventario_estatus.SetItem(li_i, "cvegrupo", dw_csal_mat_inventario.GetItemNumber(li_i,"spre_inventario_cvegrupo"))	
		dw_rep_mat_inventario_estatus.SetItem(li_i, "num_serie", dw_csal_mat_inventario.GetItemString(li_i,"spre_inventario_num_serie"))	
		dw_rep_mat_inventario_estatus.SetItem(li_i, "material", dw_csal_mat_inventario.GetItemString(li_i,"spre_materiales_descripcion"))	
		dw_rep_mat_inventario_estatus.SetItem(li_i, "estatus", dw_csal_mat_inventario.GetItemString(li_i,"spre_estatus_mat_descestatus"))	
		dw_rep_mat_inventario_estatus.SetItem(li_i, "cveestatus", dw_csal_mat_inventario.GetItemNumber(li_i,"spre_estatus_mat_cveestatus"))	
		dw_rep_mat_inventario_estatus.SetItem(li_i, "cantidad", dw_csal_mat_inventario.GetItemNumber(li_i,"cantidad"))	
		dw_rep_mat_inventario_estatus.SetItem(li_i, "tipo_unidad", dw_csal_mat_inventario.GetItemNumber(li_i,"tipo_unidad"))	
		
		if dw_csal_mat_inventario.GetItemNumber(li_i,"spre_estatus_mat_cveestatus") = 2 then
			dw_rep_mat_inventario_estatus.SetItem(li_i, "estatus", 'Disponible')	
			dw_rep_mat_inventario_estatus.SetItem(li_i, "cveestatus", 1)	
		end if
		
		dw_rep_mat_inventario_estatus.SetItem(li_i, "prestamo_unitario", dw_csal_mat_inventario.GetItemNumber(li_i,"spre_inventario_prestamo_unitario"))	
		dw_rep_mat_inventario_estatus.SetItem(li_i, "grupo_material", dw_csal_mat_inventario.GetItemString(li_i,"spre_grupo_material_descripcion"))

	next

//Marcar préstamos
dw_mat_prestamo_actual.retrieve(gi_depto,ii_cvearea,p_fechahora)
if gi_depto=8 and gi_area=1 then
	dw_mat_prestamo_actual.SetFilter('hoy=1')
	dw_mat_prestamo_actual.Filter()	
end if
li_prestamo=dw_mat_prestamo_actual.RowCount()


for li_i=1 to li_prestamo
	
	ls_cvematerial=dw_mat_prestamo_actual.GetItemString(li_i,"spre_sol_materiales_cvematerial")
	li_cvegrupo=dw_mat_prestamo_actual.GetItemNumber(li_i,"spre_sol_materiales_cvegrupo")
	ls_num_serie=dw_mat_prestamo_actual.GetItemString(li_i,"spre_sol_materiales_num_serie")
	
	li_articulo=dw_rep_mat_inventario_estatus.Find("cvematerial='"+ls_cvematerial+"' and cvegrupo="+string(li_cvegrupo)+" and num_serie='"+ls_num_serie+"'",1,li_inventario)
	
	if li_articulo>0 then
		
		dw_rep_mat_inventario_estatus.SetItem(li_articulo, "folio_actual", dw_mat_prestamo_actual.GetItemNumber(li_i,"spre_sol_materiales_folio"))	
		dw_rep_mat_inventario_estatus.SetItem(li_articulo, "solicitanteid_actual", dw_mat_prestamo_actual.GetItemNumber(li_i,"spre_solicitud_solicitanteid"))	
		dw_rep_mat_inventario_estatus.SetItem(li_articulo, "solicitante_actual", string(dw_mat_prestamo_actual.GetItemNumber(li_i,"spre_solicitud_solicitanteid"))+' '+dw_mat_prestamo_actual.GetItemString(li_i,"spre_prestamo_material_solicitantenombre"))	
		dw_rep_mat_inventario_estatus.SetItem(li_articulo, "fecha_inicio_actual", dw_mat_prestamo_actual.GetItemDateTime(li_i,"spre_sol_materiales_fecha_inicio"))	
		dw_rep_mat_inventario_estatus.SetItem(li_articulo, "fecha_final_actual", dw_mat_prestamo_actual.GetItemDateTime(li_i,"spre_sol_materiales_fecha_final"))	
		if dw_mat_prestamo_actual.GetItemNumber(li_i,"spre_sol_materiales_status") = 1  then dw_rep_mat_inventario_estatus.SetItem(li_articulo, "estatus", "Prestado")	
		if dw_mat_prestamo_actual.GetItemNumber(li_i,"spre_sol_materiales_status") = 3  then dw_rep_mat_inventario_estatus.SetItem(li_articulo, "estatus", "Multa")	
		if dw_mat_prestamo_actual.GetItemNumber(li_i,"spre_sol_materiales_status") = 2  then dw_rep_mat_inventario_estatus.SetItem(li_articulo, "estatus", "Entrega Parcial")
		dw_rep_mat_inventario_estatus.SetItem(li_articulo, "cveestatus", 2)	
		if dw_rep_mat_inventario_estatus.GetItemNumber(li_articulo, "tipo_unidad")=0 then dw_rep_mat_inventario_estatus.SetItem(li_articulo, "cantidad",0) 

	end if
	
next


if dw_rep_mat_inventario_estatus.rowcount()>0 then dw_rep_mat_inventario_estatus.ScrollToRow(1)
dw_rep_mat_inventario_estatus.SetSort(is_sort)
dw_rep_mat_inventario_estatus.Sort()
dw_rep_mat_inventario_estatus.SetFocus()
dw_rep_mat_inventario_estatus.SetRedraw(true)

SetPointer(Arrow!)

if dw_rep_mat_inventario_estatus.rowcount()>0 then
	cbx_unitario.enabled=true
	cbx_solicitud.enabled=true
	dw_csal_mat_estatus.enabled=true
	dw_csal_mat_material.enabled=true
	dw_csal_mat_grupo.enabled=true
	cbx_limpiar.enabled=true
end if
end subroutine

on w_gen_reporte_mat_inventario_estatus.create
this.st_area=create st_area
this.dw_area=create dw_area
this.cbx_solicitud=create cbx_solicitud
this.st_1=create st_1
this.cbx_unitario=create cbx_unitario
this.cbx_limpiar=create cbx_limpiar
this.dw_csal_mat_estatus=create dw_csal_mat_estatus
this.st_material=create st_material
this.st_grupo=create st_grupo
this.dw_csal_mat_grupo=create dw_csal_mat_grupo
this.cb_filtrar=create cb_filtrar
this.dw_csal_mat_inventario=create dw_csal_mat_inventario
this.cb_cargar=create cb_cargar
this.dw_rep_mat_inventario_estatus=create dw_rep_mat_inventario_estatus
this.gb_filtros=create gb_filtros
this.dw_csal_mat_material=create dw_csal_mat_material
this.dw_mat_prestamo_actual=create dw_mat_prestamo_actual
this.Control[]={this.st_area,&
this.dw_area,&
this.cbx_solicitud,&
this.st_1,&
this.cbx_unitario,&
this.cbx_limpiar,&
this.dw_csal_mat_estatus,&
this.st_material,&
this.st_grupo,&
this.dw_csal_mat_grupo,&
this.cb_filtrar,&
this.dw_csal_mat_inventario,&
this.cb_cargar,&
this.dw_rep_mat_inventario_estatus,&
this.gb_filtros,&
this.dw_csal_mat_material,&
this.dw_mat_prestamo_actual}
end on

on w_gen_reporte_mat_inventario_estatus.destroy
destroy(this.st_area)
destroy(this.dw_area)
destroy(this.cbx_solicitud)
destroy(this.st_1)
destroy(this.cbx_unitario)
destroy(this.cbx_limpiar)
destroy(this.dw_csal_mat_estatus)
destroy(this.st_material)
destroy(this.st_grupo)
destroy(this.dw_csal_mat_grupo)
destroy(this.cb_filtrar)
destroy(this.dw_csal_mat_inventario)
destroy(this.cb_cargar)
destroy(this.dw_rep_mat_inventario_estatus)
destroy(this.gb_filtros)
destroy(this.dw_csal_mat_material)
destroy(this.dw_mat_prestamo_actual)
end on

event open;dw_csal_mat_inventario.setTransObject(gtr_sumuia)
dw_mat_prestamo_actual.setTransObject(gtr_sumuia)
 
//Estatus
dw_csal_mat_estatus.settransobject(gtr_escolar)
dw_csal_mat_estatus.getchild('estatus',idwc_estatus)
idwc_estatus.settransobject(gtr_sumuia)

//Material
dw_csal_mat_material.settransobject(gtr_escolar)
dw_csal_mat_material.getchild('material',idwc_material)
idwc_material.settransobject(gtr_sumuia)

//Grupo
dw_csal_mat_grupo.settransobject(gtr_escolar)
dw_csal_mat_grupo.getchild('matgrupo',idwc_grupo)
idwc_grupo.settransobject(gtr_sumuia)


if gi_areamul=1 then
	dw_area.settransobject(gtr_sumuia)
	dw_area.getchild('area',idwc_area)
	idwc_area.settransobject(gtr_sumuia)
	
	idwc_area.Retrieve(gi_depto)
	if idwc_area.RowCount()>0 then 
		dw_area.insertrow(0)
		dw_area.SetItem(1,'area',idwc_area.GetItemString(1,'descripcion'))
		ii_cvearea=idwc_area.GetItemNumber(1,'cvearea')
	end if
else
	ii_cvearea=gi_area	
	st_area.visible=false
	dw_area.visible=false
end if

ii_tipou_sel=ii_cvearea

if (gi_depto=9 and ii_cvearea=2) then
	dw_rep_mat_inventario_estatus.object.cantidad.visible=true
	dw_rep_mat_inventario_estatus.object.cantidad_t.visible=true
else
	dw_rep_mat_inventario_estatus.object.cantidad.visible=false
	dw_rep_mat_inventario_estatus.object.cantidad_t.visible=false	
end if

end event

type st_area from statictext within w_gen_reporte_mat_inventario_estatus
integer x = 27
integer y = 172
integer width = 320
integer height = 52
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
string text = "Area:"
boolean focusrectangle = false
end type

type dw_area from u_basedw within w_gen_reporte_mat_inventario_estatus
integer x = 27
integer y = 236
integer width = 978
integer height = 80
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_gen_cat_area_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("area", "area", "area")
end event

event itemchanged;call super::itemchanged;ii_tipou_sel=long(this.gettext())

end event

type cbx_solicitud from checkbox within w_gen_reporte_mat_inventario_estatus
integer x = 1157
integer y = 200
integer width = 544
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Solicitud activa"
end type

type st_1 from statictext within w_gen_reporte_mat_inventario_estatus
integer x = 1851
integer y = 108
integer width = 192
integer height = 52
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
string text = "Grupo:"
boolean focusrectangle = false
end type

type cbx_unitario from checkbox within w_gen_reporte_mat_inventario_estatus
integer x = 1157
integer y = 92
integer width = 544
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Préstamo Unitario"
end type

type cbx_limpiar from checkbox within w_gen_reporte_mat_inventario_estatus
integer x = 4032
integer y = 204
integer width = 283
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Limpiar"
end type

event clicked;uf_limpiar_filtro()

dw_rep_mat_inventario_estatus.SetRedraw(false)
dw_rep_mat_inventario_estatus.SetFilter('')
dw_rep_mat_inventario_estatus.Filter()
dw_rep_mat_inventario_estatus.SetRedraw(true)

this.checked=false
end event

type dw_csal_mat_estatus from u_basedw within w_gen_reporte_mat_inventario_estatus
integer x = 3433
integer y = 92
integer width = 457
integer height = 80
integer taborder = 80
boolean enabled = false
string dataobject = "d_csal_mat_matestatus_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("estatus", "estatus", "estatus")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then il_estatus=integer(trim(this.gettext()))




end event

type st_material from statictext within w_gen_reporte_mat_inventario_estatus
integer x = 1815
integer y = 200
integer width = 215
integer height = 52
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
string text = "Material:"
boolean focusrectangle = false
end type

type st_grupo from statictext within w_gen_reporte_mat_inventario_estatus
integer x = 3227
integer y = 108
integer width = 215
integer height = 52
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
string text = "Estatus:"
boolean focusrectangle = false
end type

type dw_csal_mat_grupo from u_basedw within w_gen_reporte_mat_inventario_estatus
integer x = 2048
integer y = 92
integer width = 736
integer height = 80
integer taborder = 100
boolean enabled = false
string dataobject = "d_csal_mat_matgrupo_drop"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("matgrupo", "matgrupo", "matgrupo")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then il_grupo=integer(trim(this.gettext()))

dw_csal_mat_material.Reset()

idwc_material.Retrieve(gi_depto,ii_cvearea,il_grupo)

if gi_depto=2 then
	idwc_material.SetFilter('disponibilidad=0')
	idwc_material.Filter()
end if

if idwc_material.RowCount()>0 then dw_csal_mat_material.insertrow(0)



end event

type cb_filtrar from commandbutton within w_gen_reporte_mat_inventario_estatus
integer x = 4027
integer y = 76
integer width = 274
integer height = 92
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Filtrar"
end type

event clicked;string ls_filtro='', ls_estatus=" and "

dw_rep_mat_inventario_estatus.SetRedraw(false)
dw_rep_mat_inventario_estatus.SetFilter(ls_filtro)
dw_rep_mat_inventario_estatus.Filter()

//Préstamo Unitario
if cbx_unitario.checked=true then ls_filtro=ls_filtro+" and prestamo_unitario=1"

//Solicitud
if cbx_solicitud.checked=true then ls_filtro=ls_filtro+" and folio_actual>0"

//Estatus
if il_estatus>-1 then ls_filtro=ls_filtro+" and cveestatus="+string(il_estatus)

//Material
if is_material<>'' then ls_filtro=ls_filtro+" and cvematerial='"+is_material+"'"

//Grupo
if il_grupo>0 then ls_filtro=ls_filtro+" and cvegrupo="+string(il_grupo)


ls_filtro=mid(ls_filtro,6)

dw_rep_mat_inventario_estatus.SetFilter(ls_filtro)
dw_rep_mat_inventario_estatus.Filter()
dw_rep_mat_inventario_estatus.SetRedraw(true)

end event

type dw_csal_mat_inventario from datawindow within w_gen_reporte_mat_inventario_estatus
boolean visible = false
integer x = 5586
integer y = 124
integer width = 142
integer height = 100
string title = "none"
string dataobject = "d_gen_mat_inventario"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cargar from commandbutton within w_gen_reporte_mat_inventario_estatus
integer x = 27
integer y = 52
integer width = 626
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cargar Inventario"
boolean default = true
end type

event clicked;datetime ld_fechahora

ld_fechahora=datetime(today(),now())

ii_cvearea=ii_tipou_sel

uf_carga_inventario(ld_fechahora)
		
uf_limpiar_filtro()

end event

type dw_rep_mat_inventario_estatus from datawindow within w_gen_reporte_mat_inventario_estatus
integer x = 14
integer y = 372
integer width = 6107
integer height = 2392
string dataobject = "d_gen_rep_mat_inventario_estatus"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.Name='p_salvar' then f_exportar_reporte(dw_rep_mat_inventario_estatus,0,'')
	
	if dwo.Type = "text" then
		
		choose case string(dwo.Name)
	
			case 'cvematerial_t'
				is_sort="#3A #4A #5A"
				this.Modify("cvematerial_t.background.color='11527407'")
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("prestamo_unitario_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("cantidad_t.background.color='15793151'")

			case 'cvegrupo_t'
				is_sort="#15A #5A"
				this.Modify("cvematerial_t.background.color='15793151'")
				this.Modify("cvegrupo_t.background.color='11527407'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("prestamo_unitario_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")	
				this.Modify("cantidad_t.background.color='15793151'")

			case 'num_serie_t'
				is_sort="#5A #3A"
				this.Modify("cvematerial_t.background.color='15793151'")
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='11527407'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("prestamo_unitario_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("cantidad_t.background.color='15793151'")

			case 'material_t'
				is_sort="#6A #5A"
				this.Modify("cvematerial_t.background.color='15793151'")
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='11527407'")
				this.Modify("prestamo_unitario_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")	
				this.Modify("cantidad_t.background.color='15793151'")

			case 'prestamo_unitario_t'
				is_sort="#14A #3A #5A"
				this.Modify("cvematerial_t.background.color='15793151'")
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("prestamo_unitario_t.background.color='11527407'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("cantidad_t.background.color='15793151'")

			case 'estatus_t'
				is_sort="#8A #3A #5A"
				this.Modify("cvematerial_t.background.color='15793151'")
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("prestamo_unitario_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='11527407'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("cantidad_t.background.color='15793151'")

			case 'folio_actual_t'
				is_sort="#9A #3A #5A"
				this.Modify("cvematerial_t.background.color='15793151'")
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("prestamo_unitario_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='11527407'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("cantidad_t.background.color='15793151'")

			case 'fecha_inicio_t'
				is_sort="#10A #3A #5A"
				this.Modify("cvematerial_t.background.color='15793151'")
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("prestamo_unitario_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='11527407'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("cantidad_t.background.color='15793151'")

			case 'fecha_final_t'
				is_sort="#11A #3A #5A"
				this.Modify("cvematerial_t.background.color='15793151'")
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("prestamo_unitario_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='11527407'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("cantidad_t.background.color='15793151'")

			case 'solicitante_actual_t'
				is_sort="#13A #3A #5A"
				this.Modify("cvematerial_t.background.color='15793151'")
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("prestamo_unitario_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='11527407'")
				this.Modify("cantidad_t.background.color='15793151'")

			case 'cantidad_t'
				is_sort="#16A #15A #5A"
				this.Modify("cvematerial_t.background.color='15793151'")
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("prestamo_unitario_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("cantidad_t.background.color='11527407'")				
				
		end choose

		this.SetSort(is_sort) 
		this.Sort() 		
		
	end if
	
end event

type gb_filtros from groupbox within w_gen_reporte_mat_inventario_estatus
integer x = 1097
integer y = 20
integer width = 3991
integer height = 300
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Filtros "
end type

type dw_csal_mat_material from u_basedw within w_gen_reporte_mat_inventario_estatus
integer x = 2048
integer y = 188
integer width = 978
integer height = 80
integer taborder = 90
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_csal_mat_matmaterial_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("material", "material", "material")
end event

event itemchanged;call super::itemchanged;is_material=this.gettext()

end event

type dw_mat_prestamo_actual from datawindow within w_gen_reporte_mat_inventario_estatus
boolean visible = false
integer x = 384
integer y = 440
integer width = 119
integer height = 80
string title = "none"
string dataobject = "d_gen_mat_prestamo_actual"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

