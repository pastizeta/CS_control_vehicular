$PBExportHeader$w_spre_anim_inventario_resp.srw
forward
global type w_spre_anim_inventario_resp from window
end type
type cb_regresar_invent from commandbutton within w_spre_anim_inventario_resp
end type
type dw_linea_de_busqueda from datawindow within w_spre_anim_inventario_resp
end type
type cb_actualiza_sexo from commandbutton within w_spre_anim_inventario_resp
end type
type st_ajuste_sexo from statictext within w_spre_anim_inventario_resp
end type
type st_no_crias from statictext within w_spre_anim_inventario_resp
end type
type em_crias from editmask within w_spre_anim_inventario_resp
end type
type cb_4 from commandbutton within w_spre_anim_inventario_resp
end type
type cbx_primera_generacion from checkbox within w_spre_anim_inventario_resp
end type
type cb_actualiza from commandbutton within w_spre_anim_inventario_resp
end type
type dw_1 from datawindow within w_spre_anim_inventario_resp
end type
type dw_invent_x_gener_fecha from datawindow within w_spre_anim_inventario_resp
end type
type dw_lista_inventario_corta_params from datawindow within w_spre_anim_inventario_resp
end type
end forward

global type w_spre_anim_inventario_resp from window
integer width = 4791
integer height = 2220
boolean titlebar = true
string title = "Inventario de Animales"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_regresar_invent cb_regresar_invent
dw_linea_de_busqueda dw_linea_de_busqueda
cb_actualiza_sexo cb_actualiza_sexo
st_ajuste_sexo st_ajuste_sexo
st_no_crias st_no_crias
em_crias em_crias
cb_4 cb_4
cbx_primera_generacion cbx_primera_generacion
cb_actualiza cb_actualiza
dw_1 dw_1
dw_invent_x_gener_fecha dw_invent_x_gener_fecha
dw_lista_inventario_corta_params dw_lista_inventario_corta_params
end type
global w_spre_anim_inventario_resp w_spre_anim_inventario_resp

type variables
string generacion_padre,generacion_madre

int no_crias

long folio_inventario_anim
long cvedepto
long cvearea
long cve_animal
long cve_proveed_x_animal
long cve_padre
long cve_madre
long secuencia_generacion
string cadena_generacion,sexo,raza
long anios_al_adquirir
long meses_al_adquirir
datetime fecha_nacimiento
int deceso
datetime fecha_deceso
string observaciones
int tiempo_prestamo
double costo_animal
int req_firma
int disp_web
int reservada_web
int folio_req
datetime fecha_registro
datetime ultima_modificacion

int folio_a_buscar
string generacion_a_buscar
end variables

forward prototypes
public subroutine inicio ()
end prototypes

public subroutine inicio ();dw_1.settransobject(gtr_sumuia)
dw_invent_x_gener_fecha.settransobject(gtr_sumuia)
dw_lista_inventario_corta_params.settransobject(gtr_sumuia)


cb_4.visible=true
cb_actualiza.enabled=false

dw_invent_x_gener_fecha.visible=false
st_ajuste_sexo.visible=false
	dw_1.reset()
	dw_1.visible=false
	cb_actualiza.visible=false
	cbx_primera_generacion.visible=false	
	em_crias.visible=false
	st_no_crias.visible=false
	
	dw_invent_x_gener_fecha.visible=false
	st_ajuste_sexo.visible=false
	cb_actualiza_sexo.visible=false

dw_linea_de_busqueda.visible=true
dw_linea_de_busqueda.reset()
dw_linea_de_busqueda.insertrow(0)
dw_linea_de_busqueda.setfocus()

cb_regresar_invent.visible=false

dw_lista_inventario_corta_params.visible=true
folio_a_buscar=0
generacion_a_buscar=""
dw_lista_inventario_corta_params.retrieve(folio_a_buscar,generacion_a_buscar)
//	select isnull(max(no_reg),0)+1,:contenido from t_tempo3 using gtr_sce;

end subroutine

