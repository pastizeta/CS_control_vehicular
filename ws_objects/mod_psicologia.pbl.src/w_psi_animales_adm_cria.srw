$PBExportHeader$w_psi_animales_adm_cria.srw
forward
global type w_psi_animales_adm_cria from window
end type
type sle_nombre from singlelineedit within w_psi_animales_adm_cria
end type
type cbx_nombre from checkbox within w_psi_animales_adm_cria
end type
type rb_todo from radiobutton within w_psi_animales_adm_cria
end type
type cb_buscar from commandbutton within w_psi_animales_adm_cria
end type
type cb_exportar from commandbutton within w_psi_animales_adm_cria
end type
type cb_alta from commandbutton within w_psi_animales_adm_cria
end type
type dp_fecha_nacimiento from datepicker within w_psi_animales_adm_cria
end type
type cbx_fecha_nacimiento from checkbox within w_psi_animales_adm_cria
end type
type sle_proveedor from singlelineedit within w_psi_animales_adm_cria
end type
type ddlb_sexo from dropdownlistbox within w_psi_animales_adm_cria
end type
type cbx_proveedor from checkbox within w_psi_animales_adm_cria
end type
type cbx_sexo from checkbox within w_psi_animales_adm_cria
end type
type rb_filtros from radiobutton within w_psi_animales_adm_cria
end type
type sle_cruza from singlelineedit within w_psi_animales_adm_cria
end type
type rb_cruza from radiobutton within w_psi_animales_adm_cria
end type
type rb_cria from radiobutton within w_psi_animales_adm_cria
end type
type sle_cria from singlelineedit within w_psi_animales_adm_cria
end type
type st_reservaciones from statictext within w_psi_animales_adm_cria
end type
type dw_reporte from datawindow within w_psi_animales_adm_cria
end type
type gb_1 from groupbox within w_psi_animales_adm_cria
end type
end forward

global type w_psi_animales_adm_cria from window
integer width = 4937
integer height = 2541
boolean titlebar = true
string title = "Administración de crías"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
sle_nombre sle_nombre
cbx_nombre cbx_nombre
rb_todo rb_todo
cb_buscar cb_buscar
cb_exportar cb_exportar
cb_alta cb_alta
dp_fecha_nacimiento dp_fecha_nacimiento
cbx_fecha_nacimiento cbx_fecha_nacimiento
sle_proveedor sle_proveedor
ddlb_sexo ddlb_sexo
cbx_proveedor cbx_proveedor
cbx_sexo cbx_sexo
rb_filtros rb_filtros
sle_cruza sle_cruza
rb_cruza rb_cruza
rb_cria rb_cria
sle_cria sle_cria
st_reservaciones st_reservaciones
dw_reporte dw_reporte
gb_1 gb_1
end type
global w_psi_animales_adm_cria w_psi_animales_adm_cria

type variables
string is_sexo = ''
string is_consulta = ''
integer ii_exportar=1
end variables

forward prototypes
public subroutine f_cargar_reporte ()
public subroutine f_editar_cria (long p_id_cria)
end prototypes

public subroutine f_cargar_reporte ();string ls_consulta, ls_sexo = '', ls_proveedor, ls_nombre, ls_fecha, ls_cria, ls_cruza
string ls_filtro_solo = '', ls_filtro = ''

dw_reporte.SetRedraw(false)
dw_reporte.Reset()

if rb_filtros.checked = true then 
	 ls_filtro_solo = ' and 0 = -1'
	 
	if cbx_sexo.checked = true then
		 ls_filtro = ls_filtro + " and a.sexo = '" + is_sexo + "'"
		 ls_filtro_solo = ''
	end if
	
	if cbx_proveedor.checked = true then
		ls_proveedor = '%' + trim(sle_proveedor.text) + '%'
		ls_filtro = ls_filtro + " and a.prov_descripcion like '" + ls_proveedor + "'"
		ls_filtro_solo = ''	
	end if

	if cbx_nombre.checked = true then
		ls_nombre = '%' + trim(sle_nombre.text) + '%'
		ls_filtro = ls_filtro + " and a.nombre like '" + ls_nombre + "'"
		ls_filtro_solo = ''	
	end if

	if cbx_fecha_nacimiento.checked = true then
		ls_fecha = mid(dp_fecha_nacimiento.text,7,4)  + '/' + mid(dp_fecha_nacimiento.text,4,2) + '/' + mid(dp_fecha_nacimiento.text,1,2)
		ls_filtro = ls_filtro + " and a.fecha_nacimiento =  '" + ls_fecha+ "'"
		ls_filtro_solo = ''	
	end if
