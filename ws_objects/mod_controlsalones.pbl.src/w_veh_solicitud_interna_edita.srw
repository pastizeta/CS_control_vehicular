$PBExportHeader$w_veh_solicitud_interna_edita.srw
forward
global type w_veh_solicitud_interna_edita from window
end type
type st_version2 from statictext within w_veh_solicitud_interna_edita
end type
type st_version from statictext within w_veh_solicitud_interna_edita
end type
type st_21 from statictext within w_veh_solicitud_interna_edita
end type
type st_esperar from statictext within w_veh_solicitud_interna_edita
end type
type dw_solicitud_unidad_asignada from datawindow within w_veh_solicitud_interna_edita
end type
type dw_motivo_rechazo from datawindow within w_veh_solicitud_interna_edita
end type
type cbx_rechazar_solicitud from checkbox within w_veh_solicitud_interna_edita
end type
type cb_eliminar from commandbutton within w_veh_solicitud_interna_edita
end type
type st_20 from statictext within w_veh_solicitud_interna_edita
end type
type st_19 from statictext within w_veh_solicitud_interna_edita
end type
type st_18 from statictext within w_veh_solicitud_interna_edita
end type
type cb_rechazar from commandbutton within w_veh_solicitud_interna_edita
end type
type cb_agregar_vehiculo from commandbutton within w_veh_solicitud_interna_edita
end type
type dw_choferes_disponibles from u_basedw within w_veh_solicitud_interna_edita
end type
type dw_vehiculos_disponibles from u_basedw within w_veh_solicitud_interna_edita
end type
type dw_vehiculos_solicitados from datawindow within w_veh_solicitud_interna_edita
end type
type cb_buscar from commandbutton within w_veh_solicitud_interna_edita
end type
type st_16 from statictext within w_veh_solicitud_interna_edita
end type
type cb_1 from commandbutton within w_veh_solicitud_interna_edita
end type
type st_9 from statictext within w_veh_solicitud_interna_edita
end type
type dw_paradas from datawindow within w_veh_solicitud_interna_edita
end type
type st_8 from statictext within w_veh_solicitud_interna_edita
end type
type dw_unidades from datawindow within w_veh_solicitud_interna_edita
end type
type cbx_chofer from checkbox within w_veh_solicitud_interna_edita
end type
type sle_telefono_responsable from singlelineedit within w_veh_solicitud_interna_edita
end type
type st_15 from statictext within w_veh_solicitud_interna_edita
end type
type sle_correo_responsable from singlelineedit within w_veh_solicitud_interna_edita
end type
type st_14 from statictext within w_veh_solicitud_interna_edita
end type
type sle_nombre_responsable from singlelineedit within w_veh_solicitud_interna_edita
end type
type st_13 from statictext within w_veh_solicitud_interna_edita
end type
type sle_nombre_solicitante from singlelineedit within w_veh_solicitud_interna_edita
end type
type mle_observaciones from multilineedit within w_veh_solicitud_interna_edita
end type
type st_12 from statictext within w_veh_solicitud_interna_edita
end type
type mle_punto_regreso from multilineedit within w_veh_solicitud_interna_edita
end type
type st_11 from statictext within w_veh_solicitud_interna_edita
end type
type mle_lugar_destino from multilineedit within w_veh_solicitud_interna_edita
end type
type st_3 from statictext within w_veh_solicitud_interna_edita
end type
type em_hora_final from editmask within w_veh_solicitud_interna_edita
end type
type em_hora_inicio from editmask within w_veh_solicitud_interna_edita
end type
type em_fecha_final from editmask within w_veh_solicitud_interna_edita
end type
type st_10 from statictext within w_veh_solicitud_interna_edita
end type
type st_7 from statictext within w_veh_solicitud_interna_edita
end type
type em_fecha_inicio from editmask within w_veh_solicitud_interna_edita
end type
type st_6 from statictext within w_veh_solicitud_interna_edita
end type
type sle_correo_solicitante from singlelineedit within w_veh_solicitud_interna_edita
end type
type st_5 from statictext within w_veh_solicitud_interna_edita
end type
type st_4 from statictext within w_veh_solicitud_interna_edita
end type
type sle_contacto_viaje from singlelineedit within w_veh_solicitud_interna_edita
end type
type sle_usuarios from singlelineedit within w_veh_solicitud_interna_edita
end type
type st_2 from statictext within w_veh_solicitud_interna_edita
end type
type st_1 from statictext within w_veh_solicitud_interna_edita
end type
type mle_punto_origen from multilineedit within w_veh_solicitud_interna_edita
end type
type cb_guardar from commandbutton within w_veh_solicitud_interna_edita
end type
type gb_titulo from groupbox within w_veh_solicitud_interna_edita
end type
type gb_1 from groupbox within w_veh_solicitud_interna_edita
end type
type st_17 from statictext within w_veh_solicitud_interna_edita
end type
type em_hora_devolucion from editmask within w_veh_solicitud_interna_edita
end type
type em_hora_entrega from editmask within w_veh_solicitud_interna_edita
end type
type em_fecha_entrega from editmask within w_veh_solicitud_interna_edita
end type
type em_fecha_devolucion from editmask within w_veh_solicitud_interna_edita
end type
end forward

global type w_veh_solicitud_interna_edita from window
integer width = 7063
integer height = 2952
boolean titlebar = true
string title = "Solicitud interna"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
st_version2 st_version2
st_version st_version
st_21 st_21
st_esperar st_esperar
dw_solicitud_unidad_asignada dw_solicitud_unidad_asignada
dw_motivo_rechazo dw_motivo_rechazo
cbx_rechazar_solicitud cbx_rechazar_solicitud
cb_eliminar cb_eliminar
st_20 st_20
st_19 st_19
st_18 st_18
cb_rechazar cb_rechazar
cb_agregar_vehiculo cb_agregar_vehiculo
dw_choferes_disponibles dw_choferes_disponibles
dw_vehiculos_disponibles dw_vehiculos_disponibles
dw_vehiculos_solicitados dw_vehiculos_solicitados
cb_buscar cb_buscar
st_16 st_16
cb_1 cb_1
st_9 st_9
dw_paradas dw_paradas
st_8 st_8
dw_unidades dw_unidades
cbx_chofer cbx_chofer
sle_telefono_responsable sle_telefono_responsable
st_15 st_15
sle_correo_responsable sle_correo_responsable
st_14 st_14
sle_nombre_responsable sle_nombre_responsable
st_13 st_13
sle_nombre_solicitante sle_nombre_solicitante
mle_observaciones mle_observaciones
st_12 st_12
mle_punto_regreso mle_punto_regreso
st_11 st_11
mle_lugar_destino mle_lugar_destino
st_3 st_3
em_hora_final em_hora_final
em_hora_inicio em_hora_inicio
em_fecha_final em_fecha_final
st_10 st_10
st_7 st_7
em_fecha_inicio em_fecha_inicio
st_6 st_6
sle_correo_solicitante sle_correo_solicitante
st_5 st_5
st_4 st_4
sle_contacto_viaje sle_contacto_viaje
sle_usuarios sle_usuarios
st_2 st_2
st_1 st_1
mle_punto_origen mle_punto_origen
cb_guardar cb_guardar
gb_titulo gb_titulo
gb_1 gb_1
st_17 st_17
em_hora_devolucion em_hora_devolucion
em_hora_entrega em_hora_entrega
em_fecha_entrega em_fecha_entrega
em_fecha_devolucion em_fecha_devolucion
end type
global w_veh_solicitud_interna_edita w_veh_solicitud_interna_edita

type variables
long il_id=0, il_vehiculo=0, il_chofer=0

datastore ids_solicitud
DatawindowChild idwc_vehiculos_disponibles, idwc_choferes_disponibles

end variables

forward prototypes
public function integer uf_verificar_disponibles ()
public subroutine uf_buscar_disponibles ()
public subroutine wf_crea_cuerpo_html (ref string as_cuerpo_html)
public subroutine wf_crea_cuerpo_html_rechazo (ref string as_cuerpo_html)
end prototypes

public function integer uf_verificar_disponibles ();integer li_i, li_disponible=1
long ll_vehiculo, ll_chofer
string ls_find='',ls_vehiculo, ls_chofer
datetime ldt_fecha_entrega, ldt_fecha_devolucion

ldt_fecha_entrega=datetime(date(em_fecha_entrega.text),time(em_hora_entrega.text))
ldt_fecha_devolucion=datetime(date(em_fecha_devolucion.text),time(em_hora_devolucion.text))

//Verificar vehículos
datastore lds_vehiculo
lds_vehiculo =  create datastore
lds_vehiculo.dataobject ='d_veh_cat_vehiculos_disponibles_lista'
lds_vehiculo.settransobject(gtr_cv)
lds_vehiculo.Retrieve(il_id,ldt_fecha_entrega,ldt_fecha_devolucion)

for li_i=1 to dw_vehiculos_solicitados.RowCount()
	ll_vehiculo=dw_vehiculos_solicitados.GetItemNumber(li_i,'id_vehiculo')
	ls_vehiculo=dw_vehiculos_solicitados.GetItemString(li_i,'vehiculo')

	li_disponible=0
	ls_find="id="+string(ll_vehiculo)
	li_disponible=lds_vehiculo.Find(ls_find,1,lds_vehiculo.RowCount())	
	
	if li_disponible=0 then
		//El vehículo ya no está disponible
		messagebox('Aviso','El vehículo '+ls_vehiculo+' no se encuentra disponible')
		return 0
	end if
next

//Verificar choferes
datastore lds_chofer
lds_chofer =  create datastore
lds_chofer.dataobject ='d_veh_cat_choferes_disponibles_lista'
lds_chofer.settransobject(gtr_cv)
lds_chofer.Retrieve(il_id,ldt_fecha_entrega,ldt_fecha_devolucion)


for li_i=1 to dw_vehiculos_solicitados.RowCount()
	ll_chofer=dw_vehiculos_solicitados.GetItemNumber(li_i,'id_chofer')
	ls_chofer=dw_vehiculos_solicitados.GetItemString(li_i,'nombre_chofer')

	if ll_chofer>0 then
		li_disponible=0
		ls_find="id="+string(ll_chofer)
		li_disponible=lds_chofer.Find(ls_find,1,lds_chofer.RowCount())
		
		if li_disponible=0 then
			//El chofer ya no está disponible
			messagebox('Aviso','El chofer '+ls_chofer+' no se encuentra disponible')
			return 0
		end if
	end if

next


return 1
end function

public subroutine uf_buscar_disponibles ();//Buscar vehículos disponibles
datetime ldt_fecha_entrega, ldt_fecha_devolucion

ldt_fecha_entrega=datetime(date(em_fecha_entrega.text),time(em_hora_entrega.text))
ldt_fecha_devolucion=datetime(date(em_fecha_devolucion.text),time(em_hora_devolucion.text))

