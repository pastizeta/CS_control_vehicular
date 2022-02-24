$PBExportHeader$w_imd_agregar_lista_espera.srw
forward
global type w_imd_agregar_lista_espera from window
end type
type mle_nombre from multilineedit within w_imd_agregar_lista_espera
end type
type dw_tipo_usuario from datawindow within w_imd_agregar_lista_espera
end type
type cb_agregar from commandbutton within w_imd_agregar_lista_espera
end type
type st_final from statictext within w_imd_agregar_lista_espera
end type
type st_inicio from statictext within w_imd_agregar_lista_espera
end type
type em_fecha_inicio from editmask within w_imd_agregar_lista_espera
end type
type em_fecha_final from editmask within w_imd_agregar_lista_espera
end type
type st_3 from statictext within w_imd_agregar_lista_espera
end type
type st_2 from statictext within w_imd_agregar_lista_espera
end type
type em_hora_inicio from editmask within w_imd_agregar_lista_espera
end type
type em_hora_final from editmask within w_imd_agregar_lista_espera
end type
type st_cuenta from statictext within w_imd_agregar_lista_espera
end type
type sle_solicitante from singlelineedit within w_imd_agregar_lista_espera
end type
type ole_1 from olecustomcontrol within w_imd_agregar_lista_espera
end type
end forward

global type w_imd_agregar_lista_espera from window
integer width = 1744
integer height = 794
boolean titlebar = true
string title = "Lista de Espera"
boolean controlmenu = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
mle_nombre mle_nombre
dw_tipo_usuario dw_tipo_usuario
cb_agregar cb_agregar
st_final st_final
st_inicio st_inicio
em_fecha_inicio em_fecha_inicio
em_fecha_final em_fecha_final
st_3 st_3
st_2 st_2
em_hora_inicio em_hora_inicio
em_hora_final em_hora_final
st_cuenta st_cuenta
sle_solicitante sle_solicitante
ole_1 ole_1
end type
global w_imd_agregar_lista_espera w_imd_agregar_lista_espera

type variables
long il_solicitante=0
integer ii_anio, ii_periodo, ii_tipo_usuario=0, ii_cvearea=0
integer ii_tipo_espacio=0, ii_tipou_sel=0
string is_solicitantenom=''

str_pres_permisos istr_pres_permisos
str_pres_control istr_pres_control

datetime idt_fecha_inicio, idt_fecha_final
end variables

forward prototypes
public function integer f_valida_alumno_intercambio (string p_cuenta)
public function integer f_valida_empleado (string p_cuenta)
public function integer f_valida_alumno (string p_cuenta)
public function integer f_validar_suspendido ()
public function integer f_valida_acceso ()
public function integer f_valida_multas ()
public subroutine f_reset_solicitud ()
public subroutine f_usuario_busqueda ()
public function integer f_valida_exalumno (string p_cuenta)
public function integer f_valida_alumno_dec (string p_cuenta)
end prototypes

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

public function integer f_validar_suspendido ();integer li_suspendido, li_dias_retraso

li_suspendido=f_valida_solicitante_bloqueado(gi_depto,ii_cvearea,ii_anio, ii_periodo,il_solicitante,ii_tipo_usuario)

if li_suspendido=0 then
	
	li_dias_retraso=f_select_solicitante_retraso(gi_depto,ii_cvearea,ii_anio, ii_periodo,il_solicitante,ii_tipo_usuario)

	if li_dias_retraso>istr_pres_permisos.suspendido then
		f_insert_solicitante_bloqueado(gi_depto,ii_cvearea,ii_anio, ii_periodo,il_solicitante,ii_tipo_usuario)
		messagebox("Atención","El usuario excedió los días "+string(istr_pres_permisos.suspendido) +" de retraso permitidos al entregar material, el servicio de reservación queda suspendido.",exclamation!)
		return -1
	end if

else
	
	messagebox("Atención","El usuario excedió los días "+string(istr_pres_permisos.suspendido) +" de retraso permitidos al entregar material, el servicio de reservación queda suspendido.",exclamation!)
	return -1

end if
end function

public function integer f_valida_acceso ();integer li_acceso=-1, li_row, li_materiales, NET, li_suspendido=0, li_reservados
string ls_aviso, ls_telefono, ls_solicitante
str_descripcion lstr_descripcion

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
			ls_aviso='El solicitante '+string(il_solicitante)+' '+is_solicitantenom+' no se encuentra activo en este semestre.'
		else
			ls_aviso='El alumno '+is_solicitantenom+' no se encuentra inscrito en este semestre.'
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
	li_acceso=f_valida_multas()	
	if li_acceso=-1  then goto terminar
	
