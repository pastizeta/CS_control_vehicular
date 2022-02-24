$PBExportHeader$w_comn_reportes.srw
forward
global type w_comn_reportes from w_gen_reportes
end type
end forward

global type w_comn_reportes from w_gen_reportes
integer x = 214
integer y = 221
end type
global w_comn_reportes w_comn_reportes

on w_comn_reportes.create
call super::create
end on

on w_comn_reportes.destroy
call super::destroy
end on

event open;call super::open;rb_sol.visible = False
rb_com.visible = False
rb_cor.visible = False
rb_con.visible = False
end event

type rb_con from w_gen_reportes`rb_con within w_comn_reportes
end type

type rb_com from w_gen_reportes`rb_com within w_comn_reportes
end type

type rb_cor from w_gen_reportes`rb_cor within w_comn_reportes
end type

type rb_sol from w_gen_reportes`rb_sol within w_comn_reportes
end type

type cb_1 from w_gen_reportes`cb_1 within w_comn_reportes
end type

type cb_imprimir from w_gen_reportes`cb_imprimir within w_comn_reportes
end type

type cb_generar from w_gen_reportes`cb_generar within w_comn_reportes
end type

event cb_generar::clicked;long 		llfolio
integer	li_resul1, res, liEstatus
datetime ldt_fechaini, ldt_fechafin, ldt_fechahoy
datastore lds_Consultafecha

llfolio = long(em_folio.text)

if cbx_mat.checked then
	
	//		Impresión Solicitud
						
	dw_reporte_mat.dataobject = "d_comn_rep_solicitud_mat_rep"
	
	dw_reporte_mat.SetTransObject(gtr_sumuia)
	dw_reporte_mat.retrieve(llFolio)
														
	lds_Consultafecha =  create datastore 
	lds_Consultafecha.dataobject ='d_com_consulta_sol'
	lds_Consultafecha.settransobject(gtr_sumuia)
	li_resul1 = lds_Consultafecha.retrieve(llFolio)
							
	if li_resul1 >= 1 then
		ldt_fechaini = lds_Consultafecha.getitemdatetime(1,'fecha_inicio')
		ldt_fechafin = lds_Consultafecha.getitemdatetime(1,'fecha_fin')
		ldt_fechahoy = lds_Consultafecha.getitemdatetime(1,'fecha_hoy')
		liEstatus    = lds_Consultafecha.getitemnumber(1,'status')
										
		if liEstatus = 0 then						
			dw_reporte_mat.object.t_tipo_solicitud.text = "Prestamo Activo"
		elseif liEstatus = 1 then
			dw_reporte_mat.object.t_tipo_solicitud.text = "Entregado"
		elseif liEstatus = 5 then
			dw_reporte_mat.object.t_tipo_solicitud.text = "Reservación"
		else
			dw_reporte_mat.object.t_tipo_solicitud.text = "Prestamo Activo"
		end if
		
		dw_reporte_mat.object.fecha_inicio[1] = string(ldt_fechaini,"dd/mm/yyyy")
		dw_reporte_mat.object.fecha_fin[1] = string(ldt_fechafin,"dd/mm/yyyy")
		dw_reporte_mat.object.h_ini[1] = string(ldt_fechaini)
		dw_reporte_mat.object.h_fin[1] = string(ldt_fechafin)
		dw_reporte_mat.object.fecha_solicitud_act[1] = string(ldt_fechahoy,"dd/mm/yyyy")
	
	else
		Messagebox("Aviso","No existe Solicitud con el número de folio: " + string(llfolio)) 
		em_folio.text = ' '
		cbx_mat.checked = false
		cbx_esp.checked = false
	end if
	
elseif cbx_esp.checked then
	integer li_row
	dw_reporte_mat.dataobject = "d_comn_rep_solicitud_esp" 
	dw_reporte_mat.SetTransObject(gtr_sumuia)
	li_row = dw_reporte_mat.retrieve(llfolio)
	
	if li_row >= 1 then
		liEstatus    = dw_reporte_mat.getitemnumber(1,'status')
		
		if liEstatus = 0 then						
			dw_reporte_mat.object.t_tipo_solicitud.text = "Prestamo Activo"
		elseif liEstatus = 1 then
			dw_reporte_mat.object.t_tipo_solicitud.text = "Entregado"
		elseif liEstatus = 2 then
			dw_reporte_mat.object.t_tipo_solicitud.text = "Cancelación"	
		elseif liEstatus = 5 then
			dw_reporte_mat.object.t_tipo_solicitud.text = "Reservación"
		end if
	end if
end if
end event

type st_1 from w_gen_reportes`st_1 within w_comn_reportes
end type

type em_folio from w_gen_reportes`em_folio within w_comn_reportes
end type

type cbx_esp from w_gen_reportes`cbx_esp within w_comn_reportes
end type

type cbx_mat from w_gen_reportes`cbx_mat within w_comn_reportes
end type

type dw_reporte_mat from w_gen_reportes`dw_reporte_mat within w_comn_reportes
string dataobject = "d_comn_rep_solicitud_mat_rep"
end type

type gb_1 from w_gen_reportes`gb_1 within w_comn_reportes
end type

type gb_tipsol from w_gen_reportes`gb_tipsol within w_comn_reportes
end type

