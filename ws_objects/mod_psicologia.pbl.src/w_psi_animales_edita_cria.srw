$PBExportHeader$w_psi_animales_edita_cria.srw
forward
global type w_psi_animales_edita_cria from window
end type
type st_cruzas from statictext within w_psi_animales_edita_cria
end type
type dw_cruzas from datawindow within w_psi_animales_edita_cria
end type
type st_padres from statictext within w_psi_animales_edita_cria
end type
type dw_padres from datawindow within w_psi_animales_edita_cria
end type
type cb_eliminar from commandbutton within w_psi_animales_edita_cria
end type
type cb_guardar from commandbutton within w_psi_animales_edita_cria
end type
type dw_cria from datawindow within w_psi_animales_edita_cria
end type
type gb_cria from groupbox within w_psi_animales_edita_cria
end type
type gb_padres from groupbox within w_psi_animales_edita_cria
end type
type gb_cruzas from groupbox within w_psi_animales_edita_cria
end type
end forward

global type w_psi_animales_edita_cria from window
integer width = 5226
integer height = 1462
boolean titlebar = true
string title = "Alta/Edición cría"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
st_cruzas st_cruzas
dw_cruzas dw_cruzas
st_padres st_padres
dw_padres dw_padres
cb_eliminar cb_eliminar
cb_guardar cb_guardar
dw_cria dw_cria
gb_cria gb_cria
gb_padres gb_padres
gb_cruzas gb_cruzas
end type
global w_psi_animales_edita_cria w_psi_animales_edita_cria

type variables
long il_cria=0
integer ii_guardado = 0

str_sol_material istr_sol_material, pstr_sol_material




end variables

forward prototypes
public function integer uf_verificar_datos ()
public function long uf_next_id_cria ()
end prototypes

public function integer uf_verificar_datos ();dw_cria.accepttext()

if isnull(dw_cria.GetItemNumber(1,'cvetipo')) then
	messagebox('Aviso','Debe indicar el tipo de animal.')
	return 0
end if

if isnull(dw_cria.GetItemString(1,'nombre')) or dw_cria.GetItemString(1,'nombre') = '' then
	messagebox('Aviso','Debe indicar el nombre.')
	return 0
end if

if isnull(dw_cria.GetItemString(1,'prov_descripcion')) or dw_cria.GetItemString(1,'prov_descripcion') = '' then
	messagebox('Aviso','Debe indicar el proveedor.')
	return 0
end if

if isnull(dw_cria.GetItemString(1,'prov_abreviacion')) or dw_cria.GetItemString(1,'prov_abreviacion') = '' then
	messagebox('Aviso','Debe indicar el proveedor.')
	return 0
end if

if isnull(dw_cria.GetItemDateTime(1,'fecha_nacimiento')) then
	messagebox('Aviso','Debe indicar la fecha de nacimiento.')
	return 0
end if

if isnull(dw_cria.GetItemDateTime(1,'fecha_llegada')) then
	messagebox('Aviso','Debe indicar la fecha de llegada.')
	return 0
end if

if isnull(dw_cria.GetItemString(1,'sexo')) or dw_cria.GetItemString(1,'sexo') = '' then
	messagebox('Aviso','Debe indicar el sexo.')
	return 0
end if

if isnull(dw_cria.GetItemNumber(1,'cvetipo')) then
	messagebox('Aviso','Debe indicar el tipo de animal.')
	return 0
end if

return 1
end function

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

on w_psi_animales_edita_cria.create
this.st_cruzas=create st_cruzas
this.dw_cruzas=create dw_cruzas
this.st_padres=create st_padres
this.dw_padres=create dw_padres
this.cb_eliminar=create cb_eliminar
this.cb_guardar=create cb_guardar
this.dw_cria=create dw_cria
this.gb_cria=create gb_cria
this.gb_padres=create gb_padres
this.gb_cruzas=create gb_cruzas
this.Control[]={this.st_cruzas,&
this.dw_cruzas,&
this.st_padres,&
this.dw_padres,&
this.cb_eliminar,&
this.cb_guardar,&
this.dw_cria,&
this.gb_cria,&
this.gb_padres,&
this.gb_cruzas}
end on

on w_psi_animales_edita_cria.destroy
destroy(this.st_cruzas)
destroy(this.dw_cruzas)
destroy(this.st_padres)
destroy(this.dw_padres)
destroy(this.cb_eliminar)
destroy(this.cb_guardar)
destroy(this.dw_cria)
destroy(this.gb_cria)
destroy(this.gb_padres)
destroy(this.gb_cruzas)
end on

event open;il_cria = message.DoubleParm

dw_cria.setTransObject(gtr_sumuia)
dw_cria.Retrieve(il_cria)

if dw_cria.RowCount() = 0 then
	if dw_cria.accepttext()=1 then
		dw_cria.insertrow(0)
		dw_cria.setcolumn(1)
		dw_cria.SetItem(1,'cruzado',0)
		dw_cria.SetItem(1,'id_cruza',0)
		dw_cria.SetItem(1,'borrado',0)
	end if
end if

