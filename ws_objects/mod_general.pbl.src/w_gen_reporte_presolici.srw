$PBExportHeader$w_gen_reporte_presolici.srw
$PBExportComments$w_controls_reporte_matprestamo
forward
global type w_gen_reporte_presolici from w_sheet
end type
type st_5 from statictext within w_gen_reporte_presolici
end type
type st_3 from statictext within w_gen_reporte_presolici
end type
type em_dos from editmask within w_gen_reporte_presolici
end type
type em_uno from editmask within w_gen_reporte_presolici
end type
type cbx_dosperiodos from checkbox within w_gen_reporte_presolici
end type
type st_2 from statictext within w_gen_reporte_presolici
end type
type cb_4 from commandbutton within w_gen_reporte_presolici
end type
type em_clave from editmask within w_gen_reporte_presolici
end type
type em_inter from editmask within w_gen_reporte_presolici
end type
type cbx_clave from checkbox within w_gen_reporte_presolici
end type
type cbx_inter from checkbox within w_gen_reporte_presolici
end type
type cb_3 from commandbutton within w_gen_reporte_presolici
end type
type dw_depto from datawindow within w_gen_reporte_presolici
end type
type cb_2 from commandbutton within w_gen_reporte_presolici
end type
type dw_fecha from datawindow within w_gen_reporte_presolici
end type
type dw_reporte from datawindow within w_gen_reporte_presolici
end type
type cb_1 from commandbutton within w_gen_reporte_presolici
end type
type st_1 from statictext within w_gen_reporte_presolici
end type
type cbx_fecha from checkbox within w_gen_reporte_presolici
end type
type cbx_cuenta from checkbox within w_gen_reporte_presolici
end type
type em_cuenta from editmask within w_gen_reporte_presolici
end type
type gb_1 from groupbox within w_gen_reporte_presolici
end type
type gb_2 from groupbox within w_gen_reporte_presolici
end type
type gb_3 from groupbox within w_gen_reporte_presolici
end type
type gb_5 from groupbox within w_gen_reporte_presolici
end type
end forward

global type w_gen_reporte_presolici from w_sheet
integer width = 4414
integer height = 2355
string title = "Reporte de Presolicitudes"
long backcolor = 29534863
st_5 st_5
st_3 st_3
em_dos em_dos
em_uno em_uno
cbx_dosperiodos cbx_dosperiodos
st_2 st_2
cb_4 cb_4
em_clave em_clave
em_inter em_inter
cbx_clave cbx_clave
cbx_inter cbx_inter
cb_3 cb_3
dw_depto dw_depto
cb_2 cb_2
dw_fecha dw_fecha
dw_reporte dw_reporte
cb_1 cb_1
st_1 st_1
cbx_fecha cbx_fecha
cbx_cuenta cbx_cuenta
em_cuenta em_cuenta
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_5 gb_5
end type
global w_gen_reporte_presolici w_gen_reporte_presolici

type variables
boolean ib_selecciona
long il_fecha_ini, il_fecha_fin
datetime idtm_fecha
string is_departamento

long il_cuenta, il_cve

integer ii_tipop

n_transportar regreso
n_transportar origen



end variables

on w_gen_reporte_presolici.create
int iCurrent
call super::create
this.st_5=create st_5
this.st_3=create st_3
this.em_dos=create em_dos
this.em_uno=create em_uno
this.cbx_dosperiodos=create cbx_dosperiodos
this.st_2=create st_2
this.cb_4=create cb_4
this.em_clave=create em_clave
this.em_inter=create em_inter
this.cbx_clave=create cbx_clave
this.cbx_inter=create cbx_inter
this.cb_3=create cb_3
this.dw_depto=create dw_depto
this.cb_2=create cb_2
this.dw_fecha=create dw_fecha
this.dw_reporte=create dw_reporte
this.cb_1=create cb_1
this.st_1=create st_1
this.cbx_fecha=create cbx_fecha
this.cbx_cuenta=create cbx_cuenta
this.em_cuenta=create em_cuenta
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_5
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.em_dos
this.Control[iCurrent+4]=this.em_uno
this.Control[iCurrent+5]=this.cbx_dosperiodos
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.cb_4
this.Control[iCurrent+8]=this.em_clave
this.Control[iCurrent+9]=this.em_inter
this.Control[iCurrent+10]=this.cbx_clave
this.Control[iCurrent+11]=this.cbx_inter
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.dw_depto
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.dw_fecha
this.Control[iCurrent+16]=this.dw_reporte
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.cbx_fecha
this.Control[iCurrent+20]=this.cbx_cuenta
this.Control[iCurrent+21]=this.em_cuenta
this.Control[iCurrent+22]=this.gb_1
this.Control[iCurrent+23]=this.gb_2
this.Control[iCurrent+24]=this.gb_3
this.Control[iCurrent+25]=this.gb_5
end on

