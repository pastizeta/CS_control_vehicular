$PBExportHeader$w_dis_prestamo_material.srw
forward
global type w_dis_prestamo_material from window
end type
type ole_1 from olecustomcontrol within w_dis_prestamo_material
end type
type dw_tipo_usuario from datawindow within w_dis_prestamo_material
end type
type st_1 from statictext within w_dis_prestamo_material
end type
type dw_tamano from u_basedw within w_dis_prestamo_material
end type
type st_tamano from statictext within w_dis_prestamo_material
end type
type dw_tipo from u_basedw within w_dis_prestamo_material
end type
type st_tipo from statictext within w_dis_prestamo_material
end type
type tab_solicitud from tab within w_dis_prestamo_material
end type
type tabpage_solicitado from userobject within tab_solicitud
end type
type cb_eliminar from commandbutton within tabpage_solicitado
end type
type cbx_todos from checkbox within tabpage_solicitado
end type
type dw_solicitados from datawindow within tabpage_solicitado
end type
type tabpage_solicitado from userobject within tab_solicitud
cb_eliminar cb_eliminar
cbx_todos cbx_todos
dw_solicitados dw_solicitados
end type
type tabpage_activo from userobject within tab_solicitud
end type
type cbx_entregar from checkbox within tabpage_activo
end type
type cb_entregar from commandbutton within tabpage_activo
end type
type sle_cod_entregar from singlelineedit within tabpage_activo
end type
type st_6 from statictext within tabpage_activo
end type
type dw_activos from datawindow within tabpage_activo
end type
type gb_entregar from groupbox within tabpage_activo
end type
type tabpage_activo from userobject within tab_solicitud
cbx_entregar cbx_entregar
cb_entregar cb_entregar
sle_cod_entregar sle_cod_entregar
st_6 st_6
dw_activos dw_activos
gb_entregar gb_entregar
end type
type tabpage_entregado from userobject within tab_solicitud
end type
type dw_entregados from datawindow within tabpage_entregado
end type
type tabpage_entregado from userobject within tab_solicitud
dw_entregados dw_entregados
end type
type tab_solicitud from tab within w_dis_prestamo_material
tabpage_solicitado tabpage_solicitado
tabpage_activo tabpage_activo
tabpage_entregado tabpage_entregado
end type
type st_cod_uia from statictext within w_dis_prestamo_material
end type
type dw_reporte_mat from datawindow within w_dis_prestamo_material
end type
type sle_cod_agregar from singlelineedit within w_dis_prestamo_material
end type
type dw_matgrupo from u_basedw within w_dis_prestamo_material
end type
type dw_grupomat from u_basedw within w_dis_prestamo_material
end type
type st_grupo from statictext within w_dis_prestamo_material
end type
type cb_cerrar from commandbutton within w_dis_prestamo_material
end type
type dw_disponible from datawindow within w_dis_prestamo_material
end type
type cb_buscar from commandbutton within w_dis_prestamo_material
end type
type st_material from statictext within w_dis_prestamo_material
end type
type st_3 from statictext within w_dis_prestamo_material
end type
type st_2 from statictext within w_dis_prestamo_material
end type
type em_hora_final from editmask within w_dis_prestamo_material
end type
type em_fecha_final from editmask within w_dis_prestamo_material
end type
type st_final from statictext within w_dis_prestamo_material
end type
type em_hora_inicio from editmask within w_dis_prestamo_material
end type
type em_fecha_inicio from editmask within w_dis_prestamo_material
end type
type st_inicio from statictext within w_dis_prestamo_material
end type
type dw_solicitante from datawindow within w_dis_prestamo_material
end type
type cb_materias from commandbutton within w_dis_prestamo_material
end type
type dw_foto from datawindow within w_dis_prestamo_material
end type
type st_cuenta from statictext within w_dis_prestamo_material
end type
type sle_solicitante from singlelineedit within w_dis_prestamo_material
end type
type gb_busqueda from groupbox within w_dis_prestamo_material
end type
type gb_solicitud from groupbox within w_dis_prestamo_material
end type
type gb_material from groupbox within w_dis_prestamo_material
end type
type gb_seleccionado from groupbox within w_dis_prestamo_material
end type
type gb_disponible from groupbox within w_dis_prestamo_material
end type
type gb_agregar from groupbox within w_dis_prestamo_material
end type
type gb_solicitante from groupbox within w_dis_prestamo_material
end type
type dw_inventario_disponible from datawindow within w_dis_prestamo_material
end type
type cb_generar from commandbutton within w_dis_prestamo_material
end type
end forward

global type w_dis_prestamo_material from window
integer width = 3719
integer height = 2749
boolean titlebar = true
string title = "Préstamo de Materiales DISEÑO"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
ole_1 ole_1
dw_tipo_usuario dw_tipo_usuario
st_1 st_1
dw_tamano dw_tamano
st_tamano st_tamano
dw_tipo dw_tipo
st_tipo st_tipo
tab_solicitud tab_solicitud
st_cod_uia st_cod_uia
dw_reporte_mat dw_reporte_mat
sle_cod_agregar sle_cod_agregar
dw_matgrupo dw_matgrupo
dw_grupomat dw_grupomat
st_grupo st_grupo
cb_cerrar cb_cerrar
dw_disponible dw_disponible
cb_buscar cb_buscar
st_material st_material
st_3 st_3
st_2 st_2
em_hora_final em_hora_final
em_fecha_final em_fecha_final
st_final st_final
em_hora_inicio em_hora_inicio
em_fecha_inicio em_fecha_inicio
st_inicio st_inicio
dw_solicitante dw_solicitante
cb_materias cb_materias
dw_foto dw_foto
st_cuenta st_cuenta
sle_solicitante sle_solicitante
gb_busqueda gb_busqueda
gb_solicitud gb_solicitud
gb_material gb_material
gb_seleccionado gb_seleccionado
gb_disponible gb_disponible
gb_agregar gb_agregar
gb_solicitante gb_solicitante
dw_inventario_disponible dw_inventario_disponible
cb_generar cb_generar
end type
global w_dis_prestamo_material w_dis_prestamo_material

type variables
n_transportar regreso, origen

integer ii_anio, ii_periodo

integer ii_tipo_usuario=0, ii_tipou_sel=0

long il_solicitante
string is_solicitantenom

long il_cvegrupo=0, il_cvetipo, il_cvetamano
string is_cvemat=''
integer ii_reservados=0

datetime idt_fecha_inicio, idt_fecha_final

DatawindowChild idwc_grupomat, idwc_matgrupo, idwc_tipo, idwc_tamano

long il_folio_prestamo=0, il_folio_presolicitud=0

integer ii_edita=0

str_pres_permisos istr_pres_permisos

end variables

forward prototypes
public subroutine f_fecha_fija ()
public function integer f_valida_alumno (string p_cuenta)
public function integer f_valida_alumno_intercambio (string p_cuenta)
public function integer f_valida_empleado (string p_cuenta)
public subroutine f_carga_foto ()
public function integer f_valida_multas ()
public function integer f_validar_suspendido ()
public function long f_insert_solicitud ()
public function long f_insert_material (integer p_row, long p_folio)
public subroutine f_reset_solicitud ()
public subroutine f_buscar_presolicitudes ()
public subroutine f_cargar_presolicitud (long p_presol)
public subroutine f_agregar_material (str_sol_material pstr_sol_material, long p_folio_presol, integer p_rowdis)
public subroutine f_generar_solicitud ()
public subroutine f_cargar_solicitud (long p_folio, long p_foliopresol)
public subroutine f_actualizar_materiales ()
public function long f_insert_solicitante (long p_folio)
public subroutine f_agregar_material_presol (str_sol_material pstr_sol_material, long p_folio_presol)
public subroutine f_marca_tipo_usuario ()
public function integer f_valida_exalumno (string p_cuenta)
public function integer f_valida_alumno_dec (string p_cuenta)
public function decimal f_calcular_multa (decimal p_multa, datetime p_fecha_final)
public function long f_buscar_multa_folio (long p_folio)
public function long f_insert_multa (long p_folio_solicitud)
public function long f_insert_multa_material (integer p_row, long p_folio_multa, decimal p_importe)
public subroutine f_cerrar_solicitud ()
end prototypes

public subroutine f_fecha_fija ();//Ejemplos para Psicología
//Esto se pondría en el local, el general quedaría vacío

em_fecha_inicio.text=string(today())
em_fecha_final.text=string(today())
em_hora_inicio.text='07:00:00'
em_hora_final.text='22:00:00'
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
em_hora_inicio.enabled=false
em_hora_final.enabled=false

end subroutine

public function integer f_valida_alumno (string p_cuenta);integer li_pos, li_existe=0, li_valida
string ls_cuenta, ls_digito
long ll_cuenta

li_pos=pos(p_cuenta,'-')

if li_pos>0 then
	ls_cuenta=left(p_cuenta,len(p_cuenta) - 2)
	ls_digito=right(p_cuenta,1)
else
	ls_cuenta=left(p_cuenta,len(p_cuenta) - 1)
	ls_digito=right(p_cuenta,1)
end if


//Confirma Dígito
if isNumber(ls_cuenta) then
	ll_cuenta=long(ls_cuenta)
	il_solicitante=ll_cuenta
	if f_valida_digito_alumno(ll_cuenta,ls_digito)>0 then li_existe=1
end if


//Valida acceso
if li_existe=1 then
	
	li_valida=f_valida_alumno(ll_cuenta,is_solicitantenom)
	
	choose case li_valida
		case -1
			messagebox('Aviso','La cuenta no es válida.')
			return (-1)			
		case 0
			return (1)			
	end choose
	
	if (f_valida_mat_alumno_depto(ll_cuenta,gi_deptocoor, ii_anio,ii_periodo))=0 then return(2)
	
else
	messagebox('Aviso','La cuenta '+string(il_solicitante)+' no es válida.')
	return (-1)	
end if

return (0)
end function

public function integer f_valida_alumno_intercambio (string p_cuenta);integer li_existe=0, li_valida
long ll_cuenta

if isNumber(p_cuenta) then
	ll_cuenta=long(p_cuenta)
	il_solicitante=ll_cuenta
	li_existe=1
end if

if li_existe=1 then

	li_valida=f_valida_alumno_intercambio(ll_cuenta,is_solicitantenom,ii_anio,ii_periodo)

	choose case li_valida
		case -1
			messagebox('Aviso','La cuenta no es válida.')
			return (-1)			
		case 0
			return (1)			
	end choose

	if (f_valida_mat_intercambio_depto(ll_cuenta,gs_deptocoor, ii_anio,ii_periodo))=0 then return(2)
	
else
	messagebox('Aviso','La cuenta '+string(il_solicitante)+' no es válida.')
	return (-1)	
end if

return (0)
end function

public function integer f_valida_empleado (string p_cuenta);integer li_existe=0, li_valida
long ll_cuenta

if isNumber(p_cuenta) then
	ll_cuenta=long(p_cuenta)
	il_solicitante=ll_cuenta
	li_existe=1
end if

if li_existe=1 then
	
	li_valida=f_valida_empleado(ll_cuenta,is_solicitantenom)
		
	choose case li_valida
		case -1
			messagebox('Aviso','La cuenta no es válida.')
			return (-1)			
	end choose
	
	if (f_valida_mat_empleado_depto(ll_cuenta,gi_deptocoor, ii_anio,ii_periodo))=0 then return(2)
	
else
	messagebox('Aviso','La cuenta '+string(il_solicitante)+' no es válida.')
	return (-1)	
end if

return (0)
end function

public subroutine f_carga_foto ();Blob lbl_foto
String ls_arch_ruta
Blob lblob_foto_bd
Integer li_registro

SetNull(ls_arch_ruta)

	choose case ii_tipo_usuario
		case 1
			ls_arch_ruta = f_archivo_gvbox2(f_foto_alumno(il_solicitante))
		case 2
			ls_arch_ruta = f_archivo_gvbox2(f_foto_alumno_dca(il_solicitante))
		case 3
			ls_arch_ruta = f_archivo_gvbox2(f_foto_profesor(il_solicitante))
		case 4
			ls_arch_ruta = f_archivo_gvbox2(f_foto_alumno(il_solicitante))	
		case 5
			ls_arch_ruta = f_archivo_gvbox2(f_foto_alumno_dec(il_solicitante))
	end choose
	
	if ii_tipo_usuario=0 then
		
	else
		
	end if
	IF IsNull(ls_arch_ruta) THEN 
		dw_foto.reset()
		dw_foto.Modify ( "p_1.FileName='uia-n.jpg'" )
		messagebox('Aviso','El Alumno no tiene foto') 
	ELSE 
		li_registro = dw_foto.insertrow(0)
		dw_foto.setitem(li_registro, "name", "pruebas")
		dw_foto.Modify ( "p_1.FileName='" + ls_arch_ruta + "'" )
	END IF


end subroutine

public function integer f_valida_multas ();integer li_acceso=0, li_row, li_i
datastore lds_multa_depto, lds_multa_todos

lds_multa_depto =  create datastore
lds_multa_todos =  create datastore

