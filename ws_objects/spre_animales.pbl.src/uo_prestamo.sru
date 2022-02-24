$PBExportHeader$uo_prestamo.sru
forward
global type uo_prestamo from userobject
end type
type cb_regresar2 from commandbutton within uo_prestamo
end type
type cb_insertar_prestamo_un_animal from commandbutton within uo_prestamo
end type
type dw_lista_materias from datawindow within uo_prestamo
end type
type ddlb_hora_inicio from dropdownlistbox within uo_prestamo
end type
type cb_2 from commandbutton within uo_prestamo
end type
type st_5 from statictext within uo_prestamo
end type
type dw_animales_prestados_x_fecha from datawindow within uo_prestamo
end type
type sle_1 from singlelineedit within uo_prestamo
end type
type ddlb_animales from dropdownlistbox within uo_prestamo
end type
type dw_cat_animales_en_inventario from datawindow within uo_prestamo
end type
type st_4 from statictext within uo_prestamo
end type
type st_3 from statictext within uo_prestamo
end type
type cb_fecha_final from commandbutton within uo_prestamo
end type
type st_2 from statictext within uo_prestamo
end type
type st_1 from statictext within uo_prestamo
end type
type cb_fecha_inicio from commandbutton within uo_prestamo
end type
type ddlb_hora_final from dropdownlistbox within uo_prestamo
end type
type cb_busca_anim_disponibles from commandbutton within uo_prestamo
end type
type mc_fecha_inicio from monthcalendar within uo_prestamo
end type
type mc_fecha_final from monthcalendar within uo_prestamo
end type
type dw_anim_lista_prestamos_x_persona from datawindow within uo_prestamo
end type
type dw_anim_prestamo_solicitante from datawindow within uo_prestamo
end type
type cb_actualiza_anim_por_folio from commandbutton within uo_prestamo
end type
type cb_actualiza3 from commandbutton within uo_prestamo
end type
type cb_inserta from commandbutton within uo_prestamo
end type
type cb_regresa1 from commandbutton within uo_prestamo
end type
type cb_actualiza_prestamo from commandbutton within uo_prestamo
end type
type dw_anim_prestamo_un_animal from datawindow within uo_prestamo
end type
type dw_materias_para_prestamo from datawindow within uo_prestamo
end type
type dw_anim_lista_animales_x_folio_prestamo from datawindow within uo_prestamo
end type
type dw_animales_disponibles from datawindow within uo_prestamo
end type
end forward

global type uo_prestamo from userobject
integer width = 4201
integer height = 2792
long backcolor = 67108864
cb_regresar2 cb_regresar2
cb_insertar_prestamo_un_animal cb_insertar_prestamo_un_animal
dw_lista_materias dw_lista_materias
ddlb_hora_inicio ddlb_hora_inicio
cb_2 cb_2
st_5 st_5
dw_animales_prestados_x_fecha dw_animales_prestados_x_fecha
sle_1 sle_1
ddlb_animales ddlb_animales
dw_cat_animales_en_inventario dw_cat_animales_en_inventario
st_4 st_4
st_3 st_3
cb_fecha_final cb_fecha_final
st_2 st_2
st_1 st_1
cb_fecha_inicio cb_fecha_inicio
ddlb_hora_final ddlb_hora_final
cb_busca_anim_disponibles cb_busca_anim_disponibles
mc_fecha_inicio mc_fecha_inicio
mc_fecha_final mc_fecha_final
dw_anim_lista_prestamos_x_persona dw_anim_lista_prestamos_x_persona
dw_anim_prestamo_solicitante dw_anim_prestamo_solicitante
cb_actualiza_anim_por_folio cb_actualiza_anim_por_folio
cb_actualiza3 cb_actualiza3
cb_inserta cb_inserta
cb_regresa1 cb_regresa1
cb_actualiza_prestamo cb_actualiza_prestamo
dw_anim_prestamo_un_animal dw_anim_prestamo_un_animal
dw_materias_para_prestamo dw_materias_para_prestamo
dw_anim_lista_animales_x_folio_prestamo dw_anim_lista_animales_x_folio_prestamo
dw_animales_disponibles dw_animales_disponibles
end type
global uo_prestamo uo_prestamo

type variables
datetime fecha_inicio,fecha_final

date solo_fecha_inicio,solo_fecha_final

integer hora_inicio,hora_final

long id_solicitante

integer tipo_solicitante

Transaction conexion_prestamos_x_solicitante

int id_cve_mat
string id_gpo
string id_materia
string nombre_solicitante
string telefono_solicitante
string nombre_profesor
string usuario
int depto,area
long folio_a_cargar,folio_inventario_anim
string cadena_generacion
string descripcion_animal
//transaction
end variables

forward prototypes
public subroutine oculta_insertado_animal ()
public subroutine carga_materias ()
public subroutine despliega_insertado_animal ()
public subroutine actualiza_datos_dw_prestamo_un_animal ()
public subroutine inicializa (long id_solicitante_param, integer tipo_solicitante_param, string nombre_solicitante_param, string telefono_solicitante_param, string nombre_profesor_param, string usuario_param, integer depto_param, integer area_param, transaction transaccion_param)
end prototypes

public subroutine oculta_insertado_animal ();st_1.visible=false
st_2.visible=false
st_3.visible=false
st_4.visible=false
st_5.visible=false

cb_fecha_inicio.visible=false
cb_fecha_final.visible=false

ddlb_hora_inicio.visible=false
ddlb_hora_final.visible=false

