$PBExportHeader$w_prestamo_material_kit.srw
forward
global type w_prestamo_material_kit from window
end type
type rb_kit from radiobutton within w_prestamo_material_kit
end type
type rb_material from radiobutton within w_prestamo_material_kit
end type
type ole_1 from olecustomcontrol within w_prestamo_material_kit
end type
type dw_tipo_usuario from datawindow within w_prestamo_material_kit
end type
type st_cod_uia from statictext within w_prestamo_material_kit
end type
type dw_reporte_mat from datawindow within w_prestamo_material_kit
end type
type sle_cod_uia from singlelineedit within w_prestamo_material_kit
end type
type cbx_todos from checkbox within w_prestamo_material_kit
end type
type dw_matgrupo from u_basedw within w_prestamo_material_kit
end type
type dw_grupomat from u_basedw within w_prestamo_material_kit
end type
type st_1 from statictext within w_prestamo_material_kit
end type
type cb_salir from commandbutton within w_prestamo_material_kit
end type
type dw_solicitados from datawindow within w_prestamo_material_kit
end type
type cb_generar from commandbutton within w_prestamo_material_kit
end type
type cb_eliminar from commandbutton within w_prestamo_material_kit
end type
type dw_disponible from datawindow within w_prestamo_material_kit
end type
type cb_buscar from commandbutton within w_prestamo_material_kit
end type
type st_5 from statictext within w_prestamo_material_kit
end type
type st_3 from statictext within w_prestamo_material_kit
end type
type st_2 from statictext within w_prestamo_material_kit
end type
type em_hora_final from editmask within w_prestamo_material_kit
end type
type em_fecha_final from editmask within w_prestamo_material_kit
end type
type st_final from statictext within w_prestamo_material_kit
end type
type em_hora_inicio from editmask within w_prestamo_material_kit
end type
type em_fecha_inicio from editmask within w_prestamo_material_kit
end type
type st_inicio from statictext within w_prestamo_material_kit
end type
type dw_solicitante from datawindow within w_prestamo_material_kit
end type
type cb_materias from commandbutton within w_prestamo_material_kit
end type
type dw_foto from datawindow within w_prestamo_material_kit
end type
type st_cuenta from statictext within w_prestamo_material_kit
end type
type sle_solicitante from singlelineedit within w_prestamo_material_kit
end type
type gb_busqueda from groupbox within w_prestamo_material_kit
end type
type gb_solicitante from groupbox within w_prestamo_material_kit
end type
type gb_solicitud from groupbox within w_prestamo_material_kit
end type
type gb_material from groupbox within w_prestamo_material_kit
end type
type gb_seleccionado from groupbox within w_prestamo_material_kit
end type
type gb_disponible from groupbox within w_prestamo_material_kit
end type
type dw_inventario_disponible from datawindow within w_prestamo_material_kit
end type
end forward

global type w_prestamo_material_kit from window
integer width = 3630
integer height = 2656
boolean titlebar = true
string title = "Préstamo de Materiales con Kit"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
rb_kit rb_kit
rb_material rb_material
ole_1 ole_1
dw_tipo_usuario dw_tipo_usuario
st_cod_uia st_cod_uia
dw_reporte_mat dw_reporte_mat
sle_cod_uia sle_cod_uia
cbx_todos cbx_todos
dw_matgrupo dw_matgrupo
dw_grupomat dw_grupomat
st_1 st_1
cb_salir cb_salir
dw_solicitados dw_solicitados
cb_generar cb_generar
cb_eliminar cb_eliminar
dw_disponible dw_disponible
cb_buscar cb_buscar
st_5 st_5
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
gb_solicitante gb_solicitante
gb_solicitud gb_solicitud
gb_material gb_material
gb_seleccionado gb_seleccionado
gb_disponible gb_disponible
dw_inventario_disponible dw_inventario_disponible
end type
global w_prestamo_material_kit w_prestamo_material_kit

type variables
n_transportar regreso, origen

integer ii_anio, ii_periodo
integer ii_tipo_usuario=0, ii_tipou_sel=0

long il_solicitante
string is_solicitantenom

long il_cvegrupo=0
string is_cvemat=''
integer ii_reservados=0

datetime idt_fecha_inicio, idt_fecha_final

DatawindowChild idwc_grupomat, idwc_matgrupo

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
public function long f_insert_solicitante (long p_folio)
public function integer f_validacion_local (str_sol_material pstr_sol_material, long p_folio_presol, integer p_rowdis, integer p_unitarios)
public function integer f_validacion_local_final (integer p_i, integer p_unitarios)
public subroutine f_generar_presolicitud (long p_folio)
public function integer f_valida_exalumno (string p_cuenta)
public function integer f_valida_alumno_dec (string p_cuenta)
public subroutine f_marca_tipo_usuario ()
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

	if gi_deptocoor=0 then return(0)
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
	
	if gi_deptocoor=0 then return(0)
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
	
	if gi_deptocoor=0 then return(0)
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
	
	IF IsNull(ls_arch_ruta) THEN 
		dw_foto.reset()
		dw_foto.Modify ( "p_1.FileName='uia-n.jpg'" )
		messagebox('Aviso','El Solicitante no tiene foto') 
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
	// aqui cph
	return 0
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

