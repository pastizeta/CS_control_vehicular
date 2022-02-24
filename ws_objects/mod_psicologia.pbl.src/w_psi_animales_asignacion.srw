$PBExportHeader$w_psi_animales_asignacion.srw
forward
global type w_psi_animales_asignacion from window
end type
type ole_1 from olecustomcontrol within w_psi_animales_asignacion
end type
type sle_animal from singlelineedit within w_psi_animales_asignacion
end type
type dw_tipo_usuario from datawindow within w_psi_animales_asignacion
end type
type tab_solicitud from tab within w_psi_animales_asignacion
end type
type tabpage_solicitado from userobject within tab_solicitud
end type
type st_observaciones from statictext within tabpage_solicitado
end type
type mle_observaciones from multilineedit within tabpage_solicitado
end type
type cb_eliminar from commandbutton within tabpage_solicitado
end type
type cbx_todos from checkbox within tabpage_solicitado
end type
type dw_solicitados from datawindow within tabpage_solicitado
end type
type tabpage_solicitado from userobject within tab_solicitud
st_observaciones st_observaciones
mle_observaciones mle_observaciones
cb_eliminar cb_eliminar
cbx_todos cbx_todos
dw_solicitados dw_solicitados
end type
type tabpage_activo from userobject within tab_solicitud
end type
type mle_motivo from multilineedit within tabpage_activo
end type
type st_1 from statictext within tabpage_activo
end type
type cbx_entregar from checkbox within tabpage_activo
end type
type cb_entregar from commandbutton within tabpage_activo
end type
type dw_activos from datawindow within tabpage_activo
end type
type tabpage_activo from userobject within tab_solicitud
mle_motivo mle_motivo
st_1 st_1
cbx_entregar cbx_entregar
cb_entregar cb_entregar
dw_activos dw_activos
end type
type tabpage_entregado from userobject within tab_solicitud
end type
type dw_entregados from datawindow within tabpage_entregado
end type
type tabpage_entregado from userobject within tab_solicitud
dw_entregados dw_entregados
end type
type tab_solicitud from tab within w_psi_animales_asignacion
tabpage_solicitado tabpage_solicitado
tabpage_activo tabpage_activo
tabpage_entregado tabpage_entregado
end type
type st_cod_uia from statictext within w_psi_animales_asignacion
end type
type dw_reporte_mat from datawindow within w_psi_animales_asignacion
end type
type st_inventario from statictext within w_psi_animales_asignacion
end type
type cb_cerrar from commandbutton within w_psi_animales_asignacion
end type
type dw_disponible from datawindow within w_psi_animales_asignacion
end type
type cb_buscar from commandbutton within w_psi_animales_asignacion
end type
type st_2 from statictext within w_psi_animales_asignacion
end type
type em_hora from editmask within w_psi_animales_asignacion
end type
type st_inicio from statictext within w_psi_animales_asignacion
end type
type dw_solicitante from datawindow within w_psi_animales_asignacion
end type
type dw_foto from datawindow within w_psi_animales_asignacion
end type
type st_cuenta from statictext within w_psi_animales_asignacion
end type
type sle_solicitante from singlelineedit within w_psi_animales_asignacion
end type
type gb_busqueda from groupbox within w_psi_animales_asignacion
end type
type gb_solicitud from groupbox within w_psi_animales_asignacion
end type
type gb_material from groupbox within w_psi_animales_asignacion
end type
type gb_seleccionado from groupbox within w_psi_animales_asignacion
end type
type gb_disponible from groupbox within w_psi_animales_asignacion
end type
type gb_solicitante from groupbox within w_psi_animales_asignacion
end type
type cb_generar from commandbutton within w_psi_animales_asignacion
end type
type em_fecha from editmask within w_psi_animales_asignacion
end type
end forward

global type w_psi_animales_asignacion from window
integer width = 3661
integer height = 2691
boolean titlebar = true
string title = "Asignación de animales"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
ole_1 ole_1
sle_animal sle_animal
dw_tipo_usuario dw_tipo_usuario
tab_solicitud tab_solicitud
st_cod_uia st_cod_uia
dw_reporte_mat dw_reporte_mat
st_inventario st_inventario
cb_cerrar cb_cerrar
dw_disponible dw_disponible
cb_buscar cb_buscar
st_2 st_2
em_hora em_hora
st_inicio st_inicio
dw_solicitante dw_solicitante
dw_foto dw_foto
st_cuenta st_cuenta
sle_solicitante sle_solicitante
gb_busqueda gb_busqueda
gb_solicitud gb_solicitud
gb_material gb_material
gb_seleccionado gb_seleccionado
gb_disponible gb_disponible
gb_solicitante gb_solicitante
cb_generar cb_generar
em_fecha em_fecha
end type
global w_psi_animales_asignacion w_psi_animales_asignacion

