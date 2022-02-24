$PBExportHeader$w_gen_cat_fechas_inhabiles.srw
forward
global type w_gen_cat_fechas_inhabiles from window
end type
type dw_fecha from datawindow within w_gen_cat_fechas_inhabiles
end type
type cb_eliminar from commandbutton within w_gen_cat_fechas_inhabiles
end type
type cb_actualizar from commandbutton within w_gen_cat_fechas_inhabiles
end type
type cb_nuevo from commandbutton within w_gen_cat_fechas_inhabiles
end type
type gb_fecha from groupbox within w_gen_cat_fechas_inhabiles
end type
end forward

global type w_gen_cat_fechas_inhabiles from window
integer width = 1097
integer height = 1613
boolean titlebar = true
string title = "Catálogo de Fechas inhábiles"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_fecha dw_fecha
cb_eliminar cb_eliminar
cb_actualizar cb_actualizar
cb_nuevo cb_nuevo
gb_fecha gb_fecha
end type
global w_gen_cat_fechas_inhabiles w_gen_cat_fechas_inhabiles

type variables
integer ii_cvearea
end variables

forward prototypes
public function integer f_ultima_area ()
end prototypes

public function integer f_ultima_area ();integer li_area

	select max(cvearea)
	into :li_area
	from dbo.spre_areas
	where cvedepto =:gi_depto
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máxima Área", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_area) then li_area=0

	return(li_area)
end function

on w_gen_cat_fechas_inhabiles.create
this.dw_fecha=create dw_fecha
this.cb_eliminar=create cb_eliminar
this.cb_actualizar=create cb_actualizar
this.cb_nuevo=create cb_nuevo
this.gb_fecha=create gb_fecha
this.Control[]={this.dw_fecha,&
this.cb_eliminar,&
this.cb_actualizar,&
this.cb_nuevo,&
this.gb_fecha}
end on

on w_gen_cat_fechas_inhabiles.destroy
destroy(this.dw_fecha)
destroy(this.cb_eliminar)
destroy(this.cb_actualizar)
destroy(this.cb_nuevo)
destroy(this.gb_fecha)
end on

event open;dw_fecha.settransobject(gtr_sumuia)
dw_fecha.Retrieve(gi_depto,gi_area)


end event

type dw_fecha from datawindow within w_gen_cat_fechas_inhabiles
integer x = 117
integer y = 102
integer width = 830
integer height = 1190
integer taborder = 10
string title = "none"
string dataobject = "d_gen_cat_fecha_inhabil"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//if currentrow>0 then ii_cvearea=dw_area.GetItemNumber(currentrow,'cvearea')
end event

type cb_eliminar from commandbutton within w_gen_cat_fechas_inhabiles
integer x = 713
integer y = 1379
integer width = 300
integer height = 99
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Eliminar"
end type

event clicked;integer li_row, NET, li_anio
datetime ldt_fecha
string ls_fecha, ls_anio, ls_mes, ls_dia

if dw_fecha.RowCount()>0 then
	
	Net = messagebox("Atención", '¿Desea eliminar el registro?', Question!, yesno!, 2)
	if Net = 1 then 		
	
		li_row=dw_fecha.getrow()
		li_anio=dw_fecha.GetItemNumber(li_row,'anio')
		ldt_fecha=dw_fecha.GetItemDateTime(li_row,'fecha')
		
		ls_anio=string(Year(Date(ldt_fecha)))
		ls_mes=string(Month(Date(ldt_fecha)))
		ls_dia=string(Day(Date(ldt_fecha)))
		if len(ls_mes)=1 then ls_mes='0'+ls_mes
		if len(ls_dia)=1 then ls_dia='0'+ls_dia
		ls_fecha=ls_anio+ls_mes+ls_dia

		delete 
		from dbo.spre_fecha_inhabil
		where cvedepto=:gi_depto
		and cvearea=:gi_area
		and anio=:li_anio
		and CONVERT(VARCHAR(8),fecha, 112) =:ls_fecha
		using gtr_sumuia;
		
		if gtr_sumuia.SQLCode = -1 then 
			messagebox("Mensaje del sistema","El registro NO ha sido Eliminado con éxito.",stopsign!)
			rollback using gtr_sumuia;
		else
			messagebox("Mensaje del sistema","El registro ha sido Eliminado con éxito.",exclamation!)
			commit using gtr_sumuia;	
		end if		
	
		dw_fecha.Reset()
		dw_fecha.Retrieve(gi_depto, gi_area)
			
	end if
	
end if


end event

type cb_actualizar from commandbutton within w_gen_cat_fechas_inhabiles
integer x = 388
integer y = 1379
integer width = 322
integer height = 99
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar"
end type

event clicked;integer li_i, li_area, NET, li_j=0, li_k
integer li_narea, li_tipo
string ls_descripcion
	
if dw_fecha.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then 		
		
		if dw_fecha.update()>0 then
			commit using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
		else
			rollback using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
		end if
		
		cb_nuevo.enabled=true
	
	end if

end if

end event

type cb_nuevo from commandbutton within w_gen_cat_fechas_inhabiles
integer x = 77
integer y = 1379
integer width = 300
integer height = 99
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Nuevo"
end type

event clicked;long ll_nva_linea

cb_nuevo.enabled=false

dw_fecha.setfocus()	

if dw_fecha.accepttext()=1 then
	ll_nva_linea=dw_fecha.insertrow(0)
	dw_fecha.setcolumn(1)
	dw_fecha.scrolltorow(ll_nva_linea)
end if

dw_fecha.setitem(dw_fecha.getrow(),'cvedepto',gi_depto)
dw_fecha.setitem(dw_fecha.getrow(),'cvearea',gi_area)

end event

type gb_fecha from groupbox within w_gen_cat_fechas_inhabiles
integer x = 69
integer y = 35
integer width = 940
integer height = 1302
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Fecha"
end type

