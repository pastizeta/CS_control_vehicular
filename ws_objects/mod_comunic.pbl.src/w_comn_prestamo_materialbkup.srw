﻿$PBExportHeader$w_comn_prestamo_materialbkup.srw
forward
global type w_comn_prestamo_materialbkup from w_gen_prestamo_material
end type
end forward

global type w_comn_prestamo_materialbkup from w_gen_prestamo_material
end type
global w_comn_prestamo_materialbkup w_comn_prestamo_materialbkup

on w_comn_prestamo_materialbkup.create
call super::create
end on

on w_comn_prestamo_materialbkup.destroy
call super::destroy
end on

type ole_1 from w_gen_prestamo_material`ole_1 within w_comn_prestamo_materialbkup
end type

type dw_tipo_usuario from w_gen_prestamo_material`dw_tipo_usuario within w_comn_prestamo_materialbkup
end type

type st_cod_uia from w_gen_prestamo_material`st_cod_uia within w_comn_prestamo_materialbkup
end type

type dw_reporte_mat from w_gen_prestamo_material`dw_reporte_mat within w_comn_prestamo_materialbkup
end type

type sle_cod_uia from w_gen_prestamo_material`sle_cod_uia within w_comn_prestamo_materialbkup
end type

type cbx_todos from w_gen_prestamo_material`cbx_todos within w_comn_prestamo_materialbkup
end type

type dw_matgrupo from w_gen_prestamo_material`dw_matgrupo within w_comn_prestamo_materialbkup
end type

type dw_grupomat from w_gen_prestamo_material`dw_grupomat within w_comn_prestamo_materialbkup
end type

type st_1 from w_gen_prestamo_material`st_1 within w_comn_prestamo_materialbkup
end type

type cb_salir from w_gen_prestamo_material`cb_salir within w_comn_prestamo_materialbkup
end type

type dw_solicitados from w_gen_prestamo_material`dw_solicitados within w_comn_prestamo_materialbkup
end type

type cb_generar from w_gen_prestamo_material`cb_generar within w_comn_prestamo_materialbkup
end type

type cb_eliminar from w_gen_prestamo_material`cb_eliminar within w_comn_prestamo_materialbkup
end type

type dw_disponible from w_gen_prestamo_material`dw_disponible within w_comn_prestamo_materialbkup
end type

type cb_buscar from w_gen_prestamo_material`cb_buscar within w_comn_prestamo_materialbkup
end type

type st_5 from w_gen_prestamo_material`st_5 within w_comn_prestamo_materialbkup
end type

type st_4 from w_gen_prestamo_material`st_4 within w_comn_prestamo_materialbkup
end type

type st_3 from w_gen_prestamo_material`st_3 within w_comn_prestamo_materialbkup
end type

type st_2 from w_gen_prestamo_material`st_2 within w_comn_prestamo_materialbkup
end type

type em_hora_final from w_gen_prestamo_material`em_hora_final within w_comn_prestamo_materialbkup
end type

type em_fecha_final from w_gen_prestamo_material`em_fecha_final within w_comn_prestamo_materialbkup
end type

type st_final from w_gen_prestamo_material`st_final within w_comn_prestamo_materialbkup
end type

type em_hora_inicio from w_gen_prestamo_material`em_hora_inicio within w_comn_prestamo_materialbkup
end type

type em_fecha_inicio from w_gen_prestamo_material`em_fecha_inicio within w_comn_prestamo_materialbkup
end type

type st_inicio from w_gen_prestamo_material`st_inicio within w_comn_prestamo_materialbkup
end type

type dw_solicitante from w_gen_prestamo_material`dw_solicitante within w_comn_prestamo_materialbkup
end type

type cb_materias from w_gen_prestamo_material`cb_materias within w_comn_prestamo_materialbkup
end type

type dw_foto from w_gen_prestamo_material`dw_foto within w_comn_prestamo_materialbkup
end type

type st_cuenta from w_gen_prestamo_material`st_cuenta within w_comn_prestamo_materialbkup
end type

type sle_solicitante from w_gen_prestamo_material`sle_solicitante within w_comn_prestamo_materialbkup
end type

type gb_busqueda from w_gen_prestamo_material`gb_busqueda within w_comn_prestamo_materialbkup
end type

type gb_solicitante from w_gen_prestamo_material`gb_solicitante within w_comn_prestamo_materialbkup
end type

type gb_solicitud from w_gen_prestamo_material`gb_solicitud within w_comn_prestamo_materialbkup
end type

type gb_material from w_gen_prestamo_material`gb_material within w_comn_prestamo_materialbkup
end type

type gb_seleccionado from w_gen_prestamo_material`gb_seleccionado within w_comn_prestamo_materialbkup
end type

type gb_disponible from w_gen_prestamo_material`gb_disponible within w_comn_prestamo_materialbkup
end type

type dw_inventario_disponible from w_gen_prestamo_material`dw_inventario_disponible within w_comn_prestamo_materialbkup
end type

