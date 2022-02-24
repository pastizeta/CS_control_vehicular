$PBExportHeader$w_controls_cat_inventario.srw
$PBExportComments$Inventario Materiales comunicación
forward
global type w_controls_cat_inventario from w_modelo_cap
end type
type cb_nuevo_mat from commandbutton within w_controls_cat_inventario
end type
type cb_eliminar_mat from commandbutton within w_controls_cat_inventario
end type
type dw_inv from datawindow within w_controls_cat_inventario
end type
type rb_1 from radiobutton within w_controls_cat_inventario
end type
type rb_2 from radiobutton within w_controls_cat_inventario
end type
type gb_1 from groupbox within w_controls_cat_inventario
end type
type ln_1 from line within w_controls_cat_inventario
end type
type ln_2 from line within w_controls_cat_inventario
end type
end forward

global type w_controls_cat_inventario from w_modelo_cap
integer width = 3703
integer height = 2348
string title = "Inventario de materiales"
cb_nuevo_mat cb_nuevo_mat
cb_eliminar_mat cb_eliminar_mat
dw_inv dw_inv
rb_1 rb_1
rb_2 rb_2
gb_1 gb_1
ln_1 ln_1
ln_2 ln_2
end type
global w_controls_cat_inventario w_controls_cat_inventario

type variables
integer ii_gpo_mat
string is_cve_mat, is_des_mat
end variables

on w_controls_cat_inventario.create
int iCurrent
call super::create
this.cb_nuevo_mat=create cb_nuevo_mat
this.cb_eliminar_mat=create cb_eliminar_mat
this.dw_inv=create dw_inv
this.rb_1=create rb_1
this.rb_2=create rb_2
this.gb_1=create gb_1
this.ln_1=create ln_1
this.ln_2=create ln_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_nuevo_mat
this.Control[iCurrent+2]=this.cb_eliminar_mat
this.Control[iCurrent+3]=this.dw_inv
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.ln_1
this.Control[iCurrent+8]=this.ln_2
end on

on w_controls_cat_inventario.destroy
call super::destroy
destroy(this.cb_nuevo_mat)
destroy(this.cb_eliminar_mat)
destroy(this.dw_inv)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.gb_1)
destroy(this.ln_1)
destroy(this.ln_2)
end on

event open;call super::open;string DWfilter2
str_baja_mat recibo_mat
dw_cap.retrieve(gi_depto,gi_area)
recibo_mat=Message.PowerObjectParm	
IF IsValid(recibo_mat) then
if not IsNull(recibo_mat.lscvemat) then is_cve_mat=recibo_mat.lscvemat 
if not IsNull(recibo_mat.licvegrupo) then ii_gpo_mat = recibo_mat.licvegrupo 
else
	is_cve_mat = ''
end if

	
	if is_cve_mat<>'' then
		DWfilter2 = "cvematerial = '"+ is_cve_mat +"' and cvegrupo =" +string(ii_gpo_mat)
		dw_cap.SetFilter(DWfilter2)
		dw_cap.Filter( )
		
		rb_1.checked = true
		IF dw_inv.Retrieve(gi_depto,gi_area,is_cve_mat,ii_gpo_mat) = -1 THEN
		MessageBox("Error","Se encontro un error al consultar los datos")
	ELSE
		dw_inv.SetFocus( )
		
	END IF

	else
		DWfilter2 = "cvematerial <> ''"
		dw_cap.SetFilter(DWfilter2)
		dw_cap.Filter( )
		rb_2.checked = true
	end if
dw_cap.scrolltorow(dw_cap.RowCount())

datawindowchild	ldwch
	dw_cap.GetChild('cvegrupo',ldwch)
	ldwch.SetFilter('cvearea='+string(gi_area))
	ldwch.Filter()
end event

event closequery;call super::closequery;if dw_inv.modifiedcount()>0 then
	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
		cb_actualiza.triggerevent(clicked!)
	end if
