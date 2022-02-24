$PBExportHeader$w_csal_control_salones_extraordinarios.srw
forward
global type w_csal_control_salones_extraordinarios from window
end type
type dw_csal_salones_temporales_dias from datawindow within w_csal_control_salones_extraordinarios
end type
type dw_csal_salones_temporales_unlapso from datawindow within w_csal_control_salones_extraordinarios
end type
type st_reservaciones from statictext within w_csal_control_salones_extraordinarios
end type
type cbx_todos from checkbox within w_csal_control_salones_extraordinarios
end type
type cb_aplicar from commandbutton within w_csal_control_salones_extraordinarios
end type
type rb_cancelar from radiobutton within w_csal_control_salones_extraordinarios
end type
type rb_confirmar from radiobutton within w_csal_control_salones_extraordinarios
end type
type dw_csal_control_extraordinarios from datawindow within w_csal_control_salones_extraordinarios
end type
type dw_csal_salones_extraordinarios from datawindow within w_csal_control_salones_extraordinarios
end type
type gb_1 from groupbox within w_csal_control_salones_extraordinarios
end type
end forward

global type w_csal_control_salones_extraordinarios from window
integer width = 5376
integer height = 2333
boolean titlebar = true
string title = "Ventana de admnistración de reservaciones extraordinarias"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 29534863
string icon = "AppIcon!"
boolean center = true
dw_csal_salones_temporales_dias dw_csal_salones_temporales_dias
dw_csal_salones_temporales_unlapso dw_csal_salones_temporales_unlapso
st_reservaciones st_reservaciones
cbx_todos cbx_todos
cb_aplicar cb_aplicar
rb_cancelar rb_cancelar
rb_confirmar rb_confirmar
dw_csal_control_extraordinarios dw_csal_control_extraordinarios
dw_csal_salones_extraordinarios dw_csal_salones_extraordinarios
gb_1 gb_1
end type
global w_csal_control_salones_extraordinarios w_csal_control_salones_extraordinarios

type variables
integer ii_accion=1 //0 Cancelar 1 Confirmar
integer ii_periodo, ii_anio
date ld_inicio, ld_final
string is_sort="#2A #16A #5A #14A"
end variables

forward prototypes
public subroutine uf_cargar_reservados ()
end prototypes

public subroutine uf_cargar_reservados ();integer li_reservados, li_i, li_j=0, li_cve_dia, li_dias_lapso, li_k, li_dia_fecha, li_lapso_actual
string ls_dia, ls_fecha, ls_lapso
date ld_fecha_inicio, ld_fecha_final, ld_fecha

dw_csal_control_extraordinarios.Reset()
dw_csal_salones_extraordinarios.Reset()
dw_csal_control_extraordinarios.SetRedraw(false)

dw_csal_salones_extraordinarios.retrieve(ld_inicio, ld_final)
li_reservados=dw_csal_salones_extraordinarios.rowcount()

