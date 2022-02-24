$PBExportHeader$w_psi_mat_insc_antes.srw
$PBExportComments$Muestra las materias inscritas por el alumno y el profesor asignado a la misma, solo concidera las materias del departamento de psicologia
forward
global type w_psi_mat_insc_antes from w_sheet
end type
type st_1 from statictext within w_psi_mat_insc_antes
end type
type dw_mat_cursos from u_dw within w_psi_mat_insc_antes
end type
end forward

global type w_psi_mat_insc_antes from w_sheet
integer height = 888
string title = "Materias inscritas"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 29534863
st_1 st_1
dw_mat_cursos dw_mat_cursos
end type
global w_psi_mat_insc_antes w_psi_mat_insc_antes

type variables
n_transportar regreso
boolean ib_selecciona
integer li_tipo
long sl_linea
end variables

on w_psi_mat_insc_antes.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_mat_cursos=create dw_mat_cursos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_mat_cursos
end on

on w_psi_mat_insc_antes.destroy
call super::destroy
destroy(this.st_1)
destroy(this.dw_mat_cursos)
end on

event open;call super::open;long ll_cuentaProf
regreso = message.powerobjectparm
li_tipo = regreso.ii_parm1 
ll_cuentaProf = regreso.il_parm1

	choose case li_tipo
		case 1
			dw_mat_cursos.dataobject= "d_psi_materias_insc"
			dw_mat_cursos.setTransObject(gtr_sumuia)
//			dw_mat_cursos.Retrieve(ll_cuentaProf)
			if dw_mat_cursos.Retrieve(ll_cuentaProf) = 0 then
				messagebox("Atención","El alumno con cuenta "+ string(ll_cuentaProf) +" ~n no tiene materias inscritas del área de psicologia")
				ib_selecciona  = false
				close( this)
			end if 
			
		case 3
			dw_mat_cursos.dataobject= "d_psi_materias_insc_p"
			dw_mat_cursos.setTransObject(gtr_sumuia)
//			dw_mat_cursos.Retrieve(ll_cuentaProf)			
			if dw_mat_cursos.Retrieve(ll_cuentaProf) = 0 then
				messagebox("Atención","El profesor con clave "+ string(ll_cuentaProf) +" ~n no imparte materias del área de psicologia")
				ib_selecciona = false
				close( this)
			end if 
	end choose
		
end event

event close;call super::close;if ib_selecciona then	
	CloseWithReturn(w_psi_mat_insc,regreso)
end if
end event

type st_1 from statictext within w_psi_mat_insc_antes
integer x = 1257
integer y = 712
integer width = 1970
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 29534863
string text = "Dar doble click sobre la materia deseada para seleccionar"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_mat_cursos from u_dw within w_psi_mat_insc_antes
integer x = 69
integer y = 72
integer width = 3049
integer height = 560
integer taborder = 10
string dataobject = "d_psi_materias_insc_p"
boolean border = false
end type

event itemfocuschanged;call super::itemfocuschanged;sl_linea=row
if row>0 then
	selectrow(0,false)
	selectrow(row,true)
else
	selectrow(0,false)
end if
end event

event doubleclicked;call super::doubleclicked;ib_selecciona = true
	choose case li_tipo
		case 1
			regreso.is_parm2 = this.GetItemString(row,'v_sce_materias_materia')
			regreso.is_parm3= this.GetItemString(row,'v_sce_profesor_nombre')		
			
		case 2
			regreso.is_parm2 = this.GetItemString(row,'v_sce_materias_materia')
			
	end choose
	close(parent)

end event