type variables
n_transportar regreso, origen

integer ii_anio, ii_periodo, ii_tipo_usuario=0, ii_tipou_sel=0, ii_edita=0
long il_solicitante, il_folio_prestamo=0
string is_solicitantenom
datetime idt_fecha_asignacion

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
public subroutine f_reset_solicitud ()
public subroutine f_generar_solicitud ()
public subroutine f_marca_tipo_usuario ()
public function integer f_valida_exalumno (string p_cuenta)
public function integer f_valida_alumno_dec (string p_cuenta)
private subroutine f_agregar_material (str_animales_crias pstr_animal, long p_folio_presol, integer p_rowdis)
public subroutine f_cargar_inventario ()
public subroutine f_buscar_folios ()
public subroutine f_cargar_solicitud (long p_folio)
public function long f_insert_solicitud ()
public subroutine f_insert_solicitud_detalle (integer p_row, long p_folio)
end prototypes

public subroutine f_fecha_fija ();
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
/*
	lds_multa_depto.dataobject ='d_gen_select_multa_depto'
	lds_multa_depto.settransobject(gtr_sumuia)	
	lds_multa_depto.Retrieve(il_solicitante,ii_tipo_usuario,gi_depto,gi_area)
	li_row = lds_multa_depto.Rowcount()

	for li_i=1 to li_row
		Messagebox("Atención","La cuenta "+string(il_solicitante)+ " presenta una multa en el área: "&
		+lds_multa_depto.GetitemString(li_i,'area')+"~r~nFolio: "+string(lds_multa_depto.GetItemNumber(li_i,'folio_multa'))+"~r~nNo se puede realizar el préstamo.",stopsign!)
		li_acceso= -1
	next
	*/
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

public subroutine f_reset_solicitud ();ii_edita=0
sle_solicitante.text=''
il_solicitante=0
is_solicitantenom=''
il_folio_prestamo=0 

dw_solicitante.Reset()
dw_solicitante.insertrow(0)
dw_solicitante.SetItem(1, "cveperiodo", ii_periodo)	

dw_foto.Reset()
dw_foto.Modify ( "p_1.FileName='uia-n.jpg'" )

sle_animal.text = ''
tab_solicitud.tabpage_solicitado.mle_observaciones.text=''
tab_solicitud.tabpage_activo.mle_motivo.text=''

dw_disponible.Reset()
tab_solicitud.tabpage_solicitado.dw_solicitados.Reset()
tab_solicitud.tabpage_activo.dw_activos.Reset()
tab_solicitud.tabpage_entregado.dw_entregados.Reset()

sle_animal.enabled=false
em_fecha.text=string(today())
em_hora.text=string(hour(now()))
em_fecha.enabled=true
em_hora.enabled=true

cb_buscar.enabled=false
tab_solicitud.tabpage_solicitado.cb_eliminar.enabled=false
tab_solicitud.tabpage_activo.cb_entregar.enabled=false
cb_generar.enabled=false

idt_fecha_asignacion=datetime(date(em_fecha.text),time(em_hora.text))
tab_solicitud.selectedtab=1
cb_generar.text='Asignar'

this.title='Asignación de animales'
tab_solicitud.tabpage_activo.text='Asignado ('+string(tab_solicitud.tabpage_activo.dw_activos.RowCount())+')'
tab_solicitud.tabpage_entregado.text='Regresado ('+string(tab_solicitud.tabpage_entregado.dw_entregados.RowCount())+')'
tab_solicitud.tabpage_solicitado.text='Solicitado ('+string(tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())+')'
tab_solicitud.tabpage_solicitado.visible=true
tab_solicitud.tabpage_activo.visible=true
tab_solicitud.tabpage_entregado.visible=true

end subroutine

public subroutine f_generar_solicitud ();integer NET,  li_error=0, li_existe, li_row, li_i
long ll_folio=0
string ls_find 
datastore lds_reservados

long ll_inventario
string ls_nombre

if tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount() > 0 then	

	//Revisar que todas sigan disponibles
	
	lds_reservados =  create datastore
	lds_reservados.dataobject ='d_psi_animales_disponible'
	lds_reservados.settransobject(gtr_sumuia)

	lds_reservados.Retrieve('%%',0)
	li_row = lds_reservados.Rowcount()
	
	if li_row>0 then
	
		for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
			
			tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_i,'color',0)
				
			ll_inventario=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'id_inventario')
			ls_nombre=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemString(li_i,'nombre')
			ls_find="id_inventario="+string(ll_inventario)
			li_existe=lds_reservados.Find(ls_find,1,li_row)
		
			if li_existe=0 then 
				messagebox('Atención','El animal '+ls_nombre+' con Id inventario '+string(ll_inventario)+' ya no se encuentra disponible.',stopsign!)
				tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_i,'color',1)
				li_error=-1
			end if
			
		next
		
		if li_error=-1 then goto error
		
	end if

	//Insertar
	for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()

		//Insertar Solicitud
		if ll_folio=0 then ll_folio=f_insert_solicitud()

		if ll_folio=-1 then 
			li_error=1
			goto error
		end if
		
		//Insertar detalle
		f_insert_solicitud_detalle(li_i,ll_folio)

	next

	
	messagebox('Mensaje del Sistema','La asignación ha sido realizada con éxito con el folio '+string(ll_folio))
	f_reset_solicitud()
	
	error:
	
	if li_error=1 then
		messagebox('Atención','La asignación no pudo ser realizada correctamente',stopsign!)
	end if

end if


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

private subroutine f_agregar_material (str_animales_crias pstr_animal, long p_folio_presol, integer p_rowdis);integer li_row, li_i, li_existe,li_nuevo
long ll_inventario
string ls_find
datastore lds_presolicitados

li_row=tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
tab_solicitud.tabpage_solicitado.dw_solicitados.insertrow(0)

li_nuevo= li_row + 1
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "id_inventario",pstr_animal.id_inventario)	
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "id_cria",pstr_animal.id_cria)	
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "nombre",pstr_animal.nombre)	
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "prov_descripcion",pstr_animal.proveedor)	
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "sexo",pstr_animal.sexo)	
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "estatus",0)
tab_solicitud.tabpage_solicitado.dw_solicitados.SetItem(li_nuevo, "cbox",0)
		
f_cargar_inventario()

tab_solicitud.tabpage_solicitado.text='Solicitado ('+string(tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())+')'
tab_solicitud.tabpage_solicitado.cb_eliminar.enabled=true
cb_generar.enabled=true	
end subroutine

public subroutine f_cargar_inventario ();integer li_i, li_existe
string ls_nombre, ls_find
long ll_inventario

ls_nombre=trim(sle_animal.text)
if isNumber(ls_nombre) = true then
	ll_inventario=long(ls_nombre)
	ls_nombre='%%'
else
	ll_inventario=0
	ls_nombre='%' + ls_nombre + '%'
end if

dw_disponible.SetRedraw(false)
dw_disponible.Reset()
dw_disponible.Retrieve(ls_nombre,ll_inventario)
dw_disponible.SetRedraw(true)

//Solicitados, hacer NO disponible en la seleccion actual

for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
	
	ll_inventario=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'id_inventario')
	ls_find="id_inventario="+string(ll_inventario)
	li_existe=dw_disponible.Find(ls_find,1,dw_disponible.RowCount())
	
	if li_existe>0 then dw_disponible.DeleteRow(li_existe)

next

cb_generar.enabled=true

end subroutine

public subroutine f_buscar_folios ();str_animales_crias lstr_folio

//Buscar Folios

lstr_folio.tipo_usuario = ii_tipo_usuario
lstr_folio.solicitanteid = il_solicitante
lstr_folio.folio = 0

openwithparm(w_psi_animales_folios,lstr_folio)

if isvalid(Message.PowerObjectParm) then

	lstr_folio = message.powerobjectparm
	
	if lstr_folio.folio>0 then 
		f_cargar_solicitud(lstr_folio.folio)
	end if

end if

end subroutine

public subroutine f_cargar_solicitud (long p_folio);integer li_row, li_i, li_nuevo=0, li_estatus, li_existe, li_activos, li_entregados, li_consec_presol
string ls_find
datastore lds_solicitud, lds_pre_materiales

lds_solicitud =  create datastore
lds_solicitud.dataobject ='d_psi_animales_folio'
lds_solicitud.settransobject(gtr_sumuia)	

lds_solicitud.Retrieve(p_folio)

em_fecha.enabled=false
em_hora.enabled=false

tab_solicitud.tabpage_solicitado.dw_solicitados.Reset()
tab_solicitud.tabpage_activo.dw_activos.Reset()
tab_solicitud.tabpage_entregado.dw_entregados.Reset()

il_folio_prestamo=p_folio
li_row = lds_solicitud.Rowcount()
if li_row>0 then tab_solicitud.tabpage_activo.cb_entregar.enabled=true

//Extraer Asignaciones
lds_solicitud.SetFilter("estatus=1")
lds_solicitud.Filter()
li_row = lds_solicitud.Rowcount()
li_nuevo=0

