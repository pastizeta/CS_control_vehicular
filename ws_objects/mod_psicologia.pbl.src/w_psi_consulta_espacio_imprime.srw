$PBExportHeader$w_psi_consulta_espacio_imprime.srw
forward
global type w_psi_consulta_espacio_imprime from window
end type
type cb_imprime from commandbutton within w_psi_consulta_espacio_imprime
end type
type cb_exporta from commandbutton within w_psi_consulta_espacio_imprime
end type
type dw_imprime from datawindow within w_psi_consulta_espacio_imprime
end type
type dw_exporta from datawindow within w_psi_consulta_espacio_imprime
end type
type dw_datos from datawindow within w_psi_consulta_espacio_imprime
end type
end forward

global type w_psi_consulta_espacio_imprime from window
integer width = 3643
integer height = 2678
boolean titlebar = true
string title = "Solicitudes y Presolicitudes de materiales"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_imprime cb_imprime
cb_exporta cb_exporta
dw_imprime dw_imprime
dw_exporta dw_exporta
dw_datos dw_datos
end type
global w_psi_consulta_espacio_imprime w_psi_consulta_espacio_imprime

type variables
date id_dia_semana
string is_material, is_numserie, is_impresora
integer ii_job

str_dia_imprime istr_dia
end variables

forward prototypes
public subroutine uf_carga ()
end prototypes

public subroutine uf_carga ();string ls_horario,ls_cero_inicio='', ls_cero_final='', ls_folios='', ls_anio, ls_mes, ls_dia
string ls_tipo_pre, ls_folio_pre, ls_fecha_pre
string ls_fecha_inicio, ls_fecha_final, ls_hora_inicio, ls_hora_final, ls_hora_dia, ls_fecha_dia
datetime ldt_fecha_inicio, ldt_fecha_final
integer li_jornada_inicio, li_jornada_fin, li_hora_jornada, li_i, li_renglon, li_j, li_k
integer li_hora_inicio, li_hora_final
long ll_folio

dw_datos.Reset()
dw_imprime.Reset()
dw_exporta.Reset()

//Insertar encabezado
ls_anio=string(year(id_dia_semana))
ls_mes=string(month(id_dia_semana))
if month(id_dia_semana)<10 then ls_mes='0'+ls_mes
ls_dia=string(day(id_dia_semana))
if day(id_dia_semana)<10 then ls_dia='0'+ls_dia
ls_fecha_dia=ls_anio+ls_mes+ls_dia

dw_exporta.insertrow(0)
dw_exporta.SetItem(1,'horario',ls_dia+'-'+ls_mes+'-'+ls_anio)
dw_exporta.SetItem(1,'prestamo',is_material+' '+is_numserie)

//Insertar Horas
li_jornada_inicio=7 
li_jornada_fin=22
li_hora_jornada=li_jornada_inicio

for li_i=1 to (li_jornada_fin - li_jornada_inicio)
	dw_imprime.insertrow(0)
	if li_hora_jornada<10 then ls_cero_inicio='0' else ls_cero_inicio=''
	if li_hora_jornada+1<10 then ls_cero_final='0' else ls_cero_final=''
	dw_imprime.SetItem(li_i, "horario",ls_cero_inicio+string(li_hora_jornada)+":00 - "+ls_cero_final+string(li_hora_jornada+1)+":00")	
	li_hora_jornada=li_hora_jornada+1
next
dw_imprime.insertrow(0)
dw_imprime.DeleteRow(dw_imprime.RowCount())


//Préstamos del día
ls_horario=string(id_dia_semana)+' 00:00:00'
ldt_fecha_inicio=DateTime(ls_horario)
ls_horario=string(id_dia_semana)+' 23:59:59'		
ldt_fecha_final=DateTime(ls_horario)
dw_datos.retrieve(gi_depto,gi_area,is_numserie,ldt_fecha_inicio,ldt_fecha_final)

li_renglon=1

