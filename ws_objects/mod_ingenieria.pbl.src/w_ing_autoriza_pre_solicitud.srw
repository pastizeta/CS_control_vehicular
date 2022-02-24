$PBExportHeader$w_ing_autoriza_pre_solicitud.srw
$PBExportComments$Muestra las presolicitudes capturadas para el alumno-profesor del departamento en cuestion
forward
global type w_ing_autoriza_pre_solicitud from w_sheet
end type
type rb_vencidas from radiobutton within w_ing_autoriza_pre_solicitud
end type
type rb_autorizadas from radiobutton within w_ing_autoriza_pre_solicitud
end type
type rb_pendientes from radiobutton within w_ing_autoriza_pre_solicitud
end type
type dw_ing_aux_autoriza from datawindow within w_ing_autoriza_pre_solicitud
end type
type st_2 from statictext within w_ing_autoriza_pre_solicitud
end type
type em_folio from editmask within w_ing_autoriza_pre_solicitud
end type
type st_1 from statictext within w_ing_autoriza_pre_solicitud
end type
type em_idusuario from editmask within w_ing_autoriza_pre_solicitud
end type
type cb_salir from commandbutton within w_ing_autoriza_pre_solicitud
end type
type cb_aceptar from commandbutton within w_ing_autoriza_pre_solicitud
end type
type cb_consulta from commandbutton within w_ing_autoriza_pre_solicitud
end type
type dw_mat_cursos from u_dw within w_ing_autoriza_pre_solicitud
end type
type gb_autorizadas from groupbox within w_ing_autoriza_pre_solicitud
end type
end forward

global type w_ing_autoriza_pre_solicitud from w_sheet
integer x = 214
integer width = 3767
integer height = 2214
string title = "Autorización de Presolicitudes de Prestamos"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 134217730
rb_vencidas rb_vencidas
rb_autorizadas rb_autorizadas
rb_pendientes rb_pendientes
dw_ing_aux_autoriza dw_ing_aux_autoriza
st_2 st_2
em_folio em_folio
st_1 st_1
em_idusuario em_idusuario
cb_salir cb_salir
cb_aceptar cb_aceptar
cb_consulta cb_consulta
dw_mat_cursos dw_mat_cursos
gb_autorizadas gb_autorizadas
end type
global w_ing_autoriza_pre_solicitud w_ing_autoriza_pre_solicitud

type variables
n_transportar regreso
boolean ib_selecciona
//integer li_tipo
long sl_linea

integer ii_anio, ii_periodo
end variables

on w_ing_autoriza_pre_solicitud.create
int iCurrent
call super::create
this.rb_vencidas=create rb_vencidas
this.rb_autorizadas=create rb_autorizadas
this.rb_pendientes=create rb_pendientes
this.dw_ing_aux_autoriza=create dw_ing_aux_autoriza
this.st_2=create st_2
this.em_folio=create em_folio
this.st_1=create st_1
this.em_idusuario=create em_idusuario
this.cb_salir=create cb_salir
this.cb_aceptar=create cb_aceptar
this.cb_consulta=create cb_consulta
this.dw_mat_cursos=create dw_mat_cursos
this.gb_autorizadas=create gb_autorizadas
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_vencidas
this.Control[iCurrent+2]=this.rb_autorizadas
this.Control[iCurrent+3]=this.rb_pendientes
this.Control[iCurrent+4]=this.dw_ing_aux_autoriza
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.em_folio
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.em_idusuario
this.Control[iCurrent+9]=this.cb_salir
this.Control[iCurrent+10]=this.cb_aceptar
this.Control[iCurrent+11]=this.cb_consulta
this.Control[iCurrent+12]=this.dw_mat_cursos
this.Control[iCurrent+13]=this.gb_autorizadas
end on

on w_ing_autoriza_pre_solicitud.destroy
call super::destroy
destroy(this.rb_vencidas)
destroy(this.rb_autorizadas)
destroy(this.rb_pendientes)
destroy(this.dw_ing_aux_autoriza)
destroy(this.st_2)
destroy(this.em_folio)
destroy(this.st_1)
destroy(this.em_idusuario)
destroy(this.cb_salir)
destroy(this.cb_aceptar)
destroy(this.cb_consulta)
destroy(this.dw_mat_cursos)
destroy(this.gb_autorizadas)
end on

