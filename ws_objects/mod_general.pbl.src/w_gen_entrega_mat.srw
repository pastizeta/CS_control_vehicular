$PBExportHeader$w_gen_entrega_mat.srw
$PBExportComments$Permite realizar la entrega de materiales
forward
global type w_gen_entrega_mat from w_sheet
end type
type ole_1 from olecustomcontrol within w_gen_entrega_mat
end type
type cbx_intercambio from checkbox within w_gen_entrega_mat
end type
type st_1 from statictext within w_gen_entrega_mat
end type
type dw_solicitud from u_dw within w_gen_entrega_mat
end type
type sle_cuenta from singlelineedit within w_gen_entrega_mat
end type
type rb_2 from radiobutton within w_gen_entrega_mat
end type
type rb_1 from radiobutton within w_gen_entrega_mat
end type
type cb_cerrar from commandbutton within w_gen_entrega_mat
end type
type cb_actualiza from commandbutton within w_gen_entrega_mat
end type
type dw_interesado from u_dw within w_gen_entrega_mat
end type
type dw_matdisp from u_dw within w_gen_entrega_mat
end type
type gb_1 from groupbox within w_gen_entrega_mat
end type
end forward

global type w_gen_entrega_mat from w_sheet
integer x = 214
integer width = 3405
integer height = 1888
string title = "Recepción material"
long backcolor = 29534863
ole_1 ole_1
cbx_intercambio cbx_intercambio
st_1 st_1
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
global w_gen_entrega_mat w_gen_entrega_mat

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
end variables

forward prototypes
public subroutine wf_limpia_forma ()
public function n_transportar wf_busca_empleado (integer al_nomina)
public function boolean wf_cambia_estatus (long agrlfolio, long argrow)
public function string wf_busca_alumno_dca1 (long al_cuenta)
public function string wf_busca_alumno (long al_cuenta)
public subroutine wf_verifica_estatus ()
end prototypes

public subroutine wf_limpia_forma ();dw_matdisp.Reset()
dw_interesado.Reset()
dw_solicitud.Reset()
dw_interesado.triggerevent("pfc_InsertRow")

end subroutine

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

public function boolean wf_cambia_estatus (long agrlfolio, long argrow);//////////////////////////////////////////////////////////////////////////
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

public function string wf_busca_alumno_dca1 (long al_cuenta);
string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
integer liAnio, liPeriodo, li_mes
boolean lb_error=true
liAnio = Year(Today())

li_mes =	integer(string(today(),'m'))

CHOOSE CASE li_mes
	CASE 1,2,3,4,5
		liPeriodo = 0
		
	CASE 6,7
		liPeriodo = 1
		
	CASE 8,9,10,11,12
		liPeriodo = 2
		
END CHOOSE


  SELECT dbo.dca_alumnos_ext.no_folio_inter,   
         dbo.dca_alumnos_ext.s_lastname+' '+ dbo.dca_alumnos_ext.s_name as nombre_completo,
			dbo.dca_alumnos_ext.major
  INTO :ll_cuenta_inscrito, :ls_nombrecompleto, :ls_carrera
    FROM dbo.dca_alumnos_ext,   
         dbo.dcaPeriodoEstancia  
   WHERE ( dbo.dca_alumnos_ext.no_folio_inter = dbo.dcaPeriodoEstancia.noFolioCuenta ) AND
			  ( dbo.dca_alumnos_ext.no_folio_inter = :al_cuenta ) AND
         ( dbo.dcaPeriodoEstancia.anio = :liAnio ) AND
         ( dbo.dcaPeriodoEstancia.periodo = :liPeriodo )  
	using gtr_sumuia;
	
	if gtr_sumuia.sqlcode=100 then
		if  isnull(ll_cuenta_inscrito) or (ll_cuenta_inscrito = 0) then
			messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
			sle_cuenta.text=""
			wf_limpia_forma()
		end if
	elseif gtr_sumuia.sqlcode=0 then
		if  isnull(ll_cuenta_inscrito) or (ll_cuenta_inscrito = 0) then
			messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
			sle_cuenta.text=""
			wf_limpia_forma()
		else
			if ls_carrera = 'PSICOLOGÍA' then
