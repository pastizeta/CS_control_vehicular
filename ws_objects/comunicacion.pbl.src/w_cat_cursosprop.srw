$PBExportHeader$w_cat_cursosprop.srw
forward
global type w_cat_cursosprop from w_modelo_cap
end type
type dw_cursos from datawindow within w_cat_cursosprop
end type
end forward

global type w_cat_cursosprop from w_modelo_cap
dw_cursos dw_cursos
end type
global w_cat_cursosprop w_cat_cursosprop

on w_cat_cursosprop.create
int iCurrent
call super::create
this.dw_cursos=create dw_cursos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cursos
end on

on w_cat_cursosprop.destroy
call super::destroy
destroy(this.dw_cursos)
end on

event open;call super::open;dw_cursos.retrieve()
end event

type dw_motivo from w_modelo_cap`dw_motivo within w_cat_cursosprop
integer x = 2295
integer y = 580
end type

type cb_actualiza from w_modelo_cap`cb_actualiza within w_cat_cursosprop
integer x = 2665
integer y = 1364
end type

type cb_cerrar from w_modelo_cap`cb_cerrar within w_cat_cursosprop
integer x = 3067
integer y = 1364
end type

type cb_eliminar from w_modelo_cap`cb_eliminar within w_cat_cursosprop
integer x = 2263
integer y = 1364
end type

type cb_nuevo from w_modelo_cap`cb_nuevo within w_cat_cursosprop
integer x = 1861
integer y = 1364
end type

type dw_cap from w_modelo_cap`dw_cap within w_cat_cursosprop
integer x = 1783
integer y = 92
integer width = 1723
integer height = 1232
string dataobject = "d_cat_detalle_cursoprop"
end type

event dw_cap::itemchanged;call super::itemchanged;integer liCurso,i, liCur, liCurso1
long llCuenta, llCta


for i = 1 to 1 
	liCurso1  = this.GetItemNumber (i,'id_curso')
next

for i = 1 to dw_cap.rowcount() 
	this.object.id_curso[row] = liCurso1
	llCuenta = this.GetItemNumber (row,'solicitanteid')
//	liCurso  = this.GetItemNumber (row,'id_curso')
next

SELECT solicitanteid,id_curso 
INTO: llCta, :liCur
FROM spre_histcursoprop
WHERE solicitanteid = :llCuenta AND
		id_curso = :liCurso1
using gtr_sumuia;

	
IF llCta > 0  THEN
	Messagebox("","El alumno con cuenta: " + string(llCuenta) + " ya fue dado de alta para el curso  " + string(liCurso))

END IF

end event

type dw_cursos from datawindow within w_cat_cursosprop
integer x = 197
integer y = 96
integer width = 1477
integer height = 680
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_com_cursos_prope"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SettransObject(gtr_sumuia)
end event

event doubleclicked;integer liCurso
//
liCurso  = this.GetItemNumber (row,'id_curso')


dw_cap.retrieve(liCurso)
											
end event

