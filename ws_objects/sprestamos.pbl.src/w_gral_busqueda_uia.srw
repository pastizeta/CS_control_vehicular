$PBExportHeader$w_gral_busqueda_uia.srw
$PBExportComments$Busqueda genral usando tarjeta,cuenta o clave empleado
forward
global type w_gral_busqueda_uia from window
end type
type rb_empleado from radiobutton within w_gral_busqueda_uia
end type
type cb_seleccionar from commandbutton within w_gral_busqueda_uia
end type
type st_inscrito from statictext within w_gral_busqueda_uia
end type
type rb_alumno from radiobutton within w_gral_busqueda_uia
end type
type st_actividad from statictext within w_gral_busqueda_uia
end type
type st_nombre from statictext within w_gral_busqueda_uia
end type
type st_tipo from statictext within w_gral_busqueda_uia
end type
type sle_cuenta from singlelineedit within w_gral_busqueda_uia
end type
type ole_credencial from olecustomcontrol within w_gral_busqueda_uia
end type
end forward

global type w_gral_busqueda_uia from window
integer width = 1543
integer height = 1603
boolean titlebar = true
string title = "Búsqueda de Usuarios"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 29534863
rb_empleado rb_empleado
cb_seleccionar cb_seleccionar
st_inscrito st_inscrito
rb_alumno rb_alumno
st_actividad st_actividad
st_nombre st_nombre
st_tipo st_tipo
sle_cuenta sle_cuenta
ole_credencial ole_credencial
end type
global w_gral_busqueda_uia w_gral_busqueda_uia

type variables
n_transportar uo_parametros
end variables

forward prototypes
public function long wf_busca_cuenta (string as_nchip)
public function boolean wf_busca_empleado ()
public function boolean wf_busca_alumno ()
public subroutine wf_carga_foto (long li_cuenta, integer li_tipo)
end prototypes

public function long wf_busca_cuenta (string as_nchip);long ll_cuenta


//PRIMERO BUSCAMOS LOS ALUMNOS
  SELECT v_sce_alumnos.cuenta  
    INTO :ll_cuenta  
    FROM v_sce_alumnos  
   WHERE v_sce_alumnos.nchip = :as_nchip using gtr_sumuia  ;

	if gtr_sumuia.sqlcode<>0 then
		//BUSCAMOS EN EMPLEADOS
	    SELECT empl_uia1.empleado  
	    INTO :ll_cuenta  
	    FROM empl_uia1  
	   WHERE empl_uia1.nchip = :as_nchip   using gtr_personal;	
		if gtr_personal.sqlcode<>0 then
			SELECT empl_uia2.empleado  
			INTO :ll_cuenta  
			FROM empl_uia2  
			WHERE empl_uia2.nchip = :as_nchip   using gtr_personal;	
			if gtr_personal.sqlcode<>0 then
				ll_cuenta=0
			else
				rb_empleado.checked=true
			end if
		else
			rb_empleado.checked=true
		end if
		commit using gtr_personal;
	else
		rb_alumno.checked=true
	end if
	commit using gtr_sumuia;
if ll_cuenta<>0 then
	sle_cuenta.text=string(ll_cuenta)
end if

return ll_cuenta


end function

public function boolean wf_busca_empleado ();string ls_nombrecompleto,ls_costo,ls_depto
long ll_nomina
integer li_status
boolean lb_error=true