end if	
if dw_inv.deletedcount()>0 then
	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
		cb_actualiza.triggerevent(clicked!)
	end if
end if	


end event

type dw_motivo from w_modelo_cap`dw_motivo within w_controls_cat_inventario
integer x = 2633
integer y = 1304
integer width = 302
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_controls_cat_inventario
integer x = 2638
integer y = 1768
integer width = 297
integer textsize = -9
string facename = "Tahoma"
end type

event cb_actualiza::clicked;//Realiza Overide
if dw_cap.update()>0 then
	if dw_inv.update()>0 then
		commit using gtr_sumuia;
		messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
	else
		rollback using gtr_sumuia;
		messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito",stopsign!)
	end if
else
		rollback using gtr_sumuia;
		messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito",stopsign!)
	end if
end event

type cb_cerrar from w_modelo_cap`cb_cerrar within w_controls_cat_inventario
integer x = 2638
integer y = 1920
integer width = 297
integer textsize = -9
string facename = "Tahoma"
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_controls_cat_inventario
integer x = 3182
integer y = 872
integer width = 297
integer textsize = -9
string facename = "Tahoma"
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_controls_cat_inventario
integer x = 3182
integer y = 744
integer width = 297
integer textsize = -9
string facename = "Tahoma"
end type

event cb_nuevo::clicked;call super::clicked;dw_cap.setitem(dw_cap.getrow(),'cvedepto',gi_depto)
dw_cap.setitem(dw_cap.getrow(),'cvearea',gi_area)
	

end event