end if


terminar:

return (li_acceso)
end function

public function integer f_valida_multas ();integer li_acceso=0, li_row, li_i
datastore lds_multa_depto, lds_multa_todos

lds_multa_depto =  create datastore
lds_multa_todos =  create datastore

//Si hay Multa en el departamento, no permite reservar

	lds_multa_depto.dataobject ='d_gen_select_multa_depto'
	lds_multa_depto.settransobject(gtr_sumuia)	
	lds_multa_depto.Retrieve(il_solicitante,ii_tipo_usuario,gi_depto,ii_cvearea)
	li_row = lds_multa_depto.Rowcount()

	for li_i=1 to li_row
		Messagebox("Atención","El solicitante "+string(il_solicitante)+" "+is_solicitantenom+ " presenta una multa en el área: "&
		+lds_multa_depto.GetitemString(li_i,'area')+"~r~nFolio: "+string(lds_multa_depto.GetItemNumber(li_i,'folio_multa'))+"~r~nNo se puede realizar el préstamo.",stopsign!)
		li_acceso= -1
	next
	
//Si hay Multa en otros lados es meramente informativo

	lds_multa_todos.dataobject ='d_gen_select_multa_todo'
	lds_multa_todos.settransobject(gtr_sumuia)	
	lds_multa_todos.Retrieve(il_solicitante,ii_tipo_usuario,gi_depto,ii_cvearea)
	li_row = lds_multa_todos.Rowcount()

	for li_i=1 to li_row
		Messagebox("Atención","El solicitante "+string(il_solicitante)+" "+is_solicitantenom+ " presenta una multa en el área: "&
		+lds_multa_todos.GetitemString(li_i,'area')+"~r~nFolio: "+string(lds_multa_todos.GetItemNumber(li_i,'folio_multa')),Information!)
	next
	
	
return(li_acceso)
end function

public subroutine f_reset_solicitud ();//sle_solicitante.text=''
mle_nombre.text=''
il_solicitante=0
is_solicitantenom=''

cb_agregar.enabled=false
sle_solicitante.SetFocus()


end subroutine

public subroutine f_usuario_busqueda ();integer li_acceso
string ls_depto=''


idt_fecha_inicio=datetime(date(em_fecha_inicio.text),time(em_hora_inicio.text))
idt_fecha_final=datetime(date(em_fecha_final.text),time(em_hora_final.text))
f_select_anio_periodo_actual(ii_periodo,ii_anio,Date(idt_fecha_inicio))

li_acceso=f_valida_acceso()

if li_acceso=-1 then
	
	f_reset_solicitud()
	cb_agregar.enabled=false
	
else

	choose case ii_tipo_usuario
		case 1
			ls_depto=f_select_departamento_alumno(il_solicitante, ii_anio,ii_periodo)
		case 2
			ls_depto=f_select_departamento_intercambio(il_solicitante, ii_anio,ii_periodo)
		case 3
			ls_depto=f_select_departamento_profesor(il_solicitante, ii_anio,ii_periodo)
		case 4
			ls_depto=f_select_departamento_exalumno(il_solicitante, ii_anio,ii_periodo)
	end choose

	if isNull(ls_depto) then ls_depto=''

	mle_nombre.text=is_solicitantenom+"~r~n"+ls_depto
	cb_agregar.enabled=true
	
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
			messagebox('Aviso','La cuenta no es válida.')
			return (-1)			
		case 0
			return (1)			
	end choose

	if (f_valida_mat_exalumno_depto(ll_cuenta,gi_deptocoor, ii_anio,ii_periodo))=0 then return(2)
	
else
	messagebox('Aviso','La cuenta '+string(il_solicitante)+' no es válida.')
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
			messagebox('Aviso','La cuenta no es válida.')
			return (-1)			
	end choose
	
	return(2)
	
else
	messagebox('Aviso','La cuenta '+string(il_solicitante)+' no es válida.')
	return (-1)	
end if

return (0)
end function

