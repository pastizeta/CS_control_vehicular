$PBExportHeader$w_catalogos_spre_anim_resp.srw
forward
global type w_catalogos_spre_anim_resp from window
end type
type st_2 from statictext within w_catalogos_spre_anim_resp
end type
type tab_catalogos from tab within w_catalogos_spre_anim_resp
end type
type tabpage_cat_animales from userobject within tab_catalogos
end type
type dw_cat_animales from datawindow within tabpage_cat_animales
end type
type tabpage_cat_animales from userobject within tab_catalogos
dw_cat_animales dw_cat_animales
end type
type tabpage_cat_proveedores from userobject within tab_catalogos
end type
type cb_2 from commandbutton within tabpage_cat_proveedores
end type
type st_1 from statictext within tabpage_cat_proveedores
end type
type cb_1 from commandbutton within tabpage_cat_proveedores
end type
type dw_anim_x_proveed from datawindow within tabpage_cat_proveedores
end type
type dw_lista_proveed from datawindow within tabpage_cat_proveedores
end type
type gb_1 from groupbox within tabpage_cat_proveedores
end type
type tabpage_cat_proveedores from userobject within tab_catalogos
cb_2 cb_2
st_1 st_1
cb_1 cb_1
dw_anim_x_proveed dw_anim_x_proveed
dw_lista_proveed dw_lista_proveed
gb_1 gb_1
end type
type tab_catalogos from tab within w_catalogos_spre_anim_resp
tabpage_cat_animales tabpage_cat_animales
tabpage_cat_proveedores tabpage_cat_proveedores
end type
end forward

global type w_catalogos_spre_anim_resp from window
string tag = "Catálogos"
integer width = 3959
integer height = 2528
boolean titlebar = true
string title = "Catálogos"
string menuname = "m_config_catalogos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event insertar ( )
event cerrar_ventana ( )
event actualiza_tabla ( )
event inserta_renglon ( )
st_2 st_2
tab_catalogos tab_catalogos
end type
global w_catalogos_spre_anim_resp w_catalogos_spre_anim_resp

type variables
datawindow dw_catalogo,dw_catalogo2
end variables

event insertar();// insertar
end event

event cerrar_ventana();
long result

//dw_carreras_ofertadas.accepttext()

/*
if(cambiaron_datos) then
	result=messagebox("Aviso","Cambiaron Datos! ¿Desea Salir?",Exclamation!, OKCancel!, 2) 
	if(result=1) then
		close(this)	
	end if
else	
	close(this)		
end if

*/

close(this)		
end event

event actualiza_tabla();//messagebox("","actualizando")

//tab_catalogos.tabpage_cat_animales.dw_cat_animales.settransobject(gtr_sumuia)
int result
long no_renglones, ciclo_borra,cve_a_borrar,existe_en_otra_tabla,ciclo_inserta,cve_a_insertar
string descripcion
int media_de_vida_dias

no_renglones=dw_catalogo.rowcount()
dw_catalogo.accepttext()

//messagebox("","actualizando"+string(tab_catalogos.selectedtab))

dw_catalogo.setredraw(FALSE)