ldt_fecha_inicio=dw_solicitados.GetItemDateTime(1,'fecha_inicio')
ldt_fecha_final=dw_solicitados.GetItemDateTime(1,'fecha_final')
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
ldt_fecha_inicio=dw_solicitados.GetItemDateTime(p_row,'fecha_inicio')
ldt_fecha_final=dw_solicitados.GetItemDateTime(p_row,'fecha_final')
li_cvegrupo=dw_solicitados.GetItemNumber(p_row,'cvegrupo')
ls_cvematerial=dw_solicitados.GetItemString(p_row,'cvematerial')
ls_num_serie=dw_solicitados.GetItemString(p_row,'num_serie')
ldc_costo_mat=dw_solicitados.GetItemDecimal(p_row,'costo_mat')

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

public subroutine f_reset_solicitud ();sle_solicitante.text=''
il_solicitante=0
is_solicitantenom=''
is_cvemat=''
il_cvegrupo=0
ii_reservados=0

dw_solicitante.Reset()
dw_solicitante.insertrow(0)
dw_solicitante.SetItem(1, "cveperiodo", ii_periodo)	

dw_foto.Reset()
dw_foto.Modify ( "p_1.FileName='uia-n.jpg'" )

dw_grupomat.Reset()
dw_matgrupo.Reset()
dw_disponible.Reset()
dw_solicitados.Reset()


dw_grupomat.enabled=false
dw_matgrupo.enabled=false

cb_buscar.enabled=false
cb_eliminar.enabled=false
cb_generar.enabled=false
cb_materias.enabled=false
sle_cod_uia.enabled=false

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


end subroutine

public subroutine f_buscar_presolicitudes ();integer li_presol

origen.ii_parm1 = gi_depto
origen.ii_parm2 = gi_area
origen.il_parm2 = il_solicitante
						
openwithparm(w_gen_pre_solicitud,origen)

if isvalid(Message.PowerObjectParm) then
	regreso = message.powerobjectparm
	li_presol = regreso.ii_parm3
	f_cargar_presolicitud(li_presol)
End If	
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
	
	choose case li_status_sol
	case 0
		
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
			lstr_sol_material.status=-1
			lstr_sol_material.nomstatus='PreSolicitud'
			lstr_sol_material.fecha_inicio=lds_pre_materiales.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_inicio')
			lstr_sol_material.fecha_final=lds_pre_materiales.GetItemDateTime(li_i,'spre_pre_solicitud_fecha_fin')
			lstr_sol_material.costo_mat=lds_pre_materiales.GetItemDecimal(li_i,'spre_inventario_costo_mat')
			lstr_sol_material.folio_presol=lds_pre_materiales.GetItemNumber(li_i,'spre_pre_solicitud_folio')	
			lstr_sol_material.consec_presol=lds_pre_materiales.GetItemNumber(li_i,'spre_pre_sol_materiales_consecutivo')	

			f_agregar_material(lstr_sol_material,lstr_sol_material.folio_presol,0)
		
		next
		
	end choose

	
end if
end subroutine

public subroutine f_agregar_material (str_sol_material pstr_sol_material, long p_folio_presol, integer p_rowdis);string ls_find=''
integer li_existe=0, li_row, li_i, li_nuevo, li_maximo, li_unitarios=0

datastore lds_presolicitados

//Agregar

//Verificar que siga estando abajo de la cantidad de materiales permitidos

if (ii_reservados+1) > istr_pres_permisos.materiales and istr_pres_permisos.materiales>0 then
	messagebox('Atención','Se llegó al límite de materiales que pueden reservarse.',Exclamation!)
	return
end if


//Verificar que no esté allá abajo

ls_find="cvegrupo="+string(pstr_sol_material.cvegrupo)+" and cvematerial='"+pstr_sol_material.cvematerial+"' and num_serie='"+string(pstr_sol_material.num_serie)+"'"
li_existe=dw_solicitados.Find(ls_find,1,dw_solicitados.RowCount())

if li_existe>0 then
	messagebox('Atención','No puede reservar el mismo material dos veces.',Exclamation!)
	return
end if


//Verificar que si es unitario no haya otro abajo

if pstr_sol_material.prestamo_unitario>0 then

		li_maximo=1
		for li_i=1 to dw_solicitados.RowCount()
			
			if dw_solicitados.GetItemNumber(li_i,'cvegrupo')= pstr_sol_material.cvegrupo and dw_solicitados.GetItemString(li_i,'cvematerial')=pstr_sol_material.cvematerial then 
				li_maximo=li_maximo+1
			end if
		next
	
		if li_maximo>pstr_sol_material.prestamo_unitario then 
			messagebox('Atención','No pueden reservarse más de '+string(pstr_sol_material.prestamo_unitario)+' unidades de este mismo material.',Exclamation!)
			return
		end if
	
	
	//Verificar que si unitario que el usuario no tenga otro reservado en ese mismo lapso
	
	li_unitarios=li_maximo
	li_maximo=f_valida_prestamos_unidades(il_solicitante,gi_depto,gi_area,ii_tipo_usuario,pstr_sol_material.cvegrupo,pstr_sol_material.cvematerial,idt_fecha_inicio,idt_fecha_final)
	li_maximo=li_maximo+li_unitarios
	
	if li_maximo>pstr_sol_material.prestamo_unitario then 
		messagebox('Atención','No pueden reservarse más de '+string(pstr_sol_material.prestamo_unitario)+' unidades de este mismo material. El usuario ya tiene otra reservación en este lapso.',Exclamation!)
		return
	end if
	
end if

//Verificar si hay una validación local extra

if f_validacion_local(pstr_sol_material,p_folio_presol,p_rowdis,li_unitarios)=-1 then return


