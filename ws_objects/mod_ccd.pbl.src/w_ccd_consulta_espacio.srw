$PBExportHeader$w_ccd_consulta_espacio.srw
forward
global type w_ccd_consulta_espacio from window
end type
type cb_presolicitud from commandbutton within w_ccd_consulta_espacio
end type
type cb_actualizar from commandbutton within w_ccd_consulta_espacio
end type
type dw_exporta_dia from datawindow within w_ccd_consulta_espacio
end type
type dw_ficha from datawindow within w_ccd_consulta_espacio
end type
type dw_prestamos from datawindow within w_ccd_consulta_espacio
end type
type dw_inventario from u_basedw within w_ccd_consulta_espacio
end type
type cb_izquierda from commandbutton within w_ccd_consulta_espacio
end type
type cb_derecha from commandbutton within w_ccd_consulta_espacio
end type
type dw_salones_semana from datawindow within w_ccd_consulta_espacio
end type
type dw_semana from datawindow within w_ccd_consulta_espacio
end type
type dw_materiales from datawindow within w_ccd_consulta_espacio
end type
type dw_dia from datawindow within w_ccd_consulta_espacio
end type
end forward

global type w_ccd_consulta_espacio from window
integer width = 4114
integer height = 2656
boolean titlebar = true
string title = "Calendario de préstamo de espacios"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_presolicitud cb_presolicitud
cb_actualizar cb_actualizar
dw_exporta_dia dw_exporta_dia
dw_ficha dw_ficha
dw_prestamos dw_prestamos
dw_inventario dw_inventario
cb_izquierda cb_izquierda
cb_derecha cb_derecha
dw_salones_semana dw_salones_semana
dw_semana dw_semana
dw_materiales dw_materiales
dw_dia dw_dia
end type
global w_ccd_consulta_espacio w_ccd_consulta_espacio

type variables
date id_diasemana[7]

DatawindowChild idwc_inventario

string is_numserie, is_material

datetime idt_fechainicio, idt_fechafin


end variables

forward prototypes
public subroutine uf_carga_semana (date pd_fecha_inicio)
public subroutine uf_exportar (integer p_dia)
end prototypes

public subroutine uf_carga_semana (date pd_fecha_inicio);integer li_hoy_dia, li_i, li_j, li_dias, li_k, li_hora_inicio, li_hora_final, li_renglon
integer li_jornada_inicio, li_jornada_fin, li_hora_jornada
date ld_hoy_fecha
string ls_fecha_dia, ls_dia, ls_mes, ls_anio, ls_fecha_inicio, ls_fecha_final, ls_folios, ls_titulo
string ls_hora_inicio, ls_hora_final, ls_hora_dia,ls_filtro='',ls_cero_inicio, ls_cero_final
long ll_folio
time ltm_hora

ld_hoy_fecha=pd_fecha_inicio
li_hoy_dia=DayNumber (ld_hoy_fecha)
id_diasemana[li_hoy_dia]=ld_hoy_fecha

dw_prestamos.Reset()
dw_semana.Reset()
dw_prestamos.Reset()
dw_ficha.Reset()

this.title='Cargando...'
SetPointer (HourGlass!)


//Insertar Fechas
for li_i=1 to 7
	li_dias=li_i - li_hoy_dia
	id_diasemana[li_i]=RelativeDate(ld_hoy_fecha, li_dias)
	
	choose case li_i
	case 1 
		dw_semana.object.fecha_domingo.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 2 
		dw_semana.object.fecha_lunes.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 3 
		dw_semana.object.fecha_martes.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 4 
		dw_semana.object.fecha_miercoles.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 5 
		dw_semana.object.fecha_jueves.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 6 
		dw_semana.object.fecha_viernes.text=f_convierte_fecha_texto(id_diasemana[li_i])
	case 7 
		dw_semana.object.fecha_sabado.text=f_convierte_fecha_texto(id_diasemana[li_i])
		
	end choose

	
next

//Insertar Horas

li_jornada_inicio=8 
li_jornada_fin=17

li_hora_jornada=li_jornada_inicio