choose case tab_catalogos.selectedtab
	case 1

		// primero inserta
			for ciclo_inserta=1 to no_renglones
				if (dw_catalogo.object.insertar[ciclo_inserta]=1) then
					descripcion=dw_catalogo.object.descripcion[ciclo_inserta]
					media_de_vida_dias=dw_catalogo.object.media_de_vida_dias[ciclo_inserta]
					
					select isnull(max(cve_animal),0)+1 into :cve_a_insertar from spre_anim_cat_animales  using gtr_sumuia;					
					dw_catalogo.object.cve_animal[ciclo_inserta]=cve_a_insertar					
					
					result=messagebox("Advertencia","¿Desea Insertar el animal "+string(cve_a_insertar)+" "+string(dw_catalogo.object.descripcion[ciclo_inserta])+" ?",Exclamation!, OKCancel!, 2) 
					if(result=1) then
						insert into spre_anim_cat_animales values (:cve_a_insertar,:descripcion,:media_de_vida_dias)   using gtr_sumuia;					

							
						if(gtr_sumuia.sqlnrows<1) then
							messagebox("Advertencia","Error al insertar la Base de datos del catálogo de animales")
						end if
						commit using gtr_sumuia;							
					end if						
					
				end if
			next		
			
			for ciclo_inserta=1 to no_renglones
				if(ciclo_inserta<=dw_catalogo.rowcount()) then					
					if (dw_catalogo.object.insertar[ciclo_inserta]=1) then
					
						dw_catalogo.deleterow(ciclo_inserta)
						ciclo_inserta=ciclo_inserta - 1
					end if
				end if
			next		
			
			no_renglones=dw_catalogo.rowcount()
			
			
			//en segunda actualiza		
			if no_renglones>0 then

				dw_catalogo.update()
			
			
				commit using gtr_sumuia;
			end if
			
			// luego borra
			
			for ciclo_borra=1 to no_renglones
				if(ciclo_borra<=dw_catalogo.rowcount()) then									
					descripcion=dw_catalogo.object.descripcion[ciclo_borra]				
					if (dw_catalogo.object.borrar[ciclo_borra]=1) then
						cve_a_borrar=dw_catalogo.object.cve_animal[ciclo_borra]
						select count(*) into :existe_en_otra_tabla from spre_anim_proveed_x_anim where cve_animal=:cve_a_borrar using gtr_sumuia;

						if(existe_en_otra_tabla>0) then
							messagebox("Aviso","El animal "+string(cve_a_borrar)+" "+string(dw_catalogo.object.descripcion[ciclo_borra])+" tiene animales registrados en otros catálogos y no se eliminará")
							dw_catalogo.object.borrar[ciclo_borra]=0						
						else
							result=messagebox("Advertencia","¿Desea eliminar el animal "+string(cve_a_borrar)+" "+descripcion+" ?",Exclamation!, OKCancel!, 2) 
							if(result=1) then
								delete from spre_anim_cat_animales where cve_animal=:cve_a_borrar using gtr_sumuia;							
							
								if(gtr_sumuia.sqlnrows<1) then
									messagebox("Advertencia","Error al actualizar la Base de datos del catálogo de animales")
								end if
							
							
								commit using gtr_sumuia;							
								dw_catalogo.deleterow(ciclo_borra)
								ciclo_borra = ciclo_borra - 1
							end if						
						
						end if
					end if
				end if
			next
			dw_catalogo.setredraw(TRUE)			
			dw_catalogo.retrieve()
			
	
	case 2 //Proveedores


		// primero inserta
			for ciclo_inserta=1 to no_renglones
				if (dw_catalogo.object.insertar[ciclo_inserta]=1) then
					descripcion=dw_catalogo.object.nombre_proveedor[ciclo_inserta]

					
					select isnull(max(cve_proveedor),0)+1 into :cve_a_insertar from spre_anim_proveedores  using gtr_sumuia;					
					
					dw_catalogo.object.cve_proveedor[ciclo_inserta]=cve_a_insertar					
					
					result=messagebox("Advertencia","¿Desea Insertar el Proveedor "+string(cve_a_insertar)+" "+string(descripcion)+" ?",Exclamation!, OKCancel!, 2) 
					if(result=1) then
						insert into spre_anim_proveedores values (:cve_a_insertar,:descripcion)   using gtr_sumuia;					

							
						if(gtr_sumuia.sqlnrows<1) then
							messagebox("Advertencia","Error al insertar la Base de datos del catálogo de proveedores")
						end if
						commit using gtr_sumuia;							
					end if						
					
				end if
			next		
			
			for ciclo_inserta=1 to no_renglones
				if(ciclo_inserta<=dw_catalogo.rowcount()) then					
					if (dw_catalogo.object.insertar[ciclo_inserta]=1) then
					
						dw_catalogo.deleterow(ciclo_inserta)

						ciclo_inserta=ciclo_inserta - 1
					end if
				end if
			next		
			
			no_renglones=dw_catalogo.rowcount()
			
			//en segunda actualiza		
			if no_renglones>0 then

				dw_catalogo.update()
			
			
				commit using gtr_sumuia;
			end if
			
			// luego borra
			
			for ciclo_borra=1 to no_renglones
				if(ciclo_borra<=dw_catalogo.rowcount()) then													
					descripcion=dw_catalogo.object.nombre_proveedor[ciclo_borra]				
					if (dw_catalogo.object.borrar[ciclo_borra]=1) then
						cve_a_borrar=dw_catalogo.object.cve_proveedor[ciclo_borra]
						select count(*) into :existe_en_otra_tabla from spre_anim_proveed_x_anim where cve_proveedor=:cve_a_borrar using gtr_sumuia;

						if(existe_en_otra_tabla>0) then
							messagebox("Aviso","El Proveedor "+string(cve_a_borrar)+" "+string(descripcion)+" tiene proveedores registrados en otros catálogos y no se eliminará")
							dw_catalogo.object.borrar[ciclo_borra]=0						
						else
							result=messagebox("Advertencia","¿Desea eliminar el Proveedor "+string(cve_a_borrar)+" "+descripcion+" ?",Exclamation!, OKCancel!, 2) 
							if(result=1) then
								delete from spre_anim_proveedores where cve_proveedor=:cve_a_borrar using gtr_sumuia;							
							
								if(gtr_sumuia.sqlnrows<1) then
									messagebox("Advertencia","Error al actualizar la Base de datos del catálogo de Proveedores")
								end if
								dw_catalogo.deleterow(ciclo_borra)								
								ciclo_borra = ciclo_borra - 1
								commit using gtr_sumuia;							
							end if						
						
						end if
					end if
				end if
			next
			dw_catalogo.setredraw(TRUE)						
			dw_catalogo.retrieve()			