for li_i=1 to li_row
	
	li_nuevo++
	tab_solicitud.tabpage_activo.dw_activos.insertrow(0)
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "id_inventario",lds_solicitud.GetItemNumber(li_i,'id_inventario'))	
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "id_cria",lds_solicitud.GetItemNumber(li_i,'id_cria'))	
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "nombre",lds_solicitud.GetItemString(li_i,'nombre'))	
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "prov_descripcion",lds_solicitud.GetItemString(li_i,'prov_descripcion'))	
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "sexo",lds_solicitud.GetItemString(li_i,'sexo'))	
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "estatus",lds_solicitud.GetItemNumber(li_i,'estatus'))	
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "folio",lds_solicitud.GetItemNumber(li_i,'folio'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "consec",lds_solicitud.GetItemNumber(li_i,'consec'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "cbox",0)

	idt_fecha_asignacion=lds_solicitud.GetItemDateTime(li_nuevo,'fecha_asignacion')
	em_fecha.text=string(Date(idt_fecha_asignacion))
	em_hora.text=string(Time(idt_fecha_asignacion))

next

lds_solicitud.SetFilter("")
lds_solicitud.Filter()


//Extraer Regresados
lds_solicitud.Retrieve(p_folio)
lds_solicitud.SetFilter("estatus=2")
lds_solicitud.Filter()
li_row = lds_solicitud.Rowcount()
li_nuevo=0

for li_i=1 to li_row

	li_nuevo++
	tab_solicitud.tabpage_entregado.dw_entregados.insertrow(0)
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "id_inventario",lds_solicitud.GetItemNumber(li_i,'id_inventario'))	
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "id_cria",lds_solicitud.GetItemNumber(li_i,'id_cria'))	
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "nombre",lds_solicitud.GetItemString(li_i,'nombre'))	
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "prov_descripcion",lds_solicitud.GetItemString(li_i,'prov_descripcion'))	
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "sexo",lds_solicitud.GetItemString(li_i,'sexo'))	
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "estatus",lds_solicitud.GetItemNumber(li_i,'estatus'))	
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "folio",lds_solicitud.GetItemNumber(li_i,'folio'))
	tab_solicitud.tabpage_activo.dw_activos.SetItem(li_nuevo, "consec",lds_solicitud.GetItemNumber(li_i,'consec'))
	tab_solicitud.tabpage_entregado.dw_entregados.SetItem(li_nuevo, "cbox",0)
next


li_activos=tab_solicitud.tabpage_activo.dw_activos.RowCount()
li_entregados=tab_solicitud.tabpage_entregado.dw_entregados.RowCount()

tab_solicitud.tabpage_solicitado.text='Solicitado ('+string(tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())+')'
tab_solicitud.tabpage_activo.text='Asignado ('+string(tab_solicitud.tabpage_activo.dw_activos.RowCount())+')'
tab_solicitud.tabpage_entregado.text='Regresado ('+string(tab_solicitud.tabpage_entregado.dw_entregados.RowCount())+')'


this.title='Asignación de animales [Folio: '+string(p_folio)+']'


ii_edita=0
sle_animal.enabled=false
cb_buscar.enabled=false
tab_solicitud.tabpage_solicitado.visible=false

if li_entregados = 0 then
	tab_solicitud.tabpage_entregado.visible=false
else
	tab_solicitud.tabpage_entregado.visible=true
	tab_solicitud.SelectedTab=3
end if

if li_activos = 0 then
	tab_solicitud.tabpage_activo.visible=false
else
	tab_solicitud.tabpage_activo.visible=true
	tab_solicitud.SelectedTab=2
end if

end subroutine

public function long f_insert_solicitud ();long ll_folio
string ls_sol_nombre
datetime ldt_fecha_asignacion, ldt_fecha_hoy

ls_sol_nombre=dw_solicitante.GetItemString(1,'solicitantenombre')
ldt_fecha_asignacion=datetime(date(em_fecha.text),time(em_hora.text))
ldt_fecha_hoy= DateTime(today(),now())

select max(folio)
into :ll_folio
from dbo.spre_animales_asigna
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener Máximo Folio Asignación", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return -1
end if
	
if isNull(ll_folio) then ll_folio=0

ll_folio=ll_folio+1

//Insertar Solicitud
insert into dbo.spre_animales_asigna

(folio, solicitanteid, tipo_solicitud, solicitantenombre,
anio, cveperiodo, fecha_captura, fecha_asignacion)
 
values
(:ll_folio, :il_solicitante, :ii_tipo_usuario, :ls_sol_nombre,
:ii_anio, :ii_periodo, :ldt_fecha_hoy, :ldt_fecha_asignacion)

using gtr_sumuia;	

