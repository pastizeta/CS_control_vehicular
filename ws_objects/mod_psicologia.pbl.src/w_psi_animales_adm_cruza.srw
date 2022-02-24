$PBExportHeader$w_psi_animales_adm_cruza.srw
forward
global type w_psi_animales_adm_cruza from window
end type
type ddlb_crias from dropdownlistbox within w_psi_animales_adm_cruza
end type
type cbx_crias from checkbox within w_psi_animales_adm_cruza
end type
type sle_nombre_macho from singlelineedit within w_psi_animales_adm_cruza
end type
type cbx_nombre_macho from checkbox within w_psi_animales_adm_cruza
end type
type sle_cria_macho from singlelineedit within w_psi_animales_adm_cruza
end type
type rb_cria_macho from radiobutton within w_psi_animales_adm_cruza
end type
type st_2 from statictext within w_psi_animales_adm_cruza
end type
type sle_cria_hembra from singlelineedit within w_psi_animales_adm_cruza
end type
type rb_cria_hembra from radiobutton within w_psi_animales_adm_cruza
end type
type rb_cruza from radiobutton within w_psi_animales_adm_cruza
end type
type sle_cruza from singlelineedit within w_psi_animales_adm_cruza
end type
type rb_filtros from radiobutton within w_psi_animales_adm_cruza
end type
type cbx_proveedor from checkbox within w_psi_animales_adm_cruza
end type
type sle_proveedor from singlelineedit within w_psi_animales_adm_cruza
end type
type cbx_fecha_cruza from checkbox within w_psi_animales_adm_cruza
end type
type dp_fecha_cruza from datepicker within w_psi_animales_adm_cruza
end type
type cb_alta from commandbutton within w_psi_animales_adm_cruza
end type
type cb_exportar from commandbutton within w_psi_animales_adm_cruza
end type
type cb_buscar from commandbutton within w_psi_animales_adm_cruza
end type
type rb_todo from radiobutton within w_psi_animales_adm_cruza
end type
type cbx_nombre_hembra from checkbox within w_psi_animales_adm_cruza
end type
type sle_nombre_hembra from singlelineedit within w_psi_animales_adm_cruza
end type
type st_reservaciones from statictext within w_psi_animales_adm_cruza
end type
type dw_reporte from datawindow within w_psi_animales_adm_cruza
end type
type gb_1 from groupbox within w_psi_animales_adm_cruza
end type
end forward

global type w_psi_animales_adm_cruza from window
integer width = 5764
integer height = 2349
boolean titlebar = true
string title = "Administración de cruzas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
ddlb_crias ddlb_crias
cbx_crias cbx_crias
sle_nombre_macho sle_nombre_macho
cbx_nombre_macho cbx_nombre_macho
sle_cria_macho sle_cria_macho
rb_cria_macho rb_cria_macho
st_2 st_2
sle_cria_hembra sle_cria_hembra
rb_cria_hembra rb_cria_hembra
rb_cruza rb_cruza
sle_cruza sle_cruza
rb_filtros rb_filtros
cbx_proveedor cbx_proveedor
sle_proveedor sle_proveedor
cbx_fecha_cruza cbx_fecha_cruza
dp_fecha_cruza dp_fecha_cruza
cb_alta cb_alta
cb_exportar cb_exportar
cb_buscar cb_buscar
rb_todo rb_todo
cbx_nombre_hembra cbx_nombre_hembra
sle_nombre_hembra sle_nombre_hembra
st_reservaciones st_reservaciones
dw_reporte dw_reporte
gb_1 gb_1
end type
global w_psi_animales_adm_cruza w_psi_animales_adm_cruza

type variables
string is_consulta = ''
integer ii_exportar=1, ii_crias=1
end variables

forward prototypes
public subroutine f_cargar_reporte ()
public subroutine f_editar_cruza (long p_id_cruza)
end prototypes

public subroutine f_cargar_reporte ();string ls_consulta, ls_sexo = '', ls_proveedor, ls_nombre, ls_fecha, ls_cria, ls_cruza, ls_filtra= ''
string ls_filtro_solo = '', ls_filtro = ''

dw_reporte.SetRedraw(false)
dw_reporte.SetFilter('')
dw_reporte.Filter()
dw_reporte.Reset()

if rb_filtros.checked = true then 
	 ls_filtro_solo = ' and 0 = -1'
	 
	if cbx_proveedor.checked = true then
		ls_proveedor = '%' + trim(sle_proveedor.text) + '%'
		ls_filtro = ls_filtro + " and a.prov_descripcion like '" + ls_proveedor + "'"
		ls_filtro_solo = ''	
	end if

	if cbx_fecha_cruza.checked = true then
		ls_fecha = mid(dp_fecha_cruza.text,7,4)  + '/' + mid(dp_fecha_cruza.text,4,2) + '/' + mid(dp_fecha_cruza.text,1,2)
		ls_filtro = ls_filtro + " and a.fecha_cruza =  '" + ls_fecha+ "'"
		ls_filtro_solo = ''	
	end if

	if cbx_nombre_hembra.checked = true then
		ls_nombre = '%' + trim(sle_nombre_hembra.text) + '%'
		ls_filtro = ls_filtro + " and c.nombre like '" + ls_nombre + "'"
		ls_filtro_solo = ''	
	end if

	if cbx_nombre_macho.checked = true then
		ls_nombre = '%' + trim(sle_nombre_macho.text) + '%'
		ls_filtro = ls_filtro + " and b.nombre like '" + ls_nombre + "'"
		ls_filtro_solo = ''	
	end if

	if cbx_crias.checked = true then 
		if ii_crias = 0 then
			ls_filtra = "crias = 0"
		else
			ls_filtra =  "crias > 0"
		end if
		ls_filtro_solo = ''
	end if