for li_i=1 to li_reservados

	li_lapso_actual=dw_csal_salones_extraordinarios.GetItemNumber(li_i,"lapso_completo")	
	if li_lapso_actual>0 then 
		if (dw_csal_control_extraordinarios.Find("lapso_completo="+string(li_lapso_actual),1,li_j))>0 then goto sigue 
	end if

	li_j=li_j+1
	dw_csal_control_extraordinarios.insertrow(0)
	dw_csal_control_extraordinarios.SetItem(li_j,"reservacion",0)
	dw_csal_control_extraordinarios.SetItem(li_j, "cve_salon", dw_csal_salones_extraordinarios.GetItemString(li_i,"cve_salon"))	
	dw_csal_control_extraordinarios.SetItem(li_j, "nom_dia",ls_dia)
	dw_csal_control_extraordinarios.SetItem(li_j, "cve_profesor",dw_csal_salones_extraordinarios.GetItemNumber(li_i,"cve_profesor"))
	dw_csal_control_extraordinarios.SetItem(li_j, "cve_dia",dw_csal_salones_extraordinarios.GetItemNumber(li_i,"cve_dia"))
	dw_csal_control_extraordinarios.SetItem(li_j, "nom_profesor",f_select_nombre_profesor(dw_csal_salones_extraordinarios.GetItemNumber(li_i,"cve_profesor")))
	dw_csal_control_extraordinarios.SetItem(li_j, "observaciones", dw_csal_salones_extraordinarios.GetItemString(li_i,"observaciones"))	
	dw_csal_control_extraordinarios.SetItem(li_j, "hora_inicio", dw_csal_salones_extraordinarios.GetItemNumber(li_i,"hora_inicio"))	
	dw_csal_control_extraordinarios.SetItem(li_j, "hora_final", dw_csal_salones_extraordinarios.GetItemNumber(li_i,"hora_final"))	
	dw_csal_control_extraordinarios.SetItem(li_j, "fecha_inicio", date(dw_csal_salones_extraordinarios.GetItemDateTime(li_i,"fecha_inicio")))
	dw_csal_control_extraordinarios.SetItem(li_j, "fecha_final", date(dw_csal_salones_extraordinarios.GetItemDateTime(li_i,"fecha_final")))
	dw_csal_control_extraordinarios.SetItem(li_j, "fecha_movimiento", date(dw_csal_salones_extraordinarios.GetItemDateTime(li_i,"fecha_movimiento")))
	dw_csal_control_extraordinarios.SetItem(li_j, "num_asignacion", dw_csal_salones_extraordinarios.GetItemNumber(li_i,"num_asignacion"))	
	dw_csal_control_extraordinarios.SetItem(li_j, "lapso_completo", dw_csal_salones_extraordinarios.GetItemNumber(li_i,"lapso_completo"))	
	dw_csal_control_extraordinarios.SetItem(li_j, "horario",string(dw_csal_salones_extraordinarios.GetItemNumber(li_i,"hora_inicio"))+' A '+string(dw_csal_salones_extraordinarios.GetItemNumber(li_i,"hora_final")))

	ld_fecha_inicio=date(dw_csal_salones_extraordinarios.GetItemDateTime(li_i,"fecha_inicio"))
	ld_fecha_final=date(dw_csal_salones_extraordinarios.GetItemDateTime(li_i,"fecha_final"))

	if dw_csal_salones_extraordinarios.GetItemNumber(li_i,"lapso_completo")=0 then
		
		li_cve_dia=dw_csal_salones_extraordinarios.GetItemNumber(li_i,"cve_dia")
		li_dias_lapso=DaysAfter(ld_fecha_inicio,ld_fecha_final)+1
		ls_lapso=''
				
		for li_k=1 to li_dias_lapso
			ld_fecha=RelativeDate(ld_fecha_inicio,li_k -1)
			li_dia_fecha=Daynumber(ld_fecha)-1
					
			if li_dia_fecha=li_cve_dia then
				ls_fecha=f_convierte_fecha_texto(ld_fecha)
				if ls_lapso='' then 
					ls_lapso=ls_fecha 
				else 	
					ls_lapso=ls_lapso+', '+ls_fecha
				end if
			 end if
		 next
				
		dw_csal_control_extraordinarios.SetItem(li_j, "nom_dia",f_select_nombre_dia(li_cve_dia))		
		dw_csal_control_extraordinarios.SetItem(li_j, "lapso",ls_lapso)
				
	else
		dw_csal_control_extraordinarios.SetItem(li_j, "nom_dia",'TODOS')
		dw_csal_control_extraordinarios.SetItem(li_j, "cve_dia",-1)
		dw_csal_control_extraordinarios.SetItem(li_j, "lapso",f_convierte_fecha_texto(ld_fecha_inicio)+' AL '+f_convierte_fecha_texto(ld_fecha_final))
	end if	
	
	sigue:
	
next

dw_csal_control_extraordinarios.SetSort(is_sort)
dw_csal_control_extraordinarios.Sort()
dw_csal_control_extraordinarios.SetRedraw(true)


if dw_csal_control_extraordinarios.rowcount()>0 then dw_csal_control_extraordinarios.SetFocus()
st_reservaciones.text="Total Reservaciones: "+string(dw_csal_control_extraordinarios.rowcount())
end subroutine