on w_imd_agregar_lista_espera.create
this.mle_nombre=create mle_nombre
this.dw_tipo_usuario=create dw_tipo_usuario
this.cb_agregar=create cb_agregar
this.st_final=create st_final
this.st_inicio=create st_inicio
this.em_fecha_inicio=create em_fecha_inicio
this.em_fecha_final=create em_fecha_final
this.st_3=create st_3
this.st_2=create st_2
this.em_hora_inicio=create em_hora_inicio
this.em_hora_final=create em_hora_final
this.st_cuenta=create st_cuenta
this.sle_solicitante=create sle_solicitante
this.ole_1=create ole_1
this.Control[]={this.mle_nombre,&
this.dw_tipo_usuario,&
this.cb_agregar,&
this.st_final,&
this.st_inicio,&
this.em_fecha_inicio,&
this.em_fecha_final,&
this.st_3,&
this.st_2,&
this.em_hora_inicio,&
this.em_hora_final,&
this.st_cuenta,&
this.sle_solicitante,&
this.ole_1}
end on

on w_imd_agregar_lista_espera.destroy
destroy(this.mle_nombre)
destroy(this.dw_tipo_usuario)
destroy(this.cb_agregar)
destroy(this.st_final)
destroy(this.st_inicio)
destroy(this.em_fecha_inicio)
destroy(this.em_fecha_final)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_hora_inicio)
destroy(this.em_hora_final)
destroy(this.st_cuenta)
destroy(this.sle_solicitante)
destroy(this.ole_1)
end on

event timer;string a="", ls_nomina = "", ls_mensaje = "", ls_digito
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
					
				case 5
					//Chip DEC
					f_conectarbd_decse()

					SELECT convert(varchar(20), cuenta)
					Into :ls_nomina
					FROM dbo.datpersonales
					WHERE nchip_cl = :a
					Using gtr_decse;
						
					if gtr_decse.sqlcode=0 then
						ls_digito=f_obten_digito(integer(ls_nomina))
						sle_solicitante.text = ls_nomina+ls_digito
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

event open;integer li_cuantos=0

dw_tipo_usuario.settransobject(gtr_sumuia)

istr_pres_control = message.powerobjectparm
ii_cvearea=istr_pres_control.cvearea
ii_tipo_espacio=istr_pres_control.tipo_espacio

dw_tipo_usuario.Retrieve(gi_depto,ii_cvearea)
li_cuantos=dw_tipo_usuario.RowCount()

if ii_tipo_usuario=0 and li_cuantos>0 then ii_tipo_usuario=dw_tipo_usuario.GetItemNumber(1,'cve_tipo_usuario')
if ii_tipo_usuario=0 then sle_solicitante.enabled=false

if li_cuantos>0 then dw_tipo_usuario.ScrollToRow(1)


this.title='Lista de Espera '+istr_pres_control.nom_area

em_fecha_inicio.text=string(today())
em_fecha_final.text=string(today())
em_hora_inicio.text=string(hour(now())+1)
em_hora_final.text=string(hour(now())+2)

idt_fecha_inicio=datetime(date(em_fecha_inicio.text),time(em_hora_inicio.text))
idt_fecha_final=datetime(date(em_fecha_final.text),time(em_hora_final.text))


f_select_anio_periodo_actual(ii_periodo,ii_anio,today())
f_select_prestamo_permisos(istr_pres_permisos,gi_depto,ii_cvearea)
f_reset_solicitud()

timer(1.5)


end event

type mle_nombre from multilineedit within w_imd_agregar_lista_espera
integer x = 26
integer y = 384
integer width = 1649
integer height = 147
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

type dw_tipo_usuario from datawindow within w_imd_agregar_lista_espera
integer x = 26
integer y = 29
integer width = 391
integer height = 339
integer taborder = 20
string title = "none"
string dataobject = "d_gen_cat_area_acceso_tipousuario"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then 
	ii_tipou_sel=this.GetItemNumber(currentrow,'cve_tipo_usuario')
	sle_solicitante.SetFocus()
	timer(1.5)
end if 
end event

type cb_agregar from commandbutton within w_imd_agregar_lista_espera
integer x = 1317
integer y = 576
integer width = 366
integer height = 93
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Agregar"
end type

event clicked;integer NET
long ll_folio
datetime ldt_ahora

ldt_ahora=DateTime(today(),now())

Net=messagebox("Atención",'¿Desea agregar la solicitud a la lista de espera?', Question!, yesno!, 2)

