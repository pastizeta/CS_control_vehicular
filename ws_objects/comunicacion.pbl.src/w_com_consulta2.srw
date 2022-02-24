$PBExportHeader$w_com_consulta2.srw
forward
global type w_com_consulta2 from w_sheet
end type
type cb_2 from commandbutton within w_com_consulta2
end type
type dw_calendario from datawindow within w_com_consulta2
end type
type cb_1 from commandbutton within w_com_consulta2
end type
type dw_prueba from datawindow within w_com_consulta2
end type
type sle_date from singlelineedit within w_com_consulta2
end type
end forward

global type w_com_consulta2 from w_sheet
integer width = 3767
integer height = 3220
string menuname = "m_calendario_pap"
long backcolor = 29534863
event ue_cargar ( )
event ue_recuperar ( )
event ue_message ( )
cb_2 cb_2
dw_calendario dw_calendario
cb_1 cb_1
dw_prueba dw_prueba
sle_date sle_date
end type
global w_com_consulta2 w_com_consulta2

type variables
//str_buffer istr_buffer

//w_item_calendario_pap iw_item
w_calendario_sem_com iw_semana

//w_item_calendario_pap iw_rango
//w_periodo_aplica iw_rango

string is_wintitle[] = {"Item","Calendario","Periodo de aplicación"}

string is_subtitulo_fecha
integer ii_tipo, ii_carrera
end variables

event ue_cargar();
OpenSheet(w_calendario_sem_com,this, 4, Original!)

//w_calendario.X = 3800
//w_calendario.Y = 5	
//w_calendario.width = 650     //		ancho
//w_calendario.height = 1340   //		largo
//w_calendario.visible = true
//w_calendario.enabled = true
end event

event ue_recuperar();
long ll_resultado
datetime ldt_fecha
//
//str_item lstr_item
//
//long ll_x, ll_y
//long ll_x_min, ll_x_max
//long ll_y_min, ll_y_max
//
//string ls_contenido, ls_item[]
//
//any la_tabla_verdad[]
//any la_valores[]
//integer li_test
//
date ldt_fecha_rango[]
//	
n_ds lds_semana
//
any la_data[]

