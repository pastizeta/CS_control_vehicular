$PBExportHeader$w_spre_catalogo_kits.srw
forward
global type w_spre_catalogo_kits from window
end type
type cb_1 from commandbutton within w_spre_catalogo_kits
end type
type em_1 from editmask within w_spre_catalogo_kits
end type
type st_clave_mat3 from statictext within w_spre_catalogo_kits
end type
type st_clave_mat2 from statictext within w_spre_catalogo_kits
end type
type cb_actualiza_materias_kit from commandbutton within w_spre_catalogo_kits
end type
type st_clave_mat from statictext within w_spre_catalogo_kits
end type
type cb_regresar_al_kit from commandbutton within w_spre_catalogo_kits
end type
type cb_buscar_material from commandbutton within w_spre_catalogo_kits
end type
type sle_cve_material from singlelineedit within w_spre_catalogo_kits
end type
type dw_materiales_a_agregar from datawindow within w_spre_catalogo_kits
end type
type cb_agrega_material from commandbutton within w_spre_catalogo_kits
end type
type cb_ver_todos from commandbutton within w_spre_catalogo_kits
end type
type cb_insertar from commandbutton within w_spre_catalogo_kits
end type
type cb_regresar from commandbutton within w_spre_catalogo_kits
end type
type dw_linea_de_busqueda from datawindow within w_spre_catalogo_kits
end type
type dw_spre_lista_kit_material from datawindow within w_spre_catalogo_kits
end type
type cb_actualizar from commandbutton within w_spre_catalogo_kits
end type
type cb_alta from commandbutton within w_spre_catalogo_kits
end type
type dw_spre_un_kit_material from datawindow within w_spre_catalogo_kits
end type
type cb_borrar_materiales from commandbutton within w_spre_catalogo_kits
end type
type dw_materiales_x_kit from datawindow within w_spre_catalogo_kits
end type
end forward

global type w_spre_catalogo_kits from window
integer width = 4594
integer height = 2424
boolean titlebar = true
string title = "Catalogo de Kits de Préstamos de Material"
string menuname = "w_menu_spre_catalogo_kits"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event cerrar_ventana ( )
cb_1 cb_1
em_1 em_1
st_clave_mat3 st_clave_mat3
st_clave_mat2 st_clave_mat2
cb_actualiza_materias_kit cb_actualiza_materias_kit
st_clave_mat st_clave_mat
cb_regresar_al_kit cb_regresar_al_kit
cb_buscar_material cb_buscar_material
sle_cve_material sle_cve_material
dw_materiales_a_agregar dw_materiales_a_agregar
cb_agrega_material cb_agrega_material
cb_ver_todos cb_ver_todos
cb_insertar cb_insertar
cb_regresar cb_regresar
dw_linea_de_busqueda dw_linea_de_busqueda
dw_spre_lista_kit_material dw_spre_lista_kit_material
cb_actualizar cb_actualizar
cb_alta cb_alta
dw_spre_un_kit_material dw_spre_un_kit_material
cb_borrar_materiales cb_borrar_materiales
dw_materiales_x_kit dw_materiales_x_kit
end type
global w_spre_catalogo_kits w_spre_catalogo_kits

type variables
long clave_a_buscar
string descripcion_a_buscar
long kit_a_buscar
end variables

forward prototypes
public subroutine despliega_detalle ()
public subroutine oculta_detalle ()
end prototypes

event cerrar_ventana();close(this)
end event

public subroutine despliega_detalle ();dw_linea_de_busqueda.visible=false
dw_spre_lista_kit_material.visible=false
cb_ver_todos.visible=false

dw_spre_un_kit_material.visible=true
cb_actualizar.visible=true
cb_regresar.visible=true
cb_insertar.visible=false
end subroutine

public subroutine oculta_detalle ();
dw_linea_de_busqueda.visible=true
dw_spre_lista_kit_material.visible=true
cb_ver_todos.visible=true

dw_spre_un_kit_material.visible=false
cb_actualizar.visible=false
cb_regresar.visible=false
cb_insertar.visible=true

cb_alta.visible=false


dw_materiales_a_agregar.visible=false
cb_buscar_material.visible=false
cb_agrega_material.visible=true
cb_regresar_al_kit.visible=false
sle_cve_material.visible=false
st_clave_mat.visible=false
st_clave_mat2.visible=false
st_clave_mat3.visible=false


cb_actualiza_materias_kit.visible=false
dw_materiales_x_kit.visible=true

end subroutine

