$PBExportHeader$w_ing_carta_solicitud.srw
forward
global type w_ing_carta_solicitud from window
end type
type ddlb_firma from dropdownlistbox within w_ing_carta_solicitud
end type
type st_3 from statictext within w_ing_carta_solicitud
end type
type rb_profesor from radiobutton within w_ing_carta_solicitud
end type
type cb_1 from commandbutton within w_ing_carta_solicitud
end type
type cb_generar from commandbutton within w_ing_carta_solicitud
end type
type st_2 from statictext within w_ing_carta_solicitud
end type
type st_1 from statictext within w_ing_carta_solicitud
end type
type mle_observaciones from multilineedit within w_ing_carta_solicitud
end type
type sle_motivo from singlelineedit within w_ing_carta_solicitud
end type
type dw_inventario_disponible from datawindow within w_ing_carta_solicitud
end type
type cbx_todos from checkbox within w_ing_carta_solicitud
end type
type cb_eliminar from commandbutton within w_ing_carta_solicitud
end type
type st_nombre from statictext within w_ing_carta_solicitud
end type
type dw_solicitados from datawindow within w_ing_carta_solicitud
end type
type dw_disponible from datawindow within w_ing_carta_solicitud
end type
type dw_matgrupo from u_basedw within w_ing_carta_solicitud
end type
type dw_grupomat from u_basedw within w_ing_carta_solicitud
end type
type st_material from statictext within w_ing_carta_solicitud
end type
type st_grupo from statictext within w_ing_carta_solicitud
end type
type cb_buscar from commandbutton within w_ing_carta_solicitud
end type
type st_final from statictext within w_ing_carta_solicitud
end type
type st_inicio from statictext within w_ing_carta_solicitud
end type
type sle_solicitante from singlelineedit within w_ing_carta_solicitud
end type
type cbx_intercambio from checkbox within w_ing_carta_solicitud
end type
type rb_alumno from radiobutton within w_ing_carta_solicitud
end type
type gb_material from groupbox within w_ing_carta_solicitud
end type
type gb_disponible from groupbox within w_ing_carta_solicitud
end type
type gb_seleccionado from groupbox within w_ing_carta_solicitud
end type
type gb_solicitud from groupbox within w_ing_carta_solicitud
end type
type dw_carta from datawindow within w_ing_carta_solicitud
end type
type em_fecha_inicio from editmask within w_ing_carta_solicitud
end type
type em_fecha_final from editmask within w_ing_carta_solicitud
end type
type gb_1 from groupbox within w_ing_carta_solicitud
end type
end forward

global type w_ing_carta_solicitud from window
integer width = 3185
integer height = 2582
boolean titlebar = true
string title = "Carta de Solicitud de Préstamo"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
ddlb_firma ddlb_firma
st_3 st_3
rb_profesor rb_profesor
cb_1 cb_1
cb_generar cb_generar
st_2 st_2
st_1 st_1
mle_observaciones mle_observaciones
sle_motivo sle_motivo
dw_inventario_disponible dw_inventario_disponible
cbx_todos cbx_todos
cb_eliminar cb_eliminar
st_nombre st_nombre
dw_solicitados dw_solicitados
dw_disponible dw_disponible
dw_matgrupo dw_matgrupo
dw_grupomat dw_grupomat
st_material st_material
st_grupo st_grupo
cb_buscar cb_buscar
st_final st_final
st_inicio st_inicio
sle_solicitante sle_solicitante
cbx_intercambio cbx_intercambio
rb_alumno rb_alumno
gb_material gb_material
gb_disponible gb_disponible
gb_seleccionado gb_seleccionado
gb_solicitud gb_solicitud
dw_carta dw_carta
em_fecha_inicio em_fecha_inicio
em_fecha_final em_fecha_final
gb_1 gb_1
end type
global w_ing_carta_solicitud w_ing_carta_solicitud

type variables
long il_solicitante
string is_solicitantenom, is_autoriza

integer ii_anio, ii_periodo, ii_tipo_usuario

datetime idt_fecha_inicio, idt_fecha_final

DatawindowChild idwc_grupomat, idwc_matgrupo

integer il_cvegrupo
string is_cvemat
end variables

forward prototypes
public function string uf_mes (integer p_mes)
public subroutine f_agregar_material (str_sol_material pstr_sol_material, long p_folio_presol, integer p_rowdis)
public subroutine f_reset ()
public subroutine f_generar_solicitud ()
public function long f_insert_solicitud ()
public function long f_insert_solicitante (long p_folio)
public function long f_insert_material (integer p_row, long p_folio, ref integer p_cantidad_prestada, ref long p_folio_presol, ref long p_consec_presol)
public subroutine f_carta (long p_folio)
public function integer f_valida_alumno (string p_cuenta)
public function integer f_valida_alumno_intercambio (string p_cuenta)
public function integer f_valida_empleado (string p_cuenta)
end prototypes

public function string uf_mes (integer p_mes);string ls_mes


choose case p_mes
	case 1
		ls_mes='enero'
	case 2
		ls_mes='febrero'
	case 3
		ls_mes='marzo'
	case 4
		ls_mes='abril'		
	case 5
		ls_mes='mayo'
	case 6
		ls_mes='junio'
	case 7
		ls_mes='julio'
	case 8
		ls_mes='agosto'				
	case 9
		ls_mes='septiembre'
	case 10
		ls_mes='octubre'
	case 11
		ls_mes='noviembre'
	case 12
		ls_mes='deciembre'				
end choose


return(ls_mes)
end function

public subroutine f_agregar_material (str_sol_material pstr_sol_material, long p_folio_presol, integer p_rowdis);string ls_find=''
integer li_existe=0, li_row, li_i, li_nuevo, li_maximo, li_exacto=0, li_agregar, li_status
datastore lds_presolicitados

