$PBExportHeader$w_csal_reporte_salones.srw
forward
global type w_csal_reporte_salones from window
end type
type cbx_limpiar from checkbox within w_csal_reporte_salones
end type
type dw_csal_profesor from u_basedw within w_csal_reporte_salones
end type
type st_materia from statictext within w_csal_reporte_salones
end type
type st_salon from statictext within w_csal_reporte_salones
end type
type sle_salon from singlelineedit within w_csal_reporte_salones
end type
type st_profesor from statictext within w_csal_reporte_salones
end type
type dw_csal_materias_grupo from u_basedw within w_csal_reporte_salones
end type
type cb_filtrar from commandbutton within w_csal_reporte_salones
end type
type cbx_extraordinarias from checkbox within w_csal_reporte_salones
end type
type cbx_temporales from checkbox within w_csal_reporte_salones
end type
type cbx_permanentes from checkbox within w_csal_reporte_salones
end type
type st_periodo from statictext within w_csal_reporte_salones
end type
type st_anio from statictext within w_csal_reporte_salones
end type
type dw_csal_salones_temporales from datawindow within w_csal_reporte_salones
end type
type dw_csal_salones_permanentes from datawindow within w_csal_reporte_salones
end type
type cb_cargar from commandbutton within w_csal_reporte_salones
end type
type sle_periodo from singlelineedit within w_csal_reporte_salones
end type
type sle_anio from singlelineedit within w_csal_reporte_salones
end type
type dw_csal_rep_salones from datawindow within w_csal_reporte_salones
end type
type gb_filtros from groupbox within w_csal_reporte_salones
end type
type gb_parametros from groupbox within w_csal_reporte_salones
end type
type dw_csal_materias from u_basedw within w_csal_reporte_salones
end type
end forward

global type w_csal_reporte_salones from window
integer width = 6802
integer height = 2493
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cbx_limpiar cbx_limpiar
dw_csal_profesor dw_csal_profesor
st_materia st_materia
st_salon st_salon
sle_salon sle_salon
st_profesor st_profesor
dw_csal_materias_grupo dw_csal_materias_grupo
cb_filtrar cb_filtrar
cbx_extraordinarias cbx_extraordinarias
cbx_temporales cbx_temporales
cbx_permanentes cbx_permanentes
st_periodo st_periodo
st_anio st_anio
dw_csal_salones_temporales dw_csal_salones_temporales
dw_csal_salones_permanentes dw_csal_salones_permanentes
cb_cargar cb_cargar
sle_periodo sle_periodo
sle_anio sle_anio
dw_csal_rep_salones dw_csal_rep_salones
gb_filtros gb_filtros
gb_parametros gb_parametros
dw_csal_materias dw_csal_materias
end type
global w_csal_reporte_salones w_csal_reporte_salones

type variables

DatawindowChild idwc_materias, idwc_materias_grupo, idwc_profesor

string is_salon='', is_grupo='', is_sort='#1A #7A #9A #14A'
long il_profesor=0, il_materia=0

integer ii_anio, ii_periodo

end variables

forward prototypes
public subroutine uf_cargar_reservados ()
public subroutine uf_limpiar_filtro ()
end prototypes

public subroutine uf_cargar_reservados ();integer li_perma, li_i, li_control=0, li_lapso_actual, li_temp_dia
integer li_cve_dia, li_dias_lapso, li_dia_fecha, li_k
string ls_lapso='', ls_fecha=''
date ld_fecha_inicio, ld_fecha_final, ld_fecha


this.title='Cargando... '
SetPointer(HourGlass!)