type dw_cap from w_modelo_cap`dw_cap within w_controls_cat_inventario
integer x = 37
integer y = 40
integer width = 3099
integer height = 944
string dataobject = "d_controls_tipo_materiales"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_cap::itemfocuschanged;//Realiza override


string lsCveMat
if row >0 then
	lsCveMat = dw_cap.getitemstring(  row, 'cvematerial')	
	ii_gpo_mat = dw_cap.getitemnumber(  row, 'cvegrupo')
	IF dw_inv.Retrieve(gi_depto,gi_area,lsCveMat,ii_gpo_mat) = -1 THEN
		MessageBox("Error","Se encontro un error al consultar los datos")
	ELSE
		dw_inv.SetFocus( )
		is_cve_mat =lsCveMat
		is_des_mat = dw_cap.getitemstring(  row, 'descripcion')	
		ii_gpo_mat = dw_cap.getitemnumber(  row, 'cvegrupo')	
	END IF

end if
end event

event dw_cap::constructor;call super::constructor;this.getchild('cvegrupo',gruposdepto)
gruposdepto.setTransObject(gtr_sumuia)
gruposdepto.Retrieve(gi_depto)
end event

type cb_nuevo_mat from commandbutton within w_controls_cat_inventario
integer x = 2638
integer y = 1308
integer width = 297
integer height = 108
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Agregar"
end type

event clicked;long ll_nva_linea
dw_inv.setfocus()		
if dw_inv.accepttext()=1 then
	ll_nva_linea=dw_inv.insertrow(0)
	dw_inv.setcolumn(1)
	dw_inv.scrolltorow(ll_nva_linea)
	dw_inv.setitem(dw_inv.getrow(),'spre_inventario_cvedepto',gi_depto)
	dw_inv.setitem(dw_inv.getrow(),'spre_inventario_cvearea',gi_area)
	dw_inv.setitem(dw_inv.getrow(),'spre_inventario_cvematerial',is_cve_mat)
	dw_inv.setitem(dw_inv.getrow(),'spre_inventario_cvegrupo',ii_gpo_mat)	
	dw_inv.setitem(dw_inv.getrow(),'spre_inventario_stauts',1)
	dw_inv.setitem(dw_inv.getrow(),'spre_inventario_tiempo_prestamo',0)
end if
end event

type cb_eliminar_mat from commandbutton within w_controls_cat_inventario
integer x = 2638
integer y = 1436
integer width = 297
integer height = 108
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Borrar"
end type

event clicked;//integer li_resp
//li_resp=messagebox("Mensaje del sistema","Desea Borrar el registro",Exclamation!,YesNo!,2)
//IF li_resp = 1 THEN
  IF dw_inv.deleterow(dw_inv.getrow())<>1 THEN
		messagebox("Mensaje del sistema","El registro NO ha sido eliminado")
		dw_inv.retrieve()
  END IF	 
//END IF  
end event

type dw_inv from datawindow within w_controls_cat_inventario
integer x = 37
integer y = 1052
integer width = 2313
integer height = 1160
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_controls_inventario"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

event itemchanged;string columna, lsMatSeleccionado, lsNoSerieMaterial
integer li_cve =0 , li_rowc, lirow

str_baja_mat envio_mat
columna = 	dwo.name


choose case columna
	case "spre_inventario_stauts" 
		li_cve =integer(data)
		lsMatSeleccionado = dw_inv.getitemstring(row,'spre_inventario_cvematerial')
		lsNoSerieMaterial = dw_inv.getitemstring(row,'spre_inventario_num_serie')
		envio_mat.lscvemat = lsMatSeleccionado
		envio_mat.lsnoserie =lsNoSerieMaterial
		envio_mat.lsdesmat =is_des_mat
		choose case li_cve
			case 0
				OpenSheetWithParm(w_psi_baja_mat, envio_mat , w_ppal, 2, Original!)
		end choose	
end choose
end event

event doubleclicked;string columna, numserie
long cuenta
integer li_param=0 ,li_cve_mat,li_tipo, li_grupo
datetime ld_date
string ls_paquete


n_transportar uo_parametros 

columna = 	dwo.name
this.accepttext()

	CHOOSE CASE columna 
		case "spre_inventario_cod_uia"
			uo_parametros.is_parmcoduia 	= this.GetItemString(row,'spre_inventario_cod_uia')
			ls_paquete	= this.GetItemString(row,'spre_inventario_cod_uia')
			uo_parametros.ii_parmgrupo	= this.GetItemNumber(row,'spre_inventario_cvegrupo')
			uo_parametros.is_parmserien 	= this.GetItemString(row,'spre_inventario_num_serie')
			uo_parametros.is_parmcvemat = this.GetItemString(row,'spre_inventario_cvematerial')
						
			if isnull(ls_paquete) then
				messagebox("Aviso del Sistema","El material seleccionado, No cuenta con codigo de  paquete para asignar información")
			else
				OpenWithParm(w_controls_paquetes,uo_parametros)
			end if
	END CHOOSE
end event

type rb_1 from radiobutton within w_controls_cat_inventario
integer x = 3182
integer y = 112
integer width = 439
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Seleccionado"
end type

event clicked;string DWfilter2

	if is_cve_mat<>'' then
		
		DWfilter2 = "cvematerial = '"+ is_cve_mat +"' and cvegrupo =" +string(ii_gpo_mat)
		dw_cap.SetFilter(DWfilter2)
		dw_cap.Filter( )
	else
		DWfilter2 = "cvematerial <> ''"
		dw_cap.SetFilter(DWfilter2)
		dw_cap.Filter( )
	end if

end event

type rb_2 from radiobutton within w_controls_cat_inventario
integer x = 3182
integer y = 228
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Todos"
end type

event clicked;string null_str

null_str ="cvematerial <> ''"

dw_cap.SetFilter(null_str)

dw_cap.Filter()
end event

type gb_1 from groupbox within w_controls_cat_inventario
integer x = 3168
integer y = 32
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "Ver material"
end type

type ln_1 from line within w_controls_cat_inventario
long linecolor = 12632256
integer linethickness = 2
integer beginx = 41
integer beginy = 1004
integer endx = 3529
integer endy = 1004
end type

type ln_2 from line within w_controls_cat_inventario
long linecolor = 16777215
integer linethickness = 1
integer beginx = 41
integer beginy = 1008
integer endx = 3625
integer endy = 1008
end type