end choose


//messagebox("","actualizando"+string(tab_catalogos.selectedtab))
end event

event inserta_renglon();//messagebox("","actualizando")

//tab_catalogos.tabpage_cat_animales.dw_cat_animales.settransobject(gtr_sumuia)
int result
long no_renglones, ciclo_borra,cve_a_borrar,existe_en_otra_tabla,renglon_a_insertar

no_renglones=dw_catalogo.rowcount()

choose case tab_catalogos.selectedtab
	case 1
			
			renglon_a_insertar=dw_catalogo.insertrow(no_renglones+1)
			dw_catalogo.setfocus()
			dw_catalogo.scrolltorow(renglon_a_insertar)
			dw_catalogo.setrow(renglon_a_insertar)
			dw_catalogo.setcolumn(2)//"descripcion")
			dw_catalogo.object.insertar[renglon_a_insertar]=1
	case 2
			
			renglon_a_insertar=dw_catalogo.insertrow(no_renglones+1)
			dw_catalogo.setfocus()
			dw_catalogo.scrolltorow(renglon_a_insertar)
			dw_catalogo.setrow(renglon_a_insertar)
			dw_catalogo.setcolumn(2)//"descripcion")
			dw_catalogo.object.insertar[renglon_a_insertar]=1
			

end choose


//messagebox("","actualizando"+string(tab_catalogos.selectedtab))
end event

on w_catalogos_spre_anim_resp.create
if this.MenuName = "m_config_catalogos" then this.MenuID = create m_config_catalogos
this.st_2=create st_2
this.tab_catalogos=create tab_catalogos
this.Control[]={this.st_2,&
this.tab_catalogos}
end on

on w_catalogos_spre_anim_resp.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_2)
destroy(this.tab_catalogos)
end on

event open;