//Avisar si hay una prereservación

lds_presolicitados =  create datastore

lds_presolicitados.dataobject ='d_gen_mat_presolicitados'
lds_presolicitados.settransobject(gtr_sumuia)	
lds_presolicitados.Retrieve(gi_depto,gi_area,pstr_sol_material.cvegrupo, pstr_sol_material.cvematerial,pstr_sol_material.num_serie,idt_fecha_inicio,idt_fecha_final)
li_row = lds_presolicitados.Rowcount()


for li_i=1 to li_row
	if lds_presolicitados.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid') = il_solicitante and lds_presolicitados.GetItemNumber(li_i,'spre_pre_solicitud_folio') = p_folio_presol then
	else
		messagebox('Atención','Existe una PreSolicitud de este material '+pstr_sol_material.nommaterial+' '+pstr_sol_material.num_serie+' para el usuario '+string(lds_presolicitados.GetItemNumber(li_i,'spre_pre_solicitud_solicitanteid'))+'.')
	end if
next


li_row=dw_solicitados.RowCount()

//Actualizar las fechas de los demás materiales
for li_i=1 to li_row
	dw_solicitados.SetItem(li_i, "fecha_inicio",pstr_sol_material.fecha_inicio)
	dw_solicitados.SetItem(li_i, "fecha_final",pstr_sol_material.fecha_final)	
next


//Agregar el material

li_nuevo=li_row+1

dw_solicitados.insertrow(0)
dw_solicitados.SetItem(li_nuevo, "cvedepto",pstr_sol_material.cvedepto)	
dw_solicitados.SetItem(li_nuevo, "cvearea",pstr_sol_material.cvearea)
dw_solicitados.SetItem(li_nuevo, "cvegrupo",pstr_sol_material.cvegrupo)
dw_solicitados.SetItem(li_nuevo, "cvematerial",pstr_sol_material.cvematerial)
dw_solicitados.SetItem(li_nuevo, "num_serie",pstr_sol_material.num_serie)
dw_solicitados.SetItem(li_nuevo, "nommaterial",pstr_sol_material.nommaterial)
dw_solicitados.SetItem(li_nuevo, "status",pstr_sol_material.status)
dw_solicitados.SetItem(li_nuevo, "nomstatus",pstr_sol_material.nomstatus)
dw_solicitados.SetItem(li_nuevo, "fecha_inicio",pstr_sol_material.fecha_inicio)
dw_solicitados.SetItem(li_nuevo, "fecha_final",pstr_sol_material.fecha_final)
dw_solicitados.SetItem(li_nuevo, "cod_uia",pstr_sol_material.cod_uia)
dw_solicitados.SetItem(li_nuevo, "folio_presol",pstr_sol_material.folio_presol)
dw_solicitados.SetItem(li_nuevo, "costo_mat",pstr_sol_material.costo_mat)
dw_solicitados.SetItem(li_nuevo, "consec_presol",pstr_sol_material.consec_presol)
dw_solicitados.SetItem(li_nuevo, "prestamo_unitario",pstr_sol_material.prestamo_unitario)
dw_solicitados.SetItem(li_nuevo, "cbox",0)


cb_eliminar.enabled=true
cb_generar.enabled=true

if p_rowdis>0 then dw_disponible.DeleteRow(p_rowdis)

end subroutine

public subroutine f_generar_solicitud ();integer NET, li_i, li_consec, li_error=0, li_existe, li_maximo, li_prestamo_unitario, li_unitarios=0, il_j
datetime ldt_fecha_inicio, ldt_fecha_final
long ll_folio=0, ll_presol=0
integer li_row, li_cvegrupo, li_presol_consec[], li_j=0, ll_j
string ls_find, ls_cvematerial, ls_num_serie, ls_nommaterial
datastore lds_reservados
	
	//Revisar que todas sigan disponibles
	
	lds_reservados =  create datastore
	ldt_fecha_inicio=dw_solicitados.GetItemDateTime(1,'fecha_inicio')
	ldt_fecha_final=dw_solicitados.GetItemDateTime(1,'fecha_final')

	lds_reservados.dataobject ='d_gen_mat_reservados'
	lds_reservados.settransobject(gtr_sumuia)	

	lds_reservados.Retrieve(gi_depto,gi_area,ldt_fecha_inicio,ldt_fecha_final)
	li_row = lds_reservados.Rowcount()

	
	if li_row>0 then
	
		for li_i=1 to dw_solicitados.RowCount()
			
			li_unitarios=0
			dw_solicitados.SetItem(li_i,'color',0)
				
			li_cvegrupo=dw_solicitados.GetItemNumber(li_i,'cvegrupo')
			ls_cvematerial=dw_solicitados.GetItemString(li_i,'cvematerial')
			ls_num_serie=dw_solicitados.GetItemString(li_i,'num_serie')
			ls_nommaterial=dw_solicitados.GetItemString(li_i,'nommaterial')
			li_prestamo_unitario=dw_solicitados.GetItemNumber(li_i,'prestamo_unitario')
			
			ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
			li_existe=lds_reservados.Find(ls_find,1,li_row)
			
			if li_existe>0 then 
				messagebox('Atención','El material '+ls_nommaterial+' '+ls_num_serie+' ya no se encuentra disponible.',stopsign!)
				dw_solicitados.SetItem(li_i,'color',1)
				li_error=-1
			end if

			//Volver a verificar que si unitario que el usuario no tenga otro reservado en ese mismo lapso
			
			if li_prestamo_unitario>0 then
			
				li_maximo=0
				for li_j=1 to dw_solicitados.RowCount()
					
					if dw_solicitados.GetItemNumber(li_j,'cvegrupo')= li_cvegrupo and dw_solicitados.GetItemString(li_j,'cvematerial')=ls_cvematerial then 
						li_maximo=li_maximo+1
					end if
				next
			
				li_unitarios=li_maximo
				li_maximo=f_valida_prestamos_unidades(il_solicitante,gi_depto,gi_area,ii_tipo_usuario,li_cvegrupo,ls_cvematerial,idt_fecha_inicio,idt_fecha_final)
				li_maximo=li_maximo+li_unitarios
				
				if li_maximo>li_prestamo_unitario then 
					messagebox('Atención','No pueden reservarse más de '+string(li_prestamo_unitario)+' unidades de '+ls_nommaterial+'. El usuario ya tiene otra reservación en este lapso.',Exclamation!)
					dw_solicitados.SetItem(li_i,'color',1)
					li_error=-1
				end if
				
			end if

			//Verificar si hay una validación local extra
			if f_validacion_local_final(li_i,li_unitarios)=-1 then 
				dw_solicitados.SetItem(li_i,'color',1)
				li_error=-1
			end if	
		
		next
		
		if li_error=-1 then goto error
		
	end if
	

	//Insertar

	for li_i=1 to dw_solicitados.RowCount()

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
				
				if dw_solicitados.GetItemNumber(li_i,'folio_presol')>0 then 
					ll_presol=dw_solicitados.GetItemNumber(li_i,'folio_presol')
					li_j=li_j+1
					li_presol_consec[li_j]=dw_solicitados.GetItemNumber(li_i,'consec_presol')
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
		set status=1
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