for li_i=1 to (li_jornada_fin - li_jornada_inicio)
	dw_semana.insertrow(0)
	if li_hora_jornada<10 then ls_cero_inicio='0' else ls_cero_inicio=''
	if li_hora_jornada+1<10 then ls_cero_final='0' else ls_cero_final=''
	dw_semana.SetItem(li_i, "horario",ls_cero_inicio+string(li_hora_jornada)+":00 - "+ls_cero_final+string(li_hora_jornada+1)+":00")	
	li_hora_jornada=li_hora_jornada+1
next
dw_semana.insertrow(0)
dw_semana.DeleteRow(dw_semana.RowCount())


//Obtener los préstamos


idt_fechainicio=DateTime(id_diasemana[1],time('00:00:00'))
idt_fechafin=DateTime(id_diasemana[7],time('23:59:59'))


dw_prestamos.retrieve(gi_depto,gi_area,is_numserie,idt_fechainicio,idt_fechafin)

for li_i=1 to 7
	dw_prestamos.SetFilter('')
	dw_prestamos.Filter()
	ls_anio=string(year(id_diasemana[li_i]))
	ls_mes=string(month(id_diasemana[li_i]))
	if month(id_diasemana[li_i])<10 then ls_mes='0'+ls_mes
	ls_dia=string(day(id_diasemana[li_i]))
	if day(id_diasemana[li_i])<10 then ls_dia='0'+ls_dia
	ls_fecha_dia=ls_anio+ls_mes+ls_dia

	ls_filtro="'"+ls_fecha_dia+"'"+'between spre_sol_materiales_fecha_inicio and spre_sol_materiales_fecha_final'
	dw_prestamos.SetFilter(ls_filtro)
	dw_prestamos.Filter()
	
	li_renglon=0
	for li_j=li_jornada_inicio to li_jornada_fin
		ls_folios=''
		li_renglon=li_renglon+1
		li_k=1
//		if dw_prestamos.RowCount() > 0 then messagebox('',string(dw_prestamos.RowCount()))
		for li_k=1 to dw_prestamos.RowCount()
			ll_folio=dw_prestamos.GetItemNumber(li_k,'spre_sol_materiales_folio')
			ls_fecha_inicio=dw_prestamos.GetItemString(li_k,'spre_sol_materiales_fecha_inicio')
			ls_fecha_final=dw_prestamos.GetItemString(li_k,'spre_sol_materiales_fecha_final')
			ls_hora_inicio=dw_prestamos.GetItemString(li_k,'hora_inicio')
			ls_hora_final=dw_prestamos.GetItemString(li_k,'hora_final')
			li_hora_inicio=integer(mid(ls_hora_inicio,1,2))
			li_hora_final=integer(mid(ls_hora_final,1,2))
			ls_hora_dia=string(li_j)
			if li_j<10 then ls_hora_dia='0'+ls_hora_dia
			ls_hora_dia=ls_hora_dia+':00' 
			
			if ls_fecha_inicio=ls_fecha_dia then
				if li_j>=li_hora_inicio and (li_hora_final>li_j or (li_hora_final=li_j and ls_hora_final<>ls_hora_dia))  then 
					ls_folios=ls_folios+', '+string(ll_folio)
					if pos(ls_folios,',')=1 then ls_folios=mid(ls_folios,3,len(ls_folios))
					dw_semana.SetItem(li_renglon,li_i,ls_folios)
				end if
			end if
		next		
	 next
next

dw_prestamos.SetFilter('')
dw_prestamos.Filter()

ls_titulo= is_material+'   '+is_numserie+'   '+string(id_diasemana[1])+' a '+string(id_diasemana[7])
dw_semana.Modify("t_titulo.text='"+ls_titulo+"'")

this.title='Calendario de préstamo de espacios'
SetPointer (Arrow!)

end subroutine

public subroutine uf_exportar (integer p_dia);str_dia_imprime lstr_dia

lstr_dia.dia_semana = id_diasemana[p_dia]
lstr_dia.dia_semana = id_diasemana[p_dia]
lstr_dia.material = is_material
lstr_dia.numserie = is_numserie
openwithparm(w_ccd_consulta_espacio_imprime,lstr_dia)

