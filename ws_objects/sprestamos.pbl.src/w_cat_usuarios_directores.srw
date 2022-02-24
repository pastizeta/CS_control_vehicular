$PBExportHeader$w_cat_usuarios_directores.srw
forward
global type w_cat_usuarios_directores from window
end type
type st_1 from statictext within w_cat_usuarios_directores
end type
type cb_cerrar from commandbutton within w_cat_usuarios_directores
end type
type cb_actualiza from commandbutton within w_cat_usuarios_directores
end type
type cb_eliminar from commandbutton within w_cat_usuarios_directores
end type
type cb_nuevo from commandbutton within w_cat_usuarios_directores
end type
type dw_cap from datawindow within w_cat_usuarios_directores
end type
end forward

global type w_cat_usuarios_directores from window
integer width = 4069
integer height = 2020
boolean titlebar = true
string title = "Directores"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 29534863
st_1 st_1
cb_cerrar cb_cerrar
cb_actualiza cb_actualiza
cb_eliminar cb_eliminar
cb_nuevo cb_nuevo
dw_cap dw_cap
end type
global w_cat_usuarios_directores w_cat_usuarios_directores

type variables
integer ii_usuario
end variables

on w_cat_usuarios_directores.create
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.cb_actualiza=create cb_actualiza
this.cb_eliminar=create cb_eliminar
this.cb_nuevo=create cb_nuevo
this.dw_cap=create dw_cap
this.Control[]={this.st_1,&
this.cb_cerrar,&
this.cb_actualiza,&
this.cb_eliminar,&
this.cb_nuevo,&
this.dw_cap}
end on

on w_cat_usuarios_directores.destroy
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.cb_actualiza)
destroy(this.cb_eliminar)
destroy(this.cb_nuevo)
destroy(this.dw_cap)
end on

event open;//cbx_int.checked = true
dw_cap.retrieve()
end event

event doubleclicked;//integer liEncontrado, liTipoEncontrado
//long llCuentaClave, llDeptoCarrera
//String lsNombre
//
//if dwo.name = 'nomina' or dwo.name = 'nomina_resp' or dwo.name = 'correo' then
//	n_transportar regreso
//	open(w_gral_busca_empleados)
//	regreso = message.powerobjectparm
//	liEncontrado =regreso.ii_parm1
//	IF liEncontrado = 1 THEN
//		liTipoEncontrado = regreso.ii_parm2
//		llCuentaClave= regreso.il_parm1
//	
//		llDeptoCarrera = regreso.il_parm2
//		
//		choose case  dwo.name
//			case 'nomina'
//				this.setitem(row,'nomina',llCuentaClave)
//				this.setitem(row,'nomina_resp',llDeptoCarrera)
//				this.setfocus()
//			case 'nomina_resp'
//				this.setitem(row,'nomina',llCuentaClave)
//				this.setitem(row,'nomina_resp',llDeptoCarrera)
//				this.setfocus()
//			case 'correo'
//				this.setitem(row,'nomina',llCuentaClave)
//				this.setitem(row,'nomina_resp',llDeptoCarrera)
//				this.setfocus()
//		end choose
//	END IF
//end if
//
//
//			
end event

event activate;dw=dw_cap
nuevo=cb_nuevo
eliminar=cb_eliminar
actualizar=cb_actualiza
end event

type st_1 from statictext within w_cat_usuarios_directores
integer x = 302
integer y = 100
integer width = 594
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 29534863
string text = "Usuarios de Dirección"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_cat_usuarios_directores
integer x = 2446
integer y = 1588
integer width = 361
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

type cb_actualiza from commandbutton within w_cat_usuarios_directores
integer x = 2043
integer y = 1588
integer width = 361
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;boolean lb_todobien = true
integer i, TipoUsu

dw_cap.AcceptText()

for i = 1 to dw_cap.rowcount() 

	if isnull(dw_cap.object.nomina[i]) then
		messagebox("ATENCIÓN","Debe indicar número de nomina." ,Exclamation!, OK! )
		lb_todobien = false
		return
	else
		if isnull(dw_cap.object.nombre[i]) then
			messagebox("ATENCIÓN","Debe indicar nombre del empleado." ,Exclamation!, OK! )
			lb_todobien = false
			return
		else
			if isnull(dw_cap.object.puesto[i]) then
				messagebox("ATENCIÓN","Debe indicar puesto." ,Exclamation!, OK! )
				lb_todobien = false
				return
			else
//				//	Usuario Externo
//				if cbx_ext.checked then	
//					TipoUsu= dw_cap.object.tipo_usuario[i]
//					if TipoUsu = 1 then
//						if isnull(dw_cap.object.passwd[i]) then
//							messagebox("ATENCIÓN","Debe indicar password del usuario externo." ,Exclamation!, OK! )
//							lb_todobien = false
//							return
//						else
//							if (isnull(dw_cap.object.descripcion[i]) or dw_cap.object.descripcion[i] = "") then
//								messagebox("ATENCIÓN","Debe indicar descripción para usuario externo." ,Exclamation!, OK! )
//								lb_todobien = false
//								return
//							else
//								lb_todobien = true
//							end if
//						end if
//					end if
//				else
//					lb_todobien = true
//				end if
				lb_todobien = true
			end if
		end if
	end if
next



