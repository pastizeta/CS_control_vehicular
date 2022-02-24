$PBExportHeader$w_sres_reportes.srw
$PBExportComments$Reportes
forward
global type w_sres_reportes from window
end type
type dw_reporte_serv from datawindow within w_sres_reportes
end type
type dw_servicios from datawindow within w_sres_reportes
end type
type cbx_nombre from checkbox within w_sres_reportes
end type
type cbx_tipo from checkbox within w_sres_reportes
end type
type dw_obtendatos from datawindow within w_sres_reportes
end type
type dw_reporte from datawindow within w_sres_reportes
end type
type cb_guarda from commandbutton within w_sres_reportes
end type
type cb_imprime from commandbutton within w_sres_reportes
end type
type cb_salir from commandbutton within w_sres_reportes
end type
type cb_buscar from commandbutton within w_sres_reportes
end type
type dw_criterios from datawindow within w_sres_reportes
end type
type gb_1 from groupbox within w_sres_reportes
end type
type mle_1 from multilineedit within w_sres_reportes
end type
type dw_busqueda from datawindow within w_sres_reportes
end type
type gb_2 from groupbox within w_sres_reportes
end type
end forward

global type w_sres_reportes from window
integer width = 4046
integer height = 2364
boolean titlebar = true
string title = "Búsqueda de Espacios"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 29534863
dw_reporte_serv dw_reporte_serv
dw_servicios dw_servicios
cbx_nombre cbx_nombre
cbx_tipo cbx_tipo
dw_obtendatos dw_obtendatos
dw_reporte dw_reporte
cb_guarda cb_guarda
cb_imprime cb_imprime
cb_salir cb_salir
cb_buscar cb_buscar
dw_criterios dw_criterios
gb_1 gb_1
mle_1 mle_1
dw_busqueda dw_busqueda
gb_2 gb_2
end type
global w_sres_reportes w_sres_reportes

type variables
datawindowchild idwc_tipoespacio,idwc_espacio
datawindowchild idwc_soldepto,idwc_respdepto,idwc_avaldepto



string is_fecha_string , issemanaequipo, issemanaservicios
long il_fecha_ini, il_fecha_fin 

integer licont

end variables

forward prototypes
public function string wf_nombremes (integer argmes)
public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin)
end prototypes

public function string wf_nombremes (integer argmes);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  wf_nombremes
//
//	Access:  public
//
//	Arguments:
//	integer argmes
//
//	Returns:
//	string
//
//	Description:
//
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

	string lsnommes
	choose case argmes
						case 1 
							lsnommes =  "Enero"
						case 2 
							lsnommes =  "Febrero"
						case 3 
							lsnommes =  "Marzo"
						case 4 
							lsnommes =  "Abril"
						case 5 
							lsnommes =  "Mayo"
						case 6 
							lsnommes =  "Junio"
						case 7
							lsnommes =  "Julio"
						case 8
							lsnommes =  "Agosto"
						case 9 
							lsnommes =  "Septiembre"
						case 10 
							lsnommes =  "Octubre"
						case 11 
							lsnommes =  "Noviembre"
						case 12 
							lsnommes =  "Diciembre"
					end choose
					
					return lsnommes
end function

public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin);string	ls_criterio, ls_consulta,lsnommes, lsnommesf, lssemana, ls_fechaini, ls_fechafin, desequipo, evento,expo, desmat, cvemat, ls_carrera, ls_depto
long		ll_recupera, cveequipo, cantidad, ll_renglon, ll_reng, ll_leidos, ll_solnum, ll_ren, ll_row
datetime fecha_ini,fecha_ini1,fecha_final
date		ldfechai, lsfehaf	
integer  liFolioser
string   lsServicios
long     ll_depto
integer	li_i, folio, li_soltipo, li_depto

//		Para obtener Nombre depto
Datastore ds_deptos
ds_deptos = create DataStore


licont = 0

