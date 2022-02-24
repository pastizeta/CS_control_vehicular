$PBExportHeader$w_sres_busq_disp.srw
forward
global type w_sres_busq_disp from window
end type
type cbx_ocupados from checkbox within w_sres_busq_disp
end type
type cb_salir from commandbutton within w_sres_busq_disp
end type
type cb_buscar from commandbutton within w_sres_busq_disp
end type
type dw_criterios from datawindow within w_sres_busq_disp
end type
type gb_1 from groupbox within w_sres_busq_disp
end type
type mle_1 from multilineedit within w_sres_busq_disp
end type
type dw_busqueda from datawindow within w_sres_busq_disp
end type
end forward

global type w_sres_busq_disp from window
integer width = 3881
integer height = 1748
boolean titlebar = true
string title = "Búsqueda de Espacios"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 29534863
cbx_ocupados cbx_ocupados
cb_salir cb_salir
cb_buscar cb_buscar
dw_criterios dw_criterios
gb_1 gb_1
mle_1 mle_1
dw_busqueda dw_busqueda
end type
global w_sres_busq_disp w_sres_busq_disp

type variables
datawindowchild idwc_tipoespacio,idwc_espacio
end variables

forward prototypes
public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin)
end prototypes

public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin);string ls_criterio, ls_consulta

ls_criterio+=" AND ( (fecha_inicio between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' )"
ls_criterio+= " OR (fecha_final between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' )  )"
ls_criterio+=" AND ( (datepart(hh,fecha_inicio) >= "+string(dw_criterios.getitemnumber(1,'horarioini'))+ " and  datepart(hh,fecha_inicio) < "+string(dw_criterios.getitemnumber(1,'horariofin'))+" ) "
ls_criterio+=" OR (datepart(hh,fecha_final)+1 >"+string(dw_criterios.getitemnumber(1,'horarioini'))+ "and (datepart(hh,fecha_final)+1<="+string(dw_criterios.getitemnumber(1,'horariofin'))+") ))"

ls_criterio+=" WHERE ( spre_materiales.cvedepto="+string(gi_depto) +" AND spre_materiales.cvearea="+string(gi_area)+" ) "//AND ( spre_sol_materiales.status > 7 ) "


if not isnull(dw_criterios.getitemnumber(1,'tipo_espacio')) then
		ls_criterio+=" AND ( spre_materiales.cvegrupo="+string(dw_criterios.getitemnumber(1,'tipo_espacio'))+" ) "
end if

if not isnull(dw_criterios.getitemstring(1,'espacio')) then
		ls_criterio+=" AND ( spre_materiales.cvematerial='"+dw_criterios.getitemstring(1,'espacio')+"' ) "
end if


if not isnull(dw_criterios.getitemnumber(1,'cupo')) then
		ls_criterio+=" AND ( spre_materiales.cupo>="+string(dw_criterios.getitemnumber(1,'cupo'))+" ) "
end if
ls_consulta=dw_busqueda.getsqlselect()+ls_criterio
mle_1.text=ls_consulta
dw_busqueda.setsqlselect(ls_consulta)
dw_busqueda.retrieve()
	
	


end subroutine

on w_sres_busq_disp.create
this.cbx_ocupados=create cbx_ocupados
this.cb_salir=create cb_salir
this.cb_buscar=create cb_buscar
this.dw_criterios=create dw_criterios
this.gb_1=create gb_1
this.mle_1=create mle_1
this.dw_busqueda=create dw_busqueda
this.Control[]={this.cbx_ocupados,&
this.cb_salir,&
this.cb_buscar,&
this.dw_criterios,&
this.gb_1,&
this.mle_1,&
this.dw_busqueda}
end on

on w_sres_busq_disp.destroy
destroy(this.cbx_ocupados)
destroy(this.cb_salir)
destroy(this.cb_buscar)
destroy(this.dw_criterios)
destroy(this.gb_1)
destroy(this.mle_1)
destroy(this.dw_busqueda)
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


end event

type cbx_ocupados from checkbox within w_sres_busq_disp
boolean visible = false
integer x = 238
integer y = 452
integer width = 805
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Ver Espacios Solicitados"
end type