ddlb_animales.visible=false

cb_busca_anim_disponibles.visible=false

dw_animales_disponibles.visible=false

dw_anim_prestamo_un_animal.visible=false

dw_anim_lista_prestamos_x_persona.visible=true
dw_anim_lista_animales_x_folio_prestamo.visible=true
cb_inserta.visible=true
cb_regresar2.visible=false

//cb_actualiza_prestamo.visible=true

end subroutine

public subroutine carga_materias ();//
long num_materias

if(tipo_solicitante=1) then
	dw_lista_materias.dataobject="dw_anim_mat_x_alumno"	
else
	if(tipo_solicitante=2) then
		dw_lista_materias.dataobject="dw_anim_mat_x_profesor"		
	else
		dw_lista_materias.dataobject="dw_anim_mat_x_alumno_intercambio"	// luego cambiar al de intercambio	
	end if
end if

dw_lista_materias.settransobject(conexion_prestamos_x_solicitante)
num_materias=dw_lista_materias.retrieve(id_solicitante)

int ciclo_llena_tabla

for ciclo_llena_tabla=1 to dw_lista_materias.rowcount()
	dw_materias_para_prestamo.insertrow(ciclo_llena_tabla)
	if(tipo_solicitante=1) then
		dw_materias_para_prestamo.object.id_solicitante[ciclo_llena_tabla]=dw_lista_materias.object.cuenta[ciclo_llena_tabla]
		dw_materias_para_prestamo.object.cve_mat[ciclo_llena_tabla]=dw_lista_materias.object.mat_inscritas_cve_mat[ciclo_llena_tabla]		
		dw_materias_para_prestamo.object.gpo[ciclo_llena_tabla]=dw_lista_materias.object.mat_inscritas_gpo[ciclo_llena_tabla]				
		dw_materias_para_prestamo.object.periodo[ciclo_llena_tabla]=dw_lista_materias.object.mat_inscritas_periodo[ciclo_llena_tabla]						
		dw_materias_para_prestamo.object.anio[ciclo_llena_tabla]=dw_lista_materias.object.mat_inscritas_anio[ciclo_llena_tabla]								
		dw_materias_para_prestamo.object.materia[ciclo_llena_tabla]=dw_lista_materias.object.materias_materia[ciclo_llena_tabla]										
		dw_materias_para_prestamo.object.cve_profesor[ciclo_llena_tabla]=dw_lista_materias.object.profesor_cve_profesor[ciclo_llena_tabla]												
		dw_materias_para_prestamo.object.profesor[ciclo_llena_tabla]=dw_lista_materias.object.profesor_nombre_completo[ciclo_llena_tabla]														
		
	else
		if(tipo_solicitante=2) then		
			dw_materias_para_prestamo.object.id_solicitante[ciclo_llena_tabla]=dw_lista_materias.object.grupos_cve_profesor[ciclo_llena_tabla]
			dw_materias_para_prestamo.object.cve_mat[ciclo_llena_tabla]=dw_lista_materias.object.grupos_cve_mat[ciclo_llena_tabla]		
			dw_materias_para_prestamo.object.gpo[ciclo_llena_tabla]=dw_lista_materias.object.grupos_gpo[ciclo_llena_tabla]				
			dw_materias_para_prestamo.object.periodo[ciclo_llena_tabla]=dw_lista_materias.object.grupos_periodo[ciclo_llena_tabla]						
			dw_materias_para_prestamo.object.anio[ciclo_llena_tabla]=dw_lista_materias.object.grupos_anio[ciclo_llena_tabla]								
			dw_materias_para_prestamo.object.materia[ciclo_llena_tabla]=dw_lista_materias.object.materias_materia[ciclo_llena_tabla]										
			dw_materias_para_prestamo.object.cve_profesor[ciclo_llena_tabla]=dw_lista_materias.object.grupos_cve_profesor[ciclo_llena_tabla]
			dw_materias_para_prestamo.object.profesor[ciclo_llena_tabla]=dw_lista_materias.object.profesor_nombre_completo[ciclo_llena_tabla]														
		else
			dw_materias_para_prestamo.object.id_solicitante[ciclo_llena_tabla]=dw_lista_materias.object.no_folio_inter[ciclo_llena_tabla]
			dw_materias_para_prestamo.object.cve_mat[ciclo_llena_tabla]=dw_lista_materias.object.cve_mat[ciclo_llena_tabla]		
			dw_materias_para_prestamo.object.gpo[ciclo_llena_tabla]=dw_lista_materias.object.gpo[ciclo_llena_tabla]				
			dw_materias_para_prestamo.object.periodo[ciclo_llena_tabla]=dw_lista_materias.object.periodo[ciclo_llena_tabla]						
			dw_materias_para_prestamo.object.anio[ciclo_llena_tabla]=dw_lista_materias.object.anio[ciclo_llena_tabla]								
			dw_materias_para_prestamo.object.materia[ciclo_llena_tabla]=dw_lista_materias.object.dca_materias_materia[ciclo_llena_tabla]										
			dw_materias_para_prestamo.object.cve_profesor[ciclo_llena_tabla]=dw_lista_materias.object.dca_grupos_cve_profesor[ciclo_llena_tabla]												
			dw_materias_para_prestamo.object.profesor[ciclo_llena_tabla]=dw_lista_materias.object.dca_grupos_nombre_completo[ciclo_llena_tabla]														
			
		end if
	end if
next