ls_criterio=" AND ( spre_materiales.cvedepto="+string(gi_depto) +" AND spre_materiales.cvearea="+string(gi_area)+" ) AND ( spre_sol_materiales.status < 3 ) "

ls_fechaini = string(ldt_fechaini,'dd/mm/yyyy')
ls_fechafin = string(ldt_fechafin,'dd/mm/yyyy')



is_fecha_string = Mid(ls_fechaini,7,4) + Mid(ls_fechaini,4,2) + Mid(ls_fechaini,1,2) //Año/Mes/Dia
il_fecha_ini = long(is_fecha_string)

is_fecha_string = Mid(ls_fechafin,7,4) + Mid(ls_fechafin,4,2) + Mid(ls_fechafin,1,2) //Año/Mes/Dia
il_fecha_fin = long(is_fecha_string)	


if not isnull(dw_criterios.getitemnumber(1,'tipo_espacio')) then
		ls_criterio+=" AND ( spre_materiales.cvegrupo="+string(dw_criterios.getitemnumber(1,'tipo_espacio'))+" ) "
end if

if not isnull(dw_criterios.getitemstring(1,'espacio')) then
		ls_criterio+=" AND ( spre_materiales.cvematerial='"+dw_criterios.getitemstring(1,'espacio')+"' ) "
end if
ldfechai = date(ldt_fechaini) 
lsfehaf = date(ldt_fechafin)
lsnommes = wf_nombremes( Month(ldfechai))
					lsnommesf = wf_nombremes( Month(lsfehaf))
					
					
if lsnommes = lsnommesf then
						
	lssemana = "Eventos del "+ Trim ( string(Day(ldfechai)))+ " al "&
	+ Trim ( string(Day(lsfehaf)))+" de  "+ lsnommesf
						
	issemanaequipo = "Equipos del "+ Trim ( string(Day(ldfechai)))+ " al "&
	+ Trim ( string(Day(lsfehaf)))+" de  "+ lsnommesf
	
	issemanaservicios = "Observaciones del "+ Trim ( string(Day(ldfechai)))+ " al "&
	+ Trim ( string(Day(lsfehaf)))+" de  "+ lsnommesf
						
else
						
	lssemana = "Eventos del "+ Trim ( string(Day(ldfechai)))+" de  "+ lsnommes+ " al "&
	+ Trim ( string(Day(lsfehaf)))+" de   "+ lsnommesf
						
	issemanaequipo = "Equipos del "+ Trim ( string(Day(ldfechai)))+" de  "+ lsnommes+ " al "&
	+ Trim ( string(Day(lsfehaf)))+" de   "+ lsnommesf
	
	issemanaservicios = "Observaciones del "+ Trim ( string(Day(ldfechai)))+" de  "+ lsnommes+ " al "&
	+ Trim ( string(Day(lsfehaf)))+" de   "+ lsnommesf
						
end if
dw_busqueda.object.eventossemana.text = lssemana	

//ls_criterio+=" AND ( (dbo.spre_sol_materiales.fecha_inicio between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' )"
//ls_criterio+= " OR (dbo.spre_sol_materiales.fecha_final between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' )  )"
//ls_criterio+=" AND ( (datepart(hh,fecha_inicio) >= "+string(dw_criterios.getitemnumber(1,'horarioini'))+ " and  datepart(hh,fecha_inicio) < "+string(dw_criterios.getitemnumber(1,'horariofin'))+" ) "
//ls_criterio+=" OR (datepart(hh,fecha_final)+1 >"+string(dw_criterios.getitemnumber(1,'horarioini'))+ "and (datepart(hh,fecha_final)+1<="+string(dw_criterios.getitemnumber(1,'horariofin'))+") ))"


ls_criterio+=" AND ( (10000*datepart(yy,spre_sol_materiales.fecha_inicio)) +(100 *datepart(mm,spre_sol_materiales.fecha_inicio)) +(datepart(dd,spre_sol_materiales.fecha_inicio)) >="+string(il_fecha_ini)+" )"     
ls_criterio+=" AND ( (10000*datepart(yy,spre_sol_materiales.fecha_final)) +(100 *datepart(mm,spre_sol_materiales.fecha_final)) +(datepart(dd,spre_sol_materiales.fecha_final)) <="+string(il_fecha_fin)+" )"     

