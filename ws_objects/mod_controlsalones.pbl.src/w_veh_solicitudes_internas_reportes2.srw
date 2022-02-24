$PBExportHeader$w_veh_solicitudes_internas_reportes2.srw
forward
global type w_veh_solicitudes_internas_reportes2 from window
end type
type em_fecha_final from editmask within w_veh_solicitudes_internas_reportes2
end type
type st_2 from statictext within w_veh_solicitudes_internas_reportes2
end type
type st_5 from statictext within w_veh_solicitudes_internas_reportes2
end type
type em_fecha_inicio from editmask within w_veh_solicitudes_internas_reportes2
end type
type dw_cat_estatus_solicitud from datawindow within w_veh_solicitudes_internas_reportes2
end type
type cb_filtros from commandbutton within w_veh_solicitudes_internas_reportes2
end type
type gb_filtros from groupbox within w_veh_solicitudes_internas_reportes2
end type
type dw_solicitudes from datawindow within w_veh_solicitudes_internas_reportes2
end type
type gb_titulo from groupbox within w_veh_solicitudes_internas_reportes2
end type
type st_1 from statictext within w_veh_solicitudes_internas_reportes2
end type
type sle_sol_id from singlelineedit within w_veh_solicitudes_internas_reportes2
end type
type st_4 from statictext within w_veh_solicitudes_internas_reportes2
end type
end forward

global type w_veh_solicitudes_internas_reportes2 from window
integer width = 7141
integer height = 2408
boolean titlebar = true
string title = "Solicitudes intentas de vehículos"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
em_fecha_final em_fecha_final
st_2 st_2
st_5 st_5
em_fecha_inicio em_fecha_inicio
dw_cat_estatus_solicitud dw_cat_estatus_solicitud
cb_filtros cb_filtros
gb_filtros gb_filtros
dw_solicitudes dw_solicitudes
gb_titulo gb_titulo
st_1 st_1
sle_sol_id sle_sol_id
st_4 st_4
end type
global w_veh_solicitudes_internas_reportes2 w_veh_solicitudes_internas_reportes2

type variables
integer ii_id
end variables

forward prototypes
public function integer f_ultimo_id ()
public subroutine uf_verificar_disponibles ()
end prototypes

public function integer f_ultimo_id ();integer li_id

select isnull(max(id),0)
into :li_id
from dbo.via_cat_servicios
using gtr_cv; 

if gtr_cv.SQLCode = -1 then 
	messagebox("Error WEB: Obtener id", gtr_cv.SQLErrText)	
	rollback using gtr_cv;
	return -1
else
	commit using gtr_cv;	
end if

return(li_id)
end function

public subroutine uf_verificar_disponibles ();integer li_i, li_disponible=1, li_j
long ll_vehiculo, ll_chofer, ll_sol_id
string ls_find='',ls_vehiculo, ls_chofer
datetime ldt_fecha_entrega, ldt_fecha_devolucion

//Vehiculos solicitud
datastore lds_vehiculos
lds_vehiculos =  create datastore
lds_vehiculos.dataobject ='d_veh_solicitudes_vehiculos_edit'
lds_vehiculos.settransobject(gtr_cv)

//Vehículos disponibles
datastore lds_vehiculo
lds_vehiculo =  create datastore
lds_vehiculo.dataobject ='d_veh_cat_vehiculos_disponibles_lista'
lds_vehiculo.settransobject(gtr_cv)

//Choferes disponibles
datastore lds_chofer
lds_chofer =  create datastore
lds_chofer.dataobject ='d_veh_cat_choferes_disponibles_lista'
lds_chofer.settransobject(gtr_cv)


