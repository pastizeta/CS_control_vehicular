$PBExportHeader$w_gen_reporte_por_dia.srw
forward
global type w_gen_reporte_por_dia from window
end type
type dw_mes from u_basedw within w_gen_reporte_por_dia
end type
type ddlb_anio_mes from dropdownlistbox within w_gen_reporte_por_dia
end type
type rb_mes from radiobutton within w_gen_reporte_por_dia
end type
type ddlb_reserva from dropdownlistbox within w_gen_reporte_por_dia
end type
type st_tipo from statictext within w_gen_reporte_por_dia
end type
type cb_exporta from commandbutton within w_gen_reporte_por_dia
end type
type cb_imprime from commandbutton within w_gen_reporte_por_dia
end type
type dw_semana from u_basedw within w_gen_reporte_por_dia
end type
type st_grupo from statictext within w_gen_reporte_por_dia
end type
type ddlb_anio_semana from dropdownlistbox within w_gen_reporte_por_dia
end type
type ddlb_anio_periodo from dropdownlistbox within w_gen_reporte_por_dia
end type
type rb_periodo from radiobutton within w_gen_reporte_por_dia
end type
type ddlb_periodo from dropdownlistbox within w_gen_reporte_por_dia
end type
type st_periodo from statictext within w_gen_reporte_por_dia
end type
type cb_buscar from commandbutton within w_gen_reporte_por_dia
end type
type em_fecha1 from editmask within w_gen_reporte_por_dia
end type
type rb_semana from radiobutton within w_gen_reporte_por_dia
end type
type rb_dia from radiobutton within w_gen_reporte_por_dia
end type
type dw_material from u_basedw within w_gen_reporte_por_dia
end type
type dw_grupo from u_basedw within w_gen_reporte_por_dia
end type
type dw_carga from datawindow within w_gen_reporte_por_dia
end type
type dw_datos from datawindow within w_gen_reporte_por_dia
end type
type gb_1 from groupbox within w_gen_reporte_por_dia
end type
end forward

global type w_gen_reporte_por_dia from window
integer width = 4820
integer height = 2675
boolean titlebar = true
string title = "Reporte de préstamos por día de la semana"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_mes dw_mes
ddlb_anio_mes ddlb_anio_mes
rb_mes rb_mes
ddlb_reserva ddlb_reserva
st_tipo st_tipo
cb_exporta cb_exporta
cb_imprime cb_imprime
dw_semana dw_semana
st_grupo st_grupo
ddlb_anio_semana ddlb_anio_semana
ddlb_anio_periodo ddlb_anio_periodo
rb_periodo rb_periodo
ddlb_periodo ddlb_periodo
st_periodo st_periodo
cb_buscar cb_buscar
em_fecha1 em_fecha1
rb_semana rb_semana
rb_dia rb_dia
dw_material dw_material
dw_grupo dw_grupo
dw_carga dw_carga
dw_datos dw_datos
gb_1 gb_1
end type
global w_gen_reporte_por_dia w_gen_reporte_por_dia

type variables
date id_diasemana[7]

DatawindowChild idwc_semana, idwc_grupo, idwc_material, idwc_mes

integer ii_grupo=-1, ii_periodo, ii_anio_periodo, ii_anio_semana, ii_anio_mes
integer ii_semana=1, ii_renovado=0, ii_mes=1

string is_material, is_periodo, is_fecha1, is_fecha2, is_semana, is_mes='Enero'
string is_grupo_nom, is_material_nom

datetime idt_fechainicio, idt_fechafin


end variables

forward prototypes
public subroutine uf_exportar (integer p_dia)
public subroutine uf_carga ()
public subroutine uf_dias_semana (date p_fecha, ref string p_fecha1, ref string p_fecha2)
public subroutine uf_crea_semana (integer p_anio)
public subroutine uf_crea_mes (integer p_anio)
public function string uf_mes (string p_mes, ref string p_descripcion)
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