if gtr_sumuia.sqlcode<>0 then
	messagebox("Error al insertar la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
	return -1
end if	

return(ll_folio)

end function

public subroutine f_insert_solicitud_detalle (integer p_row, long p_folio);long ll_inventario
string ls_observaciones=''
integer li_consec

ll_inventario=tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(p_row,'id_inventario')
ls_observaciones=mid(tab_solicitud.tabpage_solicitado.mle_observaciones.text,1,500) 

select max(consec)
into :li_consec
from dbo.spre_animales_asigna_det
where folio = :p_folio
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener Máximo Consec Asignación", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return
end if
	
if isNull(li_consec) then li_consec=0

li_consec=li_consec+1

//Insertar Solicitud
insert into dbo.spre_animales_asigna_det

(folio, consec, id_inventario, estatus, observaciones)
 
values
(:p_folio, :li_consec, :ll_inventario, 1, :ls_observaciones)

using gtr_sumuia;	

if gtr_sumuia.sqlcode<>0 then
	messagebox("Error al insertar el detallado: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
	return
else
	update spre_animales_inventario 
	set estatus = 2
	where id_inventario = :ll_inventario
	using gtr_sumuia;	
	commit using  gtr_sumuia;
end if	

end subroutine

on w_psi_animales_asignacion.create
this.ole_1=create ole_1
this.sle_animal=create sle_animal
this.dw_tipo_usuario=create dw_tipo_usuario
this.tab_solicitud=create tab_solicitud
this.st_cod_uia=create st_cod_uia
this.dw_reporte_mat=create dw_reporte_mat
this.st_inventario=create st_inventario
this.cb_cerrar=create cb_cerrar
this.dw_disponible=create dw_disponible
this.cb_buscar=create cb_buscar
this.st_2=create st_2
this.em_hora=create em_hora
this.st_inicio=create st_inicio
this.dw_solicitante=create dw_solicitante
this.dw_foto=create dw_foto
this.st_cuenta=create st_cuenta
this.sle_solicitante=create sle_solicitante
this.gb_busqueda=create gb_busqueda
this.gb_solicitud=create gb_solicitud
this.gb_material=create gb_material
this.gb_seleccionado=create gb_seleccionado
this.gb_disponible=create gb_disponible
this.gb_solicitante=create gb_solicitante
this.cb_generar=create cb_generar
this.em_fecha=create em_fecha
this.Control[]={this.ole_1,&
this.sle_animal,&
this.dw_tipo_usuario,&
this.tab_solicitud,&
this.st_cod_uia,&
this.dw_reporte_mat,&
this.st_inventario,&
this.cb_cerrar,&
this.dw_disponible,&
this.cb_buscar,&
this.st_2,&
this.em_hora,&
this.st_inicio,&
this.dw_solicitante,&
this.dw_foto,&
this.st_cuenta,&
this.sle_solicitante,&
this.gb_busqueda,&
this.gb_solicitud,&
this.gb_material,&
this.gb_seleccionado,&
this.gb_disponible,&
this.gb_solicitante,&
this.cb_generar,&
this.em_fecha}
end on

on w_psi_animales_asignacion.destroy
destroy(this.ole_1)
destroy(this.sle_animal)
destroy(this.dw_tipo_usuario)
destroy(this.tab_solicitud)
destroy(this.st_cod_uia)
destroy(this.dw_reporte_mat)
destroy(this.st_inventario)
destroy(this.cb_cerrar)
destroy(this.dw_disponible)
destroy(this.cb_buscar)
destroy(this.st_2)
destroy(this.em_hora)
destroy(this.st_inicio)
destroy(this.dw_solicitante)
destroy(this.dw_foto)
destroy(this.st_cuenta)
destroy(this.sle_solicitante)
destroy(this.gb_busqueda)
destroy(this.gb_solicitud)
destroy(this.gb_material)
destroy(this.gb_seleccionado)
destroy(this.gb_disponible)
destroy(this.gb_solicitante)
destroy(this.cb_generar)
destroy(this.em_fecha)
end on

event open;integer li_cuantos

f_select_anio_periodo_actual(ii_periodo,ii_anio,today())
 
dw_tipo_usuario.settransobject(gtr_sumuia)
dw_tipo_usuario.Retrieve(gi_depto,gi_area)
li_cuantos=dw_tipo_usuario.RowCount()

if ii_tipo_usuario=0 and li_cuantos>0 then ii_tipo_usuario=dw_tipo_usuario.GetItemNumber(1,'cve_tipo_usuario')
if ii_tipo_usuario=0 then sle_solicitante.enabled=false

f_marca_tipo_usuario()
 
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

type ole_1 from olecustomcontrol within w_psi_animales_asignacion
boolean visible = false
integer x = 2121
integer y = 842
integer width = 1061
integer height = 298
integer taborder = 170
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_psi_animales_asignacion.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type sle_animal from singlelineedit within w_psi_animales_asignacion
integer x = 69
integer y = 768
integer width = 1613
integer height = 90
integer taborder = 190
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type dw_tipo_usuario from datawindow within w_psi_animales_asignacion
integer x = 84
integer y = 122
integer width = 424
integer height = 346
integer taborder = 70
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

type tab_solicitud from tab within w_psi_animales_asignacion
event create ( )
event destroy ( )
integer x = 40
integer y = 1661
integer width = 3482
integer height = 762
integer taborder = 240
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
integer width = 3452
integer height = 659
long backcolor = 30520472
string text = "Solicitado"
long tabtextcolor = 33554432
long tabbackcolor = 30520472
long picturemaskcolor = 536870912
st_observaciones st_observaciones
mle_observaciones mle_observaciones
cb_eliminar cb_eliminar
cbx_todos cbx_todos
dw_solicitados dw_solicitados
end type

on tabpage_solicitado.create
this.st_observaciones=create st_observaciones
this.mle_observaciones=create mle_observaciones
this.cb_eliminar=create cb_eliminar
this.cbx_todos=create cbx_todos
this.dw_solicitados=create dw_solicitados
this.Control[]={this.st_observaciones,&
this.mle_observaciones,&
this.cb_eliminar,&
this.cbx_todos,&
this.dw_solicitados}
end on

on tabpage_solicitado.destroy
destroy(this.st_observaciones)
destroy(this.mle_observaciones)
destroy(this.cb_eliminar)
destroy(this.cbx_todos)
destroy(this.dw_solicitados)
end on

type st_observaciones from statictext within tabpage_solicitado
integer x = 11
integer y = 355
integer width = 479
integer height = 58
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Observaciones"
boolean focusrectangle = false
end type

type mle_observaciones from multilineedit within tabpage_solicitado
integer x = 7
integer y = 429
integer width = 3145
integer height = 214
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_eliminar from commandbutton within tabpage_solicitado
integer x = 3163
integer y = 170
integer width = 274
integer height = 93
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

event clicked;integer  li_i,  li_marcado=0

for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
	if tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'cbox') = 1 then  li_marcado=1
next

if li_marcado=0 then
	messagebox('Atención','Debe seleccionar algún animal.')
	return
end if

for li_i=1 to tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount()
	
	if tab_solicitud.tabpage_solicitado.dw_solicitados.GetItemNumber(li_i,'cbox') = 1  then	
		tab_solicitud.tabpage_solicitado.dw_solicitados.DeleteRow(li_i)
		li_i=li_i -1 
	end if
	
next

tab_solicitud.tabpage_solicitado.text='Solicitado ('+string(tab_solicitud.tabpage_solicitado.dw_solicitados.RowCount())+')'
f_cargar_inventario()

end event

type cbx_todos from checkbox within tabpage_solicitado
integer x = 3182
integer y = 38
integer width = 263
integer height = 67
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
integer y = 10
integer width = 3145
integer height = 320
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_psi_animales_asignacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_activo from userobject within tab_solicitud
integer x = 15
integer y = 90
integer width = 3452
integer height = 659
long backcolor = 30520472
string text = "Asignado"
long tabtextcolor = 33554432
long tabbackcolor = 30520472
long picturemaskcolor = 536870912
mle_motivo mle_motivo
st_1 st_1
cbx_entregar cbx_entregar
cb_entregar cb_entregar
dw_activos dw_activos
end type

on tabpage_activo.create
this.mle_motivo=create mle_motivo
this.st_1=create st_1
this.cbx_entregar=create cbx_entregar
this.cb_entregar=create cb_entregar
this.dw_activos=create dw_activos
this.Control[]={this.mle_motivo,&
this.st_1,&
this.cbx_entregar,&
this.cb_entregar,&
this.dw_activos}
end on

on tabpage_activo.destroy
destroy(this.mle_motivo)
destroy(this.st_1)
destroy(this.cbx_entregar)
destroy(this.cb_entregar)
destroy(this.dw_activos)
end on

type mle_motivo from multilineedit within tabpage_activo
integer x = 7
integer y = 429
integer width = 3145
integer height = 214
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within tabpage_activo
integer x = 11
integer y = 355
integer width = 479
integer height = 58
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Motivo"
boolean focusrectangle = false
end type

type cbx_entregar from checkbox within tabpage_activo
integer x = 3167
integer y = 38
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
integer x = 3167
integer y = 170
integer width = 282
integer height = 93
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Regresar"
end type

event clicked;integer NET, li_i, li_error=0, li_marcado=0
long ll_folio_solicitud, ll_inventario, ll_consec
datetime ldt_ahora
string ls_motivo

ldt_ahora=DateTime(today(),now())

Net = messagebox("Atención",' ¿Desea regresar los animales marcados?', Question!, yesno!, 2)

if Net = 1 then
	
	for li_i=1 to tab_solicitud.tabpage_activo.dw_activos.RowCount()
		if tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'cbox') = 1 then  li_marcado=1
	next
	
	if li_marcado=0 then return
	
	ls_motivo=mid(tab_solicitud.tabpage_activo.mle_motivo.text,1,500) 
	if ls_motivo = '' then
		messagebox('Aviso','Debe indicar el motivo por el que regresa al animal')
		return
	end if
	
	for li_i=1 to tab_solicitud.tabpage_activo.dw_activos.RowCount()
		
		if tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'cbox') = 1  then	

			ll_inventario=tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'id_inventario')
			ll_consec=tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'consec')
			ll_folio_solicitud=tab_solicitud.tabpage_activo.dw_activos.GetItemNumber(li_i,'folio')

			//Regresar Solicitud
			update dbo.spre_animales_asigna_det
			set estatus=2,
			fecha_regreso=:ldt_ahora,
			motivo=:ls_motivo
			where folio=:ll_folio_solicitud and consec=:ll_consec
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Error SUMUIA: Regresar animal", gtr_sumuia.SQLErrText)	
				rollback using gtr_sumuia;
				li_error=1
			end if

			update spre_animales_inventario 
			set estatus = 1
			where id_inventario = :ll_inventario
			using gtr_sumuia;	
			
			commit using gtr_sumuia;	
			tab_solicitud.tabpage_activo.dw_activos.SetItem(li_i,'color',0)
			
		end if
		
	next
	
	if li_error=0 then
		
		cbx_entregar.checked=false
		messagebox('Atención','Los animales marcados fueron regresados con éxito.')
		f_reset_solicitud()

	end if
	
