$PBExportHeader$w_adm_consulta_busq.srw
forward
global type w_adm_consulta_busq from window
end type
type cb_1 from commandbutton within w_adm_consulta_busq
end type
type cb_salir from commandbutton within w_adm_consulta_busq
end type
type cb_buscar from commandbutton within w_adm_consulta_busq
end type
type dw_criterios from datawindow within w_adm_consulta_busq
end type
type gb_1 from groupbox within w_adm_consulta_busq
end type
type dw_busqueda from datawindow within w_adm_consulta_busq
end type
type mle_1 from multilineedit within w_adm_consulta_busq
end type
end forward

global type w_adm_consulta_busq from window
integer width = 3913
integer height = 2156
boolean titlebar = true
string title = "Búsqueda de Espacios"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 29534863
cb_1 cb_1
cb_salir cb_salir
cb_buscar cb_buscar
dw_criterios dw_criterios
gb_1 gb_1
dw_busqueda dw_busqueda
mle_1 mle_1
end type
global w_adm_consulta_busq w_adm_consulta_busq

type variables
datawindowchild idwc_tipoespacio,idwc_espacio,idwc_requerimientos

integer iAñoFecha 

string is_fecha_string 
long il_fecha_ini , il_fecha_fin 	
end variables

forward prototypes
public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin)
end prototypes

public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin);string ls_criterio, ls_consulta
string ls_hrini='00:00:00', ls_hrfin='00:00:00'

ls_criterio=" AND ( spre_solicitud.cvedepto="+string(gi_depto) +" ) "
if not isnull(dw_criterios.getitemnumber(1,'folio_solicitud')) then
		ls_criterio+=" AND ( spre_solicitud.folio="+string(dw_criterios.getitemnumber(1,'folio_solicitud'))+" ) "
end if

if not isnull(dw_criterios.getitemnumber(1,'tipo_espacio')) then
		ls_criterio+=" AND ( spre_materiales.cvegrupo="+string(dw_criterios.getitemnumber(1,'tipo_espacio'))+" ) "
end if

if not isnull(dw_criterios.getitemstring(1,'espacio')) then
		ls_criterio+=" AND ( spre_materiales.cvematerial='"+dw_criterios.getitemstring(1,'espacio')+"' ) "
end if

if not isnull(dw_criterios.getitemnumber(1,'status')) then
		ls_criterio+=" AND ( spre_solicitud.status="+string(dw_criterios.getitemnumber(1,'status'))+" ) "
end if

if not isnull(dw_criterios.getitemstring(1,'nombres')) then
		ls_criterio+=" AND ( upper( spre_prestamo_material.solicitantenombre ) like '%"+dw_criterios.getitemstring(1,'nombres')+"%' ) "		
end if

if not isnull(dw_criterios.getitemnumber(1,'horarioini')) or not isnull(dw_criterios.getitemnumber(1,'horariofin')) then
	if dw_criterios.getitemnumber(1,'horarioini')<dw_criterios.getitemnumber(1,'horariofin') then		
		ls_hrini=string(dw_criterios.getitemnumber(1,'horarioini'))+":00:00"	
		ls_hrfin=string(dw_criterios.getitemnumber(1,'horariofin'))+":00:00"
	else
		messagebox("Mensaje del Sistema", "La hora inicial no puede ser mayor a la final",stopsign!)
	end if
end if

string ldt_fecha_inicio1,ldt_fecha_final1, lsPeriodo
integer li_periodo

if not isnull(dw_criterios.getitemdate(1,'fechaini')) or not isnull(dw_criterios.getitemdate(1,'fechafin')) then
	if dw_criterios.getitemdate(1,'fechaini')<=dw_criterios.getitemdate(1,'fechafin') then
		ldt_fechaini=datetime(dw_criterios.getitemdate(1,'fechaini'),time(ls_hrini))
		ldt_fechafin=datetime(dw_criterios.getitemdate(1,'fechafin'),time(ls_hrfin))
		
		iAñoFecha = integer(Mid(string(ldt_fechafin,'dd/mm/yyyy'),7,4))

		ls_criterio+= " AND ( (spre_sol_materiales.fecha_inicio between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' )"
		ls_criterio+= " OR (spre_sol_materiales.fecha_final between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' )) "
	
	else
		messagebox("Mensaje del Sistema", "La fecha inicial no puede ser mayor a la final",stopsign!)
	end if
end if


ls_consulta=dw_busqueda.getsqlselect()+ls_criterio
mle_1.text=ls_consulta
dw_busqueda.setsqlselect(ls_consulta)
clipboard (ls_consulta)
dw_busqueda.retrieve()
	
	


end subroutine

on w_adm_consulta_busq.create
this.cb_1=create cb_1
this.cb_salir=create cb_salir
this.cb_buscar=create cb_buscar
this.dw_criterios=create dw_criterios
this.gb_1=create gb_1
this.dw_busqueda=create dw_busqueda
this.mle_1=create mle_1
this.Control[]={this.cb_1,&
this.cb_salir,&
this.cb_buscar,&
this.dw_criterios,&
this.gb_1,&
this.dw_busqueda,&
this.mle_1}
end on

on w_adm_consulta_busq.destroy
destroy(this.cb_1)
destroy(this.cb_salir)
destroy(this.cb_buscar)
destroy(this.dw_criterios)
destroy(this.gb_1)
destroy(this.dw_busqueda)
destroy(this.mle_1)
end on

event open;