if isnumber(sle_cuenta.text) then
    ll_nomina=long(sle_cuenta.text)
    SELECT  nombre+''+isnull(appaterno,'')+' '+ isnull(apmaterno,'') as nombrecompleto,   
         empl_uia1.ccosto,   
         empl_uia1.nombredepto,
			empl_uia1.status
    INTO :ls_nombrecompleto,   
         :ls_costo,   
         :ls_depto,
			:li_status
    FROM empl_uia1  
   WHERE empl_uia1.empleado = :ll_nomina   using gtr_personal;
	
		if gtr_personal.sqlcode=0 then
			if li_status >= 2 then
				st_inscrito.text="Usuario no valido"
				st_inscrito.textcolor = RGB (255,1,1)
			else
				st_inscrito.text="Usuario valido"
				st_inscrito.textcolor = RGB ( 0, 0, 0 )
			end if
			//TODO OK
			st_nombre.text=ls_nombrecompleto
			st_actividad.text=ls_depto
			uo_parametros.il_parm1=ll_nomina
			uo_parametros.is_parm2=ls_nombrecompleto
			uo_parametros.is_parm3=ls_depto
			uo_parametros.is_parm4=ls_costo
			lb_error=false
		else
			if gtr_personal.sqlcode<>0 then
				SELECT empl_uia2.nombrecompleto,   
						estructura.nombre_estructura,   
						empl_uia2.templ  
				 
				INTO :ls_nombrecompleto,   
				:ls_depto,
				:li_status  
				FROM empl_uia2,   
						estructura  
				WHERE ( empl_uia2.depto = estructura.depto )  
				and  ( empl_uia2.empleado = :ll_nomina  ) 
				using gtr_personal;	
				if li_status >= 20 then
					st_inscrito.text="Usuario no valido"
					st_inscrito.textcolor = RGB (255,1,1)
				else
					st_inscrito.text="Usuario valido"
					st_inscrito.textcolor = RGB ( 0, 0, 0 )
				end if
				st_nombre.text=ls_nombrecompleto
				st_actividad.text=ls_depto
				uo_parametros.il_parm1=ll_nomina
				uo_parametros.is_parm2=ls_nombrecompleto
				uo_parametros.is_parm3=ls_depto
				uo_parametros.is_parm4='0'
				lb_error=false
			end if
			
			
			
		end if			
else
	messagebox("Mensaje del Sistema","Ingrese el numero de cuenta correctamente",stopsign!)
	sle_cuenta.setfocus()
end if

return lb_error
end function

public function boolean wf_busca_alumno ();string ls_nombrecompleto,ls_carrera
long ll_cuenta
long ll_cuenta_inscrito
boolean lb_error=true

  if isnumber(sle_cuenta.text) then
    ll_cuenta=long(sle_cuenta.text)
  SELECT b.cuenta,   
	         a.nombre+ ' ' + a.apaterno+' ' +a.amaterno as nombre_completo  ,
			d.carrera
   INTO :ll_cuenta_inscrito,   
	        	:ls_nombrecompleto,
			  :ls_carrera
	    FROM v_sce_alumnos a,   
		         v_sce_banderas_inscrito  b,
				v_sce_academicos c,
				v_sce_carreras d
	   WHERE ( a.cuenta *= b.cuenta) and (  a.cuenta = :ll_cuenta  ) and ( c.cuenta=a.cuenta)  and c.cve_carrera=d.cve_carrera  using gtr_sumuia;
		if gtr_sumuia.sqlcode=0 then
			//TODO OK
			st_nombre.text=ls_nombrecompleto
			st_actividad.text=ls_carrera
			uo_parametros.is_parm2=ls_nombrecompleto
			uo_parametros.is_parm3=ls_carrera
			uo_parametros.il_parm1=ll_cuenta
			if not isnull(ll_cuenta_inscrito) then
				st_inscrito.text="Alumno inscrito"
				st_inscrito.textcolor = RGB ( 0, 0, 0 )
			else
				st_inscrito.text="Usuario no valido (NO INSCRITO)"
				st_inscrito.textcolor = RGB ( 255, 5, 5 )
			end if
			lb_error=false
		else
			messagebox("Mensaje del Sistema","La cuenta ingresada no existe",stopsign!)
			sle_cuenta.setfocus()
		end if			
else
	messagebox("Mensaje del Sistema","Ingrese el numero de cuenta correctamente",stopsign!)
	sle_cuenta.setfocus()
end if

return lb_error
end function

public subroutine wf_carga_foto (long li_cuenta, integer li_tipo);Blob lbl_foto
String ls_arch_ruta
SetNull(ls_arch_ruta)

//	if li_tipo=0 then
//		ls_arch_ruta = f_archivo_gvbox(f_foto_alumno(li_cuenta))
//	else
//		ls_arch_ruta = f_archivo_gvbox(f_foto_profesor(li_cuenta))
//	end if
	IF IsNull(ls_arch_ruta) THEN 
//		ole_foto.Object.FileName = ''
		messagebox('Aviso','El Alumno no tiene foto') 
	ELSE 
//		ole_foto.Object.FileName = ls_arch_ruta
//		ole_foto.visible=true
//		ole_foto.object.autosize=2
	END IF

end subroutine