end if

end event

type dw_activos from datawindow within tabpage_activo
integer x = 7
integer y = 10
integer width = 3145
integer height = 320
integer taborder = 10
string title = "none"
string dataobject = "d_psi_animales_asignacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer li_null

SetNull(li_null)

if row>0  then
	
	choose case dwo.name

		case 'cbox'
			
			this.SetItem(row,'color',0)
			
		end choose
	
end if
end event

type tabpage_entregado from userobject within tab_solicitud
integer x = 15
integer y = 90
integer width = 3452
integer height = 659
long backcolor = 30520472
string text = "Regresado"
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
integer y = 10
integer width = 3131
integer height = 650
integer taborder = 10
string title = "none"
string dataobject = "d_psi_animales_asignacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_cod_uia from statictext within w_psi_animales_asignacion
boolean visible = false
integer x = 3387
integer y = 928
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

type dw_reporte_mat from datawindow within w_psi_animales_asignacion
boolean visible = false
integer x = 3441
integer y = 1235
integer width = 102
integer height = 58
integer taborder = 10
string title = "none"
string dataobject = "d_gen_rep_solicitud_mat"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type st_inventario from statictext within w_psi_animales_asignacion
integer x = 69
integer y = 691
integer width = 1072
integer height = 74
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Id inventario o nombre"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_psi_animales_asignacion
integer x = 22
integer y = 2480
integer width = 304
integer height = 93
integer taborder = 220
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cerrar"
end type

