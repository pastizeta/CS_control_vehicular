$PBExportHeader$w_sres_busq_disp_recalendarizar.srw
forward
global type w_sres_busq_disp_recalendarizar from window
end type
type dw_detalle from datawindow within w_sres_busq_disp_recalendarizar
end type
type cbx_ocupados from checkbox within w_sres_busq_disp_recalendarizar
end type
type cb_buscar from commandbutton within w_sres_busq_disp_recalendarizar
end type
type dw_criterios from datawindow within w_sres_busq_disp_recalendarizar
end type
type gb_1 from groupbox within w_sres_busq_disp_recalendarizar
end type
type mle_1 from multilineedit within w_sres_busq_disp_recalendarizar
end type
type dw_busqueda from datawindow within w_sres_busq_disp_recalendarizar
end type
end forward

global type w_sres_busq_disp_recalendarizar from window
integer width = 2601
integer height = 788
boolean titlebar = true
string title = "Búsqueda de Espacios"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 29534863
event ue_envia_param ( )
dw_detalle dw_detalle
cbx_ocupados cbx_ocupados
cb_buscar cb_buscar
dw_criterios dw_criterios
gb_1 gb_1
mle_1 mle_1
dw_busqueda dw_busqueda
end type
global w_sres_busq_disp_recalendarizar w_sres_busq_disp_recalendarizar

type variables
datawindowchild idwc_tipoespacio,idwc_espacio

//		Variables para la Recalendarización

integer iiGrupo
string  isCvematerial
Long iiFolio

integer 	ii_hrsini,ii_hrsfin, ii_minini, ii_minfin, ii_status
date 		id_fechaini,id_fechafin, id_fechainisol, id_fechafinsol, id_fechasol

string is_fecha_string
long  il_fecha_ini, il_fecha_fin 

end variables
forward prototypes
public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin)
public subroutine wf_recalendariza_detalle (n_transportar uo_parametros)
end prototypes

event ue_envia_param();integer ai_tipo

ai_tipo = 1

close(w_sre_solicitud_espacio)

n_transportar uo_parametros

uo_parametros.id_parm1= id_fechaini          
uo_parametros.id_parm2= id_fechafin   

uo_parametros.ii_parm1= ai_tipo
uo_parametros.ii_parm2= ii_hrsini           
uo_parametros.ii_parm3= ii_hrsfin          
uo_parametros.ii_parm6= ii_minini           
uo_parametros.ii_parm7= ii_minfin 
uo_parametros.il_parm4= iiFolio		       
uo_parametros.is_parm1=	isCvematerial			
uo_parametros.ii_parm5=	iiGrupo	

uo_parametros.is_parm2=""
uo_parametros.ii_parm9=1
uo_parametros.ii_parm10=0
uo_parametros.ii_parm11=0
		
opensheetwithparm(w_sre_solicitud_espacio,uo_parametros,w_ppal,0,original!)
		
end event

public subroutine wf_crea_busqueda (datetime ldt_fechaini, datetime ldt_fechafin);string ls_criterio, ls_consulta

ls_criterio=" AND ( (fecha_inicio between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' )"
ls_criterio+= " OR (fecha_final between '"+string (ldt_fechaini,'yyyy-mm-dd hh:mm:ss')+"' and '"+string (ldt_fechafin,'yyyy-mm-dd hh:mm:ss')+"' )  )"
ls_criterio+=" AND ( (datepart(hh,fecha_inicio) >= "+string(dw_criterios.getitemnumber(1,'horarioini'))+ " and  datepart(hh,fecha_inicio) < "+string(dw_criterios.getitemnumber(1,'horariofin'))+" ) "
ls_criterio+=" OR (datepart(hh,fecha_final)+1 >"+string(dw_criterios.getitemnumber(1,'horarioini'))+ "and (datepart(hh,fecha_final)+1<="+string(dw_criterios.getitemnumber(1,'horariofin'))+") ))"

