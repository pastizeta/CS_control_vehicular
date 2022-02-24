$PBExportHeader$w_gen_multas_mat.srw
$PBExportComments$Permite cargar el pago de  las multas del material
forward
global type w_gen_multas_mat from w_sheet
end type
type st_5 from statictext within w_gen_multas_mat
end type
type cbx_intercambio from checkbox within w_gen_multas_mat
end type
type st_4 from statictext within w_gen_multas_mat
end type
type st_3 from statictext within w_gen_multas_mat
end type
type st_2 from statictext within w_gen_multas_mat
end type
type st_1 from statictext within w_gen_multas_mat
end type
type em_operacion from editmask within w_gen_multas_mat
end type
type em_corte from editmask within w_gen_multas_mat
end type
type em_caja from editmask within w_gen_multas_mat
end type
type dw_solicitud from u_dw within w_gen_multas_mat
end type
type sle_cuenta from singlelineedit within w_gen_multas_mat
end type
type rb_2 from radiobutton within w_gen_multas_mat
end type
type rb_1 from radiobutton within w_gen_multas_mat
end type
type cb_cerrar from commandbutton within w_gen_multas_mat
end type
type cb_actualiza from commandbutton within w_gen_multas_mat
end type
type dw_interesado from u_dw within w_gen_multas_mat
end type
type gb_1 from groupbox within w_gen_multas_mat
end type
type gb_2 from groupbox within w_gen_multas_mat
end type
end forward

global type w_gen_multas_mat from w_sheet
integer width = 3105
integer height = 1229
string title = "Multas material"
long backcolor = 29534863
st_5 st_5
cbx_intercambio cbx_intercambio
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
em_operacion em_operacion
em_corte em_corte
em_caja em_caja
dw_solicitud dw_solicitud
sle_cuenta sle_cuenta
rb_2 rb_2
rb_1 rb_1
cb_cerrar cb_cerrar
cb_actualiza cb_actualiza
dw_interesado dw_interesado
gb_1 gb_1
gb_2 gb_2
end type
global w_gen_multas_mat w_gen_multas_mat

type variables
boolean sb_nuevo=false
integer ligpomat, ii_status
long  ilRowSol
n_transportar regreso
n_transportar origen
datastore ids_MatAlmn, ids_MatProf

long il_cuenta
end variables

forward prototypes
public function n_transportar wf_busca_empleado (integer al_nomina)
public function string wf_busca_alumno (long al_cuenta)
public subroutine wf_limpia_forma ()
end prototypes

public function n_transportar wf_busca_empleado (integer al_nomina);string ls_nombrecompleto,ls_costo,ls_depto
n_transportar uo_salida
//ids_MatProf
	if isvalid(ids_MatProf) then
		destroy ids_MatProf
		ids_MatProf =  create datastore 
		ids_MatProf.dataobject ='d_psi_matinscp'
		ids_MatProf.settransobject(gtr_sumuia)
	else
		ids_MatProf =  create datastore 
		ids_MatProf.dataobject ='d_psi_matinscp'
		ids_MatProf.settransobject(gtr_sumuia)		
	end if
setpointer(hourglass!)
if al_nomina<>0 then
    SELECT nombre+' '+isnull(appaterno,'') +' ' +isnull(apmaterno,'') as nombrecompleto,   
         ccosto,   
         nombredepto  
    INTO :ls_nombrecompleto,   
         :ls_costo,   
         :ls_depto  
    FROM empl_uia1  
   WHERE empl_uia1.empleado = :al_nomina   using gtr_personal;
		if gtr_personal.sqlcode=0 then
			//TODO OK
			uo_salida.is_parm1=ls_nombrecompleto
			ids_MatProf.retrieve(al_nomina)			
		else
			messagebox("Mensaje del Sistema","La clave ingresada no es valida",stopsign!)
		end if			
	end if
	commit using gtr_personal;
return uo_salida
end function

public function string wf_busca_alumno (long al_cuenta);string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
boolean lb_error=true
if isvalid(ids_MatAlmn) then
	destroy ids_MatAlmn
	ids_MatAlmn =  create datastore 
	ids_MatAlmn.dataobject ='d_psi_matinsc'
	ids_MatAlmn.settransobject(gtr_sumuia)
else
		ids_MatAlmn =  create datastore 
		ids_MatAlmn.dataobject ='d_psi_matinsc'
		ids_MatAlmn.settransobject(gtr_sumuia)
		
end if
setpointer(hourglass!)
if al_cuenta<>0 then
  SELECT v_sce_banderas_inscrito.cuenta,   
	         v_sce_alumnos.nombre+ ' ' + v_sce_alumnos.apaterno+' ' +v_sce_alumnos.amaterno as nombre_completo  ,
			v_sce_carreras.carrera
   INTO :ll_cuenta_inscrito,   
	       :ls_nombrecompleto,
		   :ls_carrera