if(num_materias>0) then
	id_cve_mat=dw_materias_para_prestamo.object.cve_mat[1]
	id_gpo=dw_materias_para_prestamo.object.gpo[1]
	id_materia=dw_materias_para_prestamo.object.materia[1]
		
	dw_materias_para_prestamo.object.seleccionada[1]=1
	
	nombre_profesor="("+string(dw_materias_para_prestamo.object.cve_profesor[1])+") "+ &
		dw_materias_para_prestamo.object.profesor[1]
	
	
else
	id_cve_mat=0
	id_gpo="NA"
	id_materia="SIN MATERIA"
	nombre_profesor="SIN PROFESOR"	
end if
end subroutine

public subroutine despliega_insertado_animal ();st_1.visible=true
st_2.visible=true
st_3.visible=true
st_4.visible=true
st_5.visible=true

cb_fecha_inicio.visible=true
cb_fecha_final.visible=true

ddlb_hora_inicio.visible=true
ddlb_hora_final.visible=true

ddlb_animales.visible=true

cb_busca_anim_disponibles.visible=true

dw_animales_disponibles.visible=true
dw_anim_prestamo_un_animal.visible=true

dw_anim_lista_prestamos_x_persona.visible=false
dw_anim_lista_animales_x_folio_prestamo.visible=false
cb_inserta.visible=false
cb_regresa1.visible=false
cb_actualiza_prestamo.visible=false

cb_regresar2.visible=true

dw_anim_prestamo_un_animal.reset()
dw_anim_prestamo_un_animal.insertrow(0)
dw_anim_prestamo_un_animal.title="Alta de préstamo de un animal"

actualiza_datos_dw_prestamo_un_animal()

cb_actualiza_anim_por_folio.enabled=false

cb_actualiza3.visible=false // boton de Update solo para cambios

dw_animales_disponibles.reset()

cb_actualiza_anim_por_folio.visible=true
end subroutine

public subroutine actualiza_datos_dw_prestamo_un_animal ();//

dw_anim_prestamo_un_animal.object.folio_prestamo_anim[1]=folio_a_cargar
if(dw_animales_disponibles.rowcount()>0) then
	dw_anim_prestamo_un_animal.object.folio_inventario_anim[1]=folio_inventario_anim
else
	dw_anim_prestamo_un_animal.object.folio_inventario_anim[1]=0	
end if

	dw_anim_prestamo_un_animal.object.spre_anim_cat_animales_descripcion[1]=descripcion_animal
	dw_anim_prestamo_un_animal.object.spre_anim_inventario_cadena_generacion[1]=cadena_generacion

	dw_anim_prestamo_un_animal.object.cvedepto[1]=depto
	dw_anim_prestamo_un_animal.object.cvearea[1]=area
	

hora_inicio=integer(ddlb_hora_inicio.text)
hora_final=integer(ddlb_hora_final.text)

mc_fecha_inicio.getselecteddate(solo_fecha_inicio)


fecha_inicio=datetime(string(solo_fecha_inicio,"mm/dd/yyyy "+string(hora_inicio)+":00:00"))

//messagebox("",string(fecha_inicio))

cb_fecha_inicio.text=string(fecha_inicio,"dd/mm/yyyy")
mc_fecha_inicio.visible=false


mc_fecha_final.getselecteddate(solo_fecha_final)

fecha_final=datetime(string(solo_fecha_final,"mm/dd/yyyy "+string(hora_final)+":00:00"))
//messagebox("",string(fecha_final))

cb_fecha_final.text=string(fecha_final,"dd/mm/yyyy")
mc_fecha_final.visible=false

	
dw_anim_prestamo_un_animal.object.fecha_inicio[1]=fecha_inicio	
dw_anim_prestamo_un_animal.object.fecha_final[1]=fecha_final
dw_anim_prestamo_un_animal.object.hora_inicio[1]=hora_inicio
dw_anim_prestamo_un_animal.object.hora_final[1]=hora_final

	
	//fecha_registro=datetime(string(now(),"mm/dd/yyyy hh:mm:ss"))
end subroutine

public subroutine inicializa (long id_solicitante_param, integer tipo_solicitante_param, string nombre_solicitante_param, string telefono_solicitante_param, string nombre_profesor_param, string usuario_param, integer depto_param, integer area_param, transaction transaccion_param);//

conexion_prestamos_x_solicitante=transaccion_param

nombre_solicitante=nombre_solicitante_param
telefono_solicitante=telefono_solicitante_param
nombre_profesor=nombre_profesor_param
usuario=usuario_param
depto=depto_param
area=area_param
int renglones
dw_cat_animales_en_inventario.settransobject(gtr_sumuia)
dw_anim_lista_prestamos_x_persona.settransobject(gtr_sumuia)
dw_animales_prestados_x_fecha.settransobject(gtr_sumuia)
dw_animales_disponibles.settransobject(gtr_sumuia)
dw_anim_prestamo_solicitante.settransobject(gtr_sumuia)
dw_anim_lista_animales_x_folio_prestamo.settransobject(gtr_sumuia)
dw_anim_prestamo_un_animal.settransobject(gtr_sumuia)

dw_materias_para_prestamo.visible=false
dw_anim_prestamo_solicitante.visible=false

tipo_solicitante=tipo_solicitante_param 
id_solicitante=id_solicitante_param

if(tipo_solicitante=1) then
	conexion_prestamos_x_solicitante=conexion_prestamos_x_solicitante