ls_criterio+=" WHERE ( spre_materiales.cvedepto="+string(gi_depto) +" AND spre_materiales.cvearea="+string(gi_area)+" ) "

if not isnull(iiGrupo) then
		ls_criterio+=" AND ( spre_materiales.cvegrupo="+string(iiGrupo)+" ) "
end if

if not isnull(isCvematerial) then
		ls_criterio+=" AND ( spre_materiales.cvematerial='"+isCvematerial+"' ) "
end if

ls_consulta=dw_busqueda.getsqlselect()+ls_criterio
mle_1.text=ls_consulta
dw_busqueda.setsqlselect(ls_consulta)
dw_busqueda.retrieve()
	
end subroutine

public subroutine wf_recalendariza_detalle (n_transportar uo_parametros);integer	li_dias,i,li_linea,li_periodo, liAno
datetime ldt_fecha_inicio,ldt_fecha_final,ldt_fecha
string 	ldt_fecha_inicio1,ldt_fecha_final1
string	lsPeriodo
integer	iAñoFecha
boolean  lb_error

//		BORRAMOS REGISTROS ANTERIORES
//		EN spre sol materiales.
delete spre_sol_materiales
where spre_sol_materiales.cvedepto = :gi_depto
and spre_sol_materiales.folio = :iiFolio
using gtr_sumuia;
 
commit using gtr_sumuia;
								
//

ldt_fecha_inicio = datetime(id_fechaini, time(ii_hrsini,ii_minini,0))
ldt_fecha_final =  datetime(id_fechafin, time(ii_hrsfin,ii_minfin - 1 ,0))


iAñoFecha = integer(Mid(string(ldt_fecha_final,'dd/mm/yyyy'),7,4))
ldt_fecha_inicio1 = string(ldt_fecha_final,'dd/mm/yyyy')
ldt_fecha_final1 = string(ldt_fecha_final,'dd/mm/yyyy')


is_fecha_string = Mid(ldt_fecha_inicio1,7,4) + Mid(ldt_fecha_inicio1,4,2) + Mid(ldt_fecha_inicio1,1,2) 
il_fecha_ini = long(is_fecha_string)
is_fecha_string = Mid(ldt_fecha_final1,7,4) + Mid(ldt_fecha_final1,4,2) + Mid(ldt_fecha_final1,1,2) 
il_fecha_fin = long(is_fecha_string)	

	
if (ii_minfin=0) or (ii_minfin=60) then 
	ii_minfin=60
	ii_hrsfin= ii_hrsfin - 1
end if

	li_dias=daysafter(id_fechaini,id_fechafin)+1
	ldt_fecha_inicio=datetime(id_fechaini,time(ii_hrsini,ii_minini,0))
	ldt_fecha_final=datetime(id_fechaini,time(ii_hrsfin,ii_minfin - 1,0))
	for i=1 to li_dias
		dw_detalle.insertrow(0)
		dw_detalle.setitem(i,'folio',iiFolio)
		dw_detalle.setitem(i,'cvematerial',isCvematerial)
		dw_detalle.setitem(i,'cvegrupo',iiGrupo)
		dw_detalle.setitem(i,'descripcion',' ')
		dw_detalle.setitem(i,'status',ii_status)
		dw_detalle.setitem(i,'consecutivo',i)
		dw_detalle.setitem(i,'cvedepto',gi_depto)
		dw_detalle.setitem(i,'cvearea',1)
		dw_detalle.setitem(i,'fecha_inicio1',ldt_fecha_inicio)
		dw_detalle.setitem(i,'fecha_inicio',ldt_fecha_inicio)
		dw_detalle.setitem(i,'fecha_final1',ldt_fecha_final)
		dw_detalle.setitem(i,'fecha_final',ldt_fecha_final)
		
		ldt_fecha_inicio=datetime(relativedate(id_fechaini,i),time(ii_hrsini,ii_minini,0))
		ldt_fecha_final=datetime(relativedate(id_fechaini,i),time(ii_hrsfin,ii_minfin - 1,0))
		
	next
	
	if dw_detalle.update()<>1 then lb_error=true		
	if not(lb_error) then
		commit using gtr_sumuia;		
		messagebox("Mensaje del Sistema","La información se ha registrado con exito, el reporte de impresion se encuentra listo",information!)
	else
		rollback using gtr_sumuia;
		messagebox("Mensaje del Sistema","Ha ocurrido un error al almacenar la información, revisela e intente nuevamente",stopsign!)
	end if


		