on w_csal_control_salones_extraordinarios.create
this.dw_csal_salones_temporales_dias=create dw_csal_salones_temporales_dias
this.dw_csal_salones_temporales_unlapso=create dw_csal_salones_temporales_unlapso
this.st_reservaciones=create st_reservaciones
this.cbx_todos=create cbx_todos
this.cb_aplicar=create cb_aplicar
this.rb_cancelar=create rb_cancelar
this.rb_confirmar=create rb_confirmar
this.dw_csal_control_extraordinarios=create dw_csal_control_extraordinarios
this.dw_csal_salones_extraordinarios=create dw_csal_salones_extraordinarios
this.gb_1=create gb_1
this.Control[]={this.dw_csal_salones_temporales_dias,&
this.dw_csal_salones_temporales_unlapso,&
this.st_reservaciones,&
this.cbx_todos,&
this.cb_aplicar,&
this.rb_cancelar,&
this.rb_confirmar,&
this.dw_csal_control_extraordinarios,&
this.dw_csal_salones_extraordinarios,&
this.gb_1}
end on

on w_csal_control_salones_extraordinarios.destroy
destroy(this.dw_csal_salones_temporales_dias)
destroy(this.dw_csal_salones_temporales_unlapso)
destroy(this.st_reservaciones)
destroy(this.cbx_todos)
destroy(this.cb_aplicar)
destroy(this.rb_cancelar)
destroy(this.rb_confirmar)
destroy(this.dw_csal_control_extraordinarios)
destroy(this.dw_csal_salones_extraordinarios)
destroy(this.gb_1)
end on

event open;f_select_anio_periodo_actual_fechas(ii_periodo,ii_anio,today(),ld_inicio, ld_final)

//messagebox(string(ld_inicio),string(ld_final))
post uf_cargar_reservados()
end event

event close;//w_csal_prestamo_salon.uf_carga_semana(today())
end event

type dw_csal_salones_temporales_dias from datawindow within w_csal_control_salones_extraordinarios
boolean visible = false
integer x = 3899
integer y = 1232
integer width = 99
integer height = 90
integer taborder = 20
string title = "none"
string dataobject = "d_csal_salones_temporales_dias"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_csal_salones_temporales_unlapso from datawindow within w_csal_control_salones_extraordinarios
boolean visible = false
integer x = 3855
integer y = 1514
integer width = 102
integer height = 102
integer taborder = 30
string title = "none"
string dataobject = "d_csal_salones_temporales_unlapso"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer li_check

if dwo.Type = "column" then
	
	if string(dwo.Name)= 'marcado' then
	
	li_check=this.GetItemNumber(row,"marcado") 

		choose case li_check
			case 0
				li_check=1
			case 1
				li_check=0	
			end choose
		end if

end if
	 	

end event

event constructor;this.setTransObject(gtr_sumuia)
end event

type st_reservaciones from statictext within w_csal_control_salones_extraordinarios
integer x = 2940
integer y = 294
integer width = 629
integer height = 86
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Reservaciones: 0"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_todos from checkbox within w_csal_control_salones_extraordinarios
integer x = 51
integer y = 278
integer width = 530
integer height = 77
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Seleccionar todos"
end type

event clicked;integer li_i, li_row, li_valor

li_row=dw_csal_control_extraordinarios.rowcount()

if this.checked=true then li_valor=1 else li_valor=0

for li_i=1 to li_row
	dw_csal_control_extraordinarios.SetItem(li_i,"reservacion",li_valor)
next



end event

type cb_aplicar from commandbutton within w_csal_control_salones_extraordinarios
integer x = 1020
integer y = 38
integer width = 300
integer height = 106
integer taborder = 20
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Aplicar"
end type

event clicked;integer li_i, li_row, li_num_asignacion, li_mensaje, li_lapso_completo=0, li_varios=0 
integer li_asigna=0, li_j=0
string ls_reservacion, ls_accion

dw_csal_control_extraordinarios.SetFilter("reservacion=1")
dw_csal_control_extraordinarios.Filter()

li_row=dw_csal_control_extraordinarios.rowcount()

if ii_accion=0 then ls_accion='cancelar' else ls_accion='confirmar'

if li_row=0 then 
	MessageBox("Aviso", "Debe marcar al menos una PreReservación a "+ls_accion+".")
	goto salir	
end if

li_mensaje = MessageBox("Aviso", "¿Seguro que desea "+ls_accion+" las PreReservaciones marcadas?", Exclamation!, YesNo!, 2)