/*
string ls_horario,ls_cero_inicio='', ls_cero_final='', ls_folios='', ls_anio, ls_mes, ls_dia
string ls_tipo_pre, ls_folio_pre, ls_fecha_pre
string ls_fecha_inicio, ls_fecha_final, ls_hora_inicio, ls_hora_final, ls_hora_dia, ls_fecha_dia
datetime ldt_fecha_inicio, ldt_fecha_final
integer li_jornada_inicio, li_jornada_fin, li_hora_jornada, li_i, li_renglon, li_j, li_k
integer li_hora_inicio, li_hora_final
long ll_folio

dw_dia.Reset()
dw_exporta_dia.Reset()

//Insertar encabezado
ls_anio=string(year(id_diasemana[p_dia]))
ls_mes=string(month(id_diasemana[p_dia]))
if month(id_diasemana[p_dia])<10 then ls_mes='0'+ls_mes
ls_dia=string(day(id_diasemana[p_dia]))
if day(id_diasemana[p_dia])<10 then ls_dia='0'+ls_dia
ls_fecha_dia=ls_anio+ls_mes+ls_dia

dw_exporta_dia.insertrow(0)
dw_exporta_dia.SetItem(1,'horario',ls_dia+'-'+ls_mes+'-'+ls_anio)
dw_exporta_dia.SetItem(1,'prestamo',is_material+' '+is_numserie)

//Insertar Horas
li_jornada_inicio=7 
li_jornada_fin=22
li_hora_jornada=li_jornada_inicio

for li_i=2 to (li_jornada_fin - li_jornada_inicio)
	dw_exporta_dia.insertrow(0)
	if li_hora_jornada<10 then ls_cero_inicio='0' else ls_cero_inicio=''
	if li_hora_jornada+1<10 then ls_cero_final='0' else ls_cero_final=''
	dw_exporta_dia.SetItem(li_i, "horario",ls_cero_inicio+string(li_hora_jornada)+":00 - "+ls_cero_final+string(li_hora_jornada+1)+":00")	
	li_hora_jornada=li_hora_jornada+1
next
dw_exporta_dia.insertrow(0)
dw_exporta_dia.DeleteRow(dw_exporta_dia.RowCount())


//Préstamos del día
ls_horario=string(id_diasemana[p_dia])+' 00:00:00'
ldt_fecha_inicio=DateTime(ls_horario)
ls_horario=string(id_diasemana[p_dia])+' 23:59:59'		
ldt_fecha_final=DateTime(ls_horario)
dw_dia.retrieve(gi_depto,gi_area,is_numserie,ldt_fecha_inicio,ldt_fecha_final)

li_renglon=1

for li_j=li_jornada_inicio to li_jornada_fin
	ls_folios=''
	li_renglon=li_renglon+1
	li_k=1
	for li_k=1 to dw_dia.RowCount()
		ls_folio_pre=dw_dia.GetItemString(li_k,'compute_folio')
		ls_tipo_pre=dw_dia.GetItemString(li_k,'compute_tipo')
		ls_fecha_pre=dw_dia.GetItemString(li_k,'compute_fecha')
		ls_fecha_inicio=dw_dia.GetItemString(li_k,'fecha_inicio')
		ls_fecha_final=dw_dia.GetItemString(li_k,'fecha_final')
		ls_hora_inicio=dw_dia.GetItemString(li_k,'hora_inicio')
		ls_hora_final=dw_dia.GetItemString(li_k,'hora_final')
		li_hora_inicio=integer(mid(ls_hora_inicio,1,2))
		li_hora_final=integer(mid(ls_hora_final,1,2))
		ls_hora_dia=string(li_j)
		if li_j<10 then ls_hora_dia='0'+ls_hora_dia
		ls_hora_dia=ls_hora_dia+':00' 
		
		if ls_fecha_inicio=ls_fecha_dia then
			if li_j>=li_hora_inicio and (li_hora_final>li_j or (li_hora_final=li_j and ls_hora_final<>ls_hora_dia))  then 
				ls_folios=ls_folios+', '+ls_tipo_pre+' '+ls_folio_pre+' '+ls_fecha_pre
				if pos(ls_folios,',')=1 then ls_folios=mid(ls_folios,3,len(ls_folios))
				ls_folios=mid(ls_folios,1,2000)
				dw_exporta_dia.SetItem(li_renglon,'prestamo',ls_folios)
			end if
		end if
	next		
 next

if dw_exporta_dia.RowCount()>0 then
	f_exportar_reporte(dw_exporta_dia,3,"Calendario de Espacios")
end if*/
end subroutine