dw_csal_rep_salones.reset()
dw_csal_rep_salones.SetRedraw(false)
dw_csal_salones_permanentes.reset()
dw_csal_salones_temporales.reset()

	dw_csal_salones_permanentes.retrieve(ii_periodo,ii_anio)
	li_perma=dw_csal_salones_permanentes.rowcount()

	for li_i=1 to li_perma
		
		li_control=li_control+1
		dw_csal_rep_salones.insertrow(0)
		dw_csal_rep_salones.SetItem(li_control, "cve_salon", dw_csal_salones_permanentes.GetItemString(li_i,"cve_salon"))	
		dw_csal_rep_salones.SetItem(li_control, "cve_materia", dw_csal_salones_permanentes.GetItemNumber(li_i,"cve_materia"))	
		dw_csal_rep_salones.SetItem(li_control, "cve_profesor", dw_csal_salones_permanentes.GetItemNumber(li_i,"cve_profesor"))	
		dw_csal_rep_salones.SetItem(li_control, "cve_dia", dw_csal_salones_permanentes.GetItemNumber(li_i,"cve_dia"))	
		dw_csal_rep_salones.SetItem(li_control, "hora_inicio", dw_csal_salones_permanentes.GetItemNumber(li_i,"hora_inicio"))	
		dw_csal_rep_salones.SetItem(li_control, "hora_final", dw_csal_salones_permanentes.GetItemNumber(li_i,"hora_final"))	
		dw_csal_rep_salones.SetItem(li_control, "cve_grupo", dw_csal_salones_permanentes.GetItemString(li_i,"cve_grupo"))	
		dw_csal_rep_salones.SetItem(li_control, "inscritos", dw_csal_salones_permanentes.GetItemNumber(li_i,"grupos_inscritos"))	
		dw_csal_rep_salones.SetItem(li_control, "cupo_real", dw_csal_salones_permanentes.GetItemNumber(li_i,"salon_cupo_real"))	
		dw_csal_rep_salones.SetItem(li_control, "estatus", 1)
		dw_csal_rep_salones.SetItem(li_control, "lapso_completo",0)
	
		dw_csal_rep_salones.SetItem(li_control, "tipo_reservacion",f_select_nombre_estatus(1))
		dw_csal_rep_salones.SetItem(li_control, "nom_dia",f_select_nombre_dia(dw_csal_salones_permanentes.GetItemNumber(li_i,"cve_dia")))	
		dw_csal_rep_salones.SetItem(li_control, "lapso",'PERIODO ESCOLAR')
		dw_csal_rep_salones.SetItem(li_control, "horario",string(dw_csal_salones_permanentes.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_salones_permanentes.GetItemNumber(li_i,"hora_final")))
		dw_csal_rep_salones.SetItem(li_control, "nom_profesor",f_select_nombre_profesor(dw_csal_salones_permanentes.GetItemNumber(li_i,"cve_profesor")))		
		dw_csal_rep_salones.SetItem(li_control, "nom_materia",f_select_nombre_materia(dw_csal_salones_permanentes.GetItemNumber(li_i,"cve_materia")))		
	next
	
	dw_csal_salones_temporales.retrieve(ii_periodo,ii_anio)
	li_temp_dia=dw_csal_salones_temporales.rowcount()
					
	for li_i=1 to li_temp_dia
					
		li_lapso_actual=dw_csal_salones_temporales.GetItemNumber(li_i,"lapso_completo")	
		if (dw_csal_rep_salones.Find("lapso_completo>0 and lapso_completo="+string(li_lapso_actual),1,li_control))>0 then goto sigue 

		li_control=li_control+1
		dw_csal_rep_salones.insertrow(0)
		dw_csal_rep_salones.SetItem(li_control, "cve_salon", dw_csal_salones_temporales.GetItemString(li_i,"cve_salon"))	
		dw_csal_rep_salones.SetItem(li_control, "cve_materia", dw_csal_salones_temporales.GetItemNumber(li_i,"cve_materia"))	
		dw_csal_rep_salones.SetItem(li_control, "cve_profesor", dw_csal_salones_temporales.GetItemNumber(li_i,"cve_profesor"))	
		dw_csal_rep_salones.SetItem(li_control, "cve_dia", dw_csal_salones_temporales.GetItemNumber(li_i,"cve_dia"))	
		dw_csal_rep_salones.SetItem(li_control, "hora_inicio", dw_csal_salones_temporales.GetItemNumber(li_i,"hora_inicio"))	
		dw_csal_rep_salones.SetItem(li_control, "hora_final", dw_csal_salones_temporales.GetItemNumber(li_i,"hora_final"))	
		dw_csal_rep_salones.SetItem(li_control, "fecha_movimiento", dw_csal_salones_temporales.GetItemDateTime(li_i,"fecha_movimiento"))	
		dw_csal_rep_salones.SetItem(li_control, "fecha_inicio", dw_csal_salones_temporales.GetItemDateTime(li_i,"fecha_inicio"))		
		dw_csal_rep_salones.SetItem(li_control, "fecha_final",  dw_csal_salones_temporales.GetItemDateTime(li_i,"fecha_final"))	
		dw_csal_rep_salones.SetItem(li_control, "cve_grupo", dw_csal_salones_temporales.GetItemString(li_i,"cve_grupo"))	
		dw_csal_rep_salones.SetItem(li_control, "estatus", dw_csal_salones_temporales.GetItemNumber(li_i,"estatus"))	
		dw_csal_rep_salones.SetItem(li_control, "lapso_completo", dw_csal_salones_temporales.GetItemNumber(li_i,"lapso_completo"))	
		dw_csal_rep_salones.SetItem(li_control, "observaciones", dw_csal_salones_temporales.GetItemString(li_i,"observaciones"))	
		
		dw_csal_rep_salones.SetItem(li_control, "tipo_reservacion", f_select_nombre_estatus(dw_csal_salones_temporales.GetItemNumber(li_i,"estatus")))	
		dw_csal_rep_salones.SetItem(li_control, "nom_dia", f_select_nombre_dia(dw_csal_salones_temporales.GetItemNumber(li_i,"cve_dia"))	)
		dw_csal_rep_salones.SetItem(li_control, "horario",string(dw_csal_salones_temporales.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_salones_temporales.GetItemNumber(li_i,"hora_final")))
		dw_csal_rep_salones.SetItem(li_control, "nom_profesor", f_select_nombre_profesor(dw_csal_salones_temporales.GetItemNumber(li_i,"cve_profesor")))	
		if dw_csal_salones_temporales.GetItemNumber(li_i,"cve_materia")=0 then dw_csal_rep_salones.SetItem(li_control, "nom_materia","NO ASIGNADA") else dw_csal_rep_salones.SetItem(li_control, "nom_materia",f_select_nombre_materia(dw_csal_salones_temporales.GetItemNumber(li_i,"cve_materia")))  
	
		ld_fecha_inicio=date(dw_csal_salones_temporales.GetItemDateTime(li_i,"fecha_inicio"))
		ld_fecha_final=date(dw_csal_salones_temporales.GetItemDateTime(li_i,"fecha_final"))
								
		if (dw_csal_salones_temporales.GetItemNumber(li_i,"lapso_completo"))=0 then	
						
			li_cve_dia=dw_csal_salones_temporales.GetItemNumber(li_i,"cve_dia")
			li_dias_lapso=DaysAfter(ld_fecha_inicio,ld_fecha_final)+1
			ls_lapso=''
						
			for li_k=1 to li_dias_lapso
				ld_fecha=RelativeDate(ld_fecha_inicio,li_k -1)
				li_dia_fecha=Daynumber(ld_fecha)-1
							
				if li_dia_fecha=li_cve_dia then
					ls_fecha=f_convierte_fecha_texto(ld_fecha)
					if ls_lapso='' then ls_lapso=ls_fecha else 	ls_lapso=ls_lapso+', '+ls_fecha
				 end if
			 next
						
			dw_csal_rep_salones.SetItem(li_control, "lapso",ls_lapso)
						
		else
			dw_csal_rep_salones.SetItem(li_control, "nom_dia",'TODOS')
			dw_csal_rep_salones.SetItem(li_control,"cve_dia",-1)
			dw_csal_rep_salones.SetItem(li_control, "lapso",f_convierte_fecha_texto(ld_fecha_inicio)+' AL '+f_convierte_fecha_texto(ld_fecha_final))
		end if					
					
		sigue:
					
	next
	