if li_mensaje=1 then

	
	li_varios=dw_csal_control_extraordinarios.Find("lapso like '%,%'",1,li_row)
	li_lapso_completo=dw_csal_control_extraordinarios.Find("lapso_completo>0",1,li_row)
	
	if li_varios>0 or li_lapso_completo>0 then li_mensaje = MessageBox("Aviso", "Alguna de las PreReservaciones seleccionada abarca varios días, desea "+ls_accion+" todos.",Exclamation!, YesNo!, 2)
	
	for li_i=1 to li_row

		li_num_asignacion=dw_csal_control_extraordinarios.GetItemNumber(li_i,"num_asignacion")
		li_lapso_completo=dw_csal_control_extraordinarios.GetItemNumber(li_i,"lapso_completo")
		li_varios=pos(dw_csal_control_extraordinarios.GetItemString(li_i,"lapso"),',')

		if li_mensaje>1 and (li_lapso_completo>0 or li_varios>0) then goto sigue
		
		if li_lapso_completo=0 then		
			if ii_accion=0 then f_delete_reservacion_temporal(li_num_asignacion) else f_update_estatus_reservacion(4,li_num_asignacion)
		else
			//aplicar a todos los num_asignacion del lapso
			
			dw_csal_salones_extraordinarios.SetFilter("lapso_completo="+string(li_lapso_completo))
			dw_csal_salones_extraordinarios.Filter()
			li_asigna=dw_csal_salones_extraordinarios.RowCount()

			for li_j=1 to li_asigna
				li_num_asignacion=dw_csal_salones_extraordinarios.GetItemNumber(li_j,"num_asignacion")
				if ii_accion=0 then f_delete_reservacion_temporal(li_num_asignacion) else f_update_estatus_reservacion(4,li_num_asignacion)
			next
			
			dw_csal_salones_extraordinarios.SetFilter("")
			dw_csal_salones_extraordinarios.Filter()
			
			
		end if
		sigue:
	
	next
		
	uf_cargar_reservados()
	cbx_todos.checked=false
		
end if

salir:



dw_csal_control_extraordinarios.SetRedraw(false)
dw_csal_control_extraordinarios.SetFilter('')
dw_csal_control_extraordinarios.Filter()
dw_csal_control_extraordinarios.SetSort(is_sort)
dw_csal_control_extraordinarios.Sort()
dw_csal_control_extraordinarios.SetRedraw(true)

st_reservaciones.text="Total Reservaciones: "+string(dw_csal_control_extraordinarios.rowcount())
end event

type rb_cancelar from radiobutton within w_csal_control_salones_extraordinarios
integer x = 62
integer y = 138
integer width = 739
integer height = 77
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Cancelar Reservaciones"
end type

event clicked;ii_accion=0
end event

type rb_confirmar from radiobutton within w_csal_control_salones_extraordinarios
integer x = 62
integer y = 58
integer width = 764
integer height = 77
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Confirmar Reservaciones"
boolean checked = true
end type

event clicked;ii_accion=1
end event

type dw_csal_control_extraordinarios from datawindow within w_csal_control_salones_extraordinarios
integer x = 40
integer y = 387
integer width = 5219
integer height = 1795
integer taborder = 20
string title = "none"
string dataobject = "d_csal_control_extraordinarios"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer li_check