//Si hay Multa en el departamento, no permite reservar

	lds_multa_depto.dataobject ='d_gen_select_multa_depto'
	lds_multa_depto.settransobject(gtr_sumuia)	
	lds_multa_depto.Retrieve(il_solicitante,ii_tipo_usuario,gi_depto,gi_area)
	li_row = lds_multa_depto.Rowcount()

	for li_i=1 to li_row
		Messagebox("Atención","La cuenta "+string(il_solicitante)+ " presenta una multa en el área: "&
		+lds_multa_depto.GetitemString(li_i,'area')+"~r~nFolio: "+string(lds_multa_depto.GetItemNumber(li_i,'folio_multa'))+"~r~nNo se puede realizar el préstamo.",stopsign!)
		li_acceso= -1
	next
	
//Si hay Multa en otros lados es meramente informativo

	lds_multa_todos.dataobject ='d_gen_select_multa_todo'
	lds_multa_todos.settransobject(gtr_sumuia)	
	lds_multa_todos.Retrieve(il_solicitante,ii_tipo_usuario,gi_depto,gi_area)
	li_row = lds_multa_todos.Rowcount()

	for li_i=1 to li_row
		Messagebox("Atención","La cuenta "+string(il_solicitante)+ " presenta una multa en el área: "&
		+lds_multa_todos.GetitemString(li_i,'area')+"~r~nFolio: "+string(lds_multa_todos.GetItemNumber(li_i,'folio_multa')),Information!)
	next
	
	
return(li_acceso)
end function

public function integer f_validar_suspendido ();integer li_suspendido, li_dias_retraso

li_suspendido=f_valida_solicitante_bloqueado(gi_depto,gi_area,ii_anio, ii_periodo,il_solicitante,ii_tipo_usuario)

if li_suspendido=0 then
	
	li_dias_retraso=f_select_solicitante_retraso(gi_depto,gi_area,ii_anio, ii_periodo,il_solicitante,ii_tipo_usuario)

	if li_dias_retraso>istr_pres_permisos.suspendido then
		f_insert_solicitante_bloqueado(gi_depto,gi_area,ii_anio, ii_periodo,il_solicitante,ii_tipo_usuario)
		messagebox("Atención","El usuario excedió los días "+string(istr_pres_permisos.suspendido) +" de retraso permitidos al entregar material, el servicio de reservación queda suspendido.",exclamation!)
		return -1
	end if

else
	
	messagebox("Atención","El usuario excedió los días "+string(istr_pres_permisos.suspendido) +" de retraso permitidos al entregar material, el servicio de reservación queda suspendido.",exclamation!)
	return -1

end if
end function

public function long f_insert_solicitud ();long ll_folio
datetime ldt_fecha_inicio, ldt_fecha_final, ldt_fecha_hoy

ldt_fecha_inicio=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemDateTime(1,'fecha_inicio')
ldt_fecha_final=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemDateTime(1,'fecha_final')
ldt_fecha_hoy= DateTime(today(),now())

	select max(folio)
	into :ll_folio
	from dbo.spre_solicitud
	where cvedepto =:gi_depto
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener Máximo Folio Solicitud", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(ll_folio) then ll_folio=0

	ll_folio=ll_folio+1
	
	
	//Insertar Solicitud
	insert into dbo.spre_solicitud
	(cvedepto, folio, solicitanteid, status, cveperiodo, condicion, fecha_solicitud, fecha_inicio, 
	fecha_fin, tipo_solicitud)
	 
	values
	(:gi_depto, :ll_folio, :il_solicitante, 0, :ii_periodo, 0, :ldt_fecha_hoy, :ldt_fecha_inicio,
	:ldt_fecha_final, :ii_tipo_usuario)


	using gtr_sumuia;	
	
	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al insertar la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;
	end if	

return(ll_folio)


end function

public function long f_insert_material (integer p_row, long p_folio);integer li_cvegrupo, li_consec
decimal ldc_costo_mat
string ls_cvematerial, ls_num_serie
datetime ldt_fecha_inicio, ldt_fecha_final, ldt_fecha_hoy

ldt_fecha_hoy= DateTime(today(),now())
ldt_fecha_inicio=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemDateTime(p_row,'fecha_inicio')
ldt_fecha_final=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemDateTime(p_row,'fecha_final')
li_cvegrupo=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(p_row,'cvegrupo')
ls_cvematerial=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(p_row,'cvematerial')
ls_num_serie=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(p_row,'num_serie')
ldc_costo_mat=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemDecimal(p_row,'costo_mat')

	//Obtener consecutivo

	select max(consecutivo)
	into :li_consec
	from dbo.spre_sol_materiales
	where cvedepto =:gi_depto
	and folio=:p_folio
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener Máximo Consecutivo de Material", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	
	if isNull(li_consec) then li_consec=0

	li_consec=li_consec+1
	
	//Insertar Solicitud
	insert into dbo.spre_sol_materiales
	(cvedepto, folio, consecutivo, cvearea, cvematerial, cvegrupo, num_serie,
	status, fecha_inicio, fecha_final, costo_mat)
	 
	values
	(:gi_depto, :p_folio, :li_consec, :gi_area, :ls_cvematerial, :li_cvegrupo, :ls_num_serie,
	0, :ldt_fecha_inicio, :ldt_fecha_final, :ldc_costo_mat )


	using gtr_sumuia;	
	
	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al insertar el material a la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;
	end if	

return(li_consec)


end function

public subroutine f_reset_solicitud ();ii_edita=0
sle_solicitante.text=''
il_solicitante=0
is_solicitantenom=''
is_cvemat=''
il_cvegrupo=0
ii_reservados=0
il_folio_prestamo=0 
il_folio_presolicitud=0

dw_solicitante.Reset()
dw_solicitante.insertrow(0)
dw_solicitante.SetItem(1, "cveperiodo", ii_periodo)	

dw_foto.Reset()
dw_foto.Modify ( "p_1.FileName='uia-n.jpg'" )

dw_grupomat.Reset()
dw_matgrupo.Reset()
dw_tipo.Reset()
dw_tamano.Reset()

dw_disponible.Reset()
tab_solicitud.tabpage_solicitado.dw_solicitados.Reset()
tab_solicitud.tabpage_activo.dw_activos.Reset()
tab_solicitud.tabpage_entregado.dw_entregados.Reset()

dw_grupomat.enabled=false
dw_matgrupo.enabled=false
dw_tipo.enabled=false
dw_tamano.enabled=false

cb_buscar.enabled=false
tab_solicitud.tabpage_solicitado.cb_eliminar.enabled=false
cb_generar.enabled=false
cb_materias.enabled=false
tab_solicitud.tabpage_activo.sle_cod_entregar.enabled=false
tab_solicitud.tabpage_activo.cb_entregar.enabled=false
sle_cod_agregar.enabled=false


em_fecha_inicio.text=string(today())
em_fecha_final.text=string(today())
em_hora_inicio.text=string(hour(now())+1)
em_hora_final.text=string(hour(now())+2)

em_fecha_inicio.enabled=true
em_fecha_final.enabled=true
em_hora_inicio.enabled=true
em_hora_final.enabled=true

if istr_pres_permisos.fecha=1 then f_fecha_fija()

idt_fecha_inicio=datetime(date(em_fecha_inicio.text),time(em_hora_inicio.text))
idt_fecha_final=datetime(date(em_fecha_final.text),time(em_hora_final.text))

tab_solicitud.selectedtab=1

cb_generar.text='Generar'

tab_solicitud.tabpage_solicitado.text='Solicitado ('+string(tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())+')'
tab_solicitud.tabpage_activo.text='Activo ('+string(tab_solicitud.tabpage_activo.dw_activos.RowCount())+')'
tab_solicitud.tabpage_entregado.text='Entregado ('+string(tab_solicitud.tabpage_entregado.dw_entregados.RowCount())+')'

this.title='Préstamo de Materiales DISEÑO'
end subroutine

public subroutine f_buscar_presolicitudes ();integer li_presol, li_row
str_folios lstr_folios

datetime ld_inicio = DateTime(Date('2016/01/01'),Time('00:00:00')) 
datetime ld_fin = DateTime(Date(today()),Time('00:00:00')) 

//Primero revisar si tiene expiradas
lstr_folios=f_valida_solicitud_abierta_fecha(gi_depto,gi_area,il_solicitante,ld_inicio,ld_fin)

if lstr_folios.folio_solicitud > 0 then
	messagebox('Aviso','Cargando solicitud expirada, sólo podrá entregar los materiales')
	f_cargar_solicitud(lstr_folios.folio_solicitud,lstr_folios.folio_presol)
else

	//Si ya hay solicitud abierta del día cargarla (puede no tener presolicitud)
	lstr_folios=f_valida_solicitud_abierta(gi_depto,gi_area,il_solicitante)
	
	if lstr_folios.folio_solicitud>0 then
	
		//Cargar Solicitud y si hay PreSolicitud
		messagebox('Aviso','Cargando solicitud actual.')
	
		f_cargar_solicitud(lstr_folios.folio_solicitud,lstr_folios.folio_presol)
	
	end if

	if lstr_folios.folio_presol=0 then
	
		//Buscar PreSolicitud
	
		origen.ii_parm1 = gi_depto
		origen.ii_parm2 = gi_area
		origen.il_parm2 = il_solicitante
								
		openwithparm(w_gen_pre_solicitud,origen)
		
		if isvalid(Message.PowerObjectParm) then
			regreso = message.powerobjectparm
			li_presol = regreso.ii_parm3
			f_cargar_presolicitud(li_presol)
		End If	
	
	end if

end if
end subroutine

public subroutine f_cargar_presolicitud (long p_presol);integer li_row, li_status_sol, li_i
str_sol_material lstr_sol_material

datastore lds_pre_materiales

lds_pre_materiales =  create datastore
lds_pre_materiales.dataobject ='d_gen_mat_presolicitud'
lds_pre_materiales.settransobject(gtr_sumuia)	

lds_pre_materiales.Retrieve(gi_depto,p_presol)
li_row = lds_pre_materiales.RowCount()

if li_row>0 then
	
	li_status_sol=lds_pre_materiales.GetItemNumber(1,'spre_pre_solicitud_status_solicitud')
	
	if li_status_sol = 0 then

		idt_fecha_inicio=lds_pre_materiales.GetItemDateTime(1,'spre_pre_solicitud_fecha_inicio')
		idt_fecha_final=lds_pre_materiales.GetItemDateTime(1,'spre_pre_solicitud_fecha_fin')
		em_fecha_inicio.text=string(Date(idt_fecha_inicio))
		em_fecha_final.text=string(Date(idt_fecha_final))
		em_hora_inicio.text=string(Time(idt_fecha_inicio))
		em_hora_final.text=string(Time(idt_fecha_final))
		em_fecha_inicio.enabled=false
		em_fecha_final.enabled=false
		em_hora_inicio.enabled=false
		em_hora_final.enabled=false

		for li_i=1 to li_row
		
			lstr_sol_material.cvedepto=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_cvedepto')
			lstr_sol_material.cvearea=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_cvearea')
			lstr_sol_material.cvegrupo=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_cvegrupo')
			lstr_sol_material.cvematerial=lds_pre_materiales.GetItemString(li_i,'spre_inventario_cvematerial')
			lstr_sol_material.num_serie=lds_pre_materiales.GetItemString(li_i,'spre_inventario_num_serie')
			lstr_sol_material.nommaterial=lds_pre_materiales.GetItemString(li_i,'spre_materiales_nommaterial')
			lstr_sol_material.prestamo_unitario=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_prestamo_unitario')
			lstr_sol_material.cod_uia=lds_pre_materiales.GetItemString(li_i,'spre_inventario_cod_uia')
			lstr_sol_material.nomtamano=lds_pre_materiales.GetItemString(li_i,'spre_tamano_materiales_nomtamano')
			lstr_sol_material.nomtipo=lds_pre_materiales.GetItemString(li_i,'spre_tipo_materiales_nomtipo')
			lstr_sol_material.status=-1
			lstr_sol_material.nomstatus='PreSolicitud'
			lstr_sol_material.fecha_inicio=lds_pre_materiales.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio')
			lstr_sol_material.fecha_final=lds_pre_materiales.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin')
			lstr_sol_material.costo_mat=lds_pre_materiales.GetItemDecimal(li_i,'spre_inventario_costo_mat')
			lstr_sol_material.folio_presol=lds_pre_materiales.GetItemNumber(li_i,'spre_pre_solicitud_folio')	
			lstr_sol_material.consec_presol=lds_pre_materiales.GetItemNumber(li_i,'spre_pre_sol_materiales_consecutivo')	

			f_agregar_material_presol(lstr_sol_material,lstr_sol_material.folio_presol)
		
		next
		
	end if

	
end if
end subroutine

public subroutine f_agregar_material (str_sol_material pstr_sol_material, long p_folio_presol, integer p_rowdis);string ls_find=''
integer li_existe=0, li_row, li_i, li_nuevo, li_maximo, li_exacto=0
datastore lds_presolicitados

//Verificar que siga estando abajo de la cantidad de materiales permitidos (a menos que esté entregado)
if (ii_reservados+1) > istr_pres_permisos.materiales and istr_pres_permisos.materiales>0 then
	messagebox('Atención','Se llegó al límite de materiales que pueden reservarse.',Exclamation!)
	return
end if


