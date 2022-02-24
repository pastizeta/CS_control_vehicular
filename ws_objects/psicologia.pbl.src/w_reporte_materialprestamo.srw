$PBExportHeader$w_reporte_materialprestamo.srw
forward
global type w_reporte_materialprestamo from w_sheet
end type
type cb_4 from commandbutton within w_reporte_materialprestamo
end type
type em_clave from editmask within w_reporte_materialprestamo
end type
type em_inter from editmask within w_reporte_materialprestamo
end type
type cbx_clave from checkbox within w_reporte_materialprestamo
end type
type cbx_inter from checkbox within w_reporte_materialprestamo
end type
type cb_3 from commandbutton within w_reporte_materialprestamo
end type
type dw_depto from datawindow within w_reporte_materialprestamo
end type
type cb_2 from commandbutton within w_reporte_materialprestamo
end type
type cbx_bus from checkbox within w_reporte_materialprestamo
end type
type dw_busqueda from datawindow within w_reporte_materialprestamo
end type
type dw_fecha from datawindow within w_reporte_materialprestamo
end type
type dw_reporte from datawindow within w_reporte_materialprestamo
end type
type cb_1 from commandbutton within w_reporte_materialprestamo
end type
type cbx_material from checkbox within w_reporte_materialprestamo
end type
type st_1 from statictext within w_reporte_materialprestamo
end type
type em_fecha_fin from editmask within w_reporte_materialprestamo
end type
type cbx_fecha from checkbox within w_reporte_materialprestamo
end type
type cbx_cuenta from checkbox within w_reporte_materialprestamo
end type
type dw_desc from datawindow within w_reporte_materialprestamo
end type
type em_cuenta from editmask within w_reporte_materialprestamo
end type
type gb_1 from groupbox within w_reporte_materialprestamo
end type
type gb_2 from groupbox within w_reporte_materialprestamo
end type
type gb_4 from groupbox within w_reporte_materialprestamo
end type
type gb_3 from groupbox within w_reporte_materialprestamo
end type
type gb_5 from groupbox within w_reporte_materialprestamo
end type
end forward

global type w_reporte_materialprestamo from w_sheet
integer width = 4059
integer height = 2488
long backcolor = 29534863
cb_4 cb_4
em_clave em_clave
em_inter em_inter
cbx_clave cbx_clave
cbx_inter cbx_inter
cb_3 cb_3
dw_depto dw_depto
cb_2 cb_2
cbx_bus cbx_bus
dw_busqueda dw_busqueda
dw_fecha dw_fecha
dw_reporte dw_reporte
cb_1 cb_1
cbx_material cbx_material
st_1 st_1
em_fecha_fin em_fecha_fin
cbx_fecha cbx_fecha
cbx_cuenta cbx_cuenta
dw_desc dw_desc
em_cuenta em_cuenta
gb_1 gb_1
gb_2 gb_2
gb_4 gb_4
gb_3 gb_3
gb_5 gb_5
end type
global w_reporte_materialprestamo w_reporte_materialprestamo

type variables
boolean ib_selecciona
long il_fecha_ini, il_fecha_fin
datetime idtm_fecha
string is_departamento

long il_cuenta, il_cve

integer ii_tipop




end variables