if dw_cap.update()>0 and lb_todobien then
	commit using gtr_sumuia;
	messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
else
	rollback using gtr_sumuia;
	messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito",stopsign!)
end if




end event

type cb_eliminar from commandbutton within w_cat_usuarios_directores
integer x = 1641
integer y = 1588
integer width = 361
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;IF dw_cap.Rowcount() = 0 then return
IF dw_cap.deleterow(dw_cap.getrow())<>1 THEN
	messagebox("Mensaje del sistema","El registro NO ha sido eliminado")
	dw_cap.retrieve()
END IF
end event

type cb_nuevo from commandbutton within w_cat_usuarios_directores
integer x = 1239
integer y = 1588
integer width = 361
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;long ll_nva_linea
dw_cap.setfocus()		
if dw_cap.accepttext()=1 then
	ll_nva_linea=dw_cap.insertrow(0)
	dw_cap.setcolumn(1)
	dw_cap.scrolltorow(ll_nva_linea)
end if
end event

type dw_cap from datawindow within w_cat_usuarios_directores
integer x = 297
integer y = 228
integer width = 3465
integer height = 1284
integer taborder = 10
string title = "none"
string dataobject = "dw_rep_web_directores"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;integer liEncontrado, liTipoEncontrado
long llCuentaClave, llDeptoCarrera
String lsNombre,lsPuesto

AcceptText()

//IF cbx_int.checked = false and cbx_ext.checked = false then
//	Messagebox("Aviso de Sistema","Debe indicar tipo de usuario")
//else
//	if cbx_int.checked then

		if dwo.name = 'nomina' or dwo.name = 'nombre' or dwo.name = 'puesto' then
			n_transportar regreso
			open(w_gral_busca_directores)
			regreso = message.powerobjectparm
			liEncontrado =regreso.ii_parm1
			IF liEncontrado = 1 THEN
				liTipoEncontrado = regreso.ii_parm2
				llCuentaClave= regreso.il_parm1
//				llDeptoCarrera = regreso.il_parm2
				lsNombre = regreso.is_parmdir1
				lsPuesto = regreso.is_parmdir2
				
				choose case  dwo.name
					case 'nomina'
						this.setitem(row,'nomina',llCuentaClave)
						this.setitem(row,'nombre',lsNombre)
						this.setitem(row,'puesto',lsPuesto)
						this.setfocus()
					case 'nombre'
						this.setitem(row,'nomina',llCuentaClave)
						this.setitem(row,'nombre',lsNombre)
						this.setitem(row,'puesto',lsPuesto)
						this.setfocus()
					case 'puesto'
						this.setitem(row,'nomina',llCuentaClave)
						this.setitem(row,'nombre',lsNombre)
						this.setitem(row,'puesto',lsPuesto)
						this.setfocus()
					
				end choose
			END IF
		end if
//	else
//		if dwo.name = 'nomina' or dwo.name = 'nombre' or dwo.name = 'puesto' then
//			open(w_gral_busca_empleados)
//			regreso = message.powerobjectparm
//			liEncontrado =regreso.ii_parm1
//			IF liEncontrado = 1 THEN
//				liTipoEncontrado = regreso.ii_parm2
//				llCuentaClave= regreso.il_parm1
//			
//				llDeptoCarrera = regreso.il_parm2
//				
//				choose case  dwo.name
//					case 'nomina'
//						this.setitem(row,'nomina_resp',llCuentaClave)
//						this.setitem(row,'tipo_usuario',1)
//						this.setfocus()
//					case 'nomina_resp'
//						this.setitem(row,'nomina_resp',llCuentaClave)
//						this.setitem(row,'tipo_usuario',1)
//						this.setfocus()
//					case 'correo'
//						this.setitem(row,'nomina_resp',llCuentaClave)
//						this.setitem(row,'tipo_usuario',1)
//						this.setfocus()
//					case 'passwd'
//						this.setitem(row,'nomina',llCuentaClave)
//						this.setitem(row,'nomina_resp',llDeptoCarrera)
//						this.setitem(row,'tipo_usuario',1)
//						this.setfocus()
//				end choose
//			END IF
//		end if
//	end if
//end if
//
			
end event

event constructor;SetTransObject(gtr_sumuia)
end event

event itemchanged;//long llcuenta
//string ls_apaterno, ls_amaterno, ls_nombre
//
//
//row = dw_familiares.GetRow()
//
//CHOOSE CASE GetColumnName ()
//	case 'cuenta_famexuia'
//		llcuenta =Long(data)
//
//		SELECT controlescolar_bd.dbo.alumnos.nombre,   
//         	controlescolar_bd.dbo.alumnos.apaterno,   
//         	controlescolar_bd.dbo.alumnos.amaterno
//		INTO: ls_nombre,:ls_apaterno,:ls_amaterno
//		FROM	controlescolar_bd.dbo.alumnos
//		WHERE	controlescolar_bd.dbo.alumnos.cuenta =:llcuenta
//		USING gtr_info_uia;
//		dw_familiares.setItem(row,'apaterno_famexuia',ls_apaterno)
//		dw_familiares.setItem(row,'amaterno_famexuia',ls_amaterno)
//		dw_familiares.setItem(row,'nombre_famexuia',ls_nombre)
//	case else
//END CHOOSE
end event