for li_i=1 to dw_solicitudes.RowCount()

	ldt_fecha_entrega=dw_solicitudes.GetItemDatetime(li_i,'fecha_estimada_entrega')
	ldt_fecha_devolucion=dw_solicitudes.GetItemDatetime(li_i,'fecha_estimada_devolucion')
	ll_sol_id=dw_solicitudes.GetItemNumber(li_i,'sol_id')
	lds_vehiculo.Retrieve(ll_sol_id,ldt_fecha_entrega,ldt_fecha_devolucion)
	lds_chofer.Retrieve(ll_sol_id,ldt_fecha_entrega,ldt_fecha_devolucion)
	lds_vehiculos.Retrieve(ll_sol_id)

	for li_j=1 to lds_vehiculos.RowCount()
		ll_vehiculo=lds_vehiculos.GetItemNumber(li_j,'id_vehiculo')
		ls_vehiculo=lds_vehiculos.GetItemString(li_j,'vehiculo')
		ll_chofer=lds_vehiculos.GetItemNumber(li_j,'id_chofer')
		ls_chofer=lds_vehiculos.GetItemString(li_j,'nombre_chofer')
	
		//Vehículo
		li_disponible=0
		ls_find="id="+string(ll_vehiculo)
		li_disponible=lds_vehiculo.Find(ls_find,1,lds_vehiculo.RowCount())	
		
		if li_disponible=0 then
			//El vehículo ya no está disponible
			dw_solicitudes.SetItem(li_i, "color",1)
		end if

		//Chofer
		if ll_chofer>0 then
			li_disponible=0
			ls_find="id="+string(ll_chofer)
			li_disponible=lds_chofer.Find(ls_find,1,lds_chofer.RowCount())
			
			if li_disponible=0 then
				//El chofer ya no está disponible
				dw_solicitudes.SetItem(li_i, "color",1)
			end if
		end if


next

/*
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

*/
next
end subroutine

on w_veh_solicitudes_internas_reportes2.create
this.em_fecha_final=create em_fecha_final
this.st_2=create st_2
this.st_5=create st_5
this.em_fecha_inicio=create em_fecha_inicio
this.dw_cat_estatus_solicitud=create dw_cat_estatus_solicitud
this.cb_filtros=create cb_filtros
this.gb_filtros=create gb_filtros
this.dw_solicitudes=create dw_solicitudes
this.gb_titulo=create gb_titulo
this.st_1=create st_1
this.sle_sol_id=create sle_sol_id
this.st_4=create st_4
this.Control[]={this.em_fecha_final,&
this.st_2,&
this.st_5,&
this.em_fecha_inicio,&
this.dw_cat_estatus_solicitud,&
this.cb_filtros,&
this.gb_filtros,&
this.dw_solicitudes,&
this.gb_titulo,&
this.st_1,&
this.sle_sol_id,&
this.st_4}
end on

on w_veh_solicitudes_internas_reportes2.destroy
destroy(this.em_fecha_final)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.em_fecha_inicio)
destroy(this.dw_cat_estatus_solicitud)
destroy(this.cb_filtros)
destroy(this.gb_filtros)
destroy(this.dw_solicitudes)
destroy(this.gb_titulo)
destroy(this.st_1)
destroy(this.sle_sol_id)
destroy(this.st_4)
end on

event open;Date	ld_fecha_hoy
Date		ld_fecha_previa_hoy
Int			li_renglon_encontrado
Boolean	lb_renglon_previo_encontrado = True


// Obtener la fecha de hoy ...
SELECT	top 1 getdate ()
INTO		:ld_fecha_hoy 
FROM		via_solicitud_interna
USING	gtr_cv;

// Obtener la fecha de la solicitud previa al día de hoy ...
SELECT		TOP 1 Convert ( Date , fecha_inicio )
INTO			:ld_fecha_previa_hoy
FROM			via_solicitud_interna
WHERE		convert ( DATE , fecha_inicio ) < convert ( DATE , getdate () )
ORDER BY	fecha_inicio DESC
USING		gtr_cv;

IF gtr_cv.SQLCode = 100 THEN
	lb_renglon_previo_encontrado = False
END IF