//				wf_carga_foto(long(ll_cuenta_inscrito),2)
			else
				messagebox("Mensaje del Sistema","Alumno NO inscrito en el area",stopsign!)
//				wf_carga_foto(long(ll_cuenta_inscrito),2)
			end if
		end if
	else
		IF gtr_sumuia.SQLCode = -1 THEN 
			MessageBox("SQL error", gtr_sumuia.SQLErrText)
		END IF
	end if			

return ls_nombrecompleto
end function

public function string wf_busca_alumno (long al_cuenta);string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
boolean lb_error=true
if isvalid(ids_MatAlmn) then
	destroy ids_MatAlmn
	ids_MatAlmn =  create datastore 
	ids_MatAlmn.dataobject ='d_com_matinsc'
	ids_MatAlmn.settransobject(gtr_sumuia)
else
		ids_MatAlmn =  create datastore 
		ids_MatAlmn.dataobject ='d_com_matinsc'
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
	FROM         v_sce_alumnos INNER JOIN
                      v_sce_academicos ON v_sce_alumnos.cuenta = v_sce_academicos.cuenta INNER JOIN
                      v_sce_carreras ON v_sce_academicos.cve_carrera = v_sce_carreras.cve_carrera LEFT OUTER JOIN
                      v_sce_banderas_inscrito ON v_sce_alumnos.cuenta = v_sce_banderas_inscrito.cuenta
	   WHERE v_sce_alumnos.cuenta = :al_cuenta  and 
		v_sce_carreras.cve_carrera in (select cve_carrera from v_sce_carreras  where cve_coordinacion in (select cve_coordinacion from v_sce_coordinaciones where cve_depto = 1300))using gtr_sumuia;
		if gtr_sumuia.sqlcode=0 then
			//TODO OK
			if  isnull(ll_cuenta_inscrito) then
				messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
			else
				ids_MatAlmn.retrieve(ll_cuenta_inscrito)
			end if
			
		else
			messagebox("Mensaje del Sistema","Alumno NO inscrito en el area",stopsign!)

		end if			
	end if
return ls_nombrecompleto
end function

public subroutine wf_verifica_estatus ();//////////////////////////////////////////////////////////////////////////
//	Function:		wf_verifica_estatus
//	Arguments:		ninguno
//	Returns:			true
//	Description:	Verifica el estatus del material solicitado en el caso de
//						haber un retraso asigna la multa correspondiente e inserta 
//						en la base de datos el registro. Aquí no se asigna el total 
//						días que se presto el material debido a que posible no se 
//						entregue el material
//////////////////////////////////////////////////////////////////////////
boolean lbRetraso = false
date ldFechaEntrega, ldSumDia
decimal leTotal, leMontoatraso, leTotMontoatraso
integer liDiasRestraso, liTotDiasRestraso, liDiasRestrasoT
long llRow, llMaxFolio, llNoFolio, llGpoMat, ll_sqlcode, llMaxFolioDet, llCount
string lsNoSerie, lsCveMat, lsDiaNom, ls_sqlerr
setnull(llMaxFolio)	

if dw_matdisp.rowcount() <= 0 then return
for llRow = 1 to dw_matdisp.rowcount()
	ldFechaEntrega = Date(dw_matdisp.GetItemDateTime(llRow,'spre_sol_materiales_fecha_final'))
	liDiasRestrasoT = DaysAfter(ldFechaEntrega, today()) 
	ldSumDia = ldFechaEntrega
	liDiasRestraso = 0
	For llCount = 1 to liDiasRestrasoT 		
		lsDiaNom = DayName(ldSumDia)
		If lsDiaNom <> "Saturday" and lsDiaNom <> "Sunday" Then	
			liDiasRestraso = liDiasRestraso +1
		end if
		ldSumDia = RelativeDate(ldSumDia, 1)
	Next
	if liDiasRestraso > 0 then			
		dw_matdisp.SetItem(llRow, 'spre_sol_materiales_status', 3)	
		lbRetraso = true
		llNoFolio = dw_matdisp.getitemnumber(llRow, 'spre_sol_materiales_folio')	
		leTotal = dw_matdisp.getitemnumber(llRow, 'spre_materiales_multa')	
		liTotDiasRestraso = liTotDiasRestraso + liDiasRestraso
		leMontoatraso= (liDiasRestraso * leTotal)
		leTotMontoatraso = leTotMontoatraso + leMontoatraso
	end if
	
