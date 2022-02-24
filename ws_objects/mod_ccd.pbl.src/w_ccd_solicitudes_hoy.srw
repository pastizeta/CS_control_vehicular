$PBExportHeader$w_ccd_solicitudes_hoy.srw
forward
global type w_ccd_solicitudes_hoy from window
end type
type dw_vencidas from datawindow within w_ccd_solicitudes_hoy
end type
type dw_solicitudes from datawindow within w_ccd_solicitudes_hoy
end type
type dw_presolicitudes from datawindow within w_ccd_solicitudes_hoy
end type
type gb_1 from groupbox within w_ccd_solicitudes_hoy
end type
type gb_3 from groupbox within w_ccd_solicitudes_hoy
end type
type gb_2 from groupbox within w_ccd_solicitudes_hoy
end type
end forward

global type w_ccd_solicitudes_hoy from window
integer width = 2743
integer height = 2515
boolean titlebar = true
string title = "Solicitudes y Presolicitudes de materiales"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_vencidas dw_vencidas
dw_solicitudes dw_solicitudes
dw_presolicitudes dw_presolicitudes
gb_1 gb_1
gb_3 gb_3
gb_2 gb_2
end type
global w_ccd_solicitudes_hoy w_ccd_solicitudes_hoy

type variables
long il_folio=0, il_folio_presol
integer vencido=0

str_sol_material istr_sol_material, pstr_sol_material




end variables

forward prototypes
public subroutine uf_renovar (long p_folio, long p_folio_presol)
end prototypes

public subroutine uf_renovar (long p_folio, long p_folio_presol);long ll_folio_nuevo=0, ll_folio_presol_nuevo=0
datetime ldt_fecha_hoy, ldt_fecha_inicio, ldt_fecha_final
string is_solicitantenivel=''

ldt_fecha_hoy= DateTime(today(),now())
ldt_fecha_inicio=Datetime(f_calcula_fecha_habil(today(),0,gi_depto,gi_area),Time('08:00:00'))
ldt_fecha_final=Datetime(f_calcula_fecha_habil(today(),3,gi_depto,gi_area),Time('20:00:00'))

if pstr_sol_material.tipo_usuario=1 then is_solicitantenivel=f_select_alumno_nivel(pstr_sol_material.solicitanteid)
if is_solicitantenivel = 'P' then ldt_fecha_final=Datetime(f_calcula_fecha_habil(today(),5,gi_depto,gi_area),Time('20:00:00'))


//Folio
select isNull(max(folio),0) + 1
into :ll_folio_nuevo
from dbo.spre_solicitud
where cvedepto =:pstr_sol_material.cvedepto
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener Máximo Folio de Renovación", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return
end if

//Insertar Solicitante
insert into dbo.spre_prestamo_material
(cvedepto, folio, tipo_prestamo, solicitanteid, solicitantenombre,
solicitantetel, solicitantegrupo, solicitanteprofesor, fechacarga, usuario)

select cvedepto, :ll_folio_nuevo, tipo_prestamo, solicitanteid, solicitantenombre,
solicitantetel, solicitantegrupo, solicitanteprofesor, :ldt_fecha_hoy, usuario
from dbo.spre_prestamo_material
where cvedepto =:pstr_sol_material.cvedepto and folio =:p_folio
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Insertar solicitante de Renovación", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return
end if

//Insertar Solicitud
insert into dbo.spre_solicitud
(cvedepto, folio, solicitanteid, status, cveperiodo, condicion, fecha_solicitud, fecha_inicio, 
fecha_fin, tipo_solicitud)

select cvedepto, :ll_folio_nuevo, solicitanteid, 0, cveperiodo, condicion, :ldt_fecha_hoy, :ldt_fecha_inicio, 
:ldt_fecha_final, tipo_solicitud
from dbo.spre_solicitud
where cvedepto =:pstr_sol_material.cvedepto and folio =:p_folio
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Insertar solicitud de Renovación", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return
end if

//Insertar Materiales
insert into dbo.spre_sol_materiales
(cvedepto, folio, consecutivo, cvearea, cvematerial, cvegrupo, num_serie,
status, fecha_inicio, fecha_final, costo_mat)

select cvedepto, :ll_folio_nuevo, consecutivo, cvearea, cvematerial, cvegrupo, num_serie,
status, :ldt_fecha_inicio, :ldt_fecha_final, costo_mat
from dbo.spre_sol_materiales
where cvedepto =:pstr_sol_material.cvedepto and folio =:p_folio and status=0
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Insertar materiales de Renovación", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return
end if


//Folio Presolicitud
select isNull(max(folio),0) + 1
into :ll_folio_presol_nuevo
from dbo.spre_pre_solicitud
where cvedepto =:pstr_sol_material.cvedepto
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener Máximo Folio de Presolicitud Renovación", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return
end if

//Insertar PreSolicitud
insert into dbo.spre_pre_solicitud
(cvedepto, folio, solicitanteid, status, cveperiodo, fecha_solicitud, fecha_inicio,
fecha_fin, tipo_solicitud, tipo_prestamo, solicitantenombre, autorizada, cvearea, 
usuario_autoriza, fecha_autorizacion, folio_prestamo, folio_origen)

select cvedepto, :ll_folio_presol_nuevo, solicitanteid, 1, cveperiodo, :ldt_fecha_hoy, :ldt_fecha_inicio,
:ldt_fecha_final, tipo_solicitud, tipo_prestamo, solicitantenombre, autorizada, cvearea, 
usuario_autoriza, :ldt_fecha_hoy, :ll_folio_nuevo, :p_folio
from dbo.spre_pre_solicitud
where cvedepto =:pstr_sol_material.cvedepto and folio =:p_folio_presol
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Insertar prseolicitud de Renovación", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return
end if

