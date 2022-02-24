$PBExportHeader$w_adm_entrega_eq.srw
$PBExportComments$Permite realizar la entrega de equipos
forward
global type w_adm_entrega_eq from w_sheet
end type
type st_pesos from statictext within w_adm_entrega_eq
end type
type em_perdida_mat from editmask within w_adm_entrega_eq
end type
type cbx_perdida_mat from checkbox within w_adm_entrega_eq
end type
type cbx_intercambio from checkbox within w_adm_entrega_eq
end type
type dw_solicitud from u_dw within w_adm_entrega_eq
end type
type sle_cuenta from singlelineedit within w_adm_entrega_eq
end type
type rb_2 from radiobutton within w_adm_entrega_eq
end type
type rb_1 from radiobutton within w_adm_entrega_eq
end type
type cb_cerrar from commandbutton within w_adm_entrega_eq
end type
type cb_actualiza from commandbutton within w_adm_entrega_eq
end type
type dw_interesado from u_dw within w_adm_entrega_eq
end type
type dw_matdisp from u_dw within w_adm_entrega_eq
end type
type gb_1 from groupbox within w_adm_entrega_eq
end type
end forward

global type w_adm_entrega_eq from w_sheet
integer width = 3405
integer height = 2090
string title = "Recepción material"
long backcolor = 29534863
st_pesos st_pesos
em_perdida_mat em_perdida_mat
cbx_perdida_mat cbx_perdida_mat
cbx_intercambio cbx_intercambio
dw_solicitud dw_solicitud
sle_cuenta sle_cuenta
rb_2 rb_2
rb_1 rb_1
cb_cerrar cb_cerrar
cb_actualiza cb_actualiza
dw_interesado dw_interesado
dw_matdisp dw_matdisp
gb_1 gb_1
end type
global w_adm_entrega_eq w_adm_entrega_eq

type variables
boolean sb_nuevo=false
integer ligpomat, ii_status
long  ilRowSol
n_transportar regreso
n_transportar origen
datastore ids_MatAlmn, ids_MatProf, ids_StaPrestamo

integer ii_stauts ,ii_tprestamo 
integer ii_depto, ii_area, ii_grupo
string isCveMaterial, isNoSerie 

long il_cuenta
end variables

forward prototypes
public subroutine wf_limpia_forma ()
public function n_transportar wf_busca_empleado (integer al_nomina)
public function boolean wf_cambia_estatus (long agrlfolio, long argRow)
public function string wf_busca_alumno (long al_cuenta)
end prototypes

public subroutine wf_limpia_forma ();dw_matdisp.Reset()
dw_interesado.Reset()
dw_solicitud.Reset()

dw_interesado.triggerevent("pfc_InsertRow")

end subroutine

public function n_transportar wf_busca_empleado (integer al_nomina);string ls_nombrecompleto,ls_costo,ls_depto
n_transportar uo_salida
//ids_MatProf
	
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
return uo_salida
end function

public function boolean wf_cambia_estatus (long agrlfolio, long argRow);//////////////////////////////////////////////////////////////////////////
//	Function:		wf_cambia_estatus
//	Arguments:		ninguno
//	Returns:			true
//	Description:	Asigna el estatus a la solicitud, dependiendo del estatus  
//						en el que se encuentren los materiales que la compones+
//						0-Normal (Material en prestamo)
//						1-Cerrada (Material en prestamo)
//						2-Entregada parcialmente (Se entrego material, pero, otros continuan en prestamo)
//						3-Muta (Algun material no se entrego a tiempo)
//////////////////////////////////////////////////////////////////////////
long llTotStatus, llRow, llTRow, llStatus, llNoenStatus
string lsTFilter
dw_matdisp.AcceptText()

	llTRow =  dw_matdisp.RowCount()
	if llTRow > 0 then
		for llRow =3 to 0 STEP -1
			
			lsTFilter = "spre_sol_materiales_status in ( " + string(llRow) +" )"
			dw_matdisp.setFilter(lsTFilter)	
			dw_matdisp. Filter()	
			
			llNoenStatus=  dw_matdisp.FilteredCount()	
			llTotStatus= llTRow - llNoenStatus
			choose case llRow
				case 3
					if llTotStatus > 0 then 
						// Existe algun material que con multa
						dw_solicitud.setitem(argRow,'spre_solicitud_status',3)
						dw_solicitud.AcceptText()
						exit
					end if
				case 2
					if llTotStatus > 0 then
						// No entrega algun material
						dw_solicitud.setitem(argRow,'spre_solicitud_status',2)
						dw_solicitud.AcceptText()
						exit
					end if
				case 1
					if ( llTotStatus > 0) and  ( llTotStatus = llTRow ) then
						// Se entrego todo el material
						dw_solicitud.setitem(argRow,'spre_solicitud_status',1)
						dw_solicitud.AcceptText()
						exit
					end if
			end choose
		next		
	end if