if dw_csal_rep_salones.rowcount()>0 then dw_csal_rep_salones.ScrollToRow(1)
dw_csal_rep_salones.SetSort(is_sort)
dw_csal_rep_salones.Sort()
dw_csal_rep_salones.SetFocus()

dw_csal_rep_salones.SetRedraw(true)
this.title='Reporte de Salones Reservados'
SetPointer(Arrow!)

if dw_csal_rep_salones.rowcount()>0 then
	cbx_permanentes.enabled=true
	cbx_temporales.enabled=true
	cbx_extraordinarias.enabled=true
	sle_salon.enabled=true
	dw_csal_profesor.enabled=true
	dw_csal_materias.enabled=true
	dw_csal_materias_grupo.enabled=true
	cb_filtrar.enabled=true
	cbx_limpiar.enabled=true
else
	cbx_permanentes.enabled=false
	cbx_temporales.enabled=false
	cbx_extraordinarias.enabled=false
	sle_salon.enabled=false
	dw_csal_profesor.enabled=false
	dw_csal_materias.enabled=false
	dw_csal_materias_grupo.enabled=false	
	cb_filtrar.enabled=false
	cbx_limpiar.enabled=false
end if


end subroutine

public subroutine uf_limpiar_filtro ();		sle_salon.text=''
		cbx_permanentes.checked=true
		cbx_temporales.checked=true
		cbx_extraordinarias.checked=true

		//Profesor
		dw_csal_profesor.SetRedraw(false)
		dw_csal_profesor.Reset()
		idwc_profesor.Retrieve()
		if idwc_profesor.RowCount()>0 then dw_csal_profesor.InsertRow(0)
		dw_csal_profesor.SetRedraw(true)	
		
		//Materia
		dw_csal_materias.Reset()
		idwc_materias.Reset()
		idwc_materias.Retrieve(ii_anio,ii_periodo)
		if idwc_materias.RowCount()>0 then dw_csal_materias.insertrow(0)

		//Grupos de una Materia
		dw_csal_materias_grupo.Reset()
		idwc_materias_grupo.Reset()
		
		is_salon=''
		il_profesor=0
		il_materia=0
		is_grupo=''
