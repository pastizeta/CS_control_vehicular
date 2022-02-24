$PBExportHeader$w_comn_mat_insc.srw
forward
global type w_comn_mat_insc from w_gen_mat_insc
end type
end forward

global type w_comn_mat_insc from w_gen_mat_insc
end type
global w_comn_mat_insc w_comn_mat_insc

on w_comn_mat_insc.create
call super::create
end on

on w_comn_mat_insc.destroy
call super::destroy
end on

event open;call super::open;//long ll_cuentaProf
//regreso = message.powerobjectparm
//li_tipo = regreso.ii_parm1 
//ll_cuentaProf = regreso.il_parm1
//
//	choose case li_tipo
//		case 1
//			dw_mat_cursos.dataobject= "d_com_materias_insc"
//			dw_mat_cursos.setTransObject(gtr_sumuia)
////			dw_mat_cursos.Retrieve(ll_cuentaProf)
//			if dw_mat_cursos.Retrieve(ll_cuentaProf) = 0 then
//				messagebox("Atención","El alumno con cuenta "+ string(ll_cuentaProf) +" ~n no tiene materias inscritas del área de Comunicación")
//				ib_selecciona  = false
//				close( this)
//			end if 
//			
//		case 3
//			dw_mat_cursos.dataobject= "d_com_materias_insc_p"
//			dw_mat_cursos.setTransObject(gtr_sumuia)
////			dw_mat_cursos.Retrieve(ll_cuentaProf)			
//			if dw_mat_cursos.Retrieve(ll_cuentaProf) = 0 then
//				messagebox("Atención","El profesor con clave "+ string(ll_cuentaProf) +" ~n no imparte materias del área de Comunicación")
//				ib_selecciona = false
//				close( this)
//			end if 
//	end choose
//		
end event

event close;if ib_selecciona then	
	CloseWithReturn(w_comn_mat_insc,regreso)
end if
end event

type st_1 from w_gen_mat_insc`st_1 within w_comn_mat_insc
end type

type dw_mat_cursos from w_gen_mat_insc`dw_mat_cursos within w_comn_mat_insc
string dataobject = "d_com_materias_insc_p"
end type

