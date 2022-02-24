$PBExportHeader$w_psi_prestamo_animales_resp.srw
forward
global type w_psi_prestamo_animales_resp from window
end type
type uo_1 from uo_spre_anim_prestamos within w_psi_prestamo_animales_resp
end type
type dw_tipo_usuario from datawindow within w_psi_prestamo_animales_resp
end type
type ole_1 from olecustomcontrol within w_psi_prestamo_animales_resp
end type
type dw_solicitante from datawindow within w_psi_prestamo_animales_resp
end type
type cb_materias from commandbutton within w_psi_prestamo_animales_resp
end type
type dw_foto from datawindow within w_psi_prestamo_animales_resp
end type
type st_cuenta from statictext within w_psi_prestamo_animales_resp
end type
type sle_solicitante from singlelineedit within w_psi_prestamo_animales_resp
end type
type gb_busqueda from groupbox within w_psi_prestamo_animales_resp
end type
type gb_solicitante from groupbox within w_psi_prestamo_animales_resp
end type
end forward

global type w_psi_prestamo_animales_resp from window
integer width = 4896
integer height = 3336
boolean titlebar = true
string title = "Préstamo de Materiales Animales"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
uo_1 uo_1
dw_tipo_usuario dw_tipo_usuario
ole_1 ole_1
dw_solicitante dw_solicitante
cb_materias cb_materias
dw_foto dw_foto
st_cuenta st_cuenta
sle_solicitante sle_solicitante
gb_busqueda gb_busqueda
gb_solicitante gb_solicitante
end type
global w_psi_prestamo_animales_resp w_psi_prestamo_animales_resp

type variables
n_transportar regreso, origen

integer ii_anio, ii_periodo//, ii_venta=0
integer  ii_modal=0 //0 Préstamos material, 1 Venta material, 2 Préstamo espacio

integer ii_tipo_usuario=0, ii_tipou_sel=0

long il_solicitante
string is_solicitantenom, is_solicitantenivel=''

long il_cvegrupo=0 
string is_cvemat=''
integer ii_reservados=0

datetime idt_fecha_inicio, idt_fecha_final

DatawindowChild idwc_grupomat, idwc_matgrupo

long il_folio_prestamo=0, il_folio_presolicitud=0

integer ii_edita=0, ii_multa=0, ii_bloquea_nuevo=0

str_pres_permisos istr_pres_permisos

end variables

forward prototypes
public subroutine f_generar_presolicitud (long p_folio)
public function integer f_valida_alumno (string p_cuenta)
public function integer f_valida_alumno_intercambio (string p_cuenta)
public function integer f_valida_empleado (string p_cuenta)
public subroutine f_carga_foto ()
public function integer f_valida_multas ()
public function integer f_validar_suspendido ()
public function long f_insert_solicitud ()
public subroutine f_reset_solicitud ()
public subroutine f_buscar_presolicitudes ()
public subroutine f_cargar_presolicitud (long p_presol)
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
public function long f_insert_material (integer p_row, long p_folio, ref integer p_cantidad_prestada, ref long p_folio_presol, ref long p_consec_presol)
public subroutine f_invalidar_multa ()
public subroutine f_cerrar_solicitud ()
private subroutine f_agregar_material (str_sol_material pstr_sol_material, long p_folio_presol, integer p_rowdis)
end prototypes

public subroutine f_generar_presolicitud (long p_folio);long ll_folio_presol, ll_consec_presol
datetime ldt_fecha_hoy, ldt_fecha_inicio, ldt_fecha_final
integer li_i, li_cvegrupo
string ls_cvematerial, ls_num_serie, ls_costo_mat

ldt_fecha_hoy=DateTime(Today(),Now())


select max(folio)
into :ll_folio_presol
from dbo.spre_pre_solicitud
where cvedepto =:gi_depto
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener Máximo Folio PreSolicitud", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return 
else
	commit using gtr_sumuia;	
end if

if isNull(ll_folio_presol) then ll_folio_presol=0
ll_folio_presol=ll_folio_presol+1


//Insertar PreSolicitud
insert into dbo.spre_pre_solicitud
(cvedepto, folio, solicitanteid, status, cveperiodo, fecha_solicitud, fecha_inicio,
fecha_fin, tipo_solicitud, tipo_prestamo, solicitantenombre, autorizada, cvearea, 
usuario_autoriza, fecha_autorizacion, folio_prestamo)
 
