$PBExportHeader$w_gen_reporte_tesoreria.srw
forward
global type w_gen_reporte_tesoreria from window
end type
type st_1 from statictext within w_gen_reporte_tesoreria
end type
type rb_fechas from radiobutton within w_gen_reporte_tesoreria
end type
type rb_anio from radiobutton within w_gen_reporte_tesoreria
end type
type sle_solicitante from singlelineedit within w_gen_reporte_tesoreria
end type
type st_solicitante from statictext within w_gen_reporte_tesoreria
end type
type ddlb_periodo from dropdownlistbox within w_gen_reporte_tesoreria
end type
type cb_exporta from commandbutton within w_gen_reporte_tesoreria
end type
type st_grupo from statictext within w_gen_reporte_tesoreria
end type
type cb_buscar from commandbutton within w_gen_reporte_tesoreria
end type
type dw_carga from datawindow within w_gen_reporte_tesoreria
end type
type gb_1 from groupbox within w_gen_reporte_tesoreria
end type
type dw_concepto from u_basedw within w_gen_reporte_tesoreria
end type
type em_fecha1 from editmask within w_gen_reporte_tesoreria
end type
type em_fecha2 from editmask within w_gen_reporte_tesoreria
end type
end forward

global type w_gen_reporte_tesoreria from window
integer width = 5445
integer height = 2675
boolean titlebar = true
string title = "Reporte de ventas y multas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
st_1 st_1
rb_fechas rb_fechas
rb_anio rb_anio
sle_solicitante sle_solicitante
st_solicitante st_solicitante
ddlb_periodo ddlb_periodo
cb_exporta cb_exporta
st_grupo st_grupo
cb_buscar cb_buscar
dw_carga dw_carga
gb_1 gb_1
dw_concepto dw_concepto
em_fecha1 em_fecha1
em_fecha2 em_fecha2
end type
global w_gen_reporte_tesoreria w_gen_reporte_tesoreria

type variables
DatawindowChild idwc_concepto

integer ii_concepto=-1,  ii_anio, ii_periodo
long il_solicitante=-1

string is_fecha1, is_fecha2
string is_grupo_nom, is_material_nom, is_periodo
string is_sort="#5A #6A"

end variables

forward prototypes
public subroutine uf_exportar (integer p_dia)
public subroutine uf_carga ()
end prototypes