FROM		v_sce_alumnos INNER JOIN
		v_sce_academicos ON v_sce_alumnos.cuenta = v_sce_academicos.cuenta INNER JOIN
		v_sce_carreras ON v_sce_academicos.cve_carrera = v_sce_carreras.cve_carrera LEFT OUTER JOIN
		v_sce_banderas_inscrito ON v_sce_alumnos.cuenta = v_sce_banderas_inscrito.cuenta
	   WHERE  v_sce_alumnos.cuenta = :al_cuenta
		and v_sce_carreras.cve_carrera in (select cve_carrera from v_sce_carreras  where cve_coordinacion in (select cve_coordinacion from v_sce_coordinaciones where cve_depto = 3500))using gtr_sumuia;
		if gtr_sumuia.sqlcode=0 then
			//TODO OK
			if  isnull(ll_cuenta_inscrito) then
				messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
			else
				ids_MatAlmn.retrieve(ll_cuenta_inscrito)
			end if
			
		else
			messagebox("Mensaje del Sistema","Alumno NO inscrito en el area de "+st_5.text,stopsign!)

		end if			
	end if
return ls_nombrecompleto
end function

public subroutine wf_limpia_forma ();dw_interesado.Reset()
dw_solicitud.Reset()
dw_interesado.triggerevent("pfc_InsertRow")

end subroutine

on w_gen_multas_mat.create
int iCurrent
call super::create
this.st_5=create st_5
this.cbx_intercambio=create cbx_intercambio
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.em_operacion=create em_operacion
this.em_corte=create em_corte
this.em_caja=create em_caja
this.dw_solicitud=create dw_solicitud
this.sle_cuenta=create sle_cuenta
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_cerrar=create cb_cerrar
this.cb_actualiza=create cb_actualiza
this.dw_interesado=create dw_interesado
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_5
this.Control[iCurrent+2]=this.cbx_intercambio
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.em_operacion
this.Control[iCurrent+8]=this.em_corte
this.Control[iCurrent+9]=this.em_caja
this.Control[iCurrent+10]=this.dw_solicitud
this.Control[iCurrent+11]=this.sle_cuenta
this.Control[iCurrent+12]=this.rb_2
this.Control[iCurrent+13]=this.rb_1
this.Control[iCurrent+14]=this.cb_cerrar
this.Control[iCurrent+15]=this.cb_actualiza
this.Control[iCurrent+16]=this.dw_interesado
this.Control[iCurrent+17]=this.gb_1
this.Control[iCurrent+18]=this.gb_2
end on

on w_gen_multas_mat.destroy
call super::destroy
destroy(this.st_5)
destroy(this.cbx_intercambio)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_operacion)
destroy(this.em_corte)
destroy(this.em_caja)
destroy(this.dw_solicitud)
destroy(this.sle_cuenta)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_cerrar)
destroy(this.cb_actualiza)
destroy(this.dw_interesado)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//	Event:			open
//	Arguments:		Ninguno
//	Returns:			pbm_open
//	Description:	Carga la forma y prepara la misma para poder realizar la
//						entrega de materiales
//////////////////////////////////////////////////////////////////////////////
x=0
y=0
dw_interesado.setTransObject(gtr_sumuia)
dw_solicitud.setTransObject(gtr_sumuia)
dw_interesado.triggerevent("pfc_InsertRow")
st_5.text = gs_depto


This.title = This.title + ' (' + gs_depto + ')'

end event

event activate;call super::activate;//////////////////////////////////////////////////////////////////////////////
//	Event:			activate
//	Arguments:		Ninguno
//	Returns:			pbm_activate
//	Description:	Permite asignar la clave y el tipo de solicitante
//////////////////////////////////////////////////////////////////////////////
/*
n_transportar uo_parametros
uo_parametros = Message.PowerObjectParm

if isvalid(Message.PowerObjectParm) then
if uo_parametros.is_parm1="BUSQUEDA" then
	if uo_parametros.is_parm5='solicitanteid' then
		dw_interesado.setitem(1,'solicitanteid',uo_parametros.il_parm1)
		dw_solicitud.Retrieve(uo_parametros.il_parm1)
		dw_interesado.setitem(1,'solicitantenombre',uo_parametros.is_parm2)
		dw_interesado.setitem(1,'tipo_prestamo',uo_parametros.ii_parm2)	
	end if
	 
end if
end if*/
end event

event closequery;call super::closequery;if ( dw_solicitud.modifiedcount() >0   ) then
	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
		cb_actualiza.triggerevent(clicked!)
	end if
end if	

end event