on w_spre_anim_inventario_resp.create
this.cb_regresar_invent=create cb_regresar_invent
this.dw_linea_de_busqueda=create dw_linea_de_busqueda
this.cb_actualiza_sexo=create cb_actualiza_sexo
this.st_ajuste_sexo=create st_ajuste_sexo
this.st_no_crias=create st_no_crias
this.em_crias=create em_crias
this.cb_4=create cb_4
this.cbx_primera_generacion=create cbx_primera_generacion
this.cb_actualiza=create cb_actualiza
this.dw_1=create dw_1
this.dw_invent_x_gener_fecha=create dw_invent_x_gener_fecha
this.dw_lista_inventario_corta_params=create dw_lista_inventario_corta_params
this.Control[]={this.cb_regresar_invent,&
this.dw_linea_de_busqueda,&
this.cb_actualiza_sexo,&
this.st_ajuste_sexo,&
this.st_no_crias,&
this.em_crias,&
this.cb_4,&
this.cbx_primera_generacion,&
this.cb_actualiza,&
this.dw_1,&
this.dw_invent_x_gener_fecha,&
this.dw_lista_inventario_corta_params}
end on

on w_spre_anim_inventario_resp.destroy
destroy(this.cb_regresar_invent)
destroy(this.dw_linea_de_busqueda)
destroy(this.cb_actualiza_sexo)
destroy(this.st_ajuste_sexo)
destroy(this.st_no_crias)
destroy(this.em_crias)
destroy(this.cb_4)
destroy(this.cbx_primera_generacion)
destroy(this.cb_actualiza)
destroy(this.dw_1)
destroy(this.dw_invent_x_gener_fecha)
destroy(this.dw_lista_inventario_corta_params)
end on

event open;dw_1.settransobject(gtr_sumuia)
dw_invent_x_gener_fecha.settransobject(gtr_sumuia)
dw_lista_inventario_corta_params.settransobject(gtr_sumuia)



inicio()
end event

event resize;dw_lista_inventario_corta_params.height=this.height - 500

dw_invent_x_gener_fecha.height=this.height - 500
//cb_actualiza_sexo.y=this.height - 200

end event

type cb_regresar_invent from commandbutton within w_spre_anim_inventario_resp
integer x = 2871
integer y = 1280
integer width = 736
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "<< Regresar al inventario"
end type

event clicked;this.visible=false
inicio()

end event

type dw_linea_de_busqueda from datawindow within w_spre_anim_inventario_resp
integer x = 101
integer y = 8
integer width = 2930
integer height = 184
integer taborder = 60
string title = "none"
string dataobject = "dw_linea_de_busqueda"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;folio_a_buscar=integer(string(data))
generacion_a_buscar=string(data)
dw_lista_inventario_corta_params.retrieve(folio_a_buscar,generacion_a_buscar)
end event

type cb_actualiza_sexo from commandbutton within w_spre_anim_inventario_resp
integer x = 4055
integer y = 100
integer width = 402
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar"
end type

event clicked;dw_invent_x_gener_fecha.update()
commit using gtr_sumuia;

dw_invent_x_gener_fecha.visible=false
cb_actualiza_sexo.visible=false

dw_1.visible=true
cb_actualiza.visible=true
cbx_primera_generacion.visible=true	
em_crias.visible=true
st_no_crias.visible=true

inicio()


end event

type st_ajuste_sexo from statictext within w_spre_anim_inventario_resp
integer x = 1353
integer y = 108
integer width = 2030
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ajuste el sexo y presione el boton actualizar"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_no_crias from statictext within w_spre_anim_inventario_resp
integer x = 1595
integer y = 116
integer width = 466
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número de crias:"
boolean focusrectangle = false
end type

type em_crias from editmask within w_spre_anim_inventario_resp
integer x = 2089
integer y = 108
integer width = 283
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "##"
end type

event modified;no_crias=integer(this.text)

if no_crias<0 then
	messagebox("Aviso!","Sólo números mayores de 1")
	this.text="1"
end if
end event