//Verificar que no esté allá abajo en los solicitados
ls_find="cvegrupo="+string(pstr_sol_material.cvegrupo)+" and cvematerial='"+pstr_sol_material.cvematerial+"' and num_serie='"+string(pstr_sol_material.num_serie)+"'"
li_existe=tab_solicitud.tabpage_solicitado.dw_solicitados.Find(ls_find,1,tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())

if li_existe>0 then
	messagebox('Atención','No puede reservar el mismo material dos veces.',Exclamation!)
	return
end if


//Verificar que si es unitario no haya otro abajo
if pstr_sol_material.prestamo_unitario>0 then

	li_maximo=1
	
	for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
		if  tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'status')=0 and tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'cvegrupo')= pstr_sol_material.cvegrupo and tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'cvematerial')=pstr_sol_material.cvematerial then 
			li_maximo=li_maximo+1
		end if
	next

	for li_i=1 to tab_solicitud.tabpage_activo.dw_activos.RowCount()
		if tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'cvegrupo')= pstr_sol_material.cvegrupo and tab_solicitud.tabpage_activo.dw_activos.GetItemString(li_i,'cvematerial')=pstr_sol_material.cvematerial then 
			li_maximo=li_maximo+1
		end if
	next

	if li_maximo>pstr_sol_material.prestamo_unitario then 
		messagebox('Atención','No pueden reservarse más de '+string(pstr_sol_material.prestamo_unitario)+' unidades de este mismo material.',Exclamation!)
		return
	end if

end if


li_row=tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()

//Actualizar las fechas de los demás materiales
for li_i=1 to li_row
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_i, "fecha_inicio",pstr_sol_material.fecha_inicio)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_i, "fecha_final",pstr_sol_material.fecha_final)	
next


//Buscar un material PreSolicitado para intercambiar

li_existe=0
ls_find="cvegrupo="+string(pstr_sol_material.cvegrupo)+" and cvematerial='"+pstr_sol_material.cvematerial+"' and status=-1"
li_existe=tab_solicitud.tabpage_solicitado.dw_solicitados.Find(ls_find,1,tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())

if li_existe>0 then

	ls_find="cvegrupo="+string(pstr_sol_material.cvegrupo)+" and cvematerial='"+pstr_sol_material.cvematerial+"' and num_serie_presol='"+pstr_sol_material.num_serie +"'and status=-1"
	li_exacto=tab_solicitud.tabpage_solicitado.dw_solicitados.Find(ls_find,1,tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())
	if li_exacto>0 then li_existe=li_exacto
	
	//Sustituir
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_existe, "num_serie",pstr_sol_material.num_serie)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_existe, "nomtipo",pstr_sol_material.nomtipo)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_existe, "nomtamano",pstr_sol_material.nomtamano)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_existe, "status",pstr_sol_material.status)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_existe, "nomstatus",pstr_sol_material.nomstatus)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_existe, "cod_uia",pstr_sol_material.cod_uia)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_existe, "costo_mat",pstr_sol_material.costo_mat)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_existe, "cbox",0)	
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_existe, "color",0)

else

	//Agregar el material
	li_nuevo=li_row+1
	
	tab_solicitud.tabpage_solicitado.dw_solicitados.insertrow(0)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cvedepto",pstr_sol_material.cvedepto)	
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cvearea",pstr_sol_material.cvearea)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cvegrupo",pstr_sol_material.cvegrupo)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cvematerial",pstr_sol_material.cvematerial)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "num_serie",pstr_sol_material.num_serie)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "nommaterial",pstr_sol_material.nommaterial)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "nomtipo",pstr_sol_material.nomtipo)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "nomtamano",pstr_sol_material.nomtamano)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "status",pstr_sol_material.status)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "nomstatus",pstr_sol_material.nomstatus)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "fecha_inicio",pstr_sol_material.fecha_inicio)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "fecha_final",pstr_sol_material.fecha_final)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cod_uia",pstr_sol_material.cod_uia)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "folio_presol",pstr_sol_material.folio_presol)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "costo_mat",pstr_sol_material.costo_mat)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "consec_presol",pstr_sol_material.consec_presol)
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cbox",0)	
	
end if

tab_solicitud.tabpage_solicitado.dw_solicitados.SetSort("#8A #6A")
tab_solicitud.tabpage_solicitado.dw_solicitados.Sort()

//Hacer NO disponible en el inventario

ls_find="spre_inventario_cvegrupo="+string(pstr_sol_material.cvegrupo)+" and spre_inventario_cvematerial='"+pstr_sol_material.cvematerial+"' and spre_inventario_num_serie='"+string(pstr_sol_material.num_serie)+"'"
li_existe=dw_inventario_disponible.Find(ls_find,1,dw_inventario_disponible.RowCount())
if li_existe>0 then dw_inventario_disponible.SetItem(li_existe,'marcado',1)


tab_solicitud.tabpage_solicitado.cb_eliminar.enabled=true
cb_generar.enabled=true

if p_rowdis>0 then dw_disponible.DeleteRow(p_rowdis)

tab_solicitud.tabpage_solicitado.text='Solicitado ('+string(tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())+')'

end subroutine

public subroutine f_generar_solicitud ();integer NET, li_i, li_consec, li_error=0, li_existe
datetime ldt_fecha_inicio, ldt_fecha_final
long ll_folio=0, ll_presol=0
integer li_row, li_cvegrupo, li_presol_consec[], li_j=0, ll_j
string ls_find, ls_cvematerial, ls_num_serie, ls_nommaterial, ls_presol_num_serie[]
datastore lds_reservados

tab_solicitud.tabpage_solicitado.dw_solicitados.SetFilter('status=0')
tab_solicitud.tabpage_solicitado.dw_solicitados.Filter()
	
if tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount() > 0 then	

	//Revisar que todas sigan disponibles
	
	lds_reservados =  create datastore
	ldt_fecha_inicio=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemDateTime(1,'fecha_inicio')
	ldt_fecha_final=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemDateTime(1,'fecha_final')

	lds_reservados.dataobject ='d_gen_mat_reservados'
	lds_reservados.settransobject(gtr_sumuia)	

	lds_reservados.Retrieve(gi_depto,gi_area,ldt_fecha_inicio,ldt_fecha_final)
	li_row = lds_reservados.Rowcount()
	
	if li_row>0 then
	
		for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
			
			tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_i,'color',0)
				
				li_cvegrupo=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'cvegrupo')
				ls_cvematerial=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'cvematerial')
				ls_num_serie=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'num_serie')
				ls_nommaterial=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'nommaterial')
				
				ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
				li_existe=lds_reservados.Find(ls_find,1,li_row)
				
				if li_existe>0 then 
					messagebox('Atención','El material '+ls_nommaterial+' '+ls_num_serie+' ya no se encuentra disponible.',stopsign!)
					tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_i,'color',1)
					li_error=-1
				end if
				
		next
		
		if li_error=-1 then goto error
		
	end if
	

	//Insertar

	li_i=1
	for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()

		if ll_folio=0 then

			//Insertar Solicitud
			ll_folio=f_insert_solicitud()
			if ll_folio=-1 then 
				li_error=1
				goto error
			else
				if f_insert_solicitante(ll_folio) = -1 then
					li_error=1
					goto error
				end if
			end if
			
		end if
			//Insertar material
			li_consec=f_insert_material(li_i,ll_folio)
			if li_consec=-1 then
				li_error=1
				goto error
			end if
			
			if tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'folio_presol')>0 then 
				ll_presol=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'folio_presol')
				li_j=li_j+1
				li_presol_consec[li_j]=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'consec_presol')
				ls_presol_num_serie[li_j]=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'num_serie')
			end if
		
	next


	if ll_presol>0 then
		//Update presol
		
		update dbo.spre_pre_solicitud
		set status=1,
		folio_prestamo=:ll_folio
		where cvedepto=:gi_depto and folio=:ll_presol
		using gtr_sumuia;
		
		if gtr_sumuia.SQLCode = -1 then 
			messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)	
			rollback using gtr_sumuia;
		else
			commit using gtr_sumuia;	
		end if
	
		for li_i=1 to li_j
			
			update dbo.spre_pre_sol_materiales
			set status=1,
			num_serie=:ls_presol_num_serie[li_i]
			where cvedepto=:gi_depto and folio=:ll_presol
			and consecutivo=:li_presol_consec[li_i]
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)	
				rollback using gtr_sumuia;
			else
				commit using gtr_sumuia;	
			end if
			
		next
	
	end if
	
	NET = messagebox('Mensaje del Sistema','Los Registros han sido actualizados con éxito con el folio '+string(ll_folio)+'. ¿Desea imprimir la solicitud del material?',Question!, yesno!, 2)
	f_reset_solicitud()
	
		if NET = 1 then
			dw_reporte_mat.dataobject = 'd_gen_rep_solicitud_mat'
			if gi_depto <> 4 then dw_reporte_mat.Modify("t_39.text='"+gs_depto+"'")
			dw_reporte_mat.SettransObject(gtr_sumuia)
			dw_reporte_mat.Retrieve(gi_depto,ll_folio,gi_area)
			if dw_reporte_mat.RowCount() > 0 then dw_reporte_mat.Print()
		end if
	
	error:
	
	if li_error=1 then
		messagebox('Atención','La solicitud no pudo ser registrada correctamente',stopsign!)
	end if

else
	
	messagebox('Atención','Ningún material ha sido solicitado.')

end if

tab_solicitud.tabpage_solicitado.dw_solicitados.SetFilter('')
tab_solicitud.tabpage_solicitado.dw_solicitados.Filter()
end subroutine

public subroutine f_cargar_solicitud (long p_folio, long p_foliopresol);integer li_row, li_i, li_nuevo=0, li_estatus, li_existe, li_activos, li_entregados, li_consec_presol
string ls_find
datastore lds_solicitud_materiales, lds_pre_materiales
str_sol_material lstr_sol_material


lds_solicitud_materiales =  create datastore
lds_solicitud_materiales.dataobject ='d_gen_solicitud_materiales'
lds_solicitud_materiales.settransobject(gtr_sumuia)	

lds_solicitud_materiales.Retrieve(gi_depto,p_folio)
li_row = lds_solicitud_materiales.Rowcount()

idt_fecha_inicio=lds_solicitud_materiales.GetItemDateTime(1,'spre_sol_materiales_fecha_inicio')
idt_fecha_final=lds_solicitud_materiales.GetItemDateTime(1,'spre_sol_materiales_fecha_final')
em_fecha_inicio.text=string(Date(idt_fecha_inicio))
em_fecha_final.text=string(Date(idt_fecha_final))
em_hora_inicio.text=string(Time(idt_fecha_inicio))
em_hora_final.text=string(Time(idt_fecha_final))
em_fecha_inicio.enabled=false
em_fecha_final.enabled=false
em_hora_inicio.enabled=false
em_hora_final.enabled=false

tab_solicitud.tabpage_solicitado.dw_solicitados.Reset()
tab_solicitud.tabpage_activo.dw_activos.Reset()
tab_solicitud.tabpage_entregado.dw_entregados.Reset()

cb_generar.text='Agregar'
ii_edita=1
il_folio_prestamo=p_folio

//Extraer Activos

lds_solicitud_materiales.SetFilter("spre_sol_materiales_status=0")
lds_solicitud_materiales.Filter()

li_row = lds_solicitud_materiales.Rowcount()
li_nuevo=0

if li_row>0 then tab_solicitud.tabpage_activo.cb_entregar.enabled=true

