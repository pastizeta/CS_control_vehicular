$PBExportHeader$w_reporte.srw
forward
global type w_reporte from window
end type
type rb_7 from radiobutton within w_reporte
end type
type dw_concentradohoras from datawindow within w_reporte
end type
type rb_6 from radiobutton within w_reporte
end type
type rb_5 from radiobutton within w_reporte
end type
type rb_4 from radiobutton within w_reporte
end type
type rb_3 from radiobutton within w_reporte
end type
type ddlb_deptos from dropdownlistbox within w_reporte
end type
type cb_1 from commandbutton within w_reporte
end type
type dw_1 from datawindow within w_reporte
end type
type ddlb_espacio from dropdownlistbox within w_reporte
end type
type cb_salir from commandbutton within w_reporte
end type
type cb_buscar from commandbutton within w_reporte
end type
type em_hora_fin from editmask within w_reporte
end type
type st_8 from statictext within w_reporte
end type
type em_hora_ini from editmask within w_reporte
end type
type st_7 from statictext within w_reporte
end type
type rb_2 from radiobutton within w_reporte
end type
type rb_1 from radiobutton within w_reporte
end type
type st_5 from statictext within w_reporte
end type
type ddlb_tp_solicitud from dropdownlistbox within w_reporte
end type
type st_4 from statictext within w_reporte
end type
type st_3 from statictext within w_reporte
end type
type ddlb_tp_evento from dropdownlistbox within w_reporte
end type
type st_2 from statictext within w_reporte
end type
type ddlb_estatus from dropdownlistbox within w_reporte
end type
type st_1 from statictext within w_reporte
end type
type gb_1 from groupbox within w_reporte
end type
type gb_2 from groupbox within w_reporte
end type
type ddlb_tp_espacio from dropdownlistbox within w_reporte
end type
type ddlb_solicitante from dropdownlistbox within w_reporte
end type
end forward

global type w_reporte from window
integer width = 4014
integer height = 3032
boolean titlebar = true
string title = "Demanda de espacios por fecha"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 29534863
event ue_buscar ( )
rb_7 rb_7
dw_concentradohoras dw_concentradohoras
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
ddlb_deptos ddlb_deptos
cb_1 cb_1
dw_1 dw_1
ddlb_espacio ddlb_espacio
cb_salir cb_salir
cb_buscar cb_buscar
em_hora_fin em_hora_fin
st_8 st_8
em_hora_ini em_hora_ini
st_7 st_7
rb_2 rb_2
rb_1 rb_1
st_5 st_5
ddlb_tp_solicitud ddlb_tp_solicitud
st_4 st_4
st_3 st_3
ddlb_tp_evento ddlb_tp_evento
st_2 st_2
ddlb_estatus ddlb_estatus
st_1 st_1
gb_1 gb_1
gb_2 gb_2
ddlb_tp_espacio ddlb_tp_espacio
ddlb_solicitante ddlb_solicitante
end type
global w_reporte w_reporte

