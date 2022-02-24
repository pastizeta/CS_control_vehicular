$PBExportHeader$w_dis_reporte_mat_inventario_estatus.srw
forward
global type w_dis_reporte_mat_inventario_estatus from window
end type
type sle_observaciones from singlelineedit within w_dis_reporte_mat_inventario_estatus
end type
type st_observaciones from statictext within w_dis_reporte_mat_inventario_estatus
end type
type st_marca from statictext within w_dis_reporte_mat_inventario_estatus
end type
type sle_marca from singlelineedit within w_dis_reporte_mat_inventario_estatus
end type
type dw_tamano from u_basedw within w_dis_reporte_mat_inventario_estatus
end type
type st_tamano from statictext within w_dis_reporte_mat_inventario_estatus
end type
type dw_tipo from u_basedw within w_dis_reporte_mat_inventario_estatus
end type
type st_tipo from statictext within w_dis_reporte_mat_inventario_estatus
end type
type dw_matgrupo from u_basedw within w_dis_reporte_mat_inventario_estatus
end type
type st_material from statictext within w_dis_reporte_mat_inventario_estatus
end type
type dw_grupomat from u_basedw within w_dis_reporte_mat_inventario_estatus
end type
type st_1 from statictext within w_dis_reporte_mat_inventario_estatus
end type
type cbx_solicitud from checkbox within w_dis_reporte_mat_inventario_estatus
end type
type cbx_limpiar from checkbox within w_dis_reporte_mat_inventario_estatus
end type
type dw_dis_mat_estatus from u_basedw within w_dis_reporte_mat_inventario_estatus
end type
type st_grupo from statictext within w_dis_reporte_mat_inventario_estatus
end type
type cb_filtrar from commandbutton within w_dis_reporte_mat_inventario_estatus
end type
type cb_cargar from commandbutton within w_dis_reporte_mat_inventario_estatus
end type
type dw_dis_rep_mat_inventario_estatus from datawindow within w_dis_reporte_mat_inventario_estatus
end type
type gb_filtros from groupbox within w_dis_reporte_mat_inventario_estatus
end type
type dw_dis_mat_inventario from datawindow within w_dis_reporte_mat_inventario_estatus
end type
type dw_dis_mat_prestamo_actual from datawindow within w_dis_reporte_mat_inventario_estatus
end type
end forward

global type w_dis_reporte_mat_inventario_estatus from window
integer width = 6316
integer height = 2698
boolean titlebar = true
string title = "Reporte de Estatus de Inventario"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
sle_observaciones sle_observaciones
st_observaciones st_observaciones
st_marca st_marca
sle_marca sle_marca
dw_tamano dw_tamano
st_tamano st_tamano
dw_tipo dw_tipo
st_tipo st_tipo
dw_matgrupo dw_matgrupo
st_material st_material
dw_grupomat dw_grupomat
st_1 st_1
cbx_solicitud cbx_solicitud
cbx_limpiar cbx_limpiar
dw_dis_mat_estatus dw_dis_mat_estatus
st_grupo st_grupo
cb_filtrar cb_filtrar
cb_cargar cb_cargar
dw_dis_rep_mat_inventario_estatus dw_dis_rep_mat_inventario_estatus
gb_filtros gb_filtros
dw_dis_mat_inventario dw_dis_mat_inventario
dw_dis_mat_prestamo_actual dw_dis_mat_prestamo_actual
end type
global w_dis_reporte_mat_inventario_estatus w_dis_reporte_mat_inventario_estatus

type variables
DatawindowChild idwc_estatus, idwc_grupomat, idwc_matgrupo, idwc_tipo, idwc_tamano

string  is_sort='#3A #4A #5A'

integer il_estatus=0, il_cvegrupo=-1, il_cvetipo=-1, il_cvetamano=-1
string is_cvemat=''

end variables

forward prototypes
public subroutine uf_limpiar_filtro ()
public subroutine uf_carga_inventario (datetime p_fechahora)
end prototypes

