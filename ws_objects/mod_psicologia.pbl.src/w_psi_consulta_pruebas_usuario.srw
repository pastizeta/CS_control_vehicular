$PBExportHeader$w_psi_consulta_pruebas_usuario.srw
forward
global type w_psi_consulta_pruebas_usuario from window
end type
type rb_academico from radiobutton within w_psi_consulta_pruebas_usuario
end type
type rb_intercambio from radiobutton within w_psi_consulta_pruebas_usuario
end type
type rb_profesor from radiobutton within w_psi_consulta_pruebas_usuario
end type
type rb_alumno from radiobutton within w_psi_consulta_pruebas_usuario
end type
type st_sinprueba from statictext within w_psi_consulta_pruebas_usuario
end type
type st_conprueba from statictext within w_psi_consulta_pruebas_usuario
end type
type dw_pruebas from datawindow within w_psi_consulta_pruebas_usuario
end type
type ole_1 from olecustomcontrol within w_psi_consulta_pruebas_usuario
end type
type dw_solicitante from datawindow within w_psi_consulta_pruebas_usuario
end type
type dw_foto from datawindow within w_psi_consulta_pruebas_usuario
end type
type st_cuenta from statictext within w_psi_consulta_pruebas_usuario
end type
type sle_solicitante from singlelineedit within w_psi_consulta_pruebas_usuario
end type
type gb_solicitante from groupbox within w_psi_consulta_pruebas_usuario
end type
type dw_inventario_disponible from datawindow within w_psi_consulta_pruebas_usuario
end type
end forward

global type w_psi_consulta_pruebas_usuario from window
integer width = 2900
integer height = 2198
boolean titlebar = true
string title = "Consulta de Pruebas por usuario"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
rb_academico rb_academico
rb_intercambio rb_intercambio
rb_profesor rb_profesor
rb_alumno rb_alumno
st_sinprueba st_sinprueba
st_conprueba st_conprueba
dw_pruebas dw_pruebas
ole_1 ole_1
dw_solicitante dw_solicitante
dw_foto dw_foto
st_cuenta st_cuenta
sle_solicitante sle_solicitante
gb_solicitante gb_solicitante
dw_inventario_disponible dw_inventario_disponible
end type
global w_psi_consulta_pruebas_usuario w_psi_consulta_pruebas_usuario

type variables
long il_solicitante
string is_solicitantenom, is_solicitantenivel=''
integer ii_anio, ii_periodo, ii_tipo_usuario=1

/*

n_transportar regreso, origen

//, ii_venta=0
integer  ii_modal=0 //0 Préstamos material, 1 Venta material, 2 Préstamo espacio

integer ii_tipo_usuario=0, ii_tipou_sel=0




string is_solicitantenom, is_solicitantenivel=''

long il_cvegrupo=0 
string is_cvemat=''
integer ii_reservados=0

datetime idt_fecha_inicio, idt_fecha_final

DatawindowChild idwc_grupomat, idwc_matgrupo

long il_folio_prestamo=0, il_folio_presolicitud=0

integer ii_edita=0, ii_multa=0, ii_bloquea_nuevo=0

str_pres_permisos istr_pres_permisos
*/
end variables

forward prototypes
public function integer f_valida_alumno (string p_cuenta)
public subroutine f_carga_foto ()
public subroutine f_reset_solicitud ()
public function integer f_valida_alumno_intercambio (string p_cuenta)
public function integer f_valida_empleado (string p_cuenta)
end prototypes

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
			ls_arch_ruta = f_archivo_gvbox2(f_foto_profesor(il_solicitante))
	end choose
	
	if ii_tipo_usuario=0 then
		
	else
		
	end if
	IF IsNull(ls_arch_ruta) THEN 
		dw_foto.reset()
		dw_foto.Modify ( "p_1.FileName='uia-n.jpg'" )
	ELSE 
		li_registro = dw_foto.insertrow(0)
		dw_foto.setitem(li_registro, "name", "pruebas")
		dw_foto.Modify ( "p_1.FileName='" + ls_arch_ruta + "'" )
	END IF


end subroutine

public subroutine f_reset_solicitud ();sle_solicitante.text=''
il_solicitante=0
is_solicitantenom=''
is_solicitantenivel=''