event ue_buscar();string	ls_select, ls_where = '', ls_material, ls_tp_solicita, ls_depto, ls_agregar, ls_conectar, ls_estatus_sol
long		ll_grupo, ll_estatus, ll_tp_evento, ll_cont, ll_encontrar, ll_contdepto
datetime ldt_fechai,ldt_fechaf
integer  dia, difsemanas, HorasDisp
integer  PorcOcupado
integer  i, li_row,li_i, li_ren, li_reg
integer  THorasOcupadas,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,THoras
long 		totalOcupadas,totalDisp
decimal	TotalPorcentaje
string 	PorcTotal
Datastore ds_deptos, ds_semanas


 
	if rb_1.checked then
			dw_1.DataObject = 'dw_rep_plantilla'
	elseif rb_2.checked then
			dw_1.DataObject = 'dw_rep_deptos'
	elseif rb_3.checked then
			dw_1.DataObject = 'dw_rep_ctestatus'
	elseif rb_4.checked then
			dw_1.DataObject = 'dw_rep_tot_plantilla'
	elseif rb_5.checked then
			dw_1.DataObject = 'dw_rep_ctehoras'
	elseif rb_6.checked then
			dw_1.DataObject = 'dw_rep_ctehorasdetalle'
	elseif rb_7.checked then
			dw_1.DataObject = 'dw_rep_ctestatus_xdepto1'
	end if
	

	
	dw_1.SetTransObject(gtr_sumuia)
	ls_select = dw_1.GetSQLSelect()
	
	/* ========= Criterios de búsqueda ========= */
	
	// Tipo de solicitud
	choose case ddlb_tp_solicitud.text
		case 'Sistema'
			ls_where += " and spre_solicitud.tipo_solicitud = 0"
		case 'Internet'
			ls_where += " and spre_solicitud.tipo_solicitud = 1"
	end choose
	
	// Tipo de espacio o Tipo de Solicitante
	if ( rb_1.checked or rb_3.checked or rb_5.checked or rb_6.checked or rb_7.checked) then
		if ddlb_tp_espacio.text <> 'none' and ddlb_tp_espacio.text <> 'Todos' and ddlb_tp_espacio.text <> '' then
			
			Select	cvegrupo
			into		:ll_grupo
			from		spre_grupo_material
			where		cvedepto = 1 and
						ltrim(rtrim(descripcion)) = ltrim(rtrim(:ddlb_tp_espacio.text)) using gtr_sumuia ;
						
			ls_where += " and spre_sol_materiales.cvegrupo = " + string(ll_grupo)
			
		end if
	elseif rb_2.checked then
		
		if ddlb_solicitante.text <> 'none' and ddlb_solicitante.text <> 'Todos' and ddlb_solicitante.text <> '' then
			choose case ddlb_solicitante.text
				case 'Alumno'
					ls_tp_solicita = '1'
				case 'Profesor / Empleado'
					ls_tp_solicita = '2'						
				case 'Externo'
					ls_tp_solicita = '3'
			end choose
			
			ls_where += " and spre_reserva_espacios.sol_tipo = " + ls_tp_solicita
		end if
				
	end if
	
	// Espacio o departamento
	if ( rb_1.checked or rb_3.checked or rb_4.checked or rb_5.checked or rb_6.checked or rb_7.checked) then
		
		if ddlb_espacio.text <> 'none' and ddlb_espacio.text <> 'Todos' and ddlb_espacio.text <> '' then
			string lsDepto
			lsDepto = ddlb_espacio.text
			Select 	cvematerial
			into		:ls_material
			from		spre_materiales
			where		cvedepto = 1 and	
						cvearea = 1 and
						ltrim(rtrim(descripcion)) = :lsDepto using gtr_sumuia;
						
			ls_where += " and spre_sol_materiales.cvematerial = '" + ls_material + "'"
			
		end if	

	elseif rb_2.checked then
		
		if ddlb_deptos.text <> 'none' and ddlb_deptos.text <> 'Todos' and ddlb_deptos.text <> '' then
			
			ls_depto = mid(ddlb_deptos.text, 1, pos(ddlb_deptos.text, '-') - 1)
			ls_where += ' and spre_reserva_espacios.sol_depto = ' + ls_depto
			
		end if
		
	end if
	
	//	Estatus
	string lsEst
	if ddlb_estatus.text <> 'none' and ddlb_estatus.text <> 'Todos' and ddlb_estatus.text <> '' then
		lsEst = ddlb_estatus.text
		Select 	id_estatus_sol,desc_estatus_sol
		into		:ll_estatus, :ls_estatus_sol
		from		spre_estatus_sol
		where		ltrim(rtrim(desc_estatus_sol)) = :lsEst using gtr_sumuia;
		
		ls_where += " and spre_sol_materiales.status = " + string(ll_estatus)
		
	end if
	
	// Tipo de evento
	//	Modif: Migración SQL Server se agrega esta variable para que funione el query.
	string lsEvento
	//
	
	if ddlb_tp_evento.text <> 'none' and ddlb_tp_evento.text <> 'Todos' and ddlb_tp_evento.text <> '' then
		lsEvento = ddlb_tp_evento.text
		Select	  cvetevento
		into		:ll_tp_evento
		from		spre_teventos_espacios
		where		ltrim(rtrim(descripcion)) = :lsEvento using gtr_sumuia;
		
		ls_where += " and spre_reserva_espacios.cvetevento = " + string(ll_tp_evento)
		
	end if
		
		// Rango de fechas
		if em_hora_ini.text <> '00/00/0000' and em_hora_fin.text <> '00/00/0000' then
			// Rango completo
			ls_where += " and (spre_sol_materiales.fecha_inicio between '" + string(date(em_hora_ini.text), 'yyyy-mm-dd') + &
							" 00:00:00.000' and '" + string(date(em_hora_fin.text), 'yyyy-mm-dd') + " 23:59:59.998 " + "' OR " + &
							" spre_sol_materiales.fecha_final between '" + string(date(em_hora_ini.text), 'yyyy-mm-dd') + & 
							" 00:00:00.000' and '" + string(date(em_hora_fin.text), 'yyyy-mm-dd') + " 23:59:59.998')"
		elseif em_hora_ini.text <> '00/00/0000' and em_hora_fin.text = '00/00/0000' then
			// Sólo fecha inicial
			ls_where += " and (spre_sol_materiales.fecha_inicio between '" + string(date(em_hora_ini.text), 'yyyy-mm-dd') + &
							" 00:00:00.000' and '" + string(date(em_hora_ini.text), 'yyyy-mm-dd') + " 23:59:59.998 " + "' OR " + &
							" spre_sol_materiales.fecha_final between '" + string(date(em_hora_ini.text), 'yyyy-mm-dd') + & 
							" 00:00:00.000' and '" + string(date(em_hora_ini.text), 'yyyy-mm-dd') + " 23:59:59.998')"
		elseif em_hora_ini.text = '00/00/0000' and em_hora_fin.text <> '00/00/0000' then
			// Sólo fecha final
			ls_where += " and (spre_sol_materiales.fecha_inicio between '" + string(date(em_hora_fin.text), 'yyyy-mm-dd') + &
							" 00:00:00.000' and '" + string(date(em_hora_fin.text), 'yyyy-mm-dd') + " 23:59:59.998 " + "' OR " + &
							" spre_sol_materiales.fecha_final between '" + string(date(em_hora_fin.text), 'yyyy-mm-dd') + & 
							" 00:00:00.000' and '" + string(date(em_hora_fin.text), 'yyyy-mm-dd') + " 23:59:59.998')"
		end if

	datetime ldt_fecha_ini, ldt_fecha_fin 
	ldt_fecha_ini = datetime(date(em_hora_ini.text))
	ldt_fecha_fin = datetime(date(em_hora_fin.text))
	
	dw_1.SetSQLSelect(ls_select + ls_where)