else
	//Generar PreSolicitud (si es necesario)
	f_generar_presolicitud(ll_folio)
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



end subroutine

public function long f_insert_solicitante (long p_folio);string ls_sol_nombre, ls_sol_telefono, ls_sol_grupo, ls_sol_profesor, ls_sol_cvegrupo
long ll_sol_cvemateria
datetime ldt_fecha_hoy

ldt_fecha_hoy= DateTime(today(),now())

ls_sol_nombre=dw_solicitante.GetItemString(1,'solicitantenombre')
ls_sol_telefono=dw_solicitante.GetItemString(1,'telefono')
ls_sol_grupo=dw_solicitante.GetItemString(1,'materianombre')
ls_sol_profesor=dw_solicitante.GetItemString(1,'profesornombre')
ls_sol_cvegrupo=dw_solicitante.GetItemString(1,'cvegrupo')
ll_sol_cvemateria=dw_solicitante.GetItemNumber(1,'cvemateria')

	//Insertar Solicitud
	insert into dbo.spre_prestamo_material
	(cvedepto, folio, tipo_prestamo, solicitanteid, solicitantenombre,
	solicitantetel, solicitantegrupo, solicitanteprofesor, fechacarga, usuario,
	cvegpo_clase,cvemat_clase)

	values
	(:gi_depto, :p_folio, :ii_tipo_usuario, :il_solicitante, :ls_sol_nombre,
	:ls_sol_telefono, :ls_sol_grupo, :ls_sol_profesor, :ldt_fecha_hoy, :gs_usuario,
	:ls_sol_cvegrupo, :ll_sol_cvemateria)

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

public function integer f_validacion_local (str_sol_material pstr_sol_material, long p_folio_presol, integer p_rowdis, integer p_unitarios);


return(0) 
end function

public function integer f_validacion_local_final (integer p_i, integer p_unitarios);

return 0
end function

public subroutine f_generar_presolicitud (long p_folio);
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

public subroutine f_marca_tipo_usuario ();integer li_existe
string ls_find

if dw_tipo_usuario.RowCount()>0 then 
	ls_find="cve_tipo_usuario="+string(ii_tipo_usuario)
	li_existe=dw_tipo_usuario.Find(ls_find,1,dw_tipo_usuario.RowCount())
	if li_existe>0 then dw_tipo_usuario.ScrollToRow(li_existe)
end if

end subroutine

on w_prestamo_material_kit.create
this.rb_kit=create rb_kit
this.rb_material=create rb_material
this.ole_1=create ole_1
this.dw_tipo_usuario=create dw_tipo_usuario
this.st_cod_uia=create st_cod_uia
this.dw_reporte_mat=create dw_reporte_mat
this.sle_cod_uia=create sle_cod_uia
this.cbx_todos=create cbx_todos
this.dw_matgrupo=create dw_matgrupo
this.dw_grupomat=create dw_grupomat
this.st_1=create st_1
this.cb_salir=create cb_salir
this.dw_solicitados=create dw_solicitados
this.cb_generar=create cb_generar
this.cb_eliminar=create cb_eliminar
this.dw_disponible=create dw_disponible
this.cb_buscar=create cb_buscar
this.st_5=create st_5
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
this.gb_solicitante=create gb_solicitante
this.gb_solicitud=create gb_solicitud
this.gb_material=create gb_material
this.gb_seleccionado=create gb_seleccionado
this.gb_disponible=create gb_disponible
this.dw_inventario_disponible=create dw_inventario_disponible
this.Control[]={this.rb_kit,&
this.rb_material,&
this.ole_1,&
this.dw_tipo_usuario,&
this.st_cod_uia,&
this.dw_reporte_mat,&
this.sle_cod_uia,&
this.cbx_todos,&
this.dw_matgrupo,&
this.dw_grupomat,&
this.st_1,&
this.cb_salir,&
this.dw_solicitados,&
this.cb_generar,&
this.cb_eliminar,&
this.dw_disponible,&
this.cb_buscar,&
this.st_5,&
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
this.gb_solicitante,&
this.gb_solicitud,&
this.gb_material,&
this.gb_seleccionado,&
this.gb_disponible,&
this.dw_inventario_disponible}
end on