public subroutine uf_carga ();integer  li_i=1, li_grupo=0, li_grupo_ant=0, li_renglon=0, li_dia_semana
string ls_material='',ls_material_ant='',ls_descripcion, ls_lapso, ls_titulo, ls_nom_mes
integer li_prestamos=0,li_pres_antes=0,li_pres_despues=0

dw_carga.Reset()
dw_datos.Reset()
dw_carga.SetRedraw(false)

if ii_grupo=-1 then
	dw_datos.DataObject='d_gen_tab_grupo_conteo_dia'
	dw_datos.settransobject(gtr_sumuia)
	dw_datos.Retrieve(gi_depto,gi_area,is_fecha1,is_fecha2,ii_renovado)

	for li_i=1 to dw_datos.RowCount()
		li_grupo=	dw_datos.GetItemNumber(li_i,'cvegrupo')
		ls_descripcion=dw_datos.GetItemString(li_i,'grupo')
		li_dia_semana=dw_datos.GetItemNumber(li_i,'dia_semana')
	
		if li_grupo<>li_grupo_ant then
			li_renglon=li_renglon+1
			dw_carga.insertrow(0)
			dw_carga.SetItem(li_renglon,'descripcion',ls_descripcion)
			li_prestamos=0
			li_pres_antes=0
			li_pres_despues=0
		end if
		
		li_prestamos=dw_datos.GetItemNumber(li_i,'prestamos')
		choose case li_dia_semana
			case 1
				dw_carga.SetItem(li_renglon,'p_domingo',li_prestamos)
			case 2
				dw_carga.SetItem(li_renglon,'p_lunes',li_prestamos)
			case 3
				dw_carga.SetItem(li_renglon,'p_martes',li_prestamos)
			case 4
				dw_carga.SetItem(li_renglon,'p_miercoles',li_prestamos)
			case 5
				dw_carga.SetItem(li_renglon,'p_jueves',li_prestamos)
			case 6
				dw_carga.SetItem(li_renglon,'p_viernes',li_prestamos)
			case 7
				dw_carga.SetItem(li_renglon,'p_sabado',li_prestamos)
		end choose
		li_grupo_ant=li_grupo
	next

else
	dw_datos.DataObject='d_gen_tab_material_conteo_dia'
	dw_datos.settransobject(gtr_sumuia)
	dw_datos.Retrieve(gi_depto,gi_area,is_fecha1,is_fecha2,ii_grupo,is_material,ii_renovado)

	for li_i=1 to dw_datos.RowCount()
		ls_material=	dw_datos.GetItemString(li_i,'cvematerial')
		ls_descripcion=dw_datos.GetItemString(li_i,'material')
		li_dia_semana=dw_datos.GetItemNumber(li_i,'dia_semana')
	
		if ls_material<>ls_material_ant then
			li_renglon=li_renglon+1
			dw_carga.insertrow(0)
			dw_carga.SetItem(li_renglon,'descripcion',ls_descripcion)
			li_prestamos=0
			li_pres_antes=0
			li_pres_despues=0
		end if
		
		li_prestamos=dw_datos.GetItemNumber(li_i,'prestamos')
		choose case li_dia_semana
			case 1
				dw_carga.SetItem(li_renglon,'p_domingo',li_prestamos)
			case 2
				dw_carga.SetItem(li_renglon,'p_lunes',li_prestamos)
			case 3
				dw_carga.SetItem(li_renglon,'p_martes',li_prestamos)
			case 4
				dw_carga.SetItem(li_renglon,'p_miercoles',li_prestamos)
			case 5
				dw_carga.SetItem(li_renglon,'p_jueves',li_prestamos)
			case 6
				dw_carga.SetItem(li_renglon,'p_viernes',li_prestamos)
			case 7
				dw_carga.SetItem(li_renglon,'p_sabado',li_prestamos)
		end choose
		ls_material_ant=ls_material
	next
	
end if


if rb_periodo.checked=true then
	ls_lapso=is_periodo+' '+string(ii_anio_periodo)