lsTFilter = ""
			dw_matdisp.setFilter(lsTFilter)	
			dw_matdisp. Filter()	
return true

end function

public function string wf_busca_alumno (long al_cuenta);string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
boolean lb_error=true
setpointer(hourglass!)
if al_cuenta<>0 then
  SELECT v_sce_banderas_inscrito.cuenta,   
	         v_sce_alumnos.nombre+ ' ' + v_sce_alumnos.apaterno+' ' +v_sce_alumnos.amaterno as nombre_completo  ,
			v_sce_carreras.carrera
   INTO :ll_cuenta_inscrito,   
	        	:ls_nombrecompleto,
			  :ls_carrera
		FROM         v_sce_alumnos INNER JOIN
                      v_sce_academicos ON v_sce_alumnos.cuenta = v_sce_academicos.cuenta INNER JOIN
                      v_sce_carreras ON v_sce_academicos.cve_carrera = v_sce_carreras.cve_carrera LEFT OUTER JOIN
                      v_sce_banderas_inscrito ON v_sce_alumnos.cuenta = v_sce_banderas_inscrito.cuenta
	   WHERE v_sce_alumnos.cuenta = :al_cuenta
		
		
		and v_sce_carreras.cve_carrera in (select cve_carrera from v_sce_carreras  where cve_coordinacion in (select cve_coordinacion from v_sce_coordinaciones ))using gtr_sumuia;
		if gtr_sumuia.sqlcode=0 then
			messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
		else
			messagebox("Mensaje del Sistema","Alumno NO inscrito en el area de Psicología",stopsign!)

		end if			
	end if
return ls_nombrecompleto
end function

on w_adm_entrega_eq.create
int iCurrent
call super::create
this.st_pesos=create st_pesos
this.em_perdida_mat=create em_perdida_mat
this.cbx_perdida_mat=create cbx_perdida_mat
this.cbx_intercambio=create cbx_intercambio
this.dw_solicitud=create dw_solicitud
this.sle_cuenta=create sle_cuenta
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_cerrar=create cb_cerrar
this.cb_actualiza=create cb_actualiza
this.dw_interesado=create dw_interesado
this.dw_matdisp=create dw_matdisp
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_pesos
this.Control[iCurrent+2]=this.em_perdida_mat
this.Control[iCurrent+3]=this.cbx_perdida_mat
this.Control[iCurrent+4]=this.cbx_intercambio
this.Control[iCurrent+5]=this.dw_solicitud
this.Control[iCurrent+6]=this.sle_cuenta
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.rb_1
this.Control[iCurrent+9]=this.cb_cerrar
this.Control[iCurrent+10]=this.cb_actualiza
this.Control[iCurrent+11]=this.dw_interesado
this.Control[iCurrent+12]=this.dw_matdisp
this.Control[iCurrent+13]=this.gb_1
end on

on w_adm_entrega_eq.destroy
call super::destroy
destroy(this.st_pesos)
destroy(this.em_perdida_mat)
destroy(this.cbx_perdida_mat)
destroy(this.cbx_intercambio)
destroy(this.dw_solicitud)
destroy(this.sle_cuenta)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_cerrar)
destroy(this.cb_actualiza)
destroy(this.dw_interesado)
destroy(this.dw_matdisp)
destroy(this.gb_1)
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