next

if not lbRetraso then return
			
//Se consulta si el folio tiene una multa cargada
SELECT dbo.spre_multas.folio_multa  
into :llMaxFolio
FROM dbo.spre_multas  
WHERE ( dbo.spre_multas.folio = :llNoFolio ) AND  
			( dbo.spre_multas.cvedepto = :gi_depto )  
USING gtr_sumuia; 
				
if not isnull(llMaxFolio) then return

// No hay multa cargada se procede a preguntar
			
integer Net
Net = MessageBox("Información de adeudos", "La solicitud con folio: "+ string(llNoFolio)+ " presenta un adeudo de: " &
						+ String(leTotMontoatraso,"$#,###,##0.00") +&
						"~n ¿Desea cargar el adeudo ahora o esperar hasta la entrega del material?", &
						Exclamation!, OKCancel!, 2)
If Net <> 1 then return	

//se trae el maximo folio
SELECT max(dbo.spre_multas.folio_multa)
into :llMaxFolio
FROM dbo.spre_multas  
USING gtr_sumuia;		
if isnull(llMaxFolio) then 
	llMaxFolio =1	
ELSE
	llMaxFolio =1	+ llMaxFolio		
end if
						
// Se inserta la multa
INSERT INTO dbo.spre_multas  
( folio_multa,   
  folio,   
  importe,   
  saldo,   
  cvedepto,
  fcaja,
  foperacion,
  fcorte,
  fechacarga,
  usuario)  
VALUES ( :llMaxFolio,   
  :llNoFolio,   
  :leTotMontoatraso,   
  :leTotMontoatraso,   
  :gi_depto,
  0,
  0,
  0,
  getdate(),
  :gs_usuario)
  USING gtr_sumuia; 
if gtr_sumuia.sqlcode < 0 then
	messagebox("Error","Error al insertar multa, avise a sistemas del error.",stopsign!)
	return
end if
 // Se consulta maximo folio para insertar el detalles de la multa
SELECT max(dbo.spre_materiales_multas.id_multa)
into :llMaxFolioDet
FROM dbo.spre_materiales_multas 
USING gtr_sumuia;	
if isnull(llMaxFolioDet) then 
	llMaxFolioDet =1	
else
	llMaxFolioDet =1	+ llMaxFolioDet		
end if 
							
for llRow = 1 to dw_matdisp.rowcount()
								
	ldFechaEntrega = Date(dw_matdisp.GetItemDateTime(llRow,'spre_sol_materiales_fecha_final'))
	liDiasRestrasoT = DaysAfter(ldFechaEntrega, today()) 
	ldSumDia = ldFechaEntrega
	liDiasRestraso = 0
	For llCount = 1 to liDiasRestrasoT 		
		lsDiaNom = DayName(ldSumDia)
		If lsDiaNom <> "Saturday" and lsDiaNom <> "Sunday" Then	
			liDiasRestraso = liDiasRestraso +1
		end if
		ldSumDia = RelativeDate(ldSumDia, 1)
	Next
	if liDiasRestraso > 0 then	
		lsNoSerie = dw_matdisp.getitemstring(llRow, 'spre_sol_materiales_num_serie')
		lsCveMat = dw_matdisp.getitemstring(llRow, 'spre_sol_materiales_cvematerial')	
		llGpoMat = dw_matdisp.getitemnumber(llRow, 'spre_sol_materiales_cvegrupo')	
		leTotal = dw_matdisp.getitemnumber(llRow, 'spre_materiales_multa')	
		leMontoatraso= (liDiasRestraso * leTotal)
		INSERT INTO dbo.spre_materiales_multas  
			( id_multa,
				folio_multa,   
				cvedepto,   
				cvearea,   
				cvematerial,   
				cvegrupo,   
				num_serie,   
				status,   
				importe)  
		VALUES (:llMaxFolioDet, 
				:llMaxFolio,   
				:gi_depto,   
				:gi_area,   
				:lsCveMat,   
				:llGpoMat,   
				:lsNoSerie,   
				0,   
				:leMontoatraso)  
				USING gtr_sumuia;	
		if gtr_sumuia.sqlcode < 0 then
			ls_sqlerr	=	gtr_sumuia.sqlerrtext
			rollback using gtr_sumuia;
			if isnull(lsCveMat) then lsCveMat = '?'
			MessageBox('1Error Insertando la multa del material: ',lsCveMat+'~n'+ls_sqlerr,StopSign!)
			return
		end if
		llMaxFolioDet = llMaxFolioDet+ 1
	end if
