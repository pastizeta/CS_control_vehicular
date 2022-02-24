$PBExportHeader$w_com_busq_disp.srw
$PBExportComments$Busca espacios disponibles laboratorios de comunicación
forward
global type w_com_busq_disp from window
end type
type cbx_ocupados from checkbox within w_com_busq_disp
end type
type cb_salir from commandbutton within w_com_busq_disp
end type
type cb_buscar from commandbutton within w_com_busq_disp
end type
type dw_criterios from datawindow within w_com_busq_disp
end type
type gb_1 from groupbox within w_com_busq_disp
end type
type mle_1 from multilineedit within w_com_busq_disp
end type
type dw_busqueda from datawindow within w_com_busq_disp
end type
end forward

global type w_com_busq_disp from window
integer width = 3081
integer height = 1888
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
global w_com_busq_disp w_com_busq_disp

type variables
datawindowchild idwc_tipoespacio,idwc_espacio
end variables

forward prototypes
public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin)
end prototypes

public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin);string ls_criterio  = '', ls_consulta = ''
long i

If cbx_ocupados.checked Then
	ls_consulta = dw_busqueda.getsqlselect()
	
	ls_criterio=" AND ( spre_materiales.cvedepto="+string(gi_depto) +" AND spre_materiales.cvearea="+string(gi_area)+" ) AND ( spre_sol_materiales.status in (0,1,2) ) "
	ls_criterio+=" AND ((( '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' >= spre_sol_materiales.fecha_inicio) AND ( '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' <= spre_sol_materiales.fecha_final)) OR "
	ls_criterio+=" (( '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' >= spre_sol_materiales.fecha_inicio) AND ( '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' <= spre_sol_materiales.fecha_final)) OR "
	ls_criterio+=" (( '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' <= spre_sol_materiales.fecha_inicio) AND ( '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' >= spre_sol_materiales.fecha_final))) "
	
	if not isnull(dw_criterios.getitemnumber(1,'tipo_espacio')) then
			ls_criterio += " AND ( spre_materiales.cvegrupo="+string(dw_criterios.getitemnumber(1,'tipo_espacio'))+" ) "
	end if
	
	if not isnull(dw_criterios.getitemstring(1,'espacio')) then
			ls_criterio+=" AND ( spre_materiales.cvematerial='"+dw_criterios.getitemstring(1,'espacio')+"' ) "
	end if
	
	
	if not isnull(dw_criterios.getitemnumber(1,'cupo')) then
			ls_criterio+=" AND ( spre_materiales.cupo>="+string(dw_criterios.getitemnumber(1,'cupo'))+" ) "
	end if
Else
	ls_consulta = "SELECT DISTINCT B.descripcion, B.marca, B.tipo_aula, B.edificio, B.nivel, B.cupo, 	B.cvematerial, B.cvegrupo, B.cvedepto, B.cvearea, "
	ls_consulta = ls_consulta + "(SELECT COUNT(A.fecha_inicio) FROM spre_sol_materiales A WHERE  A.status IN (0,1,2) AND A.cvematerial = B.cvematerial "
	ls_consulta = ls_consulta + "AND A.cvedepto = B.cvedepto AND A.cvearea = B.cvearea AND A.cvegrupo = B.cvegrupo "
	ls_consulta = ls_consulta + "AND ((( '" + string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss') + "' >= A.fecha_inicio) AND ( '" + string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss') + "' <= A.fecha_final)) "
	ls_consulta = ls_consulta + "OR   (( '" + string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss') + "' >= A.fecha_inicio) AND ( '" + string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss') + "' <= A.fecha_final)) "
	ls_consulta = ls_consulta + "OR   (( '" + string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss') + "' <= A.fecha_inicio) AND ( '" + string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss') + "' >= A.fecha_final)))) as disponible "
	ls_consulta = ls_consulta + "FROM spre_materiales B WHERE B.cvedepto =" + string (gi_depto) + " AND B.cvearea = " + string (gi_area)
	
	if not isnull(dw_criterios.getitemnumber(1,'tipo_espacio')) then
			ls_criterio += " AND ( B.cvegrupo="+string(dw_criterios.getitemnumber(1,'tipo_espacio'))+" ) "
	end if
	
	if not isnull(dw_criterios.getitemstring(1,'espacio')) then
			ls_criterio+=" AND ( B.cvematerial='"+dw_criterios.getitemstring(1,'espacio')+"' ) "
	end if
	
	
	if not isnull(dw_criterios.getitemnumber(1,'cupo')) then
			ls_criterio+=" AND ( B.cupo>="+string(dw_criterios.getitemnumber(1,'cupo'))+" ) "
	end if