on w_prestamo_material_kit.destroy
destroy(this.rb_kit)
destroy(this.rb_material)
destroy(this.ole_1)
destroy(this.dw_tipo_usuario)
destroy(this.st_cod_uia)
destroy(this.dw_reporte_mat)
destroy(this.sle_cod_uia)
destroy(this.cbx_todos)
destroy(this.dw_matgrupo)
destroy(this.dw_grupomat)
destroy(this.st_1)
destroy(this.cb_salir)
destroy(this.dw_solicitados)
destroy(this.cb_generar)
destroy(this.cb_eliminar)
destroy(this.dw_disponible)
destroy(this.cb_buscar)
destroy(this.st_5)
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
destroy(this.gb_solicitante)
destroy(this.gb_solicitud)
destroy(this.gb_material)
destroy(this.gb_seleccionado)
destroy(this.gb_disponible)
destroy(this.dw_inventario_disponible)
end on

event open;integer li_cuantos

w_ppal.toolbarvisible=false

dw_inventario_disponible.settransobject(gtr_sumuia)

f_select_anio_periodo_actual(ii_periodo,ii_anio,today())


gb_material.enabled=true

 
// cph aqui
//messagebox("cph",string(ii_periodo))
if (isnull(ii_periodo)) then
	messagebox("Aviso","No se encuentra configurado el periodo en SPRE PERIODOS, No se puede realizar el prestamo")
	close(this)
	return
end if
 
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



dw_solicitados.object.nomtipo.visible=false
dw_solicitados.object.nomtamano.visible=false

f_select_prestamo_permisos(istr_pres_permisos,gi_depto,gi_area)

f_reset_solicitud()

timer(1.5) 
end event

event timer;string a="", ls_nomina = "", ls_mensaje = "", ls_digito=''
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

event close;w_ppal.toolbarvisible=true
end event

type rb_kit from radiobutton within w_prestamo_material_kit
integer x = 1111
integer y = 708
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Kit"
end type

event clicked;dw_grupomat.dataobject="dw_dddw_kits"

dw_grupomat.settransobject(gtr_sumuia)
dw_grupomat.getchild('descripcion',idwc_grupomat)
idwc_grupomat.settransobject(gtr_sumuia)
idwc_grupomat.Retrieve(gi_depto,gi_area)

dw_matgrupo.visible=true
st_1.text="Kit de Materiales"

if idwc_grupomat.rowcount()>0 then dw_grupomat.insertrow(0)

dw_matgrupo.visible=false
st_5.visible=false

end event

type rb_material from radiobutton within w_prestamo_material_kit
integer x = 265
integer y = 704
integer width = 521
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Grupo Material"
boolean checked = true
end type

event clicked;//d_gen_grupomat_p

dw_grupomat.enabled=true
dw_grupomat.dataobject="d_gen_grupomat_p"
dw_grupomat.settransobject(gtr_sumuia)
dw_grupomat.getchild('descripcion',idwc_grupomat)
idwc_grupomat.settransobject(gtr_sumuia)
idwc_grupomat.Retrieve(gi_depto,gi_area)

dw_matgrupo.visible=true
st_5.visible=true
st_1.text="Grupo"

if idwc_grupomat.rowcount()>0 then dw_grupomat.insertrow(0)



end event

type ole_1 from olecustomcontrol within w_prestamo_material_kit
boolean visible = false
integer x = 2066
integer y = 580
integer width = 1061
integer height = 300
integer taborder = 100
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_prestamo_material_kit.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_tipo_usuario from datawindow within w_prestamo_material_kit
integer x = 78
integer y = 124
integer width = 425
integer height = 332
integer taborder = 280
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

type st_cod_uia from statictext within w_prestamo_material_kit
integer x = 3223
integer y = 1048
integer width = 370
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Código UIA"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_reporte_mat from datawindow within w_prestamo_material_kit
boolean visible = false
integer x = 3442
integer y = 1236
integer width = 101
integer height = 56
integer taborder = 10
string title = "none"
string dataobject = "d_gen_rep_solicitud_mat"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.setTransObject(gtr_sumuia)
end event

type sle_cod_uia from singlelineedit within w_prestamo_material_kit
integer x = 3237
integer y = 1116
integer width = 334
integer height = 76
integer taborder = 220
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
string ls_codigo, ls_cvematerial, ls_num_serie, ls_find
integer li_existe, li_cvegrupo, li_i
str_sol_material lstr_sol_material

ls_codigo=trim(this.text)

