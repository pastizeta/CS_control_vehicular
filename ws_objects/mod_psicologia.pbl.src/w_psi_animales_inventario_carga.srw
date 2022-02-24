$PBExportHeader$w_psi_animales_inventario_carga.srw
forward
global type w_psi_animales_inventario_carga from window
end type
type cb_guardar from commandbutton within w_psi_animales_inventario_carga
end type
type sle_nombre from singlelineedit within w_psi_animales_inventario_carga
end type
type cbx_nombre from checkbox within w_psi_animales_inventario_carga
end type
type rb_todo from radiobutton within w_psi_animales_inventario_carga
end type
type cb_buscar from commandbutton within w_psi_animales_inventario_carga
end type
type dp_fecha_nacimiento from datepicker within w_psi_animales_inventario_carga
end type
type cbx_fecha_nacimiento from checkbox within w_psi_animales_inventario_carga
end type
type sle_proveedor from singlelineedit within w_psi_animales_inventario_carga
end type
type cbx_proveedor from checkbox within w_psi_animales_inventario_carga
end type
type rb_filtros from radiobutton within w_psi_animales_inventario_carga
end type
type sle_cruza from singlelineedit within w_psi_animales_inventario_carga
end type
type rb_cruza from radiobutton within w_psi_animales_inventario_carga
end type
type rb_cria from radiobutton within w_psi_animales_inventario_carga
end type
type sle_cria from singlelineedit within w_psi_animales_inventario_carga
end type
type st_reservaciones from statictext within w_psi_animales_inventario_carga
end type
type dw_crias from datawindow within w_psi_animales_inventario_carga
end type
type gb_1 from groupbox within w_psi_animales_inventario_carga
end type
end forward

global type w_psi_animales_inventario_carga from window
integer width = 4191
integer height = 2400
boolean titlebar = true
string title = "Administración de crías"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_guardar cb_guardar
sle_nombre sle_nombre
cbx_nombre cbx_nombre
rb_todo rb_todo
cb_buscar cb_buscar
dp_fecha_nacimiento dp_fecha_nacimiento
cbx_fecha_nacimiento cbx_fecha_nacimiento
sle_proveedor sle_proveedor
cbx_proveedor cbx_proveedor
rb_filtros rb_filtros
sle_cruza sle_cruza
rb_cruza rb_cruza
rb_cria rb_cria
sle_cria sle_cria
st_reservaciones st_reservaciones
dw_crias dw_crias
gb_1 gb_1
end type
global w_psi_animales_inventario_carga w_psi_animales_inventario_carga

type variables
string is_consulta = ''
integer ii_guardado = 0
end variables

forward prototypes
public subroutine f_cargar_reporte ()
public subroutine uf_agregar_inventario (long p_cria)
end prototypes

public subroutine f_cargar_reporte ();string ls_consulta, ls_sexo = '', ls_proveedor, ls_nombre, ls_fecha, ls_cria, ls_cruza
string ls_filtro_solo = '', ls_filtro = ''

dw_crias.SetRedraw(false)
dw_crias.Reset()

if rb_filtros.checked = true then 
	 ls_filtro_solo = ' and 0 = -1'
	 
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
dw_crias.setsqlselect(ls_consulta)
dw_crias.Retrieve()

dw_crias.SetSort("#1A")
dw_crias.Sort()
dw_crias.SetRedraw(true)


end subroutine

public subroutine uf_agregar_inventario (long p_cria);long ll_inventario
integer li_existe
datetime ldt_ahorita

ldt_ahorita=DateTime(Today(),Now())

//Verificar que no esté asignado
select count(id_inventario) as existe
into :li_existe
from dbo.spre_animales_inventario
where id_cria = :p_cria
using gtr_sumuia; 
commit using gtr_sumuia;

if li_existe = 0 then
	//ID Inventario
	select isnull(max(id_inventario),0) +1
	into :ll_inventario
	from dbo.spre_animales_inventario
	using gtr_sumuia; 
	commit using gtr_sumuia;

	//Insertar inventario
	insert into dbo.spre_animales_inventario
	(id_inventario, id_cria, fecha_alta, estatus)
	 
	values
	(:ll_inventario, :p_cria, :ldt_ahorita, 1)

	using gtr_sumuia;	

	if gtr_sumuia.sqlcode<>0 then
		messagebox("Mensaje del sistema","Error al insertar en inventario "+gtr_sumuia.SQLErrText,stopsign!)
		rollback using gtr_sumuia;
	else
		commit using gtr_sumuia;
		ii_guardado = 1
	end if	
	
end if



end subroutine