else
	if(tipo_solicitante=2) then
		conexion_prestamos_x_solicitante=conexion_prestamos_x_solicitante
	else
		conexion_prestamos_x_solicitante=gtr_sumuia	// cambiar para intercambio		
	end if
end if

renglones=dw_cat_animales_en_inventario.retrieve(0,1)

if(renglones<1) then
	messagebox("Advertencia","No es posible hacer el préstamo de animales porque no existen animales en el inventario")
//	close(this)
end if

int llena_drop_animales

for llena_drop_animales=1 to renglones
	ddlb_animales.additem(dw_cat_animales_en_inventario.object.descripcion[llena_drop_animales] )
next

	ddlb_animales.selectitem(1)

ddlb_hora_inicio.text="7"
ddlb_hora_final.text="7"

hora_inicio=integer(ddlb_hora_inicio.text)
hora_final=integer(ddlb_hora_final.text)

mc_fecha_inicio.getselecteddate(solo_fecha_inicio)

// lo cambio el formato a yyyy/mm/dd para que tome la fecha en Cd MX CPH feb/2018

fecha_inicio=datetime(string(solo_fecha_inicio,"yyyy/mm/dd hh:mm:ss"))

cb_fecha_inicio.text=string(fecha_inicio,"dd/mm/yyyy")
mc_fecha_inicio.visible=false


mc_fecha_final.getselecteddate(solo_fecha_final)

fecha_final=datetime(string(solo_fecha_final,"yyyy/mm/dd hh:mm:ss"))

cb_fecha_final.text=string(fecha_final,"dd/mm/yyyy")
mc_fecha_final.visible=false

hora_inicio=integer(ddlb_hora_inicio.text)
hora_final=integer(ddlb_hora_final.text)

dw_animales_disponibles.visible=false


cb_actualiza_prestamo.visible=false

long renglones_prestamos_x_persona


renglones_prestamos_x_persona=dw_anim_lista_prestamos_x_persona.retrieve(id_solicitante)

//cb_insertar_prestamo_un_animal

if(renglones_prestamos_x_persona>0) then
	cb_insertar_prestamo_un_animal.enabled=true
	dw_anim_lista_prestamos_x_persona.setfocus()
	dw_anim_lista_prestamos_x_persona.setrow(1)

	folio_a_cargar=dw_anim_lista_prestamos_x_persona.object.folio_prestamo_anim[1]
	dw_anim_lista_animales_x_folio_prestamo.retrieve(folio_a_cargar)
	dw_anim_lista_animales_x_folio_prestamo.title="Animales del présarmo Folio: "+string(folio_a_cargar)		
else
	cb_insertar_prestamo_un_animal.enabled=false
end if

dw_animales_disponibles.visible=true
cb_regresar2.visible=false

oculta_insertado_animal()

carga_materias()

cb_regresar2.visible=false
cb_insertar_prestamo_un_animal.visible=true
end subroutine

on uo_prestamo.create
this.cb_regresar2=create cb_regresar2
this.cb_insertar_prestamo_un_animal=create cb_insertar_prestamo_un_animal
this.dw_lista_materias=create dw_lista_materias
this.ddlb_hora_inicio=create ddlb_hora_inicio
this.cb_2=create cb_2
this.st_5=create st_5
this.dw_animales_prestados_x_fecha=create dw_animales_prestados_x_fecha
this.sle_1=create sle_1
this.ddlb_animales=create ddlb_animales
this.dw_cat_animales_en_inventario=create dw_cat_animales_en_inventario
this.st_4=create st_4
this.st_3=create st_3
this.cb_fecha_final=create cb_fecha_final
this.st_2=create st_2
this.st_1=create st_1
this.cb_fecha_inicio=create cb_fecha_inicio
this.ddlb_hora_final=create ddlb_hora_final
this.cb_busca_anim_disponibles=create cb_busca_anim_disponibles
this.mc_fecha_inicio=create mc_fecha_inicio
this.mc_fecha_final=create mc_fecha_final
this.dw_anim_lista_prestamos_x_persona=create dw_anim_lista_prestamos_x_persona
this.dw_anim_prestamo_solicitante=create dw_anim_prestamo_solicitante
this.cb_actualiza_anim_por_folio=create cb_actualiza_anim_por_folio
this.cb_actualiza3=create cb_actualiza3
this.cb_inserta=create cb_inserta
this.cb_regresa1=create cb_regresa1
this.cb_actualiza_prestamo=create cb_actualiza_prestamo
this.dw_anim_prestamo_un_animal=create dw_anim_prestamo_un_animal
this.dw_materias_para_prestamo=create dw_materias_para_prestamo
this.dw_anim_lista_animales_x_folio_prestamo=create dw_anim_lista_animales_x_folio_prestamo
this.dw_animales_disponibles=create dw_animales_disponibles
this.Control[]={this.cb_regresar2,&
this.cb_insertar_prestamo_un_animal,&
this.dw_lista_materias,&
this.ddlb_hora_inicio,&
this.cb_2,&
this.st_5,&
this.dw_animales_prestados_x_fecha,&
this.sle_1,&
this.ddlb_animales,&
this.dw_cat_animales_en_inventario,&
this.st_4,&
this.st_3,&
this.cb_fecha_final,&
this.st_2,&
this.st_1,&
this.cb_fecha_inicio,&
this.ddlb_hora_final,&
this.cb_busca_anim_disponibles,&
this.mc_fecha_inicio,&
this.mc_fecha_final,&
this.dw_anim_lista_prestamos_x_persona,&
this.dw_anim_prestamo_solicitante,&
this.cb_actualiza_anim_por_folio,&
this.cb_actualiza3,&
this.cb_inserta,&
this.cb_regresa1,&
this.cb_actualiza_prestamo,&
this.dw_anim_prestamo_un_animal,&
this.dw_materias_para_prestamo,&
this.dw_anim_lista_animales_x_folio_prestamo,&
this.dw_animales_disponibles}
end on

