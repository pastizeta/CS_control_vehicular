$PBExportHeader$w_gen_reporte_por_conteo.srw
forward
global type w_gen_reporte_por_conteo from window
end type
type sle_solicitante from singlelineedit within w_gen_reporte_por_conteo
end type
type st_solicitante from statictext within w_gen_reporte_por_conteo
end type
type ddlb_periodo from dropdownlistbox within w_gen_reporte_por_conteo
end type
type st_periodo from statictext within w_gen_reporte_por_conteo
end type
type st_anio from statictext within w_gen_reporte_por_conteo
end type
type cb_exporta from commandbutton within w_gen_reporte_por_conteo
end type
type st_grupo from statictext within w_gen_reporte_por_conteo
end type
type ddlb_anio from dropdownlistbox within w_gen_reporte_por_conteo
end type
type cb_buscar from commandbutton within w_gen_reporte_por_conteo
end type
type dw_material from u_basedw within w_gen_reporte_por_conteo
end type
type dw_carga from datawindow within w_gen_reporte_por_conteo
end type
type gb_1 from groupbox within w_gen_reporte_por_conteo
end type
type dw_grupo from u_basedw within w_gen_reporte_por_conteo
end type
end forward

global type w_gen_reporte_por_conteo from window
integer width = 6038
integer height = 2675
boolean titlebar = true
string title = "Reporte de préstamos por conteo de días prestados"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
sle_solicitante sle_solicitante
st_solicitante st_solicitante
ddlb_periodo ddlb_periodo
st_periodo st_periodo
st_anio st_anio
cb_exporta cb_exporta
st_grupo st_grupo
ddlb_anio ddlb_anio
cb_buscar cb_buscar
dw_material dw_material
dw_carga dw_carga
gb_1 gb_1
dw_grupo dw_grupo
end type
global w_gen_reporte_por_conteo w_gen_reporte_por_conteo

type variables
date id_diasemana[7]

DatawindowChild idwc_grupo, idwc_material

integer ii_grupo=-1,  ii_anio, ii_periodo
long il_solicitante=-1

string is_material='-1', is_fecha1, is_fecha2
string is_grupo_nom, is_material_nom, is_periodo
string is_sort="#13A #14A #8A #5A"

datetime idt_fechainicio, idt_fechafin


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
	f_exportar_reporte(dw_exporta_dia)
end if*/
end subroutine

public subroutine uf_carga ();dw_carga.Reset()
dw_carga.SetRedraw(false)

dw_carga.Retrieve(gi_depto,gi_area,is_fecha1,is_fecha2,ii_grupo,is_material,il_solicitante)

dw_carga.SetSort(is_sort) 
dw_carga.Sort() 		
dw_carga.SetRedraw(true)


end subroutine

on w_gen_reporte_por_conteo.create
this.sle_solicitante=create sle_solicitante
this.st_solicitante=create st_solicitante
this.ddlb_periodo=create ddlb_periodo
this.st_periodo=create st_periodo
this.st_anio=create st_anio
this.cb_exporta=create cb_exporta
this.st_grupo=create st_grupo
this.ddlb_anio=create ddlb_anio
this.cb_buscar=create cb_buscar
this.dw_material=create dw_material
this.dw_carga=create dw_carga
this.gb_1=create gb_1
this.dw_grupo=create dw_grupo
this.Control[]={this.sle_solicitante,&
this.st_solicitante,&
this.ddlb_periodo,&
this.st_periodo,&
this.st_anio,&
this.cb_exporta,&
this.st_grupo,&
this.ddlb_anio,&
this.cb_buscar,&
this.dw_material,&
this.dw_carga,&
this.gb_1,&
this.dw_grupo}
end on

on w_gen_reporte_por_conteo.destroy
destroy(this.sle_solicitante)
destroy(this.st_solicitante)
destroy(this.ddlb_periodo)
destroy(this.st_periodo)
destroy(this.st_anio)
destroy(this.cb_exporta)
destroy(this.st_grupo)
destroy(this.ddlb_anio)
destroy(this.cb_buscar)
destroy(this.dw_material)
destroy(this.dw_carga)
destroy(this.gb_1)
destroy(this.dw_grupo)
end on

event open;string ls_anio, ls_mes, ls_dia
integer li_row, li_i, li_pos

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

dw_carga.settransobject(gtr_sumuia)

ls_anio=string(year(date(now())))
is_fecha1=ls_anio+'0101'
is_fecha2=ls_anio+'0531'
is_periodo = 'Primavera'
ii_periodo = 0


for li_i=2012 to integer(ls_anio)
	 ddlb_anio.AddItem(string(li_i))
next