end subroutine

on w_csal_reporte_salones.create
this.cbx_limpiar=create cbx_limpiar
this.dw_csal_profesor=create dw_csal_profesor
this.st_materia=create st_materia
this.st_salon=create st_salon
this.sle_salon=create sle_salon
this.st_profesor=create st_profesor
this.dw_csal_materias_grupo=create dw_csal_materias_grupo
this.cb_filtrar=create cb_filtrar
this.cbx_extraordinarias=create cbx_extraordinarias
this.cbx_temporales=create cbx_temporales
this.cbx_permanentes=create cbx_permanentes
this.st_periodo=create st_periodo
this.st_anio=create st_anio
this.dw_csal_salones_temporales=create dw_csal_salones_temporales
this.dw_csal_salones_permanentes=create dw_csal_salones_permanentes
this.cb_cargar=create cb_cargar
this.sle_periodo=create sle_periodo
this.sle_anio=create sle_anio
this.dw_csal_rep_salones=create dw_csal_rep_salones
this.gb_filtros=create gb_filtros
this.gb_parametros=create gb_parametros
this.dw_csal_materias=create dw_csal_materias
this.Control[]={this.cbx_limpiar,&
this.dw_csal_profesor,&
this.st_materia,&
this.st_salon,&
this.sle_salon,&
this.st_profesor,&
this.dw_csal_materias_grupo,&
this.cb_filtrar,&
this.cbx_extraordinarias,&
this.cbx_temporales,&
this.cbx_permanentes,&
this.st_periodo,&
this.st_anio,&
this.dw_csal_salones_temporales,&
this.dw_csal_salones_permanentes,&
this.cb_cargar,&
this.sle_periodo,&
this.sle_anio,&
this.dw_csal_rep_salones,&
this.gb_filtros,&
this.gb_parametros,&
this.dw_csal_materias}
end on

on w_csal_reporte_salones.destroy
destroy(this.cbx_limpiar)
destroy(this.dw_csal_profesor)
destroy(this.st_materia)
destroy(this.st_salon)
destroy(this.sle_salon)
destroy(this.st_profesor)
destroy(this.dw_csal_materias_grupo)
destroy(this.cb_filtrar)
destroy(this.cbx_extraordinarias)
destroy(this.cbx_temporales)
destroy(this.cbx_permanentes)
destroy(this.st_periodo)
destroy(this.st_anio)
destroy(this.dw_csal_salones_temporales)
destroy(this.dw_csal_salones_permanentes)
destroy(this.cb_cargar)
destroy(this.sle_periodo)
destroy(this.sle_anio)
destroy(this.dw_csal_rep_salones)
destroy(this.gb_filtros)
destroy(this.gb_parametros)
destroy(this.dw_csal_materias)
end on

event open;dw_csal_salones_permanentes.setTransObject(gtr_escolar)
dw_csal_salones_temporales.setTransObject(gtr_sumuia)
 