for li_i=1 to li_row
	
	li_nuevo++
	tab_solicitud.tabpage_activo.dw_activos.insertrow(0)
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "cvedepto",gi_depto)	
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "cvearea",gi_area)
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "cvegrupo",lds_solicitud_materiales.GetItemNumber(li_i,'spre_sol_materiales_cvegrupo'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "cvematerial",lds_solicitud_materiales.GetItemString(li_i,'spre_sol_materiales_cvematerial'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "num_serie",lds_solicitud_materiales.GetItemString(li_i,'spre_sol_materiales_num_serie'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "nommaterial",lds_solicitud_materiales.GetItemString(li_i,'spre_grupo_material_grupomaterial'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "nomtipo",lds_solicitud_materiales.GetItemString(li_i,'spre_tipo_materiales_tipomaterial'))	
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "nomtamano",lds_solicitud_materiales.GetItemString(li_i,'spre_tamano_materiales_tamanomaterial'))	
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "status",0)
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "nomstatus",'Activo')
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "fecha_inicio",lds_solicitud_materiales.GetItemDateTime(li_i,'spre_sol_materiales_fecha_inicio'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "fecha_final",lds_solicitud_materiales.GetItemDateTime(li_i,'spre_sol_materiales_fecha_final'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "cod_uia",lds_solicitud_materiales.GetItemString(li_i,'spre_inventario_cod_uia'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "costo_mat",lds_solicitud_materiales.GetItemString(li_i,'spre_inventario_costo_mat'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "multa",lds_solicitud_materiales.GetItemDecimal(li_i,'spre_materiales_multa'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "folio_solicitud",p_folio)
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "consec_solicitud",lds_solicitud_materiales.GetItemNumber(li_i,'spre_sol_materiales_consecutivo'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "folio_presol",0)
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "consec_presol",0)
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "cbox",0)
			
next

lds_solicitud_materiales.SetFilter("")
lds_solicitud_materiales.Filter()


//Extraer Entregados

lds_solicitud_materiales.SetFilter("spre_sol_materiales_status=1")
lds_solicitud_materiales.Filter()

li_row = lds_solicitud_materiales.Rowcount()
li_nuevo=0

tab_solicitud.tabpage_entregado.dw_entregados.object.cbox.visible=false

for li_i=1 to li_row
	
	li_nuevo++
	
	tab_solicitud.tabpage_entregado.dw_entregados.insertrow(0)
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "cvedepto",gi_depto)	
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "cvearea",gi_area)
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "cvegrupo",lds_solicitud_materiales.GetItemNumber(li_i,'spre_sol_materiales_cvegrupo'))
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "cvematerial",lds_solicitud_materiales.GetItemString(li_i,'spre_sol_materiales_cvematerial'))
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "num_serie",lds_solicitud_materiales.GetItemString(li_i,'spre_sol_materiales_num_serie'))
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "nommaterial",lds_solicitud_materiales.GetItemString(li_i,'spre_grupo_material_grupomaterial'))
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "nomtipo",lds_solicitud_materiales.GetItemString(li_i,'spre_tipo_materiales_tipomaterial'))	
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "nomtamano",lds_solicitud_materiales.GetItemString(li_i,'spre_tamano_materiales_tamanomaterial'))	
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "status",1)
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "nomstatus",'Entregado')
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "fecha_inicio",lds_solicitud_materiales.GetItemDateTime(li_i,'spre_sol_materiales_fecha_inicio'))
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "fecha_final",lds_solicitud_materiales.GetItemDateTime(li_i,'spre_sol_materiales_fecha_final'))
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "cod_uia",lds_solicitud_materiales.GetItemString(li_i,'spre_inventario_cod_uia'))
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "costo_mat",lds_solicitud_materiales.GetItemString(li_i,'spre_inventario_costo_mat'))
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "folio_solicitud",p_folio)
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "consec_solicitud",lds_solicitud_materiales.GetItemNumber(li_i,'spre_sol_materiales_consecutivo'))
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "folio_presol",0)
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "consec_presol",0)
			
next

lds_solicitud_materiales.SetFilter("")
lds_solicitud_materiales.Filter()

li_activos=tab_solicitud.tabpage_activo.dw_activos.RowCount()
li_entregados=tab_solicitud.tabpage_entregado.dw_entregados.RowCount()

//Extraer PreSolicitud

lds_pre_materiales =  create datastore
lds_pre_materiales.dataobject ='d_gen_mat_presolicitud'
lds_pre_materiales.settransobject(gtr_sumuia)	

lds_pre_materiales.Retrieve(gi_depto,p_foliopresol)
li_row = lds_pre_materiales.RowCount()

if li_row>0 then
	
	il_folio_presolicitud=p_foliopresol
	
	
	for li_i=1 to li_row
		
		li_estatus=lds_pre_materiales.GetItemNumber(li_i,'spre_pre_sol_materiales_status_material')
		li_consec_presol=lds_pre_materiales.GetItemNumber(li_i,'spre_pre_sol_materiales_consecutivo')
		
		choose case li_estatus
				
			case 0
				//Pendiente
				lstr_sol_material.cvedepto=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_cvedepto')
				lstr_sol_material.cvearea=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_cvearea')
				lstr_sol_material.cvegrupo=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_cvegrupo')
				lstr_sol_material.cvematerial=lds_pre_materiales.GetItemString(li_i,'spre_inventario_cvematerial')
				lstr_sol_material.num_serie=lds_pre_materiales.GetItemString(li_i,'spre_inventario_num_serie')
				lstr_sol_material.nommaterial=lds_pre_materiales.GetItemString(li_i,'spre_materiales_nommaterial')
				lstr_sol_material.nomtipo=lds_pre_materiales.GetItemString(li_i,'spre_tipo_materiales_nomtipo')	
				lstr_sol_material.nomtamano=lds_pre_materiales.GetItemString(li_i,'spre_tamano_materiales_nomtamano')	
				lstr_sol_material.prestamo_unitario=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_prestamo_unitario')
				lstr_sol_material.cod_uia=lds_pre_materiales.GetItemString(li_i,'spre_inventario_cod_uia')
				lstr_sol_material.status=-1
				lstr_sol_material.nomstatus='PreSolicitud'
				lstr_sol_material.fecha_inicio=lds_pre_materiales.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio')
				lstr_sol_material.fecha_final=lds_pre_materiales.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin')
				lstr_sol_material.costo_mat=lds_pre_materiales.GetItemDecimal(li_i,'spre_inventario_costo_mat')
				lstr_sol_material.folio_presol=lds_pre_materiales.GetItemNumber(li_i,'spre_pre_solicitud_folio')	
				lstr_sol_material.consec_presol=lds_pre_materiales.GetItemNumber(li_i,'spre_pre_sol_materiales_consecutivo')	
		
				f_agregar_material_presol(lstr_sol_material,lstr_sol_material.folio_presol)

			case 1
				//Procesada
				lstr_sol_material.cvegrupo=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_cvegrupo')
				lstr_sol_material.cvematerial=lds_pre_materiales.GetItemString(li_i,'spre_inventario_cvematerial')
				lstr_sol_material.num_serie=lds_pre_materiales.GetItemString(li_i,'spre_inventario_num_serie')
				lstr_sol_material.cod_uia=lds_pre_materiales.GetItemString(li_i,'spre_inventario_cod_uia')
				
				ls_find="cvegrupo="+string(lstr_sol_material.cvegrupo)+" and cvematerial='"+lstr_sol_material.cvematerial+"' and num_serie='"+lstr_sol_material.num_serie+"'"/*+"' and cod_uia='"+lstr_sol_material.cod_uia+"'"*/
				li_existe=tab_solicitud.tabpage_activo.dw_activos.Find(ls_find,1,li_activos)

				tab_solicitud.tabpage_activo.dw_activos.SetItem(li_existe,'folio_presol',p_foliopresol)
				tab_solicitud.tabpage_activo.dw_activos.SetItem(li_existe,'consec_presol',li_consec_presol)

			case 3
				//Entregada
				lstr_sol_material.cvegrupo=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_cvegrupo')
				lstr_sol_material.cvematerial=lds_pre_materiales.GetItemString(li_i,'spre_inventario_cvematerial')
				lstr_sol_material.num_serie=lds_pre_materiales.GetItemString(li_i,'spre_inventario_num_serie')
				lstr_sol_material.cod_uia=lds_pre_materiales.GetItemString(li_i,'spre_inventario_cod_uia')
				
				ls_find="cvegrupo="+string(lstr_sol_material.cvegrupo)+" and cvematerial='"+lstr_sol_material.cvematerial+"' and num_serie='"+lstr_sol_material.num_serie+"'"/*+"' and cod_uia='"+lstr_sol_material.cod_uia+"'"*/
				li_existe=tab_solicitud.tabpage_entregado.dw_entregados.Find(ls_find,1,li_entregados)

				tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_existe,'folio_presol',p_foliopresol)
				tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_existe,'consec_presol',li_consec_presol)
				
		end choose
	
	next
	
end if

tab_solicitud.tabpage_solicitado.text='Solicitado ('+string(tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())+')'
tab_solicitud.tabpage_activo.text='Activo ('+string(tab_solicitud.tabpage_activo.dw_activos.RowCount())+')'
tab_solicitud.tabpage_entregado.text='Entregado ('+string(tab_solicitud.tabpage_entregado.dw_entregados.RowCount())+')'


this.title='Préstamo de Materiales DISEÑO [Folio: '+string(p_folio)+']'
end subroutine

public subroutine f_actualizar_materiales ();integer NET, li_i, li_consec, li_error=0, li_existe
datetime ldt_fecha_inicio, ldt_fecha_final
long ll_folio=0, ll_presol=0
integer li_row, li_cvegrupo, li_presol_consec[], li_j=0, ll_j
string ls_find, ls_cvematerial, ls_num_serie, ls_nommaterial, ls_presol_num_serie[]
datastore lds_reservados


tab_solicitud.tabpage_solicitado.dw_solicitados.SetFilter('status=0')
tab_solicitud.tabpage_solicitado.dw_solicitados.Filter()


if tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount() > 0 then	

	ll_folio=il_folio_prestamo
	
	//Revisar que todas sigan disponibles
	
	lds_reservados =  create datastore
	ldt_fecha_inicio=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemDateTime(1,'fecha_inicio')
	ldt_fecha_final=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemDateTime(1,'fecha_final')
	
	lds_reservados.dataobject ='d_gen_mat_reservados'
	lds_reservados.settransobject(gtr_sumuia)	
	
	lds_reservados.Retrieve(gi_depto,gi_area,ldt_fecha_inicio,ldt_fecha_final)
	li_row = lds_reservados.Rowcount()
	
	if li_row>0 then
	
		for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
			
			tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_i,'color',0)
				
				li_cvegrupo=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'cvegrupo')
				ls_cvematerial=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'cvematerial')
				ls_num_serie=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'num_serie')
				ls_nommaterial=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'nommaterial')
				
				ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
				li_existe=lds_reservados.Find(ls_find,1,li_row)
				
				if li_existe>0 then 
					messagebox('Atención','El material '+ls_nommaterial+' '+ls_num_serie+' ya no se encuentra disponible.',stopsign!)
					tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_i,'color',1)
					li_error=-1
				end if
				
		next
		
		if li_error=-1 then goto error
		
	end if
	
	
	//Insertar
	
	li_i=1
	
	for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
			
		//Insertar material
		li_consec=f_insert_material(li_i,ll_folio)
		if li_consec=-1 then
			li_error=1
			goto error
		end if
		
		if tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'folio_presol')>0 then 
			ll_presol=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'folio_presol')
			li_j=li_j+1
			li_presol_consec[li_j]=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'consec_presol')
			ls_presol_num_serie[li_j]=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'num_serie')
		end if
	
	next
	
	
	if ll_presol>0 then
		//Update presol
		
		update dbo.spre_pre_solicitud
		set status=1,
		folio_prestamo=:ll_folio
		where cvedepto=:gi_depto and folio=:ll_presol
		using gtr_sumuia;
		
		if gtr_sumuia.SQLCode = -1 then 
			messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)	
			rollback using gtr_sumuia;
		else
			commit using gtr_sumuia;	
		end if
	
		for li_i=1 to li_j
			
			update dbo.spre_pre_sol_materiales
			set status=1,
			num_serie=:ls_presol_num_serie[li_i]
			where cvedepto=:gi_depto and folio=:ll_presol
			and consecutivo=:li_presol_consec[li_i]
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)	
				rollback using gtr_sumuia;
			else
				commit using gtr_sumuia;	
			end if
			
		next
	
	end if
	
	NET = messagebox('Mensaje del Sistema','Los Registros han sido actualizados con éxito con el folio '+string(ll_folio)+'. ¿Desea imprimir la solicitud del material?',Question!, yesno!, 2)
	
	if  tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()>0 then
		ll_presol=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(1,'folio_presol')
	end if
	
	f_cargar_solicitud(ll_folio,ll_presol)
	tab_solicitud.selectedtab=1
	
	
		if NET = 1 then
			dw_reporte_mat.dataobject = 'd_gen_rep_solicitud_mat'
			if gi_depto <> 4 then dw_reporte_mat.Modify("t_39.text='"+gs_depto+"'")
			dw_reporte_mat.SettransObject(gtr_sumuia)
			dw_reporte_mat.Retrieve(gi_depto,ll_folio,gi_area)
			if dw_reporte_mat.RowCount() > 0 then dw_reporte_mat.Print()
		end if
	
	error:
	
	if li_error=1 then
		messagebox('Atención','La solicitud no pudo ser registrada correctamente',stopsign!)
	end if
	
else
	
	messagebox('Atención','Ningún material ha sido solicitado.')

end if

tab_solicitud.tabpage_solicitado.dw_solicitados.SetFilter('')
tab_solicitud.tabpage_solicitado.dw_solicitados.Filter()
end subroutine

public function long f_insert_solicitante (long p_folio);string ls_sol_nombre, ls_sol_telefono, ls_sol_grupo, ls_sol_profesor
datetime ldt_fecha_hoy

ldt_fecha_hoy= DateTime(today(),now())

ls_sol_nombre=dw_solicitante.GetItemString(1,'solicitantenombre')
ls_sol_telefono=dw_solicitante.GetItemString(1,'telefono')
ls_sol_grupo=dw_solicitante.GetItemString(1,'materianombre')
ls_sol_profesor=dw_solicitante.GetItemString(1,'profesornombre')

	//Insertar Solicitud
	insert into dbo.spre_prestamo_material
	(cvedepto, folio, tipo_prestamo, solicitanteid, solicitantenombre,
	solicitantetel, solicitantegrupo, solicitanteprofesor, fechacarga, usuario)

	values
	(:gi_depto, :p_folio, :ii_tipo_usuario, :il_solicitante, :ls_sol_nombre,
	:ls_sol_telefono, :ls_sol_grupo, :ls_sol_profesor, :ldt_fecha_hoy, :gs_usuario)

	using gtr_sumuia;	
	
	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al insertar solicitante a la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;
	end if	