type cb_4 from commandbutton within w_spre_anim_inventario_resp
integer x = 3118
integer y = 40
integer width = 882
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Agregar un animal al inventario"
end type

event clicked;long renglon

Datawindowchild dw_animales

cb_actualiza.enabled=true

if(dw_1.rowcount()<1) then
	renglon=dw_1.insertrow(0)
	dw_1.visible=true
	dw_1.object.cvedepto[renglon]=cvedepto
	dw_1.object.cvearea[renglon]=cvearea
	dw_1.object.folio_inventario_anim[renglon]=0
	dw_1.setcolumn(4)
	
	cb_actualiza.visible=true
	cbx_primera_generacion.visible=true	
	em_crias.visible=true
	st_no_crias.visible=true	

	
	cb_actualiza_sexo.visible=false	
	
	dw_lista_inventario_corta_params.visible=false
	dw_linea_de_busqueda.visible=false		
	
	cb_regresar_invent.visible=true
	this.visible=false

end if	

renglon=dw_1.getrow()

if(dw_1.rowcount()>0) then
	if(cbx_primera_generacion.checked) then
		dw_1.object.cve_padre.visible=false
		dw_1.object.cve_padre_t.visible=false	
		dw_1.object.t_padre.visible=false
		dw_1.object.cve_madre.visible=false
		dw_1.object.cve_madre_t.visible=false		
		dw_1.object.t_madre.visible=false		
		dw_1.object.cve_proveed_x_animal.visible=true		
		dw_1.object.t_proveedor.visible=true
		dw_1.object.t_proveed_x_animal.visible=true		

		
      	dw_1.getChild('cve_animal',dw_animales)
      	dw_animales.settransobject(gtr_sumuia)
      	if(dw_animales.retrieve(1,0)<1) then
			cb_actualiza.enabled=false						
			messagebox("Aviso!","No se puede insertar generación de Animales, no existen proveedores por animal")
			
		
		else
			dw_1.setfocus()
			dw_1.setcolumn("cve_animal")

		end if
		
	else
		dw_1.object.cve_padre.visible=true
		dw_1.object.cve_padre_t.visible=true
		dw_1.object.t_padre.visible=true
		dw_1.object.cve_madre.visible=true
		dw_1.object.cve_madre_t.visible=true
		dw_1.object.t_madre.visible=true		
		dw_1.object.cve_proveed_x_animal.visible=false
		dw_1.object.t_proveed_x_animal.visible=false				

		dw_1.object.t_proveedor.visible=false
		
	    dw_1.getChild('cve_animal',dw_animales)
   	   	dw_animales.settransobject(gtr_sumuia)
				dw_1.setcolumn("cve_animal")

      	if(dw_animales.retrieve(0,1)<1) then
			cb_actualiza.enabled=false						
			messagebox("Aviso!","No se puede insertar generación de Animales, no existen por lo menos un par de animales Macho - Hembra")
			
		else
			dw_1.setfocus()
			dw_1.setcolumn("cve_animal")
		end if
			
		
	end if

end if


//dw_anim_lista_cat_animales_con_proveed
// dw_anim_lista_cat_animales_con_padre_madre


		

end event

type cbx_primera_generacion from checkbox within w_spre_anim_inventario_resp
integer x = 695
integer y = 100
integer width = 786
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Primera Generación (Cero)"
end type

event clicked;Datawindowchild dw_animales