tab_catalogos.tabpage_cat_animales.dw_cat_animales.settransobject(gtr_sumuia)
tab_catalogos.tabpage_cat_proveedores.dw_lista_proveed.settransobject(gtr_sumuia)
tab_catalogos.tabpage_cat_proveedores.dw_anim_x_proveed.settransobject(gtr_sumuia)

tab_catalogos.tabpage_cat_animales.dw_cat_animales.setrowfocusindicator(Hand!)
tab_catalogos.tabpage_cat_proveedores.dw_lista_proveed.setrowfocusindicator(Hand!)
tab_catalogos.tabpage_cat_proveedores.dw_lista_proveed.setrowfocusindicator(Hand!)
end event

type st_2 from statictext within w_catalogos_spre_anim_resp
integer x = 485
integer y = 192
integer width = 2377
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Proveedores de Animales"
alignment alignment = center!
boolean focusrectangle = false
end type

type tab_catalogos from tab within w_catalogos_spre_anim_resp
integer x = 82
integer y = 32
integer width = 3410
integer height = 2264
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_cat_animales tabpage_cat_animales
tabpage_cat_proveedores tabpage_cat_proveedores
end type

on tab_catalogos.create
this.tabpage_cat_animales=create tabpage_cat_animales
this.tabpage_cat_proveedores=create tabpage_cat_proveedores
this.Control[]={this.tabpage_cat_animales,&
this.tabpage_cat_proveedores}
end on

on tab_catalogos.destroy
destroy(this.tabpage_cat_animales)
destroy(this.tabpage_cat_proveedores)
end on

event selectionchanged;integer no_tab_page
long renglon

no_tab_page=newindex


choose case no_tab_page
	case 1
		dw_catalogo=tab_catalogos.tabpage_cat_animales.dw_cat_animales
		dw_catalogo.retrieve()
	case 2
		dw_catalogo=tab_catalogos.tabpage_cat_proveedores.dw_lista_proveed
		renglon=dw_catalogo.retrieve()		
		if(renglon>0) then
			tab_catalogos.tabpage_cat_proveedores.dw_anim_x_proveed.retrieve(dw_catalogo.object.cve_proveedor[1])		
		end if
end choose

/*

if (newindex=2) then
	messagebox("","en dos")
end if */
end event

type tabpage_cat_animales from userobject within tab_catalogos
integer x = 18
integer y = 112
integer width = 3374
integer height = 2136
long backcolor = 67108864
string text = "Catálogo de Animales"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_cat_animales dw_cat_animales
end type

on tabpage_cat_animales.create
this.dw_cat_animales=create dw_cat_animales
this.Control[]={this.dw_cat_animales}
end on

on tabpage_cat_animales.destroy
destroy(this.dw_cat_animales)
end on

type dw_cat_animales from datawindow within tabpage_cat_animales
integer x = 55
integer y = 160
integer width = 2990
integer height = 1044
integer taborder = 20
string title = "none"
string dataobject = "dw_anim_lista_cat_animales_ins_borrar"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_cat_proveedores from userobject within tab_catalogos
integer x = 18
integer y = 112
integer width = 3374
integer height = 2136
long backcolor = 67108864
string text = "Catálogo de Proveedores"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_2 cb_2
st_1 st_1
cb_1 cb_1
dw_anim_x_proveed dw_anim_x_proveed
dw_lista_proveed dw_lista_proveed
gb_1 gb_1
end type

on tabpage_cat_proveedores.create
this.cb_2=create cb_2
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_anim_x_proveed=create dw_anim_x_proveed
this.dw_lista_proveed=create dw_lista_proveed
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.st_1,&
this.cb_1,&
this.dw_anim_x_proveed,&
this.dw_lista_proveed,&
this.gb_1}
end on

on tabpage_cat_proveedores.destroy
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_anim_x_proveed)
destroy(this.dw_lista_proveed)
destroy(this.gb_1)
end on

type cb_2 from commandbutton within tabpage_cat_proveedores
integer x = 507
integer y = 1968
integer width = 965
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Insertar Animales por proveedores"
end type

event clicked;long renglon_a_insertar