event clicked;if this.checked then
	dw_busqueda.object.txt_solicitud.visible=true
	dw_busqueda.object.folio.visible=true
	dw_busqueda.object.txt_estatus.visible = true
	dw_busqueda.object.spre_sol_materiales_status.visible = true
	dw_busqueda.setfilter('not isnull(folio)')
	dw_busqueda.filter()
	dw_busqueda.title="Espacios Reservados"
else
	dw_busqueda.object.txt_solicitud.visible=false
	dw_busqueda.object.folio.visible=false
	dw_busqueda.object.txt_estatus.visible = false
	dw_busqueda.object.spre_sol_materiales_status.visible = false
	dw_busqueda.setfilter('isnull(folio)')
	dw_busqueda.filter()
	dw_busqueda.title="Espacios Disponibles"
end if
end event

type cb_salir from commandbutton within w_sres_busq_disp
integer x = 3205
integer y = 460
integer width = 329
integer height = 92
integer taborder = 50
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

type cb_buscar from commandbutton within w_sres_busq_disp
integer x = 3205
integer y = 336
integer width = 329
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
boolean default = true
end type

event clicked;
datetime ldt_fecha_hora_ini,ldt_fecha_hora_fin
integer li_hrsini,li_hrsfin, li_minini, li_minfin
date ld_fechaini,ld_fechafin

dw_criterios.accepttext()
dw_busqueda.reset()
li_hrsini=dw_criterios.getitemnumber(1,'horarioini')
li_hrsfin=dw_criterios.getitemnumber(1,'horariofin')
li_minini=dw_criterios.getitemnumber(1,'minutoini')
li_minfin=dw_criterios.getitemnumber(1,'minutofin')
ld_fechaini=dw_criterios.getitemdate(1,'fechaini')
ld_fechafin=dw_criterios.getitemdate(1,'fechafin')

if isnull(li_hrsini) or isnull(li_hrsfin) or isnull(li_minini) or isnull(li_minfin) then
	messagebox("Mensaje del Sistema", "Debe indicar el Horario Inicial y Final",stopsign!)