next
Commit Using gtr_sumuia;


	




end subroutine

on w_gen_entrega_mat.create
int iCurrent
call super::create
this.ole_1=create ole_1
this.cbx_intercambio=create cbx_intercambio
this.st_1=create st_1
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
this.Control[iCurrent+1]=this.ole_1
this.Control[iCurrent+2]=this.cbx_intercambio
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_solicitud
this.Control[iCurrent+5]=this.sle_cuenta
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.cb_cerrar
this.Control[iCurrent+9]=this.cb_actualiza
this.Control[iCurrent+10]=this.dw_interesado
this.Control[iCurrent+11]=this.dw_matdisp
this.Control[iCurrent+12]=this.gb_1
end on

on w_gen_entrega_mat.destroy
call super::destroy
destroy(this.ole_1)
destroy(this.cbx_intercambio)
destroy(this.st_1)
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
dw_interesado.setTransObject(gtr_sumuia)
dw_solicitud.setTransObject(gtr_sumuia)
dw_interesado.triggerevent("pfc_InsertRow")

timer(1.5)

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
end if
*/

timer(1.5)
end event

event closequery;call super::closequery;if ( dw_matdisp.modifiedcount() >0  or dw_matdisp.modifiedcount() >0 ) then
	if (messagebox("Mesaje del sistema","Se han realizado cambios, Desea guardarlos?",Question!,YesNo!)) =1 then
		cb_actualiza.triggerevent(clicked!)
	end if
end if	

end event

event timer;call super::timer;
string a="", ls_nomina = "", ls_mensaje = ""
integer li_inicializa = 0

long ll_cuenta

IF this.windowstate = minimized! then
	If gs_lector_activ = "1" Then
		li_inicializa = ole_1.object.inicializa()
	End If
	timer (0)
ELSE
	If gs_lector_activ = "1" Then
		// 14-03-11. Lector de Chip sin contacto
		li_inicializa = ole_1.object.inicializa()
	End If
	
//	if li_inicializa = 0 Then	
//		timer (0)
//	Else
		If gs_lector_activ = "1" Then
			a=ole_1.object.LeerChipcl()
			ole_1.object.quit()
		Else 
			//	TEMPORAL
//			a = "6B6CBEAF"
			timer (0)
		End If


	
		//if a <> "" then
		if a <> "0" AND a <> ""  then
		
			// Se busca el chip de la credencial, si es profesor
			If rb_2.checked Then 
				Select convert(varchar(20), empleado) as nomina
				Into :ls_nomina
				From empl_uia2   
				Where templ < 20 And tnom in (0,1,2,3)  
				And nchip_cl = :a
				Using gtr_personal;
				
				if gtr_personal.sqlcode=0 then
					sle_cuenta.text = ls_nomina
				Else
					ls_mensaje = "El número de nómina asignado a la credencial, ya no pertenece a la Comunidad."
				end if

			End If
			
			// Se busca el chip de la credencial, si es alumno
			If rb_1.checked Then 
				If cbx_intercambio.checked Then
					//Messagebox("Aviso","La cuenta de los alumnos de intercambio, deberán ser ingresada directamente en el campo de cuenta.")
					select                   convert(varchar(20), no_folio_inter) as cuenta
					into                       :ls_nomina
					from                     dca_alumnos_ext
					where  nchip_cl = :a
					Using gtr_sumuia;
					
					if gtr_sumuia.sqlcode=0 then
						sle_cuenta.text = ls_nomina
					Else
						ls_mensaje = "El número de cuenta del alumno de intercambio asignado a la credencial, no es válido."
					end if
					
				Else
					SELECT convert(varchar(20), A.cuenta) + D.digito as cuenta
					Into :ls_nomina
					FROM v_sce_alumnos A INNER JOIN v_sce_alumno_digito D ON A.cuenta = D.cuenta
					WHERE A.nchip_cl = :a
					Using gtr_sumuia;
						
					if gtr_sumuia.sqlcode=0 then
						sle_cuenta.text = ls_nomina
					Else
						ls_mensaje = "El número de cuenta del alumno asignado a la credencial, no es válido."
					end if

				End If
			End if 
			
			wf_limpia_forma()
			
			if (gtr_personal.sqlcode=0 or gtr_sumuia.sqlcode=0) and ls_nomina <> '' then
				commit using gtr_personal;
				setpointer(Hourglass!)
				sle_cuenta.triggerevent( "activarbusq")
				setpointer(Arrow!)		
			Else
				commit using gtr_personal;
				Messagebox("Aviso",ls_mensaje)
			end if

		end if