return(1)


end function

public subroutine f_agregar_material_presol (str_sol_material pstr_sol_material, long p_folio_presol);string ls_find=''
integer li_existe=0, li_row, li_i, li_nuevo, li_maximo
datastore lds_presolicitados


li_row=tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()

li_nuevo=li_row+1

tab_solicitud.tabpage_solicitado.dw_solicitados.insertrow(0)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cvedepto",pstr_sol_material.cvedepto)	
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cvearea",pstr_sol_material.cvearea)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cvegrupo",pstr_sol_material.cvegrupo)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cvematerial",pstr_sol_material.cvematerial)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "num_serie_presol",pstr_sol_material.num_serie)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "nommaterial",pstr_sol_material.nommaterial)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "nomtipo",pstr_sol_material.nomtipo)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "nomtamano",pstr_sol_material.nomtamano)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "status",pstr_sol_material.status)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "nomstatus",pstr_sol_material.nomstatus)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "fecha_inicio",pstr_sol_material.fecha_inicio)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "fecha_final",pstr_sol_material.fecha_final)
//tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cod_uia",pstr_sol_material.cod_uia)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "folio_presol",pstr_sol_material.folio_presol)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "costo_mat",pstr_sol_material.costo_mat)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "consec_presol",pstr_sol_material.consec_presol)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cbox",0)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "color",2)

tab_solicitud.tabpage_solicitado.cb_eliminar.enabled=true

tab_solicitud.tabpage_solicitado.text='Solicitado ('+string(tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())+')'

end subroutine

public subroutine f_marca_tipo_usuario ();integer li_existe
string ls_find

if dw_tipo_usuario.RowCount()>0 then 
	ls_find="cve_tipo_usuario="+string(ii_tipo_usuario)
	li_existe=dw_tipo_usuario.Find(ls_find,1,dw_tipo_usuario.RowCount())
	if li_existe>0 then dw_tipo_usuario.ScrollToRow(li_existe)
end if

end subroutine

public function integer f_valida_exalumno (string p_cuenta);integer li_pos, li_existe=0, li_valida
string ls_cuenta, ls_digito
long ll_cuenta

li_pos=pos(p_cuenta,'-')

if li_pos>0 then
	ls_cuenta=left(p_cuenta,len(p_cuenta) - 2)
	ls_digito=right(p_cuenta,1)
else
	ls_cuenta=left(p_cuenta,len(p_cuenta) - 1)
	ls_digito=right(p_cuenta,1)
end if


//Confirma Dígito
if isNumber(ls_cuenta) then
	ll_cuenta=long(ls_cuenta)
	il_solicitante=ll_cuenta
	if f_valida_digito_alumno(ll_cuenta,ls_digito)>0 then li_existe=1
end if


//Valida acceso
if li_existe=1 then
	
	li_valida=f_valida_exalumno(ll_cuenta,is_solicitantenom)
	
	choose case li_valida
		case -1
			messagebox('Aviso I','La cuenta de exalumno '+string(il_solicitante)+' no es válida.')
			return (-1)			
		case 0
			return (1)			
	end choose

	if (f_valida_mat_exalumno_depto(ll_cuenta,gi_deptocoor, ii_anio,ii_periodo))=0 then return(2)
	
else
	messagebox('Aviso II','La cuenta de exalumno '+string(il_solicitante)+' no es válida.')
	return (-1)	
end if

return (0)
end function

public function integer f_valida_alumno_dec (string p_cuenta);integer li_existe=0, li_valida
long ll_cuenta

if isNumber(p_cuenta) then
	ll_cuenta=long(p_cuenta)
	il_solicitante=ll_cuenta
	li_existe=1
end if

if li_existe=1 then
	
	li_valida=f_valida_alumno_dec(ll_cuenta,is_solicitantenom)

	choose case li_valida
		case -1
			messagebox('Aviso I','La cuenta de alumno DEC '+string(il_solicitante)+' no es válida.')
			return (-1)			
	end choose
	
	return(2)
	
else
	messagebox('Aviso II','La cuenta de alumno DEC'+string(il_solicitante)+' no es válida.')
	return (-1)	
end if

return (0)
end function

public function decimal f_calcular_multa (decimal p_multa, datetime p_fecha_final);decimal ldc_importe=0
date ld_fecha_final, ld_fecha_entrega
integer li_inhabil=0, li_fines=0, li_dias=0

ld_fecha_final=Date(p_fecha_final)
ld_fecha_entrega=Today()

if ld_fecha_final=ld_fecha_entrega then
	//Retraso de horas
	ldc_importe=0
else	
//	Retraso de días
	li_inhabil=f_select_cuenta_inhabil(ld_fecha_final,ld_fecha_entrega,gi_depto,gi_area)
	li_fines=f_calcula_finesdesemana(ld_fecha_final,ld_fecha_entrega)
	li_dias=DaysAfter(ld_fecha_final,ld_fecha_entrega) - li_inhabil - li_fines
	ldc_importe=p_multa * li_dias
end if

if isNull(ldc_importe) then ldc_importe=0

return (ldc_importe)
end function

public function long f_buscar_multa_folio (long p_folio);long ll_folio_multa=0

select max(folio_multa)
into :ll_folio_multa
from dbo.spre_multas
where cvedepto =:gi_depto
and folio=:p_folio
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener Folio de multa", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
else
	commit using gtr_sumuia;	
end if
	
if isnull(ll_folio_multa) then ll_folio_multa=0

return(ll_folio_multa)
end function

public function long f_insert_multa (long p_folio_solicitud);long ll_folio_multa
datetime ldt_ahorita

ldt_ahorita=DateTime(Today(),Now())

	//Nuevo Folio de multa
	ll_folio_multa=0

	select max(folio_multa)
	into :ll_folio_multa
	from dbo.spre_multas 
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener Máximo Folio Multa", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		ll_folio_multa=0
		goto salir
	else
		commit using gtr_sumuia;	
	end if
	
	ll_folio_multa=ll_folio_multa+1
	
	//Insertar multa
	insert into dbo.spre_multas
	(folio_multa, folio, importe, saldo, cvedepto, fcaja, foperacion, fcorte, fechacarga, usuario)
	 
	values
	(:ll_folio_multa,:p_folio_solicitud,0,0,:gi_depto,0,0,0,:ldt_ahorita,:gs_usuario)

	using gtr_sumuia;	

	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al insertar multa: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		goto salir
	else
		commit using gtr_sumuia;
	end if	
			
salir:
return(ll_folio_multa)


end function

public function long f_insert_multa_material (integer p_row, long p_folio_multa, decimal p_importe);long ll_id_multa
integer li_cvegrupo
string ls_cvematerial, ls_num_serie

//Material de multa
ll_id_multa=0

select max(id_multa)
into :ll_id_multa
from dbo.spre_materiales_multas 
using gtr_sumuia; 
		
if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener Máximo Id Multa", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return(0)
else
	commit using gtr_sumuia;	
end if

	
ll_id_multa=ll_id_multa+1

li_cvegrupo=tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(p_row,'cvegrupo')
ls_cvematerial=tab_solicitud.tabpage_activo.dw_activos.GetItemString(p_row,'cvematerial')
ls_num_serie=tab_solicitud.tabpage_activo.dw_activos.GetItemString(p_row,'num_serie')


//Insertar Material
insert into dbo.spre_materiales_multas
(id_multa, folio_multa, cvedepto, cvearea, cvematerial, cvegrupo, num_serie, status, importe)

values
(:ll_id_multa, :p_folio_multa, :gi_depto, :gi_area, :ls_cvematerial, :li_cvegrupo, :ls_num_serie, 0,:p_importe)

using gtr_sumuia;	

if gtr_sumuia.sqlcode<>0 then
	
	messagebox("Error al insertar multa material: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
	return(0)
	
else

	update dbo.spre_multas
	set importe=importe+:p_importe,
	saldo=saldo+:p_importe
	where folio_multa=:p_folio_multa
	using gtr_sumuia;
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Actualizar multa", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return (0)
	else
		commit using gtr_sumuia;
		messagebox('Atención','Multa generada exitosamente.')
		return(1)
	end if	

end if


end function

public subroutine f_cerrar_solicitud ();long ll_folio_solicitud, ll_folio_presol
integer li_solicitado, li_activo, li_entregado, li_multa, li_status

li_status=1
li_solicitado=tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
li_activo=tab_solicitud.tabpage_activo.dw_activos.RowCount()
li_entregado=tab_solicitud.tabpage_entregado.dw_entregados.RowCount()

tab_solicitud.tabpage_activo.dw_activos.SetFilter("status=3")
tab_solicitud.tabpage_activo.dw_activos.Filter()

li_multa=tab_solicitud.tabpage_activo.dw_activos.RowCount()

tab_solicitud.tabpage_activo.dw_activos.SetFilter("")
tab_solicitud.tabpage_activo.dw_activos.Filter()

if li_multa>0 then
	
	li_status=3
	ll_folio_solicitud=tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(1,'folio_solicitud')

	update dbo.spre_solicitud
	set status=:li_status
	where cvedepto=:gi_depto
	and folio=:ll_folio_solicitud	
	using gtr_sumuia;

	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Solicitud a multa", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
	else
		commit using gtr_sumuia;	
	end if		
		
end if

if li_activo=0 and li_entregado>0 then

	ll_folio_solicitud=tab_solicitud.tabpage_entregado.dw_entregados.GetItemNumber(1,'folio_solicitud')
	ll_folio_presol=tab_solicitud.tabpage_entregado.dw_entregados.GetItemNumber(1,'folio_presol')	
	
	//Cerrar Solicitud
	update dbo.spre_solicitud
	set status=:li_status
	where cvedepto=:gi_depto
	and folio=:ll_folio_solicitud	
	using gtr_sumuia;

	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Cerrar Solicitud", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
	else
		commit using gtr_sumuia;	
	end if	
	
	//Cerrar PreSolicitud
	update dbo.spre_pre_solicitud
	set status=3
	where cvedepto=:gi_depto
	and folio=:ll_folio_presol
	using gtr_sumuia;

	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Cerrar PreSolicitud", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
	else
		commit using gtr_sumuia;	
	end if	
	
end if


end subroutine

on w_dis_prestamo_material.create
this.ole_1=create ole_1
this.dw_tipo_usuario=create dw_tipo_usuario
this.st_1=create st_1
this.dw_tamano=create dw_tamano
this.st_tamano=create st_tamano
this.dw_tipo=create dw_tipo
this.st_tipo=create st_tipo
this.tab_solicitud=create tab_solicitud
this.st_cod_uia=create st_cod_uia
this.dw_reporte_mat=create dw_reporte_mat
this.sle_cod_agregar=create sle_cod_agregar
this.dw_matgrupo=create dw_matgrupo
this.dw_grupomat=create dw_grupomat
this.st_grupo=create st_grupo
this.cb_cerrar=create cb_cerrar
this.dw_disponible=create dw_disponible
this.cb_buscar=create cb_buscar
this.st_material=create st_material
this.st_3=create st_3
this.st_2=create st_2
this.em_hora_final=create em_hora_final
this.em_fecha_final=create em_fecha_final
this.st_final=create st_final
this.em_hora_inicio=create em_hora_inicio
this.em_fecha_inicio=create em_fecha_inicio
this.st_inicio=create st_inicio
this.dw_solicitante=create dw_solicitante
this.cb_materias=create cb_materias
this.dw_foto=create dw_foto
this.st_cuenta=create st_cuenta
this.sle_solicitante=create sle_solicitante
this.gb_busqueda=create gb_busqueda
this.gb_solicitud=create gb_solicitud
this.gb_material=create gb_material
this.gb_seleccionado=create gb_seleccionado
this.gb_disponible=create gb_disponible
this.gb_agregar=create gb_agregar
this.gb_solicitante=create gb_solicitante
this.dw_inventario_disponible=create dw_inventario_disponible
this.cb_generar=create cb_generar
this.Control[]={this.ole_1,&
this.dw_tipo_usuario,&
this.st_1,&
this.dw_tamano,&
this.st_tamano,&
this.dw_tipo,&
this.st_tipo,&
this.tab_solicitud,&
this.st_cod_uia,&
this.dw_reporte_mat,&
this.sle_cod_agregar,&
this.dw_matgrupo,&
this.dw_grupomat,&
this.st_grupo,&
this.cb_cerrar,&
this.dw_disponible,&
this.cb_buscar,&
this.st_material,&
this.st_3,&
this.st_2,&
this.em_hora_final,&
this.em_fecha_final,&
this.st_final,&
this.em_hora_inicio,&
this.em_fecha_inicio,&
this.st_inicio,&
this.dw_solicitante,&
this.cb_materias,&
this.dw_foto,&
this.st_cuenta,&
this.sle_solicitante,&
this.gb_busqueda,&
this.gb_solicitud,&
this.gb_material,&
this.gb_seleccionado,&
this.gb_disponible,&
this.gb_agregar,&
this.gb_solicitante,&
this.dw_inventario_disponible,&
this.cb_generar}
end on

on w_dis_prestamo_material.destroy
destroy(this.ole_1)
destroy(this.dw_tipo_usuario)
destroy(this.st_1)
destroy(this.dw_tamano)
destroy(this.st_tamano)
destroy(this.dw_tipo)
destroy(this.st_tipo)
destroy(this.tab_solicitud)
destroy(this.st_cod_uia)
destroy(this.dw_reporte_mat)
destroy(this.sle_cod_agregar)
destroy(this.dw_matgrupo)
destroy(this.dw_grupomat)
destroy(this.st_grupo)
destroy(this.cb_cerrar)
destroy(this.dw_disponible)
destroy(this.cb_buscar)
destroy(this.st_material)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_hora_final)
destroy(this.em_fecha_final)
destroy(this.st_final)
destroy(this.em_hora_inicio)
destroy(this.em_fecha_inicio)
destroy(this.st_inicio)
destroy(this.dw_solicitante)
destroy(this.cb_materias)
destroy(this.dw_foto)
destroy(this.st_cuenta)
destroy(this.sle_solicitante)
destroy(this.gb_busqueda)
destroy(this.gb_solicitud)
destroy(this.gb_material)
destroy(this.gb_seleccionado)
destroy(this.gb_disponible)
destroy(this.gb_agregar)
destroy(this.gb_solicitante)
destroy(this.dw_inventario_disponible)
destroy(this.cb_generar)
end on