//	clipboard (ls_select + ls_where)
	
	if rb_4.checked then
		dw_1.Retrieve(ll_estatus,ldt_fecha_ini,ldt_fecha_fin)
	else
		dw_1.Retrieve()
	end if
	
	dw_1.SetSQLSelect(ls_select)
	
	//		Mandamos fechas al reporte.	
	date ld_fecha_ini, ld_fecha_fin 
	ld_fecha_ini = date(em_hora_ini.text)
	dw_1.object.t_fecha_ini.text= string(ld_fecha_ini,"dd/mm/yyyy")
	ld_fecha_fin = date(em_hora_fin.text)
	dw_1.object.t_fecha_fin.text= string(ld_fecha_fin,"dd/mm/yyyy")
	if rb_4.checked then
		dw_1.object.t_estatus.text = ls_estatus_sol
	end if
		
	
	if rb_6.checked and dw_1.rowcount() > 0 then
		
		ldt_fechai= datetime(date(em_hora_ini.text))
		ldt_fechaf= datetime(date(em_hora_fin.text))
		ds_semanas = create datastore
		ds_semanas.DataObject = 'd_dif_semanas'
		ds_semanas.SetTransObject(gtr_sumuia)
		ds_semanas.retrieve(ldt_fechai,ldt_fechaf)
		difsemanas= ds_semanas.object.semanas[1]
		HorasDisp = (difsemanas * 6 )* 14
		
		dw_concentradohoras.reset()
		for i = 1 to dw_1.RowCount() 
			h1=dw_1.object.compute_17[i]
			if isnull(h1) then
				h1= 0
			end if
			h2=dw_1.object.compute_18[i]
			if isnull(h2) then
				h2= 0
			end if
			h3=dw_1.object.compute_19[i]
			if isnull(h3) then
				h3= 0
			end if
			h4=dw_1.object.compute_20[i]
			if isnull(h4) then
				h4= 0
			end if
			h5=dw_1.object.compute_21[i]
			if isnull(h5) then
				h5= 0
			end if
			h6=dw_1.object.compute_22[i]
			if isnull(h6) then
				h6= 0
			end if
			h7=dw_1.object.compute_23[i]
			if isnull(h7) then
				h7= 0
			end if
			h8=dw_1.object.compute_24[i]
			if isnull(h8) then
				h8= 0
			end if
			h9=dw_1.object.compute_25[i]
			if isnull(h9) then
				h9= 0
			end if
			h10=dw_1.object.compute_26[i]
			if isnull(h10) then
				h10= 0
			end if
			h11=dw_1.object.compute_27[i]
			if isnull(h11) then
				h11= 0
			end if
			h12=dw_1.object.compute_28[i]
			if isnull(h12) then
				h12= 0
			end if
			h13=dw_1.object.compute_29[i]
			if isnull(h13) then
				h13= 0
			end if
			h14=dw_1.object.compute_30[i]
			if isnull(h14) then
				h14= 0
			end if
			
			THorasOcupadas = h1+h2+h3+h4+h5+h6+h7+h8+h9+h10+h11+h12+h13+h14 
			
			li_row = dw_concentradohoras.InsertRow(0)
			dw_concentradohoras.object.descripcion[li_row] = string(dw_1.object.descripcion[i])
			dw_concentradohoras.object.horas_disponibles[li_row] = HorasDisp
			dw_concentradohoras.object.horas_ocupadas[li_row] = THorasOcupadas
			PorcOcupado= THorasOcupadas * 100 / HorasDisp
			dw_concentradohoras.object.porcentaje_ocupacion[li_row] = PorcOcupado
		next
		
		dw_1.DataObject = 'dw_rep_concentradohoras'
		dw_1.object.t_fecha_ini.text= string(ld_fecha_ini,"dd/mm/yyyy")
		dw_1.object.t_fecha_fin.text= string(ld_fecha_fin,"dd/mm/yyyy")
		
		if dw_concentradohoras.rowcount() > 0 then
			for li_ren = 1 to dw_concentradohoras.rowcount()
				
				li_reg = dw_1.InsertRow(0)
				dw_1.object.descripcion[li_reg] = dw_concentradohoras.object.descripcion[li_ren]
				dw_1.object.horas_disponibles[li_reg] = dw_concentradohoras.object.horas_disponibles[li_ren]
				dw_1.object.horas_ocupadas[li_reg] = dw_concentradohoras.object.horas_ocupadas[li_ren]
				dw_1.object.porcentaje_ocupacion[li_reg] = dw_concentradohoras.object.porcentaje_ocupacion[li_ren]
	
			next

			totalOcupadas = dw_1.object.compute_1[1]
			totalDisp = dw_1.object.compute_2[1]
		
			TotalPorcentaje = totalDisp * 100 / totalOcupadas
			PorcTotal = mid(string(TotalPorcentaje),1,2)
			dw_1.object.total.text = PorcTotal
			
			dw_1.SetSort("porcentaje_ocupacion D")
			dw_1.Sort()
			
			
			dw_1.SetRedraw(true)
		end if

	end if
	
	
	
	//	Si el reporte es por carreras o deptos se reagrupa la información
		//	if not rb_1.checked and not rb_3.checked and not rb_4.checked and not rb_5.checked or not rb_6.checked then
	if rb_2.checked then
		ds_deptos = create DataStore
		
		if ddlb_solicitante.text = 'Alumno' then
			ds_deptos.DataObject = 'ds_carreras'
			ls_conectar = 'ALUMNOS'
			ds_deptos.setTransObject( gtr_sumuia)
			ds_deptos.Retrieve()
		elseif ddlb_solicitante.text = 'Profesor / Empleado' then
			ds_deptos.DataObject = 'ds_deptos'
			ls_conectar = 'EMPLEADOS'
			ds_deptos.setTransObject( gtr_personal)
		ds_deptos.Retrieve()
		end if
			
		for ll_cont = 1 to dw_1.RowCount()
			iF ls_conectar = 'ALUMNOS' then
				dw_1.object.agrupar[ll_cont] = ds_deptos.object.carrera[ds_deptos.find("cve_carrera = " + mid(ddlb_deptos.text, 1, pos(ddlb_deptos.text, '-') - 1), 1, ds_deptos.RowCount())]
			else
				ll_encontrar = ds_deptos.find("depto = '" + ls_depto + "'", 1, ds_deptos.RowCount())
				ls_agregar = ds_deptos.object.depto[ll_encontrar] + ' - ' + ds_deptos.object.nombre_estructura[ll_encontrar]
				ll_encontrar = dw_1.SetValue("agrupar", ll_cont, ls_agregar)
			end if
		next
		
		DESTROY ds_deptos
		dw_1.GroupCalc()
		
	end if
	
	// PRUEBA
