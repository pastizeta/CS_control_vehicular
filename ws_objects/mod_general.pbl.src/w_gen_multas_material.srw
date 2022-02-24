$PBExportHeader$w_gen_multas_material.srw
forward
global type w_gen_multas_material from window
end type
type st_2 from statictext within w_gen_multas_material
end type
type dw_tipo_usuario from u_basedw within w_gen_multas_material
end type
type cb_actualizar from commandbutton within w_gen_multas_material
end type
type dw_multa from datawindow within w_gen_multas_material
end type
type st_nombre from statictext within w_gen_multas_material
end type
type st_cuenta from statictext within w_gen_multas_material
end type
type sle_solicitante from singlelineedit within w_gen_multas_material
end type
end forward

global type w_gen_multas_material from window
integer width = 2604
integer height = 1165
boolean titlebar = true
string title = "Liberación de multa"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
st_2 st_2
dw_tipo_usuario dw_tipo_usuario
cb_actualizar cb_actualizar
dw_multa dw_multa
st_nombre st_nombre
st_cuenta st_cuenta
sle_solicitante sle_solicitante
end type
global w_gen_multas_material w_gen_multas_material

type variables
integer ii_tipo_usuario=0, ii_anio, ii_periodo
long il_solicitante=0
string is_solicitantenom=''

DatawindowChild idwc_tipo_usuario
end variables

forward prototypes
public function integer f_valida_usuario (string p_cuenta)
public subroutine f_reset ()
end prototypes

public function integer f_valida_usuario (string p_cuenta);integer li_pos, li_existe=0, li_valida=-1
string ls_cuenta, ls_digito
long ll_cuenta=0

choose case ii_tipo_usuario
	case 1

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
		if li_existe=1 then li_valida=f_valida_alumno(ll_cuenta,is_solicitantenom)				
		
	case 2
		
		if isNumber(p_cuenta) then 
			ll_cuenta=long(p_cuenta)
			li_valida=f_valida_alumno_intercambio(ll_cuenta,is_solicitantenom,ii_anio,ii_periodo)
		end if
		
	case 3
		
		if isNumber(p_cuenta) then 
			ll_cuenta=long(p_cuenta)
			li_valida=f_valida_empleado(ll_cuenta,is_solicitantenom)
		end if
		
	case 4

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
		if li_existe=1 then li_valida=f_valida_exalumno(ll_cuenta,is_solicitantenom)
		
	case 5

		if isNumber(p_cuenta) then 
			ll_cuenta=long(p_cuenta)
			li_valida=f_valida_alumno_dec(ll_cuenta,is_solicitantenom)
		end if
		
end choose

il_solicitante=ll_cuenta
return (li_valida)
end function

public subroutine f_reset ();il_solicitante=0
is_solicitantenom=''

sle_solicitante.text=''
st_nombre.text=''

dw_multa.Reset()
end subroutine

on w_gen_multas_material.create
this.st_2=create st_2
this.dw_tipo_usuario=create dw_tipo_usuario
this.cb_actualizar=create cb_actualizar
this.dw_multa=create dw_multa
this.st_nombre=create st_nombre
this.st_cuenta=create st_cuenta
this.sle_solicitante=create sle_solicitante
this.Control[]={this.st_2,&
this.dw_tipo_usuario,&
this.cb_actualizar,&
this.dw_multa,&
this.st_nombre,&
this.st_cuenta,&
this.sle_solicitante}
end on

on w_gen_multas_material.destroy
destroy(this.st_2)
destroy(this.dw_tipo_usuario)
destroy(this.cb_actualizar)
destroy(this.dw_multa)
destroy(this.st_nombre)
destroy(this.st_cuenta)
destroy(this.sle_solicitante)
end on

event open;integer li_cuantos

dw_tipo_usuario.settransobject(gtr_sumuia)
dw_multa.settransobject(gtr_sumuia)