end if

if rb_todo.checked = true then 
	ls_filtro = ''
end if

if rb_cria.checked = true then 
	ls_cria = trim(sle_cria.text)
	if isNumber(ls_cria) = false then ls_cria = '-1'
	ls_filtro = ls_filtro + " and a.id_cria <> 0  and a.id_cria =  " + ls_cria
end if

if rb_cruza.checked = true then 
	ls_cruza = trim(sle_cruza.text)
	if isNumber(ls_cruza) = false then ls_cruza = '-1'
	ls_filtro = ls_filtro + "  and a.id_cruza =  " + ls_cruza
end if

ls_consulta = is_consulta + ls_filtro_solo + ls_filtro
dw_reporte.setsqlselect(ls_consulta)
dw_reporte.Retrieve()

dw_reporte.SetSort("#1A")
dw_reporte.Sort()
dw_reporte.SetRedraw(true)


end subroutine

public subroutine f_editar_cria (long p_id_cria);integer li_actualiza

openwithparm(w_psi_animales_edita_cria,p_id_cria)
li_actualiza=Message.DoubleParm

if li_actualiza = 1 then 
	if cbx_sexo.checked = false and cbx_proveedor.checked = false and cbx_nombre.checked = false and cbx_fecha_nacimiento.checked = false and rb_cria.checked = false and rb_cruza.checked = false then rb_todo.checked = true
	f_cargar_reporte()
end if


end subroutine

on w_psi_animales_adm_cria.create
this.sle_nombre=create sle_nombre
this.cbx_nombre=create cbx_nombre
this.rb_todo=create rb_todo
this.cb_buscar=create cb_buscar
this.cb_exportar=create cb_exportar
this.cb_alta=create cb_alta
this.dp_fecha_nacimiento=create dp_fecha_nacimiento
this.cbx_fecha_nacimiento=create cbx_fecha_nacimiento
this.sle_proveedor=create sle_proveedor
this.ddlb_sexo=create ddlb_sexo
this.cbx_proveedor=create cbx_proveedor
this.cbx_sexo=create cbx_sexo
this.rb_filtros=create rb_filtros
this.sle_cruza=create sle_cruza
this.rb_cruza=create rb_cruza
this.rb_cria=create rb_cria
this.sle_cria=create sle_cria
this.st_reservaciones=create st_reservaciones
this.dw_reporte=create dw_reporte
this.gb_1=create gb_1
this.Control[]={this.sle_nombre,&
this.cbx_nombre,&
this.rb_todo,&
this.cb_buscar,&
this.cb_exportar,&
this.cb_alta,&
this.dp_fecha_nacimiento,&
this.cbx_fecha_nacimiento,&
this.sle_proveedor,&
this.ddlb_sexo,&
this.cbx_proveedor,&
this.cbx_sexo,&
this.rb_filtros,&
this.sle_cruza,&
this.rb_cruza,&
this.rb_cria,&
this.sle_cria,&
this.st_reservaciones,&
this.dw_reporte,&
this.gb_1}
end on

on w_psi_animales_adm_cria.destroy
destroy(this.sle_nombre)
destroy(this.cbx_nombre)
destroy(this.rb_todo)
destroy(this.cb_buscar)
destroy(this.cb_exportar)
destroy(this.cb_alta)
destroy(this.dp_fecha_nacimiento)
destroy(this.cbx_fecha_nacimiento)
destroy(this.sle_proveedor)
destroy(this.ddlb_sexo)
destroy(this.cbx_proveedor)
destroy(this.cbx_sexo)
destroy(this.rb_filtros)
destroy(this.sle_cruza)
destroy(this.rb_cruza)
destroy(this.rb_cria)
destroy(this.sle_cria)
destroy(this.st_reservaciones)
destroy(this.dw_reporte)
destroy(this.gb_1)
end on