event open;integer li_cuantos

f_select_anio_periodo_actual(ii_periodo,ii_anio,today())
 
dw_tipo_usuario.settransobject(gtr_sumuia)
dw_tipo_usuario.Retrieve(gi_depto,gi_area)
li_cuantos=dw_tipo_usuario.RowCount()

if ii_tipo_usuario=0 and li_cuantos>0 then ii_tipo_usuario=dw_tipo_usuario.GetItemNumber(1,'cve_tipo_usuario')
if ii_tipo_usuario=0 then sle_solicitante.enabled=false

f_marca_tipo_usuario()
 
dw_grupomat.settransobject(gtr_sumuia)
dw_grupomat.getchild('descripcion',idwc_grupomat)
idwc_grupomat.settransobject(gtr_sumuia)

dw_matgrupo.settransobject(gtr_sumuia)
dw_matgrupo.getchild('descripcion',idwc_matgrupo)
idwc_matgrupo.settransobject(gtr_sumuia)

dw_tipo.settransobject(gtr_sumuia)
dw_tipo.getchild('descripcion',idwc_tipo)
idwc_tipo.settransobject(gtr_sumuia)

dw_tamano.settransobject(gtr_sumuia)
dw_tamano.getchild('descripcion',idwc_tamano)
idwc_tamano.settransobject(gtr_sumuia)

dw_inventario_disponible.settransobject(gtr_sumuia)

f_select_prestamo_permisos(istr_pres_permisos,gi_depto,gi_area)
 
f_reset_solicitud()

timer(1.5)
end event

event timer;string a="", ls_nomina = "", ls_mensaje = "", ls_digito=""
integer li_inicializa = 0

long ll_cuenta
ii_tipo_usuario=ii_tipou_sel

IF this.windowstate = minimized! then
	If gs_lector_activ = "1" Then
		li_inicializa = ole_1.object.inicializa()
	End If
	timer (0)
ELSE
	If gs_lector_activ = "1" Then
		li_inicializa = ole_1.object.inicializa()
	End If
	
		If gs_lector_activ = "1" Then
			a=ole_1.object.LeerChipcl()
			ole_1.object.quit()
		Else 
			timer (0)
		End If

		if a <> "0" AND a <> ""  then
			
			f_reset_solicitud()
			
			choose case ii_tipo_usuario

				case 1
					//Chip de Alumno
					SELECT convert(varchar(20), A.cuenta) + D.digito as cuenta
					Into :ls_nomina
					FROM v_sce_alumnos A INNER JOIN v_sce_alumno_digito D ON A.cuenta = D.cuenta
					WHERE A.nchip_cl = :a
					Using gtr_sumuia;
						
					if gtr_sumuia.sqlcode=0 then
						sle_solicitante.text = ls_nomina
					Else
						ls_mensaje = "El número de cuenta del alumno asignado a la credencial, no es válido."
					end if	
				
				case 2
					//Chip de Intercambio
					select convert(varchar(20), no_folio_inter) as cuenta
					into  :ls_nomina
					from  dca_alumnos_ext
					where  nchip_cl = :a
					Using gtr_sumuia;
					
					if gtr_sumuia.sqlcode=0 then
						sle_solicitante.text = ls_nomina
					Else
						ls_mensaje = "El número de cuenta del alumno de intercambio asignado a la credencial, no es válido."
					end if					

				case 3
					//Chip de Profesor
					Select convert(varchar(20), empleado) as nomina
					Into :ls_nomina
					From empl_uia2   
					Where templ < 20 And tnom in (0,1,2,3)  
					And nchip_cl = :a
					Using gtr_personal;
					if gtr_personal.sqlcode=0 then
						sle_solicitante.text = ls_nomina
					Else
						ls_mensaje = "El número de nómina asignado a la credencial, ya no pertenece a la Comunidad."
					end if
					
				case 4
					//Chip de ExAlumno
					f_conectarbd_escolar()
					
					SELECT convert(varchar(20), cuenta)
					Into :ls_nomina
					FROM dbo.alumnos
					WHERE nchip_cl = :a
					Using gtr_escolar;
						
					if gtr_escolar.sqlcode=0 then
						ls_digito=f_obten_digito(integer(ls_nomina))
						sle_solicitante.text = ls_nomina+ls_digito						
					Else
						ls_mensaje = "El número de cuenta del exalumno asignado a la credencial, no es válido."
					end if						
					
					disconnect using gtr_escolar;
					
				case 5
					//Chip DEC
					f_conectarbd_decse()

					SELECT convert(varchar(20), cuenta)
					Into :ls_nomina
					FROM dbo.datpersonales
					WHERE nchip_cl = :a
					Using gtr_decse;
						
					if gtr_decse.sqlcode=0 then
						sle_solicitante.text = ls_nomina
					Else
						ls_mensaje = "El número de cuenta del alumno de DEC asignado a la credencial, no es válido."
					end if	
					
					disconnect using gtr_decse;

			end choose

		
			if (gtr_personal.sqlcode=0 or gtr_sumuia.sqlcode=0) and ls_nomina <> '' then
				commit using gtr_personal;
				setpointer(Hourglass!)
				sle_solicitante.triggerevent( "ue_usuario_busqueda")
				setpointer(Arrow!)		
			Else
				commit using gtr_personal;
				Messagebox("Aviso",ls_mensaje)
			end if
		end if

END IF

end event

event closequery;timer(1.5)
end event

event activate;timer(1.5)
end event

event deactivate;timer(0)
end event

type ole_1 from olecustomcontrol within w_dis_prestamo_material
boolean visible = false
integer x = 3233
integer y = 1306
integer width = 249
integer height = 202
integer taborder = 20
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_dis_prestamo_material.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_tipo_usuario from datawindow within w_dis_prestamo_material
integer x = 80
integer y = 118
integer width = 424
integer height = 333
integer taborder = 30
string title = "none"
string dataobject = "d_gen_cat_area_acceso_tipousuario"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then 
	ii_tipou_sel=this.GetItemNumber(currentrow,'cve_tipo_usuario')
	timer(1.5)
	sle_solicitante.SetFocus()
end if
end event

type st_1 from statictext within w_dis_prestamo_material
integer x = 300
integer y = 2570
integer width = 3087
integer height = 51
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Los artículos de Presolicitud (en azul) deben confirmarse seleccionando de Material Disponible o agregándolo con Código UIA."
boolean focusrectangle = false
end type

type dw_tamano from u_basedw within w_dis_prestamo_material
integer x = 391
integer y = 906
integer width = 1467
integer height = 77
integer taborder = 80
boolean enabled = false
string dataobject = "d_gen_mattamano_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then  il_cvetamano=long(trim(this.gettext()))

dw_disponible.Reset()

end event

type st_tamano from statictext within w_dis_prestamo_material
integer x = 66
integer y = 918
integer width = 293
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Tamaño"
boolean focusrectangle = false
end type

type dw_tipo from u_basedw within w_dis_prestamo_material
integer x = 391
integer y = 822
integer width = 1467
integer height = 77
integer taborder = 80
boolean enabled = false
string dataobject = "d_gen_mattipo_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then  il_cvetipo=long(trim(this.gettext()))
il_cvetamano=-1

dw_disponible.Reset()
dw_tamano.Reset()

idwc_tamano.Retrieve(gi_depto,gi_area,il_cvegrupo,is_cvemat,il_cvetipo)
if idwc_tamano.RowCount()>0 then 
	dw_tamano.insertrow(0)
	idwc_tamano.ScrollToRow(2)
end if
end event

type st_tipo from statictext within w_dis_prestamo_material
integer x = 66
integer y = 835
integer width = 293
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Tipo"
boolean focusrectangle = false
end type

type tab_solicitud from tab within w_dis_prestamo_material
event create ( )
event destroy ( )
integer x = 40
integer y = 1754
integer width = 3599
integer height = 758
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_solicitado tabpage_solicitado
tabpage_activo tabpage_activo
tabpage_entregado tabpage_entregado
end type

on tab_solicitud.create
this.tabpage_solicitado=create tabpage_solicitado
this.tabpage_activo=create tabpage_activo
this.tabpage_entregado=create tabpage_entregado
this.Control[]={this.tabpage_solicitado,&
this.tabpage_activo,&
this.tabpage_entregado}
end on

on tab_solicitud.destroy
destroy(this.tabpage_solicitado)
destroy(this.tabpage_activo)
destroy(this.tabpage_entregado)
end on

type tabpage_solicitado from userobject within tab_solicitud
event create ( )
event destroy ( )
integer x = 15
integer y = 90
integer width = 3569
integer height = 656
long backcolor = 30520472
string text = "Solicitado"
long tabtextcolor = 33554432
long tabbackcolor = 30520472
long picturemaskcolor = 536870912
cb_eliminar cb_eliminar
cbx_todos cbx_todos
dw_solicitados dw_solicitados
end type

on tabpage_solicitado.create
this.cb_eliminar=create cb_eliminar
this.cbx_todos=create cbx_todos
this.dw_solicitados=create dw_solicitados
this.Control[]={this.cb_eliminar,&
this.cbx_todos,&
this.dw_solicitados}
end on

on tabpage_solicitado.destroy
destroy(this.cb_eliminar)
destroy(this.cbx_todos)
destroy(this.dw_solicitados)
end on

type cb_eliminar from commandbutton within tabpage_solicitado
integer x = 3189
integer y = 122
integer width = 274
integer height = 90
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Eliminar"
end type

event clicked;integer NET, li_i, li_cvegrupo, li_existe, li_marcado=0
string ls_cvematerial, ls_num_serie, ls_nommaterial, ls_find

Net = messagebox("Atención",' ¿Desea eliminar todos los materiales marcados?', Question!, yesno!, 2)

if Net = 1 then
	
	for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
		if tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'cbox') = 1 then  li_marcado=1
	next
	
	if li_marcado=0 then
		messagebox('Atención','Debe seleccionar algún material.')
		return
	end if
	

	for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
		if tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'cbox') = 1  then	
			
			//Hacer disponible en el inventario
			li_cvegrupo=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'cvegrupo')
			ls_cvematerial=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'cvematerial')
			ls_num_serie=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'num_serie')
			ls_nommaterial=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'nommaterial')
				
			ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
			li_existe=dw_inventario_disponible.Find(ls_find,1,dw_inventario_disponible.RowCount())
			if li_existe>0 then dw_inventario_disponible.SetItem(li_existe,'marcado',0)
			
			tab_solicitud.tabpage_solicitado.dw_solicitados.DeleteRow(li_i)
			li_i=li_i -1 
		end if
	next
	tab_solicitud.tabpage_solicitado.text='Solicitado ('+string(tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())+')'

end if



end event

type cbx_todos from checkbox within tabpage_solicitado
integer x = 3193
integer y = 42
integer width = 300
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Todos"
end type

event clicked;integer li_valor, li_i

if this.checked=true then	li_valor=1 else	li_valor=0

for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount() 
	tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_i,'cbox',li_valor)
next
end event

type dw_solicitados from datawindow within tabpage_solicitado
integer x = 7
integer y = 6
integer width = 3131
integer height = 646
integer taborder = 30
string title = "none"
string dataobject = "d_gen_prestamo_materiales"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_activo from userobject within tab_solicitud
integer x = 15
integer y = 90
integer width = 3569
integer height = 656
long backcolor = 30520472
string text = "Activo"
long tabtextcolor = 33554432
long tabbackcolor = 30520472
long picturemaskcolor = 536870912
cbx_entregar cbx_entregar
cb_entregar cb_entregar
sle_cod_entregar sle_cod_entregar
st_6 st_6
dw_activos dw_activos
gb_entregar gb_entregar
end type

on tabpage_activo.create
this.cbx_entregar=create cbx_entregar
this.cb_entregar=create cb_entregar
this.sle_cod_entregar=create sle_cod_entregar
this.st_6=create st_6
this.dw_activos=create dw_activos
this.gb_entregar=create gb_entregar
this.Control[]={this.cbx_entregar,&
this.cb_entregar,&
this.sle_cod_entregar,&
this.st_6,&
this.dw_activos,&
this.gb_entregar}
end on