//	long ll_depto
//	string ls_carrera
////	integer li_i
//	if rb_7.checked then
//		for li_i = 1 to dw_1.RowCount()
//			ll_depto    = long(dw_1.getItemnumber(li_i,"spre_reserva_espacios_sol_depto"))
//			messagebox("depto uno",string(ll_depto))
//			SELECT  deptos_uia1.nombre_depto 
//			INTO :ls_carrera
//     		 FROM deptos_uia1
//			WHERE depto = :ll_depto
//			using gtr_personal;
////			dw_1.object.compute_5[li_i]= ls_carrera
//			messagebox("depto",string(ls_carrera))
//		next
//	end if
//	//PRUEBA
//	
	DESTROY ds_semanas


	dw_1.SetRedraw(true)
	

	
	
	
end event

on w_reporte.create
this.rb_7=create rb_7
this.dw_concentradohoras=create dw_concentradohoras
this.rb_6=create rb_6
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.ddlb_deptos=create ddlb_deptos
this.cb_1=create cb_1
this.dw_1=create dw_1
this.ddlb_espacio=create ddlb_espacio
this.cb_salir=create cb_salir
this.cb_buscar=create cb_buscar
this.em_hora_fin=create em_hora_fin
this.st_8=create st_8
this.em_hora_ini=create em_hora_ini
this.st_7=create st_7
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_5=create st_5
this.ddlb_tp_solicitud=create ddlb_tp_solicitud
this.st_4=create st_4
this.st_3=create st_3
this.ddlb_tp_evento=create ddlb_tp_evento
this.st_2=create st_2
this.ddlb_estatus=create ddlb_estatus
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.ddlb_tp_espacio=create ddlb_tp_espacio
this.ddlb_solicitante=create ddlb_solicitante
this.Control[]={this.rb_7,&
this.dw_concentradohoras,&
this.rb_6,&
this.rb_5,&
this.rb_4,&
this.rb_3,&
this.ddlb_deptos,&
this.cb_1,&
this.dw_1,&
this.ddlb_espacio,&
this.cb_salir,&
this.cb_buscar,&
this.em_hora_fin,&
this.st_8,&
this.em_hora_ini,&
this.st_7,&
this.rb_2,&
this.rb_1,&
this.st_5,&
this.ddlb_tp_solicitud,&
this.st_4,&
this.st_3,&
this.ddlb_tp_evento,&
this.st_2,&
this.ddlb_estatus,&
this.st_1,&
this.gb_1,&
this.gb_2,&
this.ddlb_tp_espacio,&
this.ddlb_solicitante}
end on

