$PBExportHeader$w_modelo_cap.srw
$PBExportComments$Ventana base
forward
global type w_modelo_cap from w_main
end type
type dw_motivo from u_dw within w_modelo_cap
end type
type cb_actualiza from commandbutton within w_modelo_cap
end type
type cb_cerrar from commandbutton within w_modelo_cap
end type
type cb_eliminar from commandbutton within w_modelo_cap
end type
type cb_nuevo from commandbutton within w_modelo_cap
end type
type dw_cap from u_dw within w_modelo_cap
end type
end forward

global type w_modelo_cap from w_main
integer x = 0
integer y = 0
integer width = 3648
integer height = 1612
string title = "Inserta titulo"
long backcolor = 29534863
dw_motivo dw_motivo
cb_actualiza cb_actualiza
cb_cerrar cb_cerrar
cb_eliminar cb_eliminar
cb_nuevo cb_nuevo
dw_cap dw_cap
end type
global w_modelo_cap w_modelo_cap

event open;call super::open;x=0
y=0

dw_cap.setTransObject(gtr_sumuia)
end event

event closequery;call super::closequery;if dw_cap.modifiedcount()>0 then
	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
		cb_actualiza.triggerevent(clicked!)
	end if
end if	
if dw_cap.deletedcount()>0 then
	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
		cb_actualiza.triggerevent(clicked!)
	end if
end if	
end event

event activate;call super::activate;dw=dw_cap
nuevo=cb_nuevo
eliminar=cb_eliminar
actualizar=cb_actualiza
end event

on w_modelo_cap.create
int iCurrent
call super::create
this.dw_motivo=create dw_motivo
this.cb_actualiza=create cb_actualiza
this.cb_cerrar=create cb_cerrar
this.cb_eliminar=create cb_eliminar
this.cb_nuevo=create cb_nuevo
this.dw_cap=create dw_cap
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_motivo
this.Control[iCurrent+2]=this.cb_actualiza
this.Control[iCurrent+3]=this.cb_cerrar
this.Control[iCurrent+4]=this.cb_eliminar
this.Control[iCurrent+5]=this.cb_nuevo
this.Control[iCurrent+6]=this.dw_cap
end on

on w_modelo_cap.destroy
call super::destroy
destroy(this.dw_motivo)
destroy(this.cb_actualiza)
destroy(this.cb_cerrar)
destroy(this.cb_eliminar)
destroy(this.cb_nuevo)
destroy(this.dw_cap)
end on

type dw_motivo from u_dw within w_modelo_cap
boolean visible = false
integer x = 891
integer y = 1000
integer taborder = 40
end type

type cb_actualiza from commandbutton within w_modelo_cap
integer x = 1719
integer y = 1344
integer width = 361
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;if dw_cap.update()>0 then
	commit using gtr_sumuia;
	messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
else
	rollback using gtr_sumuia;
	messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito",stopsign!)
end if
end event

type cb_cerrar from commandbutton within w_modelo_cap
integer x = 2121
integer y = 1344
integer width = 361
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

type cb_eliminar from commandbutton within w_modelo_cap
integer x = 1317
integer y = 1344
integer width = 361
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;IF dw_cap.Rowcount() = 0 then return
IF dw_cap.deleterow(dw_cap.getrow())<>1 THEN
	messagebox("Mensaje del sistema","El registro NO ha sido eliminado")
	dw_cap.retrieve()
END IF
end event

type cb_nuevo from commandbutton within w_modelo_cap
integer x = 914
integer y = 1344
integer width = 361
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;long ll_nva_linea
dw_cap.setfocus()		
if dw_cap.accepttext()=1 then
	ll_nva_linea=dw_cap.insertrow(0)
	dw_cap.setcolumn(1)
	dw_cap.scrolltorow(ll_nva_linea)
end if

end event

type dw_cap from u_dw within w_modelo_cap
integer x = 32
integer y = 20
integer width = 3557
integer height = 1284
integer taborder = 10
boolean bringtotop = true
end type

event constructor;call super::constructor;this.setTransObject(gtr_sumuia)
this.ib_rmbmenu = FALSE
this.of_SetRowManager(TRUE)
this.of_SetSort(TRUE)
this.of_SetProperty(TRUE)
this.inv_sort.of_SetColumnHeader(TRUE)
end event