on tabpage_activo.destroy
destroy(this.cbx_entregar)
destroy(this.cb_entregar)
destroy(this.sle_cod_entregar)
destroy(this.st_6)
destroy(this.dw_activos)
destroy(this.gb_entregar)
end on

type cbx_entregar from checkbox within tabpage_activo
integer x = 3174
integer y = 294
integer width = 366
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Todos"
end type

event clicked;integer li_valor, li_i

if this.checked=true then	li_valor=1 else	li_valor=0

for li_i=1 to tab_solicitud.tabpage_activo.dw_activos.RowCount() 
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_i,'cbox',li_valor)
next
end event

type cb_entregar from commandbutton within tabpage_activo
integer x = 3174
integer y = 422
integer width = 282
integer height = 90
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Entregar"
end type

event clicked;integer NET, li_i, li_cvegrupo, li_existe, li_consec_solicitud, li_consec_presol, li_error=0
integer li_marcado=0, li_expirado=0, li_status
long ll_folio_solicitud, ll_folio_presol, ll_folio_multa
string ls_cvematerial, ls_num_serie, ls_nommaterial, ls_find
decimal ldc_multa, ldc_importe
datetime ldt_ahora, ldt_fecha_final, ldt_fecha_inicio

ldt_ahora=DateTime(today(),now())

Net = messagebox("Atención",' ¿Desea entregar todos los materiales marcados?', Question!, yesno!, 2)

if Net = 1 then
	
	for li_i=1 to tab_solicitud.tabpage_activo.dw_activos.RowCount()
		if tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'cbox') = 1 then  li_marcado=1
	next
	
	if li_marcado=0 then
		messagebox('Atención','Debe seleccionar algún material.')
		return
	end if
	
	
	for li_i=1 to tab_solicitud.tabpage_activo.dw_activos.RowCount()
		
		if tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'cbox') = 1  then	
			
			li_cvegrupo=tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'cvegrupo')
			ls_cvematerial=tab_solicitud.tabpage_activo.dw_activos.GetItemString(li_i,'cvematerial')
			ls_num_serie=tab_solicitud.tabpage_activo.dw_activos.GetItemString(li_i,'num_serie')
			ls_nommaterial=tab_solicitud.tabpage_activo.dw_activos.GetItemString(li_i,'nommaterial')
			ll_folio_solicitud=tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'folio_solicitud')
			li_consec_solicitud=tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'consec_solicitud')
			ll_folio_presol=tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'folio_presol')
			li_consec_presol=tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'consec_presol')
			ldt_fecha_final=tab_solicitud.tabpage_activo.dw_activos.GetItemDateTime(li_i,'fecha_final')
			ldc_multa=tab_solicitud.tabpage_activo.dw_activos.GetItemDecimal(li_i,'multa')	
			
			//Hacer disponible en el inventario	
			ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
			li_existe=dw_inventario_disponible.Find(ls_find,1,dw_inventario_disponible.RowCount())
			if li_existe>0 then dw_inventario_disponible.SetItem(li_existe,'marcado',0)
		
			//Entregar en la Solicitud
			
			update dbo.spre_sol_materiales
			set status=1,
			fecha_entrega=:ldt_ahora
			where cvedepto=:gi_depto and folio=:ll_folio_solicitud
			and consecutivo=:li_consec_solicitud
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Error SUMUIA: Entregar Material Solicitud", gtr_sumuia.SQLErrText)	
				rollback using gtr_sumuia;
				li_error=1
			else
				commit using gtr_sumuia;	
			end if
			
			
			//Entregar en la Presolicitud
			
			update dbo.spre_pre_sol_materiales
			set status=3
			where cvedepto=:gi_depto and folio=:ll_folio_presol
			and consecutivo=:li_consec_presol
			using gtr_sumuia;

			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Error SUMUIA: Entregar Material PreSolicitud", gtr_sumuia.SQLErrText)	
				rollback using gtr_sumuia;
				li_error=1
			else
				commit using gtr_sumuia;	
			end if

		end if
		
	next
	
	if li_error=0 then
		messagebox('Atención','Los materiales marcados fueron entregados con éxito.')
		
		if  tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()>0 then
			ll_folio_presol=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(1,'folio_presol')
		end if
		
		f_cargar_solicitud(ll_folio_solicitud,ll_folio_presol)
		f_cerrar_solicitud()
		tab_solicitud.selectedtab=1
	end if
	
end if

end event

type sle_cod_entregar from singlelineedit within tabpage_activo
integer x = 3185
integer y = 160
integer width = 333
integer height = 74
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

event modified;//Buscar en los activos

string ls_find
integer li_row, li_existe
str_sol_material lstr_sol_material

li_row=dw_inventario_disponible.RowCount()

if trim(this.text)<>'' then
	
	ls_find="cod_uia='"+this.text+"'"
	li_existe=tab_solicitud.tabpage_activo.dw_activos.Find(ls_find,1,li_row)

	if li_existe>0 then
		tab_solicitud.tabpage_activo.dw_activos.SetItem(li_existe,'cbox',1)
	else
		messagebox('Atención','El material '+this.text+' no lo tiene reservado o ya está entregado.',stopsign!)		
	end if
end if

this.text=''
end event

type st_6 from statictext within tabpage_activo
integer x = 3185
integer y = 93
integer width = 315
integer height = 51
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Código UIA"
boolean focusrectangle = false
end type

type dw_activos from datawindow within tabpage_activo
integer x = 7
integer y = 6
integer width = 3131
integer height = 646
integer taborder = 10
string title = "none"
string dataobject = "d_gen_prestamo_materiales"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_entregar from groupbox within tabpage_activo
integer x = 3163
integer y = 29
integer width = 384
integer height = 234
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Entregar"
end type

type tabpage_entregado from userobject within tab_solicitud
integer x = 15
integer y = 90
integer width = 3569
integer height = 656
long backcolor = 30520472
string text = "Entregado"
long tabtextcolor = 33554432
long tabbackcolor = 30520472
long picturemaskcolor = 536870912
dw_entregados dw_entregados
end type

on tabpage_entregado.create
this.dw_entregados=create dw_entregados
this.Control[]={this.dw_entregados}
end on

on tabpage_entregado.destroy
destroy(this.dw_entregados)
end on

type dw_entregados from datawindow within tabpage_entregado
integer x = 7
integer y = 6
integer width = 3131
integer height = 646
integer taborder = 10
string title = "none"
string dataobject = "d_gen_prestamo_materiales"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_cod_uia from statictext within w_dis_prestamo_material
integer x = 3222
integer y = 1094
integer width = 344
integer height = 51
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Código UIA"
boolean focusrectangle = false
end type

type dw_reporte_mat from datawindow within w_dis_prestamo_material
boolean visible = false
integer x = 3441
integer y = 1235
integer width = 102
integer height = 54
integer taborder = 10
string title = "none"
string dataobject = "d_gen_rep_solicitud_mat"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type sle_cod_agregar from singlelineedit within w_dis_prestamo_material
integer x = 3218
integer y = 1162
integer width = 333
integer height = 74
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

event modified;//Buscar en el inventario
string ls_find
integer li_row, li_existe
str_sol_material lstr_sol_material

li_row=dw_inventario_disponible.RowCount()

if trim(this.text)<>'' then
	
	ls_find="spre_inventario_cod_uia='"+this.text+"' and marcado=0"
	li_existe=dw_inventario_disponible.Find(ls_find,1,li_row)
	
	if li_existe>0 then

		lstr_sol_material.cvedepto=dw_inventario_disponible.GetItemNumber(li_existe,'spre_inventario_cvedepto')
		lstr_sol_material.cvearea=dw_inventario_disponible.GetItemNumber(li_existe,'spre_inventario_cvearea')
		lstr_sol_material.cvegrupo=dw_inventario_disponible.GetItemNumber(li_existe,'spre_inventario_cvegrupo')
		lstr_sol_material.cvematerial=dw_inventario_disponible.GetItemString(li_existe,'spre_inventario_cvematerial')
		lstr_sol_material.num_serie=dw_inventario_disponible.GetItemString(li_existe,'spre_inventario_num_serie')
		lstr_sol_material.nommaterial=dw_inventario_disponible.GetItemString(li_existe,'spre_materiales_nommaterial')
		lstr_sol_material.prestamo_unitario=dw_inventario_disponible.GetItemNumber(li_existe,'spre_inventario_prestamo_unitario')
		lstr_sol_material.cod_uia=dw_inventario_disponible.GetItemString(li_existe,'spre_inventario_cod_uia')
		lstr_sol_material.status=0
		lstr_sol_material.nomstatus='Solicitud'
		lstr_sol_material.fecha_inicio=idt_fecha_inicio
		lstr_sol_material.fecha_final=idt_fecha_final
		lstr_sol_material.costo_mat=dw_inventario_disponible.GetItemDecimal(li_existe,'spre_inventario_costo_mat')
		
		f_agregar_material(lstr_sol_material,0,0)
		
	else
		messagebox('Atención','El material '+this.text+' no existe o ya se encuentra prestado.',stopsign!)		
	end if
end if

this.text=''

tab_solicitud.selectedtab=1
end event

type dw_matgrupo from u_basedw within w_dis_prestamo_material
integer x = 391
integer y = 739
integer width = 1467
integer height = 77
integer taborder = 70
boolean enabled = false
string dataobject = "d_gen_matgrupo_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;is_cvemat=this.gettext()
il_cvetipo=-1
il_cvetamano=-1

dw_disponible.Reset()
dw_tipo.Reset()
dw_tamano.Reset()

idwc_tipo.Retrieve(gi_depto,gi_area,il_cvegrupo,is_cvemat)
if idwc_tipo.RowCount()>0 then 
	dw_tipo.insertrow(0)
	idwc_tipo.ScrollToRow(2)
end if


idwc_tamano.Retrieve(gi_depto,gi_area,il_cvegrupo,is_cvemat,il_cvetipo)
if idwc_tamano.RowCount()>0 then 
	dw_tamano.insertrow(0)
	idwc_tamano.ScrollToRow(2)
end if
end event

type dw_grupomat from u_basedw within w_dis_prestamo_material
integer x = 391
integer y = 656
integer width = 1467
integer height = 77
integer taborder = 30
boolean enabled = false
string dataobject = "d_gen_grupomat_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then  il_cvegrupo=long(trim(this.gettext()))
is_cvemat=''
dw_matgrupo.Reset()
idwc_matgrupo.Retrieve(gi_depto,gi_area,il_cvegrupo)
if idwc_matgrupo.RowCount()>0 then dw_matgrupo.insertrow(0)

dw_disponible.Reset()

end event

type st_grupo from statictext within w_dis_prestamo_material
integer x = 69
integer y = 666
integer width = 293
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Nombre"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_dis_prestamo_material
integer x = 15
integer y = 2547
integer width = 267
integer height = 90
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cerrar"
end type

event clicked;close(w_dis_prestamo_material)
end event

type dw_disponible from datawindow within w_dis_prestamo_material
integer x = 51
integer y = 1088
integer width = 3094
integer height = 570
integer taborder = 80
string dataobject = "d_dis_prestamo_disponible_com"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(gtr_sumuia)
end event

event doubleclicked;str_sol_material lstr_sol_material

lstr_sol_material.cvedepto=this.GetItemNumber(row,'spre_inventario_cvedepto')
lstr_sol_material.cvearea=this.GetItemNumber(row,'spre_inventario_cvearea')
lstr_sol_material.cvegrupo=this.GetItemNumber(row,'spre_inventario_cvegrupo')
lstr_sol_material.cvematerial=this.GetItemString(row,'spre_inventario_cvematerial')
lstr_sol_material.num_serie=this.GetItemString(row,'spre_inventario_num_serie')
lstr_sol_material.nommaterial=this.GetItemString(row,'spre_materiales_nommaterial')
lstr_sol_material.nomtipo=this.GetItemString(row,'spre_tipo_materiales_nomtipo')
lstr_sol_material.nomtamano=this.GetItemString(row,'spre_tamano_materiales_nomtamano')
lstr_sol_material.prestamo_unitario=this.GetItemNumber(row,'spre_inventario_prestamo_unitario')
lstr_sol_material.cod_uia=this.GetItemString(row,'spre_inventario_cod_uia')
lstr_sol_material.status=0
lstr_sol_material.nomstatus='Solicitud'
lstr_sol_material.fecha_inicio=idt_fecha_inicio
lstr_sol_material.fecha_final=idt_fecha_final
lstr_sol_material.costo_mat=this.GetItemDecimal(row,'spre_inventario_costo_mat')

f_agregar_material(lstr_sol_material,0,row)

tab_solicitud.selectedtab=1




end event

type cb_buscar from commandbutton within w_dis_prestamo_material
integer x = 3204
integer y = 874
integer width = 311
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Buscar"
end type

event clicked;datetime ldt_hoy, ldt_fecha_inicio, ldt_fecha_final
integer li_row, li_i, li_cvegrupo, li_existe
string ls_cvematerial, ls_num_serie, ls_nommaterial, ls_find


