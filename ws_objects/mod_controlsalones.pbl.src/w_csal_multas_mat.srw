$PBExportHeader$w_csal_multas_mat.srw
$PBExportComments$Permite cargar el pago de  las multas del material
forward
global type w_csal_multas_mat from w_gen_multas_mat
end type
end forward

global type w_csal_multas_mat from w_gen_multas_mat
end type
global w_csal_multas_mat w_csal_multas_mat

on w_csal_multas_mat.create
call super::create
end on

on w_csal_multas_mat.destroy
call super::destroy
end on

event open;call super::open;st_5.text = 'Control de Salones'
st_5.visible = True



This.title = ' Multas material (Sistema de Control de Salones)'
end event

type st_5 from w_gen_multas_mat`st_5 within w_csal_multas_mat
integer x = 2505
integer width = 494
string text = "Control de Salones"
end type

type cbx_intercambio from w_gen_multas_mat`cbx_intercambio within w_csal_multas_mat
end type

type st_4 from w_gen_multas_mat`st_4 within w_csal_multas_mat
end type

type st_3 from w_gen_multas_mat`st_3 within w_csal_multas_mat
end type

type st_2 from w_gen_multas_mat`st_2 within w_csal_multas_mat
end type

type st_1 from w_gen_multas_mat`st_1 within w_csal_multas_mat
end type

type em_operacion from w_gen_multas_mat`em_operacion within w_csal_multas_mat
end type

type em_corte from w_gen_multas_mat`em_corte within w_csal_multas_mat
end type

type em_caja from w_gen_multas_mat`em_caja within w_csal_multas_mat
end type

type dw_solicitud from w_gen_multas_mat`dw_solicitud within w_csal_multas_mat
end type

type sle_cuenta from w_gen_multas_mat`sle_cuenta within w_csal_multas_mat
end type

type rb_2 from w_gen_multas_mat`rb_2 within w_csal_multas_mat
end type

type rb_1 from w_gen_multas_mat`rb_1 within w_csal_multas_mat
end type

type cb_cerrar from w_gen_multas_mat`cb_cerrar within w_csal_multas_mat
end type

type cb_actualiza from w_gen_multas_mat`cb_actualiza within w_csal_multas_mat
end type

event cb_actualiza::clicked;date ldFechaEntrega
integer liDiasRestraso, liCaja, liCorte, liOper
long llMaxFolio, llRow, llEstatus, llFolio, llFolioDat
string lsUpdate, lsTUpdate, lsCveMaterial, lsNoSerie

if dw_solicitud.update(true,false)< 0 then
	messagebox("ERROR del sistema","Los registros NO se actualizaron ",stopsign!)
	return
end if

for llRow = 1 to dw_solicitud.RowCount()
	llEstatus = dw_solicitud.getitemnumber(llRow,'saldo0')
	choose case llEstatus
		case 1
			llFolio = dw_solicitud.getitemnumber(llRow,'spre_multas_folio_multa')
			llFolioDat = dw_solicitud.getitemnumber(llRow,'spre_multas_folio')
			
			UPDATE dbo.spre_materiales_multas  
			SET status = 1  
			WHERE ( dbo.spre_materiales_multas.cvedepto = :gi_depto ) AND  
				( dbo.spre_materiales_multas.cvearea = :gi_area ) AND  
				( dbo.spre_materiales_multas.folio_multa = :llFolio )
			using gtr_sumuia;	
			if gtr_sumuia.sqlcode < 0 then
				rollback using gtr_sumuia;
				messagebox("ERROR del sistema","Los registros NO se actualizaron",stopsign!)
				return
			end if
			
			//		Actualizamos estatus de solicitud
			UPDATE dbo.spre_sol_materiales  
			SET status = 1  
			WHERE ( dbo.spre_sol_materiales.cvedepto = :gi_depto ) AND  
				( dbo.spre_sol_materiales.cvearea = :gi_area ) AND  
				( dbo.spre_sol_materiales.folio = :llFolioDat )
			using gtr_sumuia;	
			if gtr_sumuia.sqlcode < 0 then
				rollback using gtr_sumuia;
				messagebox("ERROR del sistema","Los registros NO se actualizaron",stopsign!)
				return
			end if

			
			UPDATE dbo.spre_solicitud  
			SET status = 1
			WHERE ( dbo.spre_solicitud.folio = :llFolioDat ) AND
					( dbo.spre_solicitud.cvedepto = :gi_depto)
			using gtr_sumuia;	
			if gtr_sumuia.sqlcode < 0 then
				rollback using gtr_sumuia;
				messagebox("ERROR del sistema","Los registros NO se actualizaron",stopsign!)
				return
			end if
			//		estatus de solicitudes
			
	end choose
next
commit using gtr_sumuia;
dw_solicitud.ResetUpdate()
messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito",exclamation!)
wf_limpia_forma()
end event

type dw_interesado from w_gen_multas_mat`dw_interesado within w_csal_multas_mat
end type

type gb_1 from w_gen_multas_mat`gb_1 within w_csal_multas_mat
end type

type gb_2 from w_gen_multas_mat`gb_2 within w_csal_multas_mat
end type