dw_vehiculos_disponibles.Reset()
idwc_vehiculos_disponibles.Retrieve(il_id,ldt_fecha_entrega,ldt_fecha_devolucion)
if idwc_vehiculos_disponibles.RowCount()>0 then dw_vehiculos_disponibles.insertrow(0)

dw_choferes_disponibles.Reset()
idwc_choferes_disponibles.Retrieve(il_id,ldt_fecha_entrega,ldt_fecha_devolucion)
if idwc_choferes_disponibles.RowCount()>0 then dw_choferes_disponibles.insertrow(0)

il_vehiculo=0 
il_chofer=0
end subroutine

public subroutine wf_crea_cuerpo_html (ref string as_cuerpo_html);String	ls_unidades_solicitadas = ""
String	ls_paradas_ida = ""
String	ls_paradas_regreso = ""
Int		li_estatus
String	ls_estatus
String	ls_fecha_inicio
String	ls_fecha_final
Int		li_usuaios
String	ls_solicita_chofer
String	ls_punto_origen
String	ls_lugar_destino
String	ls_punto_regreso
String	ls_contacto_viaje
String	ls_observaciones_sol
String	ls_nombre_solicitante
String	ls_correo_solicitante
String	ls_nombre_responsable
String	ls_correo_responsable
String	ls_telefono_responsable
Int		li_contador
Int		li_cantidad_unidades
String	ls_descripcion_unidad 
String	ls_cupo_unidad
String	ls_placas_unidad
Int		li_cupo_estimado
Int		li_cantidad_paradas_ida
Int		li_cantidad_paradas_regreso
Int		li_orden
String	ls_lugar_parada
String	ls_observacionesparada

/* Obtener datos generales de la solicitud */
SELECT	estatus,
			(
				SELECT	descripcion
				FROM		via_cat_estatus_solicitud
				WHERE	via_cat_estatus_solicitud.id = via_solicitud_interna.estatus
			) descripcion_estatus,
			CONVERT ( VARCHAR , format ( fecha_inicio , 'dd/MM/yyyy' ) ) + ' a las ' + CONVERT ( VARCHAR , format ( fecha_inicio , 'hh:mm' ) ) + ' horas' fecha_inicio,
			CONVERT ( VARCHAR , format ( fecha_final , 'dd/MM/yyyy' ) ) + ' a las ' + CONVERT ( VARCHAR , format ( fecha_final , 'hh:mm' ) ) + ' horas' fecha_final,
			usuarios,
			CASE chofer
				WHEN 0 THEN 'No'
				WHEN 1 THEN 'Si'
			END solicita_chofer,
			punto_origen,
			lugar_destino,
			punto_regreso,
			contacto_viaje,
			observaciones,
			nombre_solicitante,
			correo_solicitante,
			nombre_responsable,
			correo_responsable,
			telefono_responsable
INTO		:li_estatus,
			:ls_estatus,
			:ls_fecha_inicio,
			:ls_fecha_final,
			:li_usuaios,
			:ls_solicita_chofer,
			:ls_punto_origen,
			:ls_lugar_destino,
			:ls_punto_regreso,
			:ls_contacto_viaje,
			:ls_observaciones_sol,
			:ls_nombre_solicitante,
			:ls_correo_solicitante,
			:ls_nombre_responsable,
			:ls_correo_responsable,
			:ls_telefono_responsable
FROM		via_solicitud_interna
WHERE	sol_id = :il_id
USING	gtr_cv;

IF gtr_cv.SQLCode = -1 THEN
	MessageBox ( "Error:" , "De base de datos al consultar la solicitud.~n~r~n~r" + gtr_cv.SQLErrText )
	as_cuerpo_html = "Error al consultar la solicitud, por favor genere un reporte al área de soporte."
	Return
END IF

/* Obtener unidades solictadas */
DECLARE cur_unidades CURSOR FOR 
/*
SELECT	a.cantidad, 
			b.descripcion, 
			b.cupo,
			(
				SELECT	marca + ' - ' + modelo + ' - '  + 'Placas: ' + placas
				FROM		via_cat_vehiculos
				WHERE	id =	(
										SELECT	id_vehiculo
										FROM	via_sol_vehiculos
										WHERE	sol_id = a.sol_id
									)
			) placas
FROM		via_sol_interna_tipos_vehiculo a JOIN 
			via_cat_tipos_vehiculo b on a.tipo_vehiculo = b.id
WHERE	a.sol_id = :il_id
order BY b.descripcion*/

// se le agrega el -- se le agrega el DISTINCT , para que no duplique los vehiculos -- cph 30 nov 2021
//SELECT	a.cantidad, 

SELECT	DISTINCT a.cantidad, 
			b.descripcion, 
			b.cupo,
			(
				SELECT	marca + ' - ' + modelo + ' - '  + 'Placas: ' + placas
				FROM		via_cat_vehiculos
				WHERE	via_cat_vehiculos.id =	c.id_vehiculo
			) placas
FROM		via_sol_interna_tipos_vehiculo a,
			via_cat_tipos_vehiculo b,
			via_sol_vehiculos c
WHERE	a.sol_id = :il_id AND
		a.tipo_vehiculo = b.id AND
		a.sol_id = c.sol_id
order BY b.descripcion
USING	gtr_cv;

OPEN cur_unidades;
FETCH  cur_unidades INTO :li_cantidad_unidades, :ls_descripcion_unidad, :ls_cupo_unidad, :ls_placas_unidad;

li_cupo_estimado = Integer ( ls_cupo_unidad ) * li_cantidad_unidades

DO WHILE gtr_cv.SQLCode = 0
	ls_unidades_solicitadas += &
	" <tr>" + &
	"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
	"  <p class=MsoNormal align=center style='text-align:center'><span" + &
	"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>" + ls_descripcion_unidad + " - " + ls_placas_unidad + "</span></p>" + &
	"  </td>" + &
	"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
	"  <p class=MsoNormal align=center style='text-align:center'><span" + &
	"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>" + ls_cupo_unidad + "</span></p>" + &
	"  </td>" + &
	"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
	"  <p class=MsoNormal align=center style='text-align:center'><span" + &
	"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>" + String ( li_cantidad_unidades ) + "</span></p>" + &
	"  </td>" + &
	" </tr>"
	FETCH  cur_unidades INTO :li_cantidad_unidades, :ls_descripcion_unidad, :ls_cupo_unidad, :ls_placas_unidad;
LOOP
CLOSE cur_unidades;

/* Obtener las paradas de ida */
SELECT	Count ( * )
INTO		:li_cantidad_paradas_ida
FROM		via_sol_interna_paradas
WHERE	sol_id = :il_id AND
			tipo_parada = 0
USING	gtr_cv;

IF li_cantidad_paradas_ida > 0 THEN
	ls_paradas_ida += &
	"<p class=MsoNormal><span style='display:none'>&nbsp;</span></p>" + &
	"" + &
	"<div align=center>" + &
	"" + &
	"<table class=MsoNormalTable border=0 cellspacing=1 cellpadding=0 width=800" + &
	" style='width:600.0pt;background:#CCCCCC'>" + &
	" <tr>" + &
	"  <td colspan=3 style='padding:.75pt .75pt .75pt .75pt'>" + &
	"  <p class=MsoNormal><b><span style='font-size:9.0pt;font-family:'Arial',sans-serif'>Paradas" + &
	"  de ida</span></b></p>" + &
	"  </td>" + &
	" </tr>" + &
	" <tr>" + &
	"  <td width='8%' style='width:8.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
	"  <p class=MsoNormal align=center style='text-align:center'><span" + &
	"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>Orden</span></p>" + &
	"  </td>" + &
	"  <td width='42%' style='width:42.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
	"  <p class=MsoNormal align=center style='text-align:center'><span" + &
	"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>Lugar" + &
	"  parada</span></p>" + &
	"  </td>" + &
	"  <td width='37%' style='width:37.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
	"  <p class=MsoNormal align=center style='text-align:center'><span" + &
	"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>Observaciones</span></p>" + &
	"  </td>" + &
	" </tr>"
	
	DECLARE cur_Paradas_Ida CURSOR FOR 
	SELECT	orden,
				lugar_parada,
				observaciones
	FROM		via_sol_interna_paradas
	WHERE	sol_id = :il_id AND
				tipo_parada = 0
	ORDER BY	orden

	USING	gtr_cv;
	
	OPEN cur_Paradas_Ida;
	FETCH  cur_Paradas_Ida INTO :li_orden, :ls_lugar_parada, :ls_observacionesparada;

	DO WHILE gtr_cv.SQLCode = 0
		ls_paradas_ida += &
		" <tr>" + &
		"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
		"  <p class=MsoNormal align=center style='text-align:center'><span" + &
		"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>" + String ( li_orden ) + "</span></p>" + &
		"  </td>" + &
		"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
		"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
		"  color:black'>" + ls_lugar_parada + "</span></p>" + &
		"  </td>" + &
		"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
		"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
		"  color:black'>" + ls_observacionesparada + "</span></p>" + &
		"  </td>" + &
		" </tr>"

		FETCH  cur_Paradas_Ida INTO :li_orden, :ls_lugar_parada, :ls_observacionesparada;
	LOOP
	CLOSE cur_Paradas_Ida;
	
	ls_paradas_ida += &
	"</table>" + &
	"" + &
	"</div>" 
END IF

/* Obtener las paradas de regreso */
SELECT	Count ( * )
INTO		:li_cantidad_paradas_regreso
FROM		via_sol_interna_paradas
WHERE	sol_id = :il_id AND
			tipo_parada = 1
USING	gtr_cv;

