$PBExportHeader$w_csal_salon_mobiliario.srw
forward
global type w_csal_salon_mobiliario from window
end type
type cb_guardar from commandbutton within w_csal_salon_mobiliario
end type
type cb_eliminar from commandbutton within w_csal_salon_mobiliario
end type
type cb_nuevo from commandbutton within w_csal_salon_mobiliario
end type
type dw_mobiliario from datawindow within w_csal_salon_mobiliario
end type
end forward

global type w_csal_salon_mobiliario from window
integer width = 4056
integer height = 1651
boolean titlebar = true
string title = "Equipo en salón"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_guardar cb_guardar
cb_eliminar cb_eliminar
cb_nuevo cb_nuevo
dw_mobiliario dw_mobiliario
end type
global w_csal_salon_mobiliario w_csal_salon_mobiliario

type variables
string is_salon
integer ii_consec


end variables

forward prototypes
public function integer f_ultimo_consec ()
end prototypes

public function integer f_ultimo_consec ();integer li_consec

select isnull(max(consec),0)+1
into :li_consec
from dbo.salon_mobiliario
where cve_salon =:is_salon
using gtr_escolar; 

if gtr_escolar.SQLCode = -1 then 
	messagebox("Error ESCOLAR: Obtener máximo mobiliario", gtr_escolar.SQLErrText)	
	rollback using gtr_escolar;
	return -1
else
	commit using gtr_escolar;	
end if


return(li_consec)
end function

on w_csal_salon_mobiliario.create
this.cb_guardar=create cb_guardar
this.cb_eliminar=create cb_eliminar
this.cb_nuevo=create cb_nuevo
this.dw_mobiliario=create dw_mobiliario
this.Control[]={this.cb_guardar,&
this.cb_eliminar,&
this.cb_nuevo,&
this.dw_mobiliario}
end on

on w_csal_salon_mobiliario.destroy
destroy(this.cb_guardar)
destroy(this.cb_eliminar)
destroy(this.cb_nuevo)
destroy(this.dw_mobiliario)
end on

event open;is_salon=message.stringparm

dw_mobiliario.settransobject(gtr_escolar)

dw_mobiliario.Retrieve(is_salon)
if dw_mobiliario.RowCount()>0 then dw_mobiliario.ScrollToRow(1)

end event

type cb_guardar from commandbutton within w_csal_salon_mobiliario
integer x = 3098
integer y = 1411
integer width = 432
integer height = 115
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar"
end type

event clicked;integer li_i, li_consec, NET
string ls_descripcion
	
if dw_mobiliario.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		li_consec=f_ultimo_consec()
	
		for li_i=1 to dw_mobiliario.RowCount()
			if dw_mobiliario.GetItemNumber(li_i,'activo')=-1 then  
				dw_mobiliario.SetItem(li_i,'consec',li_consec)
				dw_mobiliario.SetItem(li_i,'activo',1)
			end if
		next
	
		if dw_mobiliario.update()>0 then
			commit using gtr_escolar;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
		else
			rollback using gtr_escolar;
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
		end if
		
		cb_nuevo.enabled=true
	
	end if

end if
	
end event

type cb_eliminar from commandbutton within w_csal_salon_mobiliario
integer x = 3551
integer y = 1411
integer width = 432
integer height = 115
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

if dw_mobiliario.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		li_row=dw_mobiliario.getrow()
		
			//Eliminar
			update dbo.salon_mobiliario
			set activo=0
			where cve_salon=:is_salon and	consec=:ii_consec
			using gtr_escolar;
			
			if gtr_escolar.SQLCode = -1 then 
				messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
				rollback using gtr_escolar;
			else
				messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
				commit using gtr_escolar;	
			end if		
		
		dw_mobiliario.Retrieve(is_salon)
		if dw_mobiliario.RowCount()>0 then dw_mobiliario.ScrollToRow(1)		

	end if
	
end if
end event

type cb_nuevo from commandbutton within w_csal_salon_mobiliario
integer x = 2629
integer y = 1411
integer width = 432
integer height = 115
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

dw_mobiliario.setfocus()	

if dw_mobiliario.accepttext()=1 then
	ll_nva_linea=dw_mobiliario.insertrow(0)
	dw_mobiliario.setcolumn(1)
	dw_mobiliario.scrolltorow(ll_nva_linea)
end if

dw_mobiliario.setitem(dw_mobiliario.getrow(),'activo',-1)
dw_mobiliario.setitem(dw_mobiliario.getrow(),'cve_salon',is_salon)	

end event

type dw_mobiliario from datawindow within w_csal_salon_mobiliario
integer x = 59
integer y = 38
integer width = 3924
integer height = 1312
integer taborder = 10
string title = "none"
string dataobject = "d_csal_salon_mobiliario"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_consec=dw_mobiliario.GetItemNumber(currentrow,'consec')
end event