on w_reporte.destroy
destroy(this.rb_7)
destroy(this.dw_concentradohoras)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.ddlb_deptos)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.ddlb_espacio)
destroy(this.cb_salir)
destroy(this.cb_buscar)
destroy(this.em_hora_fin)
destroy(this.st_8)
destroy(this.em_hora_ini)
destroy(this.st_7)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_5)
destroy(this.ddlb_tp_solicitud)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.ddlb_tp_evento)
destroy(this.st_2)
destroy(this.ddlb_estatus)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.ddlb_tp_espacio)
destroy(this.ddlb_solicitante)
end on

event open;long ll_cont
string ls_finicio, ls_ffin


	datastore ds_tp_espacio, ds_status, ds_tp_evento
	
	ds_tp_espacio	= create datastore
	ds_status 		= create datastore
	ds_tp_evento 	= create datastore
	
	ds_tp_espacio.DataObject = 'dw_cat_tp_espacio'
	ds_tp_espacio.SetTransObject(gtr_sumuia)
	ddlb_tp_espacio.additem('Todos')
	for ll_cont = 1 to ds_tp_espacio.Retrieve()
		ddlb_tp_espacio.additem(ds_tp_espacio.object.descripcion[ll_cont])
	next
	
	ds_status.DataObject = 'dw_cat_estatus'
	ds_status.SetTransObject(gtr_sumuia)
	ddlb_estatus.AddItem('Todos')
	for ll_cont = 1 to ds_status.Retrieve()
		ddlb_estatus.AddItem(ds_status.object.desc_estatus_sol[ll_cont])
	next
		
	ds_tp_evento.DataObject = 'dw_cat_tp_evento'
	ds_tp_evento.SetTransObject(gtr_sumuia)
	ddlb_tp_evento.AddItem('Todos')
	for ll_cont = 1 to ds_tp_evento.Retrieve()
		ddlb_tp_evento.AddItem(ds_tp_evento.object.descripcion[ll_cont])
	next
	
	ls_finicio= string(relativedate(today(),-15))
	ls_ffin= string(today())
	em_hora_ini.text= ls_finicio
	em_hora_fin.text= ls_ffin
	
	destroy ds_tp_espacio
	destroy ds_status
	destroy ds_tp_evento
	


	
end event

event close;//disconnect using gtr_sumuia;
//disconnect using gtr_seguridad;
//disconnect using gtr_personal;
//
//if isvalid(gtr_personal) then
//	f_desconecta_bd(gtr_personal)
//end if
//
//f_desconecta_bd(gtr_personal)
end event

type rb_7 from radiobutton within w_reporte
integer x = 183
integer y = 440
integer width = 1070
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = " Total estatus de solicitud por Depto."
end type

event clicked;long ll_cont
DataStore	ds_espacio, ds_status

rb_7.checked = true
rb_3.checked = false
rb_1.checked = false
rb_2.checked = false
rb_4.checked = false
rb_5.checked = false
rb_6.checked = false


ddlb_solicitante.visible = false
ddlb_tp_espacio.visible = true
ddlb_espacio.visible = true
ddlb_deptos.visible = false
st_1.text = 'Tipo de espacio'
st_5.text = 'Espacio'
ddlb_espacio.reset()
ddlb_estatus.reset()

//	Obtenemos estatus
ds_status = create datastore
ds_status.DataObject = 'dw_cat_estatus'
ds_status.SetTransObject(gtr_sumuia)

for ll_cont = 1 to ds_status.Retrieve()
	ddlb_estatus.AddItem(ds_status.object.desc_estatus_sol[ll_cont])
next

destroy ds_status

end event