em_perdida_mat.text = ''
em_perdida_mat.visible = false
em_perdida_mat.enabled = false
st_pesos.visible = false
dw_interesado.setTransObject(gtr_sumuia)
dw_solicitud.setTransObject(gtr_sumuia)
dw_interesado.triggerevent("pfc_InsertRow")


end event

event activate;call super::activate;//////////////////////////////////////////////////////////////////////////////
//	Event:			activate
//	Arguments:		Ninguno
//	Returns:			pbm_activate
//	Description:	Permite asignar la clave y el tipo de solicitante
//////////////////////////////////////////////////////////////////////////////
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
end if
end event

event closequery;call super::closequery;if ( dw_matdisp.modifiedcount() >0  or dw_matdisp.modifiedcount() >0 ) then
	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
		cb_actualiza.triggerevent(clicked!)
	end if
end if	

end event

type st_pesos from statictext within w_adm_entrega_eq
boolean visible = false
integer x = 1971
integer y = 301
integer width = 48
integer height = 83
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "$"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_perdida_mat from editmask within w_adm_entrega_eq
boolean visible = false
integer x = 2044
integer y = 288
integer width = 344
integer height = 99
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type cbx_perdida_mat from checkbox within w_adm_entrega_eq
boolean visible = false
integer x = 1971
integer y = 189
integer width = 636
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 29534863
string text = "Perdida de material"
end type

event clicked;if this.checked then
	em_perdida_mat.visible = true
	em_perdida_mat.enabled = true
	st_pesos.visible = true
	setfocus(em_perdida_mat)
else
	em_perdida_mat.text = ''
	em_perdida_mat.visible = false
	em_perdida_mat.enabled = false
	st_pesos.visible = false
end if
end event

type cbx_intercambio from checkbox within w_adm_entrega_eq
integer x = 102
integer y = 282
integer width = 399
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
boolean righttoleft = true
end type

event clicked;sle_cuenta.setfocus()
end event

type dw_solicitud from u_dw within w_adm_entrega_eq
integer x = 91
integer y = 960
integer width = 2000
integer height = 355
integer taborder = 30
string dataobject = "d_adm_sol_act"
boolean border = false
end type

event rowfocuschanged;call super::rowfocuschanged;long llFolio
string lsCveMat
if currentrow >0 then
	selectrow(0,false)
	selectrow(currentrow,true)
	dw_matdisp.Reset()
	llFolio = dw_solicitud.getitemnumber(  currentrow, 'spre_solicitud_folio')	
	ii_status= dw_solicitud.getitemnumber(  currentrow, 'spre_solicitud_status')
	ilRowSol = currentrow
	IF dw_matdisp.Retrieve(gi_depto,gi_area,llFolio) = -1 THEN
		MessageBox("Error","Se encontro un error al consultar el material")
	ELSE
		wf_cambia_estatus(llFolio, currentrow)
		
	END IF
else
	selectrow(0,false)
end if
end event

event itemchanged;call super::itemchanged;integer i, Net
integer Depto,Grupo,Area
string CveMat, NumSerie
if dwo.name='spre_solicitud_status' then
	CHOOSE CASE long(data)
		CASE 1
			Net = MessageBox("Mensaje del sistema ","Se cambiara el estatus a los materiales incluidos en la solicitud.~n ¿Desea continuar?", &
							Question!, yesno!, 2)
			if Net = 1 then				
				for i=1 to dw_matdisp.rowcount()
					if dw_matdisp.getitemnumber(i,'spre_sol_materiales_status') <> 1 then dw_matdisp.setitem(i,'spre_sol_materiales_status',1)
					// 	Se agrega este codigo para actualizar el status del material al ser
					//		actualizado el status a "entregado"
						Depto = dw_matdisp.getItemNumber(i, 'spre_sol_materiales_cvedepto')
						Area 	= dw_matdisp.getItemNumber(i, 'spre_sol_materiales_cvearea')
						CveMat = dw_matdisp.getItemString(i, 'spre_sol_materiales_cvematerial')
						Grupo  = dw_matdisp.getItemNumber(i, 'spre_sol_materiales_cvegrupo')
						NumSerie = dw_matdisp.getItemString(i, 'spre_sol_materiales_num_serie')
						UPDATE dbo.spre_inventario  
						SET dbo.spre_inventario.stauts = 1 
						WHERE ( dbo.spre_inventario.cvedepto = :Depto ) AND  
								( dbo.spre_inventario.cvearea = :Area ) AND  
								( dbo.spre_inventario.cvematerial = :CveMat ) AND 
								( dbo.spre_inventario.cvegrupo = :Grupo ) AND
								( dbo.spre_inventario.num_serie = :NumSerie ) 
						using gtr_sumuia;
						commit using gtr_sumuia;
					// -----
					
				next	
			end if
					
	END CHOOSE
