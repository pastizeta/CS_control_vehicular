$PBExportHeader$w_gen_pre_solicitud_fechas.srw
$PBExportComments$Muestra las presolicitudes capturadas para el alumno-profesor del departamento en cuestion
forward
global type w_gen_pre_solicitud_fechas from w_sheet
end type
type dw_mat_cursos from u_dw within w_gen_pre_solicitud_fechas
end type
end forward

global type w_gen_pre_solicitud_fechas from w_sheet
integer x = 214
integer width = 2297
integer height = 1075
string title = "Presolicitudes pendientes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 29534863
dw_mat_cursos dw_mat_cursos
end type
global w_gen_pre_solicitud_fechas w_gen_pre_solicitud_fechas

type variables
str_pres_control regreso
boolean ib_selecciona
//integer li_tipo
long sl_linea
end variables

on w_gen_pre_solicitud_fechas.create
int iCurrent
call super::create
this.dw_mat_cursos=create dw_mat_cursos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_mat_cursos
end on

on w_gen_pre_solicitud_fechas.destroy
call super::destroy
destroy(this.dw_mat_cursos)
end on

event open;call super::open;integer li_row
regreso = message.powerobjectparm

dw_mat_cursos.setTransObject(gtr_sumuia)

if regreso.tipo_espacio=0 then 
	dw_mat_cursos.dataobject= "d_gen_pre_solicitudes"
	dw_mat_cursos.setTransObject(gtr_sumuia)
	li_row=dw_mat_cursos.Retrieve(regreso.cvedepto,regreso.cvearea, regreso.solicitanteid,String(Date(regreso.fecha_inicio), "yyyymmdd"))
else
	dw_mat_cursos.dataobject= "d_gen_pre_solicitudes_fecha"
	dw_mat_cursos.setTransObject(gtr_sumuia)
	li_row=dw_mat_cursos.Retrieve(regreso.cvedepto,regreso.cvearea, regreso.solicitanteid, regreso.fecha_inicio, regreso.fecha_final)
end if

if  li_row= 0 then
	ib_selecciona  = false
	close( this)
end if 


end event

event close;call super::close;if ib_selecciona then	
	CloseWithReturn(this,regreso)
end if
end event

type dw_mat_cursos from u_dw within w_gen_pre_solicitud_fechas
integer x = 69
integer y = 74
integer width = 2154
integer height = 848
integer taborder = 10
string dataobject = "d_gen_pre_solicitudes_fecha"
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

event doubleclicked;call super::doubleclicked;long li_autorizada

if row>0 then
	li_autorizada = This.getitemnumber( row, "autorizada")

	If li_autorizada = 1 Then
		ib_selecciona = true
		regreso.folio_presol= this.GetItemNumber(row,'folio')	
		close(parent)
	Else
		MessageBox("Mensaje", "No se puede cargar una presolicitud que no ha sido autorizada...")
	End If
end if
end event