li_pos= ddlb_anio.FindItem(ls_anio,20)
ddlb_anio.SelectItem(li_pos)
ii_anio=integer(ls_anio)

li_pos= ddlb_periodo.FindItem(is_periodo,20)
ddlb_periodo.SelectItem(li_pos)

//post uf_carga()

end event

type sle_solicitante from singlelineedit within w_gen_reporte_por_conteo
integer x = 699
integer y = 310
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

type st_solicitante from statictext within w_gen_reporte_por_conteo
integer x = 143
integer y = 323
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

type ddlb_periodo from dropdownlistbox within w_gen_reporte_por_conteo
integer x = 1430
integer y = 61
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

type st_periodo from statictext within w_gen_reporte_por_conteo
integer x = 1079
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

type st_anio from statictext within w_gen_reporte_por_conteo
integer x = 143
integer y = 74
integer width = 252
integer height = 83
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

type cb_exporta from commandbutton within w_gen_reporte_por_conteo
integer x = 5347
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
	f_exportar_reporte(dw_carga,0,'')
end if
end event

type st_grupo from statictext within w_gen_reporte_por_conteo
integer x = 143
integer y = 192
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
boolean focusrectangle = false
end type

type ddlb_anio from dropdownlistbox within w_gen_reporte_por_conteo
integer x = 699
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

event selectionchanged;ii_anio=integer(this.text(index))
end event

type cb_buscar from commandbutton within w_gen_reporte_por_conteo
integer x = 4966
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

uf_carga()
end event

type dw_material from u_basedw within w_gen_reporte_por_conteo
integer x = 1459
integer y = 186
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