end if
end event

type sle_cuenta from singlelineedit within w_adm_entrega_eq
event activarbusq ( )
integer x = 388
integer y = 189
integer width = 307
integer height = 77
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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
			dw_interesado.retrieve(il_cuenta)
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
			dw_interesado.retrieve(long(ll_cuentab))
			ll_RowsPrestamo =dw_interesado.rowcount()
		else
			sle_cuenta.text=""
			messagebox("Atención","La cuenta: "+ls_cuenta+" no existe o es incorrecta ")	
		end if
		
	else	
			ls_cuenta= trim(sle_cuenta.text)
			ll_cuentab=long(ls_cuenta)
			dw_interesado.retrieve(long(ls_cuenta))
			ll_RowsPrestamo =dw_interesado.rowcount()
	end if
	if ll_RowsPrestamo >0 then
		dw_solicitud.retrieve(long(ll_cuentab))
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

type rb_2 from radiobutton within w_adm_entrega_eq
integer x = 102
integer y = 426
integer width = 362
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
sle_cuenta.setfocus()
dw_interesado.reset()
dw_solicitud.reset()
dw_matdisp.reset()

end event

type rb_1 from radiobutton within w_adm_entrega_eq
integer x = 102
integer y = 195
integer width = 362
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
sle_cuenta.text = ""
sle_cuenta.setfocus()
dw_interesado.reset()
dw_solicitud.reset()
dw_matdisp.reset()

end event

type cb_cerrar from commandbutton within w_adm_entrega_eq
integer x = 2842
integer y = 1725
integer width = 322
integer height = 106
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Salir"
end type

event clicked;close(parent)
end event

type cb_actualiza from commandbutton within w_adm_entrega_eq
integer x = 2458
integer y = 1725
integer width = 322
integer height = 106
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Actualizar"
end type

event clicked;date ldFechaEntrega
integer liDiasRestraso
long llMaxFolio, llRow, llEstatus
string lsUpdate, lsTUpdate, lsCveMaterial, lsNoSerie= ''


		if dw_solicitud.update()>0 then
			commit using gtr_sumuia;
			if dw_matdisp.update()>0 then
				commit using gtr_sumuia;
					for llRow = 1 to dw_matdisp.RowCount()
						lsNoSerie = dw_matdisp.getitemstring(llRow,'spre_sol_materiales_num_serie')
						lsCveMaterial = dw_matdisp.getitemstring(llRow,'spre_sol_materiales_cvematerial')
						llEstatus = dw_matdisp.getitemnumber(llRow,'spre_sol_materiales_status')
						ldFechaEntrega = Date(dw_matdisp.GetItemDateTime(llRow,'spre_sol_materiales_fecha_inicio'))
						choose case llEstatus
							case 1
								liDiasRestraso = DaysAfter(ldFechaEntrega, today()) 
								UPDATE dbo.spre_inventario  
								SET dbo.spre_inventario.stauts = :llEstatus,
									dbo.spre_inventario.tiempo_prestamo= dbo.spre_inventario.tiempo_prestamo + :liDiasRestraso
								WHERE ( dbo.spre_inventario.cvedepto = :gi_depto ) AND  
										( dbo.spre_inventario.cvearea = :gi_area ) AND  
										( dbo.spre_inventario.cvematerial = :lsCveMaterial ) AND  
										( dbo.spre_inventario.num_serie = :lsNoSerie ) 
								using gtr_sumuia;
								commit using gtr_sumuia;
						end choose						
					next
					messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
				else
					rollback using gtr_sumuia;
					messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
				end if
			else
				rollback using gtr_sumuia;
				messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
			end if
	