ls_consulta=dw_busqueda.getsqlselect()+ls_criterio 
mle_1.text=ls_consulta
dw_busqueda.setsqlselect(ls_consulta)
dw_busqueda.retrieve()

For li_i = 1 to dw_busqueda.RowCount()
	li_soltipo  = dw_busqueda.getItemnumber(li_i,"spre_reserva_espacios_sol_tipo")
	ll_depto    = long(dw_busqueda.getItemnumber(li_i,"sol_depto"))
	if li_soltipo = 1 then
		SELECT  carrera
		INTO :ls_carrera
		FROM v_sce_carreras 
		WHERE cve_carrera = :ll_depto 
		using gtr_sumuia;

		dw_busqueda.object.deptocarrera[li_i]= 'CARRERA:' + ls_carrera
	
	elseif li_soltipo = 2 then
		ds_deptos.DataObject = 'd_rep_nombredepto'
		ds_deptos.setTransObject( gtr_personal)
		ds_deptos.Retrieve(ll_depto)
		ls_carrera = ds_deptos.getItemstring(1,"nombre_depto")
		dw_busqueda.object.deptocarrera[li_i]= 'DEPTO:' + ls_carrera
//	else
//		
//		dw_busqueda.object.deptocarrera[li_i]= 'EXTERNO'
	end if
next

 
For li_i = 1 to dw_busqueda.RowCount()
	
	folio = dw_busqueda.object.folio[li_i]
	ll_recupera= dw_obtendatos.retrieve(folio)
	if ll_recupera >= 1 then
		
		cvemat      = dw_busqueda.getItemstring(li_i,"spre_sol_materiales_cvematerial")
		desmat      = dw_busqueda.getItemstring(li_i,"materiales_descripcion")
		fecha_ini   = dw_busqueda.getItemdatetime(li_i,"fecha_inicio")
		fecha_ini1  = dw_busqueda.getItemdatetime(li_i,"fecha_inicio_1")
		fecha_final = dw_busqueda.getItemdatetime(li_i,"fecha_final")
		evento = dw_busqueda.getItemstring(li_i,"nombre_evento")
		expo = dw_busqueda.getItemstring(li_i,"impartido_por")
		
		
		for ll_leidos = 1 to ll_recupera
			ll_renglon = dw_reporte.InsertRow(0)
			cveequipo = dw_obtendatos.getItemnumber(ll_leidos,"spre_equipo_requerido_cveequipo")
			desequipo = dw_obtendatos.getItemstring(ll_leidos,"spre_equipo_requerido_descripcion")
			folio		=	dw_obtendatos.getItemnumber(ll_leidos,"spre_equipo_solicitud_folio")
			cantidad	=	dw_obtendatos.getItemnumber(ll_leidos,"spre_equipo_solicitud_cantidad")
			
			
			dw_reporte.object.cvemat[ll_renglon] = cvemat 
			dw_reporte.object.desmat[ll_renglon] = desmat 
			dw_reporte.object.fecha[ll_renglon] = fecha_ini        
			dw_reporte.object.hora_inicio[ll_renglon] = fecha_ini1 
			dw_reporte.object.hora_fin[ll_renglon] = fecha_final 
			dw_reporte.object.evento[ll_renglon] = evento 
			dw_reporte.object.exposito[ll_renglon] = expo
			dw_reporte.object.cve_equipo[ll_renglon] = cveequipo                 
			dw_reporte.object.descripcion[ll_renglon] = desequipo
			dw_reporte.object.cantidad[ll_renglon] = cantidad 
			dw_reporte.object.equipo[ll_renglon] = issemanaequipo
		next
	end if
	//	Obtenemos las Observaciones Septiembre 2007 gmn.
	ll_ren= dw_servicios.retrieve(folio)
	if ll_ren >= 1 then
		
		for ll_row = 1 to ll_ren
			lsServicios	=	dw_servicios.getItemstring(ll_row,"servicios")
			if isnull(lsServicios) or (lsServicios = "") then
				//	lsServicios = "Sin Observaciones"
			elseif not isnull(lsServicios) and lsServicios <> "" then
				ll_reng = dw_reporte_serv.InsertRow(0)
				licont = licont + 1
				dw_reporte_serv.object.cvemat[ll_reng] = cvemat 
				dw_reporte_serv.object.desmat[ll_reng] = desmat 
				dw_reporte_serv.object.fecha[ll_reng] = fecha_ini        
				dw_reporte_serv.object.hora_inicio[ll_reng] = fecha_ini1 
				dw_reporte_serv.object.hora_fin[ll_reng] = fecha_final 
				dw_reporte_serv.object.evento[ll_reng] = evento
				dw_reporte_serv.object.descripcion[ll_reng] = lsServicios
				dw_reporte_serv.object.equipo[ll_reng] = issemanaservicios
			end if
		next
	end if
	//