elseif rb_dia.checked=true then
	ls_lapso=mid(is_fecha1,7,2)+'-'+uf_mes(mid(is_fecha1,5,2),ls_nom_mes)+'-'+mid(is_fecha1,1,4)
elseif rb_semana.checked=true then
	ls_lapso='Semana '+string(ii_anio_semana)+' '+is_semana
elseif rb_mes.checked=true then
	ls_lapso=is_mes+' '+string(ii_anio_semana)
end if

ls_titulo='Reporte de préstamo por hora  ' +is_grupo_nom
if is_material_nom<>'' then ls_titulo=ls_titulo+': '+is_material_nom

dw_carga.Modify("t_titulo.text='"+ls_titulo+"'")
dw_carga.Modify("t_lapso.text='"+ls_lapso+"'")
dw_carga.SetRedraw(true)


end subroutine

public subroutine uf_dias_semana (date p_fecha, ref string p_fecha1, ref string p_fecha2);date ld_dia_semana[]
integer li_hoy_dia, li_dias, li_i
string ls_anio, ls_mes, ls_dia

li_hoy_dia=DayNumber(p_fecha)
ld_dia_semana[li_hoy_dia]=p_fecha

for li_i=1 to 7
	li_dias=li_i - li_hoy_dia
	ld_dia_semana[li_i]=RelativeDate(p_fecha, li_dias)
next

ls_anio=string(year(ld_dia_semana[1]))
ls_mes=string(month(ld_dia_semana[1]))
if month(ld_dia_semana[1])<10 then ls_mes='0'+ls_mes
ls_dia=string(day(ld_dia_semana[1]))
if day(ld_dia_semana[1])<10 then ls_dia='0'+ls_dia
p_fecha1=ls_anio+ls_mes+ls_dia

ls_anio=string(year(ld_dia_semana[7]))
ls_mes=string(month(ld_dia_semana[7]))
if month(ld_dia_semana[7])<10 then ls_mes='0'+ls_mes
ls_dia=string(day(ld_dia_semana[7]))
if day(ld_dia_semana[7])<10 then ls_dia='0'+ls_dia
p_fecha2=ls_anio+ls_mes+ls_dia


end subroutine

public subroutine uf_crea_semana (integer p_anio);string ls_semana1='', ls_semana2='', ls_fecha, ls_texto, ls_dia, ls_mes, ls_anio, ls_nom_mes
date ld_fecha
integer li_i

ls_fecha=string(p_anio)+'-01-01'
idwc_semana.Reset()

for li_i=1 to 53

     ld_fecha=Date(ls_fecha)
	uf_dias_semana(ld_fecha,ls_semana1,ls_semana2)

	//Inicio
	ls_dia=mid(ls_semana1,7,2)
	if len(ls_dia)=1 then ls_dia='0'+ls_dia
	ls_mes=mid(ls_semana1,5,2)
	if len(ls_mes)=1 then ls_mes='0'+ls_mes
	ls_anio=mid(ls_semana1,1,4)
	ls_texto=ls_dia+'-'+uf_mes(ls_mes,ls_nom_mes)

	//Fin
	ls_dia=mid(ls_semana2,7,2)
	if len(ls_dia)=1 then ls_dia='0'+ls_dia
	ls_mes=mid(ls_semana2,5,2)
	if len(ls_mes)=1 then ls_mes='0'+ls_mes
	ls_anio=mid(ls_semana2,1,4)
	ls_texto=ls_texto+' a '+ls_dia+'-'+uf_mes(ls_mes,ls_nom_mes)
	
	
	idwc_semana.insertrow(0)
	idwc_semana.SetItem(li_i,'semana',li_i)	
	idwc_semana.SetItem(li_i,'descripcion',ls_texto)
	idwc_semana.SetItem(li_i,'fecha1',ls_semana1)	
	idwc_semana.SetItem(li_i,'fecha2',ls_semana2)	
	
	ls_fecha=ls_semana2
	ls_fecha=mid(ls_fecha,1,4)+'-'+mid(ls_fecha,5,2)+'-'+mid(ls_fecha,7,2)
	ld_fecha=Date(ls_fecha)
	ld_fecha=RelativeDate(ld_fecha,1)
	
	ls_dia=string(day(ld_fecha))
	if len(ls_dia)=1 then ls_dia='0'+ls_dia
	ls_mes=string(month(ld_fecha))
	if len(ls_mes)=1 then ls_mes='0'+ls_mes
	ls_anio=string(year(ld_fecha))
	ls_fecha=ls_anio+'-'+ls_mes+'-'+ls_dia

