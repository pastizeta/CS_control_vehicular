$PBExportHeader$w_gen_mat_insc.srw
$PBExportComments$Muestra las materias inscritas por el alumno y el profesor asignado a la misma, solo concidera las materias del departamento en cuestión
forward
global type w_gen_mat_insc from w_sheet
end type
type st_1 from statictext within w_gen_mat_insc
end type
type dw_mat_cursos from u_dw within w_gen_mat_insc
end type
end forward

global type w_gen_mat_insc from w_sheet
integer x = 214
integer width = 3200
integer height = 1965
string title = "Materias inscritas"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 29534863
st_1 st_1
dw_mat_cursos dw_mat_cursos
end type
global w_gen_mat_insc w_gen_mat_insc

type variables
n_transportar regreso
boolean ib_selecciona
integer li_tipo
long sl_linea
end variables

on w_gen_mat_insc.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_mat_cursos=create dw_mat_cursos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_mat_cursos
end on

on w_gen_mat_insc.destroy
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
			dw_mat_cursos.dataobject= "d_gen_materias_insc"
			dw_mat_cursos.setTransObject(gtr_sumuia)
//			dw_mat_cursos.Retrieve(ll_cuentaProf)
			if dw_mat_cursos.Retrieve(ll_cuentaProf) = 0 then
				messagebox("Atención","El alumno con cuenta "+ string(ll_cuentaProf) +" ~n no tiene materias inscritas del área correspondiente")
				ib_selecciona  = false
				close( this)
			end if 
			
		case 3
			dw_mat_cursos.dataobject= "d_gen_materias_insc_p"
			dw_mat_cursos.setTransObject(gtr_sumuia)
//			dw_mat_cursos.Retrieve(ll_cuentaProf)		
			if dw_mat_cursos.Retrieve(ll_cuentaProf) = 0 then
				messagebox("Atención","El profesor con clave "+ string(ll_cuentaProf) +" ~n no imparte materias del área correspondiente")
				regreso.is_parm2='0'
				ib_selecciona = false
				close( this)
			end if 
	end choose
		
		
end event

event close;call super::close;if ib_selecciona then	
	CloseWithReturn(w_gen_mat_insc,regreso)
end if
end event

type st_1 from statictext within w_gen_mat_insc
integer x = 1200
integer y = 1782
integer width = 1971
integer height = 83
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

type dw_mat_cursos from u_dw within w_gen_mat_insc
integer x = 69
integer y = 74
integer width = 3050
integer height = 1565
integer taborder = 10
string dataobject = "d_gen_materias_insc_p"
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

event doubleclicked;call super::doubleclicked;integer clase
string SalonAsignado
ib_selecciona = true


if row>0 then
	choose case li_tipo
			
		case 1,2
			
			regreso.is_parm2	= this.GetItemString(row,'v_sce_materias_materia')
			regreso.is_parm3	= this.GetItemString(row,'v_sce_profesor_nombre')		
			regreso.ii_parm4 = this.GetItemNumber(row,'v_sce_materias_cve_mat')
			regreso.is_parm5 = this.GetItemString(row,'v_sce_grupos_gpo')
			
			regreso.ii_parm9	= this.GetItemNumber(row,'v_sce_horario_hora_inicio')
			regreso.ii_parm10	= this.GetItemNumber(row,'v_sce_horario_hora_final')
			             
			clase=this.GetItemnumber(row,'v_sce_horario_clase_aula')
			SalonAsignado = this.GetItemString(row,'v_sce_horario_cve_salon')
			
			if isnull(SalonAsignado) then
				if clase = 0 then
					regreso.is_parm11='0'
				elseif clase = 1 then
					regreso.is_parm11= 'Taller'
				elseif clase = 2 then
					regreso.is_parm11=' Lab'
				elseif clase = 3 then
					regreso.is_parm11='Otro '
				elseif clase = 4 then
					regreso.is_parm11='Por Asig'
				elseif clase = 5 then
					regreso.is_parm11='Aula Computo'
				end if
			else
				regreso.is_parm11= this.GetItemString(row,'v_sce_horario_cve_salon')
			end if
			
		case 3

			regreso.is_parm2 = this.GetItemString(row,'v_sce_materias_materia')
			regreso.is_parm3	= this.GetItemString(row,'nombre_profesor')	
			
			regreso.ii_parm4 = this.GetItemNumber(row,'v_sce_materias_cve_mat')
			regreso.is_parm5 = this.GetItemString(row,'v_sce_mat_inscritas_gpo')
			
			regreso.ii_parm9	= this.GetItemNumber(row,'v_sce_horario_hora_inicio')
			regreso.ii_parm10	= this.GetItemNumber(row,'v_sce_horario_hora_final')

			SalonAsignado = this.GetItemString(row,'v_sce_horario_cve_salon')
			
			if isnull(SalonAsignado) then
				if clase = 0 then
					regreso.is_parm11='0'
				elseif clase = 1 then
					regreso.is_parm11= 'Taller'
				elseif clase = 2 then
					regreso.is_parm11=' Lab'
				elseif clase = 3 then
					regreso.is_parm11='Otro '
				elseif clase = 4 then
					regreso.is_parm11='Por Asig'
				elseif clase = 5 then
					regreso.is_parm11='Aula Computo'
				end if
			else
				regreso.is_parm11= this.GetItemString(row,'v_sce_horario_cve_salon')
			end if

	end choose
	close(parent)
	
else
	messagebox('Aviso','Dar doble sobre el cuadro amarillo para elegir la clase.')
end if

end event