if(dw_1.rowcount()>0) then
	if(cbx_primera_generacion.checked) then
		dw_1.object.cve_padre.visible=false
		dw_1.object.cve_padre_t.visible=false	
		dw_1.object.t_padre.visible=false
		dw_1.object.cve_madre.visible=false
		dw_1.object.cve_madre_t.visible=false		
		dw_1.object.t_madre.visible=false		
		dw_1.object.cve_proveed_x_animal.visible=true		
		dw_1.object.t_proveedor.visible=true
		dw_1.object.t_proveed_x_animal.visible=true		

		
      	dw_1.getChild('cve_animal',dw_animales)
      	dw_animales.settransobject(gtr_sumuia)
      	if(dw_animales.retrieve(1,0)<1) then
			cb_actualiza.enabled=false						
			messagebox("Aviso!","No se puede insertar generación de Animales, no existen proveedores por animal")
			
		
		else
			dw_1.setfocus()
			dw_1.setcolumn("cve_animal")

		end if
		
	else
		dw_1.object.cve_padre.visible=true
		dw_1.object.cve_padre_t.visible=true
		dw_1.object.t_padre.visible=true
		dw_1.object.cve_madre.visible=true
		dw_1.object.cve_madre_t.visible=true
		dw_1.object.t_madre.visible=true		
		dw_1.object.cve_proveed_x_animal.visible=false
		dw_1.object.t_proveed_x_animal.visible=false				

		dw_1.object.t_proveedor.visible=false
		
	    dw_1.getChild('cve_animal',dw_animales)
   	   	dw_animales.settransobject(gtr_sumuia)
				dw_1.setcolumn("cve_animal")

      	if(dw_animales.retrieve(0,1)<1) then
			cb_actualiza.enabled=false						
			messagebox("Aviso!","No se puede insertar generación de Animales, no existen por lo menos un par de animales Macho - Hembra")
			
		else
			dw_1.setfocus()
			dw_1.setcolumn("cve_animal")
		end if
			
		
	end if


end if
end event

type cb_actualiza from commandbutton within w_spre_anim_inventario_resp
integer x = 923
integer y = 1280
integer width = 901
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualiza inventario de animales"
end type

event clicked;string contenido
long no_reg
int cont_insertar

long renglon,cont_actualizaciones


dw_invent_x_gener_fecha.reset()

renglon=dw_1.getrow()

no_crias=integer(em_crias.text)
if no_crias<0 then
	messagebox("Aviso!","Sólo números mayores de 1")
	this.text="1"
	return
end if

cvedepto=dw_1.object.cvedepto[renglon]
cvearea=dw_1.object.cvearea[renglon]
cve_animal=dw_1.object.cve_animal[renglon]
cve_proveed_x_animal=dw_1.object.cve_proveed_x_animal[renglon]
cve_padre=dw_1.object.cve_padre[renglon]
cve_madre=dw_1.object.cve_madre[renglon]
secuencia_generacion=dw_1.object.secuencial_generacion[renglon]
cadena_generacion=dw_1.object.cadena_generacion[renglon]
sexo=dw_1.object.sexo[renglon]
raza=dw_1.object.raza[renglon]
anios_al_adquirir=dw_1.object.anios_al_adquirir[renglon]
meses_al_adquirir=dw_1.object.meses_al_adquirir[renglon]
fecha_nacimiento=dw_1.object.fecha_nacimiento[renglon]
deceso=dw_1.object.deceso[renglon]
fecha_deceso=dw_1.object.fecha_deceso[renglon]
observaciones=dw_1.object.observaciones[renglon]
tiempo_prestamo=dw_1.object.tiempo_prestamo[renglon]
costo_animal=dw_1.object.costo_animal[renglon]
req_firma=dw_1.object.req_firma[renglon]
disp_web=dw_1.object.disp_web[renglon]
reservada_web=dw_1.object.reservada_web[renglon]
folio_req=dw_1.object.folio_req[renglon]

// lo cambio el formato a yyyy/mm/dd para que tome la fecha en Cd MX CPH feb/2018


fecha_registro=datetime(string(now(),"yyyy/mm/dd hh:mm:ss"))
ultima_modificacion=datetime(string(now(),"yyyy/mm/dd hh:mm:ss"))


// select isnull(max(secuencial_generacion),0)+1 from spre_anim_inventario where cadena_generacion='RA-RB';

//(select isnull(max(secuencial_generacion),0)+1 from spre_anim_inventario where cadena_generacion=:cadena_generacion),