next

end subroutine

public subroutine uf_crea_mes (integer p_anio);string ls_semana1='', ls_semana2='', ls_mes, ls_nom_mes
integer li_i

idwc_mes.Reset()

for li_i=1 to 12

	ls_mes=string(li_i)
	if li_i<10 then ls_mes='0'+ls_mes
	ls_semana1=string(p_anio)+ls_mes+'01'
	ls_semana2=string(p_anio)+ls_mes+'31'
	uf_mes(ls_mes,ls_nom_mes)

	idwc_mes.insertrow(0)
	idwc_mes.SetItem(li_i,'mes',li_i)	
	idwc_mes.SetItem(li_i,'descripcion',ls_nom_mes)
	idwc_mes.SetItem(li_i,'fecha1',ls_semana1)	
	idwc_mes.SetItem(li_i,'fecha2',ls_semana2)	

next

end subroutine

public function string uf_mes (string p_mes, ref string p_descripcion);string ls_mes

choose case p_mes
	case '01'
		ls_mes='ene'
		p_descripcion='Enero'
	case '02'
		ls_mes='feb'
		p_descripcion='Febrero'
	case '03'
		ls_mes='mar'
		p_descripcion='Marzo'
	case '04'
		ls_mes='abr'
		p_descripcion='Abril'
	case '05'
		ls_mes='may'
		p_descripcion='Mayo'
	case '06'
		ls_mes='jun'
		p_descripcion='Junio'
	case '07'
		ls_mes='jul'
		p_descripcion='Julio'
	case '08'
		ls_mes='ago'
		p_descripcion='Agosto'
	case '09'
		ls_mes='sep'
		p_descripcion='Septiembre'
	case '10'
		ls_mes='oct'
		p_descripcion='Octubre'
	case '11'
		ls_mes='nov'
		p_descripcion='Noviembre'
	case '12'
		ls_mes='dic'
		p_descripcion='Diciembre'
end choose

return(ls_mes)
end function

on w_gen_reporte_por_dia.create
this.dw_mes=create dw_mes
this.ddlb_anio_mes=create ddlb_anio_mes
this.rb_mes=create rb_mes
this.ddlb_reserva=create ddlb_reserva
this.st_tipo=create st_tipo
this.cb_exporta=create cb_exporta
this.cb_imprime=create cb_imprime
this.dw_semana=create dw_semana
this.st_grupo=create st_grupo
this.ddlb_anio_semana=create ddlb_anio_semana
this.ddlb_anio_periodo=create ddlb_anio_periodo
this.rb_periodo=create rb_periodo
this.ddlb_periodo=create ddlb_periodo
this.st_periodo=create st_periodo
this.cb_buscar=create cb_buscar
this.em_fecha1=create em_fecha1
this.rb_semana=create rb_semana
this.rb_dia=create rb_dia
this.dw_material=create dw_material
this.dw_grupo=create dw_grupo
this.dw_carga=create dw_carga
this.dw_datos=create dw_datos
this.gb_1=create gb_1
this.Control[]={this.dw_mes,&
this.ddlb_anio_mes,&
this.rb_mes,&
this.ddlb_reserva,&
this.st_tipo,&
this.cb_exporta,&
this.cb_imprime,&
this.dw_semana,&
this.st_grupo,&
this.ddlb_anio_semana,&
this.ddlb_anio_periodo,&
this.rb_periodo,&
this.ddlb_periodo,&
this.st_periodo,&
this.cb_buscar,&
this.em_fecha1,&
this.rb_semana,&
this.rb_dia,&
this.dw_material,&
this.dw_grupo,&
this.dw_carga,&
this.dw_datos,&
this.gb_1}
end on

