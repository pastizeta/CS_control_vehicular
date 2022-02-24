$PBExportHeader$w_veh_vehiculo_entrega_devuelve.srw
forward
global type w_veh_vehiculo_entrega_devuelve from window
end type
type cb_devolucion from commandbutton within w_veh_vehiculo_entrega_devuelve
end type
type cb_entrega from commandbutton within w_veh_vehiculo_entrega_devuelve
end type
type st_2 from statictext within w_veh_vehiculo_entrega_devuelve
end type
type dw_vehiculos from datawindow within w_veh_vehiculo_entrega_devuelve
end type
type st_1 from statictext within w_veh_vehiculo_entrega_devuelve
end type
type sle_nombre_solicitante from singlelineedit within w_veh_vehiculo_entrega_devuelve
end type
type ole_1 from olecustomcontrol within w_veh_vehiculo_entrega_devuelve
end type
type st_cuenta from statictext within w_veh_vehiculo_entrega_devuelve
end type
type sle_solicitante from singlelineedit within w_veh_vehiculo_entrega_devuelve
end type
type gb_1 from groupbox within w_veh_vehiculo_entrega_devuelve
end type
type dw_solicitudes from datawindow within w_veh_vehiculo_entrega_devuelve
end type
end forward

global type w_veh_vehiculo_entrega_devuelve from window
integer width = 6139
integer height = 2204
boolean titlebar = true
string title = "Entrega y devolución del vehículo"
boolean controlmenu = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_devolucion cb_devolucion
cb_entrega cb_entrega
st_2 st_2
dw_vehiculos dw_vehiculos
st_1 st_1
sle_nombre_solicitante sle_nombre_solicitante
ole_1 ole_1
st_cuenta st_cuenta
sle_solicitante sle_solicitante
gb_1 gb_1
dw_solicitudes dw_solicitudes
end type
global w_veh_vehiculo_entrega_devuelve w_veh_vehiculo_entrega_devuelve

type variables
long il_solicitante=0, il_sol_id
integer ii_tipo_usuario=0, ii_tipou_sel=0
string is_solicitantenom=''



end variables

forward prototypes
public subroutine f_reset_solicitud ()
public subroutine f_usuario_busqueda ()
end prototypes

public subroutine f_reset_solicitud ();sle_nombre_solicitante.text=''
il_solicitante=0
is_solicitantenom=''

dw_solicitudes.Reset()
dw_vehiculos.Reset()
end subroutine

public subroutine f_usuario_busqueda ();string ls_solicitante
long ll_cuenta
integer li_valida=0, li_existe=0

ls_solicitante=trim(sle_solicitante.text)
il_solicitante=0
is_solicitantenom=''

dw_solicitudes.Reset()
dw_vehiculos.Reset()

if isNumber(ls_solicitante) then
	ll_cuenta=long(ls_solicitante)
	il_solicitante=ll_cuenta
	li_existe=1
end if

if li_existe=1 then
	li_valida=f_valida_empleado(ll_cuenta,is_solicitantenom)
end if

if li_valida>0 then
	//Buscar solicitudes
	dw_solicitudes.Retrieve(il_solicitante)
	
end if

sle_nombre_solicitante.text=is_solicitantenom

////
////
////if li_valida > 0 then 
////	
////end if
//
//
//
///*
/////*integer li_acceso
////string ls_depto=''
////
////
////idt_fecha_inicio=datetime(date(em_fecha_inicio.text),time(em_hora_inicio.text))
////idt_fecha_final=datetime(date(em_fecha_final.text),time(em_hora_final.text))
////f_select_anio_periodo_actual(ii_periodo,ii_anio,Date(idt_fecha_inicio))
////
////li_acceso=f_valida_acceso()
////
////if li_acceso=-1 then
////	
////	f_reset_solicitud()
////	cb_agregar.enabled=false
////	
////else
////
////	choose case ii_tipo_usuario
////		case 1
////			ls_depto=f_select_departamento_alumno(il_solicitante, ii_anio,ii_periodo)
////		case 2
////			ls_depto=f_select_departamento_intercambio(il_solicitante, ii_anio,ii_periodo)
////		case 3
////			ls_depto=f_select_departamento_profesor(il_solicitante, ii_anio,ii_periodo)
////		case 4
////			ls_depto=f_select_departamento_exalumno(il_solicitante, ii_anio,ii_periodo)
////	end choose
////
////	if isNull(ls_depto) then ls_depto=''
////
////	mle_nombre.text=is_solicitantenom+"~r~n"+ls_depto
////	cb_agregar.enabled=true
////	
////end if
////	*/
end subroutine