on w_gen_reporte_presolici.destroy
call super::destroy
destroy(this.st_5)
destroy(this.st_3)
destroy(this.em_dos)
destroy(this.em_uno)
destroy(this.cbx_dosperiodos)
destroy(this.st_2)
destroy(this.cb_4)
destroy(this.em_clave)
destroy(this.em_inter)
destroy(this.cbx_clave)
destroy(this.cbx_inter)
destroy(this.cb_3)
destroy(this.dw_depto)
destroy(this.cb_2)
destroy(this.dw_fecha)
destroy(this.dw_reporte)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cbx_fecha)
destroy(this.cbx_cuenta)
destroy(this.em_cuenta)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_5)
end on

event open;call super::open;integer li_row, li_i, li_depto

SetPointer(arrow!) 

//cbx_bus.visible = false
//dw_busqueda.visible = false
//dw_desc.visible = false

cbx_cuenta.checked = true
em_cuenta.setfocus()
em_inter.enabled = false
em_clave.enabled = false

//st_4.visible = false

em_uno.visible = false
em_dos.visible = false
st_1.visible = false
st_5.visible = false
st_3.visible = false
cbx_dosperiodos.visible = false
cbx_dosperiodos.checked = false


li_row = dw_fecha.retrieve()

For li_i =  1 to dw_fecha.rowcount()
	idtm_fecha = dw_fecha.object.fecha[li_i]
next

//em_fecha_fin.text = string(datetime(idtm_fecha),"dd/mm/yyyy")




li_depto = dw_depto.retrieve(gi_depto)
if li_depto >= 1 then
	is_departamento = dw_depto.GetItemstring(1,'descripcion')
end if
//st_2.text = gs_depto

end event

type st_5 from statictext within w_gen_reporte_presolici
integer x = 3193
integer y = 67
integer width = 289
integer height = 58
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

type st_3 from statictext within w_gen_reporte_presolici
integer x = 3079
integer y = 154
integer width = 55
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "al"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_dos from editmask within w_gen_reporte_presolici
integer x = 3152
integer y = 141
integer width = 336
integer height = 90
integer taborder = 80
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

type em_uno from editmask within w_gen_reporte_presolici
integer x = 2725
integer y = 141
integer width = 336
integer height = 90
integer taborder = 70
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

type cbx_dosperiodos from checkbox within w_gen_reporte_presolici
integer x = 3591
integer y = 61
integer width = 113
integer height = 74
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
boolean enabled = false
string text = "Por Rango de Fechas"
boolean lefttext = true
end type

event clicked;//if this.checked then
//	dw_desc.visible = false
//	dw_busqueda.visible = false
//	cbx_bus.visible = false
//	cb_1.visible = true
//	cbx_clave.checked = false
//	cbx_material.checked = false
//	cbx_cuenta.checked = false
//	cbx_inter.checked = false
//	em_cuenta.enabled = false
//	em_inter.enabled = false
//	em_clave.enabled = false
//	em_cuenta.text = ""
//	em_inter.text = ""
//	em_clave.text = ""
//	em_fecha_fin.enabled = false
//	cbx_fecha.checked = true
//
//	dw_reporte.dataobject = "d_gen_rep_materialfecha_dos"
//	dw_reporte.SettransObject(gtr_sumuia)
//
//	em_uno.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
//	em_dos.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
//	
//	em_uno.setfocus()
//	em_uno.visible = true
//	em_dos.visible = true
//	st_3.visible = true
//	
//end if
end event