if pstr_sol_material.tipo_unidad=1 then 

	//Tipo 1 Consumible

	//Verificar que no esté allá abajo en los solicitados
	ls_find="cvegrupo="+string(pstr_sol_material.cvegrupo)+" and cvematerial='"+pstr_sol_material.cvematerial+"' and num_serie='"+string(pstr_sol_material.num_serie)+"'"
	li_agregar=dw_solicitados.Find(ls_find,1,dw_solicitados.RowCount())
	
	
	li_row=dw_solicitados.RowCount()
	
	//Actualizar las fechas de los demás materiales
	for li_i=1 to li_row
		dw_solicitados.SetItem(li_i, "fecha_inicio",pstr_sol_material.fecha_inicio)
		dw_solicitados.SetItem(li_i, "fecha_final",pstr_sol_material.fecha_final)	
	next
	
	
	//Buscar un material PreSolicitado para intercambiar
	li_existe=0
	ls_find="cvegrupo="+string(pstr_sol_material.cvegrupo)+" and cvematerial='"+pstr_sol_material.cvematerial+"' and status=-1"
	li_existe=dw_solicitados.Find(ls_find,1,dw_solicitados.RowCount())
	
	if li_existe>0 then
	
		ls_find="cvegrupo="+string(pstr_sol_material.cvegrupo)+" and cvematerial='"+pstr_sol_material.cvematerial+"' and num_serie_presol='"+pstr_sol_material.num_serie +"'and status=-1"
		li_exacto=dw_solicitados.Find(ls_find,1,dw_solicitados.RowCount())
		if li_exacto>0 then li_existe=li_exacto
		
		//Sustituir
		dw_solicitados.SetItem(li_existe, "num_serie",pstr_sol_material.num_serie)
		dw_solicitados.SetItem(li_existe, "status",pstr_sol_material.status)
		dw_solicitados.SetItem(li_existe, "nomstatus",pstr_sol_material.nomstatus)
		dw_solicitados.SetItem(li_existe, "cod_uia",pstr_sol_material.cod_uia)
		dw_solicitados.SetItem(li_existe, "costo_mat",pstr_sol_material.costo_mat)
		dw_solicitados.SetItem(li_existe, "tipo_unidad",pstr_sol_material.tipo_unidad)
		dw_solicitados.SetItem(li_existe, "cantidad",pstr_sol_material.cantidad)
		dw_solicitados.SetItem(li_existe, "merma",pstr_sol_material.merma)
		dw_solicitados.SetItem(li_existe, "cbox",0)	
		dw_solicitados.SetItem(li_existe, "color",0)
		
	else
		
		if li_agregar>0 then
			
			//Actualizar cantidad
			dw_solicitados.SetItem(li_agregar, "tipo_unidad",pstr_sol_material.tipo_unidad)
			dw_solicitados.SetItem(li_agregar, "cantidad",dw_solicitados.GetItemNumber(li_agregar, "cantidad")+pstr_sol_material.cantidad)
			dw_solicitados.SetItem(li_agregar, "cbox",0)	
			
		else

			//Agregar el material
			li_nuevo=li_row+1
			dw_solicitados.insertrow(0)
			dw_solicitados.SetItem(li_nuevo, "cvedepto",pstr_sol_material.cvedepto)	
			dw_solicitados.SetItem(li_nuevo, "cvearea",pstr_sol_material.cvearea)
			dw_solicitados.SetItem(li_nuevo, "cvegrupo",pstr_sol_material.cvegrupo)
			dw_solicitados.SetItem(li_nuevo, "cvematerial",pstr_sol_material.cvematerial)
			dw_solicitados.SetItem(li_nuevo, "num_serie",pstr_sol_material.num_serie)
			dw_solicitados.SetItem(li_nuevo, "nommaterial",pstr_sol_material.nommaterial)
			dw_solicitados.SetItem(li_nuevo, "status",pstr_sol_material.status)
			dw_solicitados.SetItem(li_nuevo, "nomstatus",pstr_sol_material.nomstatus)
			dw_solicitados.SetItem(li_nuevo, "fecha_inicio",pstr_sol_material.fecha_inicio)
			dw_solicitados.SetItem(li_nuevo, "fecha_final",pstr_sol_material.fecha_final)
			dw_solicitados.SetItem(li_nuevo, "cod_uia",pstr_sol_material.cod_uia)
			dw_solicitados.SetItem(li_nuevo, "tipo_unidad",pstr_sol_material.tipo_unidad)	
			dw_solicitados.SetItem(li_nuevo, "cantidad",pstr_sol_material.cantidad)	
			dw_solicitados.SetItem(li_nuevo, "merma",0)	
			dw_solicitados.SetItem(li_nuevo, "folio_presol",pstr_sol_material.folio_presol)
			dw_solicitados.SetItem(li_nuevo, "costo_mat",pstr_sol_material.costo_mat)
			dw_solicitados.SetItem(li_nuevo, "consec_presol",pstr_sol_material.consec_presol)
			dw_solicitados.SetItem(li_nuevo, "cbox",0)
		
		end if
		
	end if

	dw_solicitados.SetSort("#8A #6A")
	dw_solicitados.Sort()
	
	//Hacer NO disponible en el inventario
	
//	ls_find="spre_inventario_cvegrupo="+string(pstr_sol_material.cvegrupo)+" and spre_inventario_cvematerial='"+pstr_sol_material.cvematerial+"' and spre_inventario_num_serie='"+string(pstr_sol_material.num_serie)+"'"
//	li_existe=dw_inventario_disponible.Find(ls_find,1,dw_inventario_disponible.RowCount())
//	
//	if li_existe>0 then 
//		dw_inventario_disponible.SetItem(li_existe,'cantidad_marcada',dw_inventario_disponible.GetItemNumber(li_existe,'cantidad_marcada') +pstr_sol_material.cantidad)
//		if dw_inventario_disponible.GetItemNumber(li_existe,'cantidad') <= dw_inventario_disponible.GetItemNumber(li_existe,'cantidad_marcada') then &
//		dw_inventario_disponible.SetItem(li_existe,'marcado',1)
//	end if
	
	cb_eliminar.enabled=true
	cb_generar.enabled=true
	
	if p_rowdis>0 then 
		dw_disponible.SetItem(p_rowdis,'cantidad',dw_disponible.GetItemNumber(p_rowdis,'cantidad') - pstr_sol_material.cantidad) 
		if dw_disponible.GetItemNumber(p_rowdis,'cantidad')<=0 then dw_disponible.DeleteRow(p_rowdis)
	end if
		
	
else

	//Tipo 0 Unidad

	
	//Verificar que no esté allá abajo en los solicitados
	
	ls_find="cvegrupo="+string(pstr_sol_material.cvegrupo)+" and cvematerial='"+pstr_sol_material.cvematerial+"' and num_serie='"+string(pstr_sol_material.num_serie)+"'"
	li_existe=dw_solicitados.Find(ls_find,1,dw_solicitados.RowCount())
	
	if li_existe>0 then
		li_status=dw_solicitados.GetItemNumber(li_existe,'status')
		if li_status<>-1 then
			messagebox('Atención','No puede reservar el mismo material dos veces.',Exclamation!)
			return
		end if
	end if
	
	
	li_row=dw_solicitados.RowCount()
	
	//Actualizar las fechas de los demás materiales
	for li_i=1 to li_row
		dw_solicitados.SetItem(li_i, "fecha_inicio",pstr_sol_material.fecha_inicio)
		dw_solicitados.SetItem(li_i, "fecha_final",pstr_sol_material.fecha_final)	
	next
	
	
	//Buscar un material PreSolicitado para intercambiar
	li_existe=0

	if pstr_sol_material.disponibilidad=1 then
		ls_find="cvegrupo="+string(pstr_sol_material.cvegrupo)+" and cvematerial='"+pstr_sol_material.cvematerial+"' and status=-1 and disponibilidad=1"
	else
		ls_find="cvegrupo="+string(pstr_sol_material.cvegrupo)+" and cvematerial='"+pstr_sol_material.cvematerial+"' and num_serie='"+pstr_sol_material.num_serie +"' and status=-1"
	end if

	li_existe=dw_solicitados.Find(ls_find,1,dw_solicitados.RowCount())

	if li_existe>0 then
	
		ls_find="cvegrupo="+string(pstr_sol_material.cvegrupo)+" and cvematerial='"+pstr_sol_material.cvematerial+"' and num_serie_presol='"+pstr_sol_material.num_serie +"' and status=-1"
		li_exacto=dw_solicitados.Find(ls_find,1,dw_solicitados.RowCount())
		if li_exacto>0 then li_existe=li_exacto
	
		//Sustituir
		dw_solicitados.SetItem(li_existe, "num_serie",pstr_sol_material.num_serie)
		dw_solicitados.SetItem(li_existe, "status",pstr_sol_material.status)
		dw_solicitados.SetItem(li_existe, "nomstatus",pstr_sol_material.nomstatus)
		dw_solicitados.SetItem(li_existe, "cod_uia",pstr_sol_material.cod_uia)
		dw_solicitados.SetItem(li_existe, "costo_mat",pstr_sol_material.costo_mat)
		dw_solicitados.SetItem(li_existe, "tipo_unidad",pstr_sol_material.tipo_unidad)
		dw_solicitados.SetItem(li_existe, "cantidad",pstr_sol_material.cantidad)
		dw_solicitados.SetItem(li_existe, "merma",pstr_sol_material.merma)		
		dw_solicitados.SetItem(li_existe, "cbox",0)	
		dw_solicitados.SetItem(li_existe, "color",0)
	
	else
	
		//Agregar el material
		li_nuevo=li_row+1
		
		dw_solicitados.insertrow(0)
		dw_solicitados.SetItem(li_nuevo, "cvedepto",pstr_sol_material.cvedepto)	
		dw_solicitados.SetItem(li_nuevo, "cvearea",pstr_sol_material.cvearea)
		dw_solicitados.SetItem(li_nuevo, "cvegrupo",pstr_sol_material.cvegrupo)
		dw_solicitados.SetItem(li_nuevo, "cvematerial",pstr_sol_material.cvematerial)
		dw_solicitados.SetItem(li_nuevo, "num_serie",pstr_sol_material.num_serie)
		dw_solicitados.SetItem(li_nuevo, "nommaterial",pstr_sol_material.nommaterial)
		dw_solicitados.SetItem(li_nuevo, "status",pstr_sol_material.status)
		dw_solicitados.SetItem(li_nuevo, "nomstatus",pstr_sol_material.nomstatus)
		dw_solicitados.SetItem(li_nuevo, "fecha_inicio",pstr_sol_material.fecha_inicio)
		dw_solicitados.SetItem(li_nuevo, "fecha_final",pstr_sol_material.fecha_final)
		dw_solicitados.SetItem(li_nuevo, "cod_uia",pstr_sol_material.cod_uia)
		dw_solicitados.SetItem(li_nuevo, "tipo_unidad",pstr_sol_material.tipo_unidad)	
		dw_solicitados.SetItem(li_nuevo, "cantidad",pstr_sol_material.cantidad)	
		dw_solicitados.SetItem(li_nuevo, "merma",0)			
		dw_solicitados.SetItem(li_nuevo, "folio_presol",pstr_sol_material.folio_presol)
		dw_solicitados.SetItem(li_nuevo, "costo_mat",pstr_sol_material.costo_mat)
		dw_solicitados.SetItem(li_nuevo, "consec_presol",pstr_sol_material.consec_presol)
		dw_solicitados.SetItem(li_nuevo, "cbox",0)
		
	end if
	
	dw_solicitados.SetSort("#8A #6A")
	dw_solicitados.Sort()
	
	//Hacer NO disponible en el inventario
	
