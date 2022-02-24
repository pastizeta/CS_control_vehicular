$PBExportHeader$w_csal_entrega_plumones.srw
forward
global type w_csal_entrega_plumones from window
end type
type sle_nombre from singlelineedit within w_csal_entrega_plumones
end type
type cb_cambio from commandbutton within w_csal_entrega_plumones
end type
type ole_1 from olecustomcontrol within w_csal_entrega_plumones
end type
type dw_datos from datawindow within w_csal_entrega_plumones
end type
type cb_entrega from commandbutton within w_csal_entrega_plumones
end type
type st_1 from statictext within w_csal_entrega_plumones
end type
type sle_solicitante from singlelineedit within w_csal_entrega_plumones
end type
end forward

global type w_csal_entrega_plumones from window
integer width = 3671
integer height = 1800
boolean titlebar = true
string title = "Entrega de plumones"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
sle_nombre sle_nombre
cb_cambio cb_cambio
ole_1 ole_1
dw_datos dw_datos
cb_entrega cb_entrega
st_1 st_1
sle_solicitante sle_solicitante
end type
global w_csal_entrega_plumones w_csal_entrega_plumones

type variables
integer ii_tipo_usuario = 3
long il_solicitante = 0
string is_solicitantenom = ''

integer ii_anio_actual, ii_periodo_actual
integer ii_anio_anterior, ii_periodo_anterior

end variables

forward prototypes
public subroutine f_reset_solicitud ()
public function integer f_valida_empleado (string p_cuenta)
public subroutine f_carga_datos ()
end prototypes

public subroutine f_reset_solicitud ();il_solicitante = 0
sle_solicitante.text = ''
sle_nombre.text = ''

dw_datos.Reset()
cb_entrega.enabled = false
cb_cambio.enabled = false
end subroutine

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

public subroutine f_carga_datos ();dw_datos.Retrieve(ii_anio_actual, ii_periodo_actual, ii_anio_anterior, ii_periodo_anterior, ii_tipo_usuario, il_solicitante)
end subroutine

on w_csal_entrega_plumones.create
this.sle_nombre=create sle_nombre
this.cb_cambio=create cb_cambio
this.ole_1=create ole_1
this.dw_datos=create dw_datos
this.cb_entrega=create cb_entrega
this.st_1=create st_1
this.sle_solicitante=create sle_solicitante
this.Control[]={this.sle_nombre,&
this.cb_cambio,&
this.ole_1,&
this.dw_datos,&
this.cb_entrega,&
this.st_1,&
this.sle_solicitante}
end on

on w_csal_entrega_plumones.destroy
destroy(this.sle_nombre)
destroy(this.cb_cambio)
destroy(this.ole_1)
destroy(this.dw_datos)
destroy(this.cb_entrega)
destroy(this.st_1)
destroy(this.sle_solicitante)
end on

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
			
//			f_reset_solicitud()
			
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

event open;f_select_anio_periodo_actual(ii_periodo_actual,ii_anio_actual,today())
ii_anio_anterior = ii_anio_actual
ii_periodo_anterior = ii_periodo_actual

f_select_anio_periodo_anterior(ii_periodo_anterior,ii_anio_anterior)

dw_datos.settransobject(gtr_sumuia)

timer(1.5)
end event

event closequery;timer(1.5)
end event

event activate;timer(1.5)
end event

event deactivate;timer(0)
end event

type sle_nombre from singlelineedit within w_csal_entrega_plumones
integer x = 55
integer y = 252
integer width = 2098
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 31182271
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_cambio from commandbutton within w_csal_entrega_plumones
integer x = 2834
integer y = 248
integer width = 590
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Registrar cambio"
end type

event clicked;long ll_id
integer li_estatus = 2
datetime ldt_ahorita

ldt_ahorita=DateTime(Today(),Now())

//ID
select isnull(max(id),0) +1
into :ll_id
from dbo.spre_entrega_plumones
using gtr_sumuia; 
commit using gtr_sumuia;