end if

if rb_todo.checked = true then 
	ls_filtro = ''
end if

if rb_cruza.checked = true then 
	ls_cruza = trim(sle_cruza.text)
	if isNumber(ls_cruza) = false then ls_cruza = '-1'
	ls_filtro = ls_filtro + "  and a.id_cruza =  " + ls_cruza
end if

if rb_cria_hembra.checked = true then 
	ls_cria = trim(sle_cria_hembra.text)
	if isNumber(ls_cria) = false then ls_cria = '-1'
	ls_filtro = ls_filtro + "  and a.id_madre =  " + ls_cria
end if

if rb_cria_macho.checked = true then 
	ls_cria = trim(sle_cria_macho.text)
	if isNumber(ls_cria) = false then ls_cria = '-1'
	ls_filtro = ls_filtro + "  and a.id_padre =  " + ls_cria
end if


ls_consulta = is_consulta + ls_filtro_solo + ls_filtro
dw_reporte.setsqlselect(ls_consulta)
dw_reporte.Retrieve()

if ls_filtra <> '' then
	dw_reporte.SetFilter(ls_filtra)
	dw_reporte.Filter()
end if

dw_reporte.SetSort("#1A")
dw_reporte.Sort()
dw_reporte.SetRedraw(true)


end subroutine

public subroutine f_editar_cruza (long p_id_cruza);integer li_actualiza

openwithparm(w_psi_animales_edita_cruza,p_id_cruza)
li_actualiza=Message.DoubleParm

if li_actualiza = 1 then 
	if cbx_proveedor.checked = false and cbx_fecha_cruza.checked = false and cbx_nombre_hembra.checked = false and cbx_nombre_hembra.checked = false and cbx_nombre_macho.checked = false 	and cbx_crias.checked = false and rb_cruza.checked = false and rb_cria_hembra.checked = false and rb_cria_macho.checked = false then rb_todo.checked = true
	f_cargar_reporte()
end if




end subroutine

on w_psi_animales_adm_cruza.create
this.ddlb_crias=create ddlb_crias
this.cbx_crias=create cbx_crias
this.sle_nombre_macho=create sle_nombre_macho
this.cbx_nombre_macho=create cbx_nombre_macho
this.sle_cria_macho=create sle_cria_macho
this.rb_cria_macho=create rb_cria_macho
this.st_2=create st_2
this.sle_cria_hembra=create sle_cria_hembra
this.rb_cria_hembra=create rb_cria_hembra
this.rb_cruza=create rb_cruza
this.sle_cruza=create sle_cruza
this.rb_filtros=create rb_filtros
this.cbx_proveedor=create cbx_proveedor
this.sle_proveedor=create sle_proveedor
this.cbx_fecha_cruza=create cbx_fecha_cruza
this.dp_fecha_cruza=create dp_fecha_cruza
this.cb_alta=create cb_alta
this.cb_exportar=create cb_exportar
this.cb_buscar=create cb_buscar
this.rb_todo=create rb_todo
this.cbx_nombre_hembra=create cbx_nombre_hembra
this.sle_nombre_hembra=create sle_nombre_hembra
this.st_reservaciones=create st_reservaciones
this.dw_reporte=create dw_reporte
this.gb_1=create gb_1
this.Control[]={this.ddlb_crias,&
this.cbx_crias,&
this.sle_nombre_macho,&
this.cbx_nombre_macho,&
this.sle_cria_macho,&
this.rb_cria_macho,&
this.st_2,&
this.sle_cria_hembra,&
this.rb_cria_hembra,&
this.rb_cruza,&
this.sle_cruza,&
this.rb_filtros,&
this.cbx_proveedor,&
this.sle_proveedor,&
this.cbx_fecha_cruza,&
this.dp_fecha_cruza,&
this.cb_alta,&
this.cb_exportar,&
this.cb_buscar,&
this.rb_todo,&
this.cbx_nombre_hembra,&
this.sle_nombre_hembra,&
this.st_reservaciones,&
this.dw_reporte,&
this.gb_1}
end on