dw_solicitudes.settransobject(gtr_cv)
dw_solicitudes.Retrieve(0)

IF dw_solicitudes.RowCount ( ) > 0 THEN
	li_renglon_encontrado = dw_solicitudes.Find("String ( fecha_inicio , 'dd-mm-yyyy' ) = '" + String ( ld_fecha_hoy , 'dd-mm-yyyy' ) + "'", 1, dw_solicitudes.RowCount ( ) )
	
	// Buscar y posicionarse en el primer registro con fecha de hoy ...
	IF li_renglon_encontrado > 0 THEN
		dw_solicitudes.ScrollToRow ( li_renglon_encontrado )
		dw_solicitudes.SetRow ( li_renglon_encontrado )
		dw_solicitudes.SelectRow ( 0 , False )
		dw_solicitudes.SelectRow ( li_renglon_encontrado , True )
	END IF
	
	// Buscar y posicionarse en el primer registro con fecha menor de hoy ...
	IF li_renglon_encontrado = 0 and lb_renglon_previo_encontrado THEN
		li_renglon_encontrado = dw_solicitudes.Find("String ( fecha_inicio , 'dd-mm-yyyy' ) = '" + String ( ld_fecha_previa_hoy , 'dd-mm-yyyy' ) + "'", 1, dw_solicitudes.RowCount ( ) )
		
		// Buscar y posicionarse en el primer registro con fecha de hoy ...
		IF li_renglon_encontrado > 0 THEN
			dw_solicitudes.ScrollToRow ( li_renglon_encontrado )
			dw_solicitudes.SetRow ( li_renglon_encontrado )
			dw_solicitudes.SelectRow ( 0 , False )
			dw_solicitudes.SelectRow ( li_renglon_encontrado , True )
		END IF
	END IF
END IF
		
dw_cat_estatus_solicitud.SetTransObject ( gtr_cv )
dw_cat_estatus_solicitud.InsertRow ( 0 )

uf_verificar_disponibles()

end event

type em_fecha_final from editmask within w_veh_solicitudes_internas_reportes2
event ue_salida pbm_enchange
integer x = 1458
integer y = 468
integer width = 480
integer height = 84
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
string mask = "dd-mm-yyyy"
boolean dropdowncalendar = true
end type

event ue_salida;IF Text = "" THEN
	dw_solicitudes.SetFilter ( "" )
ELSE
	dw_solicitudes.SetFilter ( "fecha_inicio between date('" + em_fecha_inicio.text + "') and relativedate(date('" + Text + "'),1)"  )
END IF

dw_solicitudes.Filter ( )

dw_solicitudes.SetSort("fecha_inicio D , sol_id D")
dw_solicitudes.Sort ( )
end event

type st_2 from statictext within w_veh_solicitudes_internas_reportes2
integer x = 1298
integer y = 476
integer width = 133
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "y :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_veh_solicitudes_internas_reportes2
integer x = 183
integer y = 476
integer width = 576
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Fecha inicio entre:"
boolean focusrectangle = false
end type

type em_fecha_inicio from editmask within w_veh_solicitudes_internas_reportes2
event ue_prueba pbm_enchange
integer x = 768
integer y = 468
integer width = 480
integer height = 84
integer taborder = 20
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
string mask = "dd-mm-yyyy"
boolean dropdowncalendar = true
end type

event ue_prueba;IF Text = "" THEN
	dw_solicitudes.SetFilter ( "" )
ELSE
	
	em_fecha_final.text = String(today(),'dd-mm-yyyy')
	dw_solicitudes.SetFilter ( "fecha_inicio between date('" + Text + "') and relativedate(date('" + em_fecha_final.text + "'),1)"  )
END IF

dw_solicitudes.Filter ( )

dw_solicitudes.SetSort("fecha_inicio D , sol_id D")
dw_solicitudes.Sort ( )
end event

