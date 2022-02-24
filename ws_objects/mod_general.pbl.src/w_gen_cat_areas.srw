$PBExportHeader$w_gen_cat_areas.srw
forward
global type w_gen_cat_areas from window
end type
type dw_area from datawindow within w_gen_cat_areas
end type
type cb_eliminar from commandbutton within w_gen_cat_areas
end type
type cb_actualizar from commandbutton within w_gen_cat_areas
end type
type cb_nuevo from commandbutton within w_gen_cat_areas
end type
type gb_area from groupbox within w_gen_cat_areas
end type
end forward

global type w_gen_cat_areas from window
integer width = 2158
integer height = 1754
boolean titlebar = true
string title = "Catálogo de Áreas"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_area dw_area
cb_eliminar cb_eliminar
cb_actualizar cb_actualizar
cb_nuevo cb_nuevo
gb_area gb_area
end type
global w_gen_cat_areas w_gen_cat_areas

type variables
integer ii_cvearea
end variables

forward prototypes
public function integer f_ultima_area ()
end prototypes

public function integer f_ultima_area ();integer li_area

	select max(cvearea)
	into :li_area
	from dbo.spre_areas
	where cvedepto =:gi_depto
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máxima Área", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_area) then li_area=0

	return(li_area)
end function

on w_gen_cat_areas.create
this.dw_area=create dw_area
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.gb_area=create gb_area
this.Control[]={this.dw_area,&
this.cb_eliminar,&
this.cb_actualizar,&
this.cb_nuevo,&
this.gb_area}
end on

on w_gen_cat_areas.destroy
destroy(this.dw_area)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.gb_area)
end on

event open;dw_area.settransobject(gtr_sumuia)


if gi_depto=10 then
	dw_area.object.tipo_espacio.visible=true
else
	dw_area.object.tipo_espacio.visible=false
end if


dw_area.Retrieve(gi_depto)
if dw_area.RowCount()>0 then dw_area.ScrollToRow(1)

end event

type dw_area from datawindow within w_gen_cat_areas
integer x = 73
integer y = 102
integer width = 1975
integer height = 1312
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_area_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_cvearea=dw_area.GetItemNumber(currentrow,'cvearea')
end event

type cb_eliminar from commandbutton within w_gen_cat_areas
integer x = 1792
integer y = 1546
integer width = 300
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

if dw_area.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		li_row=dw_area.getrow()
		
		if dw_area.GetItemNumber(li_row,'borrable')=0 then
	
			//Eliminar
	
			update dbo.spre_areas
			set activo=0
			where cvedepto=:gi_depto
			and cvearea=:ii_cvearea
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
				rollback using gtr_sumuia;
			else
				messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
				commit using gtr_sumuia;	
			end if		
	
	
			dw_area.Reset()
			dw_area.Retrieve(gi_depto, ii_cvearea)
			
		else
			if gi_depto=8 and gi_area=3  then
				messagebox('Aviso','Para borrar la categoría de Área, debe borrar primero las categorías de Función que tenga registradas.')
			else
				messagebox('Aviso','Para borrar la categoría de Área, debe borrar primero las categorías de Grupo de Material que tenga registradas.')	
			end if
		end if
		
	end if
	
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_areas
integer x = 1474
integer y = 1546
integer width = 322
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

event clicked;integer li_i, li_area, NET, li_j=0, li_k
integer li_narea, li_tipo
string ls_descripcion
	