on w_veh_vehiculo_entrega_devuelve.create
this.cb_devolucion=create cb_devolucion
this.cb_entrega=create cb_entrega
this.st_2=create st_2
this.dw_vehiculos=create dw_vehiculos
this.st_1=create st_1
this.sle_nombre_solicitante=create sle_nombre_solicitante
this.ole_1=create ole_1
this.st_cuenta=create st_cuenta
this.sle_solicitante=create sle_solicitante
this.gb_1=create gb_1
this.dw_solicitudes=create dw_solicitudes
this.Control[]={this.cb_devolucion,&
this.cb_entrega,&
this.st_2,&
this.dw_vehiculos,&
this.st_1,&
this.sle_nombre_solicitante,&
this.ole_1,&
this.st_cuenta,&
this.sle_solicitante,&
this.gb_1,&
this.dw_solicitudes}
end on

on w_veh_vehiculo_entrega_devuelve.destroy
destroy(this.cb_devolucion)
destroy(this.cb_entrega)
destroy(this.st_2)
destroy(this.dw_vehiculos)
destroy(this.st_1)
destroy(this.sle_nombre_solicitante)
destroy(this.ole_1)
destroy(this.st_cuenta)
destroy(this.sle_solicitante)
destroy(this.gb_1)
destroy(this.dw_solicitudes)
end on

event timer;/*
string a="", ls_nomina = "", ls_mensaje = "", ls_digito
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
*/
end event

event open;dw_solicitudes.settransobject(gtr_cv)
dw_vehiculos.settransobject(gtr_cv)

end event

type cb_devolucion from commandbutton within w_veh_vehiculo_entrega_devuelve
integer x = 4878
integer y = 1876
integer width = 1102
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "El usuario devuelve el vehículo"
boolean default = true
end type

event clicked;integer	li_i, li_click = 0, li_actualizado=0, li_check_inicio = 0, li_check_final = 0
long		ll_cuenta, ll_sol_id, ll_id_vehiculo
datetime	ldt_ahorita=DateTime(Today(),Now())

IF dw_solicitudes.RowCount ( ) = 0 OR dw_vehiculos.Rowcount ( ) = 0 THEN
	Return;
END IF

for li_i=1 to dw_vehiculos.Rowcount() 
	li_click=dw_vehiculos.GetItemNumber(li_i,'cbox')
	ll_cuenta=dw_vehiculos.GetItemNumber(li_i,'cuenta_devolucion')
	li_check_inicio=dw_vehiculos.GetItemNumber(li_i,'checkin_inicio')
	li_check_final=dw_vehiculos.GetItemNumber(li_i,'checkin_final')
	ll_sol_id = dw_vehiculos.GetItemNumber(li_i,'sol_id')
	ll_id_vehiculo = dw_vehiculos.GetItemNumber ( li_i , 'id_vehiculo' )
	
	if li_click = 1 then 
		if ll_cuenta=0 then
//			if  li_check_inicio>0 and li_check_final>0 then
				//Devolución vehículo
				dw_vehiculos.setitem(li_i,'fecha_devolucion',ldt_ahorita)	
				dw_vehiculos.setitem(li_i,'nombre_devolucion',is_solicitantenom)	
				dw_vehiculos.setitem(li_i,'cuenta_devolucion',il_solicitante)
				dw_vehiculos.setitem(li_i,'ultima_modificacion',ldt_ahorita)
				dw_vehiculos.setitem(li_i,'usuario_modificacion',gs_usuario)
				
				UPDATE	via_solicitud_interna
				SET		estatus = 4
				WHERE	sol_id = :ll_sol_id
				USING	gtr_cv;
				
				// Actualizar el estatus del vehículo (1	Disponible) ...
				UPDATE	via_cat_vehiculos
				SET		estatus = 1
				WHERE	id = :ll_id_vehiculo
				USING	gtr_cv;
					
				li_actualizado=1
//			else
//				messagebox('Aviso','Para hacer la devolución del vehículo debe haber realizado el checkin de inicio y checkin final del vehículo en el portal')
//			end if
		end if
	end if
	
next

if li_actualizado=1 then
	if dw_vehiculos.update()>0 then
		commit using gtr_cv;
		MessageBox ( "Aviso:" , "La devolución del vehículo se registró de forma correctal" )
	else
		messagebox("Error: "+gtr_cv.sqlerrtext,"El vehículo no fue devuelto.",stopsign!)
		rollback using gtr_cv;
	end if
end if

end event

type cb_entrega from commandbutton within w_veh_vehiculo_entrega_devuelve
integer x = 3739
integer y = 1876
integer width = 1102
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Entregar vehículo al usuario"
boolean default = true
end type

event clicked;integer		li_i, li_click = 0, li_actualizado=0
long			ll_cuenta, ll_sol_id
datetime		ldt_ahorita=DateTime(Today(),Now())
DateTime	ldt_fecha_inicio
Date			ld_fecha_hoy, ld_fecha_inicio

SELECT	top 1 getdate ()
INTO		:ldt_ahorita 
FROM		via_solicitud_interna
USING	gtr_cv;