if Net=1 then
	

	select max(folio)
	into :ll_folio
	from dbo.spre_pre_solicitud
	where cvedepto =:gi_depto
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener Máximo Folio PreSolicitud", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(ll_folio) then ll_folio=0
	ll_folio=ll_folio+1


	//Insertar PreSolicitud
	insert into dbo.spre_pre_solicitud
	(cvedepto, folio, solicitanteid, status, cveperiodo, fecha_solicitud, fecha_inicio,
	fecha_fin, tipo_solicitud, tipo_prestamo, solicitantenombre, autorizada, cvearea)
	 
	values
	(:gi_depto, :ll_folio, :il_solicitante, 0, :ii_periodo , :ldt_ahora, :idt_fecha_inicio,
	:idt_fecha_final, 0, :ii_tipo_usuario, :is_solicitantenom, 0, :ii_cvearea)

	using gtr_sumuia;	
	
	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al insertar la PreSolicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;
	end if	


	//Insertar Material
	insert into dbo.spre_pre_sol_materiales
	(cvedepto, folio, consecutivo, cvearea, cvematerial, cvegrupo, 
	num_serie, status, fecha_inicio, fecha_final, costo_mat)
	 
	values
	(:gi_depto, :ll_folio, 1, :ii_cvearea, :istr_pres_control.cvematerial, :istr_pres_control.cvegrupo,
	:istr_pres_control.num_serie, 0, :idt_fecha_inicio, :idt_fecha_final, 0)

	using gtr_sumuia;	
	
	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al insertar la PreSolicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;
	end if	

	messagebox('Atención','El registro en la lista de espera fue realizado con éxito.')
	w_imd_control_prestamo.uf_cargar()
	close(w_imd_agregar_lista_espera)

else
	return
end if
end event

type st_final from statictext within w_imd_agregar_lista_espera
integer x = 494
integer y = 272
integer width = 399
integer height = 74
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Fecha Fin"
boolean focusrectangle = false
end type

type st_inicio from statictext within w_imd_agregar_lista_espera
integer x = 494
integer y = 192
integer width = 399
integer height = 74
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Fecha Inicio"
boolean focusrectangle = false
end type

type em_fecha_inicio from editmask within w_imd_agregar_lista_espera
integer x = 903
integer y = 176
integer width = 377
integer height = 74
integer taborder = 20
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

event modified;f_usuario_busqueda()
end event

type em_fecha_final from editmask within w_imd_agregar_lista_espera
integer x = 903
integer y = 256
integer width = 377
integer height = 74
integer taborder = 30
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

event modified;f_usuario_busqueda()
end event

type st_3 from statictext within w_imd_agregar_lista_espera
integer x = 1287
integer y = 272
integer width = 176
integer height = 51
integer textsize = -8
integer weight = 400
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

type st_2 from statictext within w_imd_agregar_lista_espera
integer x = 1287
integer y = 192
integer width = 179
integer height = 51
integer textsize = -8
integer weight = 400
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

type em_hora_inicio from editmask within w_imd_agregar_lista_espera
integer x = 1485
integer y = 176
integer width = 194
integer height = 74
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
end type

event modified;f_usuario_busqueda()
end event

type em_hora_final from editmask within w_imd_agregar_lista_espera
integer x = 1485
integer y = 256
integer width = 194
integer height = 74
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
end type

event modified;f_usuario_busqueda()
end event

type st_cuenta from statictext within w_imd_agregar_lista_espera
integer x = 486
integer y = 42
integer width = 293
integer height = 61
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

type sle_solicitante from singlelineedit within w_imd_agregar_lista_espera
integer x = 790
integer y = 32
integer width = 322
integer height = 74
integer taborder = 10
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

event modified;f_usuario_busqueda()

timer(1.5)
end event

type ole_1 from olecustomcontrol within w_imd_agregar_lista_espera
integer x = 1496
integer y = 426
integer width = 110
integer height = 77
integer taborder = 20
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_imd_agregar_lista_espera.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Aw_imd_agregar_lista_espera.bin 
2600000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000d4f82da001ce768700000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe000000000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000004800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000452392cff41d0a9fca59122b62b36ca4600000000d4f82da001ce7687d4f82da001ce768700000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
26ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000b29300000048000800034757f20b000000200065005f00740078006e0065007800740000027b000800034757f20affffffe00065005f00740078006e006500790074000001fc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b29300000048000800034757f20b000000200065005f00740078006e0065007800740000027b000800034757f20affffffe00065005f00740078006e006500790074000001fc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000200000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Aw_imd_agregar_lista_espera.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