end subroutine

on w_sres_busq_disp_recalendarizar.create
this.dw_detalle=create dw_detalle
this.cbx_ocupados=create cbx_ocupados
this.cb_buscar=create cb_buscar
this.dw_criterios=create dw_criterios
this.gb_1=create gb_1
this.mle_1=create mle_1
this.dw_busqueda=create dw_busqueda
this.Control[]={this.dw_detalle,&
this.cbx_ocupados,&
this.cb_buscar,&
this.dw_criterios,&
this.gb_1,&
this.mle_1,&
this.dw_busqueda}
end on

on w_sres_busq_disp_recalendarizar.destroy
destroy(this.dw_detalle)
destroy(this.cbx_ocupados)
destroy(this.cb_buscar)
destroy(this.dw_criterios)
destroy(this.gb_1)
destroy(this.mle_1)
destroy(this.dw_busqueda)
end on

event open;
n_transportar uo_parametros
uo_parametros = Message.PowerObjectParm

iiFolio=uo_parametros.il_parm1recal
iiGrupo = uo_parametros.ii_parm2recal
isCvematerial = uo_parametros.is_parm1recal

ii_status=uo_parametros.ii_parmstatus
id_fechainisol=uo_parametros.id_parm1sol
id_fechafinsol=uo_parametros.id_parm2sol
id_fechasol=uo_parametros.id_parm3sol


dw_criterios.insertrow(0)
dw_busqueda.settransobject(gtr_sumuia)
dw_detalle.settransobject(gtr_sumuia)

end event

type dw_detalle from datawindow within w_sres_busq_disp_recalendarizar
boolean visible = false
integer x = 151
integer y = 1024
integer width = 105
integer height = 36
integer taborder = 60
string title = "none"
string dataobject = "d_spre_materiales_solrecal"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_ocupados from checkbox within w_sres_busq_disp_recalendarizar
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

type cb_buscar from commandbutton within w_sres_busq_disp_recalendarizar
integer x = 2126
integer y = 456
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
integer 	li_hrsini,li_hrsfin, li_minini, li_minfin, i, li_resp, li_validaFolio
date 		ld_fechaini,ld_fechafin


n_transportar uo_parametros
//uo_parametros = Message.PowerObjectParm

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

				//		Recalendarizar
				if dw_busqueda.rowcount() > 0 then
					li_validaFolio=dw_busqueda.object.folio[1]

					if isnull(dw_busqueda.object.folio[1]) or (dw_busqueda.rowcount() = 1 and (iiFolio = li_validaFolio)) then
						li_resp= MessageBox("Aviso", "El espacio solicitado está libre, Desea recalendarizar el espacio con la fecha solicitada.", Question!,yesno!,1)
						if li_resp =1 then
							for i = 1 to dw_busqueda.rowcount()	
								//		Actualizamos SPRE SOLICITUD
									update spre_solicitud
									set fecha_inicio = :ldt_fecha_hora_ini, fecha_fin = :ldt_fecha_hora_fin
									where spre_solicitud.cvedepto = :gi_depto
									and spre_solicitud.folio = :iiFolio
									using gtr_sumuia;
									commit using gtr_sumuia;
									
									ii_hrsini = li_hrsini
									ii_hrsfin = li_hrsfin
									ii_minini = li_minini
									ii_minfin = li_minfin
									id_fechaini = ld_fechaini
									id_fechafin = ld_fechafin
								
								if (ld_fechaini = ld_fechafin) and (id_fechainisol = id_fechafinsol) then
									
									//		Actualizamos SPRE SOL MATERIALES
									update spre_sol_materiales
									set fecha_inicio = :ldt_fecha_hora_ini, fecha_final = :ldt_fecha_hora_fin
									where spre_sol_materiales.cvedepto = :gi_depto
									and spre_sol_materiales.folio = :iiFolio
									using gtr_sumuia;
									commit using gtr_sumuia;
									messagebox("Aviso","El espacio se actualizo con éxito.")									
								else
									wf_recalendariza_detalle(uo_parametros)
								end if
							next
						end if
					else
						messagebox("Aviso","No hay espacio disponible, para recalendarizar el espacio a la fecha solicitada.")
					end if
					parent.triggerevent("ue_envia_param")
				end if
			else
				messagebox("Mensaje del Sistema", "La fecha final no puede ser anterior a la inicial",stopsign!)
			end if
		end if
	end if