IF dw_solicitudes.RowCount ( ) = 0 THEN
	return;
END IF

ldt_fecha_inicio = dw_solicitudes.GetItemDateTime ( dw_solicitudes.GetRow ( ) , 'fecha_inicio' )
ld_fecha_inicio = Date ( ldt_fecha_inicio )
ld_fecha_hoy = Today ( )

/*
IF ld_fecha_hoy < ld_fecha_inicio THEN
	MessageBox ( "Aviso:" , "No es posible entregar el vehículo en una fecha anterior a la fecha de inicio de la solicitud." )
	Return;
END IF
*/
for li_i=1 to dw_vehiculos.Rowcount() 
	li_click=dw_vehiculos.GetItemNumber(li_i,'cbox')
	ll_cuenta=dw_vehiculos.GetItemNumber(li_i,'cuenta_entrega')
	ll_sol_id = dw_vehiculos.GetItemNumber(li_i,'sol_id')
	
	if li_click = 1 then 
		if ll_cuenta=0 then
			//Entregar vehículo
			dw_vehiculos.setitem(li_i,'fecha_entrega',ldt_ahorita)	
			dw_vehiculos.setitem(li_i,'nombre_entrega',is_solicitantenom)	
			dw_vehiculos.setitem(li_i,'cuenta_entrega',il_solicitante)
			dw_vehiculos.setitem(li_i,'ultima_modificacion',ldt_ahorita)
			dw_vehiculos.setitem(li_i,'usuario_modificacion',gs_usuario)
			
			UPDATE	via_solicitud_interna
			SET		estatus = 3
			WHERE	sol_id = :ll_sol_id
			USING	gtr_cv;
			
			li_actualizado=1
		end if
	end if
	
next

if li_actualizado=1 then
	if dw_vehiculos.update()>0 then
		commit using gtr_cv;
	else
		messagebox("Error: "+gtr_cv.sqlerrtext,"El vehículo no fue entregado.",stopsign!)
		rollback using gtr_cv;
	end if
end if

end event

type st_2 from statictext within w_veh_vehiculo_entrega_devuelve
integer x = 101
integer y = 1148
integer width = 389
integer height = 108
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Vehículos:"
boolean focusrectangle = false
end type

type dw_vehiculos from datawindow within w_veh_vehiculo_entrega_devuelve
integer x = 91
integer y = 1244
integer width = 5897
integer height = 544
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_veh_vehiculos_para_checkin"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer li_click

if row>0 and dwo.name='cbox' then
	li_click=this.GetItemNumber(row,'cbox')
	if li_click=0 then li_click=1 else li_click=0
	this.SetItem(row,'cbox',li_click)
end if
end event

type st_1 from statictext within w_veh_vehiculo_entrega_devuelve
integer x = 101
integer y = 320
integer width = 389
integer height = 108
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Solicitudes:"
boolean focusrectangle = false
end type

type sle_nombre_solicitante from singlelineedit within w_veh_vehiculo_entrega_devuelve
integer x = 937
integer y = 156
integer width = 3255
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 134217750
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type ole_1 from olecustomcontrol within w_veh_vehiculo_entrega_devuelve
boolean visible = false
integer x = 1925
integer y = 12
integer width = 338
integer height = 300
integer taborder = 30
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_veh_vehiculo_entrega_devuelve.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_cuenta from statictext within w_veh_vehiculo_entrega_devuelve
integer x = 101
integer y = 164
integer width = 288
integer height = 108
integer textsize = -10
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

type sle_solicitante from singlelineedit within w_veh_vehiculo_entrega_devuelve
integer x = 453
integer y = 156
integer width = 443
integer height = 112
integer taborder = 10
integer textsize = -10
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

type gb_1 from groupbox within w_veh_vehiculo_entrega_devuelve
integer x = 50
integer y = 28
integer width = 6011
integer height = 2028
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Entrega y devolución de vehículo"
end type

type dw_solicitudes from datawindow within w_veh_vehiculo_entrega_devuelve
integer x = 91
integer y = 416
integer width = 5893
integer height = 676
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_veh_solicitudes_para_checkin"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row>0 then
	il_sol_id=this.GetItemNumber(row,'sol_id')
	dw_vehiculos.Retrieve(il_sol_id)
end if
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
02w_veh_vehiculo_entrega_devuelve.bin 
2D00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000021970b001d5e2b400000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe000000000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000004800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000452392cff41d0a9fca59122b62b36ca46000000000219229001d5e2b40219229001d5e2b400000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
24ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000b29300000048000800034757f20b000000200065005f00740078006e006500780074000007a6000800034757f20affffffe00065005f00740078006e006500790074000007c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b29300000048000800034757f20b000000200065005f00740078006e006500780074000007a6000800034757f20affffffe00065005f00740078006e006500790074000007c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000200000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12w_veh_vehiculo_entrega_devuelve.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