type dw_cat_estatus_solicitud from datawindow within w_veh_solicitudes_internas_reportes2
integer x = 1312
integer y = 276
integer width = 1243
integer height = 100
integer taborder = 60
string title = "none"
string dataobject = "d_veh_cat_estatus_solicitud_desc"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;
IF data = "" THEN
	dw_solicitudes.SetFilter ( "" )
ELSE
	dw_solicitudes.SetFilter ( "Upper ( descr_estatus ) like '%" + Upper ( data ) + "%'" )
END IF

dw_solicitudes.Filter ( )

dw_solicitudes.SetSort("fecha_inicio D , sol_id D")
dw_solicitudes.Sort ( )
end event

type cb_filtros from commandbutton within w_veh_solicitudes_internas_reportes2
integer x = 2615
integer y = 272
integer width = 503
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "L&impiar filtros"
end type

event clicked;sle_sol_id.Text = ""
em_fecha_inicio.Text = "00-00-0000"
em_fecha_final.Text = "00-00-0000"
dw_cat_estatus_solicitud.Reset ( )
dw_cat_estatus_solicitud.SetTransObject ( gtr_cv )
dw_cat_estatus_solicitud.InsertRow ( 0 )
end event

type gb_filtros from groupbox within w_veh_solicitudes_internas_reportes2
integer x = 114
integer y = 164
integer width = 3205
integer height = 464
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Filtros"
end type

type dw_solicitudes from datawindow within w_veh_solicitudes_internas_reportes2
integer x = 91
integer y = 804
integer width = 6894
integer height = 1340
integer taborder = 60
string title = "none"
string dataobject = "d_veh_solicitudes_adm_reporte2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow>0 then ii_id=dw_solicitudes.GetItemNumber(currentrow,'sol_id')

SelectRow ( 0 , False )
SelectRow ( CurrentRow , True )
end event

event doubleclicked;integer li_respuesta, li_estatus
long ll_id

if row>0 then
	li_estatus=this.GetItemNumber(row,'estatus')
	if isvalid(w_veh_solicitud_interna_reporte2) then close(w_veh_solicitud_interna_reporte2) 
	ll_id=this.GetItemNumber(row,'sol_id')
	openwithparm(w_veh_solicitud_interna_reporte2,ll_id)
	//li_respuesta=Message.DoubleParm
	//this.Retrieve(0)

end if
end event

event buttonclicked;integer li_respuesta, li_estatus
long ll_id

if row>0 then
	li_estatus=this.GetItemNumber(row,'estatus')
	if isvalid(w_veh_solicitud_interna_reporte2) then close(w_veh_solicitud_interna_reporte2) 
	ll_id=this.GetItemNumber(row,'sol_id')
	openwithparm(w_veh_solicitud_interna_reporte2,ll_id)
	//li_respuesta=Message.DoubleParm
	//this.Retrieve(0)

end if
end event

type gb_titulo from groupbox within w_veh_solicitudes_internas_reportes2
integer x = 50
integer y = 40
integer width = 6994
integer height = 2180
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Solicitudes internas de vehiculos - Reporte"
end type

type st_1 from statictext within w_veh_solicitudes_internas_reportes2
integer x = 183
integer y = 292
integer width = 361
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Folio:"
boolean focusrectangle = false
end type

type sle_sol_id from singlelineedit within w_veh_solicitudes_internas_reportes2
event ue_enchange pbm_enchange
integer x = 416
integer y = 288
integer width = 352
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event ue_enchange;IF Text = "" THEN
	dw_solicitudes.SetFilter ( "" )
ELSE
	dw_solicitudes.SetFilter ( "String ( sol_id ) like '%" + Text + "%'" )
END IF

dw_solicitudes.Filter ( )

dw_solicitudes.SetSort("fecha_inicio D , sol_id D")
dw_solicitudes.Sort ( )
end event

type st_4 from statictext within w_veh_solicitudes_internas_reportes2
integer x = 1029
integer y = 292
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Estatus:"
boolean focusrectangle = false
end type