cont_actualizaciones=0
for cont_insertar=1 to no_crias

	select isnull(max(secuencial_generacion),0)+1 into :secuencia_generacion from spre_anim_inventario where cadena_generacion=:cadena_generacion  using gtr_sumuia;

	select isnull(max(folio_inventario_anim),0)+1 into :folio_inventario_anim from spre_anim_inventario using gtr_sumuia;




	insert into spre_anim_inventario values (
		:folio_inventario_anim,
		:cvedepto,
		:cvearea,
		:cve_animal,
		:cve_proveed_x_animal,
		:cve_padre,
		:cve_madre,
		:secuencia_generacion,
		:cadena_generacion,
		:sexo,
		:raza,
		:anios_al_adquirir,
		:meses_al_adquirir,
		:fecha_nacimiento,
		:deceso,
		:fecha_deceso,
		:observaciones,
		:tiempo_prestamo,
		:costo_animal,
		:req_firma,
		:disp_web,
		:reservada_web,
		:folio_req,
		:fecha_registro,
		:ultima_modificacion ) using gtr_sumuia;
		
		if (gtr_sumuia.sqlnrows=0) then
			messagebox("Aviso","¡Error al actualizar el inventario!")
		else
			cont_actualizaciones++
		end if

next

commit using gtr_sumuia;

if (no_crias>0) then
	dw_1.reset()
	dw_1.visible=false
	cb_actualiza.visible=false
	cbx_primera_generacion.visible=false	
	em_crias.visible=false
	st_no_crias.visible=false
	
	dw_invent_x_gener_fecha.visible=true	
	st_ajuste_sexo.visible=true
	cb_actualiza_sexo.visible=true
	
	dw_invent_x_gener_fecha.retrieve(cadena_generacion,fecha_registro)
	messagebox("Aviso","Se agregaron "+string(cont_actualizaciones)+" animales en el inventario.")
end if











//if isnull(dw_1.object.no_reg[dw_1.getrow()]) then
//	select isnull(max(no_reg),0)+1 into :no_reg from t_tempo3 using gtr_sumuia;


//	dw_1.object.no_reg[dw_1.getrow()]=no_reg
//end if



//insert into t_tempo3 
	//select isnull(max(no_reg),0)+1,:contenido from t_tempo3 using gtr_sce;
	
//insert into t_tempo3 
	//select isnull(max(no_reg),0)+1,:contenido from t_tempo3 using gtr_sumuia;


//dw_1.update()
//commit using gtr_sumuia;
end event

type dw_1 from datawindow within w_spre_anim_inventario_resp
integer x = 78
integer y = 212
integer width = 3593
integer height = 1044
integer taborder = 20
string title = "none"
string dataobject = "dw_anim_inventario"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long renglon,conteo_animales
Datawindowchild dw_proveed_x_animal,dw_padre,dw_madre

int proveed_x_anim_a_buscar,padre_a_buscar,madre_a_Buscar,animal_a_buscar


string str_padre,str_madre,str_proveedor,cve_generacion_animal

renglon=dw_1.getrow()

if (getcolumn()=4) then // cve_animal
	if (cbx_primera_generacion.checked) then
		dw_1.object.cve_proveed_x_animal[renglon]=0
      	dw_1.getChild('cve_proveed_x_animal',dw_proveed_x_animal)
		dw_proveed_x_animal.settransobject(gtr_sumuia)
      	dw_proveed_x_animal.reset()
		if(dw_proveed_x_animal.retrieve(integer(data))<1) then
			messagebox("Aviso!","No hay proveedores para ese animal")
		else
			dw_1.object.cve_proveed_x_animal[renglon]=dw_proveed_x_animal.getitemnumber(1,6)
//		messagebox("cve_proveed",string(dw_1.object.cve_proveed_x_animal[renglon]))	

			dw_1.setcolumn(5)		

