$PBExportHeader$w_psi_animales_edita_cruza.srw
forward
global type w_psi_animales_edita_cruza from window
end type
type dw_crias from datawindow within w_psi_animales_edita_cruza
end type
type dw_alta_crias from datawindow within w_psi_animales_edita_cruza
end type
type cb_eliminar from commandbutton within w_psi_animales_edita_cruza
end type
type cb_guardar from commandbutton within w_psi_animales_edita_cruza
end type
type dw_cruza from datawindow within w_psi_animales_edita_cruza
end type
type gb_cruza from groupbox within w_psi_animales_edita_cruza
end type
type gb_crias from groupbox within w_psi_animales_edita_cruza
end type
end forward

global type w_psi_animales_edita_cruza from window
integer width = 4769
integer height = 1318
boolean titlebar = true
string title = "Alta/Edición cruza"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_crias dw_crias
dw_alta_crias dw_alta_crias
cb_eliminar cb_eliminar
cb_guardar cb_guardar
dw_cruza dw_cruza
gb_cruza gb_cruza
gb_crias gb_crias
end type
global w_psi_animales_edita_cruza w_psi_animales_edita_cruza

type variables
long il_cruza=0
integer ii_guardado = 0, ii_crias = 0

str_animales_proveedores istr_animales_proveedor
str_animales_crias istr_animales_padre, istr_animales_madre





end variables

forward prototypes
public function long uf_next_id_cruza ()
public function integer uf_verificar_datos ()
public subroutine uf_alta_crias ()
public function long uf_next_id_cria ()
end prototypes

public function long uf_next_id_cruza ();long ll_cruza

select isnull(max(id_cruza),0) +1
into :ll_cruza
from dbo.spre_animales_cruza
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener máxima cruza", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return -1
else
	commit using gtr_sumuia;	
end if

return(ll_cruza)
end function

public function integer uf_verificar_datos ();dw_cruza.accepttext()


if isnull(dw_cruza.GetItemNumber(1,'id_padre'))then
	messagebox('Aviso','Debe indicar el padre.')
	return 0
end if

if isnull(dw_cruza.GetItemNumber(1,'id_madre')) then
	messagebox('Aviso','Debe indicar la madre.')
	return 0
end if

if isnull(dw_cruza.GetItemString(1,'prov_descripcion')) or dw_cruza.GetItemString(1,'prov_descripcion') = '' then
	messagebox('Aviso','Debe indicar el proveedor.')
	return 0
end if

if isnull(dw_cruza.GetItemString(1,'prov_abreviacion')) or dw_cruza.GetItemString(1,'prov_abreviacion') = '' then
	messagebox('Aviso','Debe indicar el proveedor.')
	return 0
end if

if isnull(dw_cruza.GetItemDateTime(1,'fecha_cruza')) then
	messagebox('Aviso','Debe indicar la fecha de cruza.')
	return 0
end if

if dw_cruza.GetItemNumber(1,'crias') > 0 then
	if isnull(dw_cruza.GetItemDateTime(1,'fecha_nacimiento')) then
		messagebox('Aviso','Debe indicar la fecha de nacimiento.')
		return 0
	end if
end if

return 1
end function

public subroutine uf_alta_crias ();integer li_i =1
long li_cria
li_cria = uf_next_id_cria()

if dw_alta_crias.accepttext()=1 then
	for li_i = 1 to ii_crias
		dw_alta_crias.insertrow(0)
		dw_alta_crias.SetItem(li_i,'id_cria',li_cria)
		dw_alta_crias.SetItem(li_i,'cvetipo',istr_animales_padre.cvetipo)
		dw_alta_crias.SetItem(li_i,'prov_descripcion',dw_cruza.GetItemString(1,'prov_descripcion'))
		dw_alta_crias.SetItem(li_i,'prov_abreviacion',dw_cruza.GetItemString(1,'prov_abreviacion'))
		dw_alta_crias.SetItem(li_i,'fecha_nacimiento',dw_cruza.GetItemDateTime(1,'fecha_nacimiento'))
		dw_alta_crias.SetItem(li_i,'fecha_llegada',dw_cruza.GetItemDateTime(1,'fecha_nacimiento'))
		dw_alta_crias.SetItem(li_i,'id_cruza',il_cruza)
		dw_alta_crias.SetItem(li_i,'borrado',0)
		li_cria = li_cria + 1
	next

	if dw_alta_crias.update()>0 then 
		commit using gtr_sumuia;
	end if