on w_spre_catalogo_kits.create
if this.MenuName = "w_menu_spre_catalogo_kits" then this.MenuID = create w_menu_spre_catalogo_kits
this.cb_1=create cb_1
this.em_1=create em_1
this.st_clave_mat3=create st_clave_mat3
this.st_clave_mat2=create st_clave_mat2
this.cb_actualiza_materias_kit=create cb_actualiza_materias_kit
this.st_clave_mat=create st_clave_mat
this.cb_regresar_al_kit=create cb_regresar_al_kit
this.cb_buscar_material=create cb_buscar_material
this.sle_cve_material=create sle_cve_material
this.dw_materiales_a_agregar=create dw_materiales_a_agregar
this.cb_agrega_material=create cb_agrega_material
this.cb_ver_todos=create cb_ver_todos
this.cb_insertar=create cb_insertar
this.cb_regresar=create cb_regresar
this.dw_linea_de_busqueda=create dw_linea_de_busqueda
this.dw_spre_lista_kit_material=create dw_spre_lista_kit_material
this.cb_actualizar=create cb_actualizar
this.cb_alta=create cb_alta
this.dw_spre_un_kit_material=create dw_spre_un_kit_material
this.cb_borrar_materiales=create cb_borrar_materiales
this.dw_materiales_x_kit=create dw_materiales_x_kit
this.Control[]={this.cb_1,&
this.em_1,&
this.st_clave_mat3,&
this.st_clave_mat2,&
this.cb_actualiza_materias_kit,&
this.st_clave_mat,&
this.cb_regresar_al_kit,&
this.cb_buscar_material,&
this.sle_cve_material,&
this.dw_materiales_a_agregar,&
this.cb_agrega_material,&
this.cb_ver_todos,&
this.cb_insertar,&
this.cb_regresar,&
this.dw_linea_de_busqueda,&
this.dw_spre_lista_kit_material,&
this.cb_actualizar,&
this.cb_alta,&
this.dw_spre_un_kit_material,&
this.cb_borrar_materiales,&
this.dw_materiales_x_kit}
end on

on w_spre_catalogo_kits.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.em_1)
destroy(this.st_clave_mat3)
destroy(this.st_clave_mat2)
destroy(this.cb_actualiza_materias_kit)
destroy(this.st_clave_mat)
destroy(this.cb_regresar_al_kit)
destroy(this.cb_buscar_material)
destroy(this.sle_cve_material)
destroy(this.dw_materiales_a_agregar)
destroy(this.cb_agrega_material)
destroy(this.cb_ver_todos)
destroy(this.cb_insertar)
destroy(this.cb_regresar)
destroy(this.dw_linea_de_busqueda)
destroy(this.dw_spre_lista_kit_material)
destroy(this.cb_actualizar)
destroy(this.cb_alta)
destroy(this.dw_spre_un_kit_material)
destroy(this.cb_borrar_materiales)
destroy(this.dw_materiales_x_kit)
end on

event open;long renglones

w_ppal.toolbarvisible=false

dw_spre_lista_kit_material.settransobject(gtr_sumuia)
dw_spre_un_kit_material.settransobject(gtr_sumuia)
dw_materiales_x_kit.settransobject(gtr_sumuia)
dw_materiales_a_agregar.settransobject(gtr_sumuia)


dw_materiales_x_kit.reset()

dw_materiales_a_agregar.visible=true
cb_buscar_material.visible=false
cb_agrega_material.visible=true
cb_regresar_al_kit.visible=false

oculta_detalle()

//gi_depto,gi_area

// quitar
//gi_depto=8
//gi_area=3

dw_linea_de_busqueda.reset()
dw_linea_de_busqueda.insertrow(0)

clave_a_buscar=0
descripcion_a_buscar=""

renglones=dw_spre_lista_kit_material.retrieve(gi_depto,gi_area,clave_a_buscar,descripcion_a_buscar)

if(renglones>0) then
	clave_a_buscar=dw_spre_lista_kit_material.object.cvekit[1]
	dw_materiales_x_kit.retrieve(gi_depto,gi_area,clave_a_buscar)
end if

if(renglones>0) then
	cb_agrega_material.enabled=true
	cb_borrar_materiales.enabled=true
else
	cb_agrega_material.enabled=false	
	cb_borrar_materiales.enabled=false
end if
end event

event close;w_ppal.toolbarvisible=true
end event

type cb_1 from commandbutton within w_spre_catalogo_kits
boolean visible = false
integer x = 4101
integer y = 580
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "none"
end type

event clicked;date fechita
time horita

datetime fecha_larga

string dia_str,mes_str,anio_str,fecha_completa