//	ls_find="spre_inventario_cvegrupo="+string(pstr_sol_material.cvegrupo)+" and spre_inventario_cvematerial='"+pstr_sol_material.cvematerial+"' and spre_inventario_num_serie='"+string(pstr_sol_material.num_serie)+"'"
//	li_existe=dw_inventario_disponible.Find(ls_find,1,dw_inventario_disponible.RowCount())
//	if li_existe>0 then dw_inventario_disponible.SetItem(li_existe,'marcado',1)
	
	
	cb_eliminar.enabled=true
	cb_generar.enabled=true
	
	if p_rowdis>0 then dw_disponible.DeleteRow(p_rowdis)
	
end if


end subroutine

public subroutine f_reset ();//ii_edita=0
sle_solicitante.text=''
il_solicitante=0
is_solicitantenom=''
is_cvemat=''
il_cvegrupo=0
//ii_reservados=0
//il_folio_prestamo=0 
//il_folio_presolicitud=0
//ii_bloquea_nuevo=0
//ii_multa=0

//dw_solicitante.Reset()
//dw_solicitante.insertrow(0)
//dw_solicitante.SetItem(1, "cveperiodo", ii_periodo)	

//dw_foto.Reset()
//dw_foto.Modify ( "p_1.FileName='uia-n.jpg'" )

dw_grupomat.Reset()
dw_matgrupo.Reset()

dw_disponible.Reset()
dw_solicitados.Reset()

dw_grupomat.enabled=false
dw_matgrupo.enabled=false

cb_buscar.enabled=false
cb_eliminar.enabled=false
cb_generar.enabled=false


em_fecha_inicio.text=string(today())
em_fecha_final.text=string(today())

em_fecha_inicio.enabled=true
em_fecha_final.enabled=true


idt_fecha_inicio=datetime(date(em_fecha_inicio.text),time('07:00:00'))
idt_fecha_final=datetime(date(em_fecha_final.text),time('22:00:00'))

mle_observaciones.enabled=false
sle_motivo.enabled=false

st_nombre.text=''
mle_observaciones.text=''
sle_motivo.text=''



end subroutine

public subroutine f_generar_solicitud ();integer NET, li_i, li_consec, li_error=0, li_existe, li_tipo_unidad, li_disponible, li_cantidad, li_tempo
long ll_tempo
datetime ldt_fecha_inicio, ldt_fecha_final
long ll_folio=0, ll_presol=0
integer li_row, li_cvegrupo, li_presol_consec[], li_j=0, ll_j, li_presol_cantidad[]
string ls_find, ls_cvematerial, ls_num_serie, ls_nommaterial, ls_presol_num_serie[]
datastore lds_reservados

dw_solicitados.SetFilter('status=0')
dw_solicitados.Filter()

if is_autoriza='' then
	messagebox('Aviso','Debe indicar quién firma la autorización de la carta')
	return
end if
	
if dw_solicitados.RowCount() > 0 then	

	//Revisar que todas sigan disponibles
	
	lds_reservados =  create datastore
	ldt_fecha_inicio=dw_solicitados.GetItemDateTime(1,'fecha_inicio')
	ldt_fecha_final=dw_solicitados.GetItemDateTime(1,'fecha_final')

	lds_reservados.dataobject ='d_gen_mat_reservados_consu'
	lds_reservados.settransobject(gtr_sumuia)	

	lds_reservados.Retrieve(gi_depto,gi_area,ldt_fecha_inicio,ldt_fecha_final)
	li_row = lds_reservados.Rowcount()
	
	if li_row>0 then
	
		for li_i=1 to dw_solicitados.RowCount()
			
			dw_solicitados.SetItem(li_i,'color',0)
				
				li_cvegrupo=dw_solicitados.GetItemNumber(li_i,'cvegrupo')
				ls_cvematerial=dw_solicitados.GetItemString(li_i,'cvematerial')
				ls_num_serie=dw_solicitados.GetItemString(li_i,'num_serie')
				ls_nommaterial=dw_solicitados.GetItemString(li_i,'nommaterial')
				li_tipo_unidad=dw_solicitados.GetItemNumber(li_i,'tipo_unidad')
				li_cantidad=dw_solicitados.GetItemNumber(li_i,'cantidad')
				
				ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
				li_existe=lds_reservados.Find(ls_find,1,li_row)
				
				if li_existe>0 then 
					
					if li_tipo_unidad=0 then
						messagebox('Atención','El material '+ls_nommaterial+' '+ls_num_serie+' ya no se encuentra disponible.',stopsign!)
						dw_solicitados.SetItem(li_i,'color',1)
						li_error=-1
					else
						li_disponible=lds_reservados.GetItemNumber(li_existe,'cantidad')
						if  (li_disponible - li_cantidad)<0 then 
							messagebox('Atención','Ya no hay suficientes unidades del material '+ls_nommaterial+' '+ls_num_serie+'.',stopsign!)
							dw_solicitados.SetItem(li_i,'color',1)
							li_error=-1
						end if
					end if
					
				end if
				
		next
		
		if li_error=-1 then goto error
		
	end if
	

	//Insertar

	li_i=1
	for li_i=1 to dw_solicitados.RowCount()

		if ll_folio=0 then

			//Insertar Solicitud
			ll_folio=f_insert_solicitud()
			if ll_folio=-1 then 
				li_error=1
				goto error
			else
				if f_insert_solicitante(ll_folio) = -1 then
					li_error=1
					goto error
				end if
			end if
			
		end if
			//Insertar material
			li_consec=f_insert_material(li_i,ll_folio,li_tempo,ll_tempo,ll_tempo)
			if li_consec=-1 then
				li_error=1
				goto error
			end if
			
			if dw_solicitados.GetItemNumber(li_i,'folio_presol')>0 then 
				ll_presol=dw_solicitados.GetItemNumber(li_i,'folio_presol')
				li_j=li_j+1
				li_presol_consec[li_j]=dw_solicitados.GetItemNumber(li_i,'consec_presol')
				ls_presol_num_serie[li_j]=dw_solicitados.GetItemString(li_i,'num_serie')
				li_presol_cantidad[li_j]=dw_solicitados.GetItemNumber(li_i,'cantidad')
			end if
		
	next


	if ll_presol>0 then
		//Update presol
		//MARISOL FALTA CANTIDAD
		update dbo.spre_pre_solicitud
		set status=1,
		folio_prestamo=:ll_folio
		where cvedepto=:gi_depto and folio=:ll_presol
		using gtr_sumuia;
		
		if gtr_sumuia.SQLCode = -1 then 
			messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)	
			rollback using gtr_sumuia;
		else
			commit using gtr_sumuia;	
		end if
	
		for li_i=1 to li_j
			//Actualizar la cantidad
			update dbo.spre_pre_sol_materiales
			set status=1,
			num_serie=:ls_presol_num_serie[li_i],
			cantidad=:li_presol_cantidad[li_i]
			where cvedepto=:gi_depto and folio=:ll_presol
			and consecutivo=:li_presol_consec[li_i]
			using gtr_sumuia;
			
			if gtr_sumuia.SQLCode = -1 then 
				messagebox("Error SUMUIA: Actualizar status de PreSolicitud", gtr_sumuia.SQLErrText)	
				rollback using gtr_sumuia;
			else
				commit using gtr_sumuia;	
			end if
			
		next
	
	end if
	
	messagebox('Mensaje del Sistema','Los Registros han sido actualizados con éxito con el folio '+string(ll_folio))

	f_carta(ll_folio)
	
	f_reset()
	
	error:
	
	if li_error=1 then
		messagebox('Atención','La solicitud no pudo ser registrada correctamente',stopsign!)
	end if

