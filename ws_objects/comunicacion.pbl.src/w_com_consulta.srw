$PBExportHeader$w_com_consulta.srw
forward
global type w_com_consulta from w_base_sheet
end type
type sle_date from singlelineedit within w_com_consulta
end type
type cb_2 from commandbutton within w_com_consulta
end type
type dw_calendario from datawindow within w_com_consulta
end type
end forward

global type w_com_consulta from w_base_sheet
integer width = 3854
integer height = 2872
string menuname = "m_calendario_pap"
windowstate windowstate = maximized!
long backcolor = 29534863
event ue_cargar ( )
event ue_recuperar ( )
event ue_message ( )
event ue_recuperar_pormaterial ( long ai_grupo,  string as_mat )
event ue_salir ( )
event ue_imprimir ( )
sle_date sle_date
cb_2 cb_2
dw_calendario dw_calendario
end type
global w_com_consulta w_com_consulta

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
ulong	lul_winhandle
any	la_data[]

	
lul_winhandle = inv_platformwin32.of_findwindow(is_wintitle[2])

If lul_winhandle > 0 Then
	la_data[1] = datetime(today())
	istr_msgparm.data = la_data
	message.powerobjectparm = istr_msgparm
	iw_semana.event ue_message()
else
	la_data[1] = datetime(today())
	istr_msgparm.data = la_data
	
	openwithparm (iw_semana,istr_msgparm)
	
	iw_semana.X = 1200
	iw_semana.Y = 2700	
	iw_semana.width = 2350    //		ancho
	iw_semana.height = 1024   //		largo

end If

end event

event ue_recuperar();//		Muestra los materiariales y Espacios islas
//		en Prestamo o Reservados.

//		Consulta por Fecha(Semana).
//		Septiembre 2006

long ll_resultado
datetime ldt_fecha

date ldt_fecha_rango[]
n_ds lds_semana
any la_data[]

dw_calendario.reset()

//----------------------------------------------
// Paso de parámetros.									
//----------------------------------------------

istr_msgparm = message.powerobjectparm
la_data = istr_msgparm.data

ldt_fecha = datetime(la_data[1])

lds_semana = CREATE n_ds
lds_semana.dataobject = 'd_consulta_1'
lds_semana.of_SetTransObject(gtr_sumuia)
lds_semana.of_SetParentWindow(this)
ll_resultado = lds_semana.retrieve(ldt_fecha)


string day_name
integer i,li_mes,li_dia,li_anio,lidia
datetime fecha_inicio,fecha_fin
Date fecha
string ClaveMat, lsDesc, lsNumSerie, lsstatus
integer liRow,liStatus
long llCtasol

for i = 1 to lds_semana.rowcount()
	llCtaSol     = lds_semana.object.spre_solicitud_solicitanteid[i]
	fecha_inicio = lds_semana.object.spre_solicitud_fecha_inicio[i]
	fecha_fin    = lds_semana.object.spre_solicitud_fecha_fin[i]
 	ClaveMat     = lds_semana.object.spre_sol_materiales_cvematerial[i]
	lsNumSerie   = lds_semana.object.spre_sol_materiales_num_serie[i]
	lsDesc       =	lds_semana.object.spre_materiales_descripcion[i]
	liStatus     = lds_semana.object.spre_solicitud_status[i]
	fecha = date(fecha_inicio)
	
	
	if isnull(lsNumSerie) then
		lsNumSerie = ' '
	end if
	
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
		lidia = 2
	elseif day_name = 'Tuesday' then
		lidia = 3
	elseif day_name = 'Wednesday' then
		lidia = 4
	elseif day_name = 'Thursday' then
		lidia = 5
	elseif day_name = 'Friday' then
		lidia = 6
	elseif day_name = 'Saturday' then
		lidia = 7
	elseif day_name = 'Sunday' then
		lidia = 1
	end if
	
	if liStatus = 0 then
		lsstatus = 'P.Activo'
	else 
		lsstatus = 'Reservación'
	end if
	
	lirow = dw_calendario.Insertrow(0)
	
	CHOOSE CASE lidia
		CASE 2

			dw_calendario.object.dia2[lirow] = lsDesc + "~r~n" + &
			string(llCtaSol) + "~r~n" + &
			string(fecha_inicio) + "~r~n" + & 
			string(fecha_fin) + "~r~n" + & 
			lsNumSerie + "~r~n" + & 
			lsstatus 

		CASE 3	
			dw_calendario.object.dia3[lirow] = lsDesc + "~r~n" + &
			string(llCtaSol) + "~r~n" + &
			string(fecha_inicio) + "~r~n" + & 
			string(fecha_fin) + "~r~n" + & 
			lsNumSerie + "~r~n" + & 
			lsstatus 

		CASE 4
			dw_calendario.object.dia4[lirow] = lsDesc + "~r~n" + &
			string(llCtaSol) + "~r~n" + &
			string(fecha_inicio) + "~r~n" + & 
			string(fecha_fin) + "~r~n" + & 
			lsNumSerie + "~r~n" + & 
			lsstatus 

		CASE 5
			dw_calendario.object.dia5[lirow] = lsDesc + "~r~n" + &
			string(llCtaSol) + "~r~n" + &
			string(fecha_inicio) + "~r~n" + & 
			string(fecha_fin) + "~r~n" + & 
			lsNumSerie + "~r~n" + & 
			lsstatus 

		CASE 6
			dw_calendario.object.dia6[lirow] = lsDesc + "~r~n" + &
			string(llCtaSol) + "~r~n" + &
			string(fecha_inicio) + "~r~n" + & 
			string(fecha_fin) + "~r~n" + & 
			lsNumSerie + "~r~n" + & 
			lsstatus 
		END CHOOSE