event open;call super::open;//integer li_cvedepto
//long ll_cuentaProf
//
//regreso = message.powerobjectparm
//li_cvedepto = regreso.ii_parm1
//ll_cuentaProf = regreso.il_parm2

//dw_mat_cursos.setTransObject(gtr_sumuia)
//if dw_mat_cursos.Retrieve(li_cvedepto, ll_cuentaProf) = 0 then
//	ib_selecciona  = false
//	close( this)
//end if 
//
//

dw_mat_cursos.setTransObject(gtr_sumuia)
em_idusuario.setfocus( )

f_select_anio_periodo_actual(ii_periodo,ii_anio,today())


end event

event close;call super::close;if ib_selecciona then	
	CloseWithReturn(w_ing_pre_solicitud,regreso)
end if
end event

type rb_vencidas from radiobutton within w_ing_autoriza_pre_solicitud
integer x = 2692
integer y = 83
integer width = 333
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554431
long backcolor = 134217730
string text = "Vencidas"
end type

event clicked;dw_ing_aux_autoriza.Reset()
dw_mat_cursos.SetRedraw(false)
dw_mat_cursos.SetFilter('')
dw_mat_cursos.Filter()
dw_mat_cursos.Reset()
dw_mat_cursos.SetRedraw(true)

end event

type rb_autorizadas from radiobutton within w_ing_autoriza_pre_solicitud
integer x = 2249
integer y = 83
integer width = 413
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554431
long backcolor = 134217730
string text = "Autorizadas"
end type

event clicked;dw_ing_aux_autoriza.Reset()
dw_mat_cursos.SetRedraw(false)
dw_mat_cursos.SetFilter('')
dw_mat_cursos.Filter()
dw_mat_cursos.Reset()
dw_mat_cursos.SetRedraw(true)

end event

type rb_pendientes from radiobutton within w_ing_autoriza_pre_solicitud
integer x = 1825
integer y = 83
integer width = 384
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554431
long backcolor = 134217730
string text = "Pendientes"
boolean checked = true
end type

event clicked;dw_ing_aux_autoriza.Reset()
dw_mat_cursos.SetRedraw(false)
dw_mat_cursos.SetFilter('')
dw_mat_cursos.Filter()
dw_mat_cursos.Reset()
dw_mat_cursos.SetRedraw(true)
end event

type dw_ing_aux_autoriza from datawindow within w_ing_autoriza_pre_solicitud
boolean visible = false
integer x = 1953
integer y = 1955
integer width = 135
integer height = 118
integer taborder = 50
string title = "none"
string dataobject = "d_ing_aux_autoriza"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_ing_autoriza_pre_solicitud
integer x = 984
integer y = 90
integer width = 358
integer height = 67
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Folio:"
boolean focusrectangle = false
end type

type em_folio from editmask within w_ing_autoriza_pre_solicitud
integer x = 1368
integer y = 90
integer width = 325
integer height = 67
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
string mask = "##########"
string minmax = "~~"
end type

type st_1 from statictext within w_ing_autoriza_pre_solicitud
integer x = 95
integer y = 90
integer width = 358
integer height = 67
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solicitante:"
boolean focusrectangle = false
end type

type em_idusuario from editmask within w_ing_autoriza_pre_solicitud
integer x = 483
integer y = 90
integer width = 325
integer height = 67
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
string mask = "##########"
string minmax = "~~"
end type

type cb_salir from commandbutton within w_ing_autoriza_pre_solicitud
integer x = 1317
integer y = 1978
integer width = 402
integer height = 99
integer taborder = 50
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

type cb_aceptar from commandbutton within w_ing_autoriza_pre_solicitud
integer x = 658
integer y = 1981
integer width = 402
integer height = 99
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar"
end type

event clicked;//if dw_mat_cursos.update(true,false) < 0 then
//	rollback using gtr_sumuia;
//	messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
//Else
//	commit using gtr_sumuia;
//	messagebox("Mensaje","Actualización satisfactoria",none!)
//end if

integer li_i, li_cuantos, li_existe, li_materiales, li_marcado, li_autorizadas
integer li_a, li_b, li_grabar, Net=1
integer li_status, li_autorizada, li_req_firma
long ll_folio
datetime ldt_fechainicio, ldt_fechafinal