type st_2 from statictext within w_gen_reporte_presolici
boolean visible = false
integer x = 2245
integer y = 2064
integer width = 622
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 29534863
string text = "Control de Salones"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_gen_reporte_presolici
integer x = 775
integer y = 2077
integer width = 479
integer height = 99
integer taborder = 90
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

type em_clave from editmask within w_gen_reporte_presolici
integer x = 2227
integer y = 141
integer width = 336
integer height = 90
integer taborder = 140
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

type em_inter from editmask within w_gen_reporte_presolici
integer x = 1759
integer y = 141
integer width = 336
integer height = 90
integer taborder = 100
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

type cbx_clave from checkbox within w_gen_reporte_presolici
integer x = 168
integer y = 288
integer width = 984
integer height = 74
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "REPORTE POR CLAVE EMPLEADO"
boolean lefttext = true
end type

event clicked;if this.checked then
	em_clave.enabled = true
	em_clave.setfocus()
//	dw_desc.visible = false
//	dw_busqueda.visible = false
//	cbx_bus.visible = false
	cb_1.visible = true
	cbx_fecha.checked = false
//	cbx_material.checked = false
	cbx_cuenta.checked = false
	cbx_inter.checked = false
	em_cuenta.text = ""
	em_inter.text = ""
	em_inter.enabled = false
	em_cuenta.enabled = false
//	em_fecha_fin.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
	dw_reporte.dataobject = "d_gen_rep_presolici_idsol" 
	dw_reporte.SettransObject(gtr_sumuia)
	
	em_uno.visible = false
	em_dos.visible = false
	st_1.visible = false
	st_5.visible = false
	st_3.visible = false
	cbx_dosperiodos.visible = false
	cbx_dosperiodos.checked = false
end if
end event

type cbx_inter from checkbox within w_gen_reporte_presolici
integer x = 168
integer y = 221
integer width = 984
integer height = 74
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
//	dw_desc.visible = false
//	dw_busqueda.visible = false
//	cbx_bus.visible = false
	cb_1.visible = true
	cbx_fecha.checked = false
//	cbx_material.checked = false
	cbx_cuenta.checked = false
	cbx_clave.checked = false
	em_cuenta.enabled = false
	em_clave.enabled = false
	em_clave.text = ""
	em_cuenta.text = ""
//	em_fecha_fin.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
	dw_reporte.dataobject = "d_gen_rep_presolici_idsol"
	dw_reporte.SettransObject(gtr_sumuia)
	
	em_uno.visible = false
	em_dos.visible = false
	st_1.visible = false
	st_5.visible = false
	st_3.visible = false
	cbx_dosperiodos.visible = false
	cbx_dosperiodos.checked = false
end if
end event

type cb_3 from commandbutton within w_gen_reporte_presolici
boolean visible = false
integer x = 3310
integer y = 2099
integer width = 457
integer height = 99
integer taborder = 150
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

type dw_depto from datawindow within w_gen_reporte_presolici
boolean visible = false
integer x = 2893
integer y = 2157
integer width = 410
integer height = 35
integer taborder = 20
string title = "none"
string dataobject = "d_gen_departamento"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;Settransobject(gtr_sumuia)
end event

type cb_2 from commandbutton within w_gen_reporte_presolici
integer x = 1459
integer y = 2077
integer width = 457
integer height = 99
integer taborder = 30
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

type dw_fecha from datawindow within w_gen_reporte_presolici
boolean visible = false
integer x = 2256
integer y = 2144
integer width = 410
integer height = 35
integer taborder = 110
string title = "none"
string dataobject = "d_fecha"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(gtr_sumuia)
end event

type dw_reporte from datawindow within w_gen_reporte_presolici
integer x = 88
integer y = 515
integer width = 4202
integer height = 1507
integer taborder = 160
string title = "none"
string dataobject = "d_gen_rep_presolici_idsol"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(gtr_sumuia)
end event