if ls_codigo<>'' then

	dw_inventario_disponible.Reset()
	dw_inventario_disponible.Retrieve(gi_depto,gi_area,idt_fecha_inicio,idt_fecha_final,ls_codigo)

	for li_i=1 to dw_solicitados.RowCount()
		
			li_cvegrupo=dw_solicitados.GetItemNumber(li_i,'cvegrupo')
			ls_cvematerial=dw_solicitados.GetItemString(li_i,'cvematerial')
			ls_num_serie=dw_solicitados.GetItemString(li_i,'num_serie')
			
			//En inventario
			ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
			li_existe=dw_inventario_disponible.Find(ls_find,1,dw_inventario_disponible.RowCount())
			if li_existe>0 then dw_inventario_disponible.SetItem(li_existe,'marcado',1)
	
	next
	
	dw_inventario_disponible.SetFilter('marcado=0')
	dw_inventario_disponible.Filter()
	li_existe=dw_inventario_disponible.RowCount()

	if li_existe>0 then

		lstr_sol_material.cvedepto=dw_inventario_disponible.GetItemNumber(li_existe,'spre_inventario_cvedepto')
		lstr_sol_material.cvearea=dw_inventario_disponible.GetItemNumber(li_existe,'spre_inventario_cvearea')
		lstr_sol_material.cvegrupo=dw_inventario_disponible.GetItemNumber(li_existe,'spre_inventario_cvegrupo')
		lstr_sol_material.cvematerial=dw_inventario_disponible.GetItemString(li_existe,'spre_inventario_cvematerial')
		lstr_sol_material.num_serie=dw_inventario_disponible.GetItemString(li_existe,'spre_inventario_num_serie')
		lstr_sol_material.nommaterial=dw_inventario_disponible.GetItemString(li_existe,'spre_materiales_nommaterial')
		lstr_sol_material.prestamo_unitario=dw_inventario_disponible.GetItemNumber(li_existe,'spre_inventario_prestamo_unitario')
		lstr_sol_material.cod_uia=dw_inventario_disponible.GetItemString(li_existe,'spre_inventario_cod_uia')
		lstr_sol_material.status=-1
		lstr_sol_material.nomstatus='Solicitud'
		lstr_sol_material.fecha_inicio=idt_fecha_inicio
		lstr_sol_material.fecha_final=idt_fecha_final
		lstr_sol_material.costo_mat=dw_inventario_disponible.GetItemDecimal(li_existe,'spre_inventario_costo_mat')
		
		f_agregar_material(lstr_sol_material,0,0)
		
	else
		messagebox('Atención','El material '+ls_codigo+' no existe o ya se encuentra prestado.',stopsign!)		
	end if
end if

this.text=''

dw_inventario_disponible.SetFilter('')
dw_inventario_disponible.Filter()
dw_inventario_disponible.Reset()
end event

type cbx_todos from checkbox within w_prestamo_material_kit
integer x = 3227
integer y = 1800
integer width = 302
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

for li_i=1 to dw_solicitados.RowCount() 
	dw_solicitados.SetItem(li_i,'cbox',li_valor)
next
end event

type dw_matgrupo from u_basedw within w_prestamo_material_kit
integer x = 613
integer y = 884
integer width = 1467
integer height = 80
integer taborder = 150
boolean enabled = false
string dataobject = "d_gen_matgrupo_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;is_cvemat=this.gettext()

dw_disponible.Reset()
end event

type dw_grupomat from u_basedw within w_prestamo_material_kit
integer x = 613
integer y = 792
integer width = 1467
integer height = 80
integer taborder = 60
boolean enabled = false
string dataobject = "d_gen_grupomat_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then  il_cvegrupo=long(trim(this.gettext()))
is_cvemat=''
dw_matgrupo.Reset()


// los 3 comentarios de abajo cph

if rb_kit.checked=false then
	idwc_matgrupo.Retrieve(gi_depto,gi_area,il_cvegrupo)
	if idwc_matgrupo.RowCount()>0 then dw_matgrupo.insertrow(0)
end if

//dw_disponible.Reset()

end event

type st_1 from statictext within w_prestamo_material_kit
integer x = 59
integer y = 800
integer width = 530
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Grupo"
boolean focusrectangle = false
end type

type cb_salir from commandbutton within w_prestamo_material_kit
integer x = 27
integer y = 2432
integer width = 302
integer height = 92
integer taborder = 230
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Salir"
end type

event clicked;close(w_prestamo_material_kit)
end event

type dw_solicitados from datawindow within w_prestamo_material_kit
integer x = 69
integer y = 1780
integer width = 3131
integer height = 592
integer taborder = 190
string title = "none"
string dataobject = "d_gen_prestamo_materiales"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_generar from commandbutton within w_prestamo_material_kit
integer x = 3264
integer y = 2428
integer width = 293
integer height = 92
integer taborder = 260
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Generar"
end type

event clicked;if dw_solicitados.RowCount()>0 then f_generar_solicitud()
end event

type cb_eliminar from commandbutton within w_prestamo_material_kit
integer x = 3223
integer y = 1880
integer width = 274
integer height = 92
integer taborder = 240
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Eliminar"
end type

event clicked;integer NET, li_i,  li_marcado=0

Net = messagebox("Atención",' ¿Desea eliminar todos los materiales marcados?', Question!, yesno!, 2)

if Net = 1 then

	for li_i=1 to dw_solicitados.RowCount()
		if dw_solicitados.GetItemNumber(li_i,'cbox') = 1 then  li_marcado=1
	next
	
	if li_marcado=0 then
		messagebox('Atención','Debe seleccionar algún material.')
		return
	end if


	for li_i=1 to dw_solicitados.RowCount()
		if dw_solicitados.GetItemNumber(li_i,'cbox') = 1 then	
			dw_solicitados.DeleteRow(li_i)
			li_i=li_i -1 
		end if
	next

end if



end event