on uo_prestamo.destroy
destroy(this.cb_regresar2)
destroy(this.cb_insertar_prestamo_un_animal)
destroy(this.dw_lista_materias)
destroy(this.ddlb_hora_inicio)
destroy(this.cb_2)
destroy(this.st_5)
destroy(this.dw_animales_prestados_x_fecha)
destroy(this.sle_1)
destroy(this.ddlb_animales)
destroy(this.dw_cat_animales_en_inventario)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_fecha_final)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_fecha_inicio)
destroy(this.ddlb_hora_final)
destroy(this.cb_busca_anim_disponibles)
destroy(this.mc_fecha_inicio)
destroy(this.mc_fecha_final)
destroy(this.dw_anim_lista_prestamos_x_persona)
destroy(this.dw_anim_prestamo_solicitante)
destroy(this.cb_actualiza_anim_por_folio)
destroy(this.cb_actualiza3)
destroy(this.cb_inserta)
destroy(this.cb_regresa1)
destroy(this.cb_actualiza_prestamo)
destroy(this.dw_anim_prestamo_un_animal)
destroy(this.dw_materias_para_prestamo)
destroy(this.dw_anim_lista_animales_x_folio_prestamo)
destroy(this.dw_animales_disponibles)
end on

type cb_regresar2 from commandbutton within uo_prestamo
boolean visible = false
integer x = 1362
integer y = 1940
integer width = 402
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "<< Regresar"
end type

event clicked;oculta_insertado_animal()

end event

type cb_insertar_prestamo_un_animal from commandbutton within uo_prestamo
boolean visible = false
integer x = 1225
integer y = 1204
integer width = 782
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Insertar animal al préstamo"
end type

event clicked;despliega_insertado_animal()


end event

type dw_lista_materias from datawindow within uo_prestamo
boolean visible = false
integer x = 3785
integer y = 1036
integer width = 677
integer height = 444
integer taborder = 40
string title = "none"
string dataobject = "dw_anim_mat_x_alumno_intercambio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_hora_inicio from dropdownlistbox within uo_prestamo
boolean visible = false
integer x = 1463
integer y = 152
integer width = 224
integer height = 1008
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"}
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within uo_prestamo
boolean visible = false
integer x = 471
integer y = 16
integer width = 407
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Carga cuenta"
end type

event clicked;id_solicitante=long(sle_1.text)


//inicializa(id_solicitante,1,"Cesar Ponce","2191034","El profesor","El usuario",2,2,gtr_sce) // alumnos
//messagebox("","aqui")
//inicializa(27199,2,"Cesar Ponce","2191034","El profesor","El usuario",2,2,gtr_sce) // profesor

inicializa(10566,3,"Cesar Ponce","2191034","El profesor","El usuario",2,2,gtr_sumuia) // intercambio

/* params:

idsolicitante
nombre
telefono
nombre profesor
usuario
depto
area

*/




end event

type st_5 from statictext within uo_prestamo
boolean visible = false
integer x = 1815
integer y = 288
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Animal"
boolean focusrectangle = false
end type

type dw_animales_prestados_x_fecha from datawindow within uo_prestamo
boolean visible = false
integer x = 3794
integer y = 528
integer width = 1883
integer height = 488
integer taborder = 40
string title = "none"
string dataobject = "dw_anim_lista_prestamos_x_fecha_hora_datetime"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within uo_prestamo
boolean visible = false
integer x = 27
integer y = 24
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean enabled = false
string text = "32946"
borderstyle borderstyle = stylelowered!
end type

event modified;id_solicitante=integer(this.text)

if (id_solicitante=100) then
	dw_anim_lista_prestamos_x_persona.retrieve(id_solicitante)
end if
end event

type ddlb_animales from dropdownlistbox within uo_prestamo
boolean visible = false
integer x = 2066
integer y = 276
integer width = 480
integer height = 1008
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type dw_cat_animales_en_inventario from datawindow within uo_prestamo
boolean visible = false
integer x = 3799
integer y = 100
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "dw_anim_lista_anim_x_proveed_o_por_invent"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within uo_prestamo
boolean visible = false
integer x = 1157
integer y = 284
integer width = 302
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hora Final"
boolean focusrectangle = false
end type

type st_3 from statictext within uo_prestamo
boolean visible = false
integer x = 1143
integer y = 160
integer width = 302
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hora Inicio"
boolean focusrectangle = false
end type

type cb_fecha_final from commandbutton within uo_prestamo
boolean visible = false
integer x = 690
integer y = 272
integer width = 402
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "none"
end type

event clicked;mc_fecha_inicio.visible=false
mc_fecha_final.visible=false


if(mc_fecha_final.visible) then
	mc_fecha_final.visible=false
else
	mc_fecha_final.visible=true
end if
end event

type st_2 from statictext within uo_prestamo
boolean visible = false
integer x = 338
integer y = 292
integer width = 325
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Final"
boolean focusrectangle = false
end type

type st_1 from statictext within uo_prestamo
boolean visible = false
integer x = 338
integer y = 168
integer width = 352
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Inicio"
boolean focusrectangle = false
end type