dia_str=mid(em_1.text,1,2)
mes_str=mid(em_1.text,4,2)
anio_str=mid(em_1.text,7,4)

horita=time("22"+":00")

fecha_larga=crea_fecha_hora(dia_str,mes_str,anio_str,"22"+":00")


messagebox("",string(fecha_larga))
end event

type em_1 from editmask within w_spre_catalogo_kits
boolean visible = false
integer x = 4027
integer y = 364
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
string text = "17/01/2018"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_clave_mat3 from statictext within w_spre_catalogo_kits
integer x = 242
integer y = 1768
integer width = 878
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "(Dejar en blanco para ver todos)"
boolean focusrectangle = false
end type

type st_clave_mat2 from statictext within w_spre_catalogo_kits
integer x = 302
integer y = 1576
integer width = 754
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "o número de serie"
boolean focusrectangle = false
end type

type cb_actualiza_materias_kit from commandbutton within w_spre_catalogo_kits
integer x = 1673
integer y = 2036
integer width = 800
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualiza Materiales del Kit"
end type

event clicked;long cont_renglones

long depto,area
string cvematerial,num_serie
int result
long cvegrupo

for cont_renglones=1 to dw_materiales_a_agregar.rowcount()
	if(dw_materiales_a_agregar.object.agregar[cont_renglones]=1) then 
		result=messagebox("Aviso","¿Desea Agregar el Material: "+string(dw_materiales_a_agregar.object.num_serie[cont_renglones])+" - "+string(dw_materiales_a_agregar.object.spre_materiales_descripcion[cont_renglones])+" al Kit?",Exclamation!, OKCancel!, 2) 
		if(result=1) then
			depto=dw_materiales_a_agregar.object.cvedepto[cont_renglones]
			area=dw_materiales_a_agregar.object.cvearea[cont_renglones]
			cvematerial=string(dw_materiales_a_agregar.object.cvematerial[cont_renglones])
			num_serie=string(dw_materiales_a_agregar.object.num_serie[cont_renglones])
			cvegrupo=dw_materiales_a_agregar.object.spre_inventario_cvegrupo[cont_renglones]
			update spre_inventario set kit=1, cvekit=:clave_a_buscar where cvedepto=:depto and cvearea=:area and cvematerial=:cvematerial and num_serie=:num_serie and cvegrupo=:cvegrupo using gtr_sumuia;
		end if
	//select * from spre_inventario where cvedepto=8 and cvearea=3 and cvematerial='4' and num_serie='NIVM12000000';
	end if
next

commit using gtr_sumuia;


dw_materiales_x_kit.retrieve(gi_depto,gi_area,clave_a_buscar)

dw_spre_lista_kit_material.enabled=true
cb_insertar.enabled=true

cb_borrar_materiales.visible=true

oculta_detalle()

end event

type st_clave_mat from statictext within w_spre_catalogo_kits
integer x = 302
integer y = 1508
integer width = 754
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Escriba la Clave del Material"
boolean focusrectangle = false
end type

type cb_regresar_al_kit from commandbutton within w_spre_catalogo_kits
integer x = 2880
integer y = 2036
integer width = 800
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "<< Regresar al Kit"
end type

event clicked;
oculta_detalle()

dw_materiales_x_kit.visible=true

dw_spre_lista_kit_material.enabled=true
cb_insertar.enabled=true

cb_borrar_materiales.visible=true
end event

type cb_buscar_material from commandbutton within w_spre_catalogo_kits
integer x = 315
integer y = 1848
integer width = 800
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Buscar Material"
end type

event clicked;long renglones
renglones=dw_materiales_a_agregar.retrieve(gi_depto,gi_area,sle_cve_material.text)

dw_materiales_a_agregar.title="Materiales a Agregar ("+string(renglones)+")"


end event

type sle_cve_material from singlelineedit within w_spre_catalogo_kits
integer x = 302
integer y = 1652
integer width = 759
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;cb_buscar_material.triggerevent(Clicked!)
end event

type dw_materiales_a_agregar from datawindow within w_spre_catalogo_kits
integer x = 1134
integer y = 1360
integer width = 3337
integer height = 644
integer taborder = 60
boolean titlebar = true
string title = "Materiales a Agregar"
string dataobject = "dw_spre_lista_materiales_kits_agregar"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_agrega_material from commandbutton within w_spre_catalogo_kits
integer x = 210
integer y = 2048
integer width = 800
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Agregar Materiales al Kit >>"
end type