on w_gen_reporte_por_dia.destroy
destroy(this.dw_mes)
destroy(this.ddlb_anio_mes)
destroy(this.rb_mes)
destroy(this.ddlb_reserva)
destroy(this.st_tipo)
destroy(this.cb_exporta)
destroy(this.cb_imprime)
destroy(this.dw_semana)
destroy(this.st_grupo)
destroy(this.ddlb_anio_semana)
destroy(this.ddlb_anio_periodo)
destroy(this.rb_periodo)
destroy(this.ddlb_periodo)
destroy(this.st_periodo)
destroy(this.cb_buscar)
destroy(this.em_fecha1)
destroy(this.rb_semana)
destroy(this.rb_dia)
destroy(this.dw_material)
destroy(this.dw_grupo)
destroy(this.dw_carga)
destroy(this.dw_datos)
destroy(this.gb_1)
end on

event open;string ls_anio, ls_mes, ls_dia
integer li_row, li_i, li_pos

//Mes
dw_mes.settransobject(gtr_sumuia)
dw_mes.getchild('mes',idwc_mes)
idwc_mes.settransobject(gtr_sumuia)
dw_mes.insertrow(0)

//Semana
dw_semana.settransobject(gtr_sumuia)
dw_semana.getchild('semana',idwc_semana)
idwc_semana.settransobject(gtr_sumuia)
dw_semana.insertrow(0)

//Grupo
dw_grupo.settransobject(gtr_sumuia)
dw_grupo.getchild('matgrupo',idwc_grupo)
idwc_grupo.settransobject(gtr_sumuia)
idwc_grupo.Retrieve(gi_depto,gi_area)
idwc_grupo.insertrow(0)
li_row=idwc_grupo.RowCount()
idwc_grupo.SetItem(li_row,'cvegrupo',-1)
idwc_grupo.SetItem(li_row,'descripcion','***TODOS***')
dw_grupo.insertrow(0)

//Material
dw_material.settransobject(gtr_sumuia)
dw_material.getchild('material',idwc_material)
idwc_material.settransobject(gtr_sumuia)

dw_datos.settransobject(gtr_sumuia)

ls_anio=string(year(date(now())))
ls_mes=string(month(date(now())))
if month(date(now()))<10 then ls_mes='0'+ls_mes
ls_dia=string(day(date(now())))
if day(date(now()))<10 then ls_dia='0'+ls_dia
is_fecha1=ls_anio+ls_mes+ls_dia
is_fecha2=is_fecha1

em_fecha1.text=mid(is_fecha1,7,2)+'/'+mid(is_fecha1,5,2)+'/'+mid(is_fecha1,1,4)

for li_i=2012 to integer(ls_anio)
	 ddlb_anio_periodo.AddItem(string(li_i))
	 ddlb_anio_semana.AddItem(string(li_i))
	 ddlb_anio_mes.AddItem(string(li_i))
next

li_pos= ddlb_anio_periodo.FindItem(ls_anio,20)
ddlb_anio_periodo.SelectItem(li_pos)
ddlb_anio_semana.SelectItem(li_pos)
ddlb_anio_mes.SelectItem(li_pos)
ii_anio_periodo=integer(ls_anio)
ii_anio_semana=integer(ls_anio)
ii_anio_mes=integer(ls_anio)

choose case ls_mes
	case '01','02','03','04','05'
		is_periodo = 'Primavera'
	case '06','07'
		is_periodo = 'Verano'
	case '08','09','10','11','12'
		is_periodo = 'Otoño'
end choose

li_pos= ddlb_periodo.FindItem(is_periodo,20)
ddlb_periodo.SelectItem(li_pos)

li_pos= ddlb_reserva.FindItem('Préstamo',20)
ddlb_reserva.SelectItem(li_pos)