//	end if		
END IF



end event

event deactivate;call super::deactivate;timer(0)
end event

type ole_1 from olecustomcontrol within w_gen_entrega_mat
boolean visible = false
integer x = 2136
integer y = 960
integer width = 1002
integer height = 96
integer taborder = 40
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_gen_entrega_mat.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type cbx_intercambio from checkbox within w_gen_entrega_mat
integer x = 102
integer y = 157
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Intercambio"
end type

type st_1 from statictext within w_gen_entrega_mat
integer x = 600
integer y = 58
integer width = 238
integer height = 58
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Cuenta:"
boolean focusrectangle = false
end type

type dw_solicitud from u_dw within w_gen_entrega_mat
integer x = 55
integer y = 851
integer width = 2000
integer height = 355
integer taborder = 30
string dataobject = "d_gen_sol_act"
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
		MessageBox("Error","Se encontro un error al consultar el material"+gtr_sumuia.SQLErrText)
	ELSE
		wf_verifica_estatus()
		wf_cambia_estatus(llFolio, currentrow)
		
	END IF
else
	selectrow(0,false)
end if
end event

event itemchanged;call super::itemchanged;integer	i
string		ls_status
datetime	ldt_actual

ldt_actual=DateTime(today(),now())

if dwo.name='spre_solicitud_status' then
	CHOOSE CASE long(data)
		CASE 1
			for i=1 to dw_matdisp.rowcount()
				if dw_matdisp.getitemnumber(i,'spre_sol_materiales_status') = 0 or dw_matdisp.getitemnumber(i,'spre_sol_materiales_status') = 3 then dw_matdisp.setitem(i,'spre_sol_materiales_status',1)
				if IsNull(dw_matdisp.GetItemDateTime(i,"spre_sol_materiales_fecha_entrega")) then dw_matdisp.SetItem(i,"spre_sol_materiales_fecha_entrega",ldt_actual)
			next
		//No se permite elegir manualmente otro estatus
	CASE 3
		messagebox("Aviso","Este estatus no se puede especificar manualmente",stopsign!)
		ls_status	=	describe("evaluate('lookupdisplay(spre_solicitud_status)',"+string(row)+")")
		settext(ls_status)
		return 2
	END CHOOSE
end if
end event

type sle_cuenta from singlelineedit within w_gen_entrega_mat
event activarbusq ( )
integer x = 841
integer y = 51
integer width = 399
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
		if match(trim(sle_cuenta.text),'-')= true then
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
			dw_interesado.retrieve(long(ll_cuentab),gi_depto,gi_area)
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
		//nva lineaSFF 26092011
		timer(1.5)
	END IF
end if



end event

type rb_2 from radiobutton within w_gen_entrega_mat
integer x = 102
integer y = 266
integer width = 402
integer height = 61
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Profesor"
end type

event clicked;st_1.text = 'Clave:'
end event

type rb_1 from radiobutton within w_gen_entrega_mat
integer x = 102
integer y = 67
integer width = 402
integer height = 61
integer textsize = -10
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

event clicked;st_1.text = 'Cuenta:'
end event

type cb_cerrar from commandbutton within w_gen_entrega_mat
integer x = 2838
integer y = 1642
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

type cb_actualiza from commandbutton within w_gen_entrega_mat
integer x = 2414
integer y = 1642
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
string text = "&Actualizar"
end type