if dw_area.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		li_area=f_ultima_area()
	
		for li_i=1 to dw_area.RowCount()

			if  dw_area.GetItemNumber(li_i,'tipo_espacio') = -1 then
				messagebox('Aviso','Debe elegir un tipo de espacio.')
				return
			end if
			
			if dw_area.GetItemNumber(li_i,'activo')=-1 then  
				li_area=li_area+1
				dw_area.SetItem(li_i,'cvearea',li_area)
				dw_area.SetItem(li_i,'activo',1)
				dw_area.SetItem(li_i,'editable',0)

				//Foro
				if gi_depto=10 and dw_area.GetItemNumber(li_i,'tipo_espacio')=1 then
					li_j=li_j+1
					li_narea=li_area
					li_tipo=dw_area.GetItemNumber(li_i,'tipo_espacio')
					ls_descripcion=dw_area.GetItemString(li_i,'descripcion')
				else
					//Laboratorio
					if gi_depto=10 and dw_area.GetItemNumber(li_i,'tipo_espacio')=2 then
						li_j=li_j+1
						li_narea=li_area
						li_tipo=dw_area.GetItemNumber(li_i,'tipo_espacio')
						ls_descripcion='Equipo de Cómputo'
					else
						li_j=li_j+1
						li_narea=li_area
						li_tipo=0
						ls_descripcion='Almacen'					
					end if
				end if
			end if
		next
		
	
		if dw_area.update()>0 then

			if li_j>0 then
				
					if li_tipo >0 then
			
						//Grupo
						insert into dbo.spre_grupo_material
						(cvedepto,cvearea,cvegrupo,descripcion,activo)
						values
						(:gi_depto,:li_narea,1,:ls_descripcion,1)
						using gtr_sumuia;	
	
						//Material
						insert into dbo.spre_materiales
						(cvedepto,cvearea,cvegrupo,cvematerial,descripcion,activo,multa)
						values
						(:gi_depto,:li_narea,1,'1',:ls_descripcion,1,0)
						using gtr_sumuia;					
	
						//Inventario
						if li_tipo=1 then
							insert into dbo.spre_inventario
							(cvedepto,cvearea,cvegrupo,cvematerial,num_serie,stauts,prestamo_unitario, disp_web,tiempo_prestamo)
							values
							(:gi_depto,:li_narea,1,'1','1',1,1,1,0)
							using gtr_sumuia;
						end if
					end if	
					
					//Permisos
					insert into spre_permisos_area (cvedepto, cvearea, cvepermiso) 
					select distinct cvedepto,:li_narea,cvepermiso 
					from spre_permisos_area where cvedepto=:gi_depto
					and cvearea in (select cvearea from spre_areas where tipo_espacio=:li_tipo)
					using gtr_sumuia;
				
					//Tipos Usuario
					insert into spre_permisos_area_tipousuario  (cvedepto,cvearea,cve_tipo_usuario) 
					select distinct cvedepto,:li_narea,cve_tipo_usuario 
					from spre_permisos_area_tipousuario
					where cvedepto=:gi_depto
					and cvearea in (select cvearea from spre_areas where tipo_espacio=:li_tipo)
					using gtr_sumuia;

			end if			
			
			commit using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
		else
			rollback using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
		end if
		
		cb_nuevo.enabled=true
	
	end if

end if
	
end event

type cb_nuevo from commandbutton within w_gen_cat_areas
integer x = 1178
integer y = 1546
integer width = 300
integer height = 99
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Nuevo"
end type

event clicked;long ll_nva_linea

cb_nuevo.enabled=false

dw_area.setfocus()	

if dw_area.accepttext()=1 then
	ll_nva_linea=dw_area.insertrow(0)
	dw_area.setcolumn(1)
	dw_area.scrolltorow(ll_nva_linea)
end if

dw_area.setitem(dw_area.getrow(),'cvedepto',gi_depto)
dw_area.setitem(dw_area.getrow(),'activo',-1)
dw_area.setitem(dw_area.getrow(),'editable',-1)
dw_area.setitem(dw_area.getrow(),'borrable',0)
dw_area.setitem(dw_area.getrow(),'tipo_espacio',-1)
	

end event

type gb_area from groupbox within w_gen_cat_areas
integer x = 33
integer y = 35
integer width = 2055
integer height = 1434
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Área"
end type