uf_crea_semana(integer(ls_anio))
uf_crea_mes(integer(ls_anio))

post uf_carga()
end event

type dw_mes from u_basedw within w_gen_reporte_por_dia
integer x = 768
integer y = 352
integer width = 958
integer height = 77
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_gen_mes_p"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then ii_mes=integer(trim(this.gettext()))
end event

type ddlb_anio_mes from dropdownlistbox within w_gen_reporte_por_dia
integer x = 424
integer y = 362
integer width = 300
integer height = 602
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type rb_mes from radiobutton within w_gen_reporte_por_dia
integer x = 102
integer y = 355
integer width = 413
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Mensual:"
end type

type ddlb_reserva from dropdownlistbox within w_gen_reporte_por_dia
integer x = 1916
integer y = 61
integer width = 457
integer height = 381
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string item[] = {"Préstamo","Renovación","*Todos*"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case this.text(index)
	case 'Préstamo'
		ii_renovado=0
	case 'Renovación'
		ii_renovado=1
	case else
		ii_renovado=-1
end choose


end event

type st_tipo from statictext within w_gen_reporte_por_dia
integer x = 1562
integer y = 64
integer width = 373
integer height = 83
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Préstamo:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_exporta from commandbutton within w_gen_reporte_por_dia
integer x = 3774
integer y = 262
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
	f_exportar_reporte(dw_carga,1,"Reporte de préstamos por hora")
end if
end event

type cb_imprime from commandbutton within w_gen_reporte_por_dia
integer x = 4337
integer y = 262
integer width = 362
integer height = 102
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Imprimir"
end type

event clicked;PrintSetup()
dw_carga.print()

end event

type dw_semana from u_basedw within w_gen_reporte_por_dia
integer x = 768
integer y = 256
integer width = 958
integer height = 77
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_gen_semana_p"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;
if IsNumber(trim(this.gettext())) then ii_semana=integer(trim(this.gettext()))

end event

type st_grupo from statictext within w_gen_reporte_por_dia
integer x = 2366
integer y = 61
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
string text = "Grupo y material:"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_anio_semana from dropdownlistbox within w_gen_reporte_por_dia
integer x = 424
integer y = 256
integer width = 300
integer height = 602
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_anio_semana=integer(this.text(index))
ii_semana=1
uf_crea_semana(ii_anio_semana)
end event

type ddlb_anio_periodo from dropdownlistbox within w_gen_reporte_por_dia
integer x = 428
integer y = 58
integer width = 300
integer height = 602
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_anio_periodo=integer(this.text(index))
end event

type rb_periodo from radiobutton within w_gen_reporte_por_dia
integer x = 102
integer y = 61
integer width = 307
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Año:"
end type

type ddlb_periodo from dropdownlistbox within w_gen_reporte_por_dia
integer x = 1101
integer y = 61
integer width = 406
integer height = 381
integer taborder = 20
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
	case 'Verano'
		ii_periodo=1
		is_periodo='Verano'
	case 'Otoño'
		ii_periodo=2
		is_periodo='Otoño'
	case else
		ii_periodo=-1
		is_periodo=''
end choose


end event

type st_periodo from statictext within w_gen_reporte_por_dia
integer x = 750
integer y = 61
integer width = 333
integer height = 83
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "y periodo:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_buscar from commandbutton within w_gen_reporte_por_dia
integer x = 3394
integer y = 262
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
end type

event clicked;string ls_inicio, ls_fin

if rb_periodo.checked=true then
	
	choose case ii_periodo
		case 0
			is_fecha1=string(ii_anio_periodo)+'0101'
			is_fecha2=string(ii_anio_periodo)+'0531'
		case 1
			is_fecha1=string(ii_anio_periodo)+'0601'
			is_fecha2=string(ii_anio_periodo)+'0731'
		case 2
			is_fecha1=string(ii_anio_periodo)+'0801'
			is_fecha2=string(ii_anio_periodo)+'1231'
		case else
			is_fecha1=string(ii_anio_periodo)+'0101'
			is_fecha2=string(ii_anio_periodo)+'1231'
	end choose

elseif rb_dia.checked=true then
	is_fecha1=mid(em_fecha1.text,7,4)+mid(em_fecha1.text,4,2)+mid(em_fecha1.text,1,2)
	is_fecha2=is_fecha1

elseif rb_semana.checked=true then
	is_fecha1=idwc_semana.GetItemString(ii_semana,'fecha1')
	is_fecha2=idwc_semana.GetItemString(ii_semana,'fecha2')
	is_semana=idwc_semana.GetItemString(ii_semana,'descripcion')

elseif rb_mes.checked=true then
	is_fecha1=idwc_mes.GetItemString(ii_mes,'fecha1')
	is_fecha2=idwc_mes.GetItemString(ii_mes,'fecha2')
	is_mes=idwc_mes.GetItemString(ii_mes,'descripcion')

else
	is_fecha1=''
	is_fecha2=''
	
end if

uf_carga()
end event

type em_fecha1 from editmask within w_gen_reporte_por_dia
integer x = 424
integer y = 160
integer width = 377
integer height = 74
integer taborder = 10
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

event modified;/*dw_disponible.Reset()
cb_generar.enabled=false
*/
end event

type rb_semana from radiobutton within w_gen_reporte_por_dia
integer x = 102
integer y = 256
integer width = 413
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Semana:"
end type

type rb_dia from radiobutton within w_gen_reporte_por_dia
integer x = 102
integer y = 160
integer width = 307
integer height = 77
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Fecha:"
boolean checked = true
end type

type dw_material from u_basedw within w_gen_reporte_por_dia
integer x = 3716
integer y = 61
integer width = 980
integer height = 77
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_csal_mat_matmaterial_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("material", "material", "material")
end event

event itemchanged;call super::itemchanged;string ls_find
integer li_pos

is_material=this.gettext()

ls_find="cvematerial='"+is_material+"'"
li_pos=idwc_material.Find(ls_find,1,idwc_material.RowCount())
if li_pos>0 then is_material_nom=idwc_material.GetItemString(li_pos,'descripcion')
end event

type dw_grupo from u_basedw within w_gen_reporte_por_dia
integer x = 2951
integer y = 61
integer width = 735
integer height = 77
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_csal_mat_matgrupo_drop"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("matgrupo", "matgrupo", "matgrupo")
end event

event itemchanged;call super::itemchanged;integer li_row, li_pos
string ls_find

is_grupo_nom=''
if IsNumber(trim(this.gettext())) then ii_grupo=integer(trim(this.gettext()))

ls_find="cvegrupo="+string(ii_grupo)
li_pos=idwc_grupo.Find(ls_find,1,idwc_grupo.RowCount())
if li_pos>0 then is_grupo_nom=idwc_grupo.GetItemString(li_pos,'descripcion')

dw_material.Reset()
idwc_material.Reset()

idwc_material.Retrieve(gi_depto,gi_area,ii_grupo)
idwc_material.insertrow(0)
li_row=idwc_material.RowCount()
idwc_material.SetItem(li_row,'cvematerial',-1)
idwc_material.SetItem(li_row,'disponibilidad',0)
idwc_material.SetItem(li_row,'descripcion','***TODOS***')
dw_material.insertrow(0)

is_material='-1'

end event

type dw_carga from datawindow within w_gen_reporte_por_dia
integer x = 51
integer y = 544
integer width = 4692
integer height = 2013
integer taborder = 10
string title = "none"
string dataobject = "d_gen_rep_por_dia"
boolean hscrollbar = true
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


end event

type dw_datos from datawindow within w_gen_reporte_por_dia
boolean visible = false
integer x = 1185
integer y = 2166
integer width = 410
integer height = 374
integer taborder = 30
string title = "none"
string dataobject = "d_gen_tab_grupo_conteo_hora"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_gen_reporte_por_dia
integer x = 62
integer width = 4677
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