event clicked;date ldFechaEntrega
integer liDiasRestraso
long llMaxFolio, llRow, llEstatus
string lsUpdate, lsTUpdate, lsCveMaterial, lsNoSerie

if dw_solicitud.update(true,false)< 0 then
	rollback using gtr_sumuia;
	messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
	return
end if
if dw_matdisp.update(true,false) < 0 then
	rollback using gtr_sumuia;
	messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
	return
end if
			
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
				dbo.spre_inventario.tiempo_prestamo=:liDiasRestraso
			WHERE ( dbo.spre_inventario.cvedepto = :gi_depto ) AND  
					( dbo.spre_inventario.cvearea = :gi_area ) AND  
					( dbo.spre_inventario.cvematerial = :lsCveMaterial ) AND  
					( dbo.spre_inventario.num_serie = :lsNoSerie ) 
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
dw_matdisp.ResetUpdate()
messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
wf_limpia_forma()

end event

type dw_interesado from u_dw within w_gen_entrega_mat
integer x = 102
integer y = 339
integer width = 2597
integer height = 394
integer taborder = 30
string dataobject = "d_gen_info_sol"
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
/*
CHOOSE CASE dwo.name
	CASE 'solicitanteid'
		CHOOSE CASE this.getitemnumber(1,'tipo_prestamo')
			CASE 1
				this.setitem(1,'solicitantenombre',wf_busca_alumno(long(data)))
			
			CASE 2
				this.setitem(1,'solicitantenombre',wf_busca_alumno_dca1(long(data)))
			
			CASE 3
				uo_parametros=wf_busca_empleado(long(data))
				this.setitem(1,'solicitantenombre',uo_parametros.is_parm1)
				
		END CHOOSE


END CHOOSE
*/
end event

type dw_matdisp from u_dw within w_gen_entrega_mat
integer x = 51
integer y = 1235
integer width = 3280
integer height = 365
integer taborder = 20
string title = "aa"
string dataobject = "d_gen_mat_prestado"
boolean hscrollbar = true
boolean border = false
boolean hsplitscroll = true
end type

event clicked;call super::clicked;if row <= 0 then return
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
string lsNoSerie, lsCveMat, ls_status
datetime ldt_ahora,ldt_actual

ldt_actual=DateTime(today(),now())

if dwo.name='spre_sol_materiales_status' then
	CHOOSE CASE long(data)
		CASE 1 // Selecciona entregado

			if IsNull(this.GetItemDateTime(row,"spre_sol_materiales_fecha_entrega")) then this.SetItem(row,"spre_sol_materiales_fecha_entrega",ldt_actual)

			CHOOSE CASE getitemnumber(row,'spre_sol_materiales_status',primary!,true)
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
					if liStatusM = 0 then 
						Net = MessageBox("Mensaje del sistema ","El material seleccionado tiene una multa generada por: " + string(leMontoatraso, "$#,##0") +"~n y no la ha pagado ¿Desea continuar?", &
												Exclamation!, OKCancel!, 2)
						IF Net <> 1 THEN
							this. post setitem(row,'spre_sol_materiales_status',3)
						END IF
					end if
				END CHOOSE
		CASE 3
			messagebox("Aviso","El estatus de Multa no se puede especificar manualmente",stopsign!)
			ls_status	=	describe("evaluate('lookupdisplay(spre_sol_materiales_status)',"+string(row)+")")
			settext(ls_status)
			return 2						
		END CHOOSE
end if
end event

type gb_1 from groupbox within w_gen_entrega_mat
integer x = 55
integer width = 3251
integer height = 778
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Consultar"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Dw_gen_entrega_mat.bin 
2F00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000008827c90001ce8efa00000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe000000000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000004800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000452392cff41d0a9fca59122b62b36ca46000000008827c90001ce8efa8827c90001ce8efa00000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000b29300000048000800034757f20b000000200065005f00740078006e006500780074000016a8000800034757f20affffffe00065005f00740078006e0065007900740000027b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b29300000048000800034757f20b000000200065005f00740078006e006500780074000016a8000800034757f20affffffe00065005f00740078006e0065007900740000027b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000200000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Dw_gen_entrega_mat.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
