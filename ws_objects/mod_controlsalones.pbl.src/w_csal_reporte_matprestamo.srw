$PBExportHeader$w_csal_reporte_matprestamo.srw
forward
global type w_csal_reporte_matprestamo from w_gen_reporte_matprestamo
end type
end forward

global type w_csal_reporte_matprestamo from w_gen_reporte_matprestamo
integer x = 214
integer y = 221
end type
global w_csal_reporte_matprestamo w_csal_reporte_matprestamo

on w_csal_reporte_matprestamo.create
call super::create
end on

on w_csal_reporte_matprestamo.destroy
call super::destroy
end on

type st_5 from w_gen_reporte_matprestamo`st_5 within w_csal_reporte_matprestamo
end type

type st_4 from w_gen_reporte_matprestamo`st_4 within w_csal_reporte_matprestamo
end type

type st_3 from w_gen_reporte_matprestamo`st_3 within w_csal_reporte_matprestamo
end type

type em_dos from w_gen_reporte_matprestamo`em_dos within w_csal_reporte_matprestamo
end type

type em_uno from w_gen_reporte_matprestamo`em_uno within w_csal_reporte_matprestamo
end type

type cbx_dosperiodos from w_gen_reporte_matprestamo`cbx_dosperiodos within w_csal_reporte_matprestamo
end type

type st_2 from w_gen_reporte_matprestamo`st_2 within w_csal_reporte_matprestamo
end type

type cb_4 from w_gen_reporte_matprestamo`cb_4 within w_csal_reporte_matprestamo
end type

type em_clave from w_gen_reporte_matprestamo`em_clave within w_csal_reporte_matprestamo
end type

type em_inter from w_gen_reporte_matprestamo`em_inter within w_csal_reporte_matprestamo
end type

type cbx_clave from w_gen_reporte_matprestamo`cbx_clave within w_csal_reporte_matprestamo
end type

event cbx_clave::clicked;call super::clicked;if this.checked then
	dw_reporte.dataobject = "d_csal_rep_materialcta"
	dw_reporte.SettransObject(gtr_sumuia)
End If
end event

type cbx_inter from w_gen_reporte_matprestamo`cbx_inter within w_csal_reporte_matprestamo
end type

event cbx_inter::clicked;call super::clicked;if this.checked then
	dw_reporte.dataobject = "d_csal_rep_materialcta"
	dw_reporte.SettransObject(gtr_sumuia)
End If
end event

type cb_3 from w_gen_reporte_matprestamo`cb_3 within w_csal_reporte_matprestamo
end type

type dw_depto from w_gen_reporte_matprestamo`dw_depto within w_csal_reporte_matprestamo
end type

type cb_2 from w_gen_reporte_matprestamo`cb_2 within w_csal_reporte_matprestamo
end type

type cbx_bus from w_gen_reporte_matprestamo`cbx_bus within w_csal_reporte_matprestamo
end type

type dw_busqueda from w_gen_reporte_matprestamo`dw_busqueda within w_csal_reporte_matprestamo
end type

type dw_fecha from w_gen_reporte_matprestamo`dw_fecha within w_csal_reporte_matprestamo
end type

type dw_reporte from w_gen_reporte_matprestamo`dw_reporte within w_csal_reporte_matprestamo
string dataobject = "d_csal_rep_materialcta"
end type

type cb_1 from w_gen_reporte_matprestamo`cb_1 within w_csal_reporte_matprestamo
end type

type cbx_material from w_gen_reporte_matprestamo`cbx_material within w_csal_reporte_matprestamo
end type

event cbx_material::clicked;call super::clicked;If This.checked Then
	dw_reporte.dataobject = "d_csal_rep_materialdesc"
	dw_reporte.SettransObject(gtr_sumuia)
End If
end event

type st_1 from w_gen_reporte_matprestamo`st_1 within w_csal_reporte_matprestamo
end type

type em_fecha_fin from w_gen_reporte_matprestamo`em_fecha_fin within w_csal_reporte_matprestamo
end type

type cbx_fecha from w_gen_reporte_matprestamo`cbx_fecha within w_csal_reporte_matprestamo
end type

event cbx_fecha::clicked;call super::clicked;If This.checked Then
	dw_reporte.dataobject = "d_csal_rep_materialfecha_dos"
	dw_reporte.SettransObject(gtr_sumuia)
End If
end event

type cbx_cuenta from w_gen_reporte_matprestamo`cbx_cuenta within w_csal_reporte_matprestamo
end type

event cbx_cuenta::clicked;call super::clicked;if this.checked then
	dw_reporte.dataobject = "d_csal_rep_materialcta"
	dw_reporte.SettransObject(gtr_sumuia)
End If
end event

type dw_desc from w_gen_reporte_matprestamo`dw_desc within w_csal_reporte_matprestamo
end type

type em_cuenta from w_gen_reporte_matprestamo`em_cuenta within w_csal_reporte_matprestamo
end type

type gb_1 from w_gen_reporte_matprestamo`gb_1 within w_csal_reporte_matprestamo
end type

type gb_2 from w_gen_reporte_matprestamo`gb_2 within w_csal_reporte_matprestamo
end type

type gb_3 from w_gen_reporte_matprestamo`gb_3 within w_csal_reporte_matprestamo
end type

type gb_5 from w_gen_reporte_matprestamo`gb_5 within w_csal_reporte_matprestamo
end type