End if

ls_consulta = ls_consulta + ls_criterio
//mle_1.text=ls_consulta
dw_busqueda.setsqlselect(ls_consulta)
i = dw_busqueda.retrieve()	

i += 1
	

end subroutine

on w_com_busq_disp.create
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

on w_com_busq_disp.destroy
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

dw_criterios.object.cupo.visible = false
dw_criterios.object.cupo_t.visible = false

dw_busqueda.settransobject(gtr_sumuia)


end event

type cbx_ocupados from checkbox within w_com_busq_disp
boolean visible = false
integer x = 82
integer y = 452
integer width = 805
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Ver Espacios Reservados"
end type

event clicked;//if this.checked then
//	dw_busqueda.dataobject='d_com_busq_disp'
//	dw_busqueda.settransobject(gtr_sumuia)
//	dw_busqueda.setfilter(' disponible > 0 ')
//	dw_busqueda.filter()
//	dw_busqueda.title="Espacios Reservados"
//else
//	dw_busqueda.setfilter(' disponible = 0 ')
//	dw_busqueda.filter()
//	dw_busqueda.title="Espacios Disponibles"
//end if

cb_buscar.triggerevent(clicked!)
end event

type cb_salir from commandbutton within w_com_busq_disp
integer x = 2560
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

type cb_buscar from commandbutton within w_com_busq_disp
integer x = 2560
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
				If cbx_ocupados.checked Then
					dw_busqueda.dataobject='d_com_busq_sol'
					dw_busqueda.settransobject(gtr_sumuia)
					wf_crea_busqueda(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
					cbx_ocupados.visible=true
					dw_busqueda.title="Espacios Solicitados"
				Else
					dw_busqueda.dataobject='d_com_busq_disp'
					dw_busqueda.settransobject(gtr_sumuia)
					wf_crea_busqueda(ldt_fecha_hora_ini,ldt_fecha_hora_fin)
					dw_busqueda.setfilter('folio = 0')					
					dw_busqueda.filter()
					cbx_ocupados.visible=true
					dw_busqueda.title="Espacios Disponibles"
				End if
			else
				messagebox("Mensaje del Sistema", "La fecha final no puede ser menor a la inicial",stopsign!)
			end if
		end if
	end if
end if




end event

type dw_criterios from datawindow within w_com_busq_disp
integer x = 87
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

type gb_1 from groupbox within w_com_busq_disp
integer x = 37
integer y = 16
integer width = 2926
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

type mle_1 from multilineedit within w_com_busq_disp
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

type dw_busqueda from datawindow within w_com_busq_disp
integer x = 41
integer y = 652
integer width = 2921
integer height = 940
integer taborder = 20
boolean titlebar = true
string title = "Espacios Disponibles"
string dataobject = "d_com_busq_disp"
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

event doubleclicked;n_transportar uo_parametros
integer li_tipo

if row>0 then
//uo_parametros = create n_transportar
if cbx_ocupados.checked then
	li_tipo=1
else
	li_tipo=0
end if
	uo_parametros.id_parm1=dw_criterios.getitemdate(1,'fechaini')
	uo_parametros.id_parm2=dw_criterios.getitemdate(1,'fechafin')
	uo_parametros.ii_parm1=li_tipo
	uo_parametros.ii_parm2=dw_criterios.getitemnumber(1,'horarioini')
	uo_parametros.ii_parm3=dw_criterios.getitemnumber(1,'horariofin')
	uo_parametros.ii_parm6=dw_criterios.getitemnumber(1,'minutoini')
	uo_parametros.ii_parm7=dw_criterios.getitemnumber(1,'minutofin')
	uo_parametros.ii_parm4 = this.getitemnumber(row,'folio')
	uo_parametros.is_parm1 = this.getitemstring(row,'cvematerial')
	uo_parametros.ii_parm5 = this.getitemnumber(row,'cvegrupo')
	uo_parametros.is_parm2 = this.getitemstring(row,'descripcion')	

opensheetwithparm(w_com_solicitud_espacio,uo_parametros,w_ppal,0,original!)
end if
end event