IF li_cantidad_paradas_regreso > 0 THEN
	ls_paradas_regreso += &
	"<p class=MsoNormal><span style='display:none'>&nbsp;</span></p>" + &
	"" + &
	"<div align=center>" + &
	"" + &
	"<table class=MsoNormalTable border=0 cellspacing=1 cellpadding=0 width=800" + &
	" style='width:600.0pt;background:#CCCCCC'>" + &
	" <tr>" + &
	"  <td colspan=3 style='padding:.75pt .75pt .75pt .75pt'>" + &
	"  <p class=MsoNormal><b><span style='font-size:9.0pt;font-family:'Arial',sans-serif'>Paradas" + &
	"  de regreso</span></b></p>" + &
	"  </td>" + &
	" </tr>" + &
	" <tr>" + &
	"  <td width='8%' style='width:8.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
	"  <p class=MsoNormal align=center style='text-align:center'><span" + &
	"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>Orden</span></p>" + &
	"  </td>" + &
	"  <td width='42%' style='width:42.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
	"  <p class=MsoNormal align=center style='text-align:center'><span" + &
	"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>Lugar" + &
	"  parada</span></p>" + &
	"  </td>" + &
	"  <td width='37%' style='width:37.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
	"  <p class=MsoNormal align=center style='text-align:center'><span" + &
	"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>Observaciones</span></p>" + &
	"  </td>" + &
	" </tr>"
	
	DECLARE cur_Paradas_Regreso CURSOR FOR 
	SELECT	orden,
				lugar_parada,
				observaciones
	FROM		via_sol_interna_paradas
	WHERE	sol_id = :il_id AND
				tipo_parada = 1
	ORDER BY	orden
	USING	gtr_cv;
	
	OPEN cur_Paradas_Regreso;
	FETCH  cur_Paradas_Regreso INTO :li_orden, :ls_lugar_parada, :ls_observacionesparada;

	DO WHILE gtr_cv.SQLCode = 0
		ls_paradas_regreso += &
		" <tr>" + &
		"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
		"  <p class=MsoNormal align=center style='text-align:center'><span" + &
		"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>" + String ( li_orden ) + "</span></p>" + &
		"  </td>" + &
		"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
		"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
		"  color:black'>" + ls_lugar_parada + "</span></p>" + &
		"  </td>" + &
		"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
		"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
		"  color:black'>" + ls_observacionesparada + "</span></p>" + &
		"  </td>" + &
		" </tr>"

		FETCH  cur_Paradas_Regreso INTO :li_orden, :ls_lugar_parada, :ls_observacionesparada;
	LOOP
	CLOSE cur_Paradas_Regreso;
	
	ls_paradas_regreso += &
	"</table>" + &
	"" + &
	"</div>"
END IF

as_cuerpo_html = &
"<html>" + &
"" + &
"<head>" + &
"<meta http-equiv=Content-Type content='text/html; charset=windows-1252'>" + &
"<meta name=Generator content='Microsoft Word 15 (filtered)'>" + &
"<style>" + &
"<!--" + &
" /* Font Definitions */" + &
" @font-face" + &
"	{font-family:'Cambria Math';" + &
"	panose-1:2 4 5 3 5 4 6 3 2 4;}" + &
"@font-face" + &
"	{font-family:Calibri;" + &
"	panose-1:2 15 5 2 2 2 4 3 2 4;}" + &
" /* Style Definitions */" + &
" p.MsoNormal, li.MsoNormal, div.MsoNormal" + &
"	{margin:0cm;" + &
"	margin-bottom:.0001pt;" + &
"	font-size:11.0pt;" + &
"	font-family:'Calibri',sans-serif;}" + &
"a:link, span.MsoHyperlink" + &
"	{color:#0563C1;" + &
"	text-decoration:underline;}" + &
".MsoChpDefault" + &
"	{font-family:'Calibri',sans-serif;}" + &
".MsoPapDefault" + &
"	{margin-bottom:8.0pt;" + &
"	line-height:107%;}" + &
"@page WordSection1" + &
"	{size:612.0pt 792.0pt;" + &
"	margin:70.85pt 3.0cm 70.85pt 3.0cm;}" + &
"div.WordSection1" + &
"	{page:WordSection1;}" + &
"-->" + &
"</style>" + &
"" + &
"</head>" + &
"" + &
"<body lang=ES-MX link='#0563C1' vlink='#954F72'>" + &
"<div align=center>" + &
"  <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=800" + &
" style='width:600.0pt;background:white'>" + &
"    <tr style='height:15.0pt'>" + &
"<td><strong>Estimado  usuario,&nbsp;</strong>al  recibir la confirmación de la unidad asignada queda sujeto a las políticas de  control vehicular, las cuales se encuentran en intranet, portal de Operaciones  y Servicios en el menú de control vehicular.</td>" + &
"    </tr>" + &
"  </table>" + &
"</div>" + &
"<p class=MsoNormal>&nbsp;</p>" + &
"</div>" + &
"" + &
"<div class=WordSection1>" + &
"" + &
"<div align=center>" + &
"" + &
"<table class=MsoNormalTable border=0 cellspacing=1 cellpadding=0 width=800" + &
" style='width:600.0pt;background:#CCCCCC'>" + &
" <tr>" + &
"  <td colspan=4 style='padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><b><span style='font-size:9.0pt;font-family:'Arial',sans-serif'>Datos" + &
"  del viaje</span></b></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td width='15%' style='width:15.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Folio</span></p>" + &
"  </td>" + &
"  <td width='20%' style='width:20.0%;background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + String ( il_id ) + "</span></p>" + &
"  </td>" + &
"  <td width='15%' style='width:15.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Estatus</span></p>" + &
"  </td>" + &
"  <td width='20%' style='width:20.0%;background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + ls_estatus + "</span></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td style='background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Inicio de viaje</span></p>" + &
"  </td>" + &
"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + ls_fecha_inicio + "</span></p>" + &
"  </td>" + &
"  <td style='background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Fin del viaje</span></p>" + &
"  </td>" + &
"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + ls_fecha_final + "</span></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td style='background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Usuarios</span></p>" + &
"  </td>" + &
"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + String ( li_usuaios ) + "</span></p>" + &
"  </td>" + &
"  <td style='background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Solicita chofer</span></p>" + &
"  </td>" + &
"  <td style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + ls_solicita_chofer + "</span></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td style='background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Punto de origen</span></p>" + &
"  </td>" + &
"  <td colspan=3 style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + ls_punto_origen + "</span></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td style='background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Lugar destino</span></p>" + &
"  </td>" + &
"  <td colspan=3 style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + ls_lugar_destino + "</span></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td style='background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Punto de regreso</span></p>" + &
"  </td>" + &
"  <td colspan=3 style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + ls_punto_regreso + "</span></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td style='background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Contacto externo (Empresa y/o lugar a visitar)</span></p>" + &
"  </td>" + &
"  <td colspan=3 style='background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + ls_contacto_viaje + "</span></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td style='background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Observaciones</span></p>" + &
"  </td>" + &
"  <td colspan=3 style='background:white;padding:.75pt .75pt .75pt .75pt'>" + ls_observaciones_sol + "</td>" + &
" </tr>" + &
"</table>" + &
"" + &
"</div>" + &
"" + &
"<p class=MsoNormal><span style='display:none'>&nbsp;</span></p>" + &
"" + &
"<div align=center>" + &
"" + &
"<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=800" + &
" style='width:600.0pt;background:white'>" + &
" <tr style='height:15.0pt'>" + &
"  <td style='padding:0cm 0cm 0cm 0cm;height:15.0pt'></td>" + &
" </tr>" + &
"</table>" + &
"" + &
"</div>" + &
"" + &
"<p class=MsoNormal><span style='display:none'>&nbsp;</span></p>" + &
"" + &
"<div align=center>" + &
"" + &
"<table class=MsoNormalTable border=0 cellspacing=1 cellpadding=0 width=800" + &
" style='width:600.0pt;background:#CCCCCC'>" + &
" <tr>" + &
"  <td colspan=4 style='padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><b><span style='font-size:9.0pt;font-family:'Arial',sans-serif'>Datos" + &
"  del Solicitante</span></b></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td width='13%' style='width:13.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Solicitante</span></p>" + &
"  </td>" + &
"  <td width='50%' style='width:50.0%;background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + ls_nombre_solicitante + "</span></p>" + &
"  </td>" + &
"  <td width='13%' style='width:13.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Correo solicitante</span></p>" + &
"  </td>" + &
"  <td width='20%' style='width:20.0%;background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'><a href='mailto:" + ls_correo_solicitante + "'>" + ls_correo_solicitante + "</a></span></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td width='13%' style='width:13.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Responsable</span></p>" + &
"  </td>" + &
"  <td width='50%' style='width:50.0%;background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + ls_nombre_responsable + "</span></p>" + &
"  </td>" + &
"  <td width='13%' style='width:13.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Correo responsable</span></p>" + &
"  </td>" + &
"  <td width='20%' style='width:20.0%;background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'><a href='" + ls_correo_responsable + "'>" + ls_correo_responsable + "</a></span></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td colspan=2 style='background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'></td>" + &
"  <td width='13%' style='width:13.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>Teléfono y celular responsable</span></p>" + &
"  </td>" + &
"  <td width='20%' style='width:20.0%;background:white;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><span style='font-size:9.0pt;font-family:'Arial',sans-serif;" + &
"  color:black'>" + ls_telefono_responsable + "</span></p>" + &
"  </td>" + &
" </tr>" + &
"</table>" + &
"" + &
"</div>" + &
"" + &
"<p class=MsoNormal><span style='display:none'>&nbsp;</span></p>" + &
"" + &
"<div align=center>" + &
"" + &
"<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=800" + &
" style='width:600.0pt;background:white'>" + &
" <tr style='height:15.0pt'>" + &
"  <td style='padding:0cm 0cm 0cm 0cm;height:15.0pt'></td>" + &
" </tr>" + &
"</table>" + &
"" + &
"</div>" + &
"" + &
"<p class=MsoNormal><span style='display:none'>&nbsp;</span></p>" + &
"" + &
"<div align=center>" + &
"" + &
"<table class=MsoNormalTable border=0 cellspacing=1 cellpadding=0 width=800" + &
" style='width:600.0pt;background:#CCCCCC'>" + &
" <tr>" + &
"  <td colspan=3 style='padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal><b><span style='font-size:9.0pt;font-family:'Arial',sans-serif'>Unidades" + &
"  solicitadas</span></b></p>" + &
"  </td>" + &
" </tr>" + &
" <tr>" + &
"  <td width='60%' style='width:60.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal align=center style='text-align:center'><span" + &
"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>Unidad</span></p>" + &
"  </td>" + &
"  <td width='12%' style='width:12.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal align=center style='text-align:center'><span" + &
"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>Cupo" + &
"  estimado</span></p>" + &
"  </td>" + &
"  <td width='15%' style='width:15.0%;background:#EEEEEE;padding:.75pt .75pt .75pt .75pt'>" + &
"  <p class=MsoNormal align=center style='text-align:center'><span" + &
"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>Cantidad" + &
"  solicitada</span></p>" + &
"  </td>" + &
" </tr>" + &
ls_unidades_solicitadas +&
"</table>" + &
"" + &
"</div>" + &
"" + &
"<p class=MsoNormal><span style='display:none'>&nbsp;</span></p>" + &
"" + &
"<div align=center>" + &
"" + &
"<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=800" + &
" style='width:600.0pt;background:white'>" + &
" <tr>" + &
"  <td style='padding:0cm 0cm 0cm 0cm'></td>" + &
" </tr>" + &
" <tr style='height:6.0pt'>" + &
"  <td style='padding:0cm 0cm 0cm 0cm;height:6.0pt'></td>" + &
" </tr>" + &
" <tr>" + &
"  <td style='padding:0cm 0cm 0cm 0cm'>" + &
"  <p class=MsoNormal align=right style='text-align:right'><i><span" + &
"  style='font-size:9.0pt;font-family:'Arial',sans-serif;color:black'>Cupo" + &
"  estimado: " + String ( li_cupo_estimado ) + " personas</span></i></p>" + &
"  </td>" + &
" </tr>" + &
" <tr style='height:15.0pt'>" + &
"  <td style='padding:0cm 0cm 0cm 0cm;height:15.0pt'></td>" + &
" </tr>" + &
"</table>" + &
"" + &
"</div>" + &
"<p class=MsoNormal><span style='display:none'>&nbsp;</span></p>" + &
"" + &
"<div align=center>" + &
"" + &
"<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=800" + &
" style='width:600.0pt;background:white'>" + &
" <tr style='height:15.0pt'>" + &
"  <td style='padding:0cm 0cm 0cm 0cm;height:15.0pt'></td>" + &
" </tr>" + &
"</table>" + &
"" + &
"</div>" + &
"" + &
ls_paradas_ida +&
ls_paradas_regreso +&
"" + &
"<div align=center>" + &
"  <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=800" + &
" style='width:600.0pt;background:white'>" + &
"    <tr style='height:15.0pt'>" + &
"Atentamente<br>Oficina de Servicios Internos y Transporte  </td>" + &
"    </tr>" + &
"  </table>" + &
"</div>" + &
"<p class=MsoNormal>&nbsp;</p>" + &
"</div>" + &
"" + &
"</body>" + &
"" + &
"</html>"