//Profesor
dw_csal_profesor.settransobject(gtr_escolar)
dw_csal_profesor.getchild('profesor',idwc_profesor)
idwc_profesor.settransobject(gtr_escolar)

//Materias
dw_csal_materias.settransobject(gtr_escolar)
dw_csal_materias.getchild('materia',idwc_materias)
idwc_materias.settransobject(gtr_escolar)

//Grupos de una Materia
dw_csal_materias_grupo.settransobject(gtr_escolar)
dw_csal_materias_grupo.getchild('gpo',idwc_materias_grupo)
idwc_materias_grupo.settransobject(gtr_escolar)






end event

type cbx_limpiar from checkbox within w_csal_reporte_salones
integer x = 4078
integer y = 237
integer width = 282
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Limpiar"
end type

event clicked;uf_limpiar_filtro()

dw_csal_rep_salones.SetRedraw(false)
dw_csal_rep_salones.SetFilter('')
dw_csal_rep_salones.Filter()
dw_csal_rep_salones.SetRedraw(true)

this.checked=false
end event

type dw_csal_profesor from u_basedw within w_csal_reporte_salones
integer x = 2659
integer y = 115
integer width = 1360
integer height = 93
integer taborder = 80
boolean enabled = false
string dataobject = "d_csal_profesor_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("profesor", "profesor", "profesor")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then il_profesor=long(trim(this.gettext()))




end event

type st_materia from statictext within w_csal_reporte_salones
integer x = 1755
integer y = 250
integer width = 252
integer height = 93
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Materia:"
boolean focusrectangle = false
end type

type st_salon from statictext within w_csal_reporte_salones
integer x = 1752
integer y = 128
integer width = 234
integer height = 93
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Salón:"
boolean focusrectangle = false
end type

type sle_salon from singlelineedit within w_csal_reporte_salones
integer x = 2026
integer y = 118
integer width = 289
integer height = 93
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;is_salon=trim(this.text)
end event

type st_profesor from statictext within w_csal_reporte_salones
integer x = 2355
integer y = 128
integer width = 285
integer height = 93
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Profesor:"
boolean focusrectangle = false
end type

type dw_csal_materias_grupo from u_basedw within w_csal_reporte_salones
integer x = 3419
integer y = 234
integer width = 212
integer height = 93
integer taborder = 100
boolean enabled = false
string dataobject = "d_csal_materias_grupos_drop"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("gpo", "gpo", "gpo")
end event

event itemchanged;call super::itemchanged;is_grupo=this.gettext()

end event

type cb_filtrar from commandbutton within w_csal_reporte_salones
integer x = 4096
integer y = 115
integer width = 274
integer height = 90
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Filtrar"
end type

event clicked;string ls_filtro='', ls_estatus='', is_grupo_asimilado
long ll_materia_asimilada=0

dw_csal_rep_salones.SetRedraw(false)
dw_csal_rep_salones.SetFilter(ls_filtro)
dw_csal_rep_salones.Filter()

//Estatus
estatus:
if cbx_permanentes.checked=true then ls_estatus=',1'
if cbx_temporales.checked=true then ls_estatus=ls_estatus+',2'
if cbx_extraordinarias.checked=true then ls_estatus=ls_estatus+',4'

ls_estatus=mid(ls_estatus,2)
ls_filtro=" and estatus in ("+ls_estatus+")"

if ls_filtro=" and estatus in ()" then 
	cbx_permanentes.checked=true
	cbx_temporales.checked=true
	cbx_extraordinarias.checked=true
	goto estatus
end if

//Salon
if is_salon<>'' then ls_filtro=ls_filtro+" and cve_salon='"+is_salon+"'"

//Profesor
if il_profesor>0 then ls_filtro=ls_filtro+" and cve_profesor="+string(il_profesor)

//Materia
if il_materia>0 then 
	
	//Grupo
	if is_grupo<>'' then
	
		if f_valida_es_asimilada(il_materia,is_grupo,ii_periodo,ii_anio)>0 then
			
			f_select_padre_asimilada_valor(il_materia,is_grupo,ll_materia_asimilada,is_grupo_asimilado,ii_periodo,ii_anio)
			ls_filtro=ls_filtro+" and ((cve_materia="+string(il_materia)+" and cve_grupo='"+is_grupo+"') or (cve_materia="+string(ll_materia_asimilada)+" and cve_grupo='"+is_grupo_asimilado+"'))"
		else
			ls_filtro=ls_filtro+" and cve_materia="+string(il_materia)+" and cve_grupo='"+is_grupo+"'"
		end if

	else
	
		ls_filtro=ls_filtro+" and cve_materia="+string(il_materia)
	
	end if
			