values
(:gi_depto, :ll_folio_presol, :il_solicitante, 1, :ii_periodo , :ldt_fecha_hoy, :ldt_fecha_inicio,
:ldt_fecha_final, 0, :ii_tipo_usuario, :is_solicitantenom, 1, :gi_area, 
:il_solicitante, :ldt_fecha_hoy, :p_folio)

using gtr_sumuia;	

if gtr_sumuia.sqlcode<>0 then
	messagebox("Error al insertar la PreSolicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
	return
end if	



select max(consecutivo)
into :ll_consec_presol
from dbo.spre_pre_sol_materiales
where cvedepto =:gi_depto
and folio =:ll_folio_presol
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener Máximo Consec PreSolicitud", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return 
end if

if isNull(ll_consec_presol) then ll_consec_presol=0



commit using gtr_sumuia;


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
	is_solicitantenivel=f_select_alumno_nivel(ll_cuenta)

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

public function long f_insert_solicitud ();long ll_folio
datetime ldt_fecha_inicio, ldt_fecha_final, ldt_fecha_hoy
integer li_status=0


ldt_fecha_hoy= DateTime(today(),now())

if ii_modal=1 then
	ldt_fecha_inicio=ldt_fecha_hoy
	ldt_fecha_final=ldt_fecha_hoy
	li_status=1
end if

select max(folio)
into :ll_folio
from dbo.spre_solicitud
where cvedepto =:gi_depto
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener Máximo Folio Solicitud", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return -1
end if
	
if isNull(ll_folio) then ll_folio=0

ll_folio=ll_folio+1

//Insertar Solicitud
insert into dbo.spre_solicitud
(cvedepto, folio, solicitanteid, status, cveperiodo, condicion, fecha_solicitud, fecha_inicio, 
fecha_fin, tipo_solicitud)
 
values
(:gi_depto, :ll_folio, :il_solicitante, :li_status, :ii_periodo, 0, :ldt_fecha_hoy, :ldt_fecha_inicio,
:ldt_fecha_final, :ii_tipo_usuario)


using gtr_sumuia;	

if gtr_sumuia.sqlcode<>0 then
	if ii_modal<>1 then messagebox("Error al insertar la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText) else &
	messagebox("Error al insertar la venta: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
	return -1
end if	

return(ll_folio)


end function

public subroutine f_reset_solicitud ();ii_edita=0
sle_solicitante.text=''
il_solicitante=0
is_solicitantenom=''
is_solicitantenivel=''
is_cvemat=''
il_cvegrupo=0
ii_reservados=0
il_folio_prestamo=0 
il_folio_presolicitud=0
ii_bloquea_nuevo=0
ii_multa=0

dw_solicitante.Reset()
dw_solicitante.insertrow(0)
dw_solicitante.SetItem(1, "cveperiodo", ii_periodo)	

dw_foto.Reset()
dw_foto.Modify ( "p_1.FileName='uia-n.jpg'" )



idwc_grupomat.SetFilter('')















if ii_modal=0 and gi_area = 1 then
//	if istr_pres_permisos.fecha=1 then f_fecha_fija()
end if








idwc_grupomat.Filter()
end subroutine

public subroutine f_buscar_presolicitudes ();integer li_presol, li_row
str_sol_material lstr_sol_material


//Buscar PreSolicitud y Solicitudes

lstr_sol_material.cvedepto = gi_depto
lstr_sol_material.cvearea= gi_area
lstr_sol_material.tipo_usuario = ii_tipo_usuario
lstr_sol_material.solicitanteid = il_solicitante
						
if ii_modal=0 then openwithparm(w_psi_solicitudes_hoy,lstr_sol_material)
if ii_modal=2 then openwithparm(w_psi_solicitudes_espacios,lstr_sol_material)

if isvalid(Message.PowerObjectParm) then

	lstr_sol_material = message.powerobjectparm
	
	if lstr_sol_material.multa=1 then
		if lstr_sol_material.folio_solicitud=0 then
			if lstr_sol_material.folio_presol=0 then
				messagebox('Aviso','El usuario tiene una solicitud en Multa, no puede generar una nueva Solicitud.')
			else
				messagebox('Aviso','El usuario tiene una solicitud en Multa, no puede procesar una PreSolicitud nueva.')
			end if
			f_reset_solicitud()
		else
			ii_multa=1
			if lstr_sol_material.folio_solicitud>0 then
				f_cargar_solicitud(lstr_sol_material.folio_solicitud,lstr_sol_material.folio_presol) 
			else
				f_invalidar_multa()
			end if
		end if
	else
		if lstr_sol_material.folio_solicitud>0 then 
			f_cargar_solicitud(lstr_sol_material.folio_solicitud,lstr_sol_material.folio_presol)
		else
			if lstr_sol_material.folio_presol>0 then f_cargar_presolicitud(lstr_sol_material.folio_presol)
		end if
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

		for li_i=1 to li_row
		
			lstr_sol_material.cvedepto=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_cvedepto')
			lstr_sol_material.cvearea=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_cvearea')
			lstr_sol_material.cvegrupo=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_cvegrupo')
			lstr_sol_material.cvematerial=lds_pre_materiales.GetItemString(li_i,'spre_inventario_cvematerial')
			lstr_sol_material.num_serie=lds_pre_materiales.GetItemString(li_i,'spre_inventario_num_serie')
			lstr_sol_material.nommaterial=lds_pre_materiales.GetItemString(li_i,'spre_materiales_nommaterial')
			lstr_sol_material.prestamo_unitario=lds_pre_materiales.GetItemNumber(li_i,'spre_inventario_prestamo_unitario')
			lstr_sol_material.cod_uia=lds_pre_materiales.GetItemString(li_i,'spre_inventario_cod_uia')
			lstr_sol_material.status=0
			lstr_sol_material.nomstatus='PreSolicitud'
			lstr_sol_material.fecha_inicio=lds_pre_materiales.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio')
			lstr_sol_material.fecha_final=lds_pre_materiales.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin')
			lstr_sol_material.costo_mat=lds_pre_materiales.GetItemDecimal(li_i,'spre_inventario_costo_mat')
			lstr_sol_material.folio_presol=lds_pre_materiales.GetItemNumber(li_i,'spre_pre_solicitud_folio')	
			lstr_sol_material.consec_presol=lds_pre_materiales.GetItemNumber(li_i,'spre_pre_sol_materiales_consecutivo')	
			lstr_sol_material.tipo_unidad=lds_pre_materiales.GetItemNumber(li_i,'tipo_unidad')
			lstr_sol_material.cantidad=lds_pre_materiales.GetItemNumber(li_i,'cantidad')
			lstr_sol_material.disponibilidad=lds_pre_materiales.GetItemNumber(li_i,'disponibilidad')

//			if lstr_sol_material.tipo_unidad=1 then
//				lstr_sol_material.status=0
//				f_agregar_material(lstr_sol_material,lstr_sol_material.folio_presol,0)
//			else
				f_agregar_material_presol(lstr_sol_material,lstr_sol_material.folio_presol)
//			end if
		
		next
		
	end if
	
end if
end subroutine

public subroutine f_generar_solicitud ();



end subroutine

public subroutine f_cargar_solicitud (long p_folio, long p_foliopresol);
end subroutine

public subroutine f_actualizar_materiales ();
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
//	else
//		commit using gtr_sumuia;
	end if	

return(1)


end function

public subroutine f_agregar_material_presol (str_sol_material pstr_sol_material, long p_folio_presol);string ls_find=''
integer li_existe=0, li_row, li_i, li_nuevo, li_maximo
datastore lds_presolicitados



li_nuevo=li_row+1











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

public function long f_insert_multa_material (integer p_row, long p_folio_multa, decimal p_importe);
return 1
end function

public function long f_insert_material (integer p_row, long p_folio, ref integer p_cantidad_prestada, ref long p_folio_presol, ref long p_consec_presol);integer li_cvegrupo, li_consec=0, li_tipo_unidad, li_cantidad, li_prestada, li_cantidad_prestada=0, li_cantidad_actualizar=0, li_status=0
integer li_cantidad_inicial=0
decimal ldc_costo_mat
string ls_cvematerial, ls_num_serie
datetime ldt_fecha_inicio, ldt_fecha_final, ldt_fecha_hoy
long ll_folio_presol=0, ll_consec_presol=0

ldt_fecha_hoy= DateTime(today(),now())

if ii_modal=1 then
	ldt_fecha_inicio=ldt_fecha_hoy
	ldt_fecha_final=ldt_fecha_hoy
	li_status=1
end if



if li_consec>0 then

	if ll_folio_presol>0 then p_folio_presol=ll_folio_presol
	if ll_consec_presol>0 then p_consec_presol=ll_consec_presol
	
	li_cantidad_actualizar=li_cantidad_actualizar+li_cantidad

	//Actualizar material
	update dbo.spre_sol_materiales
	set cantidad=:li_cantidad_actualizar
	where cvedepto=:gi_depto
	and folio=:p_folio
	and consecutivo=:li_consec
	
	using gtr_sumuia;

	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al actualizar la cantidad de material prestado: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	end if	
	
else
	
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
	end if
	
	
	if isNull(li_consec) then li_consec=0
	li_consec=li_consec+1
	p_cantidad_prestada=li_prestada
	
	//Insertar Material

	if ii_modal<>1 then
		//Préstamo
		insert into dbo.spre_sol_materiales
		(cvedepto, folio, consecutivo, cvearea, cvematerial, cvegrupo, num_serie,
		status, fecha_inicio, fecha_final, costo_mat, tipo_unidad, cantidad)
		 
		values
		(:gi_depto, :p_folio, :li_consec, :gi_area, :ls_cvematerial, :li_cvegrupo, :ls_num_serie,
		:li_status, :ldt_fecha_inicio, :ldt_fecha_final, :ldc_costo_mat, :li_tipo_unidad, :li_prestada )
	
		using gtr_sumuia;	
		
		if gtr_sumuia.sqlcode<>0 then
			messagebox("Error al insertar el material a la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
			rollback using gtr_sumuia;
			return -1
		end if	
		
	else	
		//Venta
		insert into dbo.spre_sol_materiales
		(cvedepto, folio, consecutivo, cvearea, cvematerial, cvegrupo, num_serie,
		status, fecha_inicio, fecha_final, costo_mat, tipo_unidad, cantidad, merma, fecha_entrega)
		 
		values
		(:gi_depto, :p_folio, :li_consec, :gi_area, :ls_cvematerial, :li_cvegrupo, :ls_num_serie,
		:li_status, :ldt_fecha_inicio, :ldt_fecha_final, :ldc_costo_mat, :li_tipo_unidad, :li_prestada, 1, :ldt_fecha_final)
	
		using gtr_sumuia;	
		
		if gtr_sumuia.sqlcode<>0 then
			messagebox("Error al insertar el material a la venta: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
			rollback using gtr_sumuia;
			return -1
		end if
		
	end if

end if
	
//Actualizar Cantidad Prestados

if ii_modal<>1 then

	if li_tipo_unidad=1 then
		
		select isnull(cantidad_prestada,0)
		into :li_cantidad_prestada
		from dbo.spre_inventario
		where cvedepto=:gi_depto
		and cvearea=:gi_area
		and cvegrupo=:li_cvegrupo
		and cvematerial=:ls_cvematerial
		and num_serie=:ls_num_serie
		using gtr_sumuia;
	
		li_cantidad_prestada=li_cantidad_prestada+li_prestada
		p_cantidad_prestada=li_cantidad_prestada
	
		update dbo.spre_inventario
		set cantidad_prestada=:li_cantidad_prestada
		where cvedepto=:gi_depto
		and cvearea=:gi_area
		and cvegrupo=:li_cvegrupo
		and cvematerial=:ls_cvematerial
		and num_serie=:ls_num_serie
		
		using gtr_sumuia;
	
		if gtr_sumuia.sqlcode<>0 then
			messagebox("Error al actualizar material prestado en inventario: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
			rollback using gtr_sumuia;
			return -1
		end if	
	
	end if

else
	select isnull(merma,0), isnull(cantidad_inicial,0)
	into :li_cantidad_prestada, :li_cantidad_inicial
	from dbo.spre_inventario
	where cvedepto=:gi_depto
	and cvearea=:gi_area
	and cvegrupo=:li_cvegrupo
	and cvematerial=:ls_cvematerial
	and num_serie=:ls_num_serie
	using gtr_sumuia;

	li_cantidad_inicial=li_cantidad_inicial - li_prestada
	li_cantidad_prestada=li_cantidad_prestada + li_prestada
	p_cantidad_prestada=li_cantidad_prestada
	
	update dbo.spre_inventario
	set merma=:li_cantidad_prestada,
	cantidad_inicial=:li_cantidad_inicial
	where cvedepto=:gi_depto
	and cvearea=:gi_area
	and cvegrupo=:li_cvegrupo
	and cvematerial=:ls_cvematerial
	and num_serie=:ls_num_serie
	
	using gtr_sumuia;

	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al actualizar material vendido en inventario: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	end if	

end if

commit using gtr_sumuia;
return(li_consec)


end function

public subroutine f_invalidar_multa ();




dw_tipo_usuario.enabled=false




end subroutine

public subroutine f_cerrar_solicitud ();
end subroutine

private subroutine f_agregar_material (str_sol_material pstr_sol_material, long p_folio_presol, integer p_rowdis);
end subroutine

on w_psi_prestamo_animales_resp.create
this.uo_1=create uo_1
this.dw_tipo_usuario=create dw_tipo_usuario
this.ole_1=create ole_1
this.dw_solicitante=create dw_solicitante
this.cb_materias=create cb_materias
this.dw_foto=create dw_foto
this.st_cuenta=create st_cuenta
this.sle_solicitante=create sle_solicitante
this.gb_busqueda=create gb_busqueda
this.gb_solicitante=create gb_solicitante
this.Control[]={this.uo_1,&
this.dw_tipo_usuario,&
this.ole_1,&
this.dw_solicitante,&
this.cb_materias,&
this.dw_foto,&
this.st_cuenta,&
this.sle_solicitante,&
this.gb_busqueda,&
this.gb_solicitante}
end on

on w_psi_prestamo_animales_resp.destroy
destroy(this.uo_1)
destroy(this.dw_tipo_usuario)
destroy(this.ole_1)
destroy(this.dw_solicitante)
destroy(this.cb_materias)
destroy(this.dw_foto)
destroy(this.st_cuenta)
destroy(this.sle_solicitante)
destroy(this.gb_busqueda)
destroy(this.gb_solicitante)
end on

event open;integer li_cuantos



f_select_anio_periodo_actual(ii_periodo,ii_anio,today())
 
dw_tipo_usuario.settransobject(gtr_sumuia)
dw_tipo_usuario.Retrieve(gi_depto,gi_area)
li_cuantos=dw_tipo_usuario.RowCount()

if ii_tipo_usuario=0 and li_cuantos>0 then ii_tipo_usuario=dw_tipo_usuario.GetItemNumber(1,'cve_tipo_usuario')
if ii_tipo_usuario=0 then sle_solicitante.enabled=false

f_marca_tipo_usuario()
 

idwc_grupomat.settransobject(gtr_sumuia)

f_conectarbd_escolar()








//f_select_prestamo_permisos(istr_pres_permisos,gi_depto,gi_area)
 
//f_reset_solicitud()

//timer(1.5)
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

event close;f_cerrar_solicitud()

disconnect using gtr_escolar;
end event

type uo_1 from uo_spre_anim_prestamos within w_psi_prestamo_animales_resp
integer x = 23
integer y = 632
integer width = 4210
integer height = 2540
integer taborder = 50
end type

on uo_1.destroy
call uo_spre_anim_prestamos::destroy
end on

type dw_tipo_usuario from datawindow within w_psi_prestamo_animales_resp
integer x = 82
integer y = 124
integer width = 425
integer height = 348
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

type ole_1 from olecustomcontrol within w_psi_prestamo_animales_resp
boolean visible = false
integer x = 3643
integer y = 148
integer width = 1061
integer height = 300
integer taborder = 40
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_psi_prestamo_animales_resp.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_solicitante from datawindow within w_psi_prestamo_animales_resp
integer x = 901
integer y = 76
integer width = 2149
integer height = 492
integer taborder = 90
string title = "none"
string dataobject = "d_gen_pres_solicitante"
boolean border = false
boolean livescroll = true
end type

type cb_materias from commandbutton within w_psi_prestamo_animales_resp
integer x = 549
integer y = 496
integer width = 338
integer height = 76
integer taborder = 100
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

type dw_foto from datawindow within w_psi_prestamo_animales_resp
integer x = 3077
integer y = 92
integer width = 462
integer height = 476
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_foto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_cuenta from statictext within w_psi_prestamo_animales_resp
integer x = 539
integer y = 156
integer width = 293
integer height = 52
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

type sle_solicitante from singlelineedit within w_psi_prestamo_animales_resp
event ue_usuario_busqueda ( )
integer x = 530
integer y = 220
integer width = 320
integer height = 76
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
		if ii_modal=1 then goto terminar
	case 1
		// 1 Existe, pero no está inscrito en el semestre
		
		if ii_modal=1 then goto terminar
			
		if ii_tipo_usuario=3 then
			ls_aviso='El maestro no se encuentra activo en este semestre.'
		else
			ls_aviso='El alumno no se encuentra inscrito en este semestre.'
		end if
		
		if istr_pres_permisos.vigente=1 then 
			//Verificar si tiene entregas pendientes
			li_materiales= f_valida_prestamos_usuario(il_solicitante,gi_depto,gi_area,ii_tipo_usuario)
			if li_materiales = 0 then
				messagebox('Atención',ls_aviso+ ' No se puede realizar el préstamo.',stopsign!)
				li_acceso=-1
			else 
				// Sólo entrega
				li_acceso= -2
			end if
		else
			Net = messagebox("Atención",ls_aviso+' ¿Desea autorizar el préstamo?', Question!, yesno!, 2)
			if Net = 1 then li_acceso=0 else li_acceso=-1
		end if

	
	case 2
		// 2 Existe, está inscrito en el semestre, no está inscrito en el departamento
	
		if ii_modal=1 then goto terminar
	
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
	//li_acceso=f_valida_multas()	
	//if li_acceso=-1  then goto terminar
	
	if ii_modal=0 then
		//Préstamo material

		//Validar un máximo de materiales en el departamento
		li_materiales= f_valida_prestamos_usuario_psic(il_solicitante,gi_depto,gi_area,ii_tipo_usuario)
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
end if


terminar:

if li_acceso=-1 then

	f_reset_solicitud()
	uo_1.visible=false
else
	
	ls_telefono=f_select_telefono_usuario(il_solicitante,gi_depto,ii_tipo_usuario)
	dw_solicitante.SetItem(1, "solicitanteid", il_solicitante)	
	dw_solicitante.SetItem(1, "solicitantenombre", is_solicitantenom)
	dw_solicitante.SetItem(1, "telefono",ls_telefono)
	
	f_carga_foto()

	uo_1.visible=true
	choose case ii_tipo_usuario
		case 1
			//Alumno
			/* params:

				idsolicitante
			nombre
			telefono
			nombre profesor
			usuario
			depto
			area

			*/
//			gi_depto,gi_area

			uo_1.inicializa(il_solicitante,1,is_solicitantenom,ls_telefono,"El profesor","El usuario",gi_depto,gi_area,gtr_escolar) 

		case 2
			
			//Intercambio
			uo_1.inicializa(il_solicitante,3,is_solicitantenom,ls_telefono,"El profesor","El usuario",gi_depto,gi_area,gtr_sumuia) 

		case 3
			//Empleado
			uo_1.inicializa(il_solicitante,2,is_solicitantenom,ls_telefono,"El profesor","El usuario",gi_depto,gi_area,gtr_escolar) 

	end choose
	

//	dw_inventario_disponible.Retrieve(gi_depto,gi_area,idt_fecha_inicio,idt_fecha_final)
	
	
	if ii_modal<>1 then 
		f_buscar_presolicitudes()
	else
		ii_reservados=0
	end if
	
end if
	
end event

event modified;event ue_usuario_busqueda()

timer(1.5)
end event

type gb_busqueda from groupbox within w_psi_prestamo_animales_resp
integer x = 64
integer y = 68
integer width = 818
integer height = 412
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

type gb_solicitante from groupbox within w_psi_prestamo_animales_resp
integer x = 27
integer y = 12
integer width = 3685
integer height = 588
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


Start of PowerBuilder Binary Data Section : Do NOT Edit
05w_psi_prestamo_animales_resp.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
15w_psi_prestamo_animales_resp.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