on w_ccd_consulta_espacio.create
this.cb_presolicitud=create cb_presolicitud
this.cb_actualizar=create cb_actualizar
this.dw_exporta_dia=create dw_exporta_dia
this.dw_ficha=create dw_ficha
this.dw_prestamos=create dw_prestamos
this.dw_inventario=create dw_inventario
this.cb_izquierda=create cb_izquierda
this.cb_derecha=create cb_derecha
this.dw_salones_semana=create dw_salones_semana
this.dw_semana=create dw_semana
this.dw_materiales=create dw_materiales
this.dw_dia=create dw_dia
this.Control[]={this.cb_presolicitud,&
this.cb_actualizar,&
this.dw_exporta_dia,&
this.dw_ficha,&
this.dw_prestamos,&
this.dw_inventario,&
this.cb_izquierda,&
this.cb_derecha,&
this.dw_salones_semana,&
this.dw_semana,&
this.dw_materiales,&
this.dw_dia}
end on

on w_ccd_consulta_espacio.destroy
destroy(this.cb_presolicitud)
destroy(this.cb_actualizar)
destroy(this.dw_exporta_dia)
destroy(this.dw_ficha)
destroy(this.dw_prestamos)
destroy(this.dw_inventario)
destroy(this.cb_izquierda)
destroy(this.cb_derecha)
destroy(this.dw_salones_semana)
destroy(this.dw_semana)
destroy(this.dw_materiales)
destroy(this.dw_dia)
end on

event open;dw_inventario.settransobject(gtr_sumuia)
dw_inventario.getchild('descripcion',idwc_inventario)
idwc_inventario.settransobject(gtr_sumuia)
idwc_inventario.Retrieve(gi_depto,gi_area) 

dw_prestamos.setTransObject(gtr_sumuia)
dw_ficha.setTransObject(gtr_sumuia)
dw_exporta_dia.setTransObject(gtr_sumuia)
dw_dia.setTransObject(gtr_sumuia)
dw_materiales.setTransObject(gtr_sumuia)
dw_materiales.Retrieve(gi_depto,gi_area) 

if idwc_inventario.Rowcount() > 0 then
 
	dw_inventario.insertrow(0)
	is_numserie = idwc_inventario.GetItemString(1,'spre_inventario_num_serie')	
	dw_materiales.SetFilter("spre_inventario_num_serie ='"+is_numserie+"'")
	dw_materiales.Filter()
	if dw_materiales.RowCount()>0 then is_material=dw_materiales.GetItemString(1,'spre_materiales_material')
	idwc_inventario.ScrollToRow(1)
	dw_inventario.ScrollToRow(1)
	post uf_carga_semana(today())

end if

end event

type cb_presolicitud from commandbutton within w_ccd_consulta_espacio
integer x = 3186
integer y = 44
integer width = 503
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Pre-solicitudes"
end type

event clicked;
opensheet(w_ccd_presolicitudes_espacio,w_ppal,0,original!)

end event

type cb_actualizar from commandbutton within w_ccd_consulta_espacio
integer x = 2697
integer y = 44
integer width = 411
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar"
end type

event clicked;uf_carga_semana(id_diasemana[1])
end event

type dw_exporta_dia from datawindow within w_ccd_consulta_espacio
boolean visible = false
integer x = 4114
integer y = 300
integer width = 498
integer height = 944
integer taborder = 20
string title = "none"
string dataobject = "d_psi_cal_prestamo_exp_dia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_ficha from datawindow within w_ccd_consulta_espacio
integer x = 50
integer y = 2084
integer width = 3982
integer height = 440
integer taborder = 20
string title = "none"
string dataobject = "d_ccd_cal_prestamo_ficha"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_prestamos from datawindow within w_ccd_consulta_espacio
boolean visible = false
integer x = 4096
integer y = 1652
integer width = 192
integer height = 252
integer taborder = 20
string title = "none"
string dataobject = "d_psi_cal_prestamo_serie"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_inventario from u_basedw within w_ccd_consulta_espacio
integer x = 608
integer y = 60
integer width = 1463
integer height = 76
integer taborder = 30
string dataobject = "d_psi_espacio_inventario_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;is_numserie =trim(this.gettext())