type st_5 from statictext within w_gen_multas_mat
boolean visible = false
integer x = 2611
integer y = 48
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Psicología"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_intercambio from checkbox within w_gen_multas_mat
integer x = 435
integer y = 80
integer width = 391
integer height = 74
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Intercambio"
end type

event clicked;sle_cuenta.setfocus()
end event

type st_4 from statictext within w_gen_multas_mat
boolean visible = false
integer x = 2447
integer y = 506
integer width = 527
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 276856960
string text = "Pago de la Multa"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_gen_multas_mat
boolean visible = false
integer x = 2432
integer y = 893
integer width = 296
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Operación:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_gen_multas_mat
boolean visible = false
integer x = 2560
integer y = 768
integer width = 168
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Corte:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_gen_multas_mat
boolean visible = false
integer x = 2575
integer y = 650
integer width = 154
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Caja:"
boolean focusrectangle = false
end type

type em_operacion from editmask within w_gen_multas_mat
boolean visible = false
integer x = 2743
integer y = 880
integer width = 234
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
alignment alignment = center!
string mask = "######"
end type

type em_corte from editmask within w_gen_multas_mat
boolean visible = false
integer x = 2743
integer y = 755
integer width = 234
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
alignment alignment = center!
string mask = "######"
end type

event modified;em_operacion.setfocus()
end event

type em_caja from editmask within w_gen_multas_mat
boolean visible = false
integer x = 2743
integer y = 634
integer width = 234
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
alignment alignment = center!
string mask = "######"
end type

event modified;em_corte.setfocus()
end event

type dw_solicitud from u_dw within w_gen_multas_mat
integer x = 69
integer y = 458
integer width = 2271
integer height = 557
integer taborder = 30
string dataobject = "d_gen_mat_multa"
boolean border = false
end type

event rowfocuschanged;call super::rowfocuschanged;long llFolio
string lsCveMat
if currentrow >0 then
	selectrow(0,false)	
else
	selectrow(0,false)
end if
end event

event itemchanged;call super::itemchanged;integer i
if dwo.name='saldo0' then
	CHOOSE CASE long(data)
		CASE 1
			dw_solicitud.setitem(row,'spre_multas_saldo',0)
		CASE 0
			dw_solicitud.setitem(row,'spre_multas_saldo',getitemnumber(row,'spre_multas_importe'))
	END CHOOSE
end if
end event

type sle_cuenta from singlelineedit within w_gen_multas_mat
event activarbusq ( )
integer x = 435
integer y = 179
integer width = 296
integer height = 77
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event activarbusq();
long ll_cuentab, ll_cuenta, ll_RowsPrestamo
string ls_digito, ls_digitov ,ls_cuenta, ls_nombre, ls_periodo
n_transportar uo_parametros
	if rb_1.checked = true then
		// 	Se agrega Nov 2005.
		if cbx_intercambio.checked =  true then
			
			ll_cuentab = long(sle_cuenta.text)
			il_cuenta = ll_cuentab
			dw_interesado.retrieve(il_cuenta,gi_depto, gi_area)
			ll_RowsPrestamo =dw_interesado.rowcount()
		//
		elseif match(trim(sle_cuenta.text),'-')= true then
			ls_cuenta= trim(sle_cuenta.text)
			ll_cuentab = long(left(trim(sle_cuenta.text),len(trim(sle_cuenta.text))-2))
			ls_digito = upper(right(trim(sle_cuenta.text),1))
			ls_digitov =obten_digito(ll_cuentab)
		else
			ls_cuenta= left(trim(sle_cuenta.text),len(trim(sle_cuenta.text))-1)+'-'+right(trim(sle_cuenta.text),1)
			ll_cuentab = long(left(trim(sle_cuenta.text),len(trim(sle_cuenta.text))-1))
			ls_digito = upper(right(trim(sle_cuenta.text),1))
			ls_digitov =obten_digito(ll_cuentab)
		end if
	
		if ls_digito =ls_digitov then
			dw_interesado.retrieve(long(ll_cuentab),gi_depto, gi_area)
			ll_RowsPrestamo =dw_interesado.rowcount()
		else
			sle_cuenta.text=""
			messagebox("Atención","La cuenta: "+ls_cuenta+" no existe o es incorrecta ")	
		end if
		
	else	
			ls_cuenta= trim(sle_cuenta.text)
			ll_cuentab=long(ls_cuenta)
			dw_interesado.retrieve(long(ls_cuenta),gi_depto,gi_area)
			ll_RowsPrestamo =dw_interesado.rowcount()
	end if
	if ll_RowsPrestamo >0 then
		dw_solicitud.retrieve(long(ll_cuentab),gi_depto,gi_area)
		// Modif: Octubre 2005
		if dw_solicitud.RowCount() > 0 then
			//Messagebox("Atención","Para la liberación de Multas favor de indicar: Caja, Corte y Operación")
		//	em_caja.setfocus()
		dw_solicitud.setfocus()
		end if
	else
		messagebox("Atención","La cuenta: "+sle_cuenta.text+" no tiene prestamos registrados en base de datos")	
	end if