else
	
	messagebox('Atención','Ningún material ha sido solicitado.')

end if

dw_solicitados.SetFilter('')
dw_solicitados.Filter()

end subroutine

public function long f_insert_solicitud ();long ll_folio
datetime ldt_fecha_inicio, ldt_fecha_final, ldt_fecha_hoy

ldt_fecha_inicio=dw_solicitados.GetItemDateTime(1,'fecha_inicio')
ldt_fecha_final=dw_solicitados.GetItemDateTime(1,'fecha_final')
ldt_fecha_hoy= DateTime(today(),now())

	select max(folio)
	into :ll_folio
	from dbo.spre_solicitud
	where cvedepto =:gi_depto
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener Máximo Folio Solicitud", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	end if
	
	if isNull(ll_folio) then ll_folio=0

	ll_folio=ll_folio+1
	
	
	//Insertar Solicitud
	insert into dbo.spre_solicitud
	(cvedepto, folio, solicitanteid, status, cveperiodo, condicion, fecha_solicitud, fecha_inicio, 
	fecha_fin, tipo_solicitud)
	 
	values
	(:gi_depto, :ll_folio, :il_solicitante, 0, :ii_periodo, 1, :ldt_fecha_hoy, :ldt_fecha_inicio,
	:ldt_fecha_final, :ii_tipo_usuario)


	using gtr_sumuia;	
	
	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al insertar la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	end if	

return(ll_folio)


end function

public function long f_insert_solicitante (long p_folio);string ls_sol_nombre, ls_sol_telefono, ls_sol_grupo, ls_sol_profesor
datetime ldt_fecha_hoy

ldt_fecha_hoy= DateTime(today(),now())

ls_sol_nombre=is_solicitantenom
ls_sol_telefono=''
ls_sol_grupo=''
ls_sol_profesor=''

//	Insertar Solicitud
	insert into dbo.spre_prestamo_material
	(cvedepto, folio, tipo_prestamo, solicitanteid, solicitantenombre,
	solicitantetel, solicitantegrupo, solicitanteprofesor, fechacarga, usuario)

	values
	(:gi_depto, :p_folio, :ii_tipo_usuario, :il_solicitante, :ls_sol_nombre,
	:ls_sol_telefono, :ls_sol_grupo, :ls_sol_profesor, :ldt_fecha_hoy, :gs_usuario)

	using gtr_sumuia;	
	
	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al insertar solicitante a la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;
	end if	

return(1)


end function

public function long f_insert_material (integer p_row, long p_folio, ref integer p_cantidad_prestada, ref long p_folio_presol, ref long p_consec_presol);integer li_cvegrupo, li_consec=0, li_tipo_unidad, li_cantidad, li_prestada, li_cantidad_prestada=0, li_cantidad_actualizar=0
decimal ldc_costo_mat
string ls_cvematerial, ls_num_serie
datetime ldt_fecha_inicio, ldt_fecha_final, ldt_fecha_hoy
long ll_folio_presol=0, ll_consec_presol=0

ldt_fecha_hoy= DateTime(today(),now())
ldt_fecha_inicio=dw_solicitados.GetItemDateTime(p_row,'fecha_inicio')
ldt_fecha_final=dw_solicitados.GetItemDateTime(p_row,'fecha_final')
li_cvegrupo=dw_solicitados.GetItemNumber(p_row,'cvegrupo')
ls_cvematerial=dw_solicitados.GetItemString(p_row,'cvematerial')
ls_num_serie=dw_solicitados.GetItemString(p_row,'num_serie')
ldc_costo_mat=dw_solicitados.GetItemDecimal(p_row,'costo_mat')


if dw_solicitados.GetItemDecimal(p_row,'tipo_unidad')=1 then
	
	li_tipo_unidad=dw_solicitados.GetItemDecimal(p_row,'tipo_unidad')
	li_cantidad=dw_solicitados.GetItemDecimal(p_row,'cantidad')
	li_prestada=li_cantidad
	
	//Ver si ya tiene activas más unidades
	select top 1 a.consecutivo, a.cantidad, isnull(c.folio,0), isnull(d.consecutivo,0)
	into :li_consec, :li_cantidad_actualizar, :ll_folio_presol, :ll_consec_presol
	from dbo.spre_sol_materiales a
	join dbo.spre_solicitud b on (a.cvedepto=b.cvedepto and a.folio=b.folio)
	left join dbo.spre_pre_solicitud c on (b.cvedepto=c.cvedepto and b.folio=c.folio_prestamo)
	left join dbo.spre_pre_sol_materiales d on (c.cvedepto=d.cvedepto and c.folio=d.folio
	and a.cvearea=d.cvearea and a.cvegrupo=d.cvegrupo and a.cvematerial=d.cvematerial and a.num_serie=d.num_serie)
	where a.cvedepto =:gi_depto
	and a.folio=:p_folio
	and a.cvearea=:gi_area
	and a.cvegrupo=:li_cvegrupo
	and a.cvematerial=:ls_cvematerial
	and a.num_serie=:ls_num_serie
	and a.status=0
	order by d.consecutivo asc
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Buscar unidades de reservaciones de Material", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	end if
	
else
	
	SetNull(li_tipo_unidad)
	SetNull(li_cantidad)
	SetNull(li_prestada)
	
end if


