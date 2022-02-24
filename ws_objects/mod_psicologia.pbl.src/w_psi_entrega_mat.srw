$PBExportHeader$w_psi_entrega_mat.srw
$PBExportComments$Permite capturar los materiales a prestar
forward
global type w_psi_entrega_mat from w_gen_entrega_mat
end type
type rb_3 from radiobutton within w_psi_entrega_mat
end type
type rb_4 from radiobutton within w_psi_entrega_mat
end type
type gb_2 from groupbox within w_psi_entrega_mat
end type
end forward

global type w_psi_entrega_mat from w_gen_entrega_mat
rb_3 rb_3
rb_4 rb_4
gb_2 gb_2
end type
global w_psi_entrega_mat w_psi_entrega_mat

type variables
long il_cuenta

long il_cuentabus
integer il_tipo_usuario=1
end variables

on w_psi_entrega_mat.create
int iCurrent
call super::create
this.rb_3=create rb_3
this.rb_4=create rb_4
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_3
this.Control[iCurrent+2]=this.rb_4
this.Control[iCurrent+3]=this.gb_2
end on

on w_psi_entrega_mat.destroy
call super::destroy
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.gb_2)
end on

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

type ole_1 from w_gen_entrega_mat`ole_1 within w_psi_entrega_mat
integer x = 889
integer y = 1136
end type

type cbx_intercambio from w_gen_entrega_mat`cbx_intercambio within w_psi_entrega_mat
end type

event cbx_intercambio::clicked;call super::clicked;if rb_1.checked=true then
	if this.checked=true then 
		il_tipo_usuario=2 
	else 
		il_tipo_usuario=1
	end if
else
	this.checked=false
end if
end event

type st_1 from w_gen_entrega_mat`st_1 within w_psi_entrega_mat
end type

type dw_solicitud from w_gen_entrega_mat`dw_solicitud within w_psi_entrega_mat
end type

event dw_solicitud::itemchanged;call super::itemchanged;integer i, Net
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

type sle_cuenta from w_gen_entrega_mat`sle_cuenta within w_psi_entrega_mat
end type

event sle_cuenta::activarbusq;long ll_cuentab, ll_cuenta, ll_RowsPrestamo
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
//			dw_interesado.retrieve(long(ll_cuentab))
			dw_interesado.retrieve(long(ll_cuentab), gi_depto, gi_area)
			ll_RowsPrestamo =dw_interesado.rowcount()
		else
			sle_cuenta.text=""
			messagebox("Atención","La cuenta: "+ls_cuenta+" no existe o es incorrecta ")
			ll_cuentab=0
		end if
		
	else	
			ls_cuenta= trim(sle_cuenta.text)
			ll_cuentab=long(ls_cuenta)
			dw_interesado.retrieve(long(ls_cuenta), gi_depto, gi_area)
			ll_RowsPrestamo =dw_interesado.rowcount()
	end if
	if ll_RowsPrestamo >0 then
		dw_solicitud.retrieve(long(ll_cuentab), gi_depto, gi_area)
	else
		messagebox("Atención","La cuenta: "+sle_cuenta.text+" no tiene prestamos registrados en base de datos")	
		ll_cuentab=0
	end if
	
	
il_cuentabus=ll_cuentab	
end event

type rb_2 from w_gen_entrega_mat`rb_2 within w_psi_entrega_mat
end type

event rb_2::clicked;call super::clicked;il_tipo_usuario=0

cbx_intercambio.checked=false
end event

type rb_1 from w_gen_entrega_mat`rb_1 within w_psi_entrega_mat
end type

event rb_1::clicked;call super::clicked;if cbx_intercambio.checked=true then il_tipo_usuario=2 else il_tipo_usuario=1
end event

type cb_cerrar from w_gen_entrega_mat`cb_cerrar within w_psi_entrega_mat
end type

type cb_actualiza from w_gen_entrega_mat`cb_actualiza within w_psi_entrega_mat
end type

event cb_actualiza::clicked;call super::clicked;integer li_suspendido, li_dias_retraso, li_periodo, li_anio

f_select_anio_periodo_actual(li_periodo,li_anio,today())

li_suspendido=f_select_psi_solicitante_bloqueado(gi_depto,gi_area,li_anio, li_periodo,il_cuentabus,il_tipo_usuario)

if li_suspendido=0 then
	
	li_dias_retraso=f_select_psi_solicitante_retraso(gi_depto,gi_area,li_anio, li_periodo,il_cuentabus)
	
	if li_dias_retraso>40 then
		f_insert_psi_solicitante_bloqueado(gi_depto,gi_area,li_anio, li_periodo,il_cuentabus,il_tipo_usuario)
		messagebox("Atención","El usuario excedió los días de retraso permitidos al entregar material, el servicio de reservación queda suspendido.",exclamation!)
		return -1
	end if

else
	
	messagebox("Atención","El usuario excedió los días de retraso permitidos al entregar material, el servicio de reservación queda suspendido.",exclamation!)
	return -1

end if

end event

type dw_interesado from w_gen_entrega_mat`dw_interesado within w_psi_entrega_mat
end type