next

if ll_resultado > 0 then
	
	this.dw_calendario.accepttext()
	ldt_fecha_rango = f_fecha_semana(date(ldt_fecha))
	this.title = "Calendario Semanal del (" + string(ldt_fecha_rango[1],"dd/mm/yyyy") + " - " + &
		string(ldt_fecha_rango[2],"dd/mm/yyyy") + ") ::  Comunicación"
	is_subtitulo_fecha = "semana del " + string(ldt_fecha_rango[1],"dd/mm/yyyy") + &
		" al " + string(ldt_fecha_rango[2],"dd/mm/yyyy")
end if

Destroy lds_semana

messagebox("Información", "Registros recuperados: " + string(ll_resultado),information!)

end event

event ue_message();istr_msgparm = Message.PowerObjectParm

//this.event ue_setdata()
end event

event ue_recuperar_pormaterial(long ai_grupo, string as_mat);//		Muestra los materiariales y Espacios islas
//		en Prestamo o Reservados.

//		Consulta por Fecha y Material o Espacio.
//		Septiembre 2006

long ll_resultado
datetime ldt_fecha

date ldt_fecha_rango[]
n_ds lds_semana
any la_data[]

dw_calendario.reset()


//----------------------------------------------
// Paso de parámetros.									
//----------------------------------------------

istr_msgparm = message.powerobjectparm
la_data = istr_msgparm.data

ldt_fecha = datetime(la_data[1])

lds_semana = CREATE n_ds
lds_semana.dataobject = 'd_consulta_pormaterial'
lds_semana.of_SetTransObject(gtr_sumuia)
lds_semana.of_SetParentWindow(this)
ll_resultado = lds_semana.retrieve(ldt_fecha,ai_grupo,as_mat)


string day_name
integer i,li_mes,li_dia,li_anio,lidia
datetime fecha_inicio,fecha_fin
Date fecha
string ClaveMat, lsDesc, lsNumSerie, lsstatus
integer liRow,liStatus
long llCtasol

for i = 1 to lds_semana.rowcount()
	llCtaSol     = lds_semana.object.spre_solicitud_solicitanteid[i]
	fecha_inicio = lds_semana.object.spre_solicitud_fecha_inicio[i]
	fecha_fin    = lds_semana.object.spre_solicitud_fecha_fin[i]
 	ClaveMat     = lds_semana.object.spre_sol_materiales_cvematerial[i]
	lsNumSerie   = lds_semana.object.spre_sol_materiales_num_serie[i]
	lsDesc       =	lds_semana.object.spre_materiales_descripcion[i]
	liStatus     = lds_semana.object.spre_solicitud_status[i]
	fecha = date(fecha_inicio)
	
	if isnull(lsNumSerie) then
		lsNumSerie = ' '
	end if
	
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
		lidia = 2
	elseif day_name = 'Tuesday' then
		lidia = 3
	elseif day_name = 'Wednesday' then
		lidia = 4
	elseif day_name = 'Thursday' then
		lidia = 5
	elseif day_name = 'Friday' then
		lidia = 6
	elseif day_name = 'Saturday' then
		lidia = 7
	elseif day_name = 'Sunday' then
		lidia = 1
	end if
	
	if liStatus = 0 then
		lsstatus = 'P.Activo'
	else 
		lsstatus = 'Reservación'
	end if
	
	lirow = dw_calendario.Insertrow(0)
	
	CHOOSE CASE lidia
		CASE 2

			dw_calendario.object.dia2[lirow] = lsDesc + "~r~n" + &
			string(llCtaSol) + "~r~n" + &
			string(fecha_inicio) + "~r~n" + & 
			string(fecha_fin) + "~r~n" + & 
			lsNumSerie + "~r~n" + & 
			lsstatus 

		CASE 3	
			dw_calendario.object.dia3[lirow] = lsDesc + "~r~n" + &
			string(llCtaSol) + "~r~n" + &
			string(fecha_inicio) + "~r~n" + & 
			string(fecha_fin) + "~r~n" + & 
			lsNumSerie + "~r~n" + & 
			lsstatus 

		CASE 4
			dw_calendario.object.dia4[lirow] = lsDesc + "~r~n" + &
			string(llCtaSol) + "~r~n" + &
			string(fecha_inicio) + "~r~n" + & 
			string(fecha_fin) + "~r~n" + & 
			lsNumSerie + "~r~n" + & 
			lsstatus 

		CASE 5
			dw_calendario.object.dia5[lirow] = lsDesc + "~r~n" + &
			string(llCtaSol) + "~r~n" + &
			string(fecha_inicio) + "~r~n" + & 
			string(fecha_fin) + "~r~n" + & 
			lsNumSerie + "~r~n" + & 
			lsstatus 

		CASE 6
			dw_calendario.object.dia6[lirow] = lsDesc + "~r~n" + &
			string(llCtaSol) + "~r~n" + &
			string(fecha_inicio) + "~r~n" + & 
			string(fecha_fin) + "~r~n" + & 
			lsNumSerie + "~r~n" + & 
			lsstatus 
		END CHOOSE