dw_catalogo2=tab_catalogos.tabpage_cat_proveedores.dw_anim_x_proveed

renglon_a_insertar=dw_catalogo2.insertrow(dw_catalogo2.rowcount()+1)
dw_catalogo2.setfocus()
dw_catalogo2.scrolltorow(renglon_a_insertar)
dw_catalogo2.setrow(renglon_a_insertar)
dw_catalogo2.setcolumn("spre_anim_proveed_x_anim_cve_animal")
dw_catalogo2.object.insertar[renglon_a_insertar]=1

dw_catalogo2.object.spre_anim_proveed_x_anim_cve_proveedor[renglon_a_insertar]=dw_catalogo.object.cve_proveedor[dw_catalogo.getrow()]

//messagebox("proveed",string(dw_catalogo.object.cve_proveedor[dw_catalogo.getrow()]))

end event

type st_1 from statictext within tabpage_cat_proveedores
integer x = 416
integer y = 900
integer width = 2377
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Animales/Generaciones por proveedor"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within tabpage_cat_proveedores
integer x = 1870
integer y = 1968
integer width = 1061
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar Animales por proveedores"
end type

event clicked;int result
long no_renglones, ciclo_borra,cve_a_borrar,existe_en_otra_tabla,ciclo_inserta,cve_a_insertar

long cve_animal_a_insertar,cve_proveedor
string descripcion


dw_catalogo2=dw_anim_x_proveed
dw_catalogo2.accepttext()

no_renglones=dw_catalogo2.rowcount()

	// primero inserta

			for ciclo_inserta=1 to no_renglones
				if (dw_catalogo2.object.insertar[ciclo_inserta]=1) then
					descripcion=dw_catalogo2.object.spre_anim_proveed_x_anim_cve_generacion_animal[ciclo_inserta]
					cve_animal_a_insertar=dw_catalogo2.object.spre_anim_proveed_x_anim_cve_animal[ciclo_inserta]
					cve_proveedor=dw_catalogo2.object.spre_anim_proveed_x_anim_cve_proveedor[ciclo_inserta]
					select isnull(max(cve_proveed_x_animal),0)+1 into :cve_a_insertar from spre_anim_proveed_x_anim  using gtr_sumuia;					
					
					dw_catalogo2.object.spre_anim_proveed_x_anim_cve_proveedor[ciclo_inserta]=cve_a_insertar
					
					result=messagebox("Advertencia","¿Desea Insertar el animal/proveedor "+string(cve_a_insertar)+" "+descripcion+" ?",Exclamation!, OKCancel!, 2) 
					if(result=1) then
					
				//	messagebox("",string(cve_a_insertar)+"-"+string(cve_proveedor)+"-"+string(cve_animal_a_insertar)+"-"+string(descripcion))
					
						insert into spre_anim_proveed_x_anim  values (:cve_a_insertar,:cve_proveedor,:cve_animal_a_insertar,:descripcion)   using gtr_sumuia;					

							
						if(gtr_sumuia.sqlnrows<1) then
							messagebox("Advertencia","Error al insertar en la Base de datos del catálogo de animales-proveedores")
						end if
						commit using gtr_sumuia;							
					end if						
					
				end if
			next		
			
			for ciclo_inserta=1 to no_renglones
				if(ciclo_inserta<=dw_catalogo2.rowcount()) then					
					if (dw_catalogo2.object.insertar[ciclo_inserta]=1) then
					
						dw_catalogo2.deleterow(ciclo_inserta)
						ciclo_inserta=ciclo_inserta - 1
					end if
				end if
			next		
			
			no_renglones=dw_catalogo2.rowcount()
			
			
			//en segunda actualiza		
			if no_renglones>0 then

				dw_catalogo2.update()
			
			
				commit using gtr_sumuia;
			end if
			
			// luego borra
			
			for ciclo_borra=1 to no_renglones
				if(ciclo_borra<=dw_catalogo2.rowcount()) then									
					descripcion=dw_catalogo2.object.spre_anim_proveed_x_anim_cve_generacion_animal[ciclo_borra]				
					if (dw_catalogo2.object.borrar[ciclo_borra]=1) then
						cve_a_borrar=dw_catalogo2.object.spre_anim_proveed_x_anim_cve_proveed_x_animal[ciclo_borra]
						
						select count(*) into :existe_en_otra_tabla from spre_anim_inventario where cve_proveed_x_animal=:cve_a_borrar using gtr_sumuia;

						if(existe_en_otra_tabla>0) then
							messagebox("Aviso","Esa generación de animal "+string(cve_a_borrar)+" "+descripcion+" tiene animales registrados en otros catálogos y no se eliminará")
							dw_catalogo2.object.borrar[ciclo_borra]=0						
						else
							result=messagebox("Advertencia","¿Desea eliminar esa generacion/proveedor del animal "+string(cve_a_borrar)+" "+descripcion+" ?",Exclamation!, OKCancel!, 2) 
							if(result=1) then
							


								delete from spre_anim_proveed_x_anim where cve_proveed_x_animal=:cve_a_borrar using gtr_sumuia;							
							
								if(gtr_sumuia.sqlnrows<1) then
									messagebox("Advertencia","Error al actualizar la Base de datos del catálogo de proveedores/animales")
								end if
							
							
								commit using gtr_sumuia;							
								dw_catalogo2.deleterow(ciclo_borra)
								ciclo_borra = ciclo_borra - 1
							end if						
						
						end if
					end if
				end if
			next
			dw_catalogo2.setredraw(TRUE)			
			dw_catalogo2.retrieve(dw_catalogo.object.cve_proveedor[dw_catalogo.getrow()])
