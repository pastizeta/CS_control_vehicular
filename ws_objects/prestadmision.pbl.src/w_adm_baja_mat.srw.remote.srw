$PBExportHeader$w_adm_baja_mat.srw.remote.srw
$PBExportComments$Ventana utilizada para capturar la baja del material
forward
global type w_adm_baja_mat from window
end type
type cb_3 from commandbutton within w_adm_baja_mat
end type
type dw_baja_mat from datawindow within w_adm_baja_mat
end type
type cb_2 from commandbutton within w_adm_baja_mat
end type
type cb_1 from commandbutton within w_adm_baja_mat
end type
end forward

global type w_adm_baja_mat from window
integer width = 2240
integer height = 1380
boolean titlebar = true
string title = "Detalle baja material"
boolean controlmenu = true
long backcolor = 29534863
cb_3 cb_3
dw_baja_mat dw_baja_mat
cb_2 cb_2
cb_1 cb_1
end type
global w_adm_baja_mat w_adm_baja_mat

on w_adm_baja_mat.create
this.cb_3=create cb_3
this.dw_baja_mat=create dw_baja_mat
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.dw_baja_mat,&
this.cb_2,&
this.cb_1}
end on

on w_adm_baja_mat.destroy
destroy(this.cb_3)
destroy(this.dw_baja_mat)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;long ll_nva_linea,ll_numreg
str_baja_mat recibo_mat
string lsCveMat, lsNoSerie, lsDescMat
recibo_mat = Message.PowerObjectParm	

lsCveMat = recibo_mat.lscvemat
lsNoSerie =  recibo_mat.lsnoserie
lsDescMat =  recibo_mat.lsdesmat
if dw_baja_mat.retrieve(gi_depto,gi_area,lsCveMat, lsNoSerie) = 0 then
	dw_baja_mat.insertRow(0)
	ll_nva_linea=dw_baja_mat.insertrow(0)
	dw_baja_mat.setcolumn(1)
	dw_baja_mat.scrolltorow(ll_nva_linea)
	Select max(folio_baja)
	into :ll_numreg
	from spre_materiales_bajas
	using gtr_sumuia;
			
	if isnull(ll_numreg) then 
		ll_numreg=0
		ll_numreg= ll_numreg+1
	else
		ll_numreg= ll_numreg+1
	end if	
	
	dw_baja_mat.setitem(dw_baja_mat.getrow(),'folio_baja',ll_numreg)	
	dw_baja_mat.setitem(dw_baja_mat.getrow(),'cvedepto',gi_depto)
	dw_baja_mat.setitem(dw_baja_mat.getrow(),'cvearea',gi_area)
	dw_baja_mat.setitem(dw_baja_mat.getrow(),'cvematerial',lsCveMat)
	dw_baja_mat.setitem(dw_baja_mat.getrow(),'num_serie',lsNoSerie)
	dw_baja_mat.setitem(dw_baja_mat.getrow(),'spre_materiales_descripcion',lsDescMat)
else
	
end if
end event

type cb_3 from commandbutton within w_adm_baja_mat
integer x = 649
integer y = 1048
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "alex"
end type

type dw_baja_mat from datawindow within w_adm_baja_mat
integer x = 37
integer y = 32
integer width = 2162
integer height = 1000
integer taborder = 10
string title = "none"
string dataobject = "d_admi_detallebaja_mat"
boolean border = false
boolean livescroll = true
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type cb_2 from commandbutton within w_adm_baja_mat
integer x = 1710
integer y = 1060
integer width = 297
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Salir"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_adm_baja_mat
integer x = 1253
integer y = 1060
integer width = 297
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar"
end type

event clicked;	if dw_baja_mat.update()>0 then
		commit using gtr_sumuia;
		messagebox("Mensaje del sistema","Los registros han sido actualizados con éxito",exclamation!)
	else
		rollback using gtr_sumuia;
		messagebox("Mensaje del sistema","Los registros NO han sido actualizados con éxito",stopsign!)
	end if
end event