choose case dwo.Type
		
	case "column"

		if string(dwo.Name)= 'reservacion' then
		
			li_check=this.GetItemNumber(row,"reservacion") 
	
			choose case li_check
				case 0
					li_check=1
				case 1
					li_check=0	
				end choose
				
		end if


	case "text"
		
		
		choose case string(dwo.Name)

				case 'cve_salon_t'
					is_sort="#2A #16A #5A #14A"
					this.Modify("cve_salon_t.background.color='11527407'")
					this.Modify("nom_profesor_t.background.color='15793151'")
					this.Modify("observaciones_t.background.color='15793151'")
					this.Modify("nom_dia_t.background.color='15793151'")
					this.Modify("horario_t.background.color='15793151'")
					this.Modify("lapso_t.background.color='15793151'")
	
				case 'nom_profesor_t'
					is_sort="#11A #2A #16A #5A #14A"
					this.Modify("cve_salon_t.background.color='15793151'")
					this.Modify("nom_profesor_t.background.color='11527407'")
					this.Modify("observaciones_t.background.color='15793151'")
					this.Modify("nom_dia_t.background.color='15793151'")
					this.Modify("horario_t.background.color='15793151'")
	
				case 'observaciones_t'
					is_sort="#4A #11A #2A #16A #5A #14A"
					this.Modify("cve_salon_t.background.color='15793151'")
					this.Modify("nom_profesor_t.background.color='15793151'")
					this.Modify("observaciones_t.background.color='11527407'")
					this.Modify("nom_dia_t.background.color='15793151'")
					this.Modify("horario_t.background.color='15793151'")
	
				case 'nom_dia_t'
					is_sort="#16A #5A #2A #14A"
					this.Modify("cve_salon_t.background.color='15793151'")
					this.Modify("nom_profesor_t.background.color='15793151'")
					this.Modify("observaciones_t.background.color='15793151'")
					this.Modify("nom_dia_t.background.color='11527407'")
					this.Modify("horario_t.background.color='15793151'")
		
				case 'horario_t'
					is_sort="#5A #8A #16A #2A #14A"
					this.Modify("cve_salon_t.background.color='15793151'")
					this.Modify("nom_profesor_t.background.color='15793151'")
					this.Modify("observaciones_t.background.color='15793151'")
					this.Modify("nom_dia_t.background.color='15793151'")
					this.Modify("horario_t.background.color='11527407'")
	
				case 'lapso_t'
					is_sort="#14A #16A #5A #2A"
					this.Modify("cve_salon_t.background.color='15793151'")
					this.Modify("nom_profesor_t.background.color='15793151'")
					this.Modify("observaciones_t.background.color='15793151'")
					this.Modify("nom_dia_t.background.color='15793151'")
					this.Modify("horario_t.background.color='15793151'")
					
			end choose
	
			this.SetSort(is_sort) 
			this.Sort() 				
			
	
	end choose
	
	
end event

event doubleclicked;integer li_row
string ls_return
str_csal_salones_reservacion lstr_reservacion

if row>0 then

	li_row=row
	 
	if isvalid(w_csal_ficha_salon) then close(w_csal_ficha_salon) 
	
	lstr_reservacion.num_asignacion=this.GetItemNumber(li_row,"num_asignacion") 
	lstr_reservacion.salon=this.GetItemString(li_row,"cve_salon") 
	lstr_reservacion.materia='NO ASIGNADA'
	lstr_reservacion.profesor=this.GetItemString(li_row,"nom_profesor") 
	lstr_reservacion.cve_profesor=this.GetItemNumber(li_row,"cve_profesor")
	lstr_reservacion.cve_dia=this.GetItemNumber(li_row,"cve_dia")
	lstr_reservacion.hora_inicio=this.GetItemNumber(li_row,"hora_inicio")
	lstr_reservacion.hora_final=this.GetItemNumber(li_row,"hora_final")
	lstr_reservacion.fecha_inicio=this.GetItemDate(li_row,"fecha_inicio")
	lstr_reservacion.fecha_final=this.GetItemDate(li_row,"fecha_final")
	lstr_reservacion.fecha_movimiento=this.GetItemDate(li_row,"fecha_movimiento")
	lstr_reservacion.grupo='NA'
	lstr_reservacion.tipo_reservacion='PRERESERVACION EXTRAORDINARIA' 
	lstr_reservacion.observaciones=this.GetItemString(li_row,"observaciones") 
	lstr_reservacion.estatus_reservacion=3 
	lstr_reservacion.lapso_completo=this.GetItemNumber(li_row,"lapso_completo")
	lstr_reservacion.horario=this.GetItemString(li_row,"horario") 
	lstr_reservacion.periodo=ii_periodo
	lstr_reservacion.anio=ii_anio
	
	if (this.GetItemString(li_row,"nom_dia"))='TODOS' then lstr_reservacion.lapso='TODOS LOS DIAS DEL' else lstr_reservacion.lapso=this.GetItemString(li_row,"nom_dia")
	lstr_reservacion.lapso=lstr_reservacion.lapso+' '+this.GetItemString(li_row,"lapso")	
	
	openwithparm(w_csal_ficha_salon_extraordinario, lstr_reservacion)
	ls_return=Message.StringParm

	if Message.StringParm='1' then uf_cargar_reservados()
	
end if


end event

type dw_csal_salones_extraordinarios from datawindow within w_csal_control_salones_extraordinarios
integer x = 15
integer y = 2310
integer width = 3438
integer height = 640
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_csal_salones_extraordinarios_fecha"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type gb_1 from groupbox within w_csal_control_salones_extraordinarios
integer x = 37
integer y = 6
integer width = 933
integer height = 237
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
end type