end if


ls_filtro=mid(ls_filtro,6)

dw_csal_rep_salones.SetFilter(ls_filtro)
dw_csal_rep_salones.Filter()
dw_csal_rep_salones.SetRedraw(true)

end event

type cbx_extraordinarias from checkbox within w_csal_reporte_salones
integer x = 1167
integer y = 269
integer width = 523
integer height = 93
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Extraordinarias"
boolean checked = true
end type

type cbx_temporales from checkbox within w_csal_reporte_salones
integer x = 1167
integer y = 160
integer width = 413
integer height = 93
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Temporales"
boolean checked = true
end type

type cbx_permanentes from checkbox within w_csal_reporte_salones
integer x = 1167
integer y = 61
integer width = 516
integer height = 93
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Permanentes"
boolean checked = true
end type

type st_periodo from statictext within w_csal_reporte_salones
integer x = 91
integer y = 250
integer width = 263
integer height = 93
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Periodo:"
boolean focusrectangle = false
end type

type st_anio from statictext within w_csal_reporte_salones
integer x = 91
integer y = 125
integer width = 157
integer height = 93
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Año:"
boolean focusrectangle = false
end type

type dw_csal_salones_temporales from datawindow within w_csal_reporte_salones
boolean visible = false
integer x = 4820
integer y = 346
integer width = 150
integer height = 80
string title = "none"
string dataobject = "d_csal_salones_temporales"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_csal_salones_permanentes from datawindow within w_csal_reporte_salones
boolean visible = false
integer x = 4846
integer y = 150
integer width = 143
integer height = 99
string title = "none"
string dataobject = "d_csal_salones_permanentes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cargar from commandbutton within w_csal_reporte_salones
integer x = 644
integer y = 109
integer width = 307
integer height = 93
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cargar"
end type

event clicked;
if isnumber(trim(sle_anio.text)) then
	
	if isnumber(trim(sle_periodo.text)) then
		 
		ii_periodo=integer(	sle_periodo.text)
		ii_anio=integer(	sle_anio.text)
		
		uf_cargar_reservados()
		
		uf_limpiar_filtro()
		
	else
		
		messagebox ("Error","Introduzca un valor de periodo correcto")
		
	end if
	
else
	
	messagebox ("Error","Introduzca un valor de año correcto")

end if


end event

type sle_periodo from singlelineedit within w_csal_reporte_salones
integer x = 380
integer y = 234
integer width = 179
integer height = 93
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 33554431
borderstyle borderstyle = stylelowered!
end type

type sle_anio from singlelineedit within w_csal_reporte_salones
integer x = 380
integer y = 112
integer width = 183
integer height = 93
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_csal_rep_salones from datawindow within w_csal_reporte_salones
integer x = 44
integer y = 429
integer width = 6660
integer height = 1888
string dataobject = "d_csal_rep_salones"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;integer li_row
str_csal_salones_reservacion lstr_reservacion

if dwo.Type = "column" then
	
		if row>0 then

			li_row=row
			 
			if isvalid(w_csal_ficha_salon) then close(w_csal_ficha_salon) 

			lstr_reservacion.salon=this.GetItemString(li_row,"cve_salon") 
			lstr_reservacion.materia=this.GetItemString(li_row,"nom_materia") 
			lstr_reservacion.profesor=this.GetItemString(li_row,"nom_profesor") 
			lstr_reservacion.dia=this.GetItemString(li_row,"nom_dia") 
			lstr_reservacion.hora_inicio=this.GetItemNumber(li_row,"hora_inicio")
			lstr_reservacion.hora_final=this.GetItemNumber(li_row,"hora_final")
			lstr_reservacion.fecha_inicio=date(this.GetItemDateTime(li_row,"fecha_inicio"))
			lstr_reservacion.fecha_final=date(this.GetItemDateTime(li_row,"fecha_final"))
			lstr_reservacion.fecha_movimiento=this.GetItemDate(li_row,"fecha_movimiento")
			lstr_reservacion.grupo=this.GetItemString(li_row,"cve_grupo")
			lstr_reservacion.tipo_reservacion=this.GetItemString(li_row,"tipo_reservacion") 
			lstr_reservacion.observaciones=this.GetItemString(li_row,"observaciones") 
			lstr_reservacion.estatus_reservacion=this.GetItemNumber(li_row,"estatus") 
			lstr_reservacion.horario=this.GetItemString(li_row,"horario")
			lstr_reservacion.lapso_completo=this.GetItemNumber(li_row,"lapso_completo")
			lstr_reservacion.lapso=this.GetItemString(li_row,"lapso") 
			lstr_reservacion.cve_dia=this.GetItemNumber(li_row,"cve_dia") 
			lstr_reservacion.cve_materia=this.GetItemNumber(li_row,"cve_materia")
			lstr_reservacion.periodo=ii_periodo
			lstr_reservacion.anio=ii_anio
			
			openwithparm(w_csal_ficha_salon, lstr_reservacion)
			
	end if
	