if li_consec>0 then

	if ll_folio_presol>0 then p_folio_presol=ll_folio_presol
	if ll_consec_presol>0 then p_consec_presol=ll_consec_presol
	
	li_cantidad_actualizar=li_cantidad_actualizar+li_cantidad

	//Actualizar material
	update dbo.spre_sol_materiales
	set cantidad=:li_cantidad_actualizar
	where cvedepto=:gi_depto
	and folio=:p_folio
	and consecutivo=:li_consec
	
	using gtr_sumuia;

	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al actualizar la cantidad de material prestado: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	end if	
	
else
	
	//Obtener consecutivo
	select max(consecutivo)
	into :li_consec
	from dbo.spre_sol_materiales
	where cvedepto =:gi_depto
	and folio=:p_folio
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener Máximo Consecutivo de Material", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	end if
	
	
	if isNull(li_consec) then li_consec=0
	li_consec=li_consec+1
	p_cantidad_prestada=li_prestada
	
	//Insertar Material
	insert into dbo.spre_sol_materiales
	(cvedepto, folio, consecutivo, cvearea, cvematerial, cvegrupo, num_serie,
	status, fecha_inicio, fecha_final, costo_mat, tipo_unidad, cantidad)
	 
	values
	(:gi_depto, :p_folio, :li_consec, :gi_area, :ls_cvematerial, :li_cvegrupo, :ls_num_serie,
	0, :ldt_fecha_inicio, :ldt_fecha_final, :ldc_costo_mat, :li_tipo_unidad, :li_prestada )

	using gtr_sumuia;	
	
	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al insertar el material a la solicitud: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	end if	

end if
	
//Actualizar Cantidad Prestados

if li_tipo_unidad=1 then
	
	select isnull(cantidad_prestada,0)
	into :li_cantidad_prestada
	from dbo.spre_inventario
	where cvedepto=:gi_depto
	and cvearea=:gi_area
	and cvegrupo=:li_cvegrupo
	and cvematerial=:ls_cvematerial
	and num_serie=:ls_num_serie
	using gtr_sumuia;

	li_cantidad_prestada=li_cantidad_prestada+li_prestada
	p_cantidad_prestada=li_cantidad_prestada

	update dbo.spre_inventario
	set cantidad_prestada=:li_cantidad_prestada
	where cvedepto=:gi_depto
	and cvearea=:gi_area
	and cvegrupo=:li_cvegrupo
	and cvematerial=:ls_cvematerial
	and num_serie=:ls_num_serie
	
	using gtr_sumuia;

	if gtr_sumuia.sqlcode<>0 then
		messagebox("Error al actualizar material prestado en inventario: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
		rollback using gtr_sumuia;
		return -1
	end if	

end if


commit using gtr_sumuia;
return(li_consec)


end function

public subroutine f_carta (long p_folio);string ls_nombre,ls_ruta
integer li_ret

dw_carta.Reset()
dw_carta.Retrieve(gi_depto,p_folio) 

if dw_carta.RowCount()>0 then
	
	dw_carta.object.t_fecha_inicio.text=string(Day(Date(dw_carta.GetItemDateTime(1,'fecha_inicio'))))+' de '+uf_mes(Month(Date(dw_carta.GetItemDateTime(1,'fecha_inicio'))))+' de '+string(Year(Date(dw_carta.GetItemDateTime(1,'fecha_inicio'))))
	dw_carta.object.t_fecha_final.text=string(Day(Date(dw_carta.GetItemDateTime(1,'fecha_final'))))+' de '+uf_mes(Month(Date(dw_carta.GetItemDateTime(1,'fecha_final'))))+' de '+string(Year(Date(dw_carta.GetItemDateTime(1,'fecha_final'))))
	
	dw_carta.object.t_observaciones.text=mle_observaciones.text
	dw_carta.object.t_motivo.text=sle_motivo.text
	dw_carta.object.t_autoriza.text= is_autoriza
		
	ls_ruta="C:\RyP\"
	ls_nombre='Carta Folio '+string(p_folio)+'.pdf'
	ls_ruta=ls_ruta+ls_nombre

	dw_carta.Object.DataWindow.Export.PDF.Method = Distill!
	dw_carta.Object.DataWindow.Printer =  "CutePDF Writer"
	dw_carta.Object.DataWindow.Export.PDF.Distill.CustomPostScript="1"

	li_ret = dw_carta.SaveAs(ls_ruta, PDF!, true)
	
	if li_ret=1 then 
		messagebox('AVISO','La carta ha sido guardada en la ruta: '+ls_ruta)
	else
		dw_carta.Print()
	end if
		
end if
end subroutine

public function integer f_valida_alumno (string p_cuenta);integer li_pos, li_existe=0, li_valida
string ls_cuenta, ls_digito
long ll_cuenta

li_pos=pos(p_cuenta,'-')

if li_pos>0 then
	ls_cuenta=left(p_cuenta,len(p_cuenta) - 2)
	ls_digito=right(p_cuenta,1)
else
	ls_cuenta=left(p_cuenta,len(p_cuenta) - 1)
	ls_digito=right(p_cuenta,1)
end if


//Confirma Dígito
if isNumber(ls_cuenta) then
	ll_cuenta=long(ls_cuenta)
	il_solicitante=ll_cuenta
	if f_valida_digito_alumno(ll_cuenta,ls_digito)>0 then li_existe=1
end if


//Valida acceso
if li_existe=1 then
	
	li_valida=f_valida_alumno(ll_cuenta,is_solicitantenom)
	
	choose case li_valida
		case -1
			messagebox('Aviso','La cuenta no es válida.')
			return (-1)			
		case 0
			return (1)			
	end choose
	
	if (f_valida_mat_alumno_depto(ll_cuenta,gi_deptocoor, ii_anio,ii_periodo))=0 then return(2)
	
else
	messagebox('Aviso','La cuenta '+string(il_solicitante)+' no es válida.')
	return (-1)	
end if

return (0)


//-1	No existe, detener todo
//0		Existe, inscrito en el semestre y en el departamento
//1		Existe, pero no está inscrito en el semestre
//2		Existe, inscrito en el semestre, no inscrito en el departamento

end function

public function integer f_valida_alumno_intercambio (string p_cuenta);integer li_existe=0, li_valida
long ll_cuenta

if isNumber(p_cuenta) then
	ll_cuenta=long(p_cuenta)
	il_solicitante=ll_cuenta
	li_existe=1
end if

if li_existe=1 then

	li_valida=f_valida_alumno_intercambio(ll_cuenta,is_solicitantenom,ii_anio,ii_periodo)

	choose case li_valida
		case -1
			messagebox('Aviso','La cuenta no es válida.')
			return (-1)			
		case 0
			return (1)			
	end choose

	if (f_valida_mat_intercambio_depto(ll_cuenta,gs_deptocoor, ii_anio,ii_periodo))=0 then return(2)
	
else
	messagebox('Aviso','La cuenta '+string(il_solicitante)+' no es válida.')
	return (-1)	
end if

return (0)



//-1	No existe, detener todo
//0		Existe, inscrito en el semestre y en el departamento
//1		Existe, pero no está inscrito en el semestre
//2		Existe, inscrito en el semestre, no inscrito en el departamento

end function

public function integer f_valida_empleado (string p_cuenta);integer li_existe=0, li_valida
long ll_cuenta

if isNumber(p_cuenta) then
	ll_cuenta=long(p_cuenta)
	il_solicitante=ll_cuenta
	li_existe=1
end if

if li_existe=1 then
	
	li_valida=f_valida_empleado(ll_cuenta,is_solicitantenom)
		
	choose case li_valida
		case -1
			messagebox('Aviso','La cuenta no es válida.')
			return (-1)			
	end choose
	
	if (f_valida_mat_empleado_depto(ll_cuenta,gi_deptocoor, ii_anio,ii_periodo))=0 then return(2)
	
else
	messagebox('Aviso','La cuenta '+string(il_solicitante)+' no es válida.')
	return (-1)	
end if

return (0)
end function

on w_ing_carta_solicitud.create
this.ddlb_firma=create ddlb_firma
this.st_3=create st_3
this.rb_profesor=create rb_profesor
this.cb_1=create cb_1
this.cb_generar=create cb_generar
this.st_2=create st_2
this.st_1=create st_1
this.mle_observaciones=create mle_observaciones
this.sle_motivo=create sle_motivo
this.dw_inventario_disponible=create dw_inventario_disponible
this.cbx_todos=create cbx_todos
this.cb_eliminar=create cb_eliminar
this.st_nombre=create st_nombre
this.dw_solicitados=create dw_solicitados
this.dw_disponible=create dw_disponible
this.dw_matgrupo=create dw_matgrupo
this.dw_grupomat=create dw_grupomat
this.st_material=create st_material
this.st_grupo=create st_grupo
this.cb_buscar=create cb_buscar
this.st_final=create st_final
this.st_inicio=create st_inicio
this.sle_solicitante=create sle_solicitante
this.cbx_intercambio=create cbx_intercambio
this.rb_alumno=create rb_alumno
this.gb_material=create gb_material
this.gb_disponible=create gb_disponible
this.gb_seleccionado=create gb_seleccionado
this.gb_solicitud=create gb_solicitud
this.dw_carta=create dw_carta
this.em_fecha_inicio=create em_fecha_inicio
this.em_fecha_final=create em_fecha_final
this.gb_1=create gb_1
this.Control[]={this.ddlb_firma,&
this.st_3,&
this.rb_profesor,&
this.cb_1,&
this.cb_generar,&
this.st_2,&
this.st_1,&
this.mle_observaciones,&
this.sle_motivo,&
this.dw_inventario_disponible,&
this.cbx_todos,&
this.cb_eliminar,&
this.st_nombre,&
this.dw_solicitados,&
this.dw_disponible,&
this.dw_matgrupo,&
this.dw_grupomat,&
this.st_material,&
this.st_grupo,&
this.cb_buscar,&
this.st_final,&
this.st_inicio,&
this.sle_solicitante,&
this.cbx_intercambio,&
this.rb_alumno,&
this.gb_material,&
this.gb_disponible,&
this.gb_seleccionado,&
this.gb_solicitud,&
this.dw_carta,&
this.em_fecha_inicio,&
this.em_fecha_final,&
this.gb_1}
end on

on w_ing_carta_solicitud.destroy
destroy(this.ddlb_firma)
destroy(this.st_3)
destroy(this.rb_profesor)
destroy(this.cb_1)
destroy(this.cb_generar)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_observaciones)
destroy(this.sle_motivo)
destroy(this.dw_inventario_disponible)
destroy(this.cbx_todos)
destroy(this.cb_eliminar)
destroy(this.st_nombre)
destroy(this.dw_solicitados)
destroy(this.dw_disponible)
destroy(this.dw_matgrupo)
destroy(this.dw_grupomat)
destroy(this.st_material)
destroy(this.st_grupo)
destroy(this.cb_buscar)
destroy(this.st_final)
destroy(this.st_inicio)
destroy(this.sle_solicitante)
destroy(this.cbx_intercambio)
destroy(this.rb_alumno)
destroy(this.gb_material)
destroy(this.gb_disponible)
destroy(this.gb_seleccionado)
destroy(this.gb_solicitud)
destroy(this.dw_carta)
destroy(this.em_fecha_inicio)
destroy(this.em_fecha_final)
destroy(this.gb_1)
end on

