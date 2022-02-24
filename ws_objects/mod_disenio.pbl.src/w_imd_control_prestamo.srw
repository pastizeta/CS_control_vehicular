$PBExportHeader$w_imd_control_prestamo.srw
forward
global type w_imd_control_prestamo from window
end type
type st_hoy from statictext within w_imd_control_prestamo
end type
type mc_fecha from monthcalendar within w_imd_control_prestamo
end type
type em_fecha from editmask within w_imd_control_prestamo
end type
type dw_area from u_basedw within w_imd_control_prestamo
end type
type tab_control from tab within w_imd_control_prestamo
end type
type tabpage_almacen from userobject within tab_control
end type
type st_11 from statictext within tabpage_almacen
end type
type pb_salvar2 from picturebutton within tabpage_almacen
end type
type pb_salvar1 from picturebutton within tabpage_almacen
end type
type st_10 from statictext within tabpage_almacen
end type
type dw_prereservado_almacen from datawindow within tabpage_almacen
end type
type dw_reservado_almacen from datawindow within tabpage_almacen
end type
type cb_material_almacen from commandbutton within tabpage_almacen
end type
type ddlb_final_almacen from dropdownlistbox within tabpage_almacen
end type
type st_9 from statictext within tabpage_almacen
end type
type ddlb_inicio_almacen from dropdownlistbox within tabpage_almacen
end type
type st_8 from statictext within tabpage_almacen
end type
type tabpage_almacen from userobject within tab_control
st_11 st_11
pb_salvar2 pb_salvar2
pb_salvar1 pb_salvar1
st_10 st_10
dw_prereservado_almacen dw_prereservado_almacen
dw_reservado_almacen dw_reservado_almacen
cb_material_almacen cb_material_almacen
ddlb_final_almacen ddlb_final_almacen
st_9 st_9
ddlb_inicio_almacen ddlb_inicio_almacen
st_8 st_8
end type
type tabpage_foro from userobject within tab_control
end type
type pb_salvar6 from picturebutton within tabpage_foro
end type
type pb_salvar5 from picturebutton within tabpage_foro
end type
type pb_salvar4 from picturebutton within tabpage_foro
end type
type pb_salvar3 from picturebutton within tabpage_foro
end type
type st_7 from statictext within tabpage_foro
end type
type cb_material_foro from commandbutton within tabpage_foro
end type
type dw_reservado_foro from datawindow within tabpage_foro
end type
type dw_prereservado_foro from datawindow within tabpage_foro
end type
type st_6 from statictext within tabpage_foro
end type
type st_4 from statictext within tabpage_foro
end type
type cb_espera_foro from commandbutton within tabpage_foro
end type
type st_5 from statictext within tabpage_foro
end type
type ddlb_final_foro from dropdownlistbox within tabpage_foro
end type
type ddlb_inicio_foro from dropdownlistbox within tabpage_foro
end type
type dw_espera_foro from datawindow within tabpage_foro
end type
type dw_control_foro from datawindow within tabpage_foro
end type
type tabpage_foro from userobject within tab_control
pb_salvar6 pb_salvar6
pb_salvar5 pb_salvar5
pb_salvar4 pb_salvar4
pb_salvar3 pb_salvar3
st_7 st_7
cb_material_foro cb_material_foro
dw_reservado_foro dw_reservado_foro
dw_prereservado_foro dw_prereservado_foro
st_6 st_6
st_4 st_4
cb_espera_foro cb_espera_foro
st_5 st_5
ddlb_final_foro ddlb_final_foro
ddlb_inicio_foro ddlb_inicio_foro
dw_espera_foro dw_espera_foro
dw_control_foro dw_control_foro
end type
type tabpage_laboratorio from userobject within tab_control
end type
type pb_salvar7 from picturebutton within tabpage_laboratorio
end type
type pb_salvar9 from picturebutton within tabpage_laboratorio
end type
type pb_salvar8 from picturebutton within tabpage_laboratorio
end type
type st_3 from statictext within tabpage_laboratorio
end type
type ddlb_final_lab from dropdownlistbox within tabpage_laboratorio
end type
type ddlb_inicio_lab from dropdownlistbox within tabpage_laboratorio
end type
type st_2 from statictext within tabpage_laboratorio
end type
type st_1 from statictext within tabpage_laboratorio
end type
type cb_espera_lab from commandbutton within tabpage_laboratorio
end type
type dw_prereservado_lab from datawindow within tabpage_laboratorio
end type
type dw_control_laboratorio from datawindow within tabpage_laboratorio
end type
type dw_control_reservaciones from datawindow within tabpage_laboratorio
end type
type dw_espera_lab from datawindow within tabpage_laboratorio
end type
type tabpage_laboratorio from userobject within tab_control
pb_salvar7 pb_salvar7
pb_salvar9 pb_salvar9
pb_salvar8 pb_salvar8
st_3 st_3
ddlb_final_lab ddlb_final_lab
ddlb_inicio_lab ddlb_inicio_lab
st_2 st_2
st_1 st_1
cb_espera_lab cb_espera_lab
dw_prereservado_lab dw_prereservado_lab
dw_control_laboratorio dw_control_laboratorio
dw_control_reservaciones dw_control_reservaciones
dw_espera_lab dw_espera_lab
end type
type tab_control from tab within w_imd_control_prestamo
tabpage_almacen tabpage_almacen
tabpage_foro tabpage_foro
tabpage_laboratorio tabpage_laboratorio
end type
end forward

global type w_imd_control_prestamo from window
integer width = 4440
integer height = 2365
boolean titlebar = true
string title = "Control de Préstamo de Materiales"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
st_hoy st_hoy
mc_fecha mc_fecha
em_fecha em_fecha
dw_area dw_area
tab_control tab_control
end type
global w_imd_control_prestamo w_imd_control_prestamo

type variables
DatawindowChild idwc_area

integer ii_cvearea=1, ii_espacio=0
integer ii_periodo, ii_anio
string is_area_nom='', is_hora_inicio, is_hora_final
date id_fecha

string is_sort_re_foro="#10A", is_sort_re_alma="#10A"
string is_sort_pre_foro="#7A", is_sort_pre_alma="#7A", is_sort_pre_lab="#7A"
end variables

forward prototypes
public subroutine uf_cargar_laboratorio ()
public subroutine uf_columna_invisible ()
public function string uf_min_inventario ()
public function integer uf_min_lab ()
public subroutine uf_apaga_fecha ()
public subroutine uf_cargar_foro ()
public subroutine uf_cargar ()
public subroutine uf_desglose_laboratorio ()
public subroutine uf_desglose_foro ()
public subroutine uf_desglose_almacen ()
public subroutine uf_carga_almacen ()
public subroutine uf_selecciona_espacio (string ps_texto)
end prototypes

public subroutine uf_cargar_laboratorio ();integer li_jornada_inicio, li_jornada_fin, li_hora_jornada, li_i, li_row, li_k, li_hora_actual
string ls_cero_final, ls_cero_inicio, ls_num_serie, ls_find, ls_columna, ls_departamento=''
datetime ldt_fecha_inicio, ldt_fecha_final
integer li_hora_inicio, li_hora_final, li_duracion, li_hora, li_j, li_renglon, li_columna
integer li_res=0, li_orden, li_minlab
datastore lds_inventario, lds_reservados, lds_prereservados, lds_espera

tab_control.tabpage_laboratorio.dw_control_laboratorio.SetRedraw(false)
tab_control.tabpage_laboratorio.dw_control_reservaciones.SetRedraw(false)
tab_control.tabpage_laboratorio.dw_prereservado_lab.SetRedraw(false)
tab_control.tabpage_laboratorio.dw_espera_lab.SetRedraw(false)

tab_control.tabpage_almacen.enabled=false
tab_control.tabpage_foro.enabled=false
tab_control.tabpage_laboratorio.enabled=true
tab_control.tabpage_laboratorio.dw_control_laboratorio.Reset()
tab_control.tabpage_laboratorio.dw_control_reservaciones.Reset()
tab_control.tabpage_laboratorio.dw_prereservado_lab.Reset()
tab_control.tabpage_laboratorio.dw_espera_lab.Reset()

li_minlab=uf_min_lab()

ldt_fecha_inicio=datetime(id_fecha,time('00:00:00'))
ldt_fecha_final=datetime(id_fecha,time('23:59:59'))


li_jornada_inicio=7 
li_jornada_fin=22

li_hora_jornada=li_jornada_inicio

tab_control.tabpage_laboratorio.dw_control_laboratorio.insertrow(0)
tab_control.tabpage_laboratorio.dw_control_laboratorio.SetItem(1,1,"Horario")	

for li_i=2 to (li_jornada_fin - li_jornada_inicio +1)
	tab_control.tabpage_laboratorio.dw_control_laboratorio.insertrow(0)
	if li_hora_jornada<10 then ls_cero_inicio='0' else ls_cero_inicio=''
	if li_hora_jornada+1<10 then ls_cero_final='0' else ls_cero_final=''
	tab_control.tabpage_laboratorio.dw_control_laboratorio.SetItem(li_i, "hora",ls_cero_inicio+string(li_hora_jornada)+" - "+ls_cero_final+string(li_hora_jornada+1))	
	li_hora_jornada=li_hora_jornada+1
next

tab_control.tabpage_laboratorio.dw_control_laboratorio.insertrow(0)
tab_control.tabpage_laboratorio.dw_control_laboratorio.DeleteRow(tab_control.tabpage_laboratorio.dw_control_laboratorio.RowCount())


//Inventario
lds_inventario =  create datastore
lds_inventario.dataobject ='d_gen_cat_inventario'
lds_inventario.settransobject(gtr_sumuia)	

lds_inventario.Retrieve(gi_depto,ii_cvearea,1,'1')
lds_inventario.SetFilter("stauts in (1,2)")
lds_inventario.Filter()
li_row = lds_inventario.Rowcount()

for li_i=1 to li_row 
	tab_control.tabpage_laboratorio.dw_control_laboratorio.SetItem(1, li_i+1,lds_inventario.GetItemString(li_i,"num_serie"))	
next


//PreReservados PC
lds_prereservados =  create datastore
lds_prereservados.dataobject ='d_gen_mat_prereservados_fecha'
lds_prereservados.settransobject(gtr_sumuia)	
lds_prereservados.Retrieve(gi_depto,ii_cvearea,ldt_fecha_inicio,ldt_fecha_final)
lds_prereservados.SetFilter("spre_pre_sol_materiales_cvegrupo=1 and spre_pre_sol_materiales_cvematerial='1'")
lds_prereservados.Filter()
li_row = lds_prereservados.Rowcount()
li_res=0