on w_psi_animales_inventario_carga.create
this.cb_guardar=create cb_guardar
this.sle_nombre=create sle_nombre
this.cbx_nombre=create cbx_nombre
this.rb_todo=create rb_todo
this.cb_buscar=create cb_buscar
this.dp_fecha_nacimiento=create dp_fecha_nacimiento
this.cbx_fecha_nacimiento=create cbx_fecha_nacimiento
this.sle_proveedor=create sle_proveedor
this.cbx_proveedor=create cbx_proveedor
this.rb_filtros=create rb_filtros
this.sle_cruza=create sle_cruza
this.rb_cruza=create rb_cruza
this.rb_cria=create rb_cria
this.sle_cria=create sle_cria
this.st_reservaciones=create st_reservaciones
this.dw_crias=create dw_crias
this.gb_1=create gb_1
this.Control[]={this.cb_guardar,&
this.sle_nombre,&
this.cbx_nombre,&
this.rb_todo,&
this.cb_buscar,&
this.dp_fecha_nacimiento,&
this.cbx_fecha_nacimiento,&
this.sle_proveedor,&
this.cbx_proveedor,&
this.rb_filtros,&
this.sle_cruza,&
this.rb_cruza,&
this.rb_cria,&
this.sle_cria,&
this.st_reservaciones,&
this.dw_crias,&
this.gb_1}
end on

on w_psi_animales_inventario_carga.destroy
destroy(this.cb_guardar)
destroy(this.sle_nombre)
destroy(this.cbx_nombre)
destroy(this.rb_todo)
destroy(this.cb_buscar)
destroy(this.dp_fecha_nacimiento)
destroy(this.cbx_fecha_nacimiento)
destroy(this.sle_proveedor)
destroy(this.cbx_proveedor)
destroy(this.rb_filtros)
destroy(this.sle_cruza)
destroy(this.rb_cruza)
destroy(this.rb_cria)
destroy(this.sle_cria)
destroy(this.st_reservaciones)
destroy(this.dw_crias)
destroy(this.gb_1)
end on

event open;dw_crias.settransobject(gtr_sumuia)
is_consulta = dw_crias.getsqlselect()

post f_cargar_reporte()
end event

event close;CloseWithReturn(w_psi_animales_inventario_carga,ii_guardado)
end event

type cb_guardar from commandbutton within w_psi_animales_inventario_carga
integer x = 3346
integer y = 2195
integer width = 783
integer height = 102
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cargar a inventario"
end type

event clicked;integer li_i, li_marcado = 0
long ll_cria
	
for li_i=1 to dw_crias.RowCount()
	if dw_crias.GetItemNumber(li_i,'cbox') = 1 then
		ll_cria = dw_crias.GetItemNumber(li_i,'id_cria')
		li_marcado = 1
		uf_agregar_inventario(ll_cria)
	end if
next

if li_marcado = 1 then 
	f_cargar_reporte()
	messagebox('Aviso','Los registros seleccionados fueron agregados al inventario.')
end if
end event

type sle_nombre from singlelineedit within w_psi_animales_inventario_carga
integer x = 837
integer y = 278
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

type cbx_nombre from checkbox within w_psi_animales_inventario_carga
integer x = 168
integer y = 278
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

type rb_todo from radiobutton within w_psi_animales_inventario_carga
integer x = 2202
integer y = 285
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

type cb_buscar from commandbutton within w_psi_animales_inventario_carga
integer x = 3387
integer y = 77
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

type dp_fecha_nacimiento from datepicker within w_psi_animales_inventario_carga
integer x = 837
integer y = 378
integer width = 549
integer height = 77
integer taborder = 100
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2018-07-31"), Time("17:10:16.000000"))
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type cbx_fecha_nacimiento from checkbox within w_psi_animales_inventario_carga
integer x = 168
integer y = 374
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

type sle_proveedor from singlelineedit within w_psi_animales_inventario_carga
integer x = 837
integer y = 186
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

type cbx_proveedor from checkbox within w_psi_animales_inventario_carga
integer x = 168
integer y = 186
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

type rb_filtros from radiobutton within w_psi_animales_inventario_carga
integer x = 88
integer y = 83
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

type sle_cruza from singlelineedit within w_psi_animales_inventario_carga
integer x = 2743
integer y = 186
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

type rb_cruza from radiobutton within w_psi_animales_inventario_carga
integer x = 2202
integer y = 186
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

type rb_cria from radiobutton within w_psi_animales_inventario_carga
integer x = 2202
integer y = 83
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

type sle_cria from singlelineedit within w_psi_animales_inventario_carga
integer x = 2743
integer y = 83
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

type st_reservaciones from statictext within w_psi_animales_inventario_carga
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

type dw_crias from datawindow within w_psi_animales_inventario_carga
integer x = 37
integer y = 534
integer width = 4092
integer height = 1629
integer taborder = 30
string title = "none"
string dataobject = "d_psi_animales_inventario_carga"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer li_cbox = 0

if row>0  then
	
	if dwo.name = 'cbox' then
		li_cbox = this.GetItemNumber(row,'cbox')
		
		if li_cbox = 0 then this.SetItem(row,'cbox',1) else this.SetItem(row,'cbox',0)
	end if
	
end if
end event

type gb_1 from groupbox within w_psi_animales_inventario_carga
integer x = 37
integer y = 13
integer width = 4092
integer height = 490
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