event doubleclicked;string nombre,apat,amat,columna, data, verifica, ls_prepa, lstipo
long cuenta
integer li_param=0 ,li_cve_empresa,li_tipo, li_folio
datetime ld_date

columna = 	dwo.name
this.accepttext()
If row > 0 Then
	li_folio = this.GetItemNumber(row,'folio')
	origen.ii_parm1 = li_folio
	openwithparm(w_gen_detalle_presolici,origen)
	if isvalid(Message.PowerObjectParm) then
//		regreso = message.powerobjectparm
//		this.setitem(1,'solicitantegrupo',regreso.is_parm2)
//		this.setitem(1,'solicitanteprofesor',regreso.is_parm3)	
	end if
End If
end event

event rowfocuschanged;if getrow()>0 then
	selectrow(0,false)
	selectrow(getrow(),true)
else
	selectrow(0,false)
end if
end event

type cb_1 from commandbutton within w_gen_reporte_presolici
integer x = 95
integer y = 2074
integer width = 479
integer height = 99
integer taborder = 120
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
date      ld_Fecha, ld_Fecha2

setpointer(hourglass!)

//		Alumno
if cbx_cuenta.checked Then
	if il_cuenta > 0 then
		li_row = dw_reporte.retrieve(gi_depto, gi_area, il_cuenta)
		if li_row >= 1 then
			dw_reporte.object.t_depto.text = is_departamento
		else
			Messagebox("Aviso","El alumno no cuenta con presolicitudes de material")
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
		li_row = dw_reporte.retrieve(gi_depto, gi_area, ll_clave)
		if li_row >= 1 then
//			dw_reporte.object.t_depto.text = is_departamento
		else
			Messagebox("Aviso","El alumno de intercambio no cuenta con presolicitudes de material")
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
		li_row = dw_reporte.retrieve(gi_depto, gi_area, ll_clave)
		if li_row >= 1 then
//			dw_reporte.object.t_depto.text = is_departamento
		else
			Messagebox("Aviso","El usuario no cuenta con presolicitudes de material")
			em_clave.text = ""
			em_cuenta.setfocus()
		end if
	else
		Messagebox("Error","Debe indicar clave de usuario")
	end if	
//		Por Fecha de entrega hasta el dia: indicado
//elseif cbx_fecha.checked and cbx_dosperiodos.checked = false Then
//	if isdate(em_fecha_fin.text) Then
//		ld_Fecha = date(em_fecha_fin.text)
//		dw_reporte.retrieve(ld_Fecha,gi_depto)
//		dw_reporte.object.t_depto.text = is_departamento
//	else
//		Messagebox("Error","Fecha Invalida")
//		Return		
//	end if
//elseif cbx_fecha.checked and cbx_dosperiodos.checked then
elseif cbx_fecha.checked then
	if isdate(em_uno.text) Then
//		st_4.visible = true
		ld_Fecha = Date(datetime(em_uno.text))
		ld_Fecha2 = Date(datetime(em_dos.text))
		dw_reporte.dataobject = "d_gen_rep_presolici_fechaspres"
		dw_reporte.SettransObject(gtr_sumuia)
		dw_reporte.retrieve(gi_depto,gi_area, ld_Fecha, ld_Fecha2)
		dw_reporte.object.t_depto.text = is_departamento
//		st_4.visible = false
	else
		Messagebox("Error","Fechas Invalidas")
		Return		
	end if
	
//	em_uno.visible = false
//	em_dos.visible = false
//	st_3.visible = false
//	cbx_dosperiodos.checked = false
//	cbx_fecha.checked = false
	
else
	Messagebox("Aviso","Por favor seleccione un tipo de reporte")
	return
end if
 

setpointer(arrow!)

end event

type st_1 from statictext within w_gen_reporte_presolici
integer x = 2754
integer y = 67
integer width = 289
integer height = 58
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

type cbx_fecha from checkbox within w_gen_reporte_presolici
integer x = 168
integer y = 355
integer width = 984
integer height = 74
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "REPORTE POR FECHA "
boolean lefttext = true
end type