type dw_disponible from datawindow within w_prestamo_material_kit
integer x = 69
integer y = 1080
integer width = 3113
integer height = 572
integer taborder = 200
string dataobject = "d_gen_prestamo_disponible"
boolean vscrollbar = true
boolean livescroll = true
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
lstr_sol_material.prestamo_unitario=this.GetItemNumber(row,'spre_inventario_prestamo_unitario')
lstr_sol_material.cod_uia=this.GetItemString(row,'spre_inventario_cod_uia')
lstr_sol_material.status=-1
lstr_sol_material.nomstatus='Solicitud'
lstr_sol_material.fecha_inicio=idt_fecha_inicio
lstr_sol_material.fecha_final=idt_fecha_final
lstr_sol_material.costo_mat=this.GetItemDecimal(row,'spre_inventario_costo_mat')

f_agregar_material(lstr_sol_material,0,row)




end event

type cb_buscar from commandbutton within w_prestamo_material_kit
integer x = 3205
integer y = 876
integer width = 311
integer height = 80
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

event clicked;datetime ldt_hoy, ldt_fecha_inicio, ldt_fecha_final
integer li_row, li_i, li_cvegrupo, li_existe
string ls_cvematerial, ls_num_serie, ls_nommaterial, ls_find


ldt_fecha_inicio=datetime(date(em_fecha_inicio.text),time(em_hora_inicio.text))
ldt_fecha_final=datetime(date(em_fecha_final.text),time(em_hora_final.text))
ldt_hoy=datetime(today(),time('00:00:00'))


// se agrega porque como esta arriba no saca correctamente la fecha
/*
datetime fecha_larga

string dia_str,mes_str,anio_str,fecha_completa


dia_str=mid(em_fecha_inicio.text,1,2)
mes_str=mid(em_fecha_inicio.text,4,2)
anio_str=mid(em_fecha_inicio.text,7,4)


ldt_fecha_inicio=crea_fecha_hora(dia_str,mes_str,anio_str,em_hora_inicio.text)


//messagebox("cph",string(ldt_fecha_inicio))


dia_str=mid(em_fecha_final.text,1,2)
mes_str=mid(em_fecha_final.text,4,2)
anio_str=mid(em_fecha_final.text,7,4)


ldt_fecha_final=crea_fecha_hora(dia_str,mes_str,anio_str,em_hora_final.text)


//messagebox("cph",string(ldt_fecha_final))

*/

if ldt_fecha_inicio>=ldt_fecha_final or ldt_fecha_inicio<ldt_hoy or ldt_fecha_final<=ldt_hoy then
	messagebox('Aviso','La fecha inicial debe ser menor a la final, ambas mayores a este momento.')
	return
end if

if(rb_material.checked=true) then
	dw_disponible.dataobject="d_gen_prestamo_disponible"
	dw_disponible.settransobject(gtr_sumuia)
else
	dw_disponible.dataobject="d_gen_prestamo_disponible_consu_kit"
	dw_disponible.settransobject(gtr_sumuia)	
end if

//messagebox('',string(gi_depto)+' '+string(gi_area)+' '+string(il_cvegrupo)+' '+is_cvemat)
dw_disponible.SetRedraw(false)
dw_disponible.Reset()
dw_disponible.Retrieve(gi_depto,gi_area,il_cvegrupo,is_cvemat,ldt_fecha_inicio,ldt_fecha_final)
dw_disponible.SetRedraw(true)

//Solicitados, hacer NO disponible en la seleccion actual
	
for li_i=1 to dw_solicitados.RowCount()
		li_cvegrupo=dw_solicitados.GetItemNumber(li_i,'cvegrupo')
		ls_cvematerial=dw_solicitados.GetItemString(li_i,'cvematerial')
		ls_num_serie=dw_solicitados.GetItemString(li_i,'num_serie')
		ls_nommaterial=dw_solicitados.GetItemString(li_i,'nommaterial')
		
		//En inventario
		ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
		li_existe=dw_disponible.Find(ls_find,1,dw_disponible.RowCount())
		if li_existe>0 then dw_disponible.DeleteRow(li_existe)
next


if ldt_fecha_inicio<>idt_fecha_inicio or ldt_fecha_final<>idt_fecha_final then

	li_row=dw_solicitados.RowCount()
	
	//Actualizar las fechas de los demás materiales
	for li_i=1 to li_row
		dw_solicitados.SetItem(li_i, "fecha_inicio",ldt_fecha_inicio)
		dw_solicitados.SetItem(li_i, "fecha_final",ldt_fecha_final)	
	next
	
end if

idt_fecha_inicio=ldt_fecha_inicio
idt_fecha_final=ldt_fecha_final

cb_generar.enabled=true
end event

type st_5 from statictext within w_prestamo_material_kit
integer x = 59
integer y = 900
integer width = 293
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Material"
boolean focusrectangle = false
end type

type st_3 from statictext within w_prestamo_material_kit
integer x = 3122
integer y = 784
integer width = 151
integer height = 52
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

type st_2 from statictext within w_prestamo_material_kit
integer x = 3104
integer y = 704
integer width = 178
integer height = 52
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

type em_hora_final from editmask within w_prestamo_material_kit
integer x = 3310
integer y = 768
integer width = 215
integer height = 72
integer taborder = 170
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
end type

event modified;dw_disponible.Reset()
cb_generar.enabled=false

end event

type em_fecha_final from editmask within w_prestamo_material_kit
integer x = 2697
integer y = 768
integer width = 375
integer height = 72
integer taborder = 120
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

type st_final from statictext within w_prestamo_material_kit
integer x = 2263
integer y = 776
integer width = 480
integer height = 72
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