if rb_pendientes.checked=true then
	li_status=0
	li_autorizada=0
	li_req_firma=0
	ldt_fechainicio=datetime(today(),time('00:00:00'))
	ldt_fechafinal=datetime(date('2013-12-31'),time('00:00:00'))
end if

if rb_autorizadas.checked=true then
	li_status=0
	li_autorizada=1
	li_req_firma=-1
	ldt_fechainicio=datetime(date('2013-01-01'),time('00:00:00'))
	ldt_fechafinal=datetime(date('2013-12-31'),time('00:00:00'))
end if

if rb_vencidas.checked=true then
	li_status=0
	li_autorizada=0
	li_req_firma=0
	ldt_fechainicio=datetime(date('2013-01-01'),time('00:00:00'))
	ldt_fechafinal=datetime(relativedate(today(),-1),time('23:59:59'))
end if


li_autorizadas=dw_ing_aux_autoriza.RowCount()

for li_i=1 to li_autorizadas
	dw_ing_aux_autoriza.SetItem(li_i,'autorizados',0)
next

li_cuantos=dw_mat_cursos.RowCount()

if li_cuantos > 0 and li_autorizadas>0 then

	for li_i=1 to li_cuantos
		
		ll_folio=dw_mat_cursos.GetItemNumber(li_i,'folio')
		li_marcado=dw_mat_cursos.GetItemNumber(li_i,'autorizada')
		
		if li_marcado=1 then
			li_existe=dw_ing_aux_autoriza.Find("folio="+string(ll_folio),1,dw_ing_aux_autoriza.RowCount())
	
			if li_existe>0 then
				li_materiales=dw_ing_aux_autoriza.GetItemNumber(li_existe,'autorizados')+1
				dw_ing_aux_autoriza.SetItem(li_existe,'autorizados',li_materiales)
			end if
		end if	
		
	next
	
end if	


if li_autorizadas>0 then

	for li_i=1 to dw_ing_aux_autoriza.RowCount()
		li_a=dw_ing_aux_autoriza.GetItemNumber(li_i,'materiales')
		li_b=dw_ing_aux_autoriza.GetItemNumber(li_i,'autorizados')
		ll_folio=dw_ing_aux_autoriza.GetItemNumber(li_i,'folio')
		
		if li_b>0 then
			
			if li_a<>li_b then
				li_grabar=0
				Net = messagebox("Atención","El folio "+string(ll_folio)+" no tiene todos los materiales marcados, ¿desea autorizarlo?", &
										Question!, yesno!, 2)
										
				if Net = 1 then li_grabar=1
			else
				li_grabar=1
			end if
			
				if li_grabar=1 then
						UPDATE dbo.spre_pre_solicitud 
						SET dbo.spre_pre_solicitud.autorizada = 1
						WHERE ( dbo.spre_pre_solicitud.folio = :ll_folio ) 
						using gtr_sumuia;
					
						if gtr_sumuia.SQLCode = -1 then 
							MessageBox("ERROR del sistema", gtr_sumuia.SQLErrText)
						else	
							messagebox("Solicitud "+string(ll_folio),"Actualización satisfactoria")
						end if
					
				end if
			
		end if
		
	next
	
	dw_mat_cursos.Reset()
	dw_mat_cursos.Retrieve(gi_depto, gi_area,li_status,li_autorizada,li_req_firma,ldt_fechainicio,ldt_fechafinal,ii_periodo)
else
	messagebox('Aviso', 'Estas solicitudes no se pueden modificar')
end if

end event

type cb_consulta from commandbutton within w_ing_autoriza_pre_solicitud
integer x = 69
integer y = 1981
integer width = 402
integer height = 99
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consultar"
end type

event clicked;string ls_cuentaProf
string ls_folio
string old_select, new_select, where_clause
integer li_cuantos, li_i, li_existe, li_nueva, li_materiales=0
integer li_status, li_autorizada, li_req_firma, li_actualizar=0
long ll_folio
datetime ldt_fechainicio, ldt_fechafinal

ls_folio = trim(em_folio.text)
ls_cuentaProf = em_idusuario.text
If trim(ls_cuentaProf) = ''  Then SetNull(ls_cuentaProf)
If trim(ls_folio) = ''  Then SetNull(ls_folio)