end if
end subroutine

public function long uf_next_id_cria ();long ll_cria

select isnull(max(id_cria),0) +1
into :ll_cria
from dbo.spre_animales_catalogo
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener máxima Cría", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return -1
else
	commit using gtr_sumuia;	
end if
	
return(ll_cria)
end function

on w_psi_animales_edita_cruza.create
this.dw_crias=create dw_crias
this.dw_alta_crias=create dw_alta_crias
this.cb_eliminar=create cb_eliminar
this.cb_guardar=create cb_guardar
this.dw_cruza=create dw_cruza
this.gb_cruza=create gb_cruza
this.gb_crias=create gb_crias
this.Control[]={this.dw_crias,&
this.dw_alta_crias,&
this.cb_eliminar,&
this.cb_guardar,&
this.dw_cruza,&
this.gb_cruza,&
this.gb_crias}
end on

on w_psi_animales_edita_cruza.destroy
destroy(this.dw_crias)
destroy(this.dw_alta_crias)
destroy(this.cb_eliminar)
destroy(this.cb_guardar)
destroy(this.dw_cruza)
destroy(this.gb_cruza)
destroy(this.gb_crias)
end on

event open;integer li_i
il_cruza = message.DoubleParm

dw_cruza.setTransObject(gtr_sumuia)
dw_cruza.Retrieve(il_cruza)

if dw_cruza.RowCount() = 0 then
	if dw_cruza.accepttext()=1 then
		dw_cruza.insertrow(0)
		dw_cruza.setcolumn(1)
		dw_cruza.SetItem(1,'crias',0)
		dw_cruza.SetItem(1,'borrado',0)
	end if
end if

ii_crias = dw_cruza.GetItemNumber(1,'crias')

dw_alta_crias.setTransObject(gtr_sumuia)

dw_crias.setTransObject(gtr_sumuia)
dw_crias.Retrieve(il_cruza)

if dw_crias.RowCount() = 0 then this.width = 2520

end event

event close;CloseWithReturn(w_psi_animales_edita_cruza,ii_guardado)

end event

type dw_crias from datawindow within w_psi_animales_edita_cruza
integer x = 2538
integer y = 86
integer width = 2143
integer height = 960
integer taborder = 20
string title = "none"
string dataobject = "d_psi_animales_con_crias"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long ll_cria
integer li_actualiza

if row > 0 then
	ll_cria = this.GetItemNumber(row,'id_cria')

	openwithparm(w_psi_animales_edita_cria,ll_cria)
	li_actualiza=Message.DoubleParm
	if li_actualiza = 1 then 
		this.Retrieve(il_cruza)
		dw_cruza.Retrieve(il_cruza)
	end if
end if






end event

type dw_alta_crias from datawindow within w_psi_animales_edita_cruza
boolean visible = false
integer x = 110
integer y = 1187
integer width = 117
integer height = 51
integer taborder = 20
string title = "none"
string dataobject = "d_psi_animales_edita_cria"
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_proveedor = '', ls_abreviacion = ''
integer li_cambio_padres = 0