on w_psi_animales_adm_cruza.destroy
destroy(this.ddlb_crias)
destroy(this.cbx_crias)
destroy(this.sle_nombre_macho)
destroy(this.cbx_nombre_macho)
destroy(this.sle_cria_macho)
destroy(this.rb_cria_macho)
destroy(this.st_2)
destroy(this.sle_cria_hembra)
destroy(this.rb_cria_hembra)
destroy(this.rb_cruza)
destroy(this.sle_cruza)
destroy(this.rb_filtros)
destroy(this.cbx_proveedor)
destroy(this.sle_proveedor)
destroy(this.cbx_fecha_cruza)
destroy(this.dp_fecha_cruza)
destroy(this.cb_alta)
destroy(this.cb_exportar)
destroy(this.cb_buscar)
destroy(this.rb_todo)
destroy(this.cbx_nombre_hembra)
destroy(this.sle_nombre_hembra)
destroy(this.st_reservaciones)
destroy(this.dw_reporte)
destroy(this.gb_1)
end on

event open;dw_reporte.settransobject(gtr_sumuia)
is_consulta = dw_reporte.getsqlselect()
end event

type ddlb_crias from dropdownlistbox within w_psi_animales_adm_cruza
integer x = 827
integer y = 582
integer width = 549
integer height = 266
integer taborder = 60
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
string item[] = {"No","Sí"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text(index)
	case 'No'
		ii_crias=0
	case else
		ii_crias=1
end choose

end event

type cbx_crias from checkbox within w_psi_animales_adm_cruza
integer x = 161
integer y = 582
integer width = 541
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Hay crías"
end type

type sle_nombre_macho from singlelineedit within w_psi_animales_adm_cruza
integer x = 830
integer y = 486
integer width = 1211
integer height = 77
integer taborder = 50
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

type cbx_nombre_macho from checkbox within w_psi_animales_adm_cruza
integer x = 161
integer y = 486
integer width = 541
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Nombre Macho"
end type

type sle_cria_macho from singlelineedit within w_psi_animales_adm_cruza
integer x = 2736
integer y = 294
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

type rb_cria_macho from radiobutton within w_psi_animales_adm_cruza
integer x = 2202
integer y = 294
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
string text = "ID Macho"
end type

type st_2 from statictext within w_psi_animales_adm_cruza
integer x = 3496
integer y = 2640
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

type sle_cria_hembra from singlelineedit within w_psi_animales_adm_cruza
integer x = 2736
integer y = 198
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

type rb_cria_hembra from radiobutton within w_psi_animales_adm_cruza
integer x = 2202
integer y = 198
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
string text = "ID Hembra"
end type

type rb_cruza from radiobutton within w_psi_animales_adm_cruza
integer x = 2202
integer y = 96
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
string text = "ID Cruza"
end type

type sle_cruza from singlelineedit within w_psi_animales_adm_cruza
integer x = 2736
integer y = 96
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

type rb_filtros from radiobutton within w_psi_animales_adm_cruza
integer x = 88
integer y = 96
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

type cbx_proveedor from checkbox within w_psi_animales_adm_cruza
integer x = 161
integer y = 198
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

type sle_proveedor from singlelineedit within w_psi_animales_adm_cruza
integer x = 830
integer y = 198
integer width = 1211
integer height = 77
integer taborder = 70
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

type cbx_fecha_cruza from checkbox within w_psi_animales_adm_cruza
integer x = 161
integer y = 298
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
string text = "Fecha de cruza"
end type

type dp_fecha_cruza from datepicker within w_psi_animales_adm_cruza
integer x = 830
integer y = 298
integer width = 549
integer height = 77
integer taborder = 50
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2018-08-08"), Time("09:13:55.000000"))
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type cb_alta from commandbutton within w_psi_animales_adm_cruza
integer x = 4374
integer y = 90
integer width = 472
integer height = 118
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Nueva cruza"
end type

event clicked;f_editar_cruza(0)
end event

type cb_exportar from commandbutton within w_psi_animales_adm_cruza
integer x = 3877
integer y = 90
integer width = 472
integer height = 118
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Exportar"
end type

event clicked;f_exportar_reporte(dw_reporte,ii_exportar,"Administración de cruzas")
end event

type cb_buscar from commandbutton within w_psi_animales_adm_cruza
integer x = 3379
integer y = 90
integer width = 472
integer height = 118
integer taborder = 40
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

type rb_todo from radiobutton within w_psi_animales_adm_cruza
integer x = 2202
integer y = 390
integer width = 391
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

type cbx_nombre_hembra from checkbox within w_psi_animales_adm_cruza
integer x = 161
integer y = 390
integer width = 541
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Nombre Hembra"
end type

type sle_nombre_hembra from singlelineedit within w_psi_animales_adm_cruza
integer x = 830
integer y = 390
integer width = 1211
integer height = 77
integer taborder = 40
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

type st_reservaciones from statictext within w_psi_animales_adm_cruza
integer x = 3504
integer y = 2640
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

type dw_reporte from datawindow within w_psi_animales_adm_cruza
integer x = 37
integer y = 723
integer width = 5661
integer height = 1562
integer taborder = 30
string title = "none"
string dataobject = "d_psi_animales_adm_cruza"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long ll_cruza

if row > 0 then
	ll_cruza = this.GetItemNumber(row,'id_cruza')
	f_editar_cruza(ll_cruza)
end if

end event

type gb_1 from groupbox within w_psi_animales_adm_cruza
integer x = 37
integer width = 5654
integer height = 675
integer taborder = 10
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