event open;dw_reporte.settransobject(gtr_sumuia)
is_consulta = dw_reporte.getsqlselect()

end event

type sle_nombre from singlelineedit within w_psi_animales_adm_cria
integer x = 837
integer y = 403
integer width = 1211
integer height = 77
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cbx_nombre from checkbox within w_psi_animales_adm_cria
integer x = 168
integer y = 403
integer width = 413
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Nombre"
end type

type rb_todo from radiobutton within w_psi_animales_adm_cria
integer x = 2202
integer y = 310
integer width = 519
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Todos"
end type

type cb_buscar from commandbutton within w_psi_animales_adm_cria
integer x = 3387
integer y = 102
integer width = 472
integer height = 118
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Buscar"
end type

event clicked;f_cargar_reporte()
end event

type cb_exportar from commandbutton within w_psi_animales_adm_cria
integer x = 3884
integer y = 102
integer width = 472
integer height = 118
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Exportar"
end type

event clicked;f_exportar_reporte(dw_reporte,ii_exportar,"Administración de crías")
end event

type cb_alta from commandbutton within w_psi_animales_adm_cria
integer x = 4381
integer y = 102
integer width = 472
integer height = 118
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Nueva cría"
end type

event clicked;f_editar_cria(0)
end event

type dp_fecha_nacimiento from datepicker within w_psi_animales_adm_cria
integer x = 837
integer y = 502
integer width = 549
integer height = 77
integer taborder = 100
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2018-08-08"), Time("08:44:19.000000"))
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type cbx_fecha_nacimiento from checkbox within w_psi_animales_adm_cria
integer x = 168
integer y = 499
integer width = 647
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Fecha de nacimiento"
end type

type sle_proveedor from singlelineedit within w_psi_animales_adm_cria
integer x = 837
integer y = 310
integer width = 1211
integer height = 77
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type ddlb_sexo from dropdownlistbox within w_psi_animales_adm_cria
integer x = 837
integer y = 211
integer width = 549
integer height = 266
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean allowedit = true
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"Hembra","Macho"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text(index)
	case 'Hembra'
		is_sexo='H'
	case 'Macho'
		is_sexo='M'
	case else
		is_sexo=''
end choose

end event

type cbx_proveedor from checkbox within w_psi_animales_adm_cria
integer x = 168
integer y = 310
integer width = 413
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Proveedor"
end type

type cbx_sexo from checkbox within w_psi_animales_adm_cria
integer x = 168
integer y = 211
integer width = 413
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Sexo"
end type

type rb_filtros from radiobutton within w_psi_animales_adm_cria
integer x = 88
integer y = 109
integer width = 413
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Filtros"
boolean checked = true
end type

type sle_cruza from singlelineedit within w_psi_animales_adm_cria
integer x = 2743
integer y = 211
integer width = 541
integer height = 77
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type rb_cruza from radiobutton within w_psi_animales_adm_cria
integer x = 2202
integer y = 211
integer width = 519
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "ID Cruza Origen"
end type

type rb_cria from radiobutton within w_psi_animales_adm_cria
integer x = 2202
integer y = 109
integer width = 413
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "ID Cría"
end type

type sle_cria from singlelineedit within w_psi_animales_adm_cria
integer x = 2743
integer y = 109
integer width = 541
integer height = 77
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_reservaciones from statictext within w_psi_animales_adm_cria
integer x = 3504
integer y = 2653
integer width = 812
integer height = 74
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Reservaciones: 0"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_reporte from datawindow within w_psi_animales_adm_cria
integer x = 37
integer y = 685
integer width = 4842
integer height = 1629
integer taborder = 30
string title = "none"
string dataobject = "d_psi_animales_adm_cria"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long ll_cria

if row > 0 then
	ll_cria = this.GetItemNumber(row,'id_cria')
	f_editar_cria(ll_cria)
end if

end event

type gb_1 from groupbox within w_psi_animales_adm_cria
integer x = 37
integer y = 13
integer width = 4842
integer height = 630
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Búsqueda"
end type