public subroutine uf_limpiar_filtro ();cbx_solicitud.checked=false
il_cvegrupo=-1
is_cvemat=''
il_cvetipo=-1
il_cvetamano=-1

//Estatus
dw_dis_mat_estatus.Reset()
idwc_estatus.Retrieve()
if idwc_estatus.RowCount()>0 then dw_dis_mat_estatus.InsertRow(0)

//Grupo
dw_grupomat.Reset()
idwc_grupomat.Reset()

//Materia
dw_matgrupo.Reset()
idwc_matgrupo.Reset()
	
//Tipo
dw_tipo.Reset()
idwc_tipo.Reset()

//Tamano
dw_tamano.Reset()
idwc_tipo.Reset()

idwc_grupomat.Retrieve( gi_depto,gi_area)
if idwc_grupomat.RowCount()>0 then dw_grupomat.insertrow(0)


is_cvemat=''
il_cvegrupo=0
il_estatus=-1
sle_marca.text=''
sle_observaciones.text=''
end subroutine

public subroutine uf_carga_inventario (datetime p_fechahora);integer li_inventario, li_i, li_articulo, li_cvegrupo, li_prestamo
string ls_num_serie, ls_cvematerial

SetPointer(HourGlass!)

dw_dis_mat_inventario.reset()
dw_dis_mat_prestamo_actual.reset()
dw_dis_rep_mat_inventario_estatus.reset()
dw_dis_rep_mat_inventario_estatus.SetRedraw(false)