Next

dw_reporte.GroupCalc ( )
dw_reporte_serv.GroupCalc ( )

end subroutine

on w_sres_reportes.create
this.dw_reporte_serv=create dw_reporte_serv
this.dw_servicios=create dw_servicios
this.cbx_nombre=create cbx_nombre
this.cbx_tipo=create cbx_tipo
this.dw_obtendatos=create dw_obtendatos
this.dw_reporte=create dw_reporte
this.cb_guarda=create cb_guarda
this.cb_imprime=create cb_imprime
this.cb_salir=create cb_salir
this.cb_buscar=create cb_buscar
this.dw_criterios=create dw_criterios
this.gb_1=create gb_1
this.mle_1=create mle_1
this.dw_busqueda=create dw_busqueda
this.gb_2=create gb_2
this.Control[]={this.dw_reporte_serv,&
this.dw_servicios,&
this.cbx_nombre,&
this.cbx_tipo,&
this.dw_obtendatos,&
this.dw_reporte,&
this.cb_guarda,&
this.cb_imprime,&
this.cb_salir,&
this.cb_buscar,&
this.dw_criterios,&
this.gb_1,&
this.mle_1,&
this.dw_busqueda,&
this.gb_2}
end on

on w_sres_reportes.destroy
destroy(this.dw_reporte_serv)
destroy(this.dw_servicios)
destroy(this.cbx_nombre)
destroy(this.cbx_tipo)
destroy(this.dw_obtendatos)
destroy(this.dw_reporte)
destroy(this.cb_guarda)
destroy(this.cb_imprime)
destroy(this.cb_salir)
destroy(this.cb_buscar)
destroy(this.dw_criterios)
destroy(this.gb_1)
destroy(this.mle_1)
destroy(this.dw_busqueda)
destroy(this.gb_2)
end on

event open;

//CHILD TIPO DE ESPACIO
dw_criterios.settransobject(gtr_sumuia)
dw_criterios.getchild('tipo_espacio',idwc_tipoespacio)
idwc_tipoespacio.settransobject(gtr_sumuia)
idwc_tipoespacio.retrieve(gi_depto,gi_area)
idwc_tipoespacio.insertrow(1)
//CHILD ESPACIO
dw_criterios.settransobject(gtr_sumuia)
dw_criterios.getchild('espacio',idwc_espacio)
idwc_espacio.settransobject(gtr_sumuia)
idwc_espacio.retrieve(gi_depto,gi_area,1)
idwc_espacio.insertrow(1)
//
dw_criterios.insertrow(0)


dw_busqueda.settransobject(gtr_sumuia)

dw_busqueda.event ue_getchild_estado()


end event

type dw_reporte_serv from datawindow within w_sres_reportes
boolean visible = false
integer x = 3840
integer y = 2196
integer width = 114
integer height = 36
integer taborder = 50
string title = "none"
string dataobject = "d_reporte_obs"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(gtr_sumuia)
end event