if dw_cruza.GetItemNumber(1,'crias') = 0 then
	if dwo.Name='p_buscar_proveedor' then 
		openwithparm(w_psi_animales_proveedores,istr_animales_proveedor)
		if isvalid(Message.PowerObjectParm) then
			istr_animales_proveedor = message.powerobjectparm
			dw_cruza.SetItem(1,'prov_descripcion',istr_animales_proveedor.nombre)
			dw_cruza.SetItem(1,'prov_abreviacion',istr_animales_proveedor.abreviacion)
		end if
	end if
	
	if dwo.Name='p_buscar_padre' then 
		istr_animales_padre.sexo = 'M'
		openwithparm(w_psi_animales_crias,istr_animales_padre)
		if isvalid(Message.PowerObjectParm) then
			istr_animales_padre = message.powerobjectparm
			dw_cruza.SetItem(1,'id_padre',istr_animales_padre.id_cria)
			dw_cruza.SetItem(1,'nombre_padre',istr_animales_padre.nombre)
			dw_cruza.SetItem(1,'proveedor_padre',istr_animales_padre.proveedor)
			ls_proveedor = istr_animales_padre.proveedor + ' / ' + istr_animales_madre.proveedor
			ls_abreviacion = istr_animales_padre.abreviacion + ' / ' + istr_animales_madre.abreviacion
			li_cambio_padres = 1
		end if
	end if
	
	if dwo.Name='p_buscar_madre' then 
		istr_animales_madre.sexo = 'H'
		openwithparm(w_psi_animales_crias,istr_animales_madre)
		if isvalid(Message.PowerObjectParm) then
			istr_animales_madre = message.powerobjectparm
			dw_cruza.SetItem(1,'id_madre',istr_animales_madre.id_cria)
			dw_cruza.SetItem(1,'nombre_madre',istr_animales_madre.nombre)
			dw_cruza.SetItem(1,'proveedor_madre',istr_animales_madre.proveedor)
			ls_proveedor = istr_animales_padre.proveedor + ' / ' + istr_animales_madre.proveedor
			ls_abreviacion = istr_animales_padre.abreviacion + ' / ' + istr_animales_madre.abreviacion
			li_cambio_padres = 1
		end if
	end if
end if

if li_cambio_padres = 1 then
	dw_cruza.SetItem(1,'prov_descripcion',ls_proveedor)
	dw_cruza.SetItem(1,'prov_abreviacion',ls_abreviacion)
end if
end event

type cb_eliminar from commandbutton within w_psi_animales_edita_cruza
integer x = 1759
integer y = 1133
integer width = 325
integer height = 93
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Eliminar"
end type

event clicked;integer NET
long ll_cruza
	
if dw_cruza.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea eliminar la cruza?', Question!, yesno!, 2)
	if Net = 1 then 		

		if dw_cruza.GetItemNumber(1,'crias') > 0 then
			messagebox('Aviso','La cruza no puede se eliminada puesto que hay crías')
		else
			dw_cruza.SetItem(1,'borrado',1)
			
			if dw_cruza.update()>0 then
				commit using gtr_sumuia;
				messagebox("Mensaje del sistema","El registro ha sido eliminado.",exclamation!)
				ii_guardado = 1
				close(parent)
			else
				messagebox("Mensaje del sistema","El registro no pudo ser eliminado. "+gtr_sumuia.SQLErrText,stopsign!)
				rollback using gtr_sumuia;
			end if
		end if

	end if

end if
	
end event

type cb_guardar from commandbutton within w_psi_animales_edita_cruza
integer x = 2110
integer y = 1133
integer width = 325
integer height = 93
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Guardar"
end type

event clicked;integer NET, li_crias, li_alta = 0, li_i
	