/*********************************************************************/
/*********************************************************************/
/*********************************************************************/
/*********************************************************************/
/*********************************************************************/



/*
as_cuerpo_html = &
"<!doctype html>" + &
"<html>" + &
"<head>" + &
"<meta charset='utf-8'>" + &
"<title>Untitled Document</title>" + &
"</head>" + &
"<body>" + &
"<p>La  solicitud con folio <strong>&ldquo;" + String ( il_id ) + "&rdquo;</strong> fue  aprobada. Por favor revise las políticas descritas a continuación. </p>" + &
"<p><strong>Políticas  para el servicio de vehículos institucionales</strong><br>" + &
"  A) La unidad será conducida por personal administrativo  de la Ibero, deberá contar con licencia de conducir y credencial de empleado  vigente. Deberán existir registros de estos documentos en el archivo de la  oficina de control vehicular y presentarlos al momento de recibir la unidad.<br>" + &
"  B) Los autos se encuentran en el estacionamiento E-5  (junto a controles de acceso), en donde se deberá dejar al terminar el  servicio. <br>" + &
"  C) En la oficina de Control Vehicular (edificio A P.B.)  se entregará la llave del auto y la bitácora FO-UIACM-DOS-74-02 (misma que  deberá ser llenada completamente por el usuario), al concluir el servicio  deberán devolverse en la misma oficina. En caso de empezar o concluir el  servicio fuera de horario de atención, la llave y la bitácora deberán ser  entregadas en la oficina de seguridad.<br>" + &
"  D)&nbsp;&nbsp;  &nbsp;El saldo de la TAG para el uso de autopistas deberá solicitarse por  correo electrónico con un día hábil de anticipación de 8:00 a 17:00 horas. El  uso de casetas está restringido al traslado solo de personas con servicio de  chofer y para citas con justificación institucional. No aplica el uso para la  entrega de mensajería.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>" + &
"  E) Al utilizar un auto institucional el usuario deberá  sujetarse a los siguientes puntos:</p>" + &
"<ul>" + &
"  <li>Verificar la tarjeta de circulación, póliza de seguro,  tarjeta TAG, herramienta de apoyo vial y tarjeta de acceso al estacionamiento  Ibero.</li>" + &
"  <li>Revisar que no tenga golpes, abolladuras, tallones,  etc. En caso de encontrar algún desperfecto avisar de inmediato a la oficina de  Informes.</li>" + &
"  <li>Cumplir con los reglamentos de tránsito vigentes en la  localidad donde se conduzca.</li>" + &
"  <li>Cubrir las infracciones correspondientes y liberación  de los vehículos, en su caso.</li>" + &
"  <li>Realizar desplazamientos únicamente dentro del Distrito  Federal y área metropolitana.</li>" + &
"  <li>Durante el servicio utilizar estacionamiento públicos y  cerrados.</li>" + &
"  <li>Dentro de la IBERO, está prohibido estacionase en  lugares restringidos y/o destinados para alumnos, personas con discapacidad,  pasos peatonales, ambulancias, servicio médico, etc., así como el bloquear la  salida de los autos estacionados.</li>" + &
"  <li>No se permite consumir alimentos, bebidas, ni fumar en  el interior de los autos.</li>" + &
"  <li>La reposición por pérdida de tarjeta de acceso al  estacionamiento de la IBERO, documentos y herramienta del auto serán cubiertas  por el usuario a los costos vigentes.</li>" + &
"  <li>Los autos deberán pernoctar dentro de la Universidad  Iberoamericana.</li>" + &
"  <li>La oficina de control vehicular no se hará responsable  de las pérdidas de objetos personales olvidados en el interior de los autos ya  que estos son destinados a diferentes usuarios.</li>" + &
"</ul>" + &
"<p>F) En caso de surgir alguna eventualidad o siniestro  durante el uso, todos los autos cuentan con una póliza de seguro (guantera) que  ampara asistencia vial, legal y daños a terceros, en tal caso favor de  contactar a la compañía aseguradora y avisar a la oficina de control vehicular  a los teléfonos 59504000 Ext. 7686 y/o 59504001 o  4002&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>" + &
"  G) La Universidad Iberoamericana A.C. No se hace  responsable de los daños ocasionados al auto y/o tercero por parte del usuario.  Cualquier daño o deducible deberá ser pagado por el usuario asignado.&nbsp;<br>" + &
"  H) En cada asignación se tiene tolerancia de 30 minutos  en caso de no llegar por la unidad, esta será asignada al siguiente usuario.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>" + &
"  I) No se permite el uso de los autos y/o choferes  institucionales en los siguientes casos:</p>" + &
"<ul>" + &
"  <li>Actividades de carácter personal, cursos y  capacitaciones</li>" + &
"  <li>Viajes culturales, recreativos, deportivos o turísticos</li>" + &
"  <li>Servicios funerarios</li>" + &
"  <li>Trasladar alumnos o material de los mismos aún con  fines académicos</li>" + &
"</ul>" + &
"<p>&nbsp;</p>" + &
"<br>" + &
"Atentamente: Departamento de Control Vehicular." + &
"</body>" + &
"</html>"
*/
end subroutine

public subroutine wf_crea_cuerpo_html_rechazo (ref string as_cuerpo_html);as_cuerpo_html = &
"<!doctype html>" + &
"<html>" + &
"<head>" + &
"<meta charset='utf-8'>" + &
"<title>Untitled Document</title>" + &
"</head>" + &
"<body>" + &
"<div>" + &
"  <p><strong>1.- Estimado Usuario:</strong></p>" + &
"  <p><strong>&nbsp;</strong></p>" + &
"  <p>El servicio solicitado no puede ser atendido debido a no contar con personal ni unidades para cubrir su salida.</p>" + &
"  <p>&nbsp; </p>" + &
"  <p>Quedamos a sus órdenes para cualquier aclaración al respecto.</p>" + &
"  <p>&nbsp;</p>" + &
"  <p>Atentamente</p>" + &
"  <p>Oficina de Servicios Internos y Transporte</p>" + &
"</div>" + &
"<p>&nbsp;</p>" + &
"</body>" + &
"</html>"
end subroutine

on w_veh_solicitud_interna_edita.create
this.st_version2=create st_version2
this.st_version=create st_version
this.st_21=create st_21
this.st_esperar=create st_esperar
this.dw_solicitud_unidad_asignada=create dw_solicitud_unidad_asignada
this.dw_motivo_rechazo=create dw_motivo_rechazo
this.cbx_rechazar_solicitud=create cbx_rechazar_solicitud
this.cb_eliminar=create cb_eliminar
this.st_20=create st_20
this.st_19=create st_19
this.st_18=create st_18
this.cb_rechazar=create cb_rechazar
this.cb_agregar_vehiculo=create cb_agregar_vehiculo
this.dw_choferes_disponibles=create dw_choferes_disponibles
this.dw_vehiculos_disponibles=create dw_vehiculos_disponibles
this.dw_vehiculos_solicitados=create dw_vehiculos_solicitados
this.cb_buscar=create cb_buscar
this.st_16=create st_16
this.cb_1=create cb_1
this.st_9=create st_9
this.dw_paradas=create dw_paradas
this.st_8=create st_8
this.dw_unidades=create dw_unidades
this.cbx_chofer=create cbx_chofer
this.sle_telefono_responsable=create sle_telefono_responsable
this.st_15=create st_15
this.sle_correo_responsable=create sle_correo_responsable
this.st_14=create st_14
this.sle_nombre_responsable=create sle_nombre_responsable
this.st_13=create st_13
this.sle_nombre_solicitante=create sle_nombre_solicitante
this.mle_observaciones=create mle_observaciones
this.st_12=create st_12
this.mle_punto_regreso=create mle_punto_regreso
this.st_11=create st_11
this.mle_lugar_destino=create mle_lugar_destino
this.st_3=create st_3
this.em_hora_final=create em_hora_final
this.em_hora_inicio=create em_hora_inicio
this.em_fecha_final=create em_fecha_final
this.st_10=create st_10
this.st_7=create st_7
this.em_fecha_inicio=create em_fecha_inicio
this.st_6=create st_6
this.sle_correo_solicitante=create sle_correo_solicitante
this.st_5=create st_5
this.st_4=create st_4
this.sle_contacto_viaje=create sle_contacto_viaje
this.sle_usuarios=create sle_usuarios
this.st_2=create st_2
this.st_1=create st_1
this.mle_punto_origen=create mle_punto_origen
this.cb_guardar=create cb_guardar
this.gb_titulo=create gb_titulo
this.gb_1=create gb_1
this.st_17=create st_17
this.em_hora_devolucion=create em_hora_devolucion
this.em_hora_entrega=create em_hora_entrega
this.em_fecha_entrega=create em_fecha_entrega
this.em_fecha_devolucion=create em_fecha_devolucion
this.Control[]={this.st_version2,&
this.st_version,&
this.st_21,&
this.st_esperar,&
this.dw_solicitud_unidad_asignada,&
this.dw_motivo_rechazo,&
this.cbx_rechazar_solicitud,&
this.cb_eliminar,&
this.st_20,&
this.st_19,&
this.st_18,&
this.cb_rechazar,&
this.cb_agregar_vehiculo,&
this.dw_choferes_disponibles,&
this.dw_vehiculos_disponibles,&
this.dw_vehiculos_solicitados,&
this.cb_buscar,&
this.st_16,&
this.cb_1,&
this.st_9,&
this.dw_paradas,&
this.st_8,&
this.dw_unidades,&
this.cbx_chofer,&
this.sle_telefono_responsable,&
this.st_15,&
this.sle_correo_responsable,&
this.st_14,&
this.sle_nombre_responsable,&
this.st_13,&
this.sle_nombre_solicitante,&
this.mle_observaciones,&
this.st_12,&
this.mle_punto_regreso,&
this.st_11,&
this.mle_lugar_destino,&
this.st_3,&
this.em_hora_final,&
this.em_hora_inicio,&
this.em_fecha_final,&
this.st_10,&
this.st_7,&
this.em_fecha_inicio,&
this.st_6,&
this.sle_correo_solicitante,&
this.st_5,&
this.st_4,&
this.sle_contacto_viaje,&
this.sle_usuarios,&
this.st_2,&
this.st_1,&
this.mle_punto_origen,&
this.cb_guardar,&
this.gb_titulo,&
this.gb_1,&
this.st_17,&
this.em_hora_devolucion,&
this.em_hora_entrega,&
this.em_fecha_entrega,&
this.em_fecha_devolucion}
end on