for li_i=1 to li_row

	ls_num_serie=lds_prereservados.GetItemString(li_i,'spre_pre_sol_materiales_num_serie')
	li_hora_inicio=hour(time(lds_prereservados.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio')))
	li_hora_final=hour(time(lds_prereservados.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin')))
	li_duracion=li_hora_final - li_hora_inicio
	li_hora=li_hora_inicio

	for li_k=1 to 50
		ls_columna=tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,li_k)
		if ls_columna=ls_num_serie then 
			li_columna=li_k
			li_k=50
		end if
	next
	
	if li_columna>0 then
	
		for li_j=1 to li_duracion
			
			if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
			if li_hora+1<10 then ls_cero_final='0' else ls_cero_final=''
			li_renglon=tab_control.tabpage_laboratorio.dw_control_laboratorio.Find("hora='"+ls_cero_inicio+string(li_hora)+" - "+ls_cero_final+string(li_hora+1)+"'",1,tab_control.tabpage_laboratorio.dw_control_laboratorio.rowcount())
			if lds_prereservados.GetItemNumber(li_i,'spre_pre_solicitud_autorizada')>0 then tab_control.tabpage_laboratorio.dw_control_laboratorio.SetItem(li_renglon, li_columna,'1')	
			li_hora=li_hora+1
	
			//Tabla de control
			li_res=li_res+1
			tab_control.tabpage_laboratorio.dw_control_reservaciones.insertrow(0)
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'folio',-1)
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'folio_presol',lds_prereservados.GetItemNumber(li_i,'spre_pre_sol_materiales_folio'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'cvedepto',lds_prereservados.GetItemNumber(li_i,'spre_pre_sol_materiales_cvedepto'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'cvearea',lds_prereservados.GetItemNumber(li_i,'spre_pre_sol_materiales_cvearea'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'cvegrupo',lds_prereservados.GetItemNumber(li_i,'spre_pre_sol_materiales_cvegrupo'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'cvematerial',lds_prereservados.GetItemString(li_i,'spre_pre_sol_materiales_cvematerial'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'num_serie',lds_prereservados.GetItemString(li_i,'spre_pre_sol_materiales_num_serie'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'fecha_inicio',lds_prereservados.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'fecha_final',lds_prereservados.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'tipo_prestamo',lds_prereservados.GetItemNumber(li_i,'spre_pre_solicitud_tipo_prestamo'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'solicitantenombre',lds_prereservados.GetItemString(li_i,'spre_pre_solicitud_solicitantenombre'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'solicitanteid',lds_prereservados.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'))		
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'nom_prestamo',lds_prereservados.GetItemString(li_i,'spre_tipo_usuario_nom_tipo_usuario'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'status_sol',-1)
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'status_presol',0)
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'nom_status_presol','Pendiente')
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'autorizada_presol',lds_prereservados.GetItemNumber(li_i,'spre_pre_solicitud_autorizada'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'columna',li_columna)
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'renglon',li_renglon)

		next	

	end if

next


//Reservados PC
lds_reservados =  create datastore
lds_reservados.dataobject ='d_gen_mat_reservados_fecha'
lds_reservados.settransobject(gtr_sumuia)	

lds_reservados.Retrieve(gi_depto,ii_cvearea,ldt_fecha_inicio,ldt_fecha_final)
lds_reservados.SetFilter("spre_sol_materiales_cvegrupo=1 and spre_sol_materiales_cvematerial='1'")
lds_reservados.Filter()
li_row = lds_reservados.Rowcount()

for li_i=1 to li_row
	
	ls_num_serie=lds_reservados.GetItemString(li_i,'spre_sol_materiales_num_serie')
	li_hora_inicio=hour(time(lds_reservados.GetItemDateTime(li_i,'spre_solicitud_fecha_inicio')))
	li_hora_final=hour(time(lds_reservados.GetItemDateTime(li_i,'spre_solicitud_fecha_fin')))

	for li_k=1 to 50
		ls_columna=tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,li_k)
		if ls_columna=ls_num_serie then 
			li_columna=li_k
			li_k=50
		end if
	next
	
	if li_columna>0 then
		
		//No han entregado a tiempo
		li_hora_actual=hour(now())
		
		if li_hora_final<=li_hora_actual and id_fecha=today() then
			li_duracion=li_hora_actual - li_hora_final+1
			li_hora=li_hora_final

			for li_j=1 to li_duracion
				if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
				if li_hora+1<10 then ls_cero_final='0' else ls_cero_final=''
				li_renglon=tab_control.tabpage_laboratorio.dw_control_laboratorio.Find("hora='"+ls_cero_inicio+string(li_hora)+" - "+ls_cero_final+string(li_hora+1)+"'",1,tab_control.tabpage_laboratorio.dw_control_laboratorio.rowcount())
				tab_control.tabpage_laboratorio.dw_control_laboratorio.SetItem(li_renglon, li_columna,'3')	
				li_hora=li_hora+1
			next				
		end if
		
		//Reservados
		li_duracion=li_hora_final - li_hora_inicio
		li_hora=li_hora_inicio
		
		for li_j=1 to li_duracion
			
			if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
			if li_hora+1<10 then ls_cero_final='0' else ls_cero_final=''
			li_renglon=tab_control.tabpage_laboratorio.dw_control_laboratorio.Find("hora='"+ls_cero_inicio+string(li_hora)+" - "+ls_cero_final+string(li_hora+1)+"'",1,tab_control.tabpage_laboratorio.dw_control_laboratorio.rowcount())
			li_hora=li_hora+1

			//Tabla de control
			li_res=li_res+1
			tab_control.tabpage_laboratorio.dw_control_reservaciones.insertrow(0)
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'folio',lds_reservados.GetItemNumber(li_i,'spre_sol_materiales_folio'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'folio_presol',lds_reservados.GetItemNumber(li_i,'spre_pre_solicitud_folio_presol'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'cvedepto',lds_reservados.GetItemNumber(li_i,'spre_sol_materiales_cvedepto'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'cvearea',lds_reservados.GetItemNumber(li_i,'spre_sol_materiales_cvearea'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'cvegrupo',lds_reservados.GetItemNumber(li_i,'spre_sol_materiales_cvegrupo'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'cvematerial',lds_reservados.GetItemString(li_i,'spre_sol_materiales_cvematerial'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'num_serie',lds_reservados.GetItemString(li_i,'spre_sol_materiales_num_serie'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'fecha_inicio',lds_reservados.GetItemDateTime(li_i,'spre_solicitud_fecha_inicio'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'fecha_final',lds_reservados.GetItemDateTime(li_i,'spre_solicitud_fecha_fin'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'tipo_prestamo',lds_reservados.GetItemNumber(li_i,'spre_prestamo_material_tipo_prestamo'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'solicitantenombre',lds_reservados.GetItemString(li_i,'spre_prestamo_material_solicitantenombre'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'solicitanteid',lds_reservados.GetItemNumber(li_i,'spre_solicitud_solicitanteid'))		
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'nom_prestamo',lds_reservados.GetItemString(li_i,'spre_tipo_usuario_nom_tipo_usuario'))
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'status_sol',lds_reservados.GetItemNumber(li_i,'spre_sol_materiales_status'))		
			
			choose case lds_reservados.GetItemNumber(li_i,'spre_sol_materiales_status')
				case 0
					tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'nom_status_sol','Prestada')
				case 1
					tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'nom_status_sol','Entregada')
				case 2
					tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'nom_status_sol','No Entregada')
				case 3
					tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'nom_status_sol','Multa')
			end choose
			
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'columna',li_columna)
			tab_control.tabpage_laboratorio.dw_control_reservaciones.SetItem(li_res,'renglon',li_renglon)
			
			if id_fecha>=today() then tab_control.tabpage_laboratorio.dw_control_laboratorio.SetItem(li_renglon, li_columna,'2') &
			else tab_control.tabpage_laboratorio.dw_control_laboratorio.SetItem(li_renglon, li_columna,'3')
			
		next	

	end if
	
next

uf_columna_invisible()


//Prereservados Todos
lds_prereservados.SetFilter("")
lds_prereservados.Filter()
li_row = lds_prereservados.Rowcount()

li_res=0

for li_i=1 to li_row

	li_res=li_res+1
	tab_control.tabpage_laboratorio.dw_prereservado_lab.insertrow(0)
	tab_control.tabpage_laboratorio.dw_prereservado_lab.SetItem(li_res,'folio',lds_prereservados.GetItemNumber(li_i,'spre_pre_sol_materiales_folio'))
	tab_control.tabpage_laboratorio.dw_prereservado_lab.SetItem(li_res,'cvearea',lds_prereservados.GetItemNumber(li_i,'spre_pre_sol_materiales_cvearea'))
	tab_control.tabpage_laboratorio.dw_prereservado_lab.SetItem(li_res,'solicitanteid',lds_prereservados.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'))		
	tab_control.tabpage_laboratorio.dw_prereservado_lab.SetItem(li_res,'nom_prestamo',lds_prereservados.GetItemString(li_i,'spre_tipo_usuario_nom_tipo_usuario'))
	tab_control.tabpage_laboratorio.dw_prereservado_lab.SetItem(li_res,'solicitantenombre',lds_prereservados.GetItemString(li_i,'spre_pre_solicitud_solicitantenombre'))
	tab_control.tabpage_laboratorio.dw_prereservado_lab.SetItem(li_res,'tipo_prestamo',lds_prereservados.GetItemNumber(li_i,'spre_pre_solicitud_tipo_prestamo'))
	tab_control.tabpage_laboratorio.dw_prereservado_lab.SetItem(li_res,'fecha_inicio',lds_prereservados.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio'))
	tab_control.tabpage_laboratorio.dw_prereservado_lab.SetItem(li_res,'fecha_final',lds_prereservados.GetItemDatetime(li_i,'spre_pre_solicitud_fecha_fin'))

next

tab_control.tabpage_laboratorio.dw_prereservado_lab.SetSort(is_sort_pre_lab)
tab_control.tabpage_laboratorio.dw_prereservado_lab.Sort()

//Lista de espera
lds_espera =  create datastore
lds_espera.dataobject ='d_gen_presolicitados_espera'
lds_espera.settransobject(gtr_sumuia)

lds_espera.Retrieve(gi_depto,li_minlab,ldt_fecha_inicio,ldt_fecha_final)
li_row = lds_espera.Rowcount()
li_res=0

for li_i=1 to li_row
	
	li_hora_inicio=hour(time(lds_espera.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio')))
	li_hora_final=hour(time(lds_espera.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin')))
	li_duracion=li_hora_final - li_hora_inicio
	li_hora=li_hora_inicio
	
	for li_j=1 to li_duracion
		
		if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
		
		li_res=li_res+1
		tab_control.tabpage_laboratorio.dw_espera_lab.insertrow(0)
		tab_control.tabpage_laboratorio.dw_espera_lab.SetItem(li_res,'folio',lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_folio'))
		tab_control.tabpage_laboratorio.dw_espera_lab.SetItem(li_res,'solicitanteid',lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'))		
		tab_control.tabpage_laboratorio.dw_espera_lab.SetItem(li_res,'nom_prestamo',lds_espera.GetItemString(li_i,'spre_tipo_usuario_tipo_usuario'))
		tab_control.tabpage_laboratorio.dw_espera_lab.SetItem(li_res,'solicitantenombre',lds_espera.GetItemString(li_i,'spre_pre_solicitud_solicitantenombre'))
		tab_control.tabpage_laboratorio.dw_espera_lab.SetItem(li_res,'fecha_registro',lds_espera.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_solicitud'))
		tab_control.tabpage_laboratorio.dw_espera_lab.SetItem(li_res,'fecha_inicio',lds_espera.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio'))
		tab_control.tabpage_laboratorio.dw_espera_lab.SetItem(li_res,'fecha_final',lds_espera.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin'))
		tab_control.tabpage_laboratorio.dw_espera_lab.SetItem(li_res,'hora_inicio',ls_cero_inicio+string(li_hora)+':00')
		choose case lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_tipo_prestamo')
		case 1
			ls_departamento=f_select_departamento_alumno(lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'), ii_anio,ii_periodo)
		case 2
			ls_departamento=f_select_departamento_intercambio(lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'), ii_anio,ii_periodo)
		case 3
			ls_departamento=f_select_departamento_profesor(lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'), ii_anio,ii_periodo)
		case else
			ls_departamento=''
		end choose
		if Pos(ls_departamento, "DISEÑO")>0 then li_orden=0 else li_orden=1
		tab_control.tabpage_laboratorio.dw_espera_lab.SetItem(li_res,'departamento',ls_departamento)
		tab_control.tabpage_laboratorio.dw_espera_lab.SetItem(li_res,'ordena',li_orden)
		li_hora=li_hora+1

	next	

next

uf_desglose_laboratorio()

tab_control.tabpage_laboratorio.dw_control_laboratorio.SetRedraw(true)
tab_control.tabpage_laboratorio.dw_control_reservaciones.SetRedraw(true)
tab_control.tabpage_laboratorio.dw_prereservado_lab.SetRedraw(true)
tab_control.tabpage_laboratorio.dw_espera_lab.SetRedraw(true)
end subroutine

public subroutine uf_columna_invisible ();
choose case ii_espacio
	case 2
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc1')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc1.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc2')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc2.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc3')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc3.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc4')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc4.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc5')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc5.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc6')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc6.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc7')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc7.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc8')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc8.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc9')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc9.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc10')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc10.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc11')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc11.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc12')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc12.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc13')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc13.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc14')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc14.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc15')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc15.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc16')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc16.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc17')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc17.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc18')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc18.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc19')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc19.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc20')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc20.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc21')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc21.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc22')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc22.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc23')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc23.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc24')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc24.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc25')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc25.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc26')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc26.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc27')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc27.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc28')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc28.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc29')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc29.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc30')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc30.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc31')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc31.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc32')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc32.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc33')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc33.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc34')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc34.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc35')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc35.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc36')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc36.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc37')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc37.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc38')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc38.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc39')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc39.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc40')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc40.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc41')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc41.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc42')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc42.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc43')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc43.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc44')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc44.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc45')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc45.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc46')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc46.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc47')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc47.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc48')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc48.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc49')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc49.visible=false
		if isnull(tab_control.tabpage_laboratorio.dw_control_laboratorio.GetItemString(1,'pc50')) then tab_control.tabpage_laboratorio.dw_control_laboratorio.object.pc50.visible=false

end choose


end subroutine