type dw_carga from datawindow within w_gen_reporte_por_conteo
integer x = 51
integer y = 518
integer width = 5892
integer height = 2013
integer taborder = 10
string title = "none"
string dataobject = "d_gen_tab_grupo_conteo_diapre"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;	if dwo.Type = "text" then
		
		choose case string(dwo.Name)
	
			case 'grupo_t'
				if mid(is_sort,1,4)='#13A' then is_sort="#13D #14A #8A #5A" else is_sort="#13A #14A #8A #5A"
				this.Modify("grupo_t.background.color='8421376'")
				this.Modify("material_t.background.color='29079919'")
				this.Modify("solicitantenom_t.background.color='29079919'")
				this.Modify("solicitanteid_t.background.color='29079919'")
				this.Modify("fecha_inicio_t.background.color='29079919'")
				this.Modify("fecha_final_t.background.color='29079919'")
				this.Modify("dias_naturales_t.background.color='29079919'")
				this.Modify("dias_habiles_t.background.color='29079919'")
				this.Modify("folios_t.background.color='29079919'")
				this.Modify("entregado_t.background.color='29079919'")

			case 'material_t'
				if mid(is_sort,1,4)='#14A' then is_sort="#14D #8A #5A" else is_sort="#14A #8A #5A"
				this.Modify("grupo_t.background.color='29079919'")
				this.Modify("material_t.background.color='8421376'")
				this.Modify("solicitantenom_t.background.color='29079919'")
				this.Modify("solicitanteid_t.background.color='29079919'")
				this.Modify("fecha_inicio_t.background.color='29079919'")
				this.Modify("fecha_final_t.background.color='29079919'")
				this.Modify("dias_naturales_t.background.color='29079919'")
				this.Modify("dias_habiles_t.background.color='29079919'")
				this.Modify("folios_t.background.color='29079919'")
				this.Modify("entregado_t.background.color='29079919'")

			case 'solicitantenom_t'
				if mid(is_sort,1,3)='#8A' then is_sort="#8D #5A #13A #14A " else is_sort="#8A #5A #13A #14A "
				this.Modify("grupo_t.background.color='29079919'")
				this.Modify("material_t.background.color='29079919'")
				this.Modify("solicitantenom_t.background.color='8421376'")
				this.Modify("solicitanteid_t.background.color='29079919'")
				this.Modify("fecha_inicio_t.background.color='29079919'")
				this.Modify("fecha_final_t.background.color='29079919'")
				this.Modify("dias_naturales_t.background.color='29079919'")
				this.Modify("dias_habiles_t.background.color='29079919'")
				this.Modify("folios_t.background.color='29079919'")
				this.Modify("entregado_t.background.color='29079919'")
			
			case 'solicitanteid_t'
				if mid(is_sort,1,3)='#7A' then is_sort="#7D #14A #8A #5A" else is_sort="#7A #14A #8A #5A"
				this.Modify("grupo_t.background.color='29079919'")
				this.Modify("material_t.background.color='29079919'")
				this.Modify("solicitantenom_t.background.color='29079919'")
				this.Modify("solicitanteid_t.background.color='8421376'")
				this.Modify("fecha_inicio_t.background.color='29079919'")
				this.Modify("fecha_final_t.background.color='29079919'")
				this.Modify("dias_naturales_t.background.color='29079919'")
				this.Modify("dias_habiles_t.background.color='29079919'")
				this.Modify("folios_t.background.color='29079919'")
				this.Modify("entregado_t.background.color='29079919'")

			case 'fecha_inicio_t'
				if mid(is_sort,1,3)='#5A' then is_sort="#5D #13A #14A #8A #5A" else is_sort="#5A #13A #14A #8A #5A"
				this.Modify("grupo_t.background.color='29079919'")
				this.Modify("material_t.background.color='29079919'")
				this.Modify("solicitantenom_t.background.color='29079919'")
				this.Modify("solicitanteid_t.background.color='29079919'")
				this.Modify("fecha_inicio_t.background.color='8421376'")
				this.Modify("fecha_final_t.background.color='29079919'")
				this.Modify("dias_naturales_t.background.color='29079919'")
				this.Modify("dias_habiles_t.background.color='29079919'")
				this.Modify("folios_t.background.color='29079919'")
				this.Modify("entregado_t.background.color='29079919'")

			case 'fecha_final_t'
				if mid(is_sort,1,3)='#6A' then is_sort="#6D #13A #14A #8A #5A" else is_sort="#6A #13A #14A #8A #5A"
				this.Modify("grupo_t.background.color='29079919'")
				this.Modify("material_t.background.color='29079919'")
				this.Modify("solicitantenom_t.background.color='29079919'")
				this.Modify("solicitanteid_t.background.color='29079919'")
				this.Modify("fecha_inicio_t.background.color='29079919'")
				this.Modify("fecha_final_t.background.color='8421376'")
				this.Modify("dias_naturales_t.background.color='29079919'")
				this.Modify("dias_habiles_t.background.color='29079919'")
				this.Modify("folios_t.background.color='29079919'")
				this.Modify("entregado_t.background.color='29079919'")

			case 'dias_naturales_t'
				if mid(is_sort,1,3)='#9A' then is_sort="#9D #13A #14A #8A #5A" else is_sort="#9A #13A #14A #8A #5A"
				this.Modify("grupo_t.background.color='29079919'")
				this.Modify("material_t.background.color='29079919'")
				this.Modify("solicitantenom_t.background.color='29079919'")
				this.Modify("solicitanteid_t.background.color='29079919'")
				this.Modify("fecha_inicio_t.background.color='29079919'")
				this.Modify("fecha_final_t.background.color='29079919'")
				this.Modify("dias_naturales_t.background.color='8421376'")
				this.Modify("dias_habiles_t.background.color='29079919'")
				this.Modify("folios_t.background.color='29079919'")
				this.Modify("entregado_t.background.color='29079919'")

			case 'dias_habiles_t'
				if mid(is_sort,1,4)='#10A' then is_sort="#10D #13A #14A #8A #5A" else is_sort="#10A #13A #14A #8A #5A"
				this.Modify("grupo_t.background.color='29079919'")
				this.Modify("material_t.background.color='29079919'")
				this.Modify("solicitantenom_t.background.color='29079919'")
				this.Modify("solicitanteid_t.background.color='29079919'")
				this.Modify("fecha_inicio_t.background.color='29079919'")
				this.Modify("fecha_final_t.background.color='29079919'")
				this.Modify("dias_naturales_t.background.color='29079919'")
				this.Modify("dias_habiles_t.background.color='8421376'")
				this.Modify("folios_t.background.color='29079919'")
				this.Modify("entregado_t.background.color='29079919'")

			case 'entregado_t'
				if mid(is_sort,1,4)='#14A' then is_sort=" #14D #8A #5A #13A #14A " else is_sort="#14A #8A #5A #13A #14A "
				this.Modify("grupo_t.background.color='29079919'")
				this.Modify("material_t.background.color='29079919'")
				this.Modify("solicitantenom_t.background.color='29079919'")
				this.Modify("solicitanteid_t.background.color='29079919'")
				this.Modify("fecha_inicio_t.background.color='29079919'")
				this.Modify("fecha_final_t.background.color='29079919'")
				this.Modify("dias_naturales_t.background.color='29079919'")
				this.Modify("dias_habiles_t.background.color='29079919'")
				this.Modify("folios_t.background.color='29079919'")
				this.Modify("entregado_t.background.color='8421376'")
			
		end choose

		this.SetSort(is_sort) 
		this.Sort() 		
		
	end if
	
end event

type gb_1 from groupbox within w_gen_reporte_por_conteo
integer x = 62
integer width = 5870
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

type dw_grupo from u_basedw within w_gen_reporte_por_conteo
integer x = 695
integer y = 186
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