end if




end event

type dw_criterios from datawindow within w_sres_busq_disp_recalendarizar
integer x = 197
integer y = 136
integer width = 1504
integer height = 332
integer taborder = 20
string title = "none"
string dataobject = "d_sres_criteriosbusq_recalend"
boolean border = false
boolean livescroll = true
end type

event itemchanged;if string(dwo.name)='tipo_espacio' then
	idwc_espacio.settransobject(gtr_sumuia)
	idwc_espacio.retrieve(gi_depto,gi_area,integer(data))
//	idwc_espacio.insertrow(1)
end if
end event

type gb_1 from groupbox within w_sres_busq_disp_recalendarizar
integer x = 101
integer y = 44
integer width = 1911
integer height = 508
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Indicar fechas para Recalendarizar Espacio"
end type

type mle_1 from multilineedit within w_sres_busq_disp_recalendarizar
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

type dw_busqueda from datawindow within w_sres_busq_disp_recalendarizar
event ue_ya_existe ( integer row,  integer ai_tipo,  integer ai_sol,  integer ai_reser,  integer ai_conf )
boolean visible = false
integer x = 128
integer y = 996
integer width = 585
integer height = 96
integer taborder = 20
boolean titlebar = true
string title = "Espacios Disponibles"
string dataobject = "d_sres_busq_disp_espacios"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_ya_existe(integer row, integer ai_tipo, integer ai_sol, integer ai_reser, integer ai_conf);//n_transportar uo_parametros
//
//uo_parametros.id_parm1=dw_criterios.getitemdate(1,'fechaini')
//uo_parametros.id_parm2=dw_criterios.getitemdate(1,'fechafin')
//uo_parametros.ii_parm1=ai_tipo
//uo_parametros.ii_parm2=dw_criterios.getitemnumber(1,'horarioini')
//uo_parametros.ii_parm3=dw_criterios.getitemnumber(1,'horariofin')
//uo_parametros.ii_parm6=dw_criterios.getitemnumber(1,'minutoini')
//uo_parametros.ii_parm7=dw_criterios.getitemnumber(1,'minutofin')
//uo_parametros.ii_parm4=	this.getitemnumber(row,'folio')
//uo_parametros.is_parm1=this.getitemstring(row,'cvematerial')
//uo_parametros.ii_parm5=	this.getitemnumber(row,'cvegrupo')
//uo_parametros.is_parm2=this.getitemstring(row,'descripcion')
//uo_parametros.ii_parm9=ai_sol
//uo_parametros.ii_parm10=ai_reser
//uo_parametros.ii_parm11=ai_conf
//
//opensheetwithparm(w_sre_solicitud_espacio,uo_parametros,w_ppal,0,original!)
end event

event rowfocuschanged;//if currentrow>0 then
//	selectrow(0,false)
//	selectrow(currentrow,true)
//else
//	selectrow(0,false)
//end if
//
//
//
//
end event