dw_padres.setTransObject(gtr_sumuia)
dw_padres.Retrieve(dw_cria.GetItemNumber(1,'id_cruza'))
if dw_padres.RowCount()=0 then st_padres.visible = true else st_padres.visible = false

dw_cruzas.setTransObject(gtr_sumuia)
dw_cruzas.Retrieve(il_cria)
if dw_cruzas.RowCount()=0 then
	dw_cruzas.visible = false
	st_cruzas.visible = true 
else 
	st_cruzas.visible = false
end if

if dw_padres.RowCount() = 0 and dw_cruzas.RowCount() = 0 then this.width = 2420
end event

event close;CloseWithReturn(w_psi_animales_edita_cria,ii_guardado)



end event

type st_cruzas from statictext within w_psi_animales_edita_cria
integer x = 3460
integer y = 1037
integer width = 753
integer height = 61
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 30520472
string text = "Sin cruzas"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_cruzas from datawindow within w_psi_animales_edita_cria
integer x = 2428
integer y = 771
integer width = 2710
integer height = 570
integer taborder = 20
string title = "none"
string dataobject = "d_psi_animales_con_cruzas"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;integer li_actualiza
long ll_cruza

if row > 0 then
	ll_cruza = this.GetItemNumber(row,'id_cruza')
	openwithparm(w_psi_animales_edita_cruza,ll_cruza)
	li_actualiza=Message.DoubleParm
	if li_actualiza = 1 then 
		this.Retrieve(ll_cruza)
		dw_cria.Retrieve(il_cria)
	end if
end if
end event

type st_padres from statictext within w_psi_animales_edita_cria
integer x = 3460
integer y = 365
integer width = 753
integer height = 58
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 31182271
string text = "Origen desconocido"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_padres from datawindow within w_psi_animales_edita_cria
integer x = 2428
integer y = 83
integer width = 2710
integer height = 570
integer taborder = 20
string title = "none"
string dataobject = "d_psi_animales_con_padres"
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;integer li_actualiza
long ll_cruza

ll_cruza = dw_cria.GetItemNumber(1,'id_cruza')

if ll_cruza > 0 then
	openwithparm(w_psi_animales_edita_cruza,ll_cruza)
	li_actualiza=Message.DoubleParm
	if li_actualiza = 1 then dw_padres.Retrieve(ll_cruza)
end if

end event

type cb_eliminar from commandbutton within w_psi_animales_edita_cria
integer x = 1660
integer y = 1258
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
long ll_cria
	
if dw_cria.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea eliminar el animal?', Question!, yesno!, 2)
	if Net = 1 then 		

		if dw_cria.GetItemNumber(1,'cruzado') > 0 then
			messagebox('Aviso','El animal no puede ser eliminado puesto que ya fue cruzado')
		else
			dw_cria.SetItem(1,'borrado',1)
			
			if dw_cria.update()>0 then
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

type cb_guardar from commandbutton within w_psi_animales_edita_cria
integer x = 2015
integer y = 1258
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

event clicked;integer NET
long ll_cria
	
if dw_cria.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then

		if uf_verificar_datos() = 0 then goto salir
		
		if il_cria = 0 then
			ll_cria=uf_next_id_cria()
			dw_cria.SetItem(1,'id_cria',ll_cria)
		end if

		if dw_cria.update()>0 then
			commit using gtr_sumuia;
			messagebox("Mensaje del sistema","El registro ha sido actualizado.",exclamation!)
			ii_guardado = 1
			close(parent)
		else
			messagebox("Mensaje del sistema","El registro no ha sido actualizado. "+gtr_sumuia.SQLErrText,stopsign!)
			rollback using gtr_sumuia;
		end if
	end if

end if

salir:
end event

type dw_cria from datawindow within w_psi_animales_edita_cria
integer x = 62
integer y = 83
integer width = 2275
integer height = 928
integer taborder = 10
string title = "none"
string dataobject = "d_psi_animales_edita_cria"
borderstyle borderstyle = stylelowered!
end type

event clicked;str_animales_proveedores lstr_animales_proveedor

if dw_cria.GetItemNumber(1,'cruzado') = 0 then
	if dwo.Name='p_buscar_proveedor' then 
		openwithparm(w_psi_animales_proveedores,lstr_animales_proveedor)
		if isvalid(Message.PowerObjectParm) then
			lstr_animales_proveedor = message.powerobjectparm
			if lstr_animales_proveedor.nombre <> '' then
				dw_cria.SetItem(1,'prov_descripcion',lstr_animales_proveedor.nombre)
				dw_cria.SetItem(1,'prov_abreviacion',lstr_animales_proveedor.abreviacion)
			end if
		end if
	end if
end if


end event

type gb_cria from groupbox within w_psi_animales_edita_cria
integer x = 37
integer y = 13
integer width = 2337
integer height = 1037
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Datos cría"
end type

type gb_padres from groupbox within w_psi_animales_edita_cria
integer x = 2403
integer y = 16
integer width = 2772
integer height = 662
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Datos origen"
end type

type gb_cruzas from groupbox within w_psi_animales_edita_cria
integer x = 2403
integer y = 698
integer width = 2779
integer height = 672
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Datos cruzas"
end type

