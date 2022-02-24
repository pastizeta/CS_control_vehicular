$PBExportHeader$w_csal_mat_insc.srw
forward
global type w_csal_mat_insc from w_gen_mat_insc
end type
end forward

global type w_csal_mat_insc from w_gen_mat_insc
integer width = 3248
end type
global w_csal_mat_insc w_csal_mat_insc

on w_csal_mat_insc.create
call super::create
end on

on w_csal_mat_insc.destroy
call super::destroy
end on

event open;long ll_cuentaProf
regreso = message.powerobjectparm
li_tipo = regreso.ii_parm1 
ll_cuentaProf = regreso.il_parm1

	choose case li_tipo
		case 1
			dw_mat_cursos.dataobject= "d_csal_materias_insc"
			dw_mat_cursos.setTransObject(gtr_sumuia)
//			dw_mat_cursos.Retrieve(ll_cuentaProf)
			if dw_mat_cursos.Retrieve(ll_cuentaProf) = 0 then
				messagebox("Atención","El alumno con cuenta "+ string(ll_cuentaProf) +" ~n no tiene materias inscritas del área de control de salones")
				ib_selecciona  = false
				close( this)
			end if 
			
		case 3
			dw_mat_cursos.dataobject= "d_csal_materias_insc_p"
			dw_mat_cursos.setTransObject(gtr_sumuia)
//			dw_mat_cursos.Retrieve(ll_cuentaProf)			
			if dw_mat_cursos.Retrieve(ll_cuentaProf) = 0 then
				messagebox("Atención","El profesor con clave "+ string(ll_cuentaProf) +" ~n no imparte materias del área de control de salones")
				ib_selecciona = false
				close( this)
			end if 
	end choose
		
end event

event close;if ib_selecciona then	
	CloseWithReturn(w_csal_mat_insc,regreso)
end if
end event

type st_1 from w_gen_mat_insc`st_1 within w_csal_mat_insc
integer x = 1448
integer y = 1776
integer width = 1763
alignment alignment = right!
end type

type dw_mat_cursos from w_gen_mat_insc`dw_mat_cursos within w_csal_mat_insc
integer x = 29
integer width = 3163
integer height = 1632
string dataobject = "d_csal_materias_insc"
end type

event dw_mat_cursos::doubleclicked;integer clase
string SalonAsignado
ib_selecciona = true

if row>0 then
	choose case li_tipo
			
		case 1,2
			regreso.is_parm2	= this.GetItemString(row,'v_sce_materias_materia')
			regreso.is_parm3	= this.GetItemString(row,'v_sce_profesor_nombre')		
			             
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
			regreso.ii_parm9	= this.GetItemNumber(row,'v_sce_horario_hora_inicio')
			regreso.ii_parm10	= this.GetItemNumber(row,'v_sce_horario_hora_final')
		case 3
			//
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
			//
			regreso.is_parm2 = this.GetItemString(row,'v_sce_materias_materia')
			
			regreso.ii_parm9	= this.GetItemNumber(row,'v_sce_horario_hora_inicio')
			regreso.ii_parm10	= this.GetItemNumber(row,'v_sce_horario_hora_final')
	end choose
	close(parent)
end if

end event