messagebox("GLO","ESTOY AQUI EN CALENDARIO RECUPERAR")
//
///*----------------------------------------------*/
///* Paso de parámetros.									*/
///*----------------------------------------------*/
//
//istr_msgparm = message.powerobjectparm
//la_data = istr_msgparm.data
//
ldt_fecha = datetime(la_data[1])
//
///*----------------------------------------------*/
///* Un datastore como herramienta de apoyo para	*/
///* cachar los datos de un stored procedure.		*/
///*----------------------------------------------*/
//
//lds_semana = CREATE n_ds
//lds_semana.dataobject = 'd_semana_pap'
//lds_semana.of_SetTransObject(gtr_saa)
//lds_semana.of_SetParentWindow(this)
//ll_resultado = lds_semana.retrieve(ldt_fecha)
//
//if ll_resultado > 0 then
//
///*----------------------------------------------------------*/
///* Empezamos...															*/
///*----------------------------------------------------------*/
//	this.event ue_nuevo()
//
///*----------------------------------------------------------*/
///* Llenamos el buffer.													*/
///*----------------------------------------------------------*/
//
//	ll_x_min = 1
//	ll_x_max = lds_semana.rowcount()
//
//	for ll_x = ll_x_min to ll_x_max
//		if isnull(lds_semana.object.data[ll_x,1]) then
//			lstr_item.ai_visita = 2
//		else
//			lstr_item.ai_visita = lds_semana.object.data[ll_x,1]
//		end if
//		
//		if isnull(lds_semana.object.data[ll_x,2]) then
//			lstr_item.adt_fecha = datetime("01/01/1900")
//		else
//			lstr_item.adt_fecha = lds_semana.object.data[ll_x,2]
//		end if
//
//		if isnull(lds_semana.object.data[ll_x,5]) then
//			lstr_item.al_carrera = 0
//		else	
//			lstr_item.al_carrera = lds_semana.object.data[ll_x,5]
//		end if
//		
//		if isnull(lds_semana.object.data[ll_x,6]) then
//			lstr_item.al_responsable = 0
//		else
//			lstr_item.al_responsable = lds_semana.object.data[ll_x,6]
//		end if
//		
//		if isnull(lds_semana.object.data[ll_x,7]) then
//			lstr_item.as_notas = ""
//		else
//			lstr_item.as_notas = lds_semana.object.data[ll_x,7]
//		end if
//		
//		f_matrix_setitem(istr_buffer.primario,lstr_item,lds_semana.object.data[ll_x,3],lds_semana.object.data[ll_x,4])
//	next
//
///*----------------------------------------------------------*/
///*	Asignamos el buffer primario al secundario para controlar*/
///* los cambios.															*/
///*----------------------------------------------------------*/
//
//	istr_buffer.secundario = istr_buffer.primario
//
///*----------------------------------------------------------*/
///* Refrescamos la pantalla.											*/
///*----------------------------------------------------------*/
//
//	ll_x_min = f_matrix_lbound(istr_buffer.primario,1)
//	ll_x_max = f_matrix_ubound(istr_buffer.primario,1)
//
//	ll_y_min = f_matrix_lbound(istr_buffer.primario,2)
//	ll_y_max = f_matrix_ubound(istr_buffer.primario,2)
//
//	for ll_x = ll_x_min to ll_x_max
//		for ll_y = ll_y_min to ll_y_max
//			lstr_item =	f_matrix_getitem(istr_buffer.primario,ll_x,ll_y)
//
///*-------------------------------------------------*/
///* Llenamos la variable booleana.						*/
///*-------------------------------------------------*/
//
//			la_valores[1] = lstr_item.al_carrera > 0
//			la_valores[2] = lstr_item.al_responsable > 0
//			la_valores[3] = len(lstr_item.as_notas) > 0
//			
///*-------------------------------------------------*/
///* Evaluamos con una tabla de verdad					*/
///*-------------------------------------------------*/
//
//			la_tabla_verdad = f_tabla_verdad(upperbound(la_valores))
//
//			li_test = f_tabla_verdad_test(la_tabla_verdad,la_valores)
//
//			CHOOSE CASE li_test
//				CASE 1
//					this.dw_calendario.setitem(ll_x,ll_y, &
//						of_carrera(lstr_item.al_carrera) + "~r~n" + &
//						of_responsable(lstr_item.al_responsable) + "~r~n" + &
//						lstr_item.as_notas + "~r~n" + &
//						string(date(lstr_item.adt_fecha))+ "~r~n"+ "~r~n")
//				CASE 2
//					this.dw_calendario.setitem(ll_x,ll_y, &
//						of_carrera(lstr_item.al_carrera) + "~r~n" + &
//						of_responsable(lstr_item.al_responsable) + "~r~n" + &
//						string(date(lstr_item.adt_fecha))+ "~r~n"+ "~r~n")
//				CASE 3
//					this.dw_calendario.setitem(ll_x,ll_y, &
//						of_carrera(lstr_item.al_carrera) + "~r~n" + &
//						lstr_item.as_notas + "~r~n" + &
//						string(date(lstr_item.adt_fecha))+ "~r~n"+ "~r~n")
//				CASE 4
//					this.dw_calendario.setitem(ll_x,ll_y, &
//						of_carrera(lstr_item.al_carrera) + "~r~n" + &
//						string(date(lstr_item.adt_fecha))+ "~r~n"+ "~r~n")
//				CASE ELSE
//					this.dw_calendario.setitem(ll_x,ll_y,"")
//			END CHOOSE
//
///*-------------------------------------------------*/
//
//		next
//	next
//
//	this.dw_calendario.accepttext()
//	
//	ldt_fecha_rango = f_fecha_semana(date(ldt_fecha))
//	
//	this.title = "Calendario(" + string(ldt_fecha_rango[1],"dd/mm/yyyy") + "-" + &
//		string(ldt_fecha_rango[2],"dd/mm/yyyy") + ") :: Pláticas de Atención Preuniversitaria"
//	is_subtitulo_fecha = "semana del " + string(ldt_fecha_rango[1],"dd/mm/yyyy") + &
//		" al " + string(ldt_fecha_rango[2],"dd/mm/yyyy")
//end if
//
//Destroy lds_semana
//
///*-------------------------------------------------*/
//
//messagebox("Información", "Registros recuperados: " + string(ll_resultado),information!)
//
//
//
end event

event ue_message();//istr_msgparm = Message.PowerObjectParm

//this.event ue_setdata()
end event

on w_com_consulta2.create
int iCurrent
call super::create
if this.MenuName = "m_calendario_pap" then this.MenuID = create m_calendario_pap
this.cb_2=create cb_2
this.dw_calendario=create dw_calendario
this.cb_1=create cb_1
this.dw_prueba=create dw_prueba
this.sle_date=create sle_date
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.dw_calendario
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_prueba
this.Control[iCurrent+5]=this.sle_date
end on

on w_com_consulta2.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_2)
destroy(this.dw_calendario)
destroy(this.cb_1)
destroy(this.dw_prueba)
destroy(this.sle_date)
end on