if rb_pendientes.checked=true then
	li_status=0
	li_autorizada=0
	li_req_firma=0
	ldt_fechainicio=datetime(today(),time('00:00:00'))
	ldt_fechafinal=datetime(date('2013-12-31'),time('00:00:00'))
	li_actualizar=1
end if

if rb_autorizadas.checked=true then
	li_status=0
	li_autorizada=1
	li_req_firma=-1
	ldt_fechainicio=datetime(date('2013-01-01'),time('00:00:00'))
	ldt_fechafinal=datetime(date('2013-12-31'),time('00:00:00'))
end if

if rb_vencidas.checked=true then
	li_status=0
	li_autorizada=0
	li_req_firma=0
	ldt_fechainicio=datetime(date('2013-01-01'),time('00:00:00'))
	ldt_fechafinal=datetime(relativedate(today(),-1),time('23:59:59'))
end if

dw_ing_aux_autoriza.Reset()
dw_mat_cursos.Reset()
dw_mat_cursos.SetRedraw(false)
dw_mat_cursos.SetFilter('')
dw_mat_cursos.Filter()
dw_mat_cursos.Retrieve(gi_depto, gi_area,li_status,li_autorizada,li_req_firma,ldt_fechainicio,ldt_fechafinal,ii_periodo)
li_cuantos=dw_mat_cursos.RowCount()

if li_cuantos>0 then
	
	if ls_cuentaProf <> '' then
		dw_mat_cursos.SetFilter('solicitanteid ='+ls_cuentaProf)
		dw_mat_cursos.Filter()
	end if

	if ls_folio <> '' then
		dw_mat_cursos.SetFilter('folio ='+ls_folio)
		dw_mat_cursos.Filter()
	end if
	
	li_cuantos=dw_mat_cursos.RowCount()
	
	if li_actualizar>0 then
		for li_i=1 to li_cuantos
			
			ll_folio=dw_mat_cursos.GetItemNumber(li_i,'folio')
			
			li_existe=dw_ing_aux_autoriza.Find("folio="+string(ll_folio),1,dw_ing_aux_autoriza.RowCount())
	
			if li_existe=0 then
				li_nueva=dw_ing_aux_autoriza.insertrow(0)
				dw_ing_aux_autoriza.SetItem(li_nueva,'folio',ll_folio)
				dw_ing_aux_autoriza.SetItem(li_nueva,'materiales',1)
				dw_ing_aux_autoriza.SetItem(li_nueva,'autorizados',0)
			else
				li_materiales=dw_ing_aux_autoriza.GetItemNumber(li_existe,'materiales')+1
				dw_ing_aux_autoriza.SetItem(li_existe,'materiales',li_materiales)
			end if
			
		next
		
	end if	
	
	

end if

if li_cuantos=0 then		
		Messagebox("Mensaje","No se han encontrado registros para la consulta realizada....")
end if 

dw_mat_cursos.SetRedraw(true)
end event

type dw_mat_cursos from u_dw within w_ing_autoriza_pre_solicitud
integer x = 69
integer y = 202
integer width = 3606
integer height = 1725
integer taborder = 60
string dataobject = "d_ing_pre_solicitudes_aut_p"
boolean border = false
end type

event itemfocuschanged;call super::itemfocuschanged;sl_linea=row
if row>0 then
	selectrow(0,false)
	selectrow(row,true)
else
	selectrow(0,false)
end if
end event

event doubleclicked;call super::doubleclicked;
if row>0 then
	ib_selecciona = true
	regreso.ii_parm3= this.GetItemNumber(row,'folio')	
	close(parent)
else
	messagebox('Error','De doble click sobre el nombre del material.')
end if
	
	
	

end event

event itemchanged;call super::itemchanged;If dwo.name = "autorizada" Then
	If This.getitemnumber( row, "status") = 1 Or This.getitemnumber( row, "status") = 2 Then
		Messagebox("Mensaje", "No se puede modificar una presolicitud con estatus Procesada o Cancelada...")
		return -1
	End If
End If
	
end event

type gb_autorizadas from groupbox within w_ing_autoriza_pre_solicitud
integer x = 1792
integer y = 38
integer width = 1295
integer height = 141
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554431
long backcolor = 134217730
end type