//Usuario
dw_tipo_usuario.settransobject(gtr_sumuia)
dw_tipo_usuario.getchild('tipo_usuario',idwc_tipo_usuario)
idwc_tipo_usuario.settransobject(gtr_sumuia)
idwc_tipo_usuario.Retrieve(gi_depto,-1,0)
if idwc_tipo_usuario.RowCount()>0 then dw_tipo_usuario.insertrow(0)

f_select_anio_periodo_actual(ii_periodo,ii_anio,today())

f_reset()
end event

type st_2 from statictext within w_gen_multas_material
integer x = 73
integer y = 32
integer width = 256
integer height = 61
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Usuario:"
boolean focusrectangle = false
end type

type dw_tipo_usuario from u_basedw within w_gen_multas_material
integer x = 329
integer y = 32
integer width = 633
integer height = 77
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_gen_cat_tipo_usuario_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("area", "area", "area")
end event

event itemchanged;call super::itemchanged;ii_tipo_usuario=long(this.gettext())

il_solicitante=0
is_solicitantenom=''

sle_solicitante.text=''
st_nombre.text=''

dw_multa.Reset()

sle_solicitante.enabled=true
sle_solicitante.SetFocus()



end event

type cb_actualizar from commandbutton within w_gen_multas_material
integer x = 2180
integer y = 957
integer width = 362
integer height = 90
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar"
end type

event clicked;date ldFechaEntrega
integer liDiasRestraso, liCaja, liCorte, liOper
long llMaxFolio, llRow, llEstatus, llFolio, llFolioDat
string lsUpdate, lsTUpdate, lsCveMaterial, lsNoSerie

if dw_multa.RowCount()>0 then

	if dw_multa.update(true,false)< 0 then
		messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
		return
	end if
	
	for llRow = 1 to dw_multa.RowCount()
		llEstatus = dw_multa.getitemnumber(llRow,'saldo0')
		choose case llEstatus
			case 1
				llFolio = dw_multa.getitemnumber(llRow,'folio_multa')
				llFolioDat = dw_multa.getitemnumber(llRow,'folio')
				
				UPDATE dbo.spre_materiales_multas  
				SET status = 1  
				WHERE ( dbo.spre_materiales_multas.cvedepto = :gi_depto ) AND  
					( dbo.spre_materiales_multas.folio_multa = :llFolio )
				using gtr_sumuia;	
				if gtr_sumuia.sqlcode < 0 then
					rollback using gtr_sumuia;
					messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
					return
				end if
		end choose
	next
	commit using gtr_sumuia;
	
	dw_multa.ResetUpdate()
	messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
	f_reset()

end if
end event

type dw_multa from datawindow within w_gen_multas_material
integer x = 73
integer y = 374
integer width = 2465
integer height = 547
integer taborder = 40
string title = "none"
string dataobject = "d_gen_multa_solicitante"
boolean border = false
boolean livescroll = true
end type

event itemchanged;integer i
if dwo.name='saldo0' then
	CHOOSE CASE long(data)
		CASE 1
			this.setitem(row,'saldo',0)
		CASE 0
			this.setitem(row,'saldo',getitemnumber(row,'importe'))
	END CHOOSE
end if
end event

type st_nombre from statictext within w_gen_multas_material
integer x = 73
integer y = 243
integer width = 2015
integer height = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 31908573
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_cuenta from statictext within w_gen_multas_material
integer x = 73
integer y = 144
integer width = 245
integer height = 61
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Cuenta:"
boolean focusrectangle = false
end type

type sle_solicitante from singlelineedit within w_gen_multas_material
event ue_usuario_busqueda ( )
integer x = 333
integer y = 128
integer width = 322
integer height = 70
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

event ue_usuario_busqueda();integer li_acceso
	
li_acceso=f_valida_usuario(trim(sle_solicitante.text))
if li_acceso=-1 then
	f_reset()
else
	st_nombre.text=is_solicitantenom

	dw_multa.Retrieve(gi_depto,il_solicitante,ii_tipo_usuario)
end if

end event

event modified;event ue_usuario_busqueda()


end event