event clicked;dw_materiales_x_kit.visible=false
dw_materiales_a_agregar.visible=true
cb_buscar_material.visible=true
cb_agrega_material.visible=false
cb_regresar_al_kit.visible=true
sle_cve_material.visible=true
st_clave_mat.visible=true
st_clave_mat2.visible=true
st_clave_mat3.visible=true

dw_spre_lista_kit_material.enabled=false
cb_insertar.enabled=false
cb_actualiza_materias_kit.visible=true

cb_borrar_materiales.visible=false
end event

type cb_ver_todos from commandbutton within w_spre_catalogo_kits
integer x = 3250
integer y = 80
integer width = 507
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Ver todos los kits"
end type

event clicked;clave_a_buscar=0
descripcion_a_buscar=""
dw_linea_de_busqueda.object.linea_de_busqueda[1]=descripcion_a_buscar	

dw_spre_lista_kit_material.retrieve(gi_depto,gi_area,clave_a_buscar,descripcion_a_buscar)


end event

type cb_insertar from commandbutton within w_spre_catalogo_kits
integer x = 192
integer y = 1216
integer width = 635
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Agregar Nuevo Kit >>"
end type

event clicked;long renglon

dw_spre_un_kit_material.reset()


	dw_spre_un_kit_material.insertrow(0)
	renglon=dw_spre_un_kit_material.getrow()	
	dw_spre_un_kit_material.object.cvedepto[renglon]=gi_depto
	dw_spre_un_kit_material.object.cvearea[renglon]=gi_area
	
// lo cambio el formato a yyyy/mm/dd para que tome la fecha en Cd MX CPH feb/2018
	
	
	dw_spre_un_kit_material.object.fecha_alta[renglon]=datetime(string(now(),"yyyy/mm/dd hh:mm:ss"))
	dw_spre_un_kit_material.setfocus()
	dw_spre_un_kit_material.setcolumn("descripcion")
	
	dw_spre_un_kit_material.object.borrar.protect=true
	dw_spre_un_kit_material.object.borrar.visible=false	
	dw_spre_un_kit_material.object.t_borrar.visible=false
	
	despliega_detalle()

cb_alta.visible=true
cb_actualizar.visible=false


end event

type cb_regresar from commandbutton within w_spre_catalogo_kits
integer x = 2610
integer y = 1208
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "<< regresar"
end type

event clicked;oculta_detalle()
end event

type dw_linea_de_busqueda from datawindow within w_spre_catalogo_kits
integer x = 187
integer y = 36
integer width = 2981
integer height = 200
integer taborder = 10
string title = "none"
string dataobject = "dw_linea_de_busqueda_kit"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;
clave_a_buscar=long(string(data))
descripcion_a_buscar=string(data)
dw_spre_lista_kit_material.retrieve(gi_depto,gi_area,clave_a_buscar,descripcion_a_buscar)

end event

type dw_spre_lista_kit_material from datawindow within w_spre_catalogo_kits
integer x = 183
integer y = 292
integer width = 3758
integer height = 880
integer taborder = 10
boolean titlebar = true
string title = "Lista de Kits"
string dataobject = "dw_spre_lista_kit_material_x_depto_area_params"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setrowfocusindicator(Hand!)
end event

event doubleclicked;if(this.getclickedrow()>0) then
	clave_a_buscar=this.object.cvekit[row]
	dw_spre_un_kit_material.retrieve(clave_a_buscar)
	
	long conteo_materiales
	
	select count(*) into :conteo_materiales from spre_inventario where cvekit=:clave_a_buscar using gtr_sumuia;
	
	dw_spre_un_kit_material.object.borrar.protect=0			
	
	if (conteo_materiales>0) then
		messagebox("Aviso","No será posible borrar el Kit porque contiene materiales registrados")
//		dw_spre_un_kit_material.object.borrar[dw_spre_un_kit_material.getrow()]	=0
				dw_spre_un_kit_material.object.borrar.protect=1		

	end if
	
	
	
	despliega_detalle()
//	messagebox("",string(clave_a_buscar))
end if
end event

event clicked;//dw_spre_lista_kit_material.retrieve(gi_depto,gi_area,clave_a_buscar,descripcion_a_buscar)

if(this.getclickedrow()>0) then
	kit_a_buscar=this.object.cvekit[row]
	clave_a_buscar=kit_a_buscar

	dw_materiales_x_kit.retrieve(gi_depto,gi_area,kit_a_buscar)
	
end if
end event

type cb_actualizar from commandbutton within w_spre_catalogo_kits
integer x = 1248
integer y = 1216
integer width = 558
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar Cambios"
end type

event clicked;int result
int borrar
long renglones