//Insertar
insert into dbo.spre_entrega_plumones
(id, solicitanteid, tipo_usuario, solicitantenombre, estatus, anio, cveperiodo, fecha, usuario)
 
values
(:ll_id, :il_solicitante, :ii_tipo_usuario, :is_solicitantenom, :li_estatus, :ii_anio_actual, :ii_periodo_actual,  :ldt_ahorita, :gs_usuario)

using gtr_sumuia;	

if gtr_sumuia.sqlcode<>0 then
	messagebox("Mensaje del sistema","Error al insertar el cambio "+gtr_sumuia.SQLErrText,stopsign!)
	rollback using gtr_sumuia;
else
	commit using gtr_sumuia;
	messagebox("Mensaje del sistema","Cambio registrado.")
	f_reset_solicitud()
end if	


end event

type ole_1 from olecustomcontrol within w_csal_entrega_plumones
boolean visible = false
integer x = 3346
integer y = 44
integer width = 247
integer height = 144
integer taborder = 10
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_csal_entrega_plumones.win"
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
end type

type dw_datos from datawindow within w_csal_entrega_plumones
integer x = 55
integer y = 428
integer width = 3534
integer height = 1212
integer taborder = 20
string title = "none"
string dataobject = "d_csal_entrega_plumones"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_entrega from commandbutton within w_csal_entrega_plumones
integer x = 2208
integer y = 248
integer width = 590
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Registrar entrega"
end type

event clicked;long ll_id
integer li_estatus = 1
datetime ldt_ahorita

ldt_ahorita=DateTime(Today(),Now())

//ID
select isnull(max(id),0) +1
into :ll_id
from dbo.spre_entrega_plumones
using gtr_sumuia; 
commit using gtr_sumuia;

//Insertar
insert into dbo.spre_entrega_plumones
(id, solicitanteid, tipo_usuario, solicitantenombre, estatus, anio, cveperiodo, fecha, usuario)
 
values
(:ll_id, :il_solicitante, :ii_tipo_usuario, :is_solicitantenom, :li_estatus, :ii_anio_actual, :ii_periodo_actual,  :ldt_ahorita, :gs_usuario)

using gtr_sumuia;	

if gtr_sumuia.sqlcode<>0 then
	messagebox("Mensaje del sistema","Error al insertar la entrega "+gtr_sumuia.SQLErrText,stopsign!)
	rollback using gtr_sumuia;
else
	commit using gtr_sumuia;
	messagebox("Mensaje del sistema","Entrega registrada.")
	f_reset_solicitud()
end if	


end event

type st_1 from statictext within w_csal_entrega_plumones
integer x = 55
integer y = 52
integer width = 517
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "No. de empleado"
boolean focusrectangle = false
end type

type sle_solicitante from singlelineedit within w_csal_entrega_plumones
event ue_usuario_busqueda ( )
integer x = 55
integer y = 140
integer width = 507
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event ue_usuario_busqueda();integer li_acceso=-1, li_row, li_materiales, NET, li_suspendido=0
string ls_aviso, ls_telefono, ls_solicitante

ls_solicitante=trim(sle_solicitante.text)
f_reset_solicitud()

li_acceso=f_valida_empleado(ls_solicitante)

if li_acceso=-1 then

	f_reset_solicitud()

else
	
	sle_nombre.text = is_solicitantenom
	cb_entrega.enabled = true
	cb_cambio.enabled = true
	
	f_carga_datos()

end if
	
end event

event modified;event ue_usuario_busqueda()

timer(1.5)
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
07w_csal_entrega_plumones.bin 
2100000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a84019f001d45ff000000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe000000000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000004800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000452392cff41d0a9fca59122b62b36ca4600000000a84019f001d45ff0a84019f001d45ff000000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
24ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000b29300000048000800034757f20b000000200065005f00740078006e00650078007400000595000800034757f20affffffe00065005f00740078006e006500790074000003b900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b29300000048000800034757f20b000000200065005f00740078006e00650078007400000595000800034757f20affffffe00065005f00740078006e006500790074000003b9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000200000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17w_csal_entrega_plumones.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