type cb_fecha_inicio from commandbutton within uo_prestamo
boolean visible = false
integer x = 690
integer y = 148
integer width = 402
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "none"
end type

event clicked;mc_fecha_inicio.visible=false
mc_fecha_final.visible=false

if(mc_fecha_inicio.visible) then
	mc_fecha_inicio.visible=false
else
	mc_fecha_inicio.visible=true
end if
end event

type ddlb_hora_final from dropdownlistbox within uo_prestamo
boolean visible = false
integer x = 1463
integer y = 276
integer width = 224
integer height = 1008
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;mc_fecha_inicio.visible=false
mc_fecha_final.visible=false

hora_inicio=integer(ddlb_hora_inicio.text)
hora_final=integer(ddlb_hora_final.text)
end event

event getfocus;mc_fecha_inicio.visible=false
mc_fecha_final.visible=false

hora_inicio=integer(ddlb_hora_inicio.text)
hora_final=integer(ddlb_hora_final.text)
end event

type cb_busca_anim_disponibles from commandbutton within uo_prestamo
boolean visible = false
integer x = 2597
integer y = 276
integer width = 891
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Buscar Animales Disponibles"
end type

event clicked;//fecha_inicio=mc_fecha_inicio.text
date fechita
string animal_a_buscar_str

mc_fecha_inicio.getselecteddate(fechita)

//messagebox("",string(fecha_inicio,"dd/mm/yyyy")+"hora:"+string(hora_inicio))
//messagebox("",string(fecha_final,"dd/mm/yyyy")+"hora:"+string(hora_final))

mc_fecha_inicio.visible=false
mc_fecha_final.visible=false

solo_fecha_inicio=date(string(fecha_inicio,"mm/dd/yyyy"))
solo_fecha_final=date(string(fecha_final,"mm/dd/yyyy"))

hora_inicio=integer(ddlb_hora_inicio.text)
hora_final=integer(ddlb_hora_final.text)

mc_fecha_inicio.getselecteddate(solo_fecha_inicio)
fecha_inicio=datetime(string(solo_fecha_inicio,"mm/dd/yyyy "+string(hora_inicio)+":00:00"))

mc_fecha_final.getselecteddate(solo_fecha_final)
fecha_final=datetime(string(solo_fecha_final,"mm/dd/yyyy "+string(hora_final)+":00:00"))

//messagebox("",string(fecha_inicio))

cb_fecha_inicio.text=string(fecha_inicio,"dd/mm/yyyy")
mc_fecha_inicio.visible=false


fecha_final=datetime(string(solo_fecha_final,"mm/dd/yyyy "+string(hora_final)+":00:00"))

animal_a_buscar_str=ddlb_animales.text

int ciclo_checa_disponibles

dw_animales_disponibles.visible=false
dw_animales_disponibles.retrieve(animal_a_buscar_str)
for ciclo_checa_disponibles=1 to dw_animales_disponibles.rowcount()
/*	if(dw_animales_prestados_x_fecha.retrieve(solo_fecha_inicio,solo_fecha_final,dw_animales_disponibles.object.folio_inventario_anim[ciclo_checa_disponibles])>0) then
		dw_animales_disponibles.object.disponible[ciclo_checa_disponibles]=0	
	end if
	*/
	
	// se cambia por fecha_inicio y final tipo datetime
	if(dw_animales_prestados_x_fecha.retrieve(fecha_inicio,fecha_final,dw_animales_disponibles.object.folio_inventario_anim[ciclo_checa_disponibles])>0) then
		dw_animales_disponibles.object.disponible[ciclo_checa_disponibles]=0	
	end if
		
//	messagebox("",string(dw_animales_disponibles.object.folio_inventario_anim[ciclo_checa_disponibles]))
next

dw_animales_disponibles.setfilter("disponible=1")
dw_animales_disponibles.filter()

dw_animales_disponibles.visible=true

if (dw_animales_disponibles.rowcount()>0) then
	folio_inventario_anim=dw_animales_disponibles.object.folio_inventario_anim[1]
	
	descripcion_animal=dw_animales_disponibles.object.spre_anim_cat_animales_descripcion[1]
	cadena_generacion=dw_animales_disponibles.object.cadena_generacion[1]	
	
	cb_actualiza_anim_por_folio.enabled=true
//	string cadena_generacion
//string descripcion_animal
else
	folio_inventario_anim=0
	descripcion_animal="SIN ASIGNAR"
	cadena_generacion="SIN ASIGNAR"
end if

actualiza_datos_dw_prestamo_un_animal()


//fecha_registro=datetime(string(now(),"mm/dd/yyyy hh:mm:ss"))

//ultima_modificacion=datetime(string(now(),"mm/dd/yyyy hh:mm:ss"))ultima_modificacion=datetime(string(now(),"mm/dd/yyyy hh:mm:ss"))
end event

type mc_fecha_inicio from monthcalendar within uo_prestamo
boolean visible = false
integer x = 251
integer y = 504
integer width = 1239
integer height = 780
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event datechanged;mc_fecha_inicio.getselecteddate(solo_fecha_inicio)

// lo cambio el formato a yyyy/mm/dd para que tome la fecha en Cd MX CPH feb/2018

fecha_inicio=datetime(string(solo_fecha_inicio,"yyyy/mm/dd hh:mm:ss"))

cb_fecha_inicio.text=string(fecha_inicio,"dd/mm/yyyy")

end event

event losefocus;mc_fecha_inicio.visible=false
mc_fecha_final.visible=false