end event

type dw_interesado from u_dw within w_adm_entrega_eq
integer x = 106
integer y = 531
integer width = 2597
integer height = 394
integer taborder = 30
string dataobject = "d_adm_info_sol"
boolean border = false
end type

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

type dw_matdisp from u_dw within w_adm_entrega_eq
integer x = 91
integer y = 1370
integer width = 3215
integer height = 269
integer taborder = 20
string dataobject = "d_adm_mat_prestado"
boolean border = false
end type

event clicked;call super::clicked;
if this.isselected( row) = true then 
 this.selectrow( row,false) 
else
 this.selectrow( row,true) 
end if
ii_status=this.getitemnumber(1,'spre_sol_materiales_status')

ii_depto		= this.getitemnumber(1,'spre_sol_materiales_cvedepto')
ii_area		= this.getitemnumber(1,'spre_sol_materiales_cvearea')
isCveMaterial 	= this.getitemstring(1,'spre_sol_materiales_cvematerial')
ii_grupo 	= this.getitemnumber(1,'spre_sol_materiales_cvegrupo')
isNoSerie 	= this.getitemstring(1,'spre_sol_materiales_num_serie')
end event

event constructor;call super::constructor;this.setTransObject(gtr_sumuia)
this.ib_rmbmenu = FALSE
this.of_SetRowManager(TRUE)
this.of_SetSort(TRUE)
this.of_SetProperty(TRUE)
this.inv_sort.of_SetColumnHeader(TRUE)
end event

event itemchanged;call super::itemchanged;decimal leMontoatraso
integer i, liStatusM, Net
long llRow, llMaxFolio, llNoFolio, llGpoMat, ll_sqlcode, llMaxFolioDet
string lsNoSerie, lsCveMat
datetime ldt_actual

integer li_row, Depto,Grupo,Area
string CveMat,NumSerie

ldt_actual=DateTime(today(),now())

if dwo.name='spre_sol_materiales_status' then
	CHOOSE CASE long(data)
		CASE 1 // Selecciona entregado
			
			if IsNull(this.GetItemDateTime(row,"spre_sol_materiales_fecha_entrega")) then this.SetItem(row,"spre_sol_materiales_fecha_entrega",ldt_actual)
			
			CHOOSE CASE ii_status
				
				CASE 3	//Tenia multa, para permitir la entrega se valida el estatus de la multa en caso de que no se haya pagado se entrega y avisa al usuario
					lsNoSerie = dw_matdisp.getitemstring(row, 'spre_sol_materiales_num_serie')
					lsCveMat = dw_matdisp.getitemstring(row, 'spre_sol_materiales_cvematerial')	
					llGpoMat = dw_matdisp.getitemnumber(row, 'spre_sol_materiales_cvegrupo')	
						SELECT dbo.spre_materiales_multas.status,   
								dbo.spre_materiales_multas.importe  
						INTO  :liStatusM,
								:leMontoatraso
						FROM dbo.spre_materiales_multas  
						WHERE ( dbo.spre_materiales_multas.cvedepto = :gi_depto ) AND  
								( dbo.spre_materiales_multas.cvearea = :gi_area ) AND  
								( dbo.spre_materiales_multas.cvegrupo = :llGpoMat  ) AND  
								( dbo.spre_materiales_multas.cvematerial =:lsCveMat  ) AND  
								( dbo.spre_materiales_multas.num_serie =:lsNoSerie  ) 
						USING gtr_sumuia;
					if liStatusM = 0 then Net = MessageBox("Mensaje del sistema ","El material seleccionado tiene una multa generada por: " + string(leMontoatraso, "$#,##0") +"~n y no la pagado ¿Desea continuar?", &
							Exclamation!, OKCancel!, 2)

						IF Net = 1 THEN
						
						  this.setitem(row,'spre_sol_materiales_status',1)
						
						ELSE
						
						 this.setitem(row,'spre_sol_materiales_status',3)
						
						END IF
					
			END CHOOSE		
					
	END CHOOSE
end if
end event

type gb_1 from groupbox within w_adm_entrega_eq
integer x = 55
integer y = 115
integer width = 2714
integer height = 835
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Consultar"
end type