public subroutine uf_exportar (integer p_dia);/*str_dia_imprime lstr_dia

lstr_dia.dia_semana = id_diasemana[p_dia]
lstr_dia.dia_semana = id_diasemana[p_dia]
lstr_dia.material = is_material
lstr_dia.numserie = is_numserie
openwithparm(w_psi_consulta_espacio_imprime,lstr_dia)
*/
/*
string ls_horario,ls_cero_inicio='', ls_cero_final='', ls_folios='', ls_anio, ls_mes, ls_dia
string ls_tipo_pre, ls_folio_pre, ls_fecha_pre
string l_fecha_inicio, ls_fecha_final, ls_hora_inicio, ls_hora_final, ls_hora_dia, ls_fecha_dia
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

public subroutine uf_carga ();datetime ldt_fecha1, ldt_fecha2
string ls_fecha, ls_nombre=''
long ll_cuenta
integer li_i

ldt_fecha1=DateTime(Date(mid(is_fecha1,1,4)+'-'+mid(is_fecha1,5,2)+'-'+mid(is_fecha1,7,8)),Time('00:00:00'))
ldt_fecha2=DateTime(Date(mid(is_fecha2,1,4)+'-'+mid(is_fecha2,5,2)+'-'+mid(is_fecha2,7,8)),Time('23:59:59'))

dw_carga.Reset()
dw_carga.SetRedraw(false)
cb_buscar.enabled=false
cb_exporta.enabled=false

dw_carga.Retrieve(ldt_fecha1,ldt_fecha2,ii_concepto,il_solicitante)
dw_carga.SetSort(is_sort)
dw_carga.Sort()

for li_i =1 to dw_carga.RowCount()
	ll_cuenta=dw_carga.GetItemNumber(li_i,'cuenta')
	ls_nombre=''
	f_select_alumno_nombre(ll_cuenta,ls_nombre)
	dw_carga.SetItem(li_i,'nombre',ls_nombre)
next

dw_carga.SetRedraw(true)
cb_buscar.enabled=true
cb_exporta.enabled=true

end subroutine

on w_gen_reporte_tesoreria.create
this.st_1=create st_1
this.rb_fechas=create rb_fechas
this.rb_anio=create rb_anio
this.sle_solicitante=create sle_solicitante
this.st_solicitante=create st_solicitante
this.ddlb_periodo=create ddlb_periodo
this.cb_exporta=create cb_exporta
this.st_grupo=create st_grupo
this.cb_buscar=create cb_buscar
this.dw_carga=create dw_carga
this.gb_1=create gb_1
this.dw_concepto=create dw_concepto
this.em_fecha1=create em_fecha1
this.em_fecha2=create em_fecha2
this.Control[]={this.st_1,&
this.rb_fechas,&
this.rb_anio,&
this.sle_solicitante,&
this.st_solicitante,&
this.ddlb_periodo,&
this.cb_exporta,&
this.st_grupo,&
this.cb_buscar,&
this.dw_carga,&
this.gb_1,&
this.dw_concepto,&
this.em_fecha1,&
this.em_fecha2}
end on

on w_gen_reporte_tesoreria.destroy
destroy(this.st_1)
destroy(this.rb_fechas)
destroy(this.rb_anio)
destroy(this.sle_solicitante)
destroy(this.st_solicitante)
destroy(this.ddlb_periodo)
destroy(this.cb_exporta)
destroy(this.st_grupo)
destroy(this.cb_buscar)
destroy(this.dw_carga)
destroy(this.gb_1)
destroy(this.dw_concepto)
destroy(this.em_fecha1)
destroy(this.em_fecha2)
end on

event open;string ls_anio, ls_mes, ls_dia
integer li_row, li_i, li_pos

f_conectarbd_tesoreria()

//Concepto
dw_concepto.settransobject(gtr_tesoreria)
dw_concepto.getchild('concepto',idwc_concepto)
idwc_concepto.settransobject(gtr_tesoreria)
idwc_concepto.Retrieve()
idwc_concepto.insertrow(0)
li_row=idwc_concepto.RowCount()
idwc_concepto.SetItem(li_row,'cve_concepto',-1)
idwc_concepto.SetItem(li_row,'concepto','***TODOS***')
dw_concepto.insertrow(0)


dw_carga.settransobject(gtr_tesoreria)

ls_anio=string(year(date(now())))
is_fecha1=ls_anio+'0101'
is_fecha2=ls_anio+'0531'
is_periodo = 'Primavera'
ii_periodo = 0

ii_anio=integer(ls_anio)

li_pos= ddlb_periodo.FindItem(is_periodo,20)
ddlb_periodo.SelectItem(li_pos)
em_fecha1.text=string(today())
em_fecha2.text=string(today())


end event

event close;disconnect using gtr_tesoreria;
end event

type st_1 from statictext within w_gen_reporte_tesoreria
integer x = 1083
integer y = 166
integer width = 187
integer height = 58
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "a"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_fechas from radiobutton within w_gen_reporte_tesoreria
integer x = 135
integer y = 160
integer width = 413
integer height = 74
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Fechas"
end type

type rb_anio from radiobutton within w_gen_reporte_tesoreria
integer x = 135
integer y = 54
integer width = 468
integer height = 74
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Año y periodo"
boolean checked = true
end type

event clicked;choose case ii_periodo
	case 0
		is_periodo='Primavera'
		is_fecha1=string(ii_anio)+'0101'
		is_fecha2=string(ii_anio)+'0531'
	case 1
		is_periodo='Verano'
		is_fecha1=string(ii_anio)+'0601'
		is_fecha2=string(ii_anio)+'0731'
	case 2
		is_periodo='Otoño'
		is_fecha1=string(ii_anio)+'0801'
		is_fecha2=string(ii_anio)+'1231'
	case -1
		is_periodo=''
		is_fecha1=string(ii_anio)+'0101'
		is_fecha2=string(ii_anio)+'1231'
end choose
end event

type sle_solicitante from singlelineedit within w_gen_reporte_tesoreria
integer x = 699
integer y = 371
integer width = 413
integer height = 77
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_solicitante from statictext within w_gen_reporte_tesoreria
integer x = 194
integer y = 384
integer width = 457
integer height = 83
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Solicitante:"
boolean focusrectangle = false
end type

type ddlb_periodo from dropdownlistbox within w_gen_reporte_tesoreria
integer x = 699
integer y = 51
integer width = 406
integer height = 381
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string item[] = {"Primavera","Verano","Otoño","*Todos*"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text(index)
	case 'Primavera'
		ii_periodo=0
		is_periodo='Primavera'
		is_fecha1=string(ii_anio)+'0101'
		is_fecha2=string(ii_anio)+'0531'
	case 'Verano'
		ii_periodo=1
		is_periodo='Verano'
		is_fecha1=string(ii_anio)+'0601'
		is_fecha2=string(ii_anio)+'0731'
	case 'Otoño'
		ii_periodo=2
		is_periodo='Otoño'
		is_fecha1=string(ii_anio)+'0801'
		is_fecha2=string(ii_anio)+'1231'
	case else
		ii_periodo=-1
		is_periodo=''
		is_fecha1=string(ii_anio)+'0101'
		is_fecha2=string(ii_anio)+'1231'
end choose


end event

type cb_exporta from commandbutton within w_gen_reporte_tesoreria
integer x = 4710
integer y = 301
integer width = 541
integer height = 102
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Exportar a Excel"
end type

event clicked;integer li_i

if dw_carga.RowCount()>0 then
	f_exportar_reporte(dw_carga,1,"Reporte de ventas y multas")
end if
end event

type st_grupo from statictext within w_gen_reporte_tesoreria
integer x = 194
integer y = 272
integer width = 585
integer height = 83
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Concepto:"
boolean focusrectangle = false
end type

type cb_buscar from commandbutton within w_gen_reporte_tesoreria
integer x = 4330
integer y = 301
integer width = 355
integer height = 102
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Buscar"
boolean default = true
end type

event clicked;il_solicitante=-1

if isNumber(trim(sle_solicitante.text)) then
	il_solicitante=Long(trim(sle_solicitante.text))
end if

if rb_fechas.checked = true then
	is_fecha1=mid(em_fecha1.text,7,4)+mid(em_fecha1.text,4,2)+mid(em_fecha1.text,1,2)
	is_fecha2=mid(em_fecha2.text,7,4)+mid(em_fecha2.text,4,2)+mid(em_fecha2.text,1,2)
end if

uf_carga()
end event

type dw_carga from datawindow within w_gen_reporte_tesoreria
integer x = 51
integer y = 518
integer width = 5303
integer height = 2013
integer taborder = 10
string title = "none"
string dataobject = "d_psi_tes_venta_multa_fecha"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;	if dwo.Type = "text" then
		
		choose case string(dwo.Name)
	
			case 'cuenta_t'
				if mid(is_sort,1,3)='#2A' then is_sort="#2D #5A" else is_sort="#2A #5A"
				this.Modify("cuenta_t.background.color='8421376'")
				this.Modify("importe_t.background.color='29079919'")
				this.Modify("concepto_t.background.color='29079919'")
				this.Modify("fecha_generacion_t.background.color='29079919'")
				this.Modify("nombre_t.background.color='29079919'")

			case 'importe_t'
				if mid(is_sort,1,3)='#3A' then is_sort="#3D #6A" else is_sort="#3A #6A"
				this.Modify("cuenta_t.background.color='29079919'")
				this.Modify("importe_t.background.color='8421376'")
				this.Modify("concepto_t.background.color='29079919'")
				this.Modify("fecha_generacion_t.background.color='29079919'")
				this.Modify("nombre_t.background.color='29079919'")

			case 'concepto_t'
				if mid(is_sort,1,3)='#4A' then is_sort="#4D #5A" else is_sort="#4A #5A"
				this.Modify("cuenta_t.background.color='29079919'")
				this.Modify("importe_t.background.color='29079919'")
				this.Modify("concepto_t.background.color='8421376'")
				this.Modify("fecha_generacion_t.background.color='29079919'")
				this.Modify("nombre_t.background.color='29079919'")
			
			case 'fecha_generacion_t'
				if mid(is_sort,1,3)='#5A' then is_sort="#5D #6A" else is_sort="#5A #6A"
				this.Modify("cuenta_t.background.color='29079919'")
				this.Modify("importe_t.background.color='29079919'")
				this.Modify("concepto_t.background.color='29079919'")
				this.Modify("fecha_generacion_t.background.color='8421376'")
				this.Modify("nombre_t.background.color='29079919'")

			case 'nombre_t'
				if mid(is_sort,1,3)='#6A' then is_sort="#6D #5A" else is_sort="#6A #5A"
				this.Modify("cuenta_t.background.color='29079919'")
				this.Modify("importe_t.background.color='29079919'")
				this.Modify("concepto_t.background.color='29079919'")
				this.Modify("fecha_generacion_t.background.color='29079919'")
				this.Modify("nombre_t.background.color='8421376'")
			
		end choose

		this.SetSort(is_sort) 
		this.Sort() 		
		
	end if
	
end event

type gb_1 from groupbox within w_gen_reporte_tesoreria
integer x = 62
integer width = 5277
integer height = 490
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
end type

type dw_concepto from u_basedw within w_gen_reporte_tesoreria
integer x = 699
integer y = 266
integer width = 951
integer height = 83
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_psi_tes_concepto_drop"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("matgrupo", "matgrupo", "matgrupo")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then ii_concepto=integer(trim(this.gettext()))

end event

type em_fecha1 from editmask within w_gen_reporte_tesoreria
integer x = 699
integer y = 160
integer width = 377
integer height = 74
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
string text = "00/00/0000"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_fecha2 from editmask within w_gen_reporte_tesoreria
integer x = 1265
integer y = 157
integer width = 377
integer height = 74
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
string text = "00/00/0000"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