//	dw_1.triggerevent(Clicked!)
//	dw_1.object.cve_proveed_x_animal.setfocus()
		end if
	else // padre y madre
		dw_1.object.cve_proveed_x_animal[renglon]=0
   	   	dw_1.getChild('cve_padre',dw_padre)
		dw_padre.settransobject(gtr_sumuia)
		dw_padre.reset()
		dw_padre.retrieve(integer(data),'M')
		
		
		dw_1.object.cve_proveed_x_animal[renglon]=0
   	   	dw_1.getChild('cve_madre',dw_madre)
		dw_madre.settransobject(gtr_sumuia)
		dw_madre.reset()
		dw_madre.retrieve(integer(data),'H')
		
		
		dw_1.object.cve_padre[renglon]=dw_padre.getitemnumber(1,"folio_inventario_anim") // folio_inventario_anim
		dw_1.object.cve_madre[renglon]=dw_madre.getitemnumber(1,"folio_inventario_anim") // folio_inventario_anim

		generacion_padre=dw_padre.getitemstring(1,"cadena_generacion")
		generacion_madre=dw_madre.getitemstring(1,"cadena_generacion")
		dw_1.object.cadena_generacion[renglon]=generacion_padre+"-"+generacion_madre
		//	messagebox("cadena generacion",string(dw_1.object.cadena_generacion[renglon]))	
//			messagebox("cadena generacion",string(generacion_padre)	
//		accepttext()
//		messagebox("cve_invent_anim",string(dw_1.object.cve_padre[renglon]))	

		dw_1.setcolumn(6) // cve_padre
		
	end if
end if

if (getcolumn()=5) then // cve_proveed_x_animal
	accepttext()
	if(dw_1.object.cve_proveed_x_animal[renglon]<>0) then
		
		proveed_x_anim_a_buscar=dw_1.object.cve_proveed_x_animal[renglon]
		animal_a_buscar=dw_1.object.cve_animal[renglon]
		select count(*)  into :conteo_animales from v_spre_anim_proveed_x_anim where cve_proveed_x_animal=:proveed_x_anim_a_buscar and cve_animal=:animal_a_buscar using gtr_sumuia;	
		if(conteo_animales=0) then 
			messagebox("Aviso","cve de padre incorrecta")								
	      	dw_1.getChild('cve_proveed_x_animal',dw_proveed_x_animal)
			dw_proveed_x_animal.settransobject(gtr_sumuia)
      		dw_proveed_x_animal.reset()
			if(dw_proveed_x_animal.retrieve(animal_a_buscar)<1) then
				messagebox("Aviso!","No hay proveedores para ese animal")
			else
				dw_1.object.cve_proveed_x_animal[renglon]=dw_proveed_x_animal.getitemnumber(1,6)
				return(2) // se regresa 2 para que respete el valor que se le asigna en la linea de arriba CPH Nov/2017				
			end if
	
		else // conteo
			select str_replace(descripcion_completa,'  ',NULL),cve_generacion_animal into :str_proveedor,:cve_generacion_animal from v_spre_anim_proveed_x_anim where cve_proveed_x_animal=:proveed_x_anim_a_buscar using gtr_sumuia;
			dw_1.object.t_proveed_x_animal.text=str_proveedor		
			dw_1.object.cadena_generacion[renglon]=cve_generacion_animal

//		st_proveedor.text="hola"
//		messagebox("",string(proveed_x_anim_a_buscar))
			cb_actualiza.enabled=true
		end if
	end if

end if