dw_spre_un_kit_material.accepttext()

borrar=dw_spre_un_kit_material.object.borrar[dw_spre_un_kit_material.getrow()]

if(	borrar=1) then
	result=messagebox("Advertencia","¿Desea eliminar el Kit?",Exclamation!, OKCancel!, 2) 
	if(result=1) then
		dw_spre_un_kit_material.deleterow(dw_spre_un_kit_material.getrow())
	end if
end if

dw_spre_un_kit_material.update()
commit using gtr_sumuia;





if(borrar=1) then
	descripcion_a_buscar=""
	clave_a_buscar=0

else
	descripcion_a_buscar=string(clave_a_buscar)
	dw_linea_de_busqueda.object.linea_de_busqueda[1]=descripcion_a_buscar	
	
end if

renglones=dw_spre_lista_kit_material.retrieve(gi_depto,gi_area,clave_a_buscar,descripcion_a_buscar)

if(renglones>0) then
	clave_a_buscar=dw_spre_lista_kit_material.object.cvekit[1]
	dw_materiales_x_kit.retrieve(gi_depto,gi_area,clave_a_buscar)
	cb_agrega_material.enabled=true	
else
	cb_agrega_material.enabled=false
end if

oculta_detalle()



end event

type cb_alta from commandbutton within w_spre_catalogo_kits
integer x = 1253
integer y = 1220
integer width = 635
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar nuevo Kit"
end type

event clicked;long renglon
long folio
int result
long renglones

dw_spre_un_kit_material.accepttext()



renglon=dw_spre_un_kit_material.getrow()

if(isnull(dw_spre_un_kit_material.object.descripcion[renglon])) then 
	messagebox("Advertencia","La descripción no puede ser nula") 
	return
end if

result=messagebox("Advertencia","¿Desea agregar el Kit?",Exclamation!, OKCancel!, 2) 
if(result=1) then
	select isnull(max(cvekit),0)+1  into :folio from spre_inventario_kit using gtr_sumuia;

	dw_spre_un_kit_material.object.cvekit[renglon]=folio

	dw_spre_un_kit_material.update()
	commit using gtr_sumuia;
	clave_a_buscar=folio
	
	descripcion_a_buscar=string(clave_a_buscar)
	dw_linea_de_busqueda.object.linea_de_busqueda[1]=descripcion_a_buscar	
	
	renglones=dw_spre_lista_kit_material.retrieve(gi_depto,gi_area,clave_a_buscar,descripcion_a_buscar)

	if(renglones>0) then
		clave_a_buscar=dw_spre_lista_kit_material.object.cvekit[1]
		dw_materiales_x_kit.retrieve(gi_depto,gi_area,clave_a_buscar)
		cb_agrega_material.enabled=true
	end if
	
end if


	
	





oculta_detalle()
end event

type dw_spre_un_kit_material from datawindow within w_spre_catalogo_kits
boolean visible = false
integer x = 183
integer y = 292
integer width = 2866
integer height = 880
integer taborder = 20
boolean titlebar = true
string title = "Detalle del Kit"
string dataobject = "dw_spre_un_kit_material"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_borrar_materiales from commandbutton within w_spre_catalogo_kits
integer x = 1481
integer y = 2048
integer width = 987
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Borrar los Materiales Seleccionados"
end type

event clicked;int result
int borrar
long renglones
long cont_borrar

if(dw_materiales_x_kit.rowcount()<1) then return;

dw_materiales_x_kit.accepttext()

for cont_borrar=1 to dw_materiales_x_kit.rowcount()
	if dw_materiales_x_kit.object.borrar[cont_borrar]=1 then
		result=messagebox("Advertencia","¿Desea eliminar el material: "+ &
			string(dw_materiales_x_kit.object.spre_materiales_descripcion[cont_borrar])+"?",Exclamation!, OKCancel!, 2) 
		if(result=1) then		
			dw_materiales_x_kit.object.kit[cont_borrar]=0
			dw_materiales_x_kit.object.cvekit[cont_borrar]=0			
		end if
	end if
next


dw_materiales_x_kit.update()
commit using gtr_sumuia;

dw_materiales_x_kit.retrieve(gi_depto,gi_area,clave_a_buscar)
end event

type dw_materiales_x_kit from datawindow within w_spre_catalogo_kits
integer x = 210
integer y = 1356
integer width = 3511
integer height = 656
integer taborder = 50
boolean titlebar = true
string title = "Materiales por Kit"
string dataobject = "dw_spre_lista_materiales_kits"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.setrowfocusindicator(Hand!)
end event