on w_veh_solicitud_interna_edita.destroy
destroy(this.st_version2)
destroy(this.st_version)
destroy(this.st_21)
destroy(this.st_esperar)
destroy(this.dw_solicitud_unidad_asignada)
destroy(this.dw_motivo_rechazo)
destroy(this.cbx_rechazar_solicitud)
destroy(this.cb_eliminar)
destroy(this.st_20)
destroy(this.st_19)
destroy(this.st_18)
destroy(this.cb_rechazar)
destroy(this.cb_agregar_vehiculo)
destroy(this.dw_choferes_disponibles)
destroy(this.dw_vehiculos_disponibles)
destroy(this.dw_vehiculos_solicitados)
destroy(this.cb_buscar)
destroy(this.st_16)
destroy(this.cb_1)
destroy(this.st_9)
destroy(this.dw_paradas)
destroy(this.st_8)
destroy(this.dw_unidades)
destroy(this.cbx_chofer)
destroy(this.sle_telefono_responsable)
destroy(this.st_15)
destroy(this.sle_correo_responsable)
destroy(this.st_14)
destroy(this.sle_nombre_responsable)
destroy(this.st_13)
destroy(this.sle_nombre_solicitante)
destroy(this.mle_observaciones)
destroy(this.st_12)
destroy(this.mle_punto_regreso)
destroy(this.st_11)
destroy(this.mle_lugar_destino)
destroy(this.st_3)
destroy(this.em_hora_final)
destroy(this.em_hora_inicio)
destroy(this.em_fecha_final)
destroy(this.st_10)
destroy(this.st_7)
destroy(this.em_fecha_inicio)
destroy(this.st_6)
destroy(this.sle_correo_solicitante)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.sle_contacto_viaje)
destroy(this.sle_usuarios)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_punto_origen)
destroy(this.cb_guardar)
destroy(this.gb_titulo)
destroy(this.gb_1)
destroy(this.st_17)
destroy(this.em_hora_devolucion)
destroy(this.em_hora_entrega)
destroy(this.em_fecha_entrega)
destroy(this.em_fecha_devolucion)
end on

event open;integer li_i

il_id = Message.DoubleParm	
ids_solicitud =  create datastore
ids_solicitud.dataobject ='d_veh_solicitudes_edit'
ids_solicitud.settransobject(gtr_cv)
dw_unidades.settransobject(gtr_cv)
dw_paradas.settransobject(gtr_cv)
dw_vehiculos_solicitados.settransobject(gtr_cv)

ids_solicitud.Retrieve(il_id)
dw_unidades.Retrieve(il_id)
dw_vehiculos_solicitados.Retrieve(il_id)
dw_paradas.Retrieve(il_id)

dw_vehiculos_disponibles.settransobject(gtr_cv)
dw_vehiculos_disponibles.getchild('descripcion',idwc_vehiculos_disponibles)
idwc_vehiculos_disponibles.settransobject(gtr_cv)

dw_choferes_disponibles.settransobject(gtr_cv)
dw_choferes_disponibles.getchild('descripcion',idwc_choferes_disponibles)
idwc_choferes_disponibles.settransobject(gtr_cv)

if ids_solicitud.Rowcount() > 0 then
	em_fecha_inicio.text=ids_solicitud.GetItemString(1,'fecha_i')
	em_fecha_final.text=ids_solicitud.GetItemString(1,'fecha_f')
	em_hora_inicio.text=mid(ids_solicitud.GetItemString(1,'hora_i'),1,5)
	em_hora_final.text=mid(ids_solicitud.GetItemString(1,'hora_f'),1,5)	
	sle_usuarios.text=string(ids_solicitud.GetItemNumber(1,'usuarios'))	
	if ids_solicitud.GetItemNumber(1,'chofer')=1 then cbx_chofer.checked=true	
	mle_punto_origen.text=ids_solicitud.GetItemString(1,'punto_origen')
	mle_lugar_destino.text=ids_solicitud.GetItemString(1,'lugar_destino')
	mle_punto_regreso.text=ids_solicitud.GetItemString(1,'punto_regreso')
	sle_contacto_viaje.text=ids_solicitud.GetItemString(1,'contacto_viaje')
	mle_observaciones.text=ids_solicitud.GetItemString(1,'observaciones')
	sle_nombre_solicitante.text=ids_solicitud.GetItemString(1,'nombre_solicitante')
	sle_correo_solicitante.text=ids_solicitud.GetItemString(1,'correo_solicitante')
	sle_nombre_responsable.text=ids_solicitud.GetItemString(1,'nombre_responsable')
	sle_correo_responsable.text=ids_solicitud.GetItemString(1,'correo_responsable')
	sle_telefono_responsable.text=ids_solicitud.GetItemString(1,'telefono_responsable')
	em_fecha_entrega.text=ids_solicitud.GetItemString(1,'fecha_e')
	em_fecha_devolucion.text=ids_solicitud.GetItemString(1,'fecha_d')
	em_hora_entrega.text=mid(ids_solicitud.GetItemString(1,'hora_e'),1,5)
	em_hora_devolucion.text=mid(ids_solicitud.GetItemString(1,'hora_d'),1,5)		
else
	CloseWithReturn(w_veh_solicitud_interna_edita,0)
end if

if ids_solicitud.GetItemNumber(1,'estatus')=0 then
	cb_guardar.text='Aprobar solicitud'
else
	cb_guardar.text='Guardar solicitud'
end if

if ids_solicitud.GetItemNumber(1,'estatus')>1 then
	cbx_rechazar_solicitud.Visible = False
end if
em_fecha_inicio.SetFocus()
end event

event close;CloseWithReturn(this,0)
end event

type st_version2 from statictext within w_veh_solicitud_interna_edita
boolean visible = false
integer x = 1536
integer width = 114
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 553648127
string text = "."
boolean focusrectangle = false
end type

event doubleclicked;messagebox("Versión",&
"Se actualiza la funcion wf_cre_cuerpo_html se le agrega un DISTINCT a uno de los Queries.~n"+&
"Se modifica el boton guardar, ver comentarios, César Ponce. cph 30 nov 2021")

this.visible=false

end event

type st_version from statictext within w_veh_solicitud_interna_edita
integer x = 1376
integer width = 114
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 553648127
string text = "."
boolean focusrectangle = false
end type

event doubleclicked;st_version2.visible=true
end event

type st_21 from statictext within w_veh_solicitud_interna_edita
integer x = 896
integer y = 12
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_esperar from statictext within w_veh_solicitud_interna_edita
boolean visible = false
integer x = 59
integer y = 1352
integer width = 6907
integer height = 308
integer textsize = -36
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enviando correo, por favor espere ..."
alignment alignment = center!
fillpattern fillpattern = bdiagonal!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_solicitud_unidad_asignada from datawindow within w_veh_solicitud_interna_edita
boolean visible = false
integer x = 5289
integer y = 2344
integer width = 1696
integer height = 484
integer taborder = 210
string title = "none"
string dataobject = "d_veh_rpt_solicitud_interna"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_motivo_rechazo from datawindow within w_veh_solicitud_interna_edita
boolean visible = false
integer x = 4306
integer y = 2204
integer width = 1385
integer height = 108
integer taborder = 210
string title = "none"
string dataobject = "d_veh_cat_motivos_rechazo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_rechazar_solicitud from checkbox within w_veh_solicitud_interna_edita
integer x = 4315
integer y = 2080
integer width = 713
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 553648127
string text = "Rechazar la solicitud"
end type

event clicked;If checked THEN
	cb_rechazar.Visible = True
	dw_motivo_rechazo.Visible = True
	
	dw_motivo_rechazo.Reset ()
	dw_motivo_rechazo.SetTransObject ( gtr_cv )
	dw_motivo_rechazo.InsertRow ( 0 )

ELSE
	cb_rechazar.Visible = False
	dw_motivo_rechazo.Visible = False
END IF
end event

type cb_eliminar from commandbutton within w_veh_solicitud_interna_edita
integer x = 5189
integer y = 1852
integer width = 768
integer height = 128
integer taborder = 200
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Eliminar vehículos"
boolean default = true
end type

event clicked;dw_vehiculos_solicitados.Reset()
end event

type st_20 from statictext within w_veh_solicitud_interna_edita
integer x = 4288
integer y = 1220
integer width = 809
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Vehículos solicitados:"
boolean focusrectangle = false
end type

type st_19 from statictext within w_veh_solicitud_interna_edita
integer x = 4288
integer y = 924
integer width = 809
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Chofer:"
boolean focusrectangle = false
end type

type st_18 from statictext within w_veh_solicitud_interna_edita
integer x = 4288
integer y = 720
integer width = 809
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Vehículo:"
boolean focusrectangle = false
end type

type cb_rechazar from commandbutton within w_veh_solicitud_interna_edita
boolean visible = false
integer x = 4306
integer y = 2372
integer width = 974
integer height = 128
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Confirmar rechazo de solicitud"
boolean default = true
end type

event clicked;integer Net
datetime ldt_ahorita
Int		li_id_motivo_rechazo
String	ls_de, ls_para[], ls_cc[], ls_asunto, ls_cuerpo, ls_archivo, ls_tipo_server
String	ls_correo_solicitante, ls_correo_responsable

li_id_motivo_rechazo = dw_motivo_rechazo.GetItemNumber ( 1 , 'id' )
ls_correo_solicitante=trim(sle_correo_solicitante.text)
ls_correo_responsable=trim(sle_correo_responsable.text)

IF IsNull ( li_id_motivo_rechazo ) or li_id_motivo_rechazo = 0 THEN
	MessageBox ( "Aviso:" , "Por favor, selecciona un motivo de rechazo." )
	Return