type dw_servicios from datawindow within w_sres_reportes
boolean visible = false
integer x = 3698
integer y = 2196
integer width = 151
integer height = 36
integer taborder = 40
string title = "none"
string dataobject = "d_obten_servicios"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(gtr_sumuia)
end event

type cbx_nombre from checkbox within w_sres_reportes
integer x = 160
integer y = 288
integer width = 562
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 29534863
string text = "Nombre Evento"
boolean lefttext = true
end type

event clicked;if this.checked then
	cbx_tipo.checked = false
end if
end event

type cbx_tipo from checkbox within w_sres_reportes
integer x = 160
integer y = 180
integer width = 562
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 29534863
string text = "Tipo Evento"
boolean lefttext = true
end type

event clicked;if this.checked then
	cbx_nombre.checked = false
end if
end event

type dw_obtendatos from datawindow within w_sres_reportes
boolean visible = false
integer x = 3561
integer y = 2196
integer width = 96
integer height = 36
integer taborder = 80
string title = "none"
string dataobject = "d_obten_equipo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(gtr_sumuia)
end event

type dw_reporte from datawindow within w_sres_reportes
boolean visible = false
integer x = 3630
integer y = 2196
integer width = 114
integer height = 36
integer taborder = 30
string title = "none"
string dataobject = "d_reporte"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(gtr_sumuia)
end event

type cb_guarda from commandbutton within w_sres_reportes
integer x = 3218
integer y = 548
integer width = 334
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Guardar"
end type

event clicked;dw_busqueda.saveas() 
end event

type cb_imprime from commandbutton within w_sres_reportes
event ue_limpia ( )
integer x = 3584
integer y = 412
integer width = 334
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event ue_limpia;dw_obtendatos.reset()
dw_reporte.reset()
dw_reporte_serv.reset()

end event

event clicked;//dw_busqueda.saveas()
dw_busqueda.Print()

if dw_reporte.RowCount() >= 1 then
	dw_reporte.print()
end if

if dw_reporte_serv.RowCount() >= 1 then
	if licont >= 1 then
		dw_reporte_serv.print()
	end if
end if

event ue_limpia()


end event

type cb_salir from commandbutton within w_sres_reportes
integer x = 3584
integer y = 548
integer width = 334
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

type cb_buscar from commandbutton within w_sres_reportes
integer x = 3218
integer y = 412
integer width = 334
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Generar"
boolean default = true
end type

event clicked;
datetime ldt_fecha_hora_ini,ldt_fecha_hora_fin
integer li_hrsini,li_hrsfin, li_minini, li_minfin
date ld_fechaini,ld_fechafin

dw_busqueda.reset()
dw_criterios.accepttext()


ld_fechaini=dw_criterios.getitemdate(1,'fechaini')
ld_fechafin=dw_criterios.getitemdate(1,'fechafin')

	if isnull(ld_fechaini) or isnull(ld_fechafin) then
		messagebox("Mensaje del Sistema", "Debe indicar la Fecha Inicial y Final",stopsign!)
	else

//			//VALIDA FECHA
			ldt_fecha_hora_ini=datetime(ld_fechaini,time(0,0,0))
			ldt_fecha_hora_fin=datetime(ld_fechafin,time(23,59,0))
			if ldt_fecha_hora_fin>ldt_fecha_hora_ini then 
				if li_minfin=0 then li_minfin=60
				ldt_fecha_hora_fin=datetime(ld_fechafin,time(li_hrsfin - 1, li_minfin - 1,59))
				
				if cbx_tipo.checked then
				
					dw_busqueda.dataobject='d_sres_reptot_solicitud'
					dw_busqueda.settransobject(gtr_sumuia)