public function string uf_min_inventario ();string ls_num_serie
select min(num_serie)
into :ls_num_serie
from spre_inventario
where cvedepto=:gi_depto
and cvearea=:ii_cvearea
and cvegrupo=1
and cvematerial='1'
using gtr_sumuia; 


if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Buscar material", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
else
	commit using gtr_sumuia;
end if

return(ls_num_serie)

end function

public function integer uf_min_lab ();integer li_area

select min(cvearea)
into :li_area
from spre_areas
where cvedepto=:gi_depto
and tipo_espacio=2
using gtr_sumuia; 


if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Buscar área", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
else
	commit using gtr_sumuia;
end if

return(li_area)

end function

public subroutine uf_apaga_fecha ();mc_fecha.visible=false
end subroutine

public subroutine uf_cargar_foro ();integer li_jornada_inicio, li_jornada_fin, li_hora_jornada=1, li_i, li_row, li_hora_actual
string ls_cero_final, ls_cero_inicio, ls_departamento=''
datetime ldt_fecha_inicio, ldt_fecha_final
integer li_hora_inicio, li_hora_final, li_duracion, li_hora, li_j, li_renglon
integer li_res=0, li_orden
datastore lds_reservados_foro, lds_prereservados_foro, lds_espacio, lds_espera

tab_control.tabpage_foro.dw_control_foro.SetRedraw(false)
tab_control.tabpage_foro.dw_espera_foro.SetRedraw(false)
tab_control.tabpage_foro.dw_prereservado_foro.SetRedraw(false)
tab_control.tabpage_foro.dw_reservado_foro.SetRedraw(false)

tab_control.tabpage_almacen.enabled=false
tab_control.tabpage_foro.enabled=true
tab_control.tabpage_laboratorio.enabled=false
tab_control.tabpage_foro.dw_control_foro.Reset()
tab_control.tabpage_foro.dw_espera_foro.Reset()
tab_control.tabpage_foro.dw_prereservado_foro.Reset()
tab_control.tabpage_foro.dw_reservado_foro.Reset()


ldt_fecha_inicio=datetime(id_fecha,time('00:00:00'))
ldt_fecha_final=datetime(id_fecha,time('23:59:59'))

li_jornada_inicio=7 
li_jornada_fin=22

li_hora_jornada=li_jornada_inicio


for li_i=1 to (li_jornada_fin - li_jornada_inicio)
	tab_control.tabpage_foro.dw_control_foro.insertrow(0)
	if li_hora_jornada<10 then ls_cero_inicio='0' else ls_cero_inicio=''
	if li_hora_jornada+1<10 then ls_cero_final='0' else ls_cero_final=''
	tab_control.tabpage_foro.dw_control_foro.SetItem(li_i, "hora",ls_cero_inicio+string(li_hora_jornada)+" - "+ls_cero_final+string(li_hora_jornada+1))	
	li_hora_jornada=li_hora_jornada+1
next

tab_control.tabpage_foro.dw_control_foro.insertrow(0)
tab_control.tabpage_foro.dw_control_foro.DeleteRow(tab_control.tabpage_foro.dw_control_foro.RowCount())


//PreReservados FORO
lds_prereservados_foro =  create datastore
lds_prereservados_foro.dataobject ='d_gen_mat_prereservados_fecha'
lds_prereservados_foro.settransobject(gtr_sumuia)	

lds_prereservados_foro.Retrieve(gi_depto,ii_cvearea,ldt_fecha_inicio,ldt_fecha_final)
lds_prereservados_foro.SetFilter("spre_pre_sol_materiales_cvegrupo=1 and spre_pre_sol_materiales_cvematerial='1' and spre_pre_sol_materiales_num_serie='1'")
lds_prereservados_foro.Filter()
li_row = lds_prereservados_foro.Rowcount()