END IF

ldt_ahorita=DateTime(Today(),Now())
SELECT	top 1 getdate ()
INTO		:ldt_ahorita 
FROM		via_solicitud_interna
USING	gtr_cv;

Net = messagebox("Aviso",'La solicitud será rechazada. ¿Desea continuar?', Question!, yesno!, 2)
if Net = 1 then

	ids_solicitud.setitem(1,'estatus',6)
	ids_solicitud.setitem(1,'ultima_modificacion',ldt_ahorita)
	ids_solicitud.setitem(1,'usuario_modificacion',gs_usuario)
	ids_solicitud.setitem(1,'id_motivo_rechazo',li_id_motivo_rechazo)

	if ids_solicitud.update()>0 then
		dw_vehiculos_solicitados.update()
		commit using gtr_cv;
		messagebox('Aviso','La solicitud fue rechazada')
		
		n_smtpmail	luo_mail
		luo_mail = create n_smtpmail
		
		ls_tipo_server = Upper ( gtr_cv.dbparm )
		IF Pos ( ls_tipo_server , 'SQLWEBDES' ) > 0 OR Pos ( ls_tipo_server , 'SQLWEBPRU' ) > 0 THEN
			ls_de = 'desarrollo33@ibero.mx'
			ls_para [ 1 ] = 'desarrollo33@ibero.mx'
			ls_cc [ 1 ] = 'fernando.ochoa@ibero.mx'
			ls_cc [ 2 ] = 'sergio.loza@ibero.mx'
		ELSE
			ls_de = 'control.vehicular@ibero.mx'
			ls_para [ 1 ] = ls_correo_solicitante
			IF Not IsNull ( ls_correo_responsable ) AND ls_correo_responsable <> '' THEN
				ls_para [ 2 ] = ls_correo_responsable
			END IF
			ls_cc [ 1 ] = 'hipolito.calderon@ibero.mx'
			ls_cc [ 2 ] = 'ericka.paredes@ibero.mx'
			ls_cc [ 3 ] = 'marcos.novelo@ibero.mx'
			ls_cc [ 4 ] = 'jorged.aburto@ibero.mx'
		END IF
		
		ls_asunto = "La solicitud con folio " + String ( il_id ) + " fue rechazada."
		wf_crea_cuerpo_html_rechazo ( ls_cuerpo )
		
		IF luo_mail.of_enviamail ( ls_de , ls_para[], ls_cc[] , ls_asunto , ls_cuerpo , ls_archivo ) =  -1 THEN
			MessageBox ( "Aviso:" , "Se presentó un error al enviar la notificación por coreo" )
		END IF
		
		Destroy luo_mail
		
		CloseWithReturn(w_veh_solicitud_interna_edita,0)
	else
		messagebox("Error: "+gtr_cv.sqlerrtext,"La solicitud no fue actualizada.",stopsign!)
		rollback using gtr_cv;
	end if	
	
end if
end event

type cb_agregar_vehiculo from commandbutton within w_veh_solicitud_interna_edita
integer x = 5929
integer y = 1012
integer width = 727
integer height = 128
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Agregar vehículo"
boolean default = true
end type

event clicked;integer li_row, li_existe
string ls_find, ls_nombre, ls_paterno, ls_materno, ls_vehiculo, ls_chofer=''

datastore lds_vehiculo
lds_vehiculo =  create datastore
lds_vehiculo.dataobject ='d_veh_cat_vehiculos_edit'
lds_vehiculo.settransobject(gtr_cv)

datastore lds_chofer
lds_chofer =  create datastore
lds_chofer.dataobject ='d_veh_cat_choferes_edit'
lds_chofer.settransobject(gtr_cv)

if il_vehiculo > 0 then
	
	lds_vehiculo.Retrieve(il_vehiculo)
	if lds_vehiculo.RowCount() > 0 then ls_vehiculo=lds_vehiculo.GetItemString(1,'descripcion')

	if il_chofer > 0 then
		lds_chofer.Retrieve(il_chofer)
		if lds_chofer.RowCount() > 0 then 
			ls_nombre=lds_chofer.GetItemString(1,'nombre')
			ls_paterno=lds_chofer.GetItemString(1,'paterno')
			ls_materno=lds_chofer.GetItemString(1,'materno')
			if len(ls_nombre)>0 then ls_chofer= ls_nombre
			if len(ls_paterno)>0 then ls_chofer= ls_chofer+' '+ls_paterno
			if len(ls_materno)>0 then ls_chofer= ls_chofer+' '+ls_materno
		end if
		//Verificar que no esté ya agregado
		li_row=dw_vehiculos_solicitados.RowCount()
		li_existe=0
		ls_find="id_chofer="+string(il_chofer)
		li_existe=dw_vehiculos_solicitados.Find(ls_find,1,dw_vehiculos_solicitados.RowCount())
		
		if li_existe>0 then
			messagebox('Aviso','El chofer ya está asignado a otro vehículo en la solicitud')
			return 
		end if
		
	end if
	
	li_row=dw_vehiculos_solicitados.RowCount()
	li_existe=0
	ls_find="id_vehiculo="+string(il_vehiculo)
	li_existe=dw_vehiculos_solicitados.Find(ls_find,1,dw_vehiculos_solicitados.RowCount())
	
	if li_existe>0 then
		dw_vehiculos_solicitados.SetItem(li_existe, "id_vehiculo",il_vehiculo)
		dw_vehiculos_solicitados.SetItem(li_existe, "id_chofer",il_chofer)
		dw_vehiculos_solicitados.SetItem(li_existe, "vehiculo",ls_vehiculo)
		dw_vehiculos_solicitados.SetItem(li_existe, "nombre_chofer",ls_chofer)
	else
		li_row=li_row+1
		dw_vehiculos_solicitados.insertrow(0)
		dw_vehiculos_solicitados.SetItem(li_row, "id_vehiculo",il_vehiculo)	
		dw_vehiculos_solicitados.SetItem(li_row, "id_chofer",il_chofer)	
		dw_vehiculos_solicitados.SetItem(li_row, "vehiculo",ls_vehiculo)	
		dw_vehiculos_solicitados.SetItem(li_row, "nombre_chofer",ls_chofer)	
	end if
/*	
	// El vehículo asignado debe quedar con estatus "2	No disponible" hasta que se desasigne o el usuario lo devuelva ...
	UPDATE	via_cat_vehiculos
	SET		estatus = 2
	WHERE	id = :il_vehiculo
	USING	gtr_cv;
	
	// Actualizar el estatus de la solicitud a "2	Unidad Asignada"...
	UPDATE	via_solicitud_interna
	SET		estatus = 2
	WHERE	sol_id = :il_id
	USING	gtr_cv;
*/
end if

uf_buscar_disponibles()

end event

type dw_choferes_disponibles from u_basedw within w_veh_solicitud_interna_edita
integer x = 4288
integer y = 1020
integer width = 1330
integer height = 100
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_veh_cat_choferes_disponibles_drop"
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;il_chofer=long(this.gettext())

end event

type dw_vehiculos_disponibles from u_basedw within w_veh_solicitud_interna_edita
integer x = 4288
integer y = 812
integer width = 1330
integer height = 100
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_veh_cat_vehiculos_disponibles_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;il_vehiculo=long(this.gettext())
end event

type dw_vehiculos_solicitados from datawindow within w_veh_solicitud_interna_edita
integer x = 4288
integer y = 1320
integer width = 2656
integer height = 456
integer taborder = 100
string title = "none"
string dataobject = "d_veh_solicitudes_vehiculos_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_buscar from commandbutton within w_veh_solicitud_interna_edita
integer x = 5353
integer y = 536
integer width = 1486
integer height = 128
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Buscar vehículos y choferes disponbiles"
boolean default = true
end type

event clicked;uf_buscar_disponibles()
end event

type st_16 from statictext within w_veh_solicitud_interna_edita
integer x = 4288
integer y = 124
integer width = 1257
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Se entregará el vehículo al usuario:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_veh_solicitud_interna_edita
integer x = 1426
integer y = 1788
integer width = 457
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Regresar"
end type

event clicked;CloseWithReturn(w_veh_solicitud_interna_edita,0)
end event

type st_9 from statictext within w_veh_solicitud_interna_edita
integer x = 91
integer y = 2332
integer width = 530
integer height = 172
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Paradas:"
boolean focusrectangle = false
end type

type dw_paradas from datawindow within w_veh_solicitud_interna_edita
integer x = 695
integer y = 2332
integer width = 3447
integer height = 460
string title = "none"
string dataobject = "d_veh_solicitudes_paradas_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within w_veh_solicitud_interna_edita
integer x = 91
integer y = 1924
integer width = 530
integer height = 172
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Unidades solicitadas:"
boolean focusrectangle = false
end type

type dw_unidades from datawindow within w_veh_solicitud_interna_edita
integer x = 695
integer y = 1904
integer width = 3447
integer height = 404
string title = "none"
string dataobject = "d_veh_solicitudes_tipos_vehiculo_edit"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_chofer from checkbox within w_veh_solicitud_interna_edita
integer x = 3611
integer y = 132
integer width = 562
integer height = 80
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Solicita chofer"
end type

type sle_telefono_responsable from singlelineedit within w_veh_solicitud_interna_edita
integer x = 3054
integer y = 1772
integer width = 1088
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_15 from statictext within w_veh_solicitud_interna_edita
integer x = 2053
integer y = 1780
integer width = 1019
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Teléfono y celular responsable:"
boolean focusrectangle = false
end type

type sle_correo_responsable from singlelineedit within w_veh_solicitud_interna_edita
integer x = 3054
integer y = 1644
integer width = 1088
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_14 from statictext within w_veh_solicitud_interna_edita
integer x = 2789
integer y = 1644
integer width = 297
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Correo:"
boolean focusrectangle = false
end type

type sle_nombre_responsable from singlelineedit within w_veh_solicitud_interna_edita
integer x = 695
integer y = 1644
integer width = 2034
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 134217750
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_13 from statictext within w_veh_solicitud_interna_edita
integer x = 91
integer y = 1644
integer width = 503
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Responsable:"
boolean focusrectangle = false
end type

type sle_nombre_solicitante from singlelineedit within w_veh_solicitud_interna_edita
integer x = 695
integer y = 1508
integer width = 2034
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 134217750
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type mle_observaciones from multilineedit within w_veh_solicitud_interna_edita
integer x = 695
integer y = 1168
integer width = 3447
integer height = 324
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_12 from statictext within w_veh_solicitud_interna_edita
integer x = 96
integer y = 1180
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Observaciones:"
boolean focusrectangle = false
end type