end event

type mc_fecha_final from monthcalendar within uo_prestamo
boolean visible = false
integer x = 398
integer y = 504
integer width = 1230
integer height = 768
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event datechanged;mc_fecha_final.getselecteddate(solo_fecha_final)

// lo cambio el formato a yyyy/mm/dd para que tome la fecha en Cd MX CPH feb/2018

fecha_final=datetime(string(solo_fecha_final,"yyyy/mm/dd hh:mm:ss"))

cb_fecha_final.text=string(fecha_final,"dd/mm/yyyy")

end event

event losefocus;mc_fecha_inicio.visible=false
mc_fecha_final.visible=false

end event

type dw_anim_lista_prestamos_x_persona from datawindow within uo_prestamo
boolean visible = false
integer x = 37
integer y = 148
integer width = 3109
integer height = 996
integer taborder = 20
boolean titlebar = true
string title = "Présarmos"
string dataobject = "dw_anim_lista_prestamos_x_persona_corta"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setrowfocusindicator(Hand!)
end event

event clicked;dw_anim_lista_animales_x_folio_prestamo.reset()
if(getclickedrow()>0) then
	folio_a_cargar=dw_anim_lista_prestamos_x_persona.object.folio_prestamo_anim[getclickedrow()]
	dw_anim_lista_animales_x_folio_prestamo.retrieve(folio_a_cargar)
	dw_anim_lista_animales_x_folio_prestamo.title="Animales del présarmo Folio: "+string(folio_a_cargar)	
end if

end event

type dw_anim_prestamo_solicitante from datawindow within uo_prestamo
boolean visible = false
integer x = 23
integer y = 140
integer width = 3502
integer height = 1192
integer taborder = 50
boolean titlebar = true
string title = "Préstamo"
string dataobject = "dw_anim_prestamo_solicitante"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_actualiza_anim_por_folio from commandbutton within uo_prestamo
boolean visible = false
integer x = 1915
integer y = 1940
integer width = 800
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Agregar préstamo animal"
end type

event clicked;long consecutivo

select isnull(max(consecutivo),0)+1  into :consecutivo from spre_anim_animales_por_prestam where folio_prestamo_anim=:folio_a_cargar using gtr_sumuia;

dw_anim_prestamo_un_animal.object.consecutivo[1]=consecutivo

dw_anim_prestamo_un_animal.update()

if(gtr_sumuia.sqlnrows<1) then
	messagebox("Advertencia","Error al insertar el présatamo en la Base de datos")
else
	messagebox("Aviso","Se actualizó con éxito el animal con consecutivo:" +string(consecutivo)+ " de el folio:"+string(folio_a_cargar))	
end if

commit using gtr_sumuia;

dw_anim_lista_animales_x_folio_prestamo.retrieve(folio_a_cargar)
dw_anim_lista_animales_x_folio_prestamo.title="Animales del présarmo Folio: "+string(folio_a_cargar)		

oculta_insertado_animal()

end event

type cb_actualiza3 from commandbutton within uo_prestamo
boolean visible = false
integer x = 1915
integer y = 1940
integer width = 800
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar préstamo animal"
end type

event clicked;long consecutivo
int rtn

rtn=dw_anim_prestamo_un_animal.update()

folio_a_cargar=dw_anim_prestamo_un_animal.object.folio_prestamo_anim[dw_anim_prestamo_un_animal.getrow()]
consecutivo=dw_anim_prestamo_un_animal.object.consecutivo[dw_anim_prestamo_un_animal.getrow()]

if(rtn<1) then
	ROLLBACK USING gtr_sumuia;		
	messagebox("Advertencia","Error al insertar el présatamo en la Base de datos")
else
	commit using gtr_sumuia;
	messagebox("Aviso","Se actualizó con éxito el animal con consecutivo:" +string(consecutivo)+ " de el folio:"+string(folio_a_cargar))	
	
end if



dw_anim_lista_animales_x_folio_prestamo.retrieve(folio_a_cargar)
dw_anim_lista_animales_x_folio_prestamo.title="Animales del présarmo Folio: "+string(folio_a_cargar)		

oculta_insertado_animal()

end event

type cb_inserta from commandbutton within uo_prestamo
boolean visible = false
integer x = 1298
integer y = 20
integer width = 599
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Inserta préstamo"
end type

event clicked;dw_anim_prestamo_solicitante.visible=true
dw_materias_para_prestamo.visible=true
cb_actualiza_prestamo.visible=true


dw_anim_prestamo_solicitante.insertrow(0)


dw_anim_prestamo_solicitante.object.solicitanteid[1]=id_solicitante
dw_anim_prestamo_solicitante.object.cvemat_clase[1]=id_cve_mat
dw_anim_prestamo_solicitante.object.cvegpo_clase[1]=id_gpo
dw_anim_prestamo_solicitante.object.materia[1]=id_materia

dw_anim_prestamo_solicitante.object.solicitantenombre[1]=nombre_solicitante
dw_anim_prestamo_solicitante.object.solicitantetel[1]=telefono_solicitante
dw_anim_prestamo_solicitante.object.solicitanteprofesor[1]=nombre_profesor

dw_anim_prestamo_solicitante.object.usuario[1]=usuario
dw_anim_prestamo_solicitante.object.cvedepto[1]=depto



cb_inserta.visible=false
cb_regresa1.visible=true

dw_anim_lista_prestamos_x_persona.visible=false