ldt_fecha_inicio=datetime(date(em_fecha_inicio.text),time(em_hora_inicio.text))
ldt_fecha_final=datetime(date(em_fecha_final.text),time(em_hora_final.text))
ldt_hoy=datetime(today(),time('00:00:00'))

if ldt_fecha_inicio>=ldt_fecha_final or ldt_fecha_inicio<ldt_hoy or ldt_fecha_final<=ldt_hoy then
	messagebox('Aviso','La fecha inicial debe ser menor a la final, ambas mayores a este momento.')
	return
end if

dw_disponible.SetRedraw(false)
dw_disponible.Reset()
dw_disponible.Retrieve(gi_depto,gi_area,il_cvegrupo,is_cvemat,ldt_fecha_inicio,ldt_fecha_final,il_cvetipo,il_cvetamano)
dw_disponible.SetRedraw(true)



//Solicitados, hacer NO disponible en la seleccion actual


for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
	
	li_cvegrupo=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'cvegrupo')
	ls_cvematerial=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'cvematerial')
	ls_num_serie=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'num_serie')
	ls_nommaterial=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'nommaterial')
	
	//En inventario
	ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
	li_existe=dw_disponible.Find(ls_find,1,dw_disponible.RowCount())
	if li_existe>0 then dw_disponible.DeleteRow(li_existe)

next



//Si hubo cambio de fecha, recargar inventario

if ldt_fecha_inicio<>idt_fecha_inicio or ldt_fecha_final<>idt_fecha_final then

	li_row=tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
	
	//Actualizar las fechas de los demás materiales
	for li_i=1 to li_row
		tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_i, "fecha_inicio",ldt_fecha_inicio)
		tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_i, "fecha_final",ldt_fecha_final)	
	next
	
	dw_inventario_disponible.Reset()
	dw_inventario_disponible.Retrieve(gi_depto,gi_area,idt_fecha_inicio,idt_fecha_final)
	li_row=dw_inventario_disponible.RowCount()
	
	
	//Solicitados hacer NO disponible en el inventario 
	
	for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
		
		li_cvegrupo=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'cvegrupo')
		ls_cvematerial=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'cvematerial')
		ls_num_serie=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'num_serie')
		ls_nommaterial=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'nommaterial')
		
		//En inventario
		ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
		li_existe=dw_inventario_disponible.Find(ls_find,1,dw_inventario_disponible.RowCount())
		if li_existe>0 then dw_inventario_disponible.SetItem(li_existe,'marcado',1)

	next
	

end if

idt_fecha_inicio=ldt_fecha_inicio
idt_fecha_final=ldt_fecha_final

cb_generar.enabled=true

end event

type st_material from statictext within w_dis_prestamo_material
integer x = 66
integer y = 752
integer width = 293
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Función"
boolean focusrectangle = false
end type

type st_3 from statictext within w_dis_prestamo_material
integer x = 3109
integer y = 784
integer width = 172
integer height = 51
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "a las"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_dis_prestamo_material
integer x = 3109
integer y = 704
integer width = 179
integer height = 51
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "a las"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_hora_final from editmask within w_dis_prestamo_material
integer x = 3310
integer y = 768
integer width = 194
integer height = 70
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
end type

event modified;dw_disponible.Reset()
cb_generar.enabled=false

end event

type em_fecha_final from editmask within w_dis_prestamo_material
integer x = 2714
integer y = 768
integer width = 373
integer height = 70
integer taborder = 60
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

event modified;dw_disponible.Reset()
cb_generar.enabled=false

end event

type st_final from statictext within w_dis_prestamo_material
integer x = 2282
integer y = 774
integer width = 402
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Fecha Fin"
boolean focusrectangle = false
end type

type em_hora_inicio from editmask within w_dis_prestamo_material
integer x = 3310
integer y = 688
integer width = 194
integer height = 70
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
end type

event modified;dw_disponible.Reset()
cb_generar.enabled=false

end event

type em_fecha_inicio from editmask within w_dis_prestamo_material
integer x = 2714
integer y = 688
integer width = 373
integer height = 70
integer taborder = 60
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

event modified;dw_disponible.Reset()
cb_generar.enabled=false

end event

type st_inicio from statictext within w_dis_prestamo_material
integer x = 2282
integer y = 691
integer width = 399
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Fecha Inicio"
boolean focusrectangle = false
end type

type dw_solicitante from datawindow within w_dis_prestamo_material
integer x = 900
integer y = 77
integer width = 2147
integer height = 486
integer taborder = 30
string title = "none"
string dataobject = "d_gen_pres_solicitante"
boolean border = false
boolean livescroll = true
end type

type cb_materias from commandbutton within w_dis_prestamo_material
integer x = 549
integer y = 486
integer width = 336
integer height = 74
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Materias"
end type

event clicked;
origen.ii_parm1 = ii_tipo_usuario
origen.il_parm1 = il_solicitante

openwithparm(w_gen_mat_insc,origen)

if isvalid(Message.PowerObjectParm) then

	regreso = message.powerobjectparm
	dw_solicitante.setitem(1,'materianombre',regreso.is_parm2)
	dw_solicitante.setitem(1,'profesornombre',regreso.is_parm3)
	
end if
end event

type dw_foto from datawindow within w_dis_prestamo_material
integer x = 3076
integer y = 86
integer width = 461
integer height = 470
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_foto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_cuenta from statictext within w_dis_prestamo_material
integer x = 541
integer y = 150
integer width = 293
integer height = 51
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Cuenta:"
boolean focusrectangle = false
end type

type sle_solicitante from singlelineedit within w_dis_prestamo_material
event ue_usuario_busqueda ( )
integer x = 534
integer y = 218
integer width = 322
integer height = 70
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event ue_usuario_busqueda();integer li_acceso=-1, li_row, li_materiales, NET, li_suspendido=0
string ls_aviso, ls_telefono, ls_solicitante

ls_solicitante=trim(sle_solicitante.text)

f_reset_solicitud()

ii_tipo_usuario=ii_tipou_sel

choose case ii_tipo_usuario
	case 1
		//Alumno
		li_acceso=f_valida_alumno(ls_solicitante)
	case 2
		//Intercambio
		li_acceso=f_valida_alumno_intercambio(ls_solicitante)
	case 3
		//Empleado
		li_acceso=f_valida_empleado(ls_solicitante)
	case 4
		//Exalumno
		li_acceso=f_valida_exalumno(ls_solicitante)
	case 5
		//DEC
		li_acceso=f_valida_alumno_dec(ls_solicitante)
end choose


if li_acceso>-1 then
	if istr_pres_permisos.suspendido>0 then li_suspendido=f_validar_suspendido()
	if li_suspendido=-1 then li_acceso=-1
end if

choose case li_acceso
	case -1
		//No existe, detener todo

	case 0
		//Todo bien
		
	case 1
		// 1 Existe, pero no está inscrito en el semestre
			
		if ii_tipo_usuario=3 then
			ls_aviso='El maestro no se encuentra activo en este semestre.'
		else
			ls_aviso='El alumno no se encuentra inscrito en este semestre.'
		end if
		
		if istr_pres_permisos.vigente=1 then 
			messagebox('Atención',ls_aviso+ ' No se puede realizar el préstamo.',stopsign!)
			li_acceso=-1
		else
			Net = messagebox("Atención",ls_aviso+' ¿Desea autorizar el préstamo?', Question!, yesno!, 2)
			if Net = 1 then li_acceso=0 else li_acceso=-1
		end if

	
	case 2
		// 2 Existe, está inscrito en el semestre, no está inscrito en el departamento
	
		if ii_tipo_usuario=3 then
			ls_aviso='El maestro no imparte materias en este departamento.'
			
			if istr_pres_permisos.materias_p=1 then 
				messagebox('Atención',ls_aviso+ ' No se puede realizar el préstamo.',stopsign!)
				li_acceso=-1
			else
				Net = messagebox("Atención",ls_aviso+' ¿Desea autorizar el préstamo?', Question!, yesno!, 2)
				if Net = 1 then li_acceso=0 else li_acceso=-1
			end if
			
		else
			ls_aviso='El alumno no cursa materias en este departamento.'
			
			if istr_pres_permisos.materias_a=1 then 
				messagebox('Atención',ls_aviso+ ' No se puede realizar el préstamo.',stopsign!)
				li_acceso=-1
			else
				Net = messagebox("Atención",ls_aviso+' ¿Desea autorizar el préstamo?', Question!, yesno!, 2)
				if Net = 1 then li_acceso=0 else li_acceso=-1
			end if
			
		end if
	
end choose


if li_acceso=0 then
	
	//Validar multas en cualquier área
//	li_acceso=f_valida_multas()	
//	if li_acceso=-1  then goto terminar
	
	//Validar un máximo de materiales en el departamento
	li_materiales= f_valida_prestamos_usuario(il_solicitante,gi_depto,gi_area,ii_tipo_usuario)
	ii_reservados=li_materiales
	if li_materiales>0 then
		if istr_pres_permisos.materiales>0 then
			if li_materiales>= istr_pres_permisos.materiales then
				messagebox('Atención','La cuenta tiene reservados '+string(li_materiales)+' materiales. No se puede realizar el préstamo.',stopsign!)
				li_acceso=-1
			else
				Net = messagebox("Atención",'La cuenta tiene reservados '+string(li_materiales)+' materiales en este departamento. ¿Desea autorizar el préstamo?', Question!, yesno!, 2)
				if Net = 1 then li_acceso=0 else li_acceso=-1				
			end if
		else
			if li_materiales>0 then
				Net = messagebox("Atención",'La cuenta tiene reservados '+string(li_materiales)+' materiales en este departamento. ¿Desea autorizar el préstamo?', Question!, yesno!, 2)
				if Net = 1 then li_acceso=0 else li_acceso=-1
			end if
		end if
	end if	
	
end if


terminar:

if li_acceso=-1 then

	f_reset_solicitud()

else
	
	ls_telefono=f_select_telefono_usuario(il_solicitante,gi_depto,ii_tipo_usuario)
	dw_solicitante.SetItem(1, "solicitanteid", il_solicitante)	
	dw_solicitante.SetItem(1, "solicitantenombre", is_solicitantenom)
	dw_solicitante.SetItem(1, "telefono",ls_telefono)
	
	f_carga_foto()
	
	idwc_grupomat.Retrieve(gi_depto,gi_area)
	if idwc_grupomat.RowCount()>0 then dw_grupomat.insertrow(0)
	
	dw_grupomat.enabled=true
	dw_matgrupo.enabled=true
	dw_tipo.enabled=true
	dw_tamano.enabled=true
	
	cb_buscar.enabled=true
	sle_cod_agregar.enabled=true
	tab_solicitud.tabpage_activo.sle_cod_entregar.enabled=true
	if ii_tipo_usuario<>2 then cb_materias.enabled=true
	
	dw_inventario_disponible.Reset()
	dw_inventario_disponible.Retrieve(gi_depto,gi_area,idt_fecha_inicio,idt_fecha_final)
	f_buscar_presolicitudes()
	
end if
	
end event

event modified;event ue_usuario_busqueda()

timer(1.5)
end event

type gb_busqueda from groupbox within w_dis_prestamo_material
integer x = 62
integer y = 67
integer width = 819
integer height = 397
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Búsqueda"
end type

type gb_solicitud from groupbox within w_dis_prestamo_material
integer x = 2227
integer y = 608
integer width = 1346
integer height = 410
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Solicitud"
end type

type gb_material from groupbox within w_dis_prestamo_material
integer x = 29
integer y = 608
integer width = 2110
integer height = 410
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Material"
end type

type gb_seleccionado from groupbox within w_dis_prestamo_material
integer x = 22
integer y = 1699
integer width = 3643
integer height = 842
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Material Seleccionado"
end type

type gb_disponible from groupbox within w_dis_prestamo_material
integer x = 29
integer y = 1034
integer width = 3152
integer height = 653
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = " Material Disponible"
end type

type gb_agregar from groupbox within w_dis_prestamo_material
integer x = 3193
integer y = 1034
integer width = 384
integer height = 246
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Agregar"
end type

type gb_solicitante from groupbox within w_dis_prestamo_material
integer x = 29
integer y = 13
integer width = 3544
integer height = 582
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Solicitante"
end type

type dw_inventario_disponible from datawindow within w_dis_prestamo_material
integer x = 3917
integer y = 86
integer width = 187
integer height = 96
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_gen_mat_disponible"
borderstyle borderstyle = stylelowered!
end type

type cb_generar from commandbutton within w_dis_prestamo_material
integer x = 3401
integer y = 2547
integer width = 267
integer height = 90
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Generar"
end type

event clicked;if ii_edita=0 then
	f_generar_solicitud()
else
	f_actualizar_materiales()
end if
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
05w_dis_prestamo_material.bin 
2000000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000f84ecff001d1f3e500000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe000000000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000004800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000452392cff41d0a9fca59122b62b36ca4600000000f84ecff001d1f3e5f84ecff001d1f3e500000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000b29300000048000800034757f20b000000200065005f00740078006e0065007800740000059f000800034757f20affffffe00065005f00740078006e0065007900740000053600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b29300000048000800034757f20b000000200065005f00740078006e0065007800740000059f000800034757f20affffffe00065005f00740078006e00650079007400000536000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000200000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
15w_dis_prestamo_material.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