type dw_concentradohoras from datawindow within w_reporte
boolean visible = false
integer x = 32
integer y = 2888
integer width = 41
integer height = 36
integer taborder = 120
string title = "none"
string dataobject = "dw_rep_temp_conchoras"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_6 from radiobutton within w_reporte
integer x = 183
integer y = 720
integer width = 992
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Concentrado espacios Ocupados"
boolean righttoleft = true
end type

event clicked;long			ll_cont
DataStore	ds_espacio, ds_status

rb_6.checked = true
rb_1.checked = false
rb_3.checked = false
rb_4.checked = false
rb_5.checked = false
rb_2.checked = false
	
ddlb_espacio.reset()
ddlb_estatus.reset()

ddlb_solicitante.visible = false
ddlb_tp_espacio.enabled = true
ddlb_espacio.visible = true
ddlb_espacio.enabled = false
ddlb_deptos.visible = false

ddlb_estatus.enabled = true
st_1.text = 'Tipo de espacio'
st_5.text = 'Espacio'


//	Obtenemos Espacios
ds_espacio = create datastore
ds_espacio.DataObject = 'dw_cat_material'
ds_espacio.SetTransObject(gtr_sumuia)

for ll_cont = 1 to ds_espacio.Retrieve(1,2)
	ddlb_espacio.Additem(ds_espacio.object.descripcion[ll_cont])
next

//	Obtenemos estatus
ds_status = create datastore
ds_status.DataObject = 'dw_cat_estatus'
ds_status.SetTransObject(gtr_sumuia)

for ll_cont = 1 to ds_status.Retrieve()
	ddlb_estatus.AddItem(ds_status.object.desc_estatus_sol[ll_cont])
next

ddlb_estatus.enabled = true
ddlb_estatus.SelectItem(3)

ddlb_espacio.SelectItem(0)

destroy ds_espacio
destroy ds_status
	
end event

type rb_5 from radiobutton within w_reporte
integer x = 183
integer y = 620
integer width = 869
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Total horas uso de espacios"
boolean righttoleft = true
end type

event clicked;long			ll_cont
DataStore	ds_espacio, ds_status

rb_5.checked = true
rb_1.checked = false
rb_3.checked = false
rb_4.checked = false
rb_2.checked = false
rb_6.checked = false

ddlb_solicitante.visible = false
ddlb_tp_espacio.enabled = true
ddlb_espacio.visible = true
ddlb_espacio.enabled = true
ddlb_deptos.visible = false
ddlb_estatus.enabled = true
st_1.text = 'Tipo de espacio'
st_5.text = 'Espacio'


ddlb_espacio.reset()
ddlb_estatus.reset()
//
//	Obtenemos Espacios
ds_espacio = create datastore
ds_espacio.DataObject = 'dw_cat_material'
ds_espacio.SetTransObject(gtr_sumuia)

for ll_cont = 1 to ds_espacio.Retrieve(1,2)
	ddlb_espacio.Additem(ds_espacio.object.descripcion[ll_cont])
next

ddlb_espacio.SelectItem(0)


//	Obtenemos estatus
ds_status = create datastore
ds_status.DataObject = 'dw_cat_estatus'
ds_status.SetTransObject(gtr_sumuia)

for ll_cont = 1 to ds_status.Retrieve()
	ddlb_estatus.AddItem(ds_status.object.desc_estatus_sol[ll_cont])
next


ddlb_estatus.SelectItem(0)

destroy ds_espacio
destroy ds_status
	
end event

type rb_4 from radiobutton within w_reporte
integer x = 183
integer y = 532
integer width = 873
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Total de eventos por espacio"
boolean righttoleft = true
end type

event clicked;long			ll_cont
DataStore	ds_espacio, ds_status
	
rb_4.checked = true
rb_1.checked = false
rb_3.checked = false
rb_2.checked = false
rb_5.checked = false
rb_6.checked = false
	
ddlb_solicitante.visible = false
ddlb_tp_espacio.enabled = false
ddlb_espacio.visible = true
ddlb_espacio.enabled = true
ddlb_deptos.visible = false
st_1.text = 'Tipo de espacio'
st_5.text = 'Espacio'

//	Obtenemos Espacios
ds_espacio = create datastore
ds_espacio.DataObject = 'dw_cat_material'
ds_espacio.SetTransObject(gtr_sumuia)

for ll_cont = 1 to ds_espacio.Retrieve(1,2)
	ddlb_espacio.Additem(ds_espacio.object.descripcion[ll_cont])
next

//ddlb_espacio.enabled = true
//ddlb_espacio.SelectItem(0) 


//	Obtenemos estatus
ds_status = create datastore
ds_status.DataObject = 'dw_cat_estatus'
ds_status.SetTransObject(gtr_sumuia)


for ll_cont = 1 to ds_status.Retrieve()
	ddlb_estatus.AddItem(ds_status.object.desc_estatus_sol[ll_cont])