on w_reporte_materialprestamo.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.em_clave=create em_clave
this.em_inter=create em_inter
this.cbx_clave=create cbx_clave
this.cbx_inter=create cbx_inter
this.cb_3=create cb_3
this.dw_depto=create dw_depto
this.cb_2=create cb_2
this.cbx_bus=create cbx_bus
this.dw_busqueda=create dw_busqueda
this.dw_fecha=create dw_fecha
this.dw_reporte=create dw_reporte
this.cb_1=create cb_1
this.cbx_material=create cbx_material
this.st_1=create st_1
this.em_fecha_fin=create em_fecha_fin
this.cbx_fecha=create cbx_fecha
this.cbx_cuenta=create cbx_cuenta
this.dw_desc=create dw_desc
this.em_cuenta=create em_cuenta
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.em_clave
this.Control[iCurrent+3]=this.em_inter
this.Control[iCurrent+4]=this.cbx_clave
this.Control[iCurrent+5]=this.cbx_inter
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.dw_depto
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cbx_bus
this.Control[iCurrent+10]=this.dw_busqueda
this.Control[iCurrent+11]=this.dw_fecha
this.Control[iCurrent+12]=this.dw_reporte
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cbx_material
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.em_fecha_fin
this.Control[iCurrent+17]=this.cbx_fecha
this.Control[iCurrent+18]=this.cbx_cuenta
this.Control[iCurrent+19]=this.dw_desc
this.Control[iCurrent+20]=this.em_cuenta
this.Control[iCurrent+21]=this.gb_1
this.Control[iCurrent+22]=this.gb_2
this.Control[iCurrent+23]=this.gb_4
this.Control[iCurrent+24]=this.gb_3
this.Control[iCurrent+25]=this.gb_5
end on

on w_reporte_materialprestamo.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.em_clave)
destroy(this.em_inter)
destroy(this.cbx_clave)
destroy(this.cbx_inter)
destroy(this.cb_3)
destroy(this.dw_depto)
destroy(this.cb_2)
destroy(this.cbx_bus)
destroy(this.dw_busqueda)
destroy(this.dw_fecha)
destroy(this.dw_reporte)
destroy(this.cb_1)
destroy(this.cbx_material)
destroy(this.st_1)
destroy(this.em_fecha_fin)
destroy(this.cbx_fecha)
destroy(this.cbx_cuenta)
destroy(this.dw_desc)
destroy(this.em_cuenta)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_5)
end on

event open;call super::open;integer li_row, li_i, li_depto

SetPointer(arrow!) 

cbx_bus.visible = false
dw_busqueda.visible = false
dw_desc.visible = false

cbx_cuenta.checked = true
em_cuenta.setfocus()
em_inter.enabled = false
em_clave.enabled = false
li_row = dw_fecha.retrieve()

For li_i =  1 to dw_fecha.rowcount()
	idtm_fecha = dw_fecha.object.fecha[li_i]
next

em_fecha_fin.text = string(datetime(idtm_fecha),"dd/mm/yyyy")




li_depto = dw_depto.retrieve(gi_depto)
if li_depto >= 1 then
	is_departamento = dw_depto.GetItemstring(1,'descripcion')
end if


end event

type cb_4 from commandbutton within w_reporte_materialprestamo
integer x = 2834
integer y = 840
integer width = 462
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Guardar a Excel"
end type

event clicked;dw_reporte.saveas() 
end event

type em_clave from editmask within w_reporte_materialprestamo
integer x = 2743
integer y = 208
integer width = 338
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!"
end type

type em_inter from editmask within w_reporte_materialprestamo
integer x = 2103
integer y = 208
integer width = 338
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!"
end type

type cbx_clave from checkbox within w_reporte_materialprestamo
integer x = 261
integer y = 344
integer width = 983
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "REPORTE POR CLAVE"
boolean lefttext = true
end type

event clicked;if this.checked then
	em_clave.enabled = true
	em_clave.setfocus()
	dw_desc.visible = false
	dw_busqueda.visible = false
	cbx_bus.visible = false
	cb_1.visible = true
	cbx_fecha.checked = false
	cbx_material.checked = false
	cbx_cuenta.checked = false
	cbx_inter.checked = false
	em_cuenta.text = ""
	em_inter.text = ""
	em_inter.enabled = false
	em_cuenta.enabled = false
	em_fecha_fin.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
	dw_reporte.dataobject = "d_rep_materialcta" 
	dw_reporte.SettransObject(gtr_sumuia)
end if
end event

type cbx_inter from checkbox within w_reporte_materialprestamo
integer x = 261
integer y = 276
integer width = 983
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "REPORTE POR ALUMNO INTERCAMBIO"
boolean lefttext = true
end type