dw_materiales.SetFilter('')
dw_materiales.Filter()
dw_materiales.SetFilter("spre_inventario_num_serie ='"+is_numserie+"'")
dw_materiales.Filter()
if dw_materiales.RowCount()>0 then is_material=dw_materiales.GetItemString(1,'spre_materiales_material')

uf_carga_semana(id_diasemana[1])
end event

type cb_izquierda from commandbutton within w_ccd_consulta_espacio
integer x = 46
integer y = 44
integer width = 256
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "<<"
end type

event clicked;date  ld_inicio_nuevo, ld_fin_nuevo


ld_fin_nuevo=RelativeDate(id_diasemana[1],-1)

if ld_fin_nuevo< today() then
	messagebox("Aviso", "No puede reservar en fecha anterior a la actual")
else
	
	ld_inicio_nuevo=RelativeDate(ld_fin_nuevo,-6)
	post uf_carga_semana(ld_inicio_nuevo)
	
end if

end event

type cb_derecha from commandbutton within w_ccd_consulta_espacio
integer x = 3767
integer y = 44
integer width = 256
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = ">>"
end type

event clicked;date ld_fecha_inicio

ld_fecha_inicio=RelativeDate(id_diasemana[7],1)

uf_carga_semana(ld_fecha_inicio)
end event

type dw_salones_semana from datawindow within w_ccd_consulta_espacio
boolean visible = false
integer x = 1975
integer y = 2104
integer width = 169
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "d_csal_salones_semana"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_semana from datawindow within w_ccd_consulta_espacio
integer x = 50
integer y = 172
integer width = 3977
integer height = 1880
integer taborder = 10
string title = "none"
string dataobject = "d_psi_cal_semana_espacio"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.Name='domingo_t' then uf_exportar(1)
if dwo.Name='lunes_t' then uf_exportar(2) 
if dwo.Name='martes_t' then uf_exportar(3) 
if dwo.Name='miercoles_t' then uf_exportar(4) 
if dwo.Name='jueves_t' then uf_exportar(5) 
if dwo.Name='viernes_t' then uf_exportar(6) 
if dwo.Name='sabado_t' then uf_exportar(7) 

integer li_dia, li_hora_inicio, li_hora_final
string ls_salones, ls_horario, ls_dia
date ld_fecha
datetime ldt_fecha_inicio, ldt_fecha_final

if dwo.Type = "column" then
	
		choose case string(dwo.Name)
	
			case 'domingo'
				li_dia=0
				ls_dia='Domingo'
			case 'lunes'
				li_dia=1
				ls_dia='Lunes'
			case 'martes'
				li_dia=2	
				ls_dia='Martes'
			case 'miercoles'
				li_dia=3
				ls_dia='Miércoles'
			case 'jueves'
				li_dia=4
				ls_dia='Jueves'
			case 'viernes'
				li_dia=5
				ls_dia='Viernes'
			case 'sabado'
				li_dia=6
				ls_dia='Sábado'
				
			case else
				
				goto salir
			
		end choose
		
		ls_horario=this.GetItemString(row,"horario")
		li_hora_inicio=integer(left(ls_horario,pos(ls_horario,":")-1))
		li_hora_final=li_hora_inicio+1
		ld_fecha=id_diasemana[li_dia+1]
		ls_horario=string(ld_fecha)+' '+string(li_hora_inicio)+':00:00'
		ldt_fecha_inicio=DateTime(ls_horario)
		ls_horario=string(ld_fecha)+' '+string(li_hora_final)+':00:00'		
		ldt_fecha_final=DateTime(ls_horario)
		dw_ficha.retrieve(gi_depto,gi_area,is_numserie,ldt_fecha_inicio,ldt_fecha_final)
	
end if

salir:


end event

type dw_materiales from datawindow within w_ccd_consulta_espacio
boolean visible = false
integer x = 2263
integer y = 500
integer width = 878
integer height = 176
integer taborder = 40
string title = "none"
string dataobject = "d_psi_espacio_inventario"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_dia from datawindow within w_ccd_consulta_espacio
boolean visible = false
integer x = 3026
integer y = 208
integer width = 521
integer height = 500
integer taborder = 30
string title = "none"
string dataobject = "d_psi_cal_prestamo_ficha"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