if (getcolumn()=6) then // cve_padre

	accepttext()
	if(dw_1.object.cve_padre[renglon]<>0) then

		animal_a_buscar=dw_1.object.cve_animal[renglon]
		padre_a_buscar=dw_1.object.cve_padre[renglon]
		madre_a_buscar=dw_1.object.cve_madre[renglon]		

		select count(*) into :conteo_animales from spre_anim_inventario where folio_inventario_anim=:padre_a_buscar and cve_animal=:animal_a_buscar  and sexo='M' using gtr_sumuia;
		

		if(conteo_animales=0) then 
			messagebox("Aviso","cve de padre incorrecta")						
	   	   	dw_1.getChild('cve_padre',dw_padre)
			dw_padre.settransobject(gtr_sumuia)
			dw_padre.reset()
			dw_padre.retrieve(animal_a_buscar,'M')

			generacion_padre=dw_padre.getitemstring(1,"cadena_generacion")
			generacion_madre=dw_madre.getitemstring(1,"cadena_generacion")
			dw_1.object.cadena_generacion[renglon]=generacion_padre+"-"+generacion_madre

			dw_1.object.cve_padre[renglon]=dw_padre.getitemnumber(1,"folio_inventario_anim") // folio_inventario_anim
	
			return(2) // se regresa 2 para que respete el valor que se le asigna en la linea de arriba CPH Nov/2017
		else


			select descripcion_invent_corta,str_replace(cadena_generacion,'-',NULL) into :str_padre,:generacion_padre from v_spre_anim_invent_corta where folio_inventario_anim=:padre_a_buscar using gtr_sumuia;
			select descripcion_invent_corta,str_replace(cadena_generacion,'-',NULL) into :str_madre,:generacion_madre from v_spre_anim_invent_corta where folio_inventario_anim=:madre_a_buscar using gtr_sumuia;
			dw_1.object.cadena_generacion[renglon]=generacion_padre+"-"+generacion_madre
			dw_1.object.t_padre.text=str_padre
			dw_1.object.t_madre.text=str_madre
	//	st_proveedor.text=trim(st_proveedor.text)

//			messagebox("",string(padre_a_buscar))
		end if

	end if
end if

if (getcolumn()=7) then // cve_padre

	accepttext()
	if(dw_1.object.cve_padre[renglon]<>0) then
		animal_a_buscar=dw_1.object.cve_animal[renglon]
		padre_a_buscar=dw_1.object.cve_padre[renglon]
		madre_a_buscar=dw_1.object.cve_madre[renglon]		

		select count(*) into :conteo_animales from spre_anim_inventario where folio_inventario_anim=:madre_a_buscar and cve_animal=:animal_a_buscar  and sexo='H' using gtr_sumuia;
		

		if(conteo_animales=0) then 
			messagebox("Aviso","cve de madre incorrecta")			
	   	   	dw_1.getChild('cve_madre',dw_madre)
			dw_madre.settransobject(gtr_sumuia)
			dw_madre.reset()
			dw_madre.retrieve(animal_a_buscar,'H')

			generacion_padre=dw_padre.getitemstring(1,"cadena_generacion")
			generacion_madre=dw_madre.getitemstring(1,"cadena_generacion")
			dw_1.object.cadena_generacion[renglon]=generacion_padre+"-"+generacion_madre


			dw_1.object.cve_madre[renglon]=dw_madre.getitemnumber(1,"folio_inventario_anim") // folio_inventario_anim
			return(2) // se regresa 2 para que respete el valor que se le asigna en la linea de arriba CPH Nov/2017
		else
		//	select descripcion_invent_corta into :str_padre from v_spre_anim_invent_corta where folio_inventario_anim=:padre_a_buscar using gtr_sumuia;
			select descripcion_invent_corta,str_replace(cadena_generacion,'-',NULL) into :str_padre,:generacion_padre from v_spre_anim_invent_corta where folio_inventario_anim=:padre_a_buscar using gtr_sumuia;
			select descripcion_invent_corta,str_replace(cadena_generacion,'-',NULL) into :str_madre,:generacion_madre from v_spre_anim_invent_corta where folio_inventario_anim=:madre_a_buscar using gtr_sumuia;
			dw_1.object.cadena_generacion[renglon]=generacion_padre+"-"+generacion_madre
			dw_1.object.t_padre.text=str_padre
			dw_1.object.t_madre.text=str_madre

	//	st_proveedor.text=trim(st_proveedor.text)

//			messagebox("",string(padre_a_buscar))
		end if
	end if
end if


end event

type dw_invent_x_gener_fecha from datawindow within w_spre_anim_inventario_resp
integer x = 78
integer y = 224
integer width = 4649
integer height = 1688
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_inventario_corta_x_gener_fecha"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_lista_inventario_corta_params from datawindow within w_spre_anim_inventario_resp
integer x = 78
integer y = 216
integer width = 4649
integer height = 1692
integer taborder = 60
boolean titlebar = true
string title = "Inventario de Animales"
string dataobject = "dw_lista_inventario_corta_params"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