event clicked;if this.checked then
//	em_fecha_fin.setfocus()
//	dw_desc.visible = false
//	dw_busqueda.visible = false
//	cbx_bus.visible = false
	cb_1.visible = true
	cbx_clave.checked = false
//	cbx_material.checked = false
	cbx_cuenta.checked = false
	cbx_inter.checked = false
	em_cuenta.enabled = false
	em_inter.enabled = false
	em_clave.enabled = false
	em_cuenta.text = ""
	em_inter.text = ""
	em_clave.text = ""
//	em_fecha_fin.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
//	dw_reporte.dataobject = "d_controls_rep_materialfecha"
//	dw_reporte.SettransObject(gtr_sumuia)

	dw_reporte.dataobject = "d_gen_rep_presolici_fechaspres"
	dw_reporte.SettransObject(gtr_sumuia)

//	em_fecha_fin.enabled = true
//	cb_1.visible = False
	em_uno.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
	em_dos.text = string(datetime(idtm_fecha),"dd/mm/yyyy")

	em_uno.setfocus()	
	em_uno.visible = true
	em_dos.visible = true

	
	st_1.visible = true
	st_5.visible = true
	st_3.visible = true
//	cbx_dosperiodos.visible = true
	cbx_dosperiodos.checked = true
end if

////***********  cod del chbx periodo fechas
//if this.checked then
//	dw_desc.visible = false
//	dw_busqueda.visible = false
//	cbx_bus.visible = false
//	cb_1.visible = true
//	cbx_clave.checked = false
//	cbx_material.checked = false
//	cbx_cuenta.checked = false
//	cbx_inter.checked = false
//	em_cuenta.enabled = false
//	em_inter.enabled = false
//	em_clave.enabled = false
//	em_cuenta.text = ""
//	em_inter.text = ""
//	em_clave.text = ""
//	em_fecha_fin.enabled = false
//	cbx_fecha.checked = true
//
//	dw_reporte.dataobject = "d_gen_rep_materialfecha_dos"
//	dw_reporte.SettransObject(gtr_sumuia)
//
//	em_uno.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
//	em_dos.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
//	
//	em_uno.setfocus()
//	em_uno.visible = true
//	em_dos.visible = true
//	st_3.visible = true
//	
//end if
end event

type cbx_cuenta from checkbox within w_gen_reporte_presolici
integer x = 168
integer y = 154
integer width = 984
integer height = 74
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
//	dw_desc.visible = false
//	dw_busqueda.visible = false
//	cbx_bus.visible = false
	cb_1.visible = true
	cbx_fecha.checked = false
//	cbx_material.checked = false
	cbx_inter.checked = false
	cbx_clave.checked = false
	em_clave.enabled = false
	em_inter.enabled = false
	em_clave.text = ""
	em_inter.text = ""
//	em_fecha_fin.text = string(datetime(idtm_fecha),"dd/mm/yyyy")
	dw_reporte.dataobject = "d_gen_rep_presolici_idsol"
	dw_reporte.SettransObject(gtr_sumuia)
	
	em_uno.visible = false
	em_dos.visible = false
	st_1.visible = false
	st_5.visible = false
	st_3.visible = false
	cbx_dosperiodos.visible = false
	cbx_dosperiodos.checked = false
end if
end event

type em_cuenta from editmask within w_gen_reporte_presolici
integer x = 1302
integer y = 141
integer width = 336
integer height = 90
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

type gb_1 from groupbox within w_gen_reporte_presolici
integer x = 102
integer y = 74
integer width = 1112
integer height = 397
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

type gb_2 from groupbox within w_gen_reporte_presolici
integer x = 1258
integer y = 74
integer width = 432
integer height = 189
integer taborder = 50
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

type gb_3 from groupbox within w_gen_reporte_presolici
integer x = 1719
integer y = 74
integer width = 432
integer height = 189
integer taborder = 60
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

type gb_5 from groupbox within w_gen_reporte_presolici
integer x = 2176
integer y = 74
integer width = 432
integer height = 189
integer taborder = 130
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Clave Emp."
end type