type em_hora_inicio from editmask within w_prestamo_material_kit
integer x = 3310
integer y = 688
integer width = 215
integer height = 72
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
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
end type

event modified;dw_disponible.Reset()
cb_generar.enabled=false

end event

type em_fecha_inicio from editmask within w_prestamo_material_kit
integer x = 2697
integer y = 688
integer width = 375
integer height = 72
integer taborder = 130
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

type st_inicio from statictext within w_prestamo_material_kit
integer x = 2263
integer y = 692
integer width = 485
integer height = 72
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

type dw_solicitante from datawindow within w_prestamo_material_kit
integer x = 901
integer y = 76
integer width = 2149
integer height = 488
integer taborder = 70
string title = "none"
string dataobject = "d_gen_pres_solicitante"
boolean border = false
boolean livescroll = true
end type

type cb_materias from commandbutton within w_prestamo_material_kit
integer x = 549
integer y = 488
integer width = 338
integer height = 76
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Materias"
end type

event clicked;datetime ldt_fecha1
datetime ldt_fecha2
string ls_hora

origen.ii_parm1 = ii_tipo_usuario
origen.il_parm1 = il_solicitante

openwithparm(w_gen_mat_insc,origen)

if isvalid(Message.PowerObjectParm) then

	regreso = message.powerobjectparm
	dw_solicitante.setitem(1,'materianombre',regreso.is_parm2)
	dw_solicitante.setitem(1,'profesornombre',regreso.is_parm3)
	dw_solicitante.setitem(1,'cvemateria',regreso.ii_parm4)
	dw_solicitante.setitem(1,'cvegrupo',regreso.is_parm5)

	if regreso.ii_parm9<10 then ls_hora='0'+string(regreso.ii_parm9) else ls_hora=string(regreso.ii_parm9)
	ldt_fecha1=DateTime(today(),time(ls_hora+':00:00'))
	em_hora_inicio.text=ls_hora
	
	if regreso.ii_parm10<10 then ls_hora='0'+string(regreso.ii_parm10) else ls_hora=string(regreso.ii_parm10)
	ldt_fecha2=DateTime(today(),time(ls_hora+':00:00'))
	em_hora_final.text=ls_hora
	
	dw_solicitante.setitem(1,'fecha_inicio',ldt_fecha1)
	dw_solicitante.setitem(1,'fecha_final',ldt_fecha2)
	
	
end if
end event

type dw_foto from datawindow within w_prestamo_material_kit
integer x = 3077
integer y = 88
integer width = 462
integer height = 472
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_foto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_cuenta from statictext within w_prestamo_material_kit
integer x = 535
integer y = 152
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

type sle_solicitante from singlelineedit within w_prestamo_material_kit
event ue_usuario_busqueda ( )
integer x = 526
integer y = 220
integer width = 320
integer height = 72
integer taborder = 50
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



accesos:

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
			if Net = 1 then 
				
				li_acceso=0 
				
				if gi_deptocoor>0 then
					
					choose case ii_tipo_usuario
						case 1
							if (f_valida_mat_alumno_depto(il_solicitante,gi_deptocoor, ii_anio,ii_periodo))=0 then li_acceso=2
						case 2
							if (f_valida_mat_intercambio_depto(il_solicitante,gs_deptocoor, ii_anio,ii_periodo))=0 then li_acceso=2
						case 3
							if (f_valida_mat_empleado_depto(il_solicitante,gi_deptocoor, ii_anio,ii_periodo))=0 then li_acceso=2
					end choose
					
					if li_acceso=2 then goto accesos

				end if
			else 
				li_acceso=-1
			end if
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
	li_acceso=f_valida_multas()	
	
	
	
	if li_acceso=-1  then goto terminar
	
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
	
	dw_grupomat.enabled=true
	dw_matgrupo.enabled=true

	
	cb_buscar.enabled=true
	sle_cod_uia.enabled=true
	if ii_tipo_usuario<>2 then cb_materias.enabled=true
	
	f_buscar_presolicitudes()
	
end if
	
end event

event modified;event ue_usuario_busqueda()

timer(1.5)
end event

type gb_busqueda from groupbox within w_prestamo_material_kit
integer x = 64
integer y = 68
integer width = 818
integer height = 396
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

type gb_solicitante from groupbox within w_prestamo_material_kit
integer x = 27
integer y = 12
integer width = 3543
integer height = 584
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

type gb_solicitud from groupbox within w_prestamo_material_kit
integer x = 2226
integer y = 608
integer width = 1344
integer height = 388
integer taborder = 140
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

type gb_material from groupbox within w_prestamo_material_kit
integer x = 27
integer y = 608
integer width = 2094
integer height = 388
integer taborder = 110
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

type gb_seleccionado from groupbox within w_prestamo_material_kit
integer x = 27
integer y = 1716
integer width = 3525
integer height = 692
integer taborder = 210
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Material Seleccionado"
end type

type gb_disponible from groupbox within w_prestamo_material_kit
integer x = 27
integer y = 1020
integer width = 3182
integer height = 668
integer taborder = 250
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = " Material Disponible"
end type

type dw_inventario_disponible from datawindow within w_prestamo_material_kit
integer x = 3941
integer y = 92
integer width = 105
integer height = 108
integer taborder = 270
boolean bringtotop = true
string title = "none"
string dataobject = "d_gen_mat_es_disponible"
borderstyle borderstyle = stylelowered!
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Dw_prestamo_material_kit.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Dw_prestamo_material_kit.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