//CHILD TIPO DE ESPACIO
dw_criterios.settransobject(gtr_sumuia)
dw_criterios.getchild('tipo_espacio',idwc_tipoespacio)
idwc_tipoespacio.settransobject(gtr_sumuia)
idwc_tipoespacio.retrieve(gi_depto,gi_area)


//CHILD ESPACIO
dw_criterios.settransobject(gtr_sumuia)
dw_criterios.getchild('espacio',idwc_espacio)
idwc_espacio.settransobject(gtr_sumuia)
idwc_espacio.retrieve(gi_depto,gi_area,1)
//idwc_espacio.insertrow(1)

////CHILD REQUERIMIENTOS
//dw_criterios.settransobject(gtr_sumuia)
//dw_criterios.getchild('requerimientos',idwc_requerimientos)
//idwc_requerimientos.settransobject(gtr_sumuia)
//idwc_requerimientos.retrieve()
//idwc_requerimientos.insertrow(1)


dw_criterios.insertrow(0)
dw_criterios.setitem(1,'status',0)
dw_criterios.setitem(1,'fechaini',relativedate(today(),-15))
dw_criterios.setitem(1,'fechafin',today())
dw_busqueda.settransobject(gtr_sumuia)


end event

event activate;string ls_consulta
if mle_1.text<>"" then
	ls_consulta=trim(mle_1.text)
	dw_busqueda.setsqlselect(ls_consulta)
	dw_busqueda.retrieve()
end if
end event

type cb_1 from commandbutton within w_adm_consulta_busq
integer x = 3296
integer y = 428
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;
dw_criterios.reset()
dw_busqueda.reset()
dw_criterios.insertrow(0)
dw_criterios.setitem(1,'status',0)
dw_criterios.setitem(1,'fechaini',relativedate(today(),-15))
dw_criterios.setitem(1,'fechafin',today())
dw_busqueda.settransobject(gtr_sumuia)
end event

type cb_salir from commandbutton within w_adm_consulta_busq
integer x = 3296
integer y = 116
integer width = 402
integer height = 112
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

type cb_buscar from commandbutton within w_adm_consulta_busq
integer x = 3296
integer y = 304
integer width = 402
integer height = 112
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
datetime		ldt_fecha_hora_ini,ldt_fecha_hora_fin
integer 		li_hrsini,li_hrsfin, li_tipo_sol, li_folio
date			ld_fechaini,ld_fechafin
integer 		li_tipo_espacio,  li_status, li_requerimientos,li_tipo_nombre
string 		ls_personas,ls_evento,ls_espacios



dw_criterios.accepttext()
mle_1.text=""

ld_fechaini=dw_criterios.getitemdate(1,'fechaini')
ld_fechafin=dw_criterios.getitemdate(1,'fechafin')
li_status=dw_criterios.getitemnumber(1,'status')
li_requerimientos=dw_criterios.getitemnumber(1,'requerimientos')
li_tipo_nombre=dw_criterios.getitemnumber(1,'tipo_nombre')
ls_espacios=dw_criterios.getitemstring(1,'espacio')
ls_personas=dw_criterios.getitemstring(1,'nombres')

dw_busqueda.dataobject='d_adm_busq_resv1'
dw_busqueda.settransobject(gtr_sumuia)
wf_crea_busqueda(ldt_fecha_hora_ini,ldt_fecha_hora_fin)



end event

type dw_criterios from datawindow within w_adm_consulta_busq
integer x = 78
integer y = 100
integer width = 3086
integer height = 480
integer taborder = 20
string title = "none"
string dataobject = "d_adm_criterios_busq"
boolean border = false
boolean livescroll = true
end type

event itemchanged;if string(dwo.name)='tipo_espacio' then
	idwc_espacio.settransobject(gtr_sumuia)
	idwc_espacio.retrieve(gi_depto,gi_area,integer(data))
	idwc_espacio.insertrow(1)
end if
end event

type gb_1 from groupbox within w_adm_consulta_busq
integer x = 55
integer y = 24
integer width = 3753
integer height = 576
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Seleccione los criterios que desee"
end type

type dw_busqueda from datawindow within w_adm_consulta_busq
integer x = 59
integer y = 644
integer width = 3767
integer height = 1064
integer taborder = 20
boolean titlebar = true
string title = "Espacios Reservados"
string dataobject = "d_adm_busq_resv1"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

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
//	li_tipo=1
//
//	uo_parametros.id_parm1=dw_criterios.getitemdate(1,'fechaini')
//	uo_parametros.id_parm2=dw_criterios.getitemdate(1,'fechafin')
//	uo_parametros.ii_parm1=li_tipo
////	uo_parametros.ii_parm2=dw_criterios.getitemnumber(1,'horarioini')
////	uo_parametros.ii_parm3=dw_criterios.getitemnumber(1,'horariofin')
//	uo_parametros.ii_parm2=00
//	uo_parametros.ii_parm3=29
//	uo_parametros.ii_parm4=	this.getitemnumber(row,'folio')
//	uo_parametros.is_parm1=this.getitemstring(row,'cvematerial')	
//	uo_parametros.is_parm2=this.getitemstring(row,'descripcion')
//	uo_parametros.ii_parm5=this.getitemnumber(row,'cvegrupo')
//
//opensheetwithparm(w_sre_solicitud_espacio,uo_parametros,w_ppal,0,original!)
//end if
end event

type mle_1 from multilineedit within w_adm_consulta_busq
boolean visible = false
integer x = 3890
integer y = 872
integer width = 73
integer height = 40
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