end event

type dw_anim_x_proveed from datawindow within tabpage_cat_proveedores
integer x = 82
integer y = 1000
integer width = 2999
integer height = 952
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_anim_proveed_x_anim_ins_borrar"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//spre_anim_proveed_x_anim_cve_animal

string descripcion,generacion
long cve_animal
long conteo


if(this.getcolumn()=4) then

	cve_animal=long(data)

	select descripcion into :descripcion from spre_anim_cat_animales where cve_animal=:cve_animal using gtr_sumuia;

	this.object.spre_anim_cat_animales_descripcion[row]=descripcion
end if
if(this.getcolumn()=5) then
	this.accepttext()
	string	gen_anterior
	gen_anterior=data
	generacion=this.object.spre_anim_proveed_x_anim_cve_generacion_animal[row]

	cve_animal=this.object.spre_anim_proveed_x_anim_cve_proveedor[row]

	select count(*) into :conteo from spre_anim_proveed_x_anim where cve_generacion_animal=:generacion using gtr_sumuia;	
	if (conteo>0) then
		messagebox("Aviso","Ya exsite esa generacion asignada")		
		this.object.spre_anim_proveed_x_anim_cve_generacion_animal[row]=gen_anterior
		this.setcolumn("spre_anim_proveed_x_anim_cve_generacion_animal")
		this.setfocus()
//		this.setcolumn(4)
		return 0
	end if

//spre_anim_proveed_x_anim_cve_animal
end if


end event

event dberror;//messagebox("SQLerr",string(sqldbcode))

if(sqldbcode=2601) then
	messagebox("Aviso","No se actualizó la base de datos porque ya existe una de las generaciones")
	return(1)
end if
end event

type dw_lista_proveed from datawindow within tabpage_cat_proveedores
integer x = 82
integer y = 172
integer width = 2999
integer height = 656
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_anim_proveed_insertar_borrar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;		if(row>0) then
			tab_catalogos.tabpage_cat_proveedores.dw_anim_x_proveed.retrieve(dw_catalogo.object.cve_proveedor[row])		
		end if

end event

type gb_1 from groupbox within tabpage_cat_proveedores
integer x = 32
integer y = 860
integer width = 3141
integer height = 1256
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