for li_i=1 to li_row
	
	if Date(lds_prereservados_foro.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio'))=id_fecha then
		li_hora_inicio=hour(time(lds_prereservados_foro.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio')))
	else
		li_hora_inicio=7
	end if
	
	if Date(lds_prereservados_foro.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin'))=id_fecha then
		li_hora_final=hour(time(lds_prereservados_foro.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin')))
	else
		li_hora_final=22
	end if
	
	li_duracion=li_hora_final - li_hora_inicio
	li_hora=li_hora_inicio
	
	for li_j=1 to li_duracion
	
		if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
		if li_hora+1<10 then ls_cero_final='0' else ls_cero_final=''
		li_renglon=tab_control.tabpage_foro.dw_control_foro.Find("hora='"+ls_cero_inicio+string(li_hora)+" - "+ls_cero_final+string(li_hora+1)+"'",1,tab_control.tabpage_foro.dw_control_foro.rowcount())
		li_hora=li_hora+1

		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'folio',-1)
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'folio_presol',lds_prereservados_foro.GetItemNumber(li_i,'spre_pre_sol_materiales_folio'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvedepto',lds_prereservados_foro.GetItemNumber(li_i,'spre_pre_sol_materiales_cvedepto'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvearea',lds_prereservados_foro.GetItemNumber(li_i,'spre_pre_sol_materiales_cvearea'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvegrupo',lds_prereservados_foro.GetItemNumber(li_i,'spre_pre_sol_materiales_cvegrupo'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvematerial',lds_prereservados_foro.GetItemString(li_i,'spre_pre_sol_materiales_cvematerial'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'num_serie',lds_prereservados_foro.GetItemString(li_i,'spre_pre_sol_materiales_num_serie'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'fecha_inicio',lds_prereservados_foro.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'fecha_final',lds_prereservados_foro.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'tipo_prestamo',lds_prereservados_foro.GetItemNumber(li_i,'spre_pre_solicitud_tipo_prestamo'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'solicitantenombre',lds_prereservados_foro.GetItemString(li_i,'spre_pre_solicitud_solicitantenombre'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'solicitanteid',lds_prereservados_foro.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'))		
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_prestamo',lds_prereservados_foro.GetItemString(li_i,'spre_tipo_usuario_nom_tipo_usuario'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'status_sol',-1)
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'status_presol',0)
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_status_presol','Pendiente')
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'autorizada_presol',lds_prereservados_foro.GetItemNumber(li_i,'spre_pre_solicitud_autorizada'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'color',1)

	next	

next


//Reservados FORO
lds_reservados_foro =  create datastore
lds_reservados_foro.dataobject ='d_gen_mat_reservados_fecha'
lds_reservados_foro.settransobject(gtr_sumuia)	

lds_reservados_foro.Retrieve(gi_depto,ii_cvearea,ldt_fecha_inicio,ldt_fecha_final)
lds_reservados_foro.SetFilter("spre_sol_materiales_cvegrupo=1 and spre_sol_materiales_cvematerial='1' and spre_sol_materiales_num_serie='1'")
lds_reservados_foro.Filter()
li_row = lds_reservados_foro.Rowcount()

for li_i=1 to li_row

	if Date(lds_reservados_foro.GetItemDateTime(li_i,'spre_solicitud_fecha_inicio'))=id_fecha then
		li_hora_inicio=hour(time(lds_reservados_foro.GetItemDateTime(li_i,'spre_solicitud_fecha_inicio')))
	else
		li_hora_inicio=7
	end if	
	
	if Date(lds_reservados_foro.GetItemDateTime(li_i,'spre_solicitud_fecha_fin'))=id_fecha then
		li_hora_final=hour(time(lds_reservados_foro.GetItemDateTime(li_i,'spre_solicitud_fecha_fin')))
	else
		li_hora_final=22
	end if
	
	
	//Reservados
	li_duracion=li_hora_final - li_hora_inicio
	li_hora=li_hora_inicio
	
	for li_j=1 to li_duracion
		
		if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
		if li_hora+1<10 then ls_cero_final='0' else ls_cero_final=''
		li_renglon=tab_control.tabpage_foro.dw_control_foro.Find("hora='"+ls_cero_inicio+string(li_hora)+" - "+ls_cero_final+string(li_hora+1)+"'",1,tab_control.tabpage_foro.dw_control_foro.rowcount())
		li_hora=li_hora+1

		//Tabla de control
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'folio',lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_folio'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'folio_presol',lds_reservados_foro.GetItemNumber(li_i,'spre_pre_solicitud_folio_presol'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvedepto',lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_cvedepto'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvearea',lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_cvearea'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvegrupo',lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_cvegrupo'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvematerial',lds_reservados_foro.GetItemString(li_i,'spre_sol_materiales_cvematerial'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'num_serie',lds_reservados_foro.GetItemString(li_i,'spre_sol_materiales_num_serie'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'fecha_inicio',lds_reservados_foro.GetItemDateTime(li_i,'spre_solicitud_fecha_inicio'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'fecha_final',lds_reservados_foro.GetItemDateTime(li_i,'spre_solicitud_fecha_fin'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'tipo_prestamo',lds_reservados_foro.GetItemNumber(li_i,'spre_prestamo_material_tipo_prestamo'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'solicitantenombre',lds_reservados_foro.GetItemString(li_i,'spre_prestamo_material_solicitantenombre'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'solicitanteid',lds_reservados_foro.GetItemNumber(li_i,'spre_solicitud_solicitanteid'))		
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_prestamo',lds_reservados_foro.GetItemString(li_i,'spre_tipo_usuario_nom_tipo_usuario'))
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'status_sol',lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_status'))		
		tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'color',2) 
		
		choose case lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_status')
			case 0
				tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_status_sol','Prestada')
			case 1
				tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_status_sol','Entregada')
			case 2
				tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_status_sol','No Entregada')
			case 3
				tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_status_sol','Multa')
		end choose

	next	

	//No han entregado a tiempo
	li_hora_actual=hour(now())
	
	if li_hora_final<=li_hora_actual and id_fecha=today() then

		li_duracion=li_hora_actual - li_hora_final+1
		li_hora=li_hora_final

		for li_j=1 to li_duracion
			if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
			if li_hora+1<10 then ls_cero_final='0' else ls_cero_final=''
			li_renglon=tab_control.tabpage_foro.dw_control_foro.Find("hora='"+ls_cero_inicio+string(li_hora)+" - "+ls_cero_final+string(li_hora+1)+"'",1,tab_control.tabpage_foro.dw_control_foro.rowcount())
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'color',3)
			
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'folio',lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_folio'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'folio_presol',lds_reservados_foro.GetItemNumber(li_i,'spre_pre_solicitud_folio_presol'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvedepto',lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_cvedepto'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvearea',lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_cvearea'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvegrupo',lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_cvegrupo'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'cvematerial',lds_reservados_foro.GetItemString(li_i,'spre_sol_materiales_cvematerial'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'num_serie',lds_reservados_foro.GetItemString(li_i,'spre_sol_materiales_num_serie'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'fecha_inicio',lds_reservados_foro.GetItemDateTime(li_i,'spre_solicitud_fecha_inicio'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'fecha_final',lds_reservados_foro.GetItemDateTime(li_i,'spre_solicitud_fecha_fin'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'tipo_prestamo',lds_reservados_foro.GetItemNumber(li_i,'spre_prestamo_material_tipo_prestamo'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'solicitantenombre',lds_reservados_foro.GetItemString(li_i,'spre_prestamo_material_solicitantenombre'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'solicitanteid',lds_reservados_foro.GetItemNumber(li_i,'spre_solicitud_solicitanteid'))		
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_prestamo',lds_reservados_foro.GetItemString(li_i,'spre_tipo_usuario_nom_tipo_usuario'))
			tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'status_sol',lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_status'))		
			
			choose case lds_reservados_foro.GetItemNumber(li_i,'spre_sol_materiales_status')
				case 0
					tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_status_sol','Prestada')
				case 1
					tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_status_sol','Entregada')
				case 2
					tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_status_sol','No Entregada')
				case 3
					tab_control.tabpage_foro.dw_control_foro.SetItem(li_renglon,'nom_status_sol','Multa')
			end choose			
			
			li_hora=li_hora+1
			
		next	

	end if

next


//Prereservados Día
lds_prereservados_foro.SetFilter("")
lds_prereservados_foro.Filter()
li_row = lds_prereservados_foro.Rowcount()

li_res=0

for li_i=1 to li_row
		
	li_res=li_res+1
	tab_control.tabpage_foro.dw_prereservado_foro.insertrow(0)
	tab_control.tabpage_foro.dw_prereservado_foro.SetItem(li_res,'folio',lds_prereservados_foro.GetItemNumber(li_i,'spre_pre_sol_materiales_folio'))
	tab_control.tabpage_foro.dw_prereservado_foro.SetItem(li_res,'cvearea',lds_prereservados_foro.GetItemNumber(li_i,'spre_pre_sol_materiales_cvearea'))
	tab_control.tabpage_foro.dw_prereservado_foro.SetItem(li_res,'solicitanteid',lds_prereservados_foro.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'))		
	tab_control.tabpage_foro.dw_prereservado_foro.SetItem(li_res,'nom_prestamo',lds_prereservados_foro.GetItemString(li_i,'spre_tipo_usuario_nom_tipo_usuario'))
	tab_control.tabpage_foro.dw_prereservado_foro.SetItem(li_res,'solicitantenombre',lds_prereservados_foro.GetItemString(li_i,'spre_pre_solicitud_solicitantenombre'))
	tab_control.tabpage_foro.dw_prereservado_foro.SetItem(li_res,'tipo_prestamo',lds_prereservados_foro.GetItemNumber(li_i,'spre_pre_solicitud_tipo_prestamo'))
	tab_control.tabpage_foro.dw_prereservado_foro.SetItem(li_res,'fecha_inicio',lds_prereservados_foro.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio'))
	tab_control.tabpage_foro.dw_prereservado_foro.SetItem(li_res,'fecha_final',lds_prereservados_foro.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin'))

next

tab_control.tabpage_foro.dw_prereservado_foro.SetSort(is_sort_pre_foro)
tab_control.tabpage_foro.dw_prereservado_foro.Sort()


//Reservados Todos
lds_espacio =  create datastore
lds_espacio.dataobject ='d_gen_sol_reservados'
lds_espacio.settransobject(gtr_sumuia)	
lds_espacio.Retrieve(gi_depto,ii_cvearea)
li_row = lds_espacio.Rowcount()

li_res=0

for li_i=1 to li_row

	li_res=li_res+1
	tab_control.tabpage_foro.dw_reservado_foro.insertrow(0)
	tab_control.tabpage_foro.dw_reservado_foro.SetItem(li_i,'folio',lds_espacio.GetItemNumber(li_i,'spre_sol_materiales_folio'))
	tab_control.tabpage_foro.dw_reservado_foro.SetItem(li_i,'cvearea',lds_espacio.GetItemNumber(li_i,'spre_sol_materiales_cvearea'))
	tab_control.tabpage_foro.dw_reservado_foro.SetItem(li_i,'solicitanteid',lds_espacio.GetItemNumber(li_i,'spre_solicitud_solicitanteid'))		
	tab_control.tabpage_foro.dw_reservado_foro.SetItem(li_i,'nom_prestamo',lds_espacio.GetItemString(li_i,'spre_tipo_usuario_nom_tipo_usuario'))
	tab_control.tabpage_foro.dw_reservado_foro.SetItem(li_i,'solicitantenombre',lds_espacio.GetItemString(li_i,'spre_prestamo_material_solicitantenombre'))
	tab_control.tabpage_foro.dw_reservado_foro.SetItem(li_i,'tipo_prestamo',lds_espacio.GetItemNumber(li_i,'spre_prestamo_material_tipo_prestamo'))
	tab_control.tabpage_foro.dw_reservado_foro.SetItem(li_i,'fecha_inicio',lds_espacio.GetItemDateTime(li_i,'spre_solicitud_fecha_inicio'))
	tab_control.tabpage_foro.dw_reservado_foro.SetItem(li_i,'fecha_final',lds_espacio.GetItemDateTime(li_i,'spre_solicitud_fecha_fin'))
	tab_control.tabpage_foro.dw_reservado_foro.SetItem(li_i,'folio_presol',lds_espacio.GetItemNumber(li_i,'spre_pre_solicitud_folio_presol'))
	if lds_espacio.GetItemDateTime(li_i,'spre_solicitud_fecha_fin')< DateTime(today(),now()) then tab_control.tabpage_foro.dw_reservado_foro.SetItem(li_i,'color',3)

next

tab_control.tabpage_foro.dw_reservado_foro.SetSort(is_sort_re_foro)
tab_control.tabpage_foro.dw_reservado_foro.Sort()

//Lista de espera
lds_espera =  create datastore
lds_espera.dataobject ='d_gen_presolicitados_espera'
lds_espera.settransobject(gtr_sumuia)

lds_espera.Retrieve(gi_depto,ii_cvearea,ldt_fecha_inicio,ldt_fecha_final)

li_row = lds_espera.Rowcount()

li_res=0

for li_i=1 to li_row
	
	li_hora_inicio=hour(time(lds_espera.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio')))
	li_hora_final=hour(time(lds_espera.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin')))
	li_duracion=li_hora_final - li_hora_inicio
	li_hora=li_hora_inicio
	
	for li_j=1 to li_duracion
		
		if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
		
		li_res=li_res+1
		tab_control.tabpage_foro.dw_espera_foro.insertrow(0)
		tab_control.tabpage_foro.dw_espera_foro.SetItem(li_res,'folio',lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_folio'))
		tab_control.tabpage_foro.dw_espera_foro.SetItem(li_res,'solicitanteid',lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'))		
		tab_control.tabpage_foro.dw_espera_foro.SetItem(li_res,'nom_prestamo',lds_espera.GetItemString(li_i,'spre_tipo_usuario_tipo_usuario'))
		tab_control.tabpage_foro.dw_espera_foro.SetItem(li_res,'solicitantenombre',lds_espera.GetItemString(li_i,'spre_pre_solicitud_solicitantenombre'))
		tab_control.tabpage_foro.dw_espera_foro.SetItem(li_res,'fecha_registro',lds_espera.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_solicitud'))
		tab_control.tabpage_foro.dw_espera_foro.SetItem(li_res,'fecha_inicio',lds_espera.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio'))
		tab_control.tabpage_foro.dw_espera_foro.SetItem(li_res,'fecha_final',lds_espera.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin'))
		tab_control.tabpage_foro.dw_espera_foro.SetItem(li_res,'hora_inicio',ls_cero_inicio+string(li_hora)+':00')
		choose case lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_tipo_prestamo')
		case 1
			ls_departamento=f_select_departamento_alumno(lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'), ii_anio,ii_periodo)
		case 2
			ls_departamento=f_select_departamento_intercambio(lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'), ii_anio,ii_periodo)
		case 3
			ls_departamento=f_select_departamento_profesor(lds_espera.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'), ii_anio,ii_periodo)
		case else
			ls_departamento=''
		end choose
		if Pos(ls_departamento, "DISEÑO")>0 then li_orden=0 else li_orden=1
		tab_control.tabpage_foro.dw_espera_foro.SetItem(li_res,'departamento',ls_departamento)
		tab_control.tabpage_foro.dw_espera_foro.SetItem(li_res,'ordena',li_orden)
		li_hora=li_hora+1

	next	

next

uf_desglose_foro()

tab_control.tabpage_foro.dw_control_foro.SetRedraw(true)
tab_control.tabpage_foro.dw_espera_foro.SetRedraw(true)
tab_control.tabpage_foro.dw_prereservado_foro.SetRedraw(true)
tab_control.tabpage_foro.dw_reservado_foro.SetRedraw(true)
end subroutine

public subroutine uf_cargar ();
choose case ii_espacio
	case 0
		uf_carga_almacen()
	case 1
		uf_cargar_foro()
	case 2
		uf_cargar_laboratorio()
end choose
end subroutine

public subroutine uf_desglose_laboratorio ();string ls_filtro
datetime ldt_fecha_inicio, ldt_fecha_final

ldt_fecha_inicio=DateTime(id_fecha,time(is_hora_inicio+":00:00"))
ldt_fecha_final=DateTime(id_fecha,time(is_hora_final+":00:00"))
ls_filtro="((fecha_inicio between datetime('"+string(ldt_fecha_inicio)+"') and datetime('"+string(ldt_fecha_final)+"') ) or (fecha_final between datetime('"+string(ldt_fecha_inicio)+"')  and datetime('"+string(ldt_fecha_final)+"') ) or (datetime('"+string(ldt_fecha_inicio)+"')  between fecha_inicio and fecha_final) or (datetime('"+string(ldt_fecha_final)+"')  between fecha_inicio and fecha_final)) and fecha_final<>datetime('"+string(ldt_fecha_inicio)+"')  and fecha_inicio<>datetime('"+string(ldt_fecha_final)+"') "

//Desglose
tab_control.tabpage_laboratorio.dw_prereservado_lab.SetFilter(ls_filtro)
tab_control.tabpage_laboratorio.dw_prereservado_lab.Filter()
tab_control.tabpage_laboratorio.dw_prereservado_lab.SetSort(is_sort_pre_lab)
tab_control.tabpage_laboratorio.dw_prereservado_lab.Sort()

//Lista
tab_control.tabpage_laboratorio.dw_espera_lab.SetFilter(ls_filtro)
tab_control.tabpage_laboratorio.dw_espera_lab.Filter()
tab_control.tabpage_laboratorio.dw_espera_lab.SetSort('#2A #8A #6A')
tab_control.tabpage_laboratorio.dw_espera_lab.Sort()






end subroutine

public subroutine uf_desglose_foro ();string ls_filtro
datetime ldt_fecha_inicio, ldt_fecha_final

ldt_fecha_inicio=DateTime(id_fecha,time(is_hora_inicio+":00:00"))
ldt_fecha_final=DateTime(id_fecha,time(is_hora_final+":00:00"))
ls_filtro="((fecha_inicio between datetime('"+string(ldt_fecha_inicio)+"') and datetime('"+string(ldt_fecha_final)+"') ) or (fecha_final between datetime('"+string(ldt_fecha_inicio)+"')  and datetime('"+string(ldt_fecha_final)+"') ) or (datetime('"+string(ldt_fecha_inicio)+"')  between fecha_inicio and fecha_final) or (datetime('"+string(ldt_fecha_final)+"')  between fecha_inicio and fecha_final)) and fecha_final<>datetime('"+string(ldt_fecha_inicio)+"')  and fecha_inicio<>datetime('"+string(ldt_fecha_final)+"') "

//Desglose
tab_control.tabpage_foro.dw_prereservado_foro.SetFilter(ls_filtro)
tab_control.tabpage_foro.dw_prereservado_foro.Filter()
tab_control.tabpage_foro.dw_prereservado_foro.SetSort(is_sort_pre_foro)
tab_control.tabpage_foro.dw_prereservado_foro.Sort()

//Lista
tab_control.tabpage_foro.dw_prereservado_foro.SetFilter(ls_filtro)
tab_control.tabpage_foro.dw_prereservado_foro.Filter()
tab_control.tabpage_foro.dw_prereservado_foro.SetSort('#2A #8A #6A')
tab_control.tabpage_foro.dw_prereservado_foro.Sort()

end subroutine

public subroutine uf_desglose_almacen ();string ls_filtro
datetime ldt_fecha_inicio, ldt_fecha_final

ldt_fecha_inicio=DateTime(id_fecha,time(is_hora_inicio+":00:00"))
ldt_fecha_final=DateTime(id_fecha,time(is_hora_final+":00:00"))

//Desglose
ls_filtro="((fecha_inicio between datetime('"+string(ldt_fecha_inicio)+"') and datetime('"+string(ldt_fecha_final)+"') ) or (fecha_final between datetime('"+string(ldt_fecha_inicio)+"')  and datetime('"+string(ldt_fecha_final)+"') ) or (datetime('"+string(ldt_fecha_inicio)+"')  between fecha_inicio and fecha_final) or (datetime('"+string(ldt_fecha_final)+"')  between fecha_inicio and fecha_final)) and fecha_final<>datetime('"+string(ldt_fecha_inicio)+"')  and fecha_inicio<>datetime('"+string(ldt_fecha_final)+"') "
tab_control.tabpage_almacen.dw_prereservado_almacen.SetFilter(ls_filtro)
tab_control.tabpage_almacen.dw_prereservado_almacen.Filter()
tab_control.tabpage_almacen.dw_prereservado_almacen.SetSort(is_sort_pre_foro)
tab_control.tabpage_almacen.dw_prereservado_almacen.Sort()
end subroutine

public subroutine uf_carga_almacen ();integer li_i, li_row, li_res=0
string ls_cero_inicio, ls_departamento=''
datetime ldt_fecha_inicio, ldt_fecha_final
datastore lds_preespacio, lds_espacio

tab_control.tabpage_almacen.dw_prereservado_almacen.SetRedraw(false)
tab_control.tabpage_almacen.dw_reservado_almacen.SetRedraw(false)

tab_control.tabpage_almacen.enabled=true
tab_control.tabpage_foro.enabled=false
tab_control.tabpage_laboratorio.enabled=false
tab_control.tabpage_almacen.dw_prereservado_almacen.Reset()
tab_control.tabpage_almacen.dw_reservado_almacen.Reset()


ldt_fecha_inicio=datetime(id_fecha,time('00:00:00'))
ldt_fecha_final=datetime(id_fecha,time('23:59:59'))


//Prereservados Día
lds_preespacio =  create datastore
lds_preespacio.dataobject ='d_gen_sol_prereservados_fecha'
lds_preespacio.settransobject(gtr_sumuia)	
lds_preespacio.Retrieve(gi_depto,ii_cvearea,ldt_fecha_inicio,ldt_fecha_final)
li_row = lds_preespacio.Rowcount()

li_res=0

for li_i=1 to li_row
		
	li_res=li_res+1
	tab_control.tabpage_almacen.dw_prereservado_almacen.insertrow(0)
	tab_control.tabpage_almacen.dw_prereservado_almacen.SetItem(li_res,'folio',lds_preespacio.GetItemNumber(li_i,'spre_pre_sol_materiales_folio'))
	tab_control.tabpage_almacen.dw_prereservado_almacen.SetItem(li_res,'cvearea',lds_preespacio.GetItemNumber(li_i,'spre_pre_sol_materiales_cvearea'))
	tab_control.tabpage_almacen.dw_prereservado_almacen.SetItem(li_res,'solicitanteid',lds_preespacio.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'))		
	tab_control.tabpage_almacen.dw_prereservado_almacen.SetItem(li_res,'nom_prestamo',lds_preespacio.GetItemString(li_i,'spre_tipo_usuario_nom_tipo_usuario'))
	tab_control.tabpage_almacen.dw_prereservado_almacen.SetItem(li_res,'solicitantenombre',lds_preespacio.GetItemString(li_i,'spre_pre_solicitud_solicitantenombre'))
	tab_control.tabpage_almacen.dw_prereservado_almacen.SetItem(li_res,'tipo_prestamo',lds_preespacio.GetItemNumber(li_i,'spre_pre_solicitud_tipo_prestamo'))
	tab_control.tabpage_almacen.dw_prereservado_almacen.SetItem(li_res,'fecha_inicio',lds_preespacio.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio'))
	tab_control.tabpage_almacen.dw_prereservado_almacen.SetItem(li_res,'fecha_final',lds_preespacio.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin'))

next

tab_control.tabpage_almacen.dw_prereservado_almacen.SetSort(is_sort_pre_alma)
tab_control.tabpage_almacen.dw_prereservado_almacen.Sort()


//Reservados Todos
lds_espacio =  create datastore
lds_espacio.dataobject ='d_gen_sol_reservados'
lds_espacio.settransobject(gtr_sumuia)	
lds_espacio.Retrieve(gi_depto,ii_cvearea)
li_row = lds_espacio.Rowcount()

li_res=0

for li_i=1 to li_row

	li_res=li_res+1
	tab_control.tabpage_almacen.dw_reservado_almacen.insertrow(0)
	tab_control.tabpage_almacen.dw_reservado_almacen.SetItem(li_i,'folio',lds_espacio.GetItemNumber(li_i,'spre_sol_materiales_folio'))
	tab_control.tabpage_almacen.dw_reservado_almacen.SetItem(li_i,'cvearea',lds_espacio.GetItemNumber(li_i,'spre_sol_materiales_cvearea'))
	tab_control.tabpage_almacen.dw_reservado_almacen.SetItem(li_i,'solicitanteid',lds_espacio.GetItemNumber(li_i,'spre_solicitud_solicitanteid'))		
	tab_control.tabpage_almacen.dw_reservado_almacen.SetItem(li_i,'nom_prestamo',lds_espacio.GetItemString(li_i,'spre_tipo_usuario_nom_tipo_usuario'))
	tab_control.tabpage_almacen.dw_reservado_almacen.SetItem(li_i,'solicitantenombre',lds_espacio.GetItemString(li_i,'spre_prestamo_material_solicitantenombre'))
	tab_control.tabpage_almacen.dw_reservado_almacen.SetItem(li_i,'tipo_prestamo',lds_espacio.GetItemNumber(li_i,'spre_prestamo_material_tipo_prestamo'))
	tab_control.tabpage_almacen.dw_reservado_almacen.SetItem(li_i,'fecha_inicio',lds_espacio.GetItemDateTime(li_i,'spre_solicitud_fecha_inicio'))
	tab_control.tabpage_almacen.dw_reservado_almacen.SetItem(li_i,'fecha_final',lds_espacio.GetItemDateTime(li_i,'spre_solicitud_fecha_fin'))
	tab_control.tabpage_almacen.dw_reservado_almacen.SetItem(li_i,'folio_presol',lds_espacio.GetItemNumber(li_i,'spre_pre_solicitud_folio_presol'))
	if lds_espacio.GetItemDateTime(li_i,'spre_solicitud_fecha_fin')< DateTime(today(),now()) then tab_control.tabpage_almacen.dw_reservado_almacen.SetItem(li_i,'color',3)

next

tab_control.tabpage_almacen.dw_reservado_almacen.SetSort(is_sort_re_alma)
tab_control.tabpage_almacen.dw_reservado_almacen.Sort()

uf_desglose_almacen()

tab_control.tabpage_almacen.dw_prereservado_almacen.SetRedraw(true)
tab_control.tabpage_almacen.dw_reservado_almacen.SetRedraw(true)
end subroutine

public subroutine uf_selecciona_espacio (string ps_texto);string ls_find
integer li_existe

ii_espacio=integer(left(ps_texto,pos(ps_texto,'-')-1))
ii_cvearea=integer(right(ps_texto,len(ps_texto) - pos(ps_texto,'-')))

ls_find="cvearea="+string(ii_cvearea)
li_existe=idwc_area.Find(ls_find,1,idwc_area.RowCount())
is_area_nom=idwc_area.GetItemString(li_existe,'descripcion')


tab_control.tabpage_laboratorio.ddlb_inicio_lab.SelectItem(is_hora_inicio,1)
tab_control.tabpage_laboratorio.ddlb_final_lab.SelectItem(is_hora_final,1)
tab_control.tabpage_foro.ddlb_inicio_foro.SelectItem(is_hora_inicio,1)
tab_control.tabpage_foro.ddlb_final_foro.SelectItem(is_hora_final,1)
tab_control.tabpage_almacen.ddlb_inicio_almacen.SelectItem(is_hora_inicio,1)
tab_control.tabpage_almacen.ddlb_final_almacen.SelectItem(is_hora_final,1)


uf_cargar()

tab_control.selectedtab=ii_espacio+1
end subroutine

on w_imd_control_prestamo.create
this.st_hoy=create st_hoy
this.mc_fecha=create mc_fecha
this.em_fecha=create em_fecha
this.dw_area=create dw_area
this.tab_control=create tab_control
this.Control[]={this.st_hoy,&
this.mc_fecha,&
this.em_fecha,&
this.dw_area,&
this.tab_control}
end on

on w_imd_control_prestamo.destroy
destroy(this.st_hoy)
destroy(this.mc_fecha)
destroy(this.em_fecha)
destroy(this.dw_area)
destroy(this.tab_control)
end on

event open;string ls_cero_inicio
integer li_hora

dw_area.settransobject(gtr_sumuia)
dw_area.getchild('area',idwc_area)
idwc_area.settransobject(gtr_sumuia)

tab_control.tabpage_almacen.enabled=false
tab_control.tabpage_foro.enabled=false 
tab_control.tabpage_laboratorio.enabled=false

id_fecha=today()
em_fecha.text=string(id_fecha)
f_select_anio_periodo_actual(ii_periodo,ii_anio,id_fecha)

li_hora=hour(now())
if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''

is_hora_inicio=ls_cero_inicio+string(li_hora)
is_hora_final='22'

tab_control.tabpage_laboratorio.ddlb_inicio_lab.SelectItem(is_hora_inicio,1)
tab_control.tabpage_laboratorio.ddlb_final_lab.SelectItem(is_hora_final,1)
tab_control.tabpage_foro.ddlb_inicio_foro.SelectItem(is_hora_inicio,1)
tab_control.tabpage_foro.ddlb_final_foro.SelectItem(is_hora_final,1)
tab_control.tabpage_almacen.ddlb_inicio_almacen.SelectItem(is_hora_inicio,1)
tab_control.tabpage_almacen.ddlb_final_almacen.SelectItem(is_hora_final,1)

idwc_area.Retrieve(gi_depto)
if idwc_area.RowCount()>0 then 
	dw_area.insertrow(0)
	dw_area.SetItem(1,'area',idwc_area.GetItemString(1,'descripcion'))
	uf_selecciona_espacio(idwc_area.GetItemString(1,'compute_clave'))
end if

st_hoy.text='HOY'
end event

event close;if IsValid(w_imd_prestamo_material) then w_imd_prestamo_material.SetFocus()
end event

type st_hoy from statictext within w_imd_control_prestamo
integer x = 2363
integer y = 42
integer width = 410
integer height = 61
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 30520472
boolean focusrectangle = false
end type

type mc_fecha from monthcalendar within w_imd_control_prestamo
boolean visible = false
integer x = 1869
integer y = 35
integer width = 965
integer height = 643
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaycircle = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//this.GetSelectedDate(id_fecha)

end event

event datechanged;this.GetSelectedDate(id_fecha)
em_fecha.text=string(id_fecha)

f_select_anio_periodo_actual(ii_periodo,ii_anio,id_fecha)

uf_cargar()

if id_fecha=today() then 
	
	st_hoy.text='HOY'
	tab_control.tabpage_foro.cb_espera_foro.enabled=true
	tab_control.tabpage_laboratorio.cb_espera_lab.enabled=true
	tab_control.tabpage_almacen.cb_material_almacen.enabled=true
	tab_control.tabpage_foro.cb_material_foro.enabled=true
	
else 
	
	st_hoy.text=''
	
	if id_fecha<today() then
		tab_control.tabpage_foro.cb_espera_foro.enabled=false
		tab_control.tabpage_laboratorio.cb_espera_lab.enabled=false
		tab_control.tabpage_almacen.cb_material_almacen.enabled=false
		tab_control.tabpage_foro.cb_material_foro.enabled=false		
	end if
	
end if

w_imd_control_prestamo.SetFocus()

end event

event losefocus;uf_apaga_fecha()
end event

type em_fecha from editmask within w_imd_control_prestamo
integer x = 1938
integer y = 35
integer width = 399
integer height = 74
integer taborder = 50
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

event getfocus;if this.enabled=true then
	mc_fecha.visible=true
	mc_fecha.SetFocus()
end if

end event

type dw_area from u_basedw within w_imd_control_prestamo
integer x = 911
integer y = 35
integer width = 976
integer height = 77
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_gen_cat_area_espacio_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("area", "area", "area")
end event

event itemchanged;call super::itemchanged;uf_selecciona_espacio(this.gettext())

end event

type tab_control from tab within w_imd_control_prestamo
integer x = 26
integer y = 19
integer width = 4359
integer height = 2234
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_almacen tabpage_almacen
tabpage_foro tabpage_foro
tabpage_laboratorio tabpage_laboratorio
end type

on tab_control.create
this.tabpage_almacen=create tabpage_almacen
this.tabpage_foro=create tabpage_foro
this.tabpage_laboratorio=create tabpage_laboratorio
this.Control[]={this.tabpage_almacen,&
this.tabpage_foro,&
this.tabpage_laboratorio}
end on

on tab_control.destroy
destroy(this.tabpage_almacen)
destroy(this.tabpage_foro)
destroy(this.tabpage_laboratorio)
end on

type tabpage_almacen from userobject within tab_control
integer x = 15
integer y = 96
integer width = 4330
integer height = 2125
long backcolor = 30520472
string text = "Almacén"
long tabtextcolor = 33554432
long tabbackcolor = 30520472
long picturemaskcolor = 536870912
st_11 st_11
pb_salvar2 pb_salvar2
pb_salvar1 pb_salvar1
st_10 st_10
dw_prereservado_almacen dw_prereservado_almacen
dw_reservado_almacen dw_reservado_almacen
cb_material_almacen cb_material_almacen
ddlb_final_almacen ddlb_final_almacen
st_9 st_9
ddlb_inicio_almacen ddlb_inicio_almacen
st_8 st_8
end type

on tabpage_almacen.create
this.st_11=create st_11
this.pb_salvar2=create pb_salvar2
this.pb_salvar1=create pb_salvar1
this.st_10=create st_10
this.dw_prereservado_almacen=create dw_prereservado_almacen
this.dw_reservado_almacen=create dw_reservado_almacen
this.cb_material_almacen=create cb_material_almacen
this.ddlb_final_almacen=create ddlb_final_almacen
this.st_9=create st_9
this.ddlb_inicio_almacen=create ddlb_inicio_almacen
this.st_8=create st_8
this.Control[]={this.st_11,&
this.pb_salvar2,&
this.pb_salvar1,&
this.st_10,&
this.dw_prereservado_almacen,&
this.dw_reservado_almacen,&
this.cb_material_almacen,&
this.ddlb_final_almacen,&
this.st_9,&
this.ddlb_inicio_almacen,&
this.st_8}
end on

on tabpage_almacen.destroy
destroy(this.st_11)
destroy(this.pb_salvar2)
destroy(this.pb_salvar1)
destroy(this.st_10)
destroy(this.dw_prereservado_almacen)
destroy(this.dw_reservado_almacen)
destroy(this.cb_material_almacen)
destroy(this.ddlb_final_almacen)
destroy(this.st_9)
destroy(this.ddlb_inicio_almacen)
destroy(this.st_8)
end on

type st_11 from statictext within tabpage_almacen
integer x = 870
integer y = 122
integer width = 80
integer height = 51
integer textsize = -8
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

type pb_salvar2 from picturebutton within tabpage_almacen
integer x = 3138
integer y = 1373
integer width = 132
integer height = 115
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Icon_salvar.gif"
alignment htextalign = left!
end type

event clicked;f_exportar_reporte(dw_prereservado_almacen,1,"PreReservaciones "+is_area_nom)
end event

type pb_salvar1 from picturebutton within tabpage_almacen
integer x = 3138
integer y = 221
integer width = 132
integer height = 115
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Icon_salvar.gif"
alignment htextalign = left!
end type

event clicked;f_exportar_reporte(dw_reservado_almacen,1,"Reservaciones "+is_area_nom)
end event

type st_10 from statictext within tabpage_almacen
integer x = 66
integer y = 1290
integer width = 505
integer height = 61
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "PreReservaciones"
boolean focusrectangle = false
end type

type dw_prereservado_almacen from datawindow within tabpage_almacen
integer x = 66
integer y = 1373
integer width = 3054
integer height = 650
integer taborder = 60
string title = "none"
string dataobject = "d_gen_control_reserva_espacio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;str_pres_control lstr_pres_control

if row>0 then
	
	if id_fecha>=today() then
		lstr_pres_control.tipo_carga=1
		lstr_pres_control.tipo_espacio=ii_espacio	
		lstr_pres_control.cvearea=ii_cvearea
		lstr_pres_control.nom_area=is_area_nom
		lstr_pres_control.folio=0
		lstr_pres_control.folio_presol=this.GetItemNumber(row,"folio")
		lstr_pres_control.solicitanteid=this.GetItemNumber(row,"solicitanteid")
		lstr_pres_control.tipo_prestamo=this.GetItemNumber(row,"tipo_prestamo")
		lstr_pres_control.fecha_inicio=this.GetItemDatetime(row,"fecha_inicio")
		lstr_pres_control.fecha_final=this.GetItemDatetime(row,"fecha_final")
		opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)
	else
		messagebox('Aviso','No se pueden realizar una Solicitud en una fecha anterior al día de hoy.')
	end if

end if


end event

type dw_reservado_almacen from datawindow within tabpage_almacen
integer x = 66
integer y = 211
integer width = 3054
integer height = 1021
integer taborder = 80
string title = "none"
string dataobject = "d_gen_control_reserva_todo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.Type = "text" then
	
	choose case string(dwo.Name)

		case 'fecha_inicio_t'
			is_sort_re_alma="#10A #8A"
			this.Modify("fecha_inicio_t.background.color='11527407'")
			this.Modify("solicitantenombre_t.background.color='13106428'")
			this.Modify("solicitanteid_t.background.color='13106428'")
			this.Modify("nom_prestamo_t.background.color='13106428'")
			this.Modify("folio_t.background.color='13106428'")
			this.Modify("fecha_final_t.background.color='13106428'")

		case 'solicitantenombre_t'
			is_sort_re_alma="#8A #10A"
			this.Modify("fecha_inicio_t.background.color='13106428'")
			this.Modify("solicitantenombre_t.background.color='11527407'")
			this.Modify("solicitanteid_t.background.color='13106428'")
			this.Modify("nom_prestamo_t.background.color='13106428'")
			this.Modify("folio_t.background.color='13106428'")
			this.Modify("fecha_final_t.background.color='13106428'")				
				
		case 'solicitanteid_t'
			is_sort_re_alma="#6A #10A"
			this.Modify("fecha_inicio_t.background.color='13106428'")
			this.Modify("solicitantenombre_t.background.color='13106428'")
			this.Modify("solicitanteid_t.background.color='11527407'")
			this.Modify("nom_prestamo_t.background.color='13106428'")
			this.Modify("folio_t.background.color='13106428'")
			this.Modify("fecha_final_t.background.color='13106428'")		
				
		case 'nom_prestamo_t'
			is_sort_re_alma="#7A #8A #10A"
			this.Modify("fecha_inicio_t.background.color='13106428'")
			this.Modify("solicitantenombre_t.background.color='13106428'")
			this.Modify("solicitanteid_t.background.color='13106428'")
			this.Modify("nom_prestamo_t.background.color='11527407'")
			this.Modify("folio_t.background.color='13106428'")
			this.Modify("fecha_final_t.background.color='13106428'")	

		case 'folio_t'
			is_sort_re_alma="#1A"
			this.Modify("fecha_inicio_t.background.color='13106428'")
			this.Modify("solicitantenombre_t.background.color='13106428'")
			this.Modify("solicitanteid_t.background.color='13106428'")
			this.Modify("nom_prestamo_t.background.color='13106428'")
			this.Modify("folio_t.background.color='11527407'")
			this.Modify("fecha_final_t.background.color='13106428'")	

		case 'fecha_final_t'
			is_sort_re_alma="#11A #8A"
			this.Modify("fecha_inicio_t.background.color='13106428'")
			this.Modify("solicitantenombre_t.background.color='13106428'")
			this.Modify("solicitanteid_t.background.color='13106428'")
			this.Modify("nom_prestamo_t.background.color='13106428'")
			this.Modify("folio_t.background.color='13106428'")
			this.Modify("fecha_final_t.background.color='11527407'")	

	end choose

	this.SetSort(is_sort_re_alma) 
	this.Sort()
	
end if
end event

event doubleclicked;str_pres_control lstr_pres_control

if row>0 then

	lstr_pres_control.tipo_carga=2
	lstr_pres_control.tipo_espacio=ii_espacio	
	lstr_pres_control.cvearea=ii_cvearea
	lstr_pres_control.nom_area=is_area_nom
	lstr_pres_control.folio=this.GetItemNumber(row,"folio")
	lstr_pres_control.folio_presol=this.GetItemNumber(row,"folio_presol")
	lstr_pres_control.solicitanteid=this.GetItemNumber(row,"solicitanteid")
	lstr_pres_control.tipo_prestamo=this.GetItemNumber(row,"tipo_prestamo")
	lstr_pres_control.fecha_inicio=this.GetItemDatetime(row,"fecha_inicio")
	lstr_pres_control.fecha_final=this.GetItemDatetime(row,"fecha_final")
	opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)

end if
end event

type cb_material_almacen from commandbutton within tabpage_almacen
integer x = 2768
integer y = 109
integer width = 344
integer height = 83
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Nueva"
end type

event clicked;integer li_hora
string ls_cero_inicio, ls_hora
str_pres_control lstr_pres_control

li_hora=hour(now())
if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
ls_hora=ls_cero_inicio+string(li_hora)
			
lstr_pres_control.tipo_carga=0
lstr_pres_control.tipo_espacio=ii_espacio	
lstr_pres_control.cvearea=ii_cvearea
lstr_pres_control.nom_area=is_area_nom
lstr_pres_control.folio=0
lstr_pres_control.folio_presol=0
lstr_pres_control.solicitanteid=0
lstr_pres_control.tipo_prestamo=0
lstr_pres_control.fecha_inicio=DateTime(id_fecha,Time(ls_hora))
lstr_pres_control.fecha_final=DateTime(Date(lstr_pres_control.fecha_inicio),RelativeTime(Time(lstr_pres_control.fecha_inicio),3600))
opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)

end event

type ddlb_final_almacen from dropdownlistbox within tabpage_almacen
integer x = 962
integer y = 109
integer width = 201
integer height = 320
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"08","09","10","11","12","13","14","15","16","17","18","19","20","21","22"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;is_hora_final=this.Item[index]
uf_desglose_almacen()
w_imd_control_prestamo.SetFocus()
end event

type st_9 from statictext within tabpage_almacen
boolean visible = false
integer x = 870
integer y = 122
integer width = 80
integer height = 51
integer textsize = -8
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

type ddlb_inicio_almacen from dropdownlistbox within tabpage_almacen
integer x = 662
integer y = 109
integer width = 201
integer height = 320
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"07","08","09","10","11","12","13","14","15","16","17","18","19","20","21"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;is_hora_inicio=this.Item[index]
uf_desglose_almacen()
w_imd_control_prestamo.SetFocus()
end event

type st_8 from statictext within tabpage_almacen
integer x = 66
integer y = 115
integer width = 505
integer height = 61
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Reservaciones"
boolean focusrectangle = false
end type

type tabpage_foro from userobject within tab_control
event create ( )
event destroy ( )
integer x = 15
integer y = 96
integer width = 4330
integer height = 2125
long backcolor = 30520472
string text = "Foro"
long tabtextcolor = 33554432
long tabbackcolor = 30520472
long picturemaskcolor = 536870912
pb_salvar6 pb_salvar6
pb_salvar5 pb_salvar5
pb_salvar4 pb_salvar4
pb_salvar3 pb_salvar3
st_7 st_7
cb_material_foro cb_material_foro
dw_reservado_foro dw_reservado_foro
dw_prereservado_foro dw_prereservado_foro
st_6 st_6
st_4 st_4
cb_espera_foro cb_espera_foro
st_5 st_5
ddlb_final_foro ddlb_final_foro
ddlb_inicio_foro ddlb_inicio_foro
dw_espera_foro dw_espera_foro
dw_control_foro dw_control_foro
end type

on tabpage_foro.create
this.pb_salvar6=create pb_salvar6
this.pb_salvar5=create pb_salvar5
this.pb_salvar4=create pb_salvar4
this.pb_salvar3=create pb_salvar3
this.st_7=create st_7
this.cb_material_foro=create cb_material_foro
this.dw_reservado_foro=create dw_reservado_foro
this.dw_prereservado_foro=create dw_prereservado_foro
this.st_6=create st_6
this.st_4=create st_4
this.cb_espera_foro=create cb_espera_foro
this.st_5=create st_5
this.ddlb_final_foro=create ddlb_final_foro
this.ddlb_inicio_foro=create ddlb_inicio_foro
this.dw_espera_foro=create dw_espera_foro
this.dw_control_foro=create dw_control_foro
this.Control[]={this.pb_salvar6,&
this.pb_salvar5,&
this.pb_salvar4,&
this.pb_salvar3,&
this.st_7,&
this.cb_material_foro,&
this.dw_reservado_foro,&
this.dw_prereservado_foro,&
this.st_6,&
this.st_4,&
this.cb_espera_foro,&
this.st_5,&
this.ddlb_final_foro,&
this.ddlb_inicio_foro,&
this.dw_espera_foro,&
this.dw_control_foro}
end on

on tabpage_foro.destroy
destroy(this.pb_salvar6)
destroy(this.pb_salvar5)
destroy(this.pb_salvar4)
destroy(this.pb_salvar3)
destroy(this.st_7)
destroy(this.cb_material_foro)
destroy(this.dw_reservado_foro)
destroy(this.dw_prereservado_foro)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.cb_espera_foro)
destroy(this.st_5)
destroy(this.ddlb_final_foro)
destroy(this.ddlb_inicio_foro)
destroy(this.dw_espera_foro)
destroy(this.dw_control_foro)
end on

type pb_salvar6 from picturebutton within tabpage_foro
integer x = 4133
integer y = 1453
integer width = 132
integer height = 115
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Icon_salvar.gif"
alignment htextalign = left!
end type

event clicked;f_exportar_reporte(tab_control.tabpage_foro.dw_espera_foro,1,"Lista de Espera "+is_area_nom)

end event

type pb_salvar5 from picturebutton within tabpage_foro
integer x = 4133
integer y = 797
integer width = 132
integer height = 115
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Icon_salvar.gif"
alignment htextalign = left!
end type

event clicked;f_exportar_reporte(tab_control.tabpage_foro.dw_prereservado_foro,1,"PreReservados "+is_area_nom)

end event

type pb_salvar4 from picturebutton within tabpage_foro
integer x = 4133
integer y = 131
integer width = 132
integer height = 115
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Icon_salvar.gif"
alignment htextalign = left!
end type

event clicked;f_exportar_reporte(tab_control.tabpage_foro.dw_reservado_foro,1,"Reservados "+is_area_nom)
end event

type pb_salvar3 from picturebutton within tabpage_foro
integer x = 1766
integer y = 1837
integer width = 132
integer height = 115
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Icon_salvar.gif"
alignment htextalign = left!
end type

event clicked;f_exportar_reporte(tab_control.tabpage_foro.dw_control_foro,1,"Calendario "+is_area_nom)
end event

type st_7 from statictext within tabpage_foro
integer x = 1953
integer y = 48
integer width = 505
integer height = 61
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Reservaciones"
boolean focusrectangle = false
end type

type cb_material_foro from commandbutton within tabpage_foro
integer x = 3778
integer y = 13
integer width = 344
integer height = 83
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Nueva"
end type

event clicked;integer li_hora
string ls_cero_inicio, ls_hora
str_pres_control lstr_pres_control

li_hora=hour(now())
if li_hora<10 then ls_cero_inicio='0' else ls_cero_inicio=''
ls_hora=ls_cero_inicio+string(li_hora)
			
lstr_pres_control.tipo_carga=0
lstr_pres_control.tipo_espacio=ii_espacio	
lstr_pres_control.cvearea=ii_cvearea
lstr_pres_control.nom_area=is_area_nom
lstr_pres_control.folio=0
lstr_pres_control.folio_presol=0
lstr_pres_control.solicitanteid=0
lstr_pres_control.tipo_prestamo=0
lstr_pres_control.fecha_inicio=DateTime(id_fecha,Time(ls_hora))
lstr_pres_control.fecha_final=DateTime(Date(lstr_pres_control.fecha_inicio),RelativeTime(Time(lstr_pres_control.fecha_inicio),3600))
opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)

end event

type dw_reservado_foro from datawindow within tabpage_foro
integer x = 1953
integer y = 131
integer width = 2169
integer height = 554
integer taborder = 70
string title = "none"
string dataobject = "d_gen_control_reserva_todo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;str_pres_control lstr_pres_control

if row>0 then

	lstr_pres_control.tipo_carga=2
	lstr_pres_control.tipo_espacio=ii_espacio	
	lstr_pres_control.cvearea=ii_cvearea
	lstr_pres_control.nom_area=is_area_nom
	lstr_pres_control.folio=this.GetItemNumber(row,"folio")
	lstr_pres_control.folio_presol=this.GetItemNumber(row,"folio_presol")
	lstr_pres_control.solicitanteid=this.GetItemNumber(row,"solicitanteid")
	lstr_pres_control.tipo_prestamo=this.GetItemNumber(row,"tipo_prestamo")
	lstr_pres_control.fecha_inicio=this.GetItemDatetime(row,"fecha_inicio")
	lstr_pres_control.fecha_final=this.GetItemDatetime(row,"fecha_final")
	opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)

end if
end event

event clicked;if dwo.Type = "text" then
	
	choose case string(dwo.Name)

		case 'fecha_inicio_t'
			is_sort_re_foro="#10A #8A"
			this.Modify("fecha_inicio_t.background.color='11527407'")
			this.Modify("solicitantenombre_t.background.color='13106428'")
			this.Modify("solicitanteid_t.background.color='13106428'")
			this.Modify("nom_prestamo_t.background.color='13106428'")
			this.Modify("folio_t.background.color='13106428'")
			this.Modify("fecha_final_t.background.color='13106428'")

		case 'solicitantenombre_t'
			is_sort_re_foro="#8A #10A"
			this.Modify("fecha_inicio_t.background.color='13106428'")
			this.Modify("solicitantenombre_t.background.color='11527407'")
			this.Modify("solicitanteid_t.background.color='13106428'")
			this.Modify("nom_prestamo_t.background.color='13106428'")
			this.Modify("folio_t.background.color='13106428'")
			this.Modify("fecha_final_t.background.color='13106428'")				
				
		case 'solicitanteid_t'
			is_sort_re_foro="#6A #10A"
			this.Modify("fecha_inicio_t.background.color='13106428'")
			this.Modify("solicitantenombre_t.background.color='13106428'")
			this.Modify("solicitanteid_t.background.color='11527407'")
			this.Modify("nom_prestamo_t.background.color='13106428'")
			this.Modify("folio_t.background.color='13106428'")
			this.Modify("fecha_final_t.background.color='13106428'")		
				
		case 'nom_prestamo_t'
			is_sort_re_foro="#7A #8A #10A"
			this.Modify("fecha_inicio_t.background.color='13106428'")
			this.Modify("solicitantenombre_t.background.color='13106428'")
			this.Modify("solicitanteid_t.background.color='13106428'")
			this.Modify("nom_prestamo_t.background.color='11527407'")
			this.Modify("folio_t.background.color='13106428'")
			this.Modify("fecha_final_t.background.color='13106428'")	

		case 'folio_t'
			is_sort_re_foro="#1A"
			this.Modify("fecha_inicio_t.background.color='13106428'")
			this.Modify("solicitantenombre_t.background.color='13106428'")
			this.Modify("solicitanteid_t.background.color='13106428'")
			this.Modify("nom_prestamo_t.background.color='13106428'")
			this.Modify("folio_t.background.color='11527407'")
			this.Modify("fecha_final_t.background.color='13106428'")	

		case 'fecha_final_t'
			is_sort_re_foro="#11A #8A"
			this.Modify("fecha_inicio_t.background.color='13106428'")
			this.Modify("solicitantenombre_t.background.color='13106428'")
			this.Modify("solicitanteid_t.background.color='13106428'")
			this.Modify("nom_prestamo_t.background.color='13106428'")
			this.Modify("folio_t.background.color='13106428'")
			this.Modify("fecha_final_t.background.color='11527407'")	

	end choose

	this.SetSort(is_sort_re_foro) 
	this.Sort()
	
end if
end event

type dw_prereservado_foro from datawindow within tabpage_foro
integer x = 1953
integer y = 797
integer width = 2169
integer height = 554
integer taborder = 50
string title = "none"
string dataobject = "d_gen_control_reserva_espacio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;str_pres_control lstr_pres_control

if row>0 then
	if id_fecha>=today() then
		lstr_pres_control.tipo_carga=1
		lstr_pres_control.tipo_espacio=ii_espacio	
		lstr_pres_control.cvearea=ii_cvearea
		lstr_pres_control.nom_area=is_area_nom
		lstr_pres_control.folio=0
		lstr_pres_control.folio_presol=this.GetItemNumber(row,"folio")
		lstr_pres_control.solicitanteid=this.GetItemNumber(row,"solicitanteid")
		lstr_pres_control.tipo_prestamo=this.GetItemNumber(row,"tipo_prestamo")
		lstr_pres_control.fecha_inicio=this.GetItemDatetime(row,"fecha_inicio")
		lstr_pres_control.fecha_final=this.GetItemDatetime(row,"fecha_final")
		opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)	
	else
		messagebox('Aviso','No se pueden realizar una Solicitud en una fecha anterior al día de hoy.')
	end if
end if
end event

type st_6 from statictext within tabpage_foro
integer x = 1953
integer y = 1386
integer width = 505
integer height = 61
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Lista de Espera"
boolean focusrectangle = false
end type

type st_4 from statictext within tabpage_foro
integer x = 1953
integer y = 720
integer width = 505
integer height = 61
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "PreReservaciones"
boolean focusrectangle = false
end type

type cb_espera_foro from commandbutton within tabpage_foro
integer x = 3672
integer y = 2003
integer width = 450
integer height = 83
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Agregar a Lista"
end type

event clicked;str_pres_control lstr_pres_control
			
lstr_pres_control.tipo_espacio=ii_espacio	
lstr_pres_control.cvearea=ii_cvearea
lstr_pres_control.nom_area=is_area_nom
lstr_pres_control.cvegrupo=1
lstr_pres_control.cvematerial='1'
lstr_pres_control.num_serie='1'
opensheetwithparm(w_imd_agregar_lista_espera,lstr_pres_control,'w_imd_agregar_lista_espera',w_ppal,0,original!)
end event

type st_5 from statictext within tabpage_foro
integer x = 2757
integer y = 42
integer width = 80
integer height = 51
integer textsize = -8
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

type ddlb_final_foro from dropdownlistbox within tabpage_foro
integer x = 2849
integer y = 29
integer width = 201
integer height = 320
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"08","09","10","11","12","13","14","15","16","17","18","19","20","21","22"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;is_hora_final=this.Item[index]
uf_desglose_foro()
w_imd_control_prestamo.SetFocus()
end event

type ddlb_inicio_foro from dropdownlistbox within tabpage_foro
integer x = 2553
integer y = 29
integer width = 201
integer height = 320
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"07","08","09","10","11","12","13","14","15","16","17","18","19","20","21"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;is_hora_inicio=this.Item[index]
uf_desglose_foro()
w_imd_control_prestamo.SetFocus()
end event

type dw_espera_foro from datawindow within tabpage_foro
integer x = 1953
integer y = 1453
integer width = 2169
integer height = 528
integer taborder = 50
string title = "none"
string dataobject = "d_gen_control_reserva_espera"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_control_foro from datawindow within tabpage_foro
integer x = 7
integer y = 115
integer width = 1916
integer height = 1850
integer taborder = 30
string title = "none"
string dataobject = "d_gen_res_foro"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string ls_filtro, ls_hora=''
integer li_prestado=0, li_presolicitado=0
str_pres_control lstr_pres_control


//Refrescar
uf_cargar()


li_prestado=this.GetItemNumber(row,'folio')
if isnull(this.GetItemNumber(row,'folio_presol')) then li_presolicitado=0 else li_presolicitado=this.GetItemNumber(row,'folio_presol')

if li_prestado>0 then 
	//Solicitud
	lstr_pres_control.tipo_carga=2
	lstr_pres_control.tipo_espacio=ii_espacio	
	lstr_pres_control.cvearea=ii_cvearea
	lstr_pres_control.nom_area=is_area_nom
	lstr_pres_control.folio=this.GetItemNumber(row,"folio")
	lstr_pres_control.folio_presol=this.GetItemNumber(row,"folio_presol")
	lstr_pres_control.solicitanteid=this.GetItemNumber(row,"solicitanteid")
	lstr_pres_control.tipo_prestamo=this.GetItemNumber(row,"tipo_prestamo")
	lstr_pres_control.fecha_inicio=this.GetItemDatetime(row,"fecha_inicio")
	lstr_pres_control.fecha_final=this.GetItemDatetime(row,"fecha_final")
	opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)

else
	
	if id_fecha>=today() then
	
		if li_presolicitado>0 then
			//PreSolicitud
			lstr_pres_control.tipo_carga=1
			lstr_pres_control.tipo_espacio=ii_espacio	
			lstr_pres_control.cvearea=ii_cvearea
			lstr_pres_control.nom_area=is_area_nom
			lstr_pres_control.cvegrupo=1
			lstr_pres_control.cvematerial='1'
			lstr_pres_control.num_serie='1'			
			lstr_pres_control.folio=0
			lstr_pres_control.folio_presol=this.GetItemNumber(row,"folio_presol")
			lstr_pres_control.solicitanteid=this.GetItemNumber(row,"solicitanteid")
			lstr_pres_control.tipo_prestamo=this.GetItemNumber(row,"tipo_prestamo")
			lstr_pres_control.fecha_inicio=this.GetItemDatetime(row,"fecha_inicio")
			lstr_pres_control.fecha_final=this.GetItemDatetime(row,"fecha_final")
			opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)	
			
		else
			//Material
			lstr_pres_control.tipo_carga=3
			lstr_pres_control.tipo_espacio=ii_espacio	
			lstr_pres_control.cvearea=ii_cvearea
			lstr_pres_control.nom_area=is_area_nom
			lstr_pres_control.folio=0
			lstr_pres_control.folio_presol=0
			lstr_pres_control.solicitanteid=0
			lstr_pres_control.tipo_prestamo=0
			lstr_pres_control.cvegrupo=1
			lstr_pres_control.cvematerial='1'
			lstr_pres_control.num_serie='1'
			ls_hora=left(this.GetItemString(row,1),2)+':00:00'
			lstr_pres_control.fecha_inicio=DateTime(id_fecha,Time(ls_hora))
			lstr_pres_control.fecha_final=DateTime(Date(lstr_pres_control.fecha_inicio),RelativeTime(Time(lstr_pres_control.fecha_inicio),3600))
			opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)
	
		end if
		
	else
		messagebox('Aviso','No se pueden realizar una Solicitud en una fecha anterior al día de hoy.')
	end if
		

end if


end event

type tabpage_laboratorio from userobject within tab_control
integer x = 15
integer y = 96
integer width = 4330
integer height = 2125
long backcolor = 30520472
string text = "Laboratorio"
long tabtextcolor = 33554432
long tabbackcolor = 30520472
long picturemaskcolor = 536870912
pb_salvar7 pb_salvar7
pb_salvar9 pb_salvar9
pb_salvar8 pb_salvar8
st_3 st_3
ddlb_final_lab ddlb_final_lab
ddlb_inicio_lab ddlb_inicio_lab
st_2 st_2
st_1 st_1
cb_espera_lab cb_espera_lab
dw_prereservado_lab dw_prereservado_lab
dw_control_laboratorio dw_control_laboratorio
dw_control_reservaciones dw_control_reservaciones
dw_espera_lab dw_espera_lab
end type

on tabpage_laboratorio.create
this.pb_salvar7=create pb_salvar7
this.pb_salvar9=create pb_salvar9
this.pb_salvar8=create pb_salvar8
this.st_3=create st_3
this.ddlb_final_lab=create ddlb_final_lab
this.ddlb_inicio_lab=create ddlb_inicio_lab
this.st_2=create st_2
this.st_1=create st_1
this.cb_espera_lab=create cb_espera_lab
this.dw_prereservado_lab=create dw_prereservado_lab
this.dw_control_laboratorio=create dw_control_laboratorio
this.dw_control_reservaciones=create dw_control_reservaciones
this.dw_espera_lab=create dw_espera_lab
this.Control[]={this.pb_salvar7,&
this.pb_salvar9,&
this.pb_salvar8,&
this.st_3,&
this.ddlb_final_lab,&
this.ddlb_inicio_lab,&
this.st_2,&
this.st_1,&
this.cb_espera_lab,&
this.dw_prereservado_lab,&
this.dw_control_laboratorio,&
this.dw_control_reservaciones,&
this.dw_espera_lab}
end on

on tabpage_laboratorio.destroy
destroy(this.pb_salvar7)
destroy(this.pb_salvar9)
destroy(this.pb_salvar8)
destroy(this.st_3)
destroy(this.ddlb_final_lab)
destroy(this.ddlb_inicio_lab)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_espera_lab)
destroy(this.dw_prereservado_lab)
destroy(this.dw_control_laboratorio)
destroy(this.dw_control_reservaciones)
destroy(this.dw_espera_lab)
end on

type pb_salvar7 from picturebutton within tabpage_laboratorio
integer x = 2586
integer y = 1744
integer width = 132
integer height = 115
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Icon_salvar.gif"
alignment htextalign = left!
end type

event clicked;f_exportar_reporte(tab_control.tabpage_laboratorio.dw_control_laboratorio,1,"Calendario "+is_area_nom)
end event

type pb_salvar9 from picturebutton within tabpage_laboratorio
integer x = 4184
integer y = 1152
integer width = 132
integer height = 115
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Icon_salvar.gif"
alignment htextalign = left!
end type

event clicked;f_exportar_reporte(tab_control.tabpage_laboratorio.dw_espera_lab,1,"Lista de Espera "+is_area_nom)

end event

type pb_salvar8 from picturebutton within tabpage_laboratorio
integer x = 4176
integer y = 131
integer width = 132
integer height = 115
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Icon_salvar.gif"
alignment htextalign = left!
end type

event clicked;f_exportar_reporte(tab_control.tabpage_laboratorio.dw_prereservado_lab,1,"PreReservaciones "+is_area_nom)
end event

type st_3 from statictext within tabpage_laboratorio
integer x = 3489
integer y = 45
integer width = 80
integer height = 51
integer textsize = -8
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

type ddlb_final_lab from dropdownlistbox within tabpage_laboratorio
integer x = 3580
integer y = 29
integer width = 201
integer height = 320
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"08","09","10","11","12","13","14","15","16","17","18","19","20","21","22"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;is_hora_final=this.Item[index]
uf_desglose_laboratorio()
w_imd_control_prestamo.SetFocus()
end event

type ddlb_inicio_lab from dropdownlistbox within tabpage_laboratorio
integer x = 3280
integer y = 29
integer width = 201
integer height = 320
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"07","08","09","10","11","12","13","14","15","16","17","18","19","20","21"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;is_hora_inicio=this.Item[index]
uf_desglose_laboratorio()
w_imd_control_prestamo.SetFocus()
end event

type st_2 from statictext within tabpage_laboratorio
integer x = 2761
integer y = 1085
integer width = 505
integer height = 61
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Lista de Espera"
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_laboratorio
integer x = 2761
integer y = 45
integer width = 505
integer height = 61
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "PreReservaciones"
boolean focusrectangle = false
end type

type cb_espera_lab from commandbutton within tabpage_laboratorio
integer x = 3719
integer y = 1971
integer width = 450
integer height = 83
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Agregar a Lista"
end type

event clicked;str_pres_control lstr_pres_control
			
lstr_pres_control.tipo_espacio=ii_espacio	
lstr_pres_control.cvearea=uf_min_lab()
lstr_pres_control.nom_area=is_area_nom
lstr_pres_control.cvegrupo=1
lstr_pres_control.cvematerial='1'
lstr_pres_control.num_serie=uf_min_inventario()
opensheetwithparm(w_imd_agregar_lista_espera,lstr_pres_control,'w_imd_agregar_lista_espera',w_ppal,0,original!)
end event

type dw_prereservado_lab from datawindow within tabpage_laboratorio
integer x = 2754
integer y = 131
integer width = 1412
integer height = 912
integer taborder = 40
string title = "none"
string dataobject = "d_gen_control_reserva_espacio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;str_pres_control lstr_pres_control

if row>0 then
	if id_fecha>=today() then
		lstr_pres_control.tipo_carga=1
		lstr_pres_control.tipo_espacio=ii_espacio	
		lstr_pres_control.cvearea=ii_cvearea
		lstr_pres_control.nom_area=is_area_nom
		lstr_pres_control.folio=0
		lstr_pres_control.folio_presol=this.GetItemNumber(row,"folio")
		lstr_pres_control.solicitanteid=this.GetItemNumber(row,"solicitanteid")
		lstr_pres_control.tipo_prestamo=this.GetItemNumber(row,"tipo_prestamo")
		lstr_pres_control.fecha_inicio=this.GetItemDatetime(row,"fecha_inicio")
		lstr_pres_control.fecha_final=this.GetItemDatetime(row,"fecha_final")
		opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)	
	else
		messagebox('Aviso','No se pueden realizar una Solicitud en una fecha anterior al día de hoy.')
	end if
end if
end event

type dw_control_laboratorio from datawindow within tabpage_laboratorio
integer x = 7
integer y = 138
integer width = 2728
integer height = 1805
integer taborder = 20
string title = "none"
string dataobject = "d_gen_res_laboratorio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string ls_filtro, ls_col, ls_hora=''
integer li_col, li_i, li_prestado=0, li_presolicitado=0
str_pres_control lstr_pres_control


ls_col=string(dwo.Name)
dw_control_reservaciones.SetFilter('')
dw_control_reservaciones.Filter()

if pos(ls_col,'pc')>0 then

	li_col=integer(right(ls_col,len(ls_col)-2))+1

	//Refrescar
	uf_cargar()

	ls_filtro="columna="+string(li_col)+" and renglon="+string(row)
	dw_control_reservaciones.SetFilter(ls_filtro)
	dw_control_reservaciones.Filter() 
	
	for li_i=1 to dw_control_reservaciones.RowCount()
		if dw_control_reservaciones.GetItemNumber(li_i,"folio")>0 then li_prestado=li_i
		if dw_control_reservaciones.GetItemNumber(li_i,"folio_presol")>0 then li_presolicitado=li_i
	next

	//Excedió su tiempo
	if li_prestado=0 and li_presolicitado=0 and this.GetItemString(row,li_col)='3'  then 

		dw_control_reservaciones.SetFilter('')
		dw_control_reservaciones.Filter() 
		
		ls_filtro="columna="+string(li_col)+" and folio>0"
		dw_control_reservaciones.SetFilter(ls_filtro)
		dw_control_reservaciones.Filter() 
		
		if dw_control_reservaciones.RowCount()>0 then li_prestado=1

	end if
	
	if li_prestado>0 then 
		//Solicitud
		lstr_pres_control.tipo_carga=2
		lstr_pres_control.tipo_espacio=ii_espacio	
		lstr_pres_control.cvearea=ii_cvearea
		lstr_pres_control.nom_area=is_area_nom
		lstr_pres_control.folio=dw_control_reservaciones.GetItemNumber(li_prestado,"folio")
		lstr_pres_control.folio_presol=dw_control_reservaciones.GetItemNumber(li_prestado,"folio_presol")
		lstr_pres_control.solicitanteid=dw_control_reservaciones.GetItemNumber(li_prestado,"solicitanteid")
		lstr_pres_control.tipo_prestamo=dw_control_reservaciones.GetItemNumber(li_prestado,"tipo_prestamo")
		lstr_pres_control.fecha_inicio=dw_control_reservaciones.GetItemDatetime(li_prestado,"fecha_inicio")
		lstr_pres_control.fecha_final=dw_control_reservaciones.GetItemDatetime(li_prestado,"fecha_final")
		opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)
	
	else
		
		if id_fecha>=today() then
		
			if li_presolicitado>0 then
				//PreSolicitud
				lstr_pres_control.tipo_carga=1
				lstr_pres_control.tipo_espacio=ii_espacio	
				lstr_pres_control.cvearea=ii_cvearea
				lstr_pres_control.nom_area=is_area_nom
				lstr_pres_control.cvegrupo=1
				lstr_pres_control.cvematerial='1'
				lstr_pres_control.num_serie=dw_control_laboratorio.GetItemString(1,li_col)			
				lstr_pres_control.folio=0
				lstr_pres_control.folio_presol=dw_control_reservaciones.GetItemNumber(li_presolicitado,"folio_presol")
				lstr_pres_control.solicitanteid=dw_control_reservaciones.GetItemNumber(li_presolicitado,"solicitanteid")
				lstr_pres_control.tipo_prestamo=dw_control_reservaciones.GetItemNumber(li_presolicitado,"tipo_prestamo")
				lstr_pres_control.fecha_inicio=dw_control_reservaciones.GetItemDatetime(li_presolicitado,"fecha_inicio")
				lstr_pres_control.fecha_final=dw_control_reservaciones.GetItemDatetime(li_presolicitado,"fecha_final")
				opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)	
				
			else
				//Material
				lstr_pres_control.tipo_carga=3
				lstr_pres_control.tipo_espacio=ii_espacio	
				lstr_pres_control.cvearea=ii_cvearea
				lstr_pres_control.nom_area=is_area_nom
				lstr_pres_control.folio=0
				lstr_pres_control.folio_presol=0
				lstr_pres_control.solicitanteid=0
				lstr_pres_control.tipo_prestamo=0
				lstr_pres_control.cvegrupo=1
				lstr_pres_control.cvematerial='1'
				lstr_pres_control.num_serie=dw_control_laboratorio.GetItemString(1,li_col)
				ls_hora=left(dw_control_laboratorio.GetItemString(row,1),2)+':00:00'
				lstr_pres_control.fecha_inicio=DateTime(id_fecha,Time(ls_hora))
				lstr_pres_control.fecha_final=DateTime(Date(lstr_pres_control.fecha_inicio),RelativeTime(Time(lstr_pres_control.fecha_inicio),3600))
				opensheetwithparm(w_imd_prestamo_material,lstr_pres_control,'w_imd_prestamo_material',w_ppal,0,original!)
	
			end if
			
		else
			messagebox('Aviso','No se pueden realizar una Solicitud en una fecha anterior al día de hoy.')
		end if
	
	end if

end if
end event

type dw_control_reservaciones from datawindow within tabpage_laboratorio
integer x = 102
integer y = 1133
integer width = 1913
integer height = 333
integer taborder = 40
string title = "none"
string dataobject = "d_gen_control_reservaciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_espera_lab from datawindow within tabpage_laboratorio
integer x = 2754
integer y = 1152
integer width = 1412
integer height = 794
integer taborder = 60
string title = "none"
string dataobject = "d_gen_control_reserva_espera"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