//Insertar PreSolicitud Materiales
insert into dbo.spre_pre_sol_materiales
(cvedepto, folio, consecutivo, cvearea, cvematerial, cvegrupo, 
num_serie, status, fecha_inicio, fecha_final, costo_mat)

select cvedepto, :ll_folio_presol_nuevo, consecutivo, cvearea, cvematerial, cvegrupo, 
num_serie, 1, :ldt_fecha_inicio, :ldt_fecha_final, costo_mat
from dbo.spre_sol_materiales
where cvedepto =:pstr_sol_material.cvedepto and folio =:p_folio and status=0
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Insertar presolicitud de Renovación", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return
end if

//Cerrar Solicitud
update dbo.spre_solicitud
set status=1
where cvedepto=:gi_depto
and folio=:p_folio	
using gtr_sumuia;

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: cerrar la solicitud", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return
end if

//Cerrar Solicitud Materiales
update dbo.spre_sol_materiales
set status=1,
fecha_entrega=:ldt_fecha_hoy
where cvedepto=:gi_depto
and folio=:p_folio
and status=0
using gtr_sumuia;

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: cerrar la solicitud materiales", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return
end if

commit using gtr_sumuia;

messagebox('Aviso','Solicitud renovada exitosamente con el folio '+string(ll_folio_nuevo))
end subroutine

on w_ccd_solicitudes_hoy.create
this.dw_vencidas=create dw_vencidas
this.dw_solicitudes=create dw_solicitudes
this.dw_presolicitudes=create dw_presolicitudes
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.Control[]={this.dw_vencidas,&
this.dw_solicitudes,&
this.dw_presolicitudes,&
this.gb_1,&
this.gb_3,&
this.gb_2}
end on

on w_ccd_solicitudes_hoy.destroy
destroy(this.dw_vencidas)
destroy(this.dw_solicitudes)
destroy(this.dw_presolicitudes)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_2)
end on

event open;integer li_carga=0, li_i
string ls_find

pstr_sol_material = message.powerobjectparm

dw_presolicitudes.setTransObject(gtr_sumuia)
dw_solicitudes.setTransObject(gtr_sumuia)
dw_vencidas.setTransObject(gtr_sumuia)

if dw_presolicitudes.Retrieve(pstr_sol_material.cvedepto,pstr_sol_material.cvearea,pstr_sol_material.tipo_usuario,pstr_sol_material.solicitanteid) > 0 then li_carga=1 
if dw_solicitudes.Retrieve(pstr_sol_material.cvedepto,pstr_sol_material.cvearea,pstr_sol_material.tipo_usuario,pstr_sol_material.solicitanteid) > 0 then li_carga=1 
if dw_vencidas.Retrieve(pstr_sol_material.cvedepto,pstr_sol_material.cvearea,pstr_sol_material.tipo_usuario,pstr_sol_material.solicitanteid) > 0 then li_carga=1 

istr_sol_material.folio_presol=0
istr_sol_material.folio_solicitud=0
istr_sol_material.multa=0
istr_sol_material.status=0

if li_carga = 0 then
	close(this)
else

	if dw_vencidas.RowCount()>0 then
		ls_find="spre_solicitud_status=3"
		if dw_vencidas.Find(ls_find,1,dw_vencidas.RowCount())>0 then istr_sol_material.multa=1
	end if

end if 


end event

event close;CloseWithReturn(w_ccd_solicitudes_hoy,istr_sol_material)



end event

type dw_vencidas from datawindow within w_ccd_solicitudes_hoy
integer x = 77
integer y = 1722
integer width = 2538
integer height = 621
integer taborder = 30
string title = "none"
string dataobject = "d_psi_solicitudes_vencidas_hoy"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;
if row>0 then
	istr_sol_material.folio_presol=this.GetItemNumber(row,'spre_pre_solicitud_folio_presol')
	istr_sol_material.folio_solicitud=this.GetItemNumber(row,'spre_solicitud_folio')
	istr_sol_material.status=this.GetItemNumber(row,'spre_solicitud_status')
	close(parent)
end if

end event

type dw_solicitudes from datawindow within w_ccd_solicitudes_hoy
integer x = 77
integer y = 941
integer width = 2538
integer height = 621
integer taborder = 20
boolean titlebar = true
string title = "none"
string dataobject = "d_psi_solicitudes_abiertas_hoy"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row>0 then
	istr_sol_material.folio_presol=this.GetItemNumber(row,'folio_presol')
	istr_sol_material.folio_solicitud=this.GetItemNumber(row,'folio')
	istr_sol_material.status=1
	close(parent)
end if

end event

type dw_presolicitudes from datawindow within w_ccd_solicitudes_hoy
integer x = 77
integer y = 147
integer width = 2538
integer height = 621
integer taborder = 10
string title = "none"
string dataobject = "d_psi_presolicitudes_hoy"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;
if row>0 then
	if this.GetItemNumber(row,'autorizada')=0 then 
		messagebox('Aviso','Esta PreSolicitud debe ser aprobada primero.')
	else
		istr_sol_material.folio_presol=this.GetItemNumber(row,'spre_pre_solicitud_folio')
		istr_sol_material.folio_solicitud=0
		close(parent)
	end if
end if

end event

type gb_1 from groupbox within w_ccd_solicitudes_hoy
integer x = 37
integer y = 61
integer width = 2651
integer height = 768
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "PreSolicitudes"
end type

type gb_3 from groupbox within w_ccd_solicitudes_hoy
integer x = 37
integer y = 1632
integer width = 2651
integer height = 768
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Solicitudes Vencidas"
end type

type gb_2 from groupbox within w_ccd_solicitudes_hoy
integer x = 37
integer y = 845
integer width = 2651
integer height = 768
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Solicitudes Vigentes"
end type