if dw_cruza.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		if uf_verificar_datos() = 0 then goto salir
		
		if il_cruza = 0 then
			il_cruza=uf_next_id_cruza()
			dw_cruza.SetItem(1,'id_cruza',il_cruza)
		end if
	
		if dw_cruza.update()>0 then
			commit using gtr_sumuia;
			
			if ii_crias = 0 and dw_cruza.GetItemNumber(1,'crias') > 0 then
				//Alta crías
				ii_crias = dw_cruza.GetItemNumber(1,'crias')
				uf_alta_crias()
				li_alta = 1
			end if
			
			messagebox("Mensaje del sistema","El registro ha sido actualizado con éxito.",exclamation!)
			ii_guardado = 1
			if li_alta = 0 then 
				close(parent)
			else
				dw_crias.Retrieve(il_cruza)
				w_psi_animales_edita_cruza.width = 4762				
			end if
		else
			messagebox("Mensaje del sistema","El registro NO ha sido actualizado con éxito. "+gtr_sumuia.SQLErrText,stopsign!)
			rollback using gtr_sumuia;
		end if
	end if

end if
	
salir:
end event

type dw_cruza from datawindow within w_psi_animales_edita_cruza
integer x = 66
integer y = 86
integer width = 2366
integer height = 960
integer taborder = 10
string title = "none"
string dataobject = "d_psi_animales_edita_cruza"
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_proveedor = '', ls_abreviacion = ''
integer li_cambio_padres = 0

if dw_cruza.GetItemNumber(1,'crias') = 0 then
	if dwo.Name='p_buscar_proveedor' then 
		openwithparm(w_psi_animales_proveedores,istr_animales_proveedor)
		if isvalid(Message.PowerObjectParm) then
			istr_animales_proveedor = message.powerobjectparm
			ls_proveedor = istr_animales_proveedor.nombre
			ls_abreviacion = istr_animales_proveedor.abreviacion
			if ls_proveedor <> '' and ls_abreviacion <> '' then li_cambio_padres = 1
		end if
	end if
	
	if dwo.Name='p_buscar_padre' then 
		istr_animales_padre.sexo = 'M'
		openwithparm(w_psi_animales_crias,istr_animales_padre)
		if isvalid(Message.PowerObjectParm) then
			istr_animales_padre = message.powerobjectparm
			dw_cruza.SetItem(1,'id_padre',istr_animales_padre.id_cria)
			dw_cruza.SetItem(1,'nombre_padre',istr_animales_padre.nombre)
			dw_cruza.SetItem(1,'proveedor_padre',istr_animales_padre.proveedor)
			ls_proveedor = istr_animales_padre.proveedor + ' / ' + istr_animales_madre.proveedor
			ls_abreviacion = istr_animales_padre.abreviacion + ' / ' + istr_animales_madre.abreviacion
			li_cambio_padres = 1
		end if
	end if
	
	if dwo.Name='p_buscar_madre' then 
		istr_animales_madre.sexo = 'H'
		openwithparm(w_psi_animales_crias,istr_animales_madre)
		if isvalid(Message.PowerObjectParm) then
			istr_animales_madre = message.powerobjectparm
			dw_cruza.SetItem(1,'id_madre',istr_animales_madre.id_cria)
			dw_cruza.SetItem(1,'nombre_madre',istr_animales_madre.nombre)
			dw_cruza.SetItem(1,'proveedor_madre',istr_animales_madre.proveedor)
			ls_proveedor = istr_animales_padre.proveedor + ' / ' + istr_animales_madre.proveedor
			ls_abreviacion = istr_animales_padre.abreviacion + ' / ' + istr_animales_madre.abreviacion
			li_cambio_padres = 1
		end if
	end if
end if

if li_cambio_padres = 1 then
	dw_cruza.SetItem(1,'prov_descripcion',ls_proveedor)
	dw_cruza.SetItem(1,'prov_abreviacion',ls_abreviacion)
end if
end event

type gb_cruza from groupbox within w_psi_animales_edita_cruza
integer x = 37
integer y = 13
integer width = 2432
integer height = 1069
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = " "
end type

type gb_crias from groupbox within w_psi_animales_edita_cruza
integer x = 2512
integer y = 13
integer width = 2205
integer height = 1069
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Datos crías"
end type