dw_solicitante.Reset()
dw_solicitante.insertrow(0)

dw_pruebas.Reset()

dw_foto.Reset()
dw_foto.Modify ( "p_1.FileName='uia-n.jpg'" )

st_sinprueba.visible=false
st_conprueba.visible=false
sle_solicitante.setFocus()

end subroutine

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
	
else
	messagebox('Aviso','La cuenta '+string(il_solicitante)+' no es válida.')
	return (-1)	
end if

return (0)
end function

on w_psi_consulta_pruebas_usuario.create
this.rb_academico=create rb_academico
this.rb_intercambio=create rb_intercambio
this.rb_profesor=create rb_profesor
this.rb_alumno=create rb_alumno
this.st_sinprueba=create st_sinprueba
this.st_conprueba=create st_conprueba
this.dw_pruebas=create dw_pruebas
this.ole_1=create ole_1
this.dw_solicitante=create dw_solicitante
this.dw_foto=create dw_foto
this.st_cuenta=create st_cuenta
this.sle_solicitante=create sle_solicitante
this.gb_solicitante=create gb_solicitante
this.dw_inventario_disponible=create dw_inventario_disponible
this.Control[]={this.rb_academico,&
this.rb_intercambio,&
this.rb_profesor,&
this.rb_alumno,&
this.st_sinprueba,&
this.st_conprueba,&
this.dw_pruebas,&
this.ole_1,&
this.dw_solicitante,&
this.dw_foto,&
this.st_cuenta,&
this.sle_solicitante,&
this.gb_solicitante,&
this.dw_inventario_disponible}
end on

on w_psi_consulta_pruebas_usuario.destroy
destroy(this.rb_academico)
destroy(this.rb_intercambio)
destroy(this.rb_profesor)
destroy(this.rb_alumno)
destroy(this.st_sinprueba)
destroy(this.st_conprueba)
destroy(this.dw_pruebas)
destroy(this.ole_1)
destroy(this.dw_solicitante)
destroy(this.dw_foto)
destroy(this.st_cuenta)
destroy(this.sle_solicitante)
destroy(this.gb_solicitante)
destroy(this.dw_inventario_disponible)
end on

event open;integer li_cuantos

dw_pruebas.setTransObject(gtr_sumuia)

f_select_anio_periodo_actual(ii_periodo,ii_anio,today())
f_reset_solicitud()

timer(1.5)
end event

event timer;string a="", ls_nomina = "", ls_mensaje = "", ls_digito=""
integer li_inicializa = 0

long ll_cuenta

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
					//Chip de Académico
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

type rb_academico from radiobutton within w_psi_consulta_pruebas_usuario
integer x = 84
integer y = 362
integer width = 728
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Académico de Psicología"
end type

event clicked;ii_tipo_usuario = 4
end event

type rb_intercambio from radiobutton within w_psi_consulta_pruebas_usuario
integer x = 88
integer y = 189
integer width = 366
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Intercambio"
end type

event clicked;ii_tipo_usuario = 2
end event

type rb_profesor from radiobutton within w_psi_consulta_pruebas_usuario
integer x = 84
integer y = 278
integer width = 366
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Profesor"
end type

event clicked;ii_tipo_usuario = 3
end event

type rb_alumno from radiobutton within w_psi_consulta_pruebas_usuario
integer x = 88
integer y = 109
integer width = 366
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Alumno"
boolean checked = true
end type

event clicked;ii_tipo_usuario = 1
end event

type st_sinprueba from statictext within w_psi_consulta_pruebas_usuario
integer x = 1075
integer y = 166
integer width = 1119
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 255
long backcolor = 30520472
string text = "Sin acceso a Pruebas"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_conprueba from statictext within w_psi_consulta_pruebas_usuario
integer x = 1075
integer y = 166
integer width = 1119
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 32768
long backcolor = 30520472
string text = "Con acceso a Pruebas"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_pruebas from datawindow within w_psi_consulta_pruebas_usuario
integer x = 26
integer y = 755
integer width = 2798
integer height = 1322
integer taborder = 100
string title = "none"
string dataobject = "d_psi_sel_pruebas_alumno"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ole_1 from olecustomcontrol within w_psi_consulta_pruebas_usuario
boolean visible = false
integer x = 2359
integer y = 304
integer width = 201
integer height = 125
integer taborder = 40
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_psi_consulta_pruebas_usuario.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_solicitante from datawindow within w_psi_consulta_pruebas_usuario
integer x = 69
integer y = 451
integer width = 2150
integer height = 211
integer taborder = 90
string title = "none"
string dataobject = "d_gen_pres_solicitante"
boolean border = false
boolean livescroll = true
end type