event clicked;close(parent)
end event

type dw_disponible from datawindow within w_psi_animales_asignacion
integer x = 51
integer y = 973
integer width = 3493
integer height = 573
integer taborder = 190
string dataobject = "d_psi_animales_disponible"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(gtr_sumuia)
end event

event doubleclicked;integer li_cantidad=0, li_disponible

if row > 0 then

	str_animales_crias lstr_animal
	
	lstr_animal.id_inventario=this.GetItemNumber(row,'id_inventario')
	lstr_animal.id_cria=this.GetItemNumber(row,'id_cria')
	lstr_animal.nombre=this.GetItemString(row,'nombre')
	lstr_animal.proveedor=this.GetItemString(row,'prov_descripcion')
	lstr_animal.sexo=this.GetItemString(row,'sexo')

	f_agregar_material(lstr_animal,0,row)
	
	tab_solicitud.selectedtab=1
	
end if
end event

type cb_buscar from commandbutton within w_psi_animales_asignacion
integer x = 1723
integer y = 768
integer width = 311
integer height = 90
integer taborder = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Buscar"
end type

event clicked;f_cargar_inventario()
end event

type st_2 from statictext within w_psi_animales_asignacion
integer x = 3109
integer y = 694
integer width = 201
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

type em_hora from editmask within w_psi_animales_asignacion
integer x = 3313
integer y = 682
integer width = 216
integer height = 74
integer taborder = 180
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

type st_inicio from statictext within w_psi_animales_asignacion
integer x = 2183
integer y = 698
integer width = 519
integer height = 74
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Fecha Asignación"
boolean focusrectangle = false
end type