type mle_punto_regreso from multilineedit within w_veh_solicitud_interna_edita
integer x = 695
integer y = 816
integer width = 3447
integer height = 204
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within w_veh_solicitud_interna_edita
integer x = 96
integer y = 832
integer width = 617
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Punto de regreso:"
boolean focusrectangle = false
end type

type mle_lugar_destino from multilineedit within w_veh_solicitud_interna_edita
integer x = 695
integer y = 476
integer width = 3447
integer height = 324
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_veh_solicitud_interna_edita
integer x = 96
integer y = 492
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Lugar destino:"
boolean focusrectangle = false
end type

type em_hora_final from editmask within w_veh_solicitud_interna_edita
integer x = 2587
integer y = 124
integer width = 256
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

type em_hora_inicio from editmask within w_veh_solicitud_interna_edita
integer x = 1257
integer y = 124
integer width = 256
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

type em_fecha_final from editmask within w_veh_solicitud_interna_edita
integer x = 2030
integer y = 124
integer width = 521
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_10 from statictext within w_veh_solicitud_interna_edita
integer x = 1582
integer y = 144
integer width = 434
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Fin de viaje:"
boolean focusrectangle = false
end type

type st_7 from statictext within w_veh_solicitud_interna_edita
integer x = 91
integer y = 144
integer width = 558
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Inicio de viaje:"
boolean focusrectangle = false
end type

type em_fecha_inicio from editmask within w_veh_solicitud_interna_edita
integer x = 695
integer y = 128
integer width = 521
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_6 from statictext within w_veh_solicitud_interna_edita
integer x = 2789
integer y = 1516
integer width = 256
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Correo:"
boolean focusrectangle = false
end type

type sle_correo_solicitante from singlelineedit within w_veh_solicitud_interna_edita
integer x = 3054
integer y = 1508
integer width = 1088
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_veh_solicitud_interna_edita
integer x = 91
integer y = 1516
integer width = 503
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Solicitante:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_veh_solicitud_interna_edita
integer x = 91
integer y = 1052
integer width = 581
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Contacto externo:"
boolean focusrectangle = false
end type

type sle_contacto_viaje from singlelineedit within w_veh_solicitud_interna_edita
integer x = 695
integer y = 1036
integer width = 3447
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_usuarios from singlelineedit within w_veh_solicitud_interna_edita
integer x = 3273
integer y = 124
integer width = 270
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_veh_solicitud_interna_edita
integer x = 2935
integer y = 144
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Usuarios:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_veh_solicitud_interna_edita
integer x = 96
integer y = 272
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Punto de origen:"
boolean focusrectangle = false
end type

type mle_punto_origen from multilineedit within w_veh_solicitud_interna_edita
integer x = 695
integer y = 260
integer width = 3447
integer height = 204
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_guardar from commandbutton within w_veh_solicitud_interna_edita
integer x = 4306
integer y = 1852
integer width = 741
integer height = 128
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Guardar"
boolean default = true
end type

event clicked;string ls_diai, ls_mesi, ls_anioi, ls_fecha_inicio, ls_diaf, ls_mesf, ls_aniof, ls_fecha_final
string ls_diae, ls_mese, ls_anioe, ls_fecha_entrega, ls_diad, ls_mesd, ls_aniod, ls_fecha_devolucion
string ls_usuarios, ls_punto_origen, ls_lugar_destino, ls_punto_regreso, ls_contacto_viaje, ls_observaciones
string ls_nombre_solicitante, ls_correo_solicitante, ls_nombre_responsable, ls_correo_responsable, ls_telefono_responsable
datetime ldt_fecha_inicio, ldt_fecha_final, ldt_fecha_entrega, ldt_fecha_devolucion, ldt_ahorita
integer li_chofer, li_disponible=0, li_i, li_id_vehiculo
Date	ld_fecha_hoy
String	ls_de, ls_para[], ls_cc[], ls_asunto, ls_cuerpo, ls_archivo
String	ls_tipo_server
Long		ll_sol_id_traslape = 0, ll_id_vehiculo_traslape = 0

SetPointer ( HourGlass! )

// Obtener la fecha de hoy ...
SELECT	top 1 getdate ()
INTO		:ld_fecha_hoy 
FROM		via_solicitud_interna
USING	gtr_cv;


ldt_ahorita=DateTime(Today(),Now())

ls_diai=mid(em_fecha_inicio.text,1,2)
ls_mesi=mid(em_fecha_inicio.text,4,2)
ls_anioi=mid(em_fecha_inicio.text,7,4)
ls_fecha_inicio=ls_anioi+'/'+ls_mesi+'/'+ls_diai +' '+em_hora_inicio.text

ls_diaf=mid(em_fecha_final.text,1,2)
ls_mesf=mid(em_fecha_final.text,4,2)
ls_aniof=mid(em_fecha_final.text,7,4)
ls_fecha_final=ls_aniof+'/'+ls_mesf+'/'+ls_diaf +' '+em_hora_final.text

ls_usuarios=trim(sle_usuarios.text)
if cbx_chofer.checked=true then li_chofer=1 else li_chofer=0
ls_punto_origen=trim(mle_punto_origen.text)
ls_lugar_destino=trim(mle_lugar_destino.text)
ls_punto_regreso=trim(mle_punto_regreso.text)

ls_contacto_viaje=trim(sle_contacto_viaje.text)
ls_observaciones=trim(mle_observaciones.text)
ls_correo_solicitante=trim(sle_correo_solicitante.text)
ls_correo_responsable=trim(sle_correo_responsable.text)
ls_telefono_responsable=trim(sle_telefono_responsable.text)

ls_diae=mid(em_fecha_entrega.text,1,2)
ls_mese=mid(em_fecha_entrega.text,4,2)
ls_anioe=mid(em_fecha_entrega.text,7,4)
ls_fecha_entrega=ls_anioi+'/'+ls_mesi+'/'+ls_diai +' '+em_hora_entrega.text

ls_diad=mid(em_fecha_devolucion.text,1,2)
ls_mesd=mid(em_fecha_devolucion.text,4,2)
ls_aniod=mid(em_fecha_devolucion.text,7,4)
ls_fecha_devolucion=ls_aniod+'/'+ls_mesd+'/'+ls_diad +' '+em_hora_devolucion.text

ldt_fecha_inicio=datetime(date(em_fecha_inicio.text),time(em_hora_inicio.text))
ldt_fecha_final=datetime(date(em_fecha_final.text),time(em_hora_final.text))
ldt_fecha_entrega=datetime(date(em_fecha_entrega.text),time(em_hora_entrega.text))
ldt_fecha_devolucion=datetime(date(em_fecha_devolucion.text),time(em_hora_devolucion.text))

if ldt_fecha_inicio>=ldt_fecha_final or ldt_fecha_entrega>ldt_fecha_inicio or ldt_fecha_devolucion<ldt_fecha_final then
	messagebox('Aviso','La fecha inicial debe ser menor a la final, la fecha de entrega debe ser mayor a la fecha inicial y la fecha de devolución debe ser mayor a la fecha final de la solicitud')
	return
end if

if len(ls_usuarios)=0 or ls_usuarios='0' or isNumber(ls_usuarios)=false then
	messagebox('Aviso','La cantidad de usuarios debe ser un valor numérico')
	sle_usuarios.SetFocus()
	return
end if

if len(ls_punto_origen)=0 or len(ls_punto_origen)>500 then
	messagebox('Aviso','El punto de origen no puede ser mayor a 500 caracteres')
	mle_punto_origen.SetFocus()
	return
end if

if len(ls_lugar_destino)=0 or len(ls_lugar_destino)>1000 then
	messagebox('Aviso','El lugar destino no puede ser mayor a 1000 caracteres')
	mle_lugar_destino.SetFocus()
	return
end if

if len(ls_punto_regreso)=0 or len(ls_punto_regreso)>500 then
	messagebox('Aviso','El punto de regreso no puede ser mayor a 500 caracteres')
	mle_punto_regreso.SetFocus()
	return
end if

if len(ls_contacto_viaje)=0 or len(ls_contacto_viaje)>200 then
	messagebox('Aviso','El punto de regreso no puede ser mayor a 200 caracteres')
	sle_contacto_viaje.SetFocus()
	return
end if

//if len(ls_observaciones)=0 or len(ls_observaciones)>2000 then
if len(ls_observaciones)>2000 then
	messagebox('Aviso','Las observaciones no pueden ser mayor a 2000 caracteres')
	mle_observaciones.SetFocus()
	return
end if

if len(ls_correo_solicitante)=0 or len(ls_correo_solicitante)>50 then
	messagebox('Aviso','El correo del solicitante no puede ser mayor a 50 caracteres')
	sle_correo_solicitante.SetFocus()
	return
end if

if len(ls_correo_responsable)=0 or len(ls_correo_responsable)>50 then
	messagebox('Aviso','El correo del responsable no puede ser mayor a 50 caracteres')
	sle_correo_responsable.SetFocus()
	return
end if

if len(ls_telefono_responsable)=0 or len(ls_telefono_responsable)>30 then
	messagebox('Aviso','El telefono del responsable no puede ser mayor a 30 caracteres')
	sle_telefono_responsable.SetFocus()
	return
end if

//Validar disponible
//li_disponible=uf_verificar_disponibles()
li_disponible = 1