type dw_matdisp from w_gen_entrega_mat`dw_matdisp within w_psi_entrega_mat
end type

event dw_matdisp::itemchanged;decimal leMontoatraso
integer i, liStatusM, Net
long llRow, llMaxFolio, llNoFolio, llGpoMat, ll_sqlcode, llMaxFolioDet
string lsNoSerie, lsCveMat
datetime ldt_actual

integer li_row, Depto,Grupo,Area
string CveMat,NumSerie

ldt_actual=DateTime(today(),now())

//ldFechaEntrega = Date(dw_matdisp.GetItemDateTime(llRow,'spre_sol_materiales_fecha_final'))
//		liDiasRestrasoT = DaysAfter(ldFechaEntrega, today()) 
//		ldSumDia = ldFechaEntrega
//		liDiasRestraso = 0
//		For llCount = 1 to liDiasRestrasoT 		
//			lsDiaNom = DayName(ldSumDia)
//			If lsDiaNom <> "Saturday" and lsDiaNom <> "Sunday" Then	
//				liDiasRestraso = liDiasRestraso +1
//			end if
//			ldSumDia = RelativeDate(ldSumDia, 1)
//		Next
//		if liDiasRestraso > 0 then			
//			dw_matdisp.SetItem(llRow, 'spre_sol_materiales_status', 3)	
//			lbRetraso = true
//			llNoFolio = dw_matdisp.getitemnumber(llRow, 'spre_sol_materiales_folio')	
//			leTotal = dw_matdisp.getitemnumber(llRow, 'spre_materiales_multa')	
//			liTotDiasRestraso = liTotDiasRestraso + liDiasRestraso
//			leMontoatraso= (liDiasRestraso * leTotal)
//			leTotMontoatraso = leTotMontoatraso + leMontoatraso
//		end if

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
			
		CASE 3
			
			//Multa
			
			if IsNull(this.GetItemDateTime(row,"spre_sol_materiales_fecha_entrega")) then this.SetItem(row,"spre_sol_materiales_fecha_entrega",ldt_actual)
					
	END CHOOSE
	
	
end if
end event

type gb_1 from w_gen_entrega_mat`gb_1 within w_psi_entrega_mat
end type

type rb_3 from radiobutton within w_psi_entrega_mat
integer x = 2725
integer y = 899
integer width = 322
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 29534863
string text = "Solicitud"
end type

event clicked;integer i, Net, li_row, li_DiasPrestamo
boolean lb_ok = false
datetime ldFechaentrega, ldFechaRenovacion

if dw_solicitud.RowCount() > 0  then
	
	ldFechaentrega = dw_solicitud.GetItemDateTime(ilRowSol,"fecha_fin")
	Net = MessageBox("Mensaje del sistema ","Se renovará todo el material contenido en la solicitud.~n ¿Desea continuar?", &
			Question!, yesno!, 2)
	if Net = 1 then	
		ldFechaRenovacion = f_calcula_fecha_entrega(date(ldFechaentrega))
		dw_solicitud.setitem(ilRowSol,'fecha_fin',ldFechaRenovacion)
		for i=1 to dw_matdisp.rowcount()
			if dw_matdisp.getitemnumber(i,'spre_sol_materiales_status') <> 1 then 
				dw_matdisp.setitem(i,'spre_sol_materiales_fecha_final',ldFechaRenovacion)
				
				//Modif: 10 Oct 2005
				li_DiasPrestamo = f_calcula_diasdeprestamo(date(ldFechaentrega))
				
				ids_StaPrestamo =  create datastore 
				ids_StaPrestamo.dataobject ='d_psi_stautsprestamo'
				ids_StaPrestamo.settransobject(gtr_sumuia)
				li_row = ids_StaPrestamo.retrieve(ii_depto,ii_area,isCveMaterial,ii_grupo,isNoSerie)
				if li_row >= 1 and not isnull(li_row) then
				
					ii_stauts = ids_StaPrestamo.GetItemNumber(1,'stauts')
					ii_tprestamo = ids_StaPrestamo.GetitemNumber(1,'tiempo_prestamo')
					ii_tprestamo = ii_tprestamo + li_DiasPrestamo 
					if ii_stauts = 2 then
				
						UPDATE dbo.spre_inventario  
						SET dbo.spre_inventario.tiempo_prestamo = :ii_tprestamo 
						WHERE ( dbo.spre_inventario.cvedepto = :ii_depto ) AND  
								( dbo.spre_inventario.cvearea = :ii_area ) AND  
								( dbo.spre_inventario.cvematerial = :isCveMaterial ) AND 
								( dbo.spre_inventario.cvegrupo = :ii_grupo ) AND
								( dbo.spre_inventario.num_serie = :isNoSerie ) 
						using gtr_sumuia;
						commit using gtr_sumuia;
						lb_ok = true
					end if
				end if
			end if
		next
			
		if lb_ok then
			commit using gtr_sumuia;
			sle_cuenta.text=""
		else
			rollback using gtr_sumuia;
		end if
	end if
end if