next


ddlb_estatus.enabled = true
ddlb_estatus.SelectItem(3)

destroy ds_espacio
destroy ds_status
	

end event

type rb_3 from radiobutton within w_reporte
integer x = 183
integer y = 360
integer width = 859
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Total solicitudes por estatus"
boolean righttoleft = true
end type

event clicked;long ll_cont
DataStore	ds_espacio, ds_status

rb_3.checked = true
rb_1.checked = false
rb_2.checked = false
rb_4.checked = false
rb_5.checked = false
rb_6.checked = false


ddlb_solicitante.visible = false
ddlb_tp_espacio.visible = true
ddlb_espacio.visible = true
ddlb_deptos.visible = false
st_1.text = 'Tipo de espacio'
st_5.text = 'Espacio'
ddlb_espacio.reset()
ddlb_estatus.reset()

//	Obtenemos estatus
ds_status = create datastore
ds_status.DataObject = 'dw_cat_estatus'
ds_status.SetTransObject(gtr_sumuia)

for ll_cont = 1 to ds_status.Retrieve()
	ddlb_estatus.AddItem(ds_status.object.desc_estatus_sol[ll_cont])
next

destroy ds_status



end event

type ddlb_deptos from dropdownlistbox within w_reporte
boolean visible = false
integer x = 1998
integer y = 364
integer width = 1650
integer height = 400
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_reporte
integer x = 2752
integer y = 896
integer width = 370
integer height = 88
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
boolean cancel = true
end type

event clicked;dw_1.print()
end event

type dw_1 from datawindow within w_reporte
integer x = 87
integer y = 1092
integer width = 3758
integer height = 1652
integer taborder = 110
string title = "none"
string dataobject = "dw_rep_plantilla"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;Object.DataWindow.Print.preview = 'yes'
gb_2.text = string(RowCount()) + ' registros encontrados'
end event

type ddlb_espacio from dropdownlistbox within w_reporte
integer x = 1998
integer y = 364
integer width = 1650
integer height = 400
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_salir from commandbutton within w_reporte
integer x = 3145
integer y = 896
integer width = 370
integer height = 88
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Salir"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_buscar from commandbutton within w_reporte
integer x = 2359
integer y = 896
integer width = 370
integer height = 88
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generar"
boolean default = true
end type

event clicked;parent.triggerevent("ue_buscar")
end event

type em_hora_fin from editmask within w_reporte
integer x = 3218
integer y = 744
integer width = 370
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "00/00/0000"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_8 from statictext within w_reporte
integer x = 2747
integer y = 756
integer width = 457
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Fin del Evento:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_hora_ini from editmask within w_reporte
integer x = 2299
integer y = 744
integer width = 370
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "00/00/0000"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_7 from statictext within w_reporte
integer x = 1742
integer y = 756
integer width = 539
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Inicio del Evento:"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_2 from radiobutton within w_reporte
integer x = 183
integer y = 272
integer width = 969
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Total eventos por depto / carrera"
boolean righttoleft = true
end type

event clicked;long ll_cont
ddlb_tp_espacio.visible = false
ddlb_espacio.visible = false
ddlb_deptos.visible = true
ddlb_deptos.enabled = true
ddlb_deptos.reset()
st_1.text = 'Tipo de solicitante'
st_5.text = 'Carrera / Depto'
ddlb_solicitante.visible = true
ddlb_solicitante.SelectItem(1)
datastore  ds_deptos
ddlb_espacio.visible = false
ddlb_deptos.visible = true
st_5.text = 'Carreras'

ds_deptos = create DataStore
ds_deptos.DataObject = 'ds_carreras'
ds_deptos.SetTransObject(gtr_sumuia)
ddlb_deptos.reset()
//		ddlb_deptos.AddItem('Todos')
for ll_cont = 1 to ds_deptos.retrieve()
ddlb_deptos.AddItem(string(ds_deptos.object.cve_carrera[ll_cont]) + '-' + ds_deptos.object.carrera[ll_cont])
next
DESTROY ds_deptos
ddlb_deptos.SelectItem(1)
ddlb_deptos.enabled = true

rb_2.checked = true
rb_1.checked = false
rb_3.checked = false
rb_4.checked = false
rb_5.checked = false
rb_6.checked = false



end event

type rb_1 from radiobutton within w_reporte
integer x = 183
integer y = 180
integer width = 786
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Total eventos por espacio"
boolean checked = true
boolean righttoleft = true
end type

event clicked;ddlb_solicitante.visible = false
ddlb_tp_espacio.visible = true
ddlb_espacio.visible = true
ddlb_deptos.visible = false
st_1.text = 'Tipo de espacio'
st_5.text = 'Espacio'