for li_j=li_jornada_inicio to li_jornada_fin
	ls_folios=''
	li_renglon=li_renglon+1
	li_k=1
	for li_k=1 to dw_datos.RowCount()
		ls_folio_pre=dw_datos.GetItemString(li_k,'compute_folio')
		ls_tipo_pre=dw_datos.GetItemString(li_k,'compute_tipo')+' '+dw_datos.GetItemString(li_k,'spre_solicitud_observaciones')
		ls_fecha_pre=dw_datos.GetItemString(li_k,'compute_fecha')
		ls_fecha_inicio=dw_datos.GetItemString(li_k,'fecha_inicio')
		ls_fecha_final=dw_datos.GetItemString(li_k,'fecha_final')
		ls_hora_inicio=dw_datos.GetItemString(li_k,'hora_inicio')
		ls_hora_final=dw_datos.GetItemString(li_k,'hora_final')
		li_hora_inicio=integer(mid(ls_hora_inicio,1,2))
		li_hora_final=integer(mid(ls_hora_final,1,2))
		ls_hora_dia=string(li_j)
		if li_j<10 then ls_hora_dia='0'+ls_hora_dia
		ls_hora_dia=ls_hora_dia+':00' 
		
		if ls_fecha_inicio=ls_fecha_dia then
			if li_j>=li_hora_inicio and (li_hora_final>li_j or (li_hora_final=li_j and ls_hora_final<>ls_hora_dia))  then 
				ls_folios=ls_folios+', '+ls_tipo_pre//+' '+ls_folio_pre+' '+ls_fecha_pre
				if pos(ls_folios,',')=1 then ls_folios=mid(ls_folios,3,len(ls_folios))
				ls_folios=mid(ls_folios,1,2000)
				dw_imprime.SetItem(li_renglon,'prestamo',ls_folios)
			end if
		end if
	next		
 next

if dw_imprime.RowCount() > 0 then
	for li_i=1 to dw_imprime.RowCount() 
		dw_exporta.insertrow(0)
		dw_exporta.SetItem(li_i+1,'horario',dw_imprime.GetItemString(li_i,'horario'))
		dw_exporta.SetItem(li_i+1,'prestamo',dw_imprime.GetItemString(li_i,'prestamo'))
	next
end if
dw_imprime.Modify("t_dia.text='"+ls_dia+'-'+ls_mes+'-'+ls_anio+' '+is_material+' '+is_numserie+"'")

end subroutine

on w_psi_consulta_espacio_imprime.create
this.cb_imprime=create cb_imprime
this.cb_exporta=create cb_exporta
this.dw_imprime=create dw_imprime
this.dw_exporta=create dw_exporta
this.dw_datos=create dw_datos
this.Control[]={this.cb_imprime,&
this.cb_exporta,&
this.dw_imprime,&
this.dw_exporta,&
this.dw_datos}
end on

on w_psi_consulta_espacio_imprime.destroy
destroy(this.cb_imprime)
destroy(this.cb_exporta)
destroy(this.dw_imprime)
destroy(this.dw_exporta)
destroy(this.dw_datos)
end on

event open;istr_dia=message.powerobjectparm

dw_datos.setTransObject(gtr_sumuia)

id_dia_semana=istr_dia.dia_semana
is_material=istr_dia.material
is_numserie=istr_dia.numserie

uf_carga()

end event

type cb_imprime from commandbutton within w_psi_consulta_espacio_imprime
integer x = 3087
integer y = 2445
integer width = 494
integer height = 106
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;PrintSetup()
dw_imprime.print()

end event

type cb_exporta from commandbutton within w_psi_consulta_espacio_imprime
integer x = 2494
integer y = 2442
integer width = 541
integer height = 106
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar a Excel"
end type

event clicked;integer li_i

if dw_exporta.RowCount()>0 then
	f_exportar_reporte(dw_exporta,1,"Calendario de Espacios")
end if
end event

type dw_imprime from datawindow within w_psi_consulta_espacio_imprime
integer x = 48
integer y = 13
integer width = 3529
integer height = 2387
integer taborder = 10
string title = "none"
string dataobject = "d_psi_cal_prestamo_print_dia"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_exporta from datawindow within w_psi_consulta_espacio_imprime
boolean visible = false
integer x = 940
integer y = 2080
integer width = 549
integer height = 320
integer taborder = 30
string title = "none"
string dataobject = "d_psi_cal_prestamo_exp_dia"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_datos from datawindow within w_psi_consulta_espacio_imprime
boolean visible = false
integer x = 157
integer y = 2074
integer width = 549
integer height = 320
integer taborder = 20
string title = "none"
string dataobject = "d_psi_cal_prestamo_ficha"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