dw_anim_lista_prestamos_x_persona.visible=false
dw_anim_lista_animales_x_folio_prestamo.visible=false
cb_regresar2.visible=false
cb_actualiza3.visible=false
cb_actualiza_anim_por_folio.visible=false


end event

type cb_regresa1 from commandbutton within uo_prestamo
boolean visible = false
integer x = 1303
integer y = 28
integer width = 599
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "<< Regresar"
end type

event clicked;dw_anim_prestamo_solicitante.visible=false
dw_materias_para_prestamo.visible=false
dw_anim_prestamo_solicitante.reset()

cb_inserta.visible=true
dw_anim_lista_prestamos_x_persona.visible=true
dw_anim_lista_animales_x_folio_prestamo.visible=true
cb_regresar2.visible=true
cb_regresar2.visible=false
end event

type cb_actualiza_prestamo from commandbutton within uo_prestamo
boolean visible = false
integer x = 2121
integer y = 1820
integer width = 576
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar préstamo"
end type

event clicked;long folio_prestamo

select isnull(max(folio_prestamo_anim),0)+1 into :folio_prestamo from spre_anim_prestamo_animales using gtr_sumuia;

dw_anim_prestamo_solicitante.object.folio_prestamo_anim[1]=folio_prestamo

dw_anim_prestamo_solicitante.update()

if(gtr_sumuia.sqlnrows<1) then
	messagebox("Advertencia","Error al insertar el présatamo en la Base de datos")
else
	messagebox("Aviso","Se actualizó con éxito el préstamo con folio:"+string(folio_prestamo))	
end if

commit using gtr_sumuia;


dw_anim_prestamo_solicitante.visible=false
dw_materias_para_prestamo.visible=false
cb_actualiza_prestamo.visible=false
cb_inserta.visible=true
cb_regresa1.visible=false


if(dw_anim_lista_prestamos_x_persona.retrieve(id_solicitante)>0) then

	cb_insertar_prestamo_un_animal.enabled=true
end if

dw_anim_lista_prestamos_x_persona.visible=true

dw_anim_lista_animales_x_folio_prestamo.visible=true



end event

type dw_anim_prestamo_un_animal from datawindow within uo_prestamo
boolean visible = false
integer x = 55
integer y = 1076
integer width = 2939
integer height = 796
integer taborder = 50
boolean titlebar = true
string title = "Présarmo un animal"
string dataobject = "dw_anim_prestamo_un_animal"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_materias_para_prestamo from datawindow within uo_prestamo
boolean visible = false
integer x = 23
integer y = 1344
integer width = 3502
integer height = 456
integer taborder = 30
boolean titlebar = true
string title = "Materias disponibles (seleccione una)"
string dataobject = "dw_anim_materias_para_prestamo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setrowfocusindicator(Hand!)
end event

event clicked;int ciclo_quita
long renglon

renglon=getclickedrow()
if(getclickedrow()>0) then

	for ciclo_quita=1 to rowcount()
		this.object.seleccionada[ciclo_quita]=0
	next
	this.object.seleccionada[getclickedrow()]=1	

	dw_anim_prestamo_solicitante.object.cvemat_clase[1]=	dw_materias_para_prestamo.object.cve_mat[renglon]
	dw_anim_prestamo_solicitante.object.cvegpo_clase[1]=	dw_materias_para_prestamo.object.gpo[renglon]
	dw_anim_prestamo_solicitante.object.materia[1]=dw_materias_para_prestamo.object.materia[renglon]
	
	dw_anim_prestamo_solicitante.object.solicitanteprofesor[1]="("+string(dw_materias_para_prestamo.object.cve_profesor[renglon])+") "+ &
		dw_materias_para_prestamo.object.profesor[renglon]
	

end if
end event

type dw_anim_lista_animales_x_folio_prestamo from datawindow within uo_prestamo
boolean visible = false
integer x = 23
integer y = 1332
integer width = 4087
integer height = 1144
integer taborder = 40
boolean titlebar = true
string title = "Animales del prestamo"
string dataobject = "dw_anim_lista_animales_x_folio_prestamo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setrowfocusindicator(Hand!)
end event

event doubleclicked;if (getclickedrow()>0) then
	dw_anim_prestamo_un_animal.retrieve(this.object.folio_prestamo_anim[row],this.object.consecutivo[row])
	dw_anim_prestamo_un_animal.visible=true
	dw_anim_prestamo_un_animal.title="Cambios de préstamo de un animal"	
	dw_anim_lista_animales_x_folio_prestamo.visible=false	
	cb_inserta.visible=false
	cb_regresa1.visible=false
	cb_regresar2.visible=true
	cb_actualiza_anim_por_folio.visible=false	
	cb_actualiza3.visible=true
end if
end event

type dw_animales_disponibles from datawindow within uo_prestamo
boolean visible = false
integer x = 41
integer y = 408
integer width = 3451
integer height = 652
integer taborder = 50
boolean titlebar = true
string title = "Animales Disponibles"
string dataobject = "dw_lista_inventario_corta_x_animales_diponibles"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setrowfocusindicator(Hand!)
end event

event clicked;if(getclickedrow()>0) then
	folio_inventario_anim=dw_animales_disponibles.object.folio_inventario_anim[row]
	
	descripcion_animal=dw_animales_disponibles.object.spre_anim_cat_animales_descripcion[row]
	cadena_generacion=dw_animales_disponibles.object.cadena_generacion[row]
	
	actualiza_datos_dw_prestamo_un_animal()
end if
end event