event open;f_select_anio_periodo_actual(ii_periodo,ii_anio,today())

em_fecha_inicio.text=string(today())
em_fecha_final.text=string(today())

dw_grupomat.settransobject(gtr_sumuia)
dw_grupomat.getchild('descripcion',idwc_grupomat)
idwc_grupomat.settransobject(gtr_sumuia)

dw_matgrupo.settransobject(gtr_sumuia)
dw_matgrupo.getchild('descripcion',idwc_matgrupo)
idwc_matgrupo.settransobject(gtr_sumuia)


//dw_inventario_disponible.settransobject(gtr_sumuia)
dw_carta.settransobject(gtr_sumuia)

sle_solicitante.SetFocus()
end event

type ddlb_firma from dropdownlistbox within w_ing_carta_solicitud
integer x = 479
integer y = 483
integer width = 1313
integer height = 362
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string item[] = {"Genaro Nolasco R. ","Julio César Díaz M."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;is_autoriza=this.text(index)

end event

type st_3 from statictext within w_ing_carta_solicitud
integer x = 55
integer y = 464
integer width = 410
integer height = 138
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Firma Autorización:"
boolean focusrectangle = false
end type

type rb_profesor from radiobutton within w_ing_carta_solicitud
integer x = 51
integer y = 157
integer width = 373
integer height = 77
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Profesor"
end type

event clicked;sle_solicitante.SetFocus()
end event

type cb_1 from commandbutton within w_ing_carta_solicitud
integer x = 3255
integer y = 1984
integer width = 413
integer height = 106
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;f_carta(1073)
end event

type cb_generar from commandbutton within w_ing_carta_solicitud
integer x = 2706
integer y = 2317
integer width = 267
integer height = 90
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Generar"
end type

event clicked;f_generar_solicitud()

end event

type st_2 from statictext within w_ing_carta_solicitud
integer x = 55
integer y = 275
integer width = 424
integer height = 51
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Observaciones:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_ing_carta_solicitud
integer x = 969
integer y = 182
integer width = 252
integer height = 51
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Motivo:"
boolean focusrectangle = false
end type

type mle_observaciones from multilineedit within w_ing_carta_solicitud
integer x = 479
integer y = 272
integer width = 2578
integer height = 163
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

type sle_motivo from singlelineedit within w_ing_carta_solicitud
integer x = 1236
integer y = 173
integer width = 1818
integer height = 77
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

type dw_inventario_disponible from datawindow within w_ing_carta_solicitud
integer x = 3313
integer y = 93
integer width = 117
integer height = 86
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_gen_mat_disponible_consu"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cbx_todos from checkbox within w_ing_carta_solicitud
integer x = 2703
integer y = 1763
integer width = 300
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Todos"
end type

event clicked;integer li_valor, li_i

if this.checked=true then	li_valor=1 else	li_valor=0

for li_i=1 to dw_solicitados.RowCount() 
	dw_solicitados.SetItem(li_i,'cbox',li_valor)
next
end event

type cb_eliminar from commandbutton within w_ing_carta_solicitud
integer x = 2699
integer y = 1843
integer width = 274
integer height = 90
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Eliminar"
end type

event clicked;integer NET, li_i, li_cvegrupo, li_existe, li_marcado=0, li_tipo_unidad, li_cantidad
string ls_cvematerial, ls_num_serie, ls_nommaterial, ls_find

Net = messagebox("Atención",' ¿Desea eliminar todos los materiales marcados?', Question!, yesno!, 2)

if Net = 1 then
	
	for li_i=1 to dw_solicitados.RowCount()
		if dw_solicitados.GetItemNumber(li_i,'cbox') = 1 then  li_marcado=1
	next
	
	if li_marcado=0 then
		messagebox('Atención','Debe seleccionar algún material.')
		return
	end if
	

	for li_i=1 to dw_solicitados.RowCount()
		
		if dw_solicitados.GetItemNumber(li_i,'cbox') = 1  then	
		
			//Hacer disponible en el inventario
			li_cvegrupo=dw_solicitados.GetItemNumber(li_i,'cvegrupo')
			ls_cvematerial=dw_solicitados.GetItemString(li_i,'cvematerial')
			ls_num_serie=dw_solicitados.GetItemString(li_i,'num_serie')
			ls_nommaterial=dw_solicitados.GetItemString(li_i,'nommaterial')
			li_tipo_unidad=dw_solicitados.GetItemNumber(li_i,'tipo_unidad')	
			li_cantidad=dw_solicitados.GetItemNumber(li_i,'cantidad')	
				
//			ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
//			li_existe=dw_inventario_disponible.Find(ls_find,1,dw_inventario_disponible.RowCount())
//					
//			if li_existe>0 then
//				if li_tipo_unidad=1 then dw_inventario_disponible.SetItem(li_existe,'cantidad_marcada',dw_inventario_disponible.GetItemNumber(li_existe,'cantidad_marcada') - li_cantidad)
//				dw_inventario_disponible.SetItem(li_existe,'marcado',0)
//			end if
			
			dw_solicitados.DeleteRow(li_i)
			li_i=li_i -1 
			
		end if
		
	next
	
end if


end event

type st_nombre from statictext within w_ing_carta_solicitud
integer x = 1240
integer y = 80
integer width = 1818
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 30520472
boolean focusrectangle = false
end type

type dw_solicitados from datawindow within w_ing_carta_solicitud
integer x = 91
integer y = 1747
integer width = 2501
integer height = 646
integer taborder = 120
string title = "none"
string dataobject = "d_ing_carta_seleccionado"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_disponible from datawindow within w_ing_carta_solicitud
integer x = 91
integer y = 1021
integer width = 2940
integer height = 570
integer taborder = 110
string dataobject = "d_ing_carta_disponible"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(gtr_sumuia)
end event

event doubleclicked;integer li_cantidad=0, li_disponible

if row>0 then

	li_disponible=this.GetItemNumber(row,'cantidad')
	
	if li_disponible>1 then
		openwithparm(w_ing_prestamo_cantidad,li_disponible)
		li_cantidad=Message.DoubleParm
		
		if li_cantidad=0 then 
			messagebox('Atención','Debe indicar la cantidad a solicitar.')
			return
		end if
	else
		if li_disponible=1 then li_cantidad=1
	end if
	
	str_sol_material lstr_sol_material
	
	lstr_sol_material.cvedepto=this.GetItemNumber(row,'spre_inventario_cvedepto')
	lstr_sol_material.cvearea=this.GetItemNumber(row,'spre_inventario_cvearea')
	lstr_sol_material.cvegrupo=this.GetItemNumber(row,'spre_inventario_cvegrupo')
	lstr_sol_material.cvematerial=this.GetItemString(row,'spre_inventario_cvematerial')
	lstr_sol_material.num_serie=this.GetItemString(row,'spre_inventario_num_serie')
	lstr_sol_material.nommaterial=this.GetItemString(row,'spre_materiales_nommaterial')
	lstr_sol_material.prestamo_unitario=this.GetItemNumber(row,'spre_inventario_prestamo_unitario')
	lstr_sol_material.cod_uia=this.GetItemString(row,'spre_inventario_cod_uia')
	lstr_sol_material.status=0
	lstr_sol_material.nomstatus='Solicitud'
	lstr_sol_material.fecha_inicio=idt_fecha_inicio
	lstr_sol_material.fecha_final=idt_fecha_final
	lstr_sol_material.costo_mat=this.GetItemDecimal(row,'spre_inventario_costo_mat')
	lstr_sol_material.tipo_unidad=this.GetItemDecimal(row,'spre_inventario_tipo_unidad')
	lstr_sol_material.cantidad=li_cantidad
	lstr_sol_material.disponibilidad=this.GetItemNumber(row,'disponibilidad')
	lstr_sol_material.merma=0
	
	f_agregar_material(lstr_sol_material,0,row)

end if
end event

type dw_matgrupo from u_basedw within w_ing_carta_solicitud
integer x = 355
integer y = 794
integer width = 1467
integer height = 77
integer taborder = 80
boolean enabled = false
string dataobject = "d_gen_matgrupo_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;is_cvemat=this.gettext()

dw_disponible.Reset()

end event

type dw_grupomat from u_basedw within w_ing_carta_solicitud
integer x = 355
integer y = 704
integer width = 1467
integer height = 77
integer taborder = 70
boolean enabled = false
string dataobject = "d_gen_grupomat_p"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("descripcion", "descripcion", "descripcion")
end event

event itemchanged;call super::itemchanged;if IsNumber(trim(this.gettext())) then  il_cvegrupo=long(trim(this.gettext()))
is_cvemat=''
dw_matgrupo.Reset()
idwc_matgrupo.Retrieve(gi_depto,gi_area,il_cvegrupo)
if idwc_matgrupo.RowCount()>0 then dw_matgrupo.insertrow(0)

dw_disponible.Reset()

end event

type st_material from statictext within w_ing_carta_solicitud
integer x = 91
integer y = 803
integer width = 271
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Material"
boolean focusrectangle = false
end type

type st_grupo from statictext within w_ing_carta_solicitud
integer x = 95
integer y = 717
integer width = 271
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Grupo"
boolean focusrectangle = false
end type

type cb_buscar from commandbutton within w_ing_carta_solicitud
integer x = 2761
integer y = 688
integer width = 282
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Buscar"
end type

event clicked;datetime ldt_hoy, ldt_fecha_inicio, ldt_fecha_final
integer li_row, li_i, li_cvegrupo, li_existe, li_tipo_unidad, li_cantidad, li_disponibilidad, li_status
string ls_cvematerial, ls_num_serie, ls_nommaterial, ls_find

ldt_fecha_inicio=datetime(date(em_fecha_inicio.text),time('07:00:00'))
ldt_fecha_final=datetime(date(em_fecha_final.text),time('20:00:00'))
ldt_hoy=datetime(today(),time('00:00:00'))

if ldt_fecha_inicio>=ldt_fecha_final or ldt_fecha_inicio<ldt_hoy or ldt_fecha_final<=ldt_hoy then
	messagebox('Aviso','La fecha inicial debe ser menor a la final, ambas mayores a este momento.')
	return
end if

dw_disponible.SetRedraw(false)
dw_disponible.Reset()
dw_disponible.Retrieve(gi_depto,gi_area,il_cvegrupo,is_cvemat,ldt_fecha_inicio,ldt_fecha_final)
dw_disponible.SetRedraw(true)


//Solicitados, hacer NO disponible en la seleccion actual

for li_i=1 to dw_solicitados.RowCount()
	
	li_status=dw_solicitados.GetItemNumber(li_i,'status')
		
	if li_status=0 then
	
		li_cvegrupo=dw_solicitados.GetItemNumber(li_i,'cvegrupo')
		ls_cvematerial=dw_solicitados.GetItemString(li_i,'cvematerial')
		ls_num_serie=dw_solicitados.GetItemString(li_i,'num_serie')
		ls_nommaterial=dw_solicitados.GetItemString(li_i,'nommaterial')
		li_tipo_unidad=dw_solicitados.GetItemNumber(li_i,'tipo_unidad')
		li_cantidad=dw_solicitados.GetItemNumber(li_i,'cantidad')
		
		//En inventario
		ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
		li_existe=dw_disponible.Find(ls_find,1,dw_disponible.RowCount())
		
		if li_existe>0 then 
			if li_tipo_unidad=1 then
				dw_disponible.SetItem(li_existe,'cantidad',dw_disponible.GetItemNumber(li_existe,'cantidad') - li_cantidad) 
				if dw_disponible.GetItemNumber(li_existe,'cantidad')<=0 then dw_disponible.DeleteRow(li_existe)
			else
				dw_disponible.DeleteRow(li_existe)
			end if
		end if
		
	end if

next



//Si hubo cambio de fecha, recargar inventario

if ldt_fecha_inicio<>idt_fecha_inicio or ldt_fecha_final<>idt_fecha_final then

	li_row=dw_solicitados.RowCount()
	
	//Actualizar las fechas de los demás materiales
	for li_i=1 to li_row
		dw_solicitados.SetItem(li_i, "fecha_inicio",ldt_fecha_inicio)
		dw_solicitados.SetItem(li_i, "fecha_final",ldt_fecha_final)	
	next
	
	//dw_inventario_disponible.Reset()
	//dw_inventario_disponible.Retrieve(gi_depto,gi_area,idt_fecha_inicio,idt_fecha_final)
	//li_row=dw_inventario_disponible.RowCount()
	
	
	//Solicitados hacer NO disponible en el inventario 
	
	for li_i=1 to dw_solicitados.RowCount()
		
		li_status=dw_solicitados.GetItemNumber(li_i,'status')
		
		if li_status=0 then
			
			li_cvegrupo=dw_solicitados.GetItemNumber(li_i,'cvegrupo')
			ls_cvematerial=dw_solicitados.GetItemString(li_i,'cvematerial')
			ls_num_serie=dw_solicitados.GetItemString(li_i,'num_serie')
			ls_nommaterial=dw_solicitados.GetItemString(li_i,'nommaterial')
			li_tipo_unidad=dw_solicitados.GetItemNumber(li_i,'tipo_unidad')
			li_cantidad=dw_solicitados.GetItemNumber(li_i,'cantidad')
			
			//En inventario
//			ls_find="spre_inventario_cvegrupo="+string(li_cvegrupo)+" and spre_inventario_cvematerial='"+ls_cvematerial+"' and spre_inventario_num_serie='"+string(ls_num_serie)+"'"
//			li_existe=dw_inventario_disponible.Find(ls_find,1,dw_inventario_disponible.RowCount())
//			
//	
//			if li_existe>0 then 
//				if li_tipo_unidad=1 then
//					dw_inventario_disponible.SetItem(li_existe,'cantidad_marcada',dw_inventario_disponible.GetItemNumber(li_existe,'cantidad_marcada') +li_cantidad)
//					if dw_inventario_disponible.GetItemNumber(li_existe,'cantidad') <= dw_inventario_disponible.GetItemNumber(li_existe,'cantidad_marcada') then &
//					dw_inventario_disponible.SetItem(li_existe,'marcado',1)
//				else
//					dw_inventario_disponible.SetItem(li_existe,'marcado',1)
//				end if
//			end if
			
		end if

	next

end if

idt_fecha_inicio=ldt_fecha_inicio
idt_fecha_final=ldt_fecha_final

cb_generar.enabled=true


end event

type st_final from statictext within w_ing_carta_solicitud
integer x = 1986
integer y = 803
integer width = 358
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Fecha Fin:"
boolean focusrectangle = false
end type

type st_inicio from statictext within w_ing_carta_solicitud
integer x = 1924
integer y = 698
integer width = 424
integer height = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Fecha Inicio:"
boolean focusrectangle = false
end type

type sle_solicitante from singlelineedit within w_ing_carta_solicitud
integer x = 472
integer y = 80
integer width = 461
integer height = 77
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event modified;integer li_acceso
string ls_solicitante

long ll_cuenta

ls_solicitante=sle_solicitante.text
f_reset()

if rb_alumno.checked=true then
	if cbx_intercambio.checked=false then
		
		li_acceso=f_valida_alumno(ls_solicitante)
		
	//	if li_acceso=0 or li_acceso=2 then
		
			idwc_grupomat.Retrieve(gi_depto,gi_area)
			if idwc_grupomat.RowCount()>0 then dw_grupomat.insertrow(0)
	
			dw_grupomat.enabled=true
			dw_matgrupo.enabled=true
			mle_observaciones.enabled=true
			sle_motivo.enabled=true
	
			st_nombre.text=is_solicitantenom
			cb_buscar.enabled=true
			
			ii_tipo_usuario=1
		
	//	else
	//		if li_acceso=1 then messagebox('Aviso','El alumno no se encuentra inscrito en el semestre.')
	//	end if
		
	else
	
		li_acceso=f_valida_alumno_intercambio(ls_solicitante)
		
		if li_acceso=0 or li_acceso=2 then
			
			idwc_grupomat.Retrieve(gi_depto,gi_area)
			if idwc_grupomat.RowCount()>0 then dw_grupomat.insertrow(0)
	
			dw_grupomat.enabled=true
			dw_matgrupo.enabled=true
			mle_observaciones.enabled=true
			sle_motivo.enabled=true
	
			st_nombre.text=is_solicitantenom
			cb_buscar.enabled=true
			
			ii_tipo_usuario=2
	
		else
			if li_acceso=1 then messagebox('Aviso','El alumno no se encuentra inscrito en el semestre.')
		end if
	
	end if
	
else

	li_acceso=f_valida_empleado(ls_solicitante)
	
	if li_acceso=0 or li_acceso=2 then
		
		idwc_grupomat.Retrieve(gi_depto,gi_area)
		if idwc_grupomat.RowCount()>0 then dw_grupomat.insertrow(0)

		dw_grupomat.enabled=true
		dw_matgrupo.enabled=true
		mle_observaciones.enabled=true
		sle_motivo.enabled=true

		st_nombre.text=is_solicitantenom
		cb_buscar.enabled=true
		
		ii_tipo_usuario=3

	else
		if li_acceso=1 then messagebox('Aviso','El alumno no se encuentra inscrito en el semestre.')
	end if
	
end if
end event

type cbx_intercambio from checkbox within w_ing_carta_solicitud
integer x = 479
integer y = 166
integer width = 413
integer height = 74
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Intercambio"
end type

event clicked;sle_solicitante.SetFocus()
end event

type rb_alumno from radiobutton within w_ing_carta_solicitud
integer x = 48
integer y = 74
integer width = 369
integer height = 77
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
string text = "Alumno"
boolean checked = true
end type

event clicked;sle_solicitante.SetFocus()
end event

type gb_material from groupbox within w_ing_carta_solicitud
integer x = 59
integer y = 627
integer width = 1810
integer height = 288
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Material"
end type

type gb_disponible from groupbox within w_ing_carta_solicitud
integer x = 59
integer y = 957
integer width = 3032
integer height = 682
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = " Material Disponible"
end type

type gb_seleccionado from groupbox within w_ing_carta_solicitud
integer x = 59
integer y = 1674
integer width = 3032
integer height = 768
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Material Seleccionado"
end type

type gb_solicitud from groupbox within w_ing_carta_solicitud
integer x = 1891
integer y = 630
integer width = 1189
integer height = 288
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 30520472
string text = "Solicitud"
end type

type dw_carta from datawindow within w_ing_carta_solicitud
integer x = 3156
integer y = 566
integer width = 293
integer height = 189
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_ing_carta_prestamo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_fecha_inicio from editmask within w_ing_carta_solicitud
integer x = 2359
integer y = 691
integer width = 373
integer height = 70
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
string text = "00/00/0000"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_disponible.Reset()
cb_generar.enabled=false

end event

type em_fecha_final from editmask within w_ing_carta_solicitud
integer x = 2359
integer y = 803
integer width = 373
integer height = 70
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
boolean enabled = false
string text = "00/00/0000"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_disponible.Reset()
cb_generar.enabled=false

end event

type gb_1 from groupbox within w_ing_carta_solicitud
integer x = 29
integer y = 42
integer width = 417
integer height = 208
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 30520472
end type