type cb_2 from commandbutton within w_com_consulta2
integer x = 3333
integer y = 2600
integer width = 311
integer height = 168
integer taborder = 20
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

type dw_calendario from datawindow within w_com_consulta2
integer x = 59
integer y = 76
integer width = 3584
integer height = 832
integer taborder = 10
string title = "none"
string dataobject = "d_cm_consulta2"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(gtr_sumuia)

//this.post event ue_nuevo()
end event

type cb_1 from commandbutton within w_com_consulta2
integer x = 475
integer y = 2856
integer width = 402
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;string day_name
integer i,li_mes,li_dia,li_anio,lidia
datetime fecha_inicio,fecha_fin
Date fecha
string ClaveMat, lsDesc, lsNumSerie, lsstatus
integer liRow,liStatus
long llCtasol



dw_prueba.retrieve()

for i = 1 to dw_prueba.rowcount()
	llCtaSol = dw_prueba.object.spre_solicitud_solicitanteid[i]
	fecha_inicio = dw_prueba.object.spre_solicitud_fecha_inicio[i]
	fecha_fin = dw_prueba.object.spre_solicitud_fecha_fin[i]
 	ClaveMat = dw_prueba.object.spre_sol_materiales_cvematerial[i]
	lsNumSerie = dw_prueba.object.spre_sol_materiales_num_serie[i]
	lsDesc =	dw_prueba.object.spre_materiales_descripcion[i]
	liStatus = dw_prueba.object.spre_solicitud_status[i]
	fecha = date(fecha_inicio)
	
	li_mes	= month(fecha)
	li_dia	= day(fecha)
	li_anio	= year(fecha)
	
	sle_date.text = string(li_anio) + '-' + string(li_mes) + '-' + string(li_dia)
	
	IF IsDate(sle_date.Text) THEN
		day_name = DayName(Date(sle_date.Text))
	ELSE
		MessageBox("Error", &
		"This date is invalid: " &
		+ sle_date.Text)
	END IF
	
	if day_name = 'Monday' then
		day_name = 'Lunes'
		lidia = 2
	elseif day_name = 'Tuesday' then
		day_name = 'Martes'
		lidia = 3
	elseif day_name = 'Wednesday' then
		day_name = 'Miercoles'
		lidia = 4
	elseif day_name = 'Thursday' then
		day_name = 'Jueves'
		lidia = 5
	elseif day_name = 'Friday' then
		day_name = 'Viernes'
		lidia = 6
	elseif day_name = 'Saturday' then
		day_name = 'Sabado'
		lidia = 7
	elseif day_name = 'Sunday' then
		day_name = 'Domingo'
		lidia = 1
	end if
	
	if liStatus = 0 then
		lsstatus = 'P.Activo'
	else 
		lsstatus = 'Reservación'
	end if
	
	lirow = dw_calendario.Insertrow(0)
	if lidia= 2 then
		dw_calendario.object.dia2[lirow] = lsDesc + ' ' + string(llCtaSol) + ' ' + string(fecha_inicio) + ' ' + string(fecha_fin) + ' '+ lsNumSerie + ' ' + lsstatus //"~r~n" + &
	elseif lidia = 3 then
		dw_calendario.object.dia3[lirow] = lsDesc + ' ' + string(llCtaSol) + ' ' + string(fecha_inicio) + ' ' + string(fecha_fin) + ' '+ lsNumSerie + ' ' + lsstatus
	elseif lidia = 4 then
		dw_calendario.object.dia4[lirow] = lsDesc + ' ' + string(llCtaSol) + ' ' + string(fecha_inicio) + ' ' + string(fecha_fin) + ' '+ lsNumSerie + ' '	+ lsstatus
	elseif lidia = 5 then
		dw_calendario.object.dia5[lirow] = lsDesc + ' ' + string(llCtaSol) + ' ' + string(fecha_inicio) + ' ' + string(fecha_fin) + ' '+ lsNumSerie + ' '	+ lsstatus
	elseif lidia = 6 then
		dw_calendario.object.dia6[lirow] = lsDesc + ' ' + string(llCtaSol) + ' ' + string(fecha_inicio) + ' ' + string(fecha_fin) + ' '+ lsNumSerie + ' '	+ lsstatus
	end if

next
end event

type dw_prueba from datawindow within w_com_consulta2
integer x = 37
integer y = 2868
integer width = 411
integer height = 80
integer taborder = 20
string title = "none"
string dataobject = "d_consulta_1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(gtr_sumuia)
end event

type sle_date from singlelineedit within w_com_consulta2
integer x = 910
integer y = 2876
integer width = 402
integer height = 76
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