type dw_foto from datawindow within w_psi_consulta_pruebas_usuario
integer x = 2300
integer y = 192
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

type st_cuenta from statictext within w_psi_consulta_pruebas_usuario
integer x = 669
integer y = 109
integer width = 260
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

type sle_solicitante from singlelineedit within w_psi_consulta_pruebas_usuario
event ue_usuario_busqueda ( )
integer x = 669
integer y = 186
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


if rb_alumno.checked = true then
	//Alumno
	li_acceso=f_valida_alumno(ls_solicitante)
	dw_pruebas.dataobject = 'd_psi_sel_pruebas_alumno'
elseif rb_intercambio.checked = true then
	//Intercambio
	li_acceso=f_valida_alumno_intercambio(ls_solicitante)
	dw_pruebas.dataobject = 'd_psi_sel_pruebas_intercambio'
elseif rb_profesor.checked = true then
	//Profesor
	li_acceso=f_valida_empleado(ls_solicitante)
	dw_pruebas.dataobject = 'd_psi_sel_pruebas_profesor'
elseif rb_academico.checked = true then
	//Académico
	li_acceso=f_valida_empleado(ls_solicitante)
	dw_pruebas.dataobject = 'd_psi_sel_pruebas_academico'
end if
dw_pruebas.settransobject(gtr_sumuia)

if li_acceso=-1 then
	f_reset_solicitud()
else
	ls_telefono=f_select_telefono_usuario(il_solicitante,gi_depto,1)
	dw_solicitante.SetItem(1, "solicitanteid", il_solicitante)	
	dw_solicitante.SetItem(1, "solicitantenombre", is_solicitantenom)
	dw_solicitante.SetItem(1, "telefono",ls_telefono)
	f_carga_foto() 
	
	
	if ii_tipo_usuario=1 then
		dw_pruebas.Retrieve(il_solicitante)
	else
		dw_pruebas.Retrieve(il_solicitante,ii_anio,ii_periodo)
	end if
	
	if dw_pruebas.RowCount() = 0 then
		
		if ii_tipo_usuario=1 or ii_tipo_usuario=2 then
			messagebox('Aviso','El alumno no está inscrito en materias que autoricen el préstamo de pruebas')
		elseif ii_tipo_usuario=3 then
			messagebox('Aviso','El profesor no imparte materias que autoricen el préstamo de pruebas')	
		else
		end if
		st_sinprueba.visible=true
		st_conprueba.visible=false	
	else
		st_sinprueba.visible=false
		st_conprueba.visible=true
	end if
	
end if
	
end event

event modified;event ue_usuario_busqueda()

timer(1.5)
end event

type gb_solicitante from groupbox within w_psi_consulta_pruebas_usuario
integer x = 33
integer y = 13
integer width = 2794
integer height = 682
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Consulta de usuario"
end type

type dw_inventario_disponible from datawindow within w_psi_consulta_pruebas_usuario
integer x = 4206
integer y = 64
integer width = 121
integer height = 90
integer taborder = 250
boolean bringtotop = true
string title = "none"
string dataobject = "d_gen_mat_disponible_consu"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
09w_psi_consulta_pruebas_usuario.bin 
2500000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000dea33c5001d2a89c00000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe000000000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000004800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000452392cff41d0a9fca59122b62b36ca4600000000dea33c5001d2a89cdea33c5001d2a89c00000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
24ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000b29300000048000800034757f20b000000200065005f00740078006e0065007800740000048c000800034757f20affffffe00065005f00740078006e0065007900740000033a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b29300000048000800034757f20b000000200065005f00740078006e0065007800740000048c000800034757f20affffffe00065005f00740078006e0065007900740000033a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000200000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19w_psi_consulta_pruebas_usuario.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