type dw_solicitante from datawindow within w_psi_animales_asignacion
integer x = 900
integer y = 77
integer width = 2150
integer height = 490
integer taborder = 90
string title = "none"
string dataobject = "d_gen_pres_solicitante"
boolean border = false
boolean livescroll = true
end type

type dw_foto from datawindow within w_psi_animales_asignacion
integer x = 3076
integer y = 90
integer width = 461
integer height = 474
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_foto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_cuenta from statictext within w_psi_animales_asignacion
integer x = 538
integer y = 154
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

type sle_solicitante from singlelineedit within w_psi_animales_asignacion
event ue_usuario_busqueda ( )
integer x = 530
integer y = 221
integer width = 322
integer height = 74
integer taborder = 60
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
		
		Net = messagebox("Atención",ls_aviso+' ¿Desea autorizar la asignación?', Question!, yesno!, 2)
		if Net = 1 then li_acceso=0 else li_acceso=-1

	
	case 2
		// 2 Existe, está inscrito en el semestre, no está inscrito en el departamento
	
	
		if ii_tipo_usuario=3 then
			ls_aviso='El maestro no imparte materias en este departamento.'
			
			if istr_pres_permisos.materias_p=1 then 
				messagebox('Atención',ls_aviso+ ' No se puede realizar la asignación.',stopsign!)
				li_acceso=-1
			else
				Net = messagebox("Atención",ls_aviso+' ¿Desea autorizar la asignación?', Question!, yesno!, 2)
				if Net = 1 then li_acceso=0 else li_acceso=-1
			end if
			
		else
			ls_aviso='El alumno no cursa materias en este departamento.'
			
			if istr_pres_permisos.materias_a=1 then 
				messagebox('Atención',ls_aviso+ ' No se puede realizar la asignación',stopsign!)
				li_acceso=-1
			else
				Net = messagebox("Atención",ls_aviso+' ¿Desea autorizar la asignación?', Question!, yesno!, 2)
				if Net = 1 then li_acceso=0 else li_acceso=-1
			end if
			
		end if
	
end choose


if li_acceso=-1 then

	f_reset_solicitud()

else
	
	ls_telefono=f_select_telefono_usuario(il_solicitante,gi_depto,ii_tipo_usuario)
	dw_solicitante.SetItem(1, "solicitanteid", il_solicitante)	
	dw_solicitante.SetItem(1, "solicitantenombre", is_solicitantenom)
	dw_solicitante.SetItem(1, "telefono",ls_telefono)
	
	f_carga_foto()
	
	sle_animal.text=''
	sle_animal.enabled=true
	cb_buscar.enabled=true
	
	f_buscar_folios()
	
end if
	
end event

event modified;event ue_usuario_busqueda()

timer(1.5)
end event

type gb_busqueda from groupbox within w_psi_animales_asignacion
integer x = 66
integer y = 67
integer width = 819
integer height = 422
integer taborder = 20
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

type gb_solicitud from groupbox within w_psi_animales_asignacion
integer x = 2154
integer y = 608
integer width = 1430
integer height = 288
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Asignación"
end type

type gb_material from groupbox within w_psi_animales_asignacion
integer x = 26
integer y = 608
integer width = 2070
integer height = 288
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Animal"
end type

type gb_seleccionado from groupbox within w_psi_animales_asignacion
integer x = 22
integer y = 1603
integer width = 3562
integer height = 845
integer taborder = 200
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Seleccionado"
end type

type gb_disponible from groupbox within w_psi_animales_asignacion
integer x = 26
integer y = 915
integer width = 3558
integer height = 653
integer taborder = 230
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Disponible"
end type

type gb_solicitante from groupbox within w_psi_animales_asignacion
integer x = 26
integer y = 13
integer width = 3555
integer height = 586
integer taborder = 30
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

type cb_generar from commandbutton within w_psi_animales_asignacion
integer x = 3229
integer y = 2480
integer width = 351
integer height = 93
integer taborder = 260
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Asignar"
end type

event clicked;f_generar_solicitud()

end event

type em_fecha from editmask within w_psi_animales_asignacion
integer x = 2721
integer y = 682
integer width = 377
integer height = 74
integer taborder = 130
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

event modified;dw_disponible.Reset()
cb_generar.enabled=false

end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Dw_psi_animales_asignacion.bin 
2000000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000d29c2e5001d42f3500000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe000000000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000004800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000452392cff41d0a9fca59122b62b36ca4600000000d29c2e5001d42f35d29c2e5001d42f3500000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000b29300000048000800034757f20b000000200065005f00740078006e006500780074000017fa000800034757f20affffffe00065005f00740078006e006500790074000007b100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b29300000048000800034757f20b000000200065005f00740078006e006500780074000017fa000800034757f20affffffe00065005f00740078006e006500790074000007b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000200000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Dw_psi_animales_asignacion.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