//					dw_busqueda.event ue_getchild_estado()
					wf_crea_busqueda(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
					if dw_busqueda.RowCount() >0 then
						cb_imprime.visible = true
						cb_guarda.visible = true
					end if
				end if
				
				
				if cbx_nombre.checked then
					
					
					dw_busqueda.dataobject='d_sres_reptot_solicitud_1'
					dw_busqueda.settransobject(gtr_sumuia)
					
//					dw_busqueda.event ue_getchild_estado()
					wf_crea_busqueda(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
					if dw_busqueda.RowCount() >0 then
						cb_imprime.visible = true
						cb_guarda.visible = true
						
						
					end if
				end if
				if (cbx_tipo.checked = false and cbx_nombre.checked = false) then 
					Messagebox("Aviso","Seleccione un tipo de Reporete...")
				end if
			
			else
				messagebox("Mensaje del Sistema", "La fecha final no puede ser anterior a la inicial",stopsign!)
			end if
	end if



end event

type dw_criterios from datawindow within w_sres_reportes
integer x = 910
integer y = 168
integer width = 2149
integer height = 452
integer taborder = 20
string title = "none"
string dataobject = "d_sres_criterios_busqueda_r"
boolean border = false
boolean livescroll = true
end type

event itemchanged;if string(dwo.name)='tipo_espacio' then
	idwc_espacio.settransobject(gtr_sumuia)
	idwc_espacio.retrieve(gi_depto,gi_area,integer(data))
//	idwc_espacio.insertrow(1)
end if
end event

type gb_1 from groupbox within w_sres_reportes
integer x = 859
integer y = 16
integer width = 2240
integer height = 628
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Seleccione los criterios que desee"
end type

type mle_1 from multilineedit within w_sres_reportes
boolean visible = false
integer x = 3607
integer y = 48
integer width = 210
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_busqueda from datawindow within w_sres_reportes
event ue_getchild_estado ( )
integer x = 37
integer y = 668
integer width = 3918
integer height = 1516
integer taborder = 20
string title = "Espacios Disponibles"
string dataobject = "d_sres_reptot_solicitud"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_getchild_estado();
//CHILD DEPTOS IMPRESION
dw_busqueda.getchild('sol_depto',idwc_soldepto)
//dw_busqueda.getchild('resp_depto',idwc_respdepto)
//dw_busqueda.getchild('aval_depto',idwc_avaldepto)
idwc_soldepto.settransobject(gtr_personal)
//idwc_respdepto.settransobject(gtr_personal)
//idwc_avaldepto.settransobject(gtr_personal)
idwc_soldepto.retrieve()
//idwc_respdepto.retrieve()
//idwc_avaldepto.retrieve()
end event

event rowfocuschanged;if currentrow>0 then
	selectrow(0,false)
	selectrow(currentrow,true)
else
	selectrow(0,false)
end if
end event

event doubleclicked;//n_transportar uo_parametros
//integer li_tipo
//
//if row>0 then
////uo_parametros = create n_transportar
//
//	uo_parametros.id_parm1=dw_criterios.getitemdate(1,'fechaini')
//	uo_parametros.id_parm2=dw_criterios.getitemdate(1,'fechafin')
//	uo_parametros.ii_parm1=li_tipo
//	uo_parametros.ii_parm2=dw_criterios.getitemnumber(1,'horarioini')
//	uo_parametros.ii_parm3=dw_criterios.getitemnumber(1,'horariofin')
//	uo_parametros.ii_parm6=dw_criterios.getitemnumber(1,'minutoini')
//	uo_parametros.ii_parm7=dw_criterios.getitemnumber(1,'minutofin')
//	uo_parametros.ii_parm4=	this.getitemnumber(row,'folio')
//	uo_parametros.is_parm1=this.getitemstring(row,'cvematerial')
//	uo_parametros.ii_parm5=	this.getitemnumber(row,'cvegrupo')
//	uo_parametros.is_parm2=this.getitemstring(row,'descripcion')	
//
//opensheetwithparm(w_sre_solicitud_espacio,uo_parametros,w_ppal,0,original!)
//end if
end event

type gb_2 from groupbox within w_sres_reportes
integer x = 69
integer y = 16
integer width = 741
integer height = 492
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Selecciona Tipo reporte"
end type