rb_1.checked = true
rb_2.checked = false
rb_3.checked = false
rb_4.checked = false
rb_5.checked = false
rb_6.checked = false


end event

type st_5 from statictext within w_reporte
integer x = 1431
integer y = 372
integer width = 539
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Espacio:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_tp_solicitud from dropdownlistbox within w_reporte
integer x = 1998
integer y = 96
integer width = 1650
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Todas","Sistema","Internet"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//if uf_conectar(true) then
//	Data
end event

type st_4 from statictext within w_reporte
integer x = 1431
integer y = 112
integer width = 539
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Tipo de solicitud:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_reporte
integer x = 1431
integer y = 508
integer width = 539
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Tipo de evento:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_tp_evento from dropdownlistbox within w_reporte
integer x = 1998
integer y = 496
integer width = 1650
integer height = 400
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SelectItem(1)
end event

type st_2 from statictext within w_reporte
integer x = 1431
integer y = 636
integer width = 539
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Estatus:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_estatus from dropdownlistbox within w_reporte
integer x = 1998
integer y = 620
integer width = 1650
integer height = 400
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SelectItem(1)
end event

type st_1 from statictext within w_reporte
integer x = 1431
integer y = 244
integer width = 539
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Tipo de espacio:"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_reporte
integer x = 50
integer y = 56
integer width = 1298
integer height = 860
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Generar Reporte:"
end type

type gb_2 from groupbox within w_reporte
integer x = 50
integer y = 1024
integer width = 3817
integer height = 1760
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
end type

type ddlb_tp_espacio from dropdownlistbox within w_reporte
integer x = 1998
integer y = 232
integer width = 1650
integer height = 400
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
	DataStore	ds_espacio
	long			ll_cont, ll_id_grupo, ll_id_grupo2
	
	ds_espacio = create datastore
	ds_espacio.DataObject = 'dw_cat_material'
	ds_espacio.SetTransObject(gtr_sumuia)
	
	if text <> 'Todos' then
		//	Clave de tipo de espacio
		Select	cvegrupo
		into		:ll_id_grupo
		from		spre_grupo_material
		where		cvedepto = 1 and
					ltrim(rtrim(descripcion)) = rtrim(ltrim(:text)) using gtr_sumuia;
					
		ll_id_grupo2 = ll_id_grupo
	else
			Select	min(cvegrupo)
			into		:ll_id_grupo
			from		spre_grupo_material
			where		cvedepto = 1; 
			
			Select	max(cvegrupo)
			into		:ll_id_grupo2
			from		spre_grupo_material
			where		cvedepto = 1 using gtr_sumuia; 
	
	end if
	
	ddlb_espacio.reset()
	
	
	for ll_cont = 1 to ds_espacio.Retrieve(ll_id_grupo, ll_id_grupo2)
		ddlb_espacio.Additem(ds_espacio.object.descripcion[ll_cont])
	next
	
	ddlb_espacio.enabled = true
	ddlb_espacio.SelectItem(1)
	
	destroy ds_espacio
	

end event

type ddlb_solicitante from dropdownlistbox within w_reporte
boolean visible = false
integer x = 1998
integer y = 232
integer width = 1650
integer height = 400
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Alumno","Profesor / Empleado","Externo"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;long ll_cont
Datastore ds_deptos

if text = 'Profesor / Empleado' then
	
	ddlb_espacio.visible = false
	ddlb_deptos.visible = true
	st_5.text = 'Departamentos'
	
		ds_deptos = create DataStore
		ds_deptos.DataObject = 'ds_deptos'
		ds_deptos.SetTransObject(gtr_personal)
		ddlb_deptos.reset()
		//ddlb_deptos.AddItem('Todos')
		for ll_cont = 1 to ds_deptos.retrieve()
			ddlb_deptos.AddItem(string(ds_deptos.object.depto[ll_cont]) + '-' + ds_deptos.object.nombre_estructura[ll_cont])
		next
		ddlb_deptos.SelectItem(1)
		ddlb_deptos.enabled = true
		

	
elseif text = 'Alumno' then
	
	ddlb_espacio.visible = false
	ddlb_deptos.visible = true
	st_5.text = 'Carreras'
	
		ds_deptos = create DataStore
		ds_deptos.DataObject = 'ds_carreras'
		ds_deptos.SetTransObject(gtr_sumuia)
		ddlb_deptos.reset()
//		ddlb_deptos.AddItem('Todos')
		for ll_cont = 1 to ds_deptos.retrieve()
			ddlb_deptos.AddItem(string(ds_deptos.object.cve_carrera[ll_cont]) + '-' + ds_deptos.object.carrera[ll_cont])
		next
		ddlb_deptos.SelectItem(1)
		ddlb_deptos.enabled = true
		
	
else
	st_5.text = 'Depto / Carrera'
	ddlb_deptos.enabled = false
end if
end event

