$PBExportHeader$w_gen_detalle_presolici.srw
$PBExportComments$Muestra las materias inscritas por el alumno y el profesor asignado a la misma, solo concidera las materias del departamento en cuestión
forward
global type w_gen_detalle_presolici from w_sheet
end type
type cb_cerrar from commandbutton within w_gen_detalle_presolici
end type
type dw_reporte from u_dw within w_gen_detalle_presolici
end type
end forward

global type w_gen_detalle_presolici from w_sheet
integer width = 4229
integer height = 2308
string title = "Materias inscritas"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 29534863
cb_cerrar cb_cerrar
dw_reporte dw_reporte
end type
global w_gen_detalle_presolici w_gen_detalle_presolici

type variables
n_transportar regreso
boolean ib_selecciona
integer li_tipo
long sl_linea
end variables

on w_gen_detalle_presolici.create
int iCurrent
call super::create
this.cb_cerrar=create cb_cerrar
this.dw_reporte=create dw_reporte
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cerrar
this.Control[iCurrent+2]=this.dw_reporte
end on

on w_gen_detalle_presolici.destroy
call super::destroy
destroy(this.cb_cerrar)
destroy(this.dw_reporte)
end on

event open;call super::open;integer li_folio
regreso = message.powerobjectparm
//li_tipo = regreso.ii_parm1 
li_folio = regreso.ii_parm1

dw_reporte.setTransObject(gtr_sumuia)
dw_reporte.retrieve(gi_depto, li_folio)


//	choose case li_tipo
//		case 1
//			dw_mat_cursos.dataobject= "d_com_materias_insc"
//			dw_mat_cursos.setTransObject(gtr_sumuia)
////			dw_mat_cursos.Retrieve(ll_cuentaProf)
//			if dw_mat_cursos.Retrieve(ll_cuentaProf) = 0 then
//				messagebox("Atención","El alumno con cuenta "+ string(ll_cuentaProf) +" ~n no tiene materias inscritas del área correspondiente")
//				ib_selecciona  = false
//				close( this)
//			end if 
//			
//		case 2
//			dw_mat_cursos.dataobject= "d_com_materias_insc_p"
//			dw_mat_cursos.setTransObject(gtr_sumuia)
////			dw_mat_cursos.Retrieve(ll_cuentaProf)			
//			if dw_mat_cursos.Retrieve(ll_cuentaProf) = 0 then
//				messagebox("Atención","El profesor con clave "+ string(ll_cuentaProf) +" ~n no imparte materias del área correspondiente")
//				ib_selecciona = false
//				close( this)
//			end if 
//	end choose
//		
end event

event close;call super::close;if ib_selecciona then	
	CloseWithReturn(w_gen_mat_insc,regreso)
end if
end event

type cb_cerrar from commandbutton within w_gen_detalle_presolici
integer x = 69
integer y = 2088
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;Close(Parent)
end event

type dw_reporte from u_dw within w_gen_detalle_presolici
integer x = 69
integer y = 72
integer width = 3465
integer height = 1964
integer taborder = 10
string dataobject = "d_gen_q_detalle_presolicitud"
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

event doubleclicked;call super::doubleclicked;//ib_selecciona = true
//	choose case li_tipo
//		case 1
//			regreso.is_parm2 = this.GetItemString(row,'v_sce_materias_materia')
//			regreso.is_parm3= this.GetItemString(row,'v_sce_profesor_nombre')		
//			
//		case 2
//			regreso.is_parm2 = this.GetItemString(row,'v_sce_materias_materia')
//			
//	end choose
//	close(parent)

end event