event clicked;if this.checked then
	em_inter.enabled = true
	em_inter.setfocus()
	dw_desc.visible = false
	dw_busqueda.visible = false
	cbx_bus.visible = false
	cb_1.visible = true
	cbx_fecha.checked = false
	cbx_material.checked = false
	cbx_cuenta.checked = false
	cbx_clave.checked = false
	em_cuenta.enabled = false
	em_clave.enabled = false
	em_clave.text = ""
	em_cuenta.text = ""
	em_fecha_fin.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
	dw_reporte.dataobject = "d_rep_materialcta"
	dw_reporte.SettransObject(gtr_sumuia)
end if
end event

type cb_3 from commandbutton within w_reporte_materialprestamo
integer x = 3346
integer y = 716
integer width = 462
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Imprimir Reporte"
end type

event clicked;if dw_reporte.RowCount() > 0 then
//	dw_reporte.modify("Datawindow.print.preview = No")
	if messagebox("Impresión","¿Desea Imprimir el Reporte?",Question!,YesNO!,1) = 1 then
		dw_reporte.print()
	end if
//	SetPointer(HourGlass!)
end if
end event

type dw_depto from datawindow within w_reporte_materialprestamo
boolean visible = false
integer x = 827
integer y = 2236
integer width = 411
integer height = 36
integer taborder = 20
string title = "none"
string dataobject = "d_psi_departamento"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;Settransobject(gtr_sumuia)
end event

type cb_2 from commandbutton within w_reporte_materialprestamo
integer x = 3346
integer y = 840
integer width = 462
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

type cbx_bus from checkbox within w_reporte_materialprestamo
integer x = 1669
integer y = 400
integer width = 1042
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Busqueda de palabra intermedia  de material"
end type

type dw_busqueda from datawindow within w_reporte_materialprestamo
integer x = 187
integer y = 616
integer width = 2523
integer height = 320
integer taborder = 30
string title = "none"
string dataobject = "d_psi_descripcionmat"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(gtr_sumuia)
end event

event clicked;integer li_i, li_cont

if this.RowCount() > 0 then 
	if IsSelected(Row) then
		SelectRow(row,false)
		
	else
		SelectRow(row,true)
		
		dw_reporte.reset()

		long ll_reg
		integer li_row, liArea, liCvegrupo
		string  lsCvemat, lsDesc

		liArea = this.GetItemNumber(row,'cvearea')
		lsCvemat = this.GetItemstring(row,'cvematerial')
		liCvegrupo= this.GetItemNumber(row,'cvegrupo')
		lsDesc= this.GetItemstring(row,'descripcion')

		if liCvegrupo > 0 then
			li_row = dw_reporte.retrieve(lsDesc,gi_depto,liArea,lsCvemat,liCvegrupo)
			if li_row >= 1 then
				dw_reporte.object.t_depto.text = is_departamento
			else
				Messagebox("Aviso","No existe material prestado con este nombre")
				SelectRow(row,false)
			end if
		end if
		
	end if
end if




















//
//for li_i = 1 to rowcount() 
//	if IsSelected(li_i) then
//		ib_selecciona	= false
//		li_cont = li_cont + 1
//		if li_cont > 1 then
//			Messagebox("No procede","Deseleccione el material anterior, solo se permite seleccionar un material")	
//			
//			SelectRow(row,false)
//			dw_reporte.reset() 
//	
//			exit
//		end if
//	end if
//next		
end event

event doubleclicked;//
//dw_reporte.reset()
//
//long ll_reg
//integer li_row, liArea, liCvegrupo
//string  lsCvemat, lsDesc
//
//liArea = this.GetItemNumber(row,'cvearea')
//lsCvemat = this.GetItemstring(row,'cvematerial')
//liCvegrupo= this.GetItemNumber(row,'cvegrupo')
//lsDesc= this.GetItemstring(row,'descripcion')
//
//if liCvegrupo > 0 then
//	li_row = dw_reporte.retrieve(lsDesc,gi_depto,liArea,lsCvemat,liCvegrupo)
//	if li_row >= 1 then
//		dw_reporte.object.t_depto.text = is_departamento
//	else
//		Messagebox("Aviso","No existe material prestado con este nombre")
//		SelectRow(row,false)
//	end if
//end if
end event