//
//ldFechaentrega = dw_solicitud.GetItemDateTime(ilRowSol,"fecha_fin")
//	Net = MessageBox("Mensaje del sistema ","Se renovará todo el material contenido en la solicitud.~n ¿Desea continuar?", &
//			Question!, yesno!, 2)
//	if Net = 1 then	
//		ldFechaRenovacion = f_calcula_fecha_entrega(date(ldFechaentrega))
//		dw_solicitud.setitem(ilRowSol,'fecha_fin',ldFechaRenovacion)
//		for i=1 to dw_matdisp.rowcount()
//			if dw_matdisp.getitemnumber(i,'spre_sol_materiales_status') <> 1 then 
//				dw_matdisp.setitem(i,'spre_sol_materiales_fecha_final',ldFechaRenovacion)
//			end if
//		next
//	end if
//


end event

type rb_4 from radiobutton within w_psi_entrega_mat
integer x = 2725
integer y = 1005
integer width = 450
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 29534863
string text = "No entregado"
end type

event clicked;integer i, Net, li_row, li_DiasPrestamo
boolean lb_ok = false
datetime ldFechaentrega, ldFechaRenovacion

if dw_solicitud.RowCount() > 0 then
	ldFechaentrega = dw_solicitud.GetItemDateTime(ilRowSol,"fecha_fin")
	Net = MessageBox("Mensaje del sistema ","Se renovará únicamente el material seleccionado.~n ¿Desea continuar?", &
			Question!, yesno!, 2)
	if Net = 1 then	
		ldFechaRenovacion = f_calcula_fecha_entrega(date(ldFechaentrega))
		dw_solicitud.setitem(ilRowSol,'fecha_fin',ldFechaRenovacion)
		for i=1 to dw_matdisp.rowcount()
			if dw_matdisp.isselected(i) then
				if dw_matdisp.getitemnumber(i,'spre_sol_materiales_status') <> 1 then 
					dw_matdisp.setitem(i,'spre_sol_materiales_fecha_final',ldFechaRenovacion)
					//
					ii_depto		= dw_matdisp.object.spre_sol_materiales_cvedepto[i]
					ii_area		= dw_matdisp.object.spre_sol_materiales_cvearea[i]
					isCveMaterial 	= dw_matdisp.object.spre_sol_materiales_cvematerial[i]
					ii_grupo 	= dw_matdisp.object.spre_sol_materiales_cvegrupo[i]
					isNoSerie 	= dw_matdisp.object.spre_sol_materiales_num_serie[i]
					//
					//Modif: 10 Oct 2005
					li_DiasPrestamo = f_calcula_diasdeprestamo(date(ldFechaentrega))
					
					ids_StaPrestamo =  create datastore 
					ids_StaPrestamo.dataobject ='d_psi_stautsprestamo'
					ids_StaPrestamo.settransobject(gtr_sumuia)
					li_row = ids_StaPrestamo.retrieve(ii_depto,ii_area,isCveMaterial,ii_grupo,isNoSerie)
					if li_row >= 1 and not isnull(li_row) then
					
						ii_stauts = ids_StaPrestamo.GetItemNumber(1,'stauts')
						ii_tprestamo = ids_StaPrestamo.GetitemNumber(1,'tiempo_prestamo')
						ii_tprestamo = ii_tprestamo + li_DiasPrestamo 
						if ii_stauts = 2 then
					
							UPDATE dbo.spre_inventario  
							SET dbo.spre_inventario.tiempo_prestamo = :ii_tprestamo 
							WHERE ( dbo.spre_inventario.cvedepto = :ii_depto ) AND  
									( dbo.spre_inventario.cvearea = :ii_area ) AND  
									( dbo.spre_inventario.cvematerial = :isCveMaterial ) AND 
									( dbo.spre_inventario.cvegrupo = :ii_grupo ) AND
									( dbo.spre_inventario.num_serie = :isNoSerie ) 
							using gtr_sumuia;
							commit using gtr_sumuia;
							lb_ok = true
						end if
					end if
				end if
			end if
		next
			
		if lb_ok then
			commit using gtr_sumuia;
			sle_cuenta.text=""
		else
			rollback using gtr_sumuia;
		end if
	end if
end if	







//integer i, Net
//datetime ldFechaentrega, ldFechaRenovacion
//
//ldFechaentrega = dw_solicitud.GetItemDateTime(ilRowSol,"fecha_fin")
//	Net = MessageBox("Mensaje del sistema ","Se renovará todo el material contenido en la solicitud.~n ¿Desea continuar?", &
//			Question!, yesno!, 2)
//	if Net = 1 then	
//		ldFechaRenovacion = f_calcula_fecha_entrega(date(ldFechaentrega))
//		dw_solicitud.setitem(ilRowSol,'fecha_fin',ldFechaRenovacion)
//		for i=1 to dw_matdisp.rowcount()
//			if dw_matdisp.getitemnumber(i,'spre_sol_materiales_status') <> 1 then 
//				dw_matdisp.setitem(i,'spre_sol_materiales_fecha_final',ldFechaRenovacion)
//			end if
//		next
//	end if
	

end event

type gb_2 from groupbox within w_psi_entrega_mat
integer x = 2662
integer y = 800
integer width = 644
integer height = 339
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Renovar material"
end type