if li_disponible=1 then
	//FALTA EL QUERY PARA VERIFICAR QUE LOS VEHICULOS Y CHOFERES SIGUEN DISPONIBLES
	ids_solicitud.setitem(1,'fecha_inicio',ldt_fecha_inicio)
	ids_solicitud.setitem(1,'fecha_final',ldt_fecha_final)
	ids_solicitud.setitem(1,'usuarios',long(ls_usuarios))
	ids_solicitud.setitem(1,'chofer',li_chofer)
	ids_solicitud.setitem(1,'punto_origen',ls_punto_origen)
	ids_solicitud.setitem(1,'lugar_destino',ls_lugar_destino)
	ids_solicitud.setitem(1,'punto_regreso',ls_punto_regreso)
	ids_solicitud.setitem(1,'contacto_viaje',ls_contacto_viaje)
	ids_solicitud.setitem(1,'observaciones',ls_observaciones)
	ids_solicitud.setitem(1,'correo_solicitante',ls_correo_solicitante)
	ids_solicitud.setitem(1,'correo_responsable',ls_correo_responsable)
	ids_solicitud.setitem(1,'telefono_responsable',ls_telefono_responsable)
	ids_solicitud.setitem(1,'fecha_estimada_entrega',ldt_fecha_entrega)
	ids_solicitud.setitem(1,'fecha_estimada_devolucion',ldt_fecha_devolucion)
	ids_solicitud.setitem(1,'ultima_modificacion',ldt_ahorita)
	ids_solicitud.setitem(1,'usuario_modificacion',gs_usuario)
	
	if dw_vehiculos_solicitados.Rowcount()>0 then
		ids_solicitud.setitem(1,'estatus',2)
	else
		ids_solicitud.setitem(1,'estatus',1)
	end if

	//if ids_solicitud.update()>0 then
		
		if dw_vehiculos_solicitados.RowCount() = 0 then
			delete from via_sol_vehiculos
			where sol_id = :il_id
			using gtr_cv;
		else
			for li_i=1 to dw_vehiculos_solicitados.RowCount()
				dw_vehiculos_solicitados.setitem(li_i,'sol_id',il_id)
				dw_vehiculos_solicitados.setitem(li_i,'ultima_modificacion',ldt_ahorita)
				dw_vehiculos_solicitados.setitem(li_i,'usuario_modificacion',gs_usuario)
				li_id_vehiculo = dw_vehiculos_solicitados.GetItemNumber ( li_i , 'id_vehiculo' )
				
				// Verificar que las fechas de inicio y fin no se traslapen con los de alguna unidad ya asignada a otra solicitud 
				// con estatus 2 ==> Unidad Asignada ó estatus 3 ==> En proceso ...
				SELECT	top 1 via_solicitud_interna.sol_id,
							via_sol_vehiculos.id_vehiculo
				INTO		:ll_sol_id_traslape,
							:ll_id_vehiculo_traslape
				FROM		via_solicitud_interna,
							via_sol_vehiculos
				WHERE	:ldt_fecha_inicio BETWEEN fecha_inicio AND fecha_final AND
							via_solicitud_interna.estatus IN ( 2 , 3 ) AND
							via_solicitud_interna.sol_id = via_sol_vehiculos.sol_id AND
							via_sol_vehiculos.id_vehiculo = :li_id_vehiculo
							AND via_solicitud_interna.sol_id<>:il_id // se agrega este and para que no tome
																				// en cuenta la misma solicitud
																				// cph 29 nov 2021
							
				USING	gtr_cv;
				
				// aqui cph
				
				IF gtr_cv.SQLCode = 0 and ll_sol_id_traslape > 0 and ll_id_vehiculo_traslape = li_id_vehiculo THEN
					MessageBox ( "Aviso:" , "La fecha y horario de inicio de la solicitud actual coinciden con el horario de la solicitud " + String ( ll_sol_id_traslape ) + "~n~r~n~r Por favor, verifique el horario.")
					RollBack using gtr_cv;
					Return
				END IF
				
				SELECT	top 1 via_solicitud_interna.sol_id,
							via_sol_vehiculos.id_vehiculo
				INTO		:ll_sol_id_traslape,
							:ll_id_vehiculo_traslape
				FROM		via_solicitud_interna,
							via_sol_vehiculos
				WHERE	:ldt_fecha_final BETWEEN fecha_inicio AND fecha_final AND
							via_solicitud_interna.estatus IN ( 2 , 3 ) AND
							via_solicitud_interna.sol_id = via_sol_vehiculos.sol_id AND
							via_sol_vehiculos.id_vehiculo = :li_id_vehiculo
							AND via_solicitud_interna.sol_id<>:il_id // se agrega este and para que no tome
																				// en cuenta la misma solicitud
																				// cph 29 nov 2021
				USING	gtr_cv;
				
//			
				
				IF gtr_cv.SQLCode = 0 and ll_sol_id_traslape > 0 and ll_id_vehiculo_traslape = li_id_vehiculo THEN
					MessageBox ( "Aviso:" , "La fecha y horario final de la solicitud actual coinciden con el horario de la solicitud " + String ( ll_sol_id_traslape ) + "~n~r~n~r Por favor, verifique el horario.")
					RollBack using gtr_cv;
					Return
				END IF
				
				SELECT	top 1 via_solicitud_interna.sol_id,
							via_sol_vehiculos.id_vehiculo
				INTO		:ll_sol_id_traslape,
							:ll_id_vehiculo_traslape
				FROM		via_solicitud_interna,
							via_sol_vehiculos
				WHERE	(
								fecha_inicio BETWEEN :ldt_fecha_inicio AND :ldt_fecha_final AND
								fecha_final BETWEEN :ldt_fecha_inicio AND :ldt_fecha_final
							) AND
							via_solicitud_interna.estatus IN ( 2 , 3 ) AND
							via_solicitud_interna.sol_id = via_sol_vehiculos.sol_id AND
							via_sol_vehiculos.id_vehiculo = :li_id_vehiculo
							AND via_solicitud_interna.sol_id<>:il_id // se agrega este and para que no tome
																				// en cuenta la misma solicitud
																				// cph 29 nov 2021
							
				USING	gtr_cv;
				
				IF gtr_cv.SQLCode = 0 and ll_sol_id_traslape > 0 and ll_id_vehiculo_traslape = li_id_vehiculo THEN
					MessageBox ( "Aviso:" , "La fecha y horario de la solicitud " + String ( ll_sol_id_traslape ) + " coinciden con el horario de la solicitud actual~n~r~n~r Por favor, verifique el horario.")
					RollBack using gtr_cv;
					Return
				END IF
				/*
				IF ld_fecha_hoy = Date ( ldt_fecha_inicio ) THEN
					UPDATE	via_cat_vehiculos
					SET		estatus = 2
					WHERE	id = :li_id_vehiculo
					USING	gtr_cv;
				END IF
				*/
			next
			dw_vehiculos_solicitados.update()
			
		end if
		
		commit using gtr_cv;
		
		if dw_vehiculos_solicitados.Rowcount()>0 then
			n_smtpmail	luo_mail
			luo_mail = create n_smtpmail
			
			dw_solicitud_unidad_asignada.Reset ()
			dw_solicitud_unidad_asignada.SetTransObject ( gtr_cv )
			dw_solicitud_unidad_asignada.Retrieve ( il_id )
//			ls_archivo = "Datos del viaje - folio " + String ( il_id ) + ".pdf"
//			ls_archivo = "datos_viaje.pdf"
			ls_archivo = ""

//			IF FileExists ( ls_archivo ) THEN
//				FileDelete ( ls_archivo )
//			END IF
			
//			Long	ll_saveas
//			ll_saveas = dw_solicitud_unidad_asignada.SaveAs( ls_archivo, PDF!, FALSE)
/*
			// Con Adobe PDF
			st_esperar.Visible = True
			dw_solicitud_unidad_asignada.Object.DataWindow.Printer = "Adobe PDF"
			dw_solicitud_unidad_asignada.print( False , False )
			SetPointer ( HourGlass! )
			Sleep ( 7 )
*/
//			// Con PDFCreator
			st_esperar.Visible = True
//			dw_solicitud_unidad_asignada.Object.DataWindow.Printer = "PDFCreator"
//			dw_solicitud_unidad_asignada.print(true)
//			SetPointer ( HourGlass! )
//			Sleep ( 20 )

//	No jala con GhostScript 8.70 *****
//			Long	ll_saveas
//			dw_solicitud_unidad_asignada.Object.DataWindow.Export.PDF.Method = Distill!
//			dw_solicitud_unidad_asignada.Object.DataWindow.Printer = 'Sybase DataWindow PS'
//			dw_solicitud_unidad_asignada.Object.DataWindow.Export.PDF.Distill.CustomPostScript= "1"
//			ll_saveas = dw_solicitud_unidad_asignada.SaveAs( ls_archivo, PDF!, FALSE)
			
			
			ls_tipo_server = Upper ( gtr_cv.dbparm )
			IF Pos ( ls_tipo_server , 'SQLWEBDES' ) > 0 OR Pos ( ls_tipo_server , 'SQLWEBPRU' ) > 0 THEN
//				ls_de = 'desarrollo33@ibero.mx'
	//			ls_para [ 1 ] = 'desarrollo33@ibero.mx'
	//			ls_cc [ 1 ] = 'fernando.ochoa@ibero.mx'
	//			ls_cc [ 2 ] = 'sergio.loza@ibero.mx'
				
				ls_de = 'desarrollo29@ibero.mx' // cph nov 2021
				ls_para [ 1 ] = 'cesar.ponce@tijuana.ibero.mx'
				ls_cc [ 1 ] = 'cponcehdz@yahoo.com'
				ls_cc [ 2 ] = 'cponcehdz@gmail.com'				
			ELSE
				ls_de = 'control.vehicular@ibero.mx'
				ls_para [ 1 ] = ls_correo_solicitante
				IF Not IsNull ( ls_correo_responsable ) AND ls_correo_responsable <> '' THEN
					ls_para [ 2 ] = ls_correo_responsable
				END IF
				ls_cc [ 1 ] = 'controlvehiculard@ibero.mx'
			END IF
			
			ls_asunto = "La solicitud con folio " + String ( il_id ) + " fue aprobada."
			wf_crea_cuerpo_html ( ls_cuerpo )
			
			IF luo_mail.of_enviamail ( ls_de , ls_para [] , ls_cc [ ] , ls_asunto , ls_cuerpo , ls_archivo ) =  -1 THEN
				MessageBox ( "Aviso:" , "Se presentó un error al enviar la notificación por coreo" )
			END IF
			
			Destroy luo_mail

			//FileDelete ( ls_archivo )
			st_esperar.Visible = False
			SetPointer ( Arrow! )
			
		end if
	
		if ids_solicitud.update()>0 then
		
		else
			messagebox("Error: "+gtr_cv.sqlerrtext,"La solicitud no fue actualizada.",stopsign!)
			rollback using gtr_cv;
			SetPointer ( Arrow! )
		end if
	
		messagebox('Aviso','La solicitud fue actualizada')
		
		SetPointer ( Arrow! )
		CloseWithReturn(w_veh_solicitud_interna_edita,0)
	
else
	SetPointer ( Arrow! )
	return
end if


end event

type gb_titulo from groupbox within w_veh_solicitud_interna_edita
integer x = 50
integer y = 44
integer width = 4155
integer height = 2796
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Edición de solicitud"
end type

type gb_1 from groupbox within w_veh_solicitud_interna_edita
integer x = 4242
integer y = 44
integer width = 2770
integer height = 2796
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
end type

type st_17 from statictext within w_veh_solicitud_interna_edita
integer x = 4288
integer y = 408
integer width = 1161
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "El usuario devolverá el vehículo:"
boolean focusrectangle = false
end type

type em_hora_devolucion from editmask within w_veh_solicitud_interna_edita
integer x = 4846
integer y = 524
integer width = 256
integer height = 112
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

type em_hora_entrega from editmask within w_veh_solicitud_interna_edita
integer x = 4855
integer y = 232
integer width = 256
integer height = 112
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

type em_fecha_entrega from editmask within w_veh_solicitud_interna_edita
integer x = 4288
integer y = 236
integer width = 521
integer height = 112
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type em_fecha_devolucion from editmask within w_veh_solicitud_interna_edita
integer x = 4288
integer y = 524
integer width = 521
integer height = 112
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