next

if ll_resultado > 0 then
	
	this.dw_calendario.accepttext()
	ldt_fecha_rango = f_fecha_semana(date(ldt_fecha))
	this.title = "Calendario Semanal del (" + string(ldt_fecha_rango[1],"dd/mm/yyyy") + " - " + &
		string(ldt_fecha_rango[2],"dd/mm/yyyy") + ") ::  Comunicación"
	is_subtitulo_fecha = "semana del " + string(ldt_fecha_rango[1],"dd/mm/yyyy") + &
		" al " + string(ldt_fecha_rango[2],"dd/mm/yyyy")
end if

Destroy lds_semana

messagebox("Información", "Registros recuperados: " + string(ll_resultado),information!)

end event

event ue_salir();
//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	ue_salir
//
//	Arguments:
//	none
//
//	Returns:
//	none
//
//	Description:
//	Busca todas las ventas auxiliares y las cierra. Al final cierra también
//	esta ventana.
//
//////////////////////////////////////////////////////////////////////////////


ulong  lul_winhandle

	
lul_winhandle = inv_platformwin32.of_findwindow(is_wintitle[1])


lul_winhandle = inv_platformwin32.of_findwindow(is_wintitle[2])

If lul_winhandle > 0 Then
	close (iw_semana)
end If

lul_winhandle = inv_platformwin32.of_findwindow(is_wintitle[3])


close (this)
end event

event ue_imprimir();//		Impresión del calendario

long ll_rowid
n_ds lds_calendario
DataWindowChild dwc_contenido


ll_rowid = dw_calendario.rowcount()

if ll_rowid > 0 then
	lds_calendario = CREATE n_ds
	lds_calendario.DataObject = "d_rpt_calendario"
	lds_calendario.of_SetTransObject(gtr_sumuia)
	lds_calendario.of_SetParentWindow(this)
	lds_calendario.GetChild('dw_reporte', dwc_contenido)
	dwc_contenido.SetTransObject(gtr_sumuia)
	this.dw_calendario.RowsCopy(1,ll_rowid,Primary!,dwc_contenido,1,Primary!)
	lds_calendario.object.semana_t.text = is_subtitulo_fecha
	lds_calendario.print()
	destroy lds_calendario
end if
end event

on w_com_consulta.create
int iCurrent
call super::create
if this.MenuName = "m_calendario_pap" then this.MenuID = create m_calendario_pap
this.sle_date=create sle_date
this.cb_2=create cb_2
this.dw_calendario=create dw_calendario
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_date
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.dw_calendario
end on

on w_com_consulta.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_date)
destroy(this.cb_2)
destroy(this.dw_calendario)
end on

type sle_date from singlelineedit within w_com_consulta
boolean visible = false
integer x = 146
integer y = 2876
integer width = 192
integer height = 36
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

type cb_2 from commandbutton within w_com_consulta
integer x = 251
integer y = 2504
integer width = 311
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Salir"
end type

event clicked;close(parent)
end event

type dw_calendario from datawindow within w_com_consulta
integer x = 69
integer y = 60
integer width = 3680
integer height = 2356
integer taborder = 10
string title = "none"
string dataobject = "d_cm_consulta2"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(gtr_sumuia)
end event