end event

event modified;if trim(sle_cuenta.text) <>"" then 
	wf_limpia_forma()
	IF KeyDown (keyEnter!) THEN
		setpointer(Hourglass!)
		sle_cuenta.triggerevent( "activarbusq")
		setpointer(Arrow!)		
	END IF
end if
end event

type rb_2 from radiobutton within w_gen_multas_mat
integer x = 69
integer y = 186
integer width = 402
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Profesor"
end type

event clicked;cbx_intercambio.checked = false
cbx_intercambio.visible = false

sle_cuenta.text = ""
em_caja.text = " "
em_corte.text = " "
em_operacion.text = " "
dw_interesado.reset()
dw_solicitud.reset()
sle_cuenta.setfocus()
end event

type rb_1 from radiobutton within w_gen_multas_mat
integer x = 69
integer y = 99
integer width = 402
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Alumno"
boolean checked = true
end type

event clicked;cbx_intercambio.visible = true
sle_cuenta.text = " "
em_caja.text = " "
em_corte.text = " "
em_operacion.text = " "
dw_interesado.reset()
dw_solicitud.reset()
sle_cuenta.setfocus()
end event

type cb_cerrar from commandbutton within w_gen_multas_mat
integer x = 2527
integer y = 960
integer width = 362
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Salir"
end type

event clicked;close(parent)
end event

type cb_actualiza from commandbutton within w_gen_multas_mat
integer x = 2523
integer y = 829
integer width = 362
integer height = 109
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;date ldFechaEntrega
integer liDiasRestraso, liCaja, liCorte, liOper
long llMaxFolio, llRow, llEstatus, llFolio, llFolioDat
string lsUpdate, lsTUpdate, lsCveMaterial, lsNoSerie

if dw_solicitud.update(true,false)< 0 then
	messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
	return
end if

for llRow = 1 to dw_solicitud.RowCount()
	llEstatus = dw_solicitud.getitemnumber(llRow,'saldo0')
	choose case llEstatus
		case 1
			llFolio = dw_solicitud.getitemnumber(llRow,'spre_multas_folio_multa')
			llFolioDat = dw_solicitud.getitemnumber(llRow,'spre_multas_folio')
			
			UPDATE dbo.spre_materiales_multas  
			SET status = 1  
			WHERE ( dbo.spre_materiales_multas.cvedepto = :gi_depto ) AND  
				( dbo.spre_materiales_multas.cvearea = :gi_area ) AND  
				( dbo.spre_materiales_multas.folio_multa = :llFolio )
			using gtr_sumuia;	
			if gtr_sumuia.sqlcode < 0 then
				rollback using gtr_sumuia;
				messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
				return
			end if
	end choose
next
commit using gtr_sumuia;
dw_solicitud.ResetUpdate()
messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
wf_limpia_forma()
end event

type dw_interesado from u_dw within w_gen_multas_mat
integer x = 69
integer y = 269
integer width = 2264
integer height = 186
integer taborder = 30
string dataobject = "d_gen_info_multa"
boolean border = false
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////////
//	Description:	Permite realizar la carga mediante la consulta de la  
//						credencial, para lo cual llama a la ventana w_psi_busqueda_uia
//////////////////////////////////////////////////////////////////////////////
//if dwo.name='solicitanteid' then
//	openwithparm(w_psi_busqueda_uia,string(dwo.name))
//	
//end if
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//	Description:	Llama a las funnciones wf_busca_alumno, wf_busca_empleado,
//						solo cuando se modifico la calve del solicitante
//////////////////////////////////////////////////////////////////////////////
n_transportar uo_parametros
CHOOSE CASE dwo.name
	CASE 'solicitanteid'
		CHOOSE CASE this.getitemnumber(1,'tipo_prestamo')
			CASE 1,2
				this.setitem(1,'solicitantenombre',wf_busca_alumno(long(data)))
			
			CASE 3
				uo_parametros=wf_busca_empleado(long(data))
				this.setitem(1,'solicitantenombre',uo_parametros.is_parm1)
				
		END CHOOSE


END CHOOSE
end event

type gb_1 from groupbox within w_gen_multas_mat
integer x = 22
integer y = 3
integer width = 2341
integer height = 1040
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Consultar"
end type

type gb_2 from groupbox within w_gen_multas_mat
boolean visible = false
integer x = 2399
integer y = 394
integer width = 625
integer height = 653
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Capturar datos:"
end type