type dw_fecha from datawindow within w_reporte_materialprestamo
boolean visible = false
integer x = 192
integer y = 2224
integer width = 411
integer height = 36
integer taborder = 30
string title = "none"
string dataobject = "d_fecha"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(gtr_sumuia)
end event

type dw_reporte from datawindow within w_reporte_materialprestamo
integer x = 178
integer y = 984
integer width = 3653
integer height = 1224
integer taborder = 40
string title = "none"
string dataobject = "d_rep_materialcta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(gtr_sumuia)
end event

type cb_1 from commandbutton within w_reporte_materialprestamo
integer x = 2834
integer y = 716
integer width = 462
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Generar Reporte"
end type

event clicked;string	ls_fecha_string 
integer	liCta, li_depto, li_row
long 		ll_clave
date       ld_Fecha

setpointer(hourglass!)

//		Alumno
if cbx_cuenta.checked Then
	if il_cuenta > 0 then
		li_row = dw_reporte.retrieve(il_cuenta,1,gi_depto)
		if li_row >= 1 then
			dw_reporte.object.t_depto.text = is_departamento
		else
			Messagebox("Aviso","El alumno no cuenta con prestamo de material")
			em_cuenta.text = ""
			em_cuenta.setfocus()
		end if
	else
		Messagebox("Error","Debe indicar Cuenta del alumno")
	end if
//		Alumno Intercambio
elseif cbx_inter.checked then
	ll_clave = long(em_inter.text)
	if ll_clave > 0 then
		li_row = dw_reporte.retrieve(ll_clave,2,gi_depto)
		if li_row >= 1 then
			dw_reporte.object.t_depto.text = is_departamento
		else
			Messagebox("Aviso","El alumno de intercambio no cuenta con prestamo de material")
			em_inter.text = ""
			em_inter.setfocus()
		end if
	else
		Messagebox("Error","Debe indicar Cuenta del alumno de intercambio")
	end if	
//		Empleado
elseif cbx_clave.checked then
	ll_clave = long(em_clave.text)
	if ll_clave > 0 then
		li_row = dw_reporte.retrieve(ll_clave,3,gi_depto)
		if li_row >= 1 then
			dw_reporte.object.t_depto.text = is_departamento
		else
			Messagebox("Aviso","El usuario no cuenta con prestamo de material")
			em_clave.text = ""
			em_cuenta.setfocus()
		end if
	else
		Messagebox("Error","Debe indicar clave de usuario")
	end if	
//		Por Fecha de entrega hasta el dia: indicado
elseif cbx_fecha.checked Then
	if isdate(em_fecha_fin.text) Then
		ld_Fecha = date(em_fecha_fin.text)
		dw_reporte.retrieve(ld_Fecha, gi_depto)
		dw_reporte.object.t_depto.text = is_departamento
	else
		Messagebox("Error","Fecha Invalida")
		Return		
	end if
else
	Messagebox("Aviso","Por favor seleccione un tipo de reporte")
	return
end if
 

setpointer(arrow!)

end event

type cbx_material from checkbox within w_reporte_materialprestamo
integer x = 261
integer y = 484
integer width = 983
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "REPORTE POR NOMBRE MATERIAL"
boolean lefttext = true
end type

event clicked;if this.checked then
	dw_desc.visible = true
	dw_busqueda.visible = true
	
	dw_desc.insertrow(0)
	
	cbx_material.checked = true
	cbx_clave.checked = false
	cbx_cuenta.checked = false
	cbx_fecha.checked = false
	cbx_inter.checked = false
	
	
	em_cuenta.enabled = false
	em_inter.enabled = false
	em_clave.enabled = false
	
	em_cuenta.text = ""
	em_inter.text = ""
	em_clave.text = ""
	cb_1.visible = false
	cbx_bus.visible = true
	cbx_bus.checked = true
	dw_desc.setfocus()
	em_fecha_fin.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
	dw_reporte.dataobject = "d_rep_materialdesc"
	dw_reporte.SettransObject(gtr_sumuia)
end if
end event

type st_1 from statictext within w_reporte_materialprestamo
integer x = 3397
integer y = 152
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "día/mes/año"
boolean focusrectangle = false
end type