on w_gral_busqueda_uia.create
this.rb_empleado=create rb_empleado
this.cb_seleccionar=create cb_seleccionar
this.st_inscrito=create st_inscrito
this.rb_alumno=create rb_alumno
this.st_actividad=create st_actividad
this.st_nombre=create st_nombre
this.st_tipo=create st_tipo
this.sle_cuenta=create sle_cuenta
this.ole_credencial=create ole_credencial
this.Control[]={this.rb_empleado,&
this.cb_seleccionar,&
this.st_inscrito,&
this.rb_alumno,&
this.st_actividad,&
this.st_nombre,&
this.st_tipo,&
this.sle_cuenta,&
this.ole_credencial}
end on

on w_gral_busqueda_uia.destroy
destroy(this.rb_empleado)
destroy(this.cb_seleccionar)
destroy(this.st_inscrito)
destroy(this.rb_alumno)
destroy(this.st_actividad)
destroy(this.st_nombre)
destroy(this.st_tipo)
destroy(this.sle_cuenta)
destroy(this.ole_credencial)
end on

event open;ole_credencial.object.tlector=gs_tlector
ole_credencial.object.inicializa()
timer(1.5)
if uo_parametros.is_parm1="BUSQUEDA" then cb_seleccionar.visible = true
uo_parametros.is_parm5=Message.StringParm	
end event

event timer;string nchip=""
long ll_cuenta
nchip=ole_credencial.object.AutorizaChip()

if nchip<>"" then
	//INSERTO CREDENCIAL
	cb_seleccionar.enabled=false
//	ole_foto.visible=false
	ll_cuenta=wf_busca_cuenta(nchip)
	if ll_cuenta=0 then	
		messagebox("Mensaje del Sistema","Credencial Inválida",stopsign!)	
	else
		sle_cuenta.triggerevent(modified!)
	end if
end if
end event

event closequery;ole_credencial.object.desconectar()
end event

event activate;timer(1.5)
end event

event deactivate;timer(0)
end event

type rb_empleado from radiobutton within w_gral_busqueda_uia
integer x = 644
integer y = 189
integer width = 636
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Profesor/Empleado"
end type

type cb_seleccionar from commandbutton within w_gral_busqueda_uia
boolean visible = false
integer x = 1090
integer y = 1034
integer width = 406
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Seleccionar"
end type

event clicked;

uo_parametros.is_parm1="BUSQUEDA"
if rb_alumno.checked then
	uo_parametros.ii_parm2=1
else
	uo_parametros.ii_parm2=2
end if
closewithreturn(parent,uo_parametros)
end event

type st_inscrito from statictext within w_gral_busqueda_uia
integer x = 18
integer y = 1203
integer width = 1467
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_alumno from radiobutton within w_gral_busqueda_uia
integer x = 176
integer y = 189
integer width = 344
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Alumno"
boolean checked = true
end type

event getfocus;st_tipo.text="Número de Cuenta"
sle_cuenta.text=""
//ole_foto.visible=false
cb_seleccionar.enabled=false
st_inscrito.text=""
st_actividad.text=""
st_nombre.text=""
end event

type st_actividad from statictext within w_gral_busqueda_uia
integer x = 18
integer y = 1418
integer width = 1467
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
alignment alignment = center!
boolean focusrectangle = false
end type

type st_nombre from statictext within w_gral_busqueda_uia
integer x = 18
integer y = 1344
integer width = 1467
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
alignment alignment = center!
boolean focusrectangle = false
end type

type st_tipo from statictext within w_gral_busqueda_uia
integer x = 51
integer y = 323
integer width = 691
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Número de Cuenta"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_cuenta from singlelineedit within w_gral_busqueda_uia
integer x = 764
integer y = 314
integer width = 377
integer height = 90
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;if rb_alumno.checked then
	if not(wf_busca_alumno() ) then 
		wf_carga_foto(long(sle_cuenta.text),0)
		cb_seleccionar.enabled=true
	end if
else
	if not(wf_busca_empleado() ) then 
		wf_carga_foto(long(sle_cuenta.text),1)
		cb_seleccionar.enabled=true
	end if
end if
end event

event getfocus;this.text=""
cb_seleccionar.enabled=false
//ole_foto.visible=false
st_inscrito.text=""
st_actividad.text=""
st_nombre.text=""
end event

type ole_credencial from olecustomcontrol within w_gral_busqueda_uia
integer x = 80
integer y = 29
integer width = 1317
integer height = 768
integer taborder = 20
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_gral_busqueda_uia.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Aw_gral_busqueda_uia.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Aw_gral_busqueda_uia.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