else
	if isnull(ld_fechaini) or isnull(ld_fechafin) then
		messagebox("Mensaje del Sistema", "Debe indicar la Fecha Inicial y Final",stopsign!)
	else
		if ( li_hrsini>24 or li_hrsini<1 or li_hrsfin>24 or li_hrsfin<1 ) or (li_minini>59 or li_minini<0 or li_minfin>59 or li_minfin<0) then
			messagebox("Mensaje del Sistema", "Debe indicar el horario en formato 1-24 para horas y de 0-59 para los minutos",stopsign!)
		else
			//VALIDA FECHA
			ldt_fecha_hora_ini=datetime(ld_fechaini,time(li_hrsini,li_minini,0))
			ldt_fecha_hora_fin=datetime(ld_fechafin,time(li_hrsfin,li_minfin,0))
			if ldt_fecha_hora_fin > ldt_fecha_hora_ini then 
				
				if li_minfin=0 then li_minfin=60
				ldt_fecha_hora_fin=datetime(ld_fechafin,time(li_hrsfin - 1, li_minfin - 1,59))
				
				dw_busqueda.dataobject='d_sres_busq_disp_espacios'
				dw_busqueda.settransobject(gtr_sumuia)
				wf_crea_busqueda(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
				dw_busqueda.setfilter('isnull(folio)')					
				dw_busqueda.filter()
				cbx_ocupados.visible=true
				dw_busqueda.object.txt_solicitud.visible=false
				dw_busqueda.object.folio.visible=false
				dw_busqueda.object.txt_estatus.visible = false
				dw_busqueda.object.spre_sol_materiales_status.visible = false
				dw_busqueda.title="Espacios Disponibles"
				cbx_ocupados.checked=false
			else
				messagebox("Mensaje del Sistema", "La fecha final no puede ser anterior a la inicial",stopsign!)
			end if
		end if
	end if
end if




end event

type dw_criterios from datawindow within w_sres_busq_disp
integer x = 713
integer y = 108
integer width = 2322
integer height = 452
integer taborder = 20
string title = "none"
string dataobject = "d_sres_criterios_busqueda"
boolean border = false
boolean livescroll = true
end type

event itemchanged;if string(dwo.name)='tipo_espacio' then
	idwc_espacio.settransobject(gtr_sumuia)
	idwc_espacio.retrieve(gi_depto,gi_area,integer(data))
//	idwc_espacio.insertrow(1)
end if
end event

type gb_1 from groupbox within w_sres_busq_disp
integer x = 37
integer y = 16
integer width = 3726
integer height = 584
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Seleccione los criterios que desee"
end type

type mle_1 from multilineedit within w_sres_busq_disp
boolean visible = false
integer x = 2414
integer y = 1180
integer width = 480
integer height = 400
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

type dw_busqueda from datawindow within w_sres_busq_disp
event ue_ya_existe ( integer row,  integer ai_tipo,  integer ai_sol,  integer ai_reser,  integer ai_conf )
integer x = 41
integer y = 652
integer width = 3735
integer height = 940
integer taborder = 20
boolean titlebar = true
string title = "Espacios Disponibles"
string dataobject = "d_sres_busq_disp_espacios"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_ya_existe(integer row, integer ai_tipo, integer ai_sol, integer ai_reser, integer ai_conf);n_transportar uo_parametros

uo_parametros.id_parm1=dw_criterios.getitemdate(1,'fechaini')
uo_parametros.id_parm2=dw_criterios.getitemdate(1,'fechafin')
uo_parametros.ii_parm1=ai_tipo
uo_parametros.ii_parm2=dw_criterios.getitemnumber(1,'horarioini')
uo_parametros.ii_parm3=dw_criterios.getitemnumber(1,'horariofin')
uo_parametros.ii_parm6=dw_criterios.getitemnumber(1,'minutoini')
uo_parametros.ii_parm7=dw_criterios.getitemnumber(1,'minutofin')
uo_parametros.il_parm4=	this.getitemnumber(row,'folio')
uo_parametros.is_parm1=this.getitemstring(row,'cvematerial')
uo_parametros.ii_parm5=	this.getitemnumber(row,'cvegrupo')
uo_parametros.is_parm2=this.getitemstring(row,'descripcion')
uo_parametros.ii_parm9=ai_sol
uo_parametros.ii_parm10=ai_reser
uo_parametros.ii_parm11=ai_conf

opensheetwithparm(w_sre_solicitud_espacio,uo_parametros,w_ppal,0,original!)
end event

event rowfocuschanged;if currentrow>0 then
	selectrow(0,false)
	selectrow(currentrow,true)
else
	selectrow(0,false)
end if




end event

event doubleclicked;n_transportar uo_parametros
integer li_tipo, liNuevo, li_i, li_cont = 0 
integer existeconf=0, existereser = 0

if row>0 then
	//uo_parametros = create n_transportar
	if cbx_ocupados.checked then
		li_tipo=1
		li_i = row
//		for li_i = 1 to rowcount()
			if (object.spre_sol_materiales_status[li_i] = 1 or object.spre_sol_materiales_status[li_i] = 2) then
				li_cont = li_cont + 1
			end if
			
			if object.spre_sol_materiales_status[li_i] = 1 then
				Messagebox("AVISO","Ya existe Reservación para este Espacio")
				existereser = 1
			end if
			
			if object.spre_sol_materiales_status[li_i] = 2 then
				Messagebox("AVISO","Ya existe Confirmación para este Espacio")
				existeconf = 1
			end if
			
//		next
		
		//		NO EXISTEN SOLICITUD RESERVADA O CONFIRMADA
		if li_cont = 0 then
			uo_parametros.ii_parm10=0
			uo_parametros.ii_parm11=0
//			for li_i = 1 to rowcount()
				
				if (object.spre_sol_materiales_status[li_i] = 0  OR object.spre_sol_materiales_status[li_i] = 3 OR object.spre_sol_materiales_status[li_i] = 4 OR object.spre_sol_materiales_status[li_i] = 5 OR object.spre_sol_materiales_status[li_i] = 6) and IsSelected(li_i) then
					//		
					if object.spre_sol_materiales_status[li_i] = 0 then
						if messagebox("AVISO ","Ya existe Solicitud,  ¿DESEA GENERAR NUEVA SOLICITUD?",Stopsign!,YesNo!,2) = 1 then
							li_tipo = 0
							liNuevo = 0
						else
							li_tipo = 1
							liNuevo = 1
						end if
						event ue_ya_existe(li_i,li_tipo,liNuevo,existereser,existeconf)
					end if
			
					if object.spre_sol_materiales_status[li_i] = 3 then
						if messagebox("AVISO ","Solicitud Cancelada por no confirmar, ¿DESEA GENERAR NUEVA SOLICITUD?",Stopsign!,YesNo!,2) = 1 then
							li_tipo = 0
							liNuevo = 0
						else
							li_tipo = 1
							liNuevo = 1
						end if
						event ue_ya_existe(li_i,li_tipo,liNuevo,existereser,existeconf)
					end if
					
					if object.spre_sol_materiales_status[li_i] = 4 then
						if messagebox("AVISO ","Solicitud Cancelada por el solicitante,  ¿DESEA GENERAR NUEVA SOLICITUD?",Stopsign!,YesNo!,2) = 1 then
							li_tipo = 0
							liNuevo = 0
						else
							li_tipo = 1
							liNuevo = 1
						end if
						event ue_ya_existe(li_i,li_tipo,liNuevo,existereser,existeconf)
					end if
					
					//
					if object.spre_sol_materiales_status[li_i] = 5 then
						if messagebox("AVISO ","Espacio no disponible,  ¿DESEA GENERAR NUEVA SOLICITUD?",Stopsign!,YesNo!,2) = 1 then
							li_tipo = 0
							liNuevo = 0
						else
							li_tipo = 1
							liNuevo = 1
						end if
						event ue_ya_existe(li_i,li_tipo,liNuevo,existereser,existeconf)
					end if
					//
					if object.spre_sol_materiales_status[li_i] = 6 then
						if messagebox("AVISO ","Para este espacio no se Presentaron,  ¿DESEA GENERAR NUEVA SOLICITUD?",Stopsign!,YesNo!,2) = 1 then
							li_tipo = 0
							liNuevo = 0
						else
							li_tipo = 1
							liNuevo = 1
						end if
						event ue_ya_existe(li_i,li_tipo,liNuevo,existereser,existeconf)
					end if
				end if
//			next
		//		EXISTE SOLICITUD RESERVADA O CONFIRMADA
		//		SOLO PERMITE CONSULTAR
		elseif li_cont >= 1 then
//			for li_i = 1 to rowcount()
				li_tipo=1
				liNuevo = 1
				if (object.spre_sol_materiales_status[li_i] = 0 OR object.spre_sol_materiales_status[li_i] = 1 OR object.spre_sol_materiales_status[li_i] = 2 OR object.spre_sol_materiales_status[li_i] = 3 OR object.spre_sol_materiales_status[li_i] = 4 OR object.spre_sol_materiales_status[li_i] = 6) and IsSelected(li_i) then
					event ue_ya_existe(li_i,li_tipo,liNuevo,existereser,existeconf)
				end if
//			next

		end if
	else
		li_tipo= 0
		liNUEVO = 0
		uo_parametros.id_parm1=dw_criterios.getitemdate(1,'fechaini')
		uo_parametros.id_parm2=dw_criterios.getitemdate(1,'fechafin')
		uo_parametros.ii_parm1=li_tipo
		uo_parametros.ii_parm2=dw_criterios.getitemnumber(1,'horarioini')
		uo_parametros.ii_parm3=dw_criterios.getitemnumber(1,'horariofin')
		uo_parametros.ii_parm6=dw_criterios.getitemnumber(1,'minutoini')
		uo_parametros.ii_parm7=dw_criterios.getitemnumber(1,'minutofin')
		uo_parametros.il_parm4=	this.getitemnumber(row,'folio')
		uo_parametros.is_parm1=this.getitemstring(row,'cvematerial')
		uo_parametros.ii_parm5=	this.getitemnumber(row,'cvegrupo')
		uo_parametros.is_parm2=this.getitemstring(row,'descripcion')
		uo_parametros.ii_parm9=liNuevo
		
		opensheetwithparm(w_sre_solicitud_espacio,uo_parametros,w_ppal,0,original!)
		
	end if
end if



end event