type em_fecha_fin from editmask within w_reporte_materialprestamo
integer x = 3360
integer y = 212
integer width = 338
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type cbx_fecha from checkbox within w_reporte_materialprestamo
integer x = 261
integer y = 412
integer width = 983
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "REPORTE POR FECHA AL DÍA"
boolean lefttext = true
end type

event clicked;if this.checked then
	em_fecha_fin.setfocus()
	dw_desc.visible = false
	dw_busqueda.visible = false
	cbx_bus.visible = false
	cb_1.visible = true
	cbx_clave.checked = false
	cbx_material.checked = false
	cbx_cuenta.checked = false
	cbx_inter.checked = false
	em_cuenta.enabled = false
	em_inter.enabled = false
	em_clave.enabled = false
	em_cuenta.text = ""
	em_inter.text = ""
	em_clave.text = ""
	em_fecha_fin.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
	dw_reporte.dataobject = "d_rep_materialfecha"
	dw_reporte.SettransObject(gtr_sumuia)
end if
end event

type cbx_cuenta from checkbox within w_reporte_materialprestamo
integer x = 261
integer y = 208
integer width = 983
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "REPORTE POR  ALUMNO"
boolean lefttext = true
end type

event clicked;if this.checked then
	em_cuenta.enabled = true
	em_cuenta.setfocus()
	dw_desc.visible = false
	dw_busqueda.visible = false
	cbx_bus.visible = false
	cb_1.visible = true
	cbx_fecha.checked = false
	cbx_material.checked = false
	cbx_inter.checked = false
	cbx_clave.checked = false
	em_clave.enabled = false
	em_inter.enabled = false
	em_clave.text = ""
	em_inter.text = ""
	em_fecha_fin.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
	dw_reporte.dataobject = "d_rep_materialcta"
	dw_reporte.SettransObject(gtr_sumuia)
end if
end event

type dw_desc from datawindow within w_reporte_materialprestamo
integer x = 1426
integer y = 484
integer width = 1285
integer height = 108
integer taborder = 20
string title = "none"
string dataobject = "dw_editor_1"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(gtr_sumuia)
end event

event editchanged;string desc

accepttext()

if cbx_bus.checked = true then
	desc = "%"+upper(getitemstring(getrow(),1))+"%"
else
	desc = upper(getitemstring(getrow(),1))+"%"
end if

dw_reporte.reset() 

dw_busqueda.retrieve(desc,gi_depto)
end event

type em_cuenta from editmask within w_reporte_materialprestamo
integer x = 1481
integer y = 208
integer width = 338
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!"
end type

event modified;
string ls_cuenta, ls_digito
long ll_cuenta


ls_cuenta = em_cuenta.text
ll_cuenta = long(mid(ls_cuenta,1,len(ls_cuenta)-1))
if ll_cuenta > 0 then
	ls_digito = right(ls_cuenta,1)
	if ls_digito <> f_obten_digito(ll_cuenta) then
		messagebox('Error en el Dígito','El dígito verificador es incorrecto')
		em_cuenta.text = ""
	else
		em_cuenta.text = string(ll_cuenta)+'-'+ls_digito+'  '
		il_cuenta = ll_cuenta
		
	end if
end if
end event

type gb_1 from groupbox within w_reporte_materialprestamo
integer x = 192
integer y = 72
integer width = 1111
integer height = 520
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Seleccione reporte"
end type

type gb_2 from groupbox within w_reporte_materialprestamo
integer x = 1408
integer y = 72
integer width = 480
integer height = 280
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Alumno"
end type

type gb_4 from groupbox within w_reporte_materialprestamo
integer x = 3296
integer y = 72
integer width = 480
integer height = 280
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Fecha al día:"
end type

type gb_3 from groupbox within w_reporte_materialprestamo
integer x = 2034
integer y = 72
integer width = 480
integer height = 280
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Intercambio"
end type

type gb_5 from groupbox within w_reporte_materialprestamo
integer x = 2670
integer y = 72
integer width = 480
integer height = 280
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Clave"
end type