dw_dis_mat_inventario.retrieve(gi_depto,gi_area)
li_inventario=dw_dis_mat_inventario.rowcount()

	for li_i=1 to li_inventario
		
		dw_dis_rep_mat_inventario_estatus.insertrow(0)
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "cvedepto", dw_dis_mat_inventario.GetItemNumber(li_i,"spre_inventario_cvedepto"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "cvearea", dw_dis_mat_inventario.GetItemNumber(li_i,"spre_inventario_cvearea"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "cvematerial", dw_dis_mat_inventario.GetItemString(li_i,"spre_inventario_cvematerial"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "cvegrupo", dw_dis_mat_inventario.GetItemNumber(li_i,"spre_inventario_cvegrupo"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "num_serie", dw_dis_mat_inventario.GetItemString(li_i,"spre_inventario_num_serie"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "material", dw_dis_mat_inventario.GetItemString(li_i,"spre_materiales_descripcion"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "estatus", dw_dis_mat_inventario.GetItemString(li_i,"spre_estatus_mat_descestatus"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "cveestatus", dw_dis_mat_inventario.GetItemNumber(li_i,"spre_estatus_mat_cveestatus"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "cvetipo", dw_dis_mat_inventario.GetItemNumber(li_i,"spre_inventario_cvetipo"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "tipo", dw_dis_mat_inventario.GetItemString(li_i,"spre_tipo_materiales_descripcion"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "cvetamano", dw_dis_mat_inventario.GetItemNumber(li_i,"spre_inventario_cvetamano"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "tamano", dw_dis_mat_inventario.GetItemString(li_i,"spre_tamano_materiales_descripcion"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "marca", dw_dis_mat_inventario.GetItemString(li_i,"spre_inventario_marca"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "observaciones", dw_dis_mat_inventario.GetItemString(li_i,"spre_inventario_observaciones"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "folio_req", dw_dis_mat_inventario.GetItemNumber(li_i,"spre_inventario_folio_req"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "cvematerial_req", dw_dis_mat_inventario.GetItemString(li_i,"spre_inventario_cvematerial_req"))	
		
		if dw_dis_mat_inventario.GetItemNumber(li_i,"spre_estatus_mat_cveestatus") = 2 then
			dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "estatus", 'Disponible')	
			dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "cveestatus", 1)	
		end if
		
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "prestamo_unitario", dw_dis_mat_inventario.GetItemNumber(li_i,"spre_inventario_prestamo_unitario"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_i, "grupo_material", dw_dis_mat_inventario.GetItemString(li_i,"spre_grupo_material_descripcion"))

	next

dw_dis_mat_prestamo_actual.retrieve(gi_depto,gi_area,p_fechahora)
li_prestamo=dw_dis_mat_prestamo_actual.RowCount()


for li_i=1 to li_prestamo
	
	ls_cvematerial=dw_dis_mat_prestamo_actual.GetItemString(li_i,"spre_sol_materiales_cvematerial")
	li_cvegrupo=dw_dis_mat_prestamo_actual.GetItemNumber(li_i,"spre_sol_materiales_cvegrupo")
	ls_num_serie=dw_dis_mat_prestamo_actual.GetItemString(li_i,"spre_sol_materiales_num_serie")
	
	li_articulo=dw_dis_rep_mat_inventario_estatus.Find("cvematerial='"+ls_cvematerial+"' and cvegrupo="+string(li_cvegrupo)+" and num_serie='"+ls_num_serie+"'",1,li_inventario)
	
	if li_articulo>0 then
		
		dw_dis_rep_mat_inventario_estatus.SetItem(li_articulo, "folio_actual", dw_dis_mat_prestamo_actual.GetItemNumber(li_i,"spre_sol_materiales_folio"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_articulo, "solicitanteid_actual", dw_dis_mat_prestamo_actual.GetItemNumber(li_i,"spre_solicitud_solicitanteid"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_articulo, "solicitante_actual", string(dw_dis_mat_prestamo_actual.GetItemNumber(li_i,"spre_solicitud_solicitanteid"))+' '+dw_dis_mat_prestamo_actual.GetItemString(li_i,"spre_prestamo_material_solicitantenombre"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_articulo, "fecha_inicio_actual", dw_dis_mat_prestamo_actual.GetItemDateTime(li_i,"spre_sol_materiales_fecha_inicio"))	
		dw_dis_rep_mat_inventario_estatus.SetItem(li_articulo, "fecha_final_actual", dw_dis_mat_prestamo_actual.GetItemDateTime(li_i,"spre_sol_materiales_fecha_final"))	
		if dw_dis_mat_prestamo_actual.GetItemNumber(li_i,"spre_sol_materiales_status") = 1  then dw_dis_rep_mat_inventario_estatus.SetItem(li_articulo, "estatus", "Prestado")	
		if dw_dis_mat_prestamo_actual.GetItemNumber(li_i,"spre_sol_materiales_status") = 3  then dw_dis_rep_mat_inventario_estatus.SetItem(li_articulo, "estatus", "Multa")	
		if dw_dis_mat_prestamo_actual.GetItemNumber(li_i,"spre_sol_materiales_status") = 2  then dw_dis_rep_mat_inventario_estatus.SetItem(li_articulo, "estatus", "Entrega Parcial")
		dw_dis_rep_mat_inventario_estatus.SetItem(li_articulo, "cveestatus", 2)	

	end if
	
next


if dw_dis_rep_mat_inventario_estatus.rowcount()>0 then dw_dis_rep_mat_inventario_estatus.ScrollToRow(1)
dw_dis_rep_mat_inventario_estatus.SetSort(is_sort)
dw_dis_rep_mat_inventario_estatus.Sort()
dw_dis_rep_mat_inventario_estatus.SetFocus()
dw_dis_rep_mat_inventario_estatus.SetRedraw(true)

SetPointer(Arrow!)
 
if dw_dis_rep_mat_inventario_estatus.rowcount()>0 then
	
	cbx_solicitud.enabled=true
	dw_dis_mat_estatus.enabled=true
	
	idwc_grupomat.Retrieve(gi_depto,gi_area)
	if idwc_grupomat.RowCount()>0 then dw_grupomat.insertrow(0)
	
	dw_grupomat.enabled=true
	dw_matgrupo.enabled=true
	dw_tipo.enabled=true
	dw_tamano.enabled=true
	cbx_limpiar.enabled=true
	sle_marca.enabled=true
	sle_observaciones.enabled=true
		
end if
end subroutine

on w_dis_reporte_mat_inventario_estatus.create
this.sle_observaciones=create sle_observaciones
this.st_observaciones=create st_observaciones
this.st_marca=create st_marca
this.sle_marca=create sle_marca
this.dw_tamano=create dw_tamano
this.st_tamano=create st_tamano
this.dw_tipo=create dw_tipo
this.st_tipo=create st_tipo
this.dw_matgrupo=create dw_matgrupo
this.st_material=create st_material
this.dw_grupomat=create dw_grupomat
this.st_1=create st_1
this.cbx_solicitud=create cbx_solicitud
this.cbx_limpiar=create cbx_limpiar
this.dw_dis_mat_estatus=create dw_dis_mat_estatus
this.st_grupo=create st_grupo
this.cb_filtrar=create cb_filtrar
this.cb_cargar=create cb_cargar
this.dw_dis_rep_mat_inventario_estatus=create dw_dis_rep_mat_inventario_estatus
this.gb_filtros=create gb_filtros
this.dw_dis_mat_inventario=create dw_dis_mat_inventario
this.dw_dis_mat_prestamo_actual=create dw_dis_mat_prestamo_actual
this.Control[]={this.sle_observaciones,&
this.st_observaciones,&
this.st_marca,&
this.sle_marca,&
this.dw_tamano,&
this.st_tamano,&
this.dw_tipo,&
this.st_tipo,&
this.dw_matgrupo,&
this.st_material,&
this.dw_grupomat,&
this.st_1,&
this.cbx_solicitud,&
this.cbx_limpiar,&
this.dw_dis_mat_estatus,&
this.st_grupo,&
this.cb_filtrar,&
this.cb_cargar,&
this.dw_dis_rep_mat_inventario_estatus,&
this.gb_filtros,&
this.dw_dis_mat_inventario,&
this.dw_dis_mat_prestamo_actual}
end on

on w_dis_reporte_mat_inventario_estatus.destroy
destroy(this.sle_observaciones)
destroy(this.st_observaciones)
destroy(this.st_marca)
destroy(this.sle_marca)
destroy(this.dw_tamano)
destroy(this.st_tamano)
destroy(this.dw_tipo)
destroy(this.st_tipo)
destroy(this.dw_matgrupo)
destroy(this.st_material)
destroy(this.dw_grupomat)
destroy(this.st_1)
destroy(this.cbx_solicitud)
destroy(this.cbx_limpiar)
destroy(this.dw_dis_mat_estatus)
destroy(this.st_grupo)
destroy(this.cb_filtrar)
destroy(this.cb_cargar)
destroy(this.dw_dis_rep_mat_inventario_estatus)
destroy(this.gb_filtros)
destroy(this.dw_dis_mat_inventario)
destroy(this.dw_dis_mat_prestamo_actual)
end on

event open;dw_dis_mat_inventario.setTransObject(gtr_sumuia)
dw_dis_mat_prestamo_actual.setTransObject(gtr_sumuia)
 
//Estatus
dw_dis_mat_estatus.settransobject(gtr_escolar)
dw_dis_mat_estatus.getchild('estatus',idwc_estatus)
idwc_estatus.settransobject(gtr_sumuia)

//Grupo
dw_grupomat.settransobject(gtr_sumuia)
dw_grupomat.getchild('descripcion',idwc_grupomat)
idwc_grupomat.settransobject(gtr_sumuia)

//Material
dw_matgrupo.settransobject(gtr_sumuia)
dw_matgrupo.getchild('descripcion',idwc_matgrupo)
idwc_matgrupo.settransobject(gtr_sumuia)

//Tipo
dw_tipo.settransobject(gtr_sumuia)
dw_tipo.getchild('descripcion',idwc_tipo)
idwc_tipo.settransobject(gtr_sumuia)

//Tamaño
dw_tamano.settransobject(gtr_sumuia)
dw_tamano.getchild('descripcion',idwc_tamano)
idwc_tamano.settransobject(gtr_sumuia)
end event

type sle_observaciones from singlelineedit within w_dis_reporte_mat_inventario_estatus
integer x = 2962
integer y = 173
integer width = 1013
integer height = 67
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type st_observaciones from statictext within w_dis_reporte_mat_inventario_estatus
integer x = 2582
integer y = 179
integer width = 366
integer height = 51
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
string text = "Observaciones:"
boolean focusrectangle = false
end type

type st_marca from statictext within w_dis_reporte_mat_inventario_estatus
integer x = 2582
integer y = 96
integer width = 216
integer height = 51
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
string text = "Marca:"
boolean focusrectangle = false
end type

type sle_marca from singlelineedit within w_dis_reporte_mat_inventario_estatus
integer x = 2959
integer y = 93
integer width = 1017
integer height = 67
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type dw_tamano from u_basedw within w_dis_reporte_mat_inventario_estatus
integer x = 1046
integer y = 339
integer width = 1467
integer height = 77
integer taborder = 120
boolean enabled = false
string dataobject = "d_gen_mattamano_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then  il_cvetamano=long(trim(this.gettext()))


end event

type st_tamano from statictext within w_dis_reporte_mat_inventario_estatus
integer x = 720
integer y = 352
integer width = 293
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
string text = "Tamaño:"
boolean focusrectangle = false
end type

type dw_tipo from u_basedw within w_dis_reporte_mat_inventario_estatus
integer x = 1046
integer y = 256
integer width = 1467
integer height = 77
integer taborder = 110
boolean enabled = false
string dataobject = "d_gen_mattipo_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then  il_cvetipo=long(trim(this.gettext()))
il_cvetamano=-1

dw_tamano.Reset()

idwc_tamano.Retrieve(gi_depto,gi_area,il_cvegrupo,is_cvemat,il_cvetipo)
if idwc_tamano.RowCount()>0 then 
	dw_tamano.insertrow(0)
	idwc_tamano.ScrollToRow(2)
end if
end event

type st_tipo from statictext within w_dis_reporte_mat_inventario_estatus
integer x = 720
integer y = 269
integer width = 293
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
string text = "Tipo:"
boolean focusrectangle = false
end type

type dw_matgrupo from u_basedw within w_dis_reporte_mat_inventario_estatus
integer x = 1046
integer y = 173
integer width = 1467
integer height = 77
integer taborder = 100
boolean enabled = false
string dataobject = "d_gen_matgrupo_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;is_cvemat=this.gettext()
il_cvetipo=-1
il_cvetamano=-1

dw_tipo.Reset()
dw_tamano.Reset()

idwc_tipo.Retrieve(gi_depto,gi_area,il_cvegrupo,is_cvemat)
if idwc_tipo.RowCount()>0 then 
	dw_tipo.insertrow(0)
	idwc_tipo.ScrollToRow(2)
end if


idwc_tamano.Retrieve(gi_depto,gi_area,il_cvegrupo,is_cvemat,il_cvetipo)
if idwc_tamano.RowCount()>0 then 
	dw_tamano.insertrow(0)
	idwc_tamano.ScrollToRow(2)
end if
end event

type st_material from statictext within w_dis_reporte_mat_inventario_estatus
integer x = 720
integer y = 186
integer width = 293
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
string text = "Función:"
boolean focusrectangle = false
end type

type dw_grupomat from u_basedw within w_dis_reporte_mat_inventario_estatus
integer x = 1046
integer y = 90
integer width = 1467
integer height = 77
integer taborder = 90
boolean enabled = false
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

type st_1 from statictext within w_dis_reporte_mat_inventario_estatus
integer x = 724
integer y = 99
integer width = 293
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30520472
string text = "Nombre:"
boolean focusrectangle = false
end type

type cbx_solicitud from checkbox within w_dis_reporte_mat_inventario_estatus
integer x = 2582
integer y = 346
integer width = 457
integer height = 64
integer textsize = -8
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

type cbx_limpiar from checkbox within w_dis_reporte_mat_inventario_estatus
integer x = 4030
integer y = 179
integer width = 282
integer height = 77
integer textsize = -8
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

dw_dis_rep_mat_inventario_estatus.SetRedraw(false)
dw_dis_rep_mat_inventario_estatus.SetFilter('')
dw_dis_rep_mat_inventario_estatus.Filter()
dw_dis_rep_mat_inventario_estatus.SetRedraw(true)

this.checked=false
end event

type dw_dis_mat_estatus from u_basedw within w_dis_reporte_mat_inventario_estatus
integer x = 2959
integer y = 250
integer width = 457
integer height = 77
integer taborder = 80
boolean enabled = false
string dataobject = "d_csal_mat_matestatus_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("estatus", "estatus", "estatus")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then il_estatus=integer(trim(this.gettext()))




end event

type st_grupo from statictext within w_dis_reporte_mat_inventario_estatus
integer x = 2582
integer y = 266
integer width = 216
integer height = 51
integer textsize = -8
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

type cb_filtrar from commandbutton within w_dis_reporte_mat_inventario_estatus
integer x = 4027
integer y = 83
integer width = 274
integer height = 90
integer taborder = 110
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Filtrar"
end type

event clicked;string ls_filtro='', ls_estatus=" and "

dw_dis_rep_mat_inventario_estatus.SetRedraw(false)
dw_dis_rep_mat_inventario_estatus.SetFilter(ls_filtro)
dw_dis_rep_mat_inventario_estatus.Filter()

//Solicitud
if cbx_solicitud.checked=true then ls_filtro=ls_filtro+" and folio_actual>0"

//Estatus
if il_estatus>-1 then ls_filtro=ls_filtro+" and cveestatus="+string(il_estatus)

//Material
if is_cvemat<>'' then ls_filtro=ls_filtro+" and cvematerial='"+is_cvemat+"'"

//Grupo
if il_cvegrupo>0 then ls_filtro=ls_filtro+" and cvegrupo="+string(il_cvegrupo)

//Tipo
if il_cvetipo>-1 then ls_filtro=ls_filtro+" and cvetipo="+string(il_cvetipo)
		
//Tamaño
if il_cvetamano>-1 then ls_filtro=ls_filtro+" and cvetamano="+string(il_cvetamano)


ls_filtro=mid(ls_filtro,6)

dw_dis_rep_mat_inventario_estatus.SetFilter(ls_filtro)
dw_dis_rep_mat_inventario_estatus.Filter()

//Marca
if (trim(sle_marca.text))<>'' then
	ls_filtro=ls_filtro+"upper(marca) like '%"+upper(trim(sle_marca.text))+"%'"
	dw_dis_rep_mat_inventario_estatus.SetFilter(ls_filtro)
	dw_dis_rep_mat_inventario_estatus.Filter()
end if

//Observaciones
if (trim(sle_observaciones.text))<>'' then
	ls_filtro=ls_filtro+"upper(observaciones) like '%"+upper(trim(sle_observaciones.text))+"%'"
	dw_dis_rep_mat_inventario_estatus.SetFilter(ls_filtro)
	dw_dis_rep_mat_inventario_estatus.Filter()
end if

dw_dis_rep_mat_inventario_estatus.SetRedraw(true)

end event

type cb_cargar from commandbutton within w_dis_reporte_mat_inventario_estatus
integer x = 59
integer y = 51
integer width = 497
integer height = 99
integer taborder = 30
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cargar Inventario"
end type

event clicked;datetime ld_fechahora

ld_fechahora=datetime(today(),now())

uf_carga_inventario(ld_fechahora)
		
uf_limpiar_filtro()

end event

type dw_dis_rep_mat_inventario_estatus from datawindow within w_dis_reporte_mat_inventario_estatus
integer x = 15
integer y = 502
integer width = 6250
integer height = 2061
string dataobject = "d_dis_rep_mat_inventario_estatus"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.Name='p_salvar' then f_exportar_reporte(dw_dis_rep_mat_inventario_estatus,1,"Reporte de Estatus de Inventario")

	
	if dwo.Type = "text" then
		
		choose case string(dwo.Name)
	
			case 'cvegrupo_t'
				is_sort="#15A #5A"
				this.Modify("cvegrupo_t.background.color='11527407'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")	
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")	
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='15793151'")	
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	

			case 'num_serie_t'
				is_sort="#5A #3A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='11527407'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")							
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")	
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='15793151'")	
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	
				
			case 'material_t'
				is_sort="#6A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='11527407'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")	
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")	
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	
								
			case 'estatus_t'
				is_sort="#8A #3A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='11527407'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")	
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='15793151'")	
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	
								
			case 'folio_actual_t'
				is_sort="#9A #3A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='11527407'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")	
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='15793151'")	
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	
								
			case 'fecha_inicio_t'
				is_sort="#10A #3A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='11527407'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")	
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='15793151'")	
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	
												
			case 'fecha_final_t'
				is_sort="#11A #3A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='11527407'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")	
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='15793151'")	
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	
												
			case 'solicitante_actual_t'
				is_sort="#13A #3A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='11527407'")
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")	
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='15793151'")	
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	
								
			case 'tipo_t'
				is_sort="#18A #3A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("tipo_t.background.color='11527407'")
				this.Modify("tamano_t.background.color='15793151'")									
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='15793151'")	
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	
								
			case 'tamano_t'
				is_sort="#19A #3A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='11527407'")										
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='15793151'")	
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	
				
			case 'marca_t'
				is_sort="#20A #3A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")										
				this.Modify("marca_t.background.color='11527407'")	
				this.Modify("observaciones_t.background.color='15793151'")													
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	
																
			case 'observaciones_t'
				is_sort="#21A #3A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")										
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='11527407'")													
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")	

			case 'folio_req_t'
				is_sort="#22A #3A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")										
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='15793151'")													
				this.Modify("folio_req_t.background.color='11527407'")	
				this.Modify("cvematerial_req_t.background.color='15793151'")																	

			case 'cvematerial_req_t'
				is_sort="#22A #3A #5A"
				this.Modify("cvegrupo_t.background.color='15793151'")
				this.Modify("num_serie_t.background.color='15793151'")
				this.Modify("material_t.background.color='15793151'")
				this.Modify("estatus_t.background.color='15793151'")
				this.Modify("folio_actual_t.background.color='15793151'")
				this.Modify("fecha_inicio_t.background.color='15793151'")
				this.Modify("fecha_final_t.background.color='15793151'")
				this.Modify("solicitante_actual_t.background.color='15793151'")
				this.Modify("tipo_t.background.color='15793151'")
				this.Modify("tamano_t.background.color='15793151'")										
				this.Modify("marca_t.background.color='15793151'")	
				this.Modify("observaciones_t.background.color='15793151'")													
				this.Modify("folio_req_t.background.color='15793151'")	
				this.Modify("cvematerial_req_t.background.color='11527407'")	
				
		end choose

		this.SetSort(is_sort) 
		this.Sort() 		
		
	end if
	
end event

type gb_filtros from groupbox within w_dis_reporte_mat_inventario_estatus
integer x = 688
integer y = 32
integer width = 5573
integer height = 438
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 30520472
string text = "Filtros "
end type

type dw_dis_mat_inventario from datawindow within w_dis_reporte_mat_inventario_estatus
integer x = 5259
integer y = 560
integer width = 143
integer height = 99
string title = "none"
string dataobject = "d_dis_mat_inventario"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_dis_mat_prestamo_actual from datawindow within w_dis_reporte_mat_inventario_estatus
integer x = 5237
integer y = 733
integer width = 150
integer height = 80
string title = "none"
string dataobject = "d_gen_mat_prestamo_actual"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