end if


end event

event clicked;if dwo.Name='p_salvar' then f_exportar_reporte(dw_csal_rep_salones,1,"Reporte de Reservacion de Salones")

	
	if dwo.Type = "text" then
		
		choose case string(dwo.Name)
	
			case 'cve_salon_t'
				is_sort="#1A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='11527407'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("cupo_real_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")				

			case 'nom_profesor_t'
				is_sort="#5A #3A #6A #1A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='11527407'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("cupo_real_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")				

			case 'nom_materia_t'
				is_sort="#3A #6A #1A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='11527407'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("cupo_real_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")				

			case 'cve_grupo_t'
				is_sort="#6A #3A #1A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='11527407'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")
				this.Modify("cupo_real_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")				

			case 'tipo_reservacion_t'
				is_sort="#15A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='11527407'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")				
				this.Modify("cupo_real_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")				

			case 'nom_dia_t'
				is_sort="#7A #9A #1A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='11527407'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")	
				this.Modify("cupo_real_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")				

			case 'horario_t'
				is_sort="#9A #10A #7A #1A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='11527407'")
				this.Modify("lapso_t.background.color='15793151'")	
				this.Modify("cupo_real_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")				

			case 'lapso_t'
				is_sort="#14A #7A #9A #1A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='11527407'")	
				this.Modify("cupo_real_t.background.color='15793151'")
				this.Modify("inscritos_t.background.color='15793151'")				

			case 'cupo_real_t'
				is_sort="#20A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")				
				this.Modify("cupo_real_t.background.color='11527407''")
				this.Modify("inscritos_t.background.color='15793151'")	
				
			case 'inscritos_t'
				is_sort="#20A #7A #9A #14A"
				this.Modify("cve_salon_t.background.color='15793151'")
				this.Modify("nom_profesor_t.background.color='15793151'")
				this.Modify("nom_materia_t.background.color='15793151'")
				this.Modify("cve_grupo_t.background.color='15793151'")
				this.Modify("tipo_reservacion_t.background.color='15793151'")
				this.Modify("nom_dia_t.background.color='15793151'")
				this.Modify("horario_t.background.color='15793151'")
				this.Modify("lapso_t.background.color='15793151'")				
				this.Modify("cupo_real_t.background.color='15793151''")
				this.Modify("inscritos_t.background.color='11527407'")	
				
		end choose

		this.SetSort(is_sort) 
		this.Sort() 		
		
	end if
	
end event

type gb_filtros from groupbox within w_csal_reporte_salones
integer x = 1108
integer width = 3412
integer height = 403
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
boolean enabled = false
string text = "Filtros "
end type

type gb_parametros from groupbox within w_csal_reporte_salones
integer x = 55
integer width = 984
integer height = 403
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Parámetros"
end type

type dw_csal_materias from u_basedw within w_csal_reporte_salones
integer x = 2022
integer y = 234
integer width = 1364
integer height = 93
integer taborder = 90
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_csal_materia_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("materia", "materia", "materia")
end event

event itemchanged;call super::itemchanged;
il_materia=long(this.gettext())
is_grupo=''

dw_csal_materias_grupo.Reset()
idwc_materias_grupo.Reset()

idwc_materias_grupo.retrieve(ii_anio,ii_periodo,il_materia)
if idwc_materias_grupo.RowCount()>0 then dw_csal_materias_grupo.insertrow(0)




end event

