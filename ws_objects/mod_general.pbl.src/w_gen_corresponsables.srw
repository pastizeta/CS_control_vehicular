$PBExportHeader$w_gen_corresponsables.srw
$PBExportComments$Ventana para captura de corresponsables de préstamo
forward
global type w_gen_corresponsables from w_response
end type
type cb_close from u_cb within w_gen_corresponsables
end type
type cb_del from u_cb within w_gen_corresponsables
end type
type cb_add from u_cb within w_gen_corresponsables
end type
type dw_corresp from u_dw within w_gen_corresponsables
end type
end forward

global type w_gen_corresponsables from w_response
integer width = 2597
integer height = 1504
string title = "Corresponsables"
boolean center = true
cb_close cb_close
cb_del cb_del
cb_add cb_add
dw_corresp dw_corresp
end type
global w_gen_corresponsables w_gen_corresponsables

type variables
n_ds		ids_corresp
end variables

forward prototypes
public function string wf_busca_alumno (long al_cuenta)
public function string wf_busca_alumno_dca (long al_cuenta)
public function string wf_busca_empleado (long al_nomina)
end prototypes

public function string wf_busca_alumno (long al_cuenta);//////////////////////////////////////////////////////////////////////////////
//	Function:		wf_busca_alumno
//	Arguments:		al_cuenta
//	Returns:			Nombre alumno
//	Description:		Valida que el alumno este incrito.
//////////////////////////////////////////////////////////////////////////////

string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito

if al_cuenta <= 0 or isnull(al_cuenta) then return ""


setpointer(hourglass!)
 SELECT v_sce_banderas_inscrito.cuenta,   
	         v_sce_alumnos.nombre+ ' ' + isnull(v_sce_alumnos.apaterno,'')+' ' +isnull(v_sce_alumnos.amaterno,'') as nombre_completo  ,
			v_sce_carreras.carrera
INTO 		:ll_cuenta_inscrito,   
	        	:ls_nombrecompleto,
			:ls_carrera
FROM      v_sce_alumnos	INNER JOIN	v_sce_academicos ON 
				v_sce_alumnos.cuenta = v_sce_academicos.cuenta
									INNER JOIN	v_sce_carreras ON
				v_sce_academicos.cve_carrera = v_sce_carreras.cve_carrera 
									LEFT OUTER JOIN	v_sce_banderas_inscrito ON
				v_sce_alumnos.cuenta = v_sce_banderas_inscrito.cuenta
WHERE	v_sce_alumnos.cuenta = :al_cuenta
USING	gtr_sumuia;
setpointer(arrow!)	
if gtr_sumuia.sqlcode < 0 or gtr_sumuia.sqlcode = 100 then
	messagebox("Mensaje del Sistema","Alumno NO Existe",exclamation!)
	return ""
end if
if  isnull(ll_cuenta_inscrito) then
	messagebox("Mensaje del Sistema","Alumno NO Inscrito",exclamation!)
	return ""
end if
return ls_nombrecompleto
end function

public function string wf_busca_alumno_dca (long al_cuenta);string ls_nombrecompleto,ls_carrera
long ll_cuenta_inscrito
integer liAnio, liPeriodo, li_mes, Res

liAnio = Year(Today())
li_mes =	integer(string(today(),'m'))
CHOOSE CASE li_mes
	CASE 1,2,3,4,5
		liPeriodo = 0
		
	CASE 6,7
		liPeriodo = 1
		
	CASE 8,9,10,11,12
		liPeriodo = 2
		
END CHOOSE

setpointer(hourglass!)
SELECT	dbo.dca_alumnos_ext.no_folio_inter,   
         	dbo.dca_alumnos_ext.s_lastname+' '+ dbo.dca_alumnos_ext.s_name as nombre_completo,
			dbo.dca_alumnos_ext.major
INTO		:ll_cuenta_inscrito, :ls_nombrecompleto, :ls_carrera
FROM 	dbo.dca_alumnos_ext,   
			dbo.dcaPeriodoEstancia  
WHERE	( dbo.dca_alumnos_ext.no_folio_inter = dbo.dcaPeriodoEstancia.noFolioCuenta ) AND
			( dbo.dca_alumnos_ext.no_folio_inter = :al_cuenta ) AND
			( dbo.dcaPeriodoEstancia.anio = :liAnio ) AND
			( dbo.dcaPeriodoEstancia.periodo = :liPeriodo )  
USING	gtr_sumuia;
setpointer(arrow!)	
if gtr_sumuia.sqlcode=100 or gtr_sumuia.sqlcode < 0 then
	messagebox("Mensaje del Sistema","Alumno NO Inscrito~r~n"+gtr_sumuia.sqlerrtext,exclamation!)
	return ""
end if

return ls_nombrecompleto
end function

public function string wf_busca_empleado (long al_nomina);//////////////////////////////////////////////////////////////////////////////
//	Function:		wf_busca_empleado
//	Arguments:		al_nomina
//	Returns:			Objeto con la información del empleado
//	Description:	Permite consultar si el empleado es profesor del area 
//						en caso de ser afirmativo carga el nombre del mismo y las
//						materias que imparte en el semestre actual
//////////////////////////////////////////////////////////////////////////////

string ls_nombrecompleto,ls_costo,ls_depto
setpointer(hourglass!)
SELECT	nombre+' '+isnull(appaterno,'') +' ' +isnull(apmaterno,'') as nombrecompleto,   
			ccosto,   
			nombredepto  
INTO		:ls_nombrecompleto,   
			:ls_costo,   
			:ls_depto  
FROM		empl_uia1  
WHERE	empl_uia1.empleado = :al_nomina
USING	gtr_personal;
setpointer(arrow!)

if gtr_personal.sqlcode < 0 or gtr_personal.sqlcode = 100 then
	MessageBox("Aviso del Sistema", "El profesor no existe~r~n"+gtr_personal.sqlerrtext,information!)
	commit using gtr_personal;
	return ""
end if

commit using gtr_personal;
return ls_nombrecompleto
end function

on w_gen_corresponsables.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.cb_del=create cb_del
this.cb_add=create cb_add
this.dw_corresp=create dw_corresp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.cb_del
this.Control[iCurrent+3]=this.cb_add
this.Control[iCurrent+4]=this.dw_corresp
end on

on w_gen_corresponsables.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.cb_del)
destroy(this.cb_add)
destroy(this.dw_corresp)
end on

event open;call super::open;//Esta ventana debe abrirse con un datastore como parámetro
//con dataobject "dw_gen_corresponsables_sol"
long	ll_i, ll_cve, ll_tip
string	ls_dig
if not isvalid(message.powerobjectparm) then
	post close(this)
	return
end if

if message.powerobjectparm.TypeOf() <> datastore! then
	post close(this)
	return
end if

if message.powerobjectparm.ClassName() <> 'n_ds' then
	post close(this)
	return
end if

ids_corresp	=	message.powerobjectparm

if ids_corresp.DataObject <> dw_corresp.DataObject then
	post close(this)
	return
end if

ids_corresp.ShareData(dw_corresp)

//Formato y llenado al campo de captura del usuario.
for ll_i = 1 to dw_corresp.RowCount()
	ll_cve	=	dw_corresp.GetItemNumber(ll_i, 'solicitanteid')
	if isnull(ll_cve) or ll_cve <= 0 then continue
	ll_tip	=	dw_corresp.GetItemNumber(ll_i,'solicitante_tipo')
	if ll_tip = 1 then 
		ls_dig = "-"+obten_digito(ll_cve)
	else
		ls_dig	=	""
	end if
	dw_corresp.SetItem(ll_i,'solicitanteid_char',string(ll_cve)+ls_dig)
next
	
	
	
	
	
	
	
	
	
	
	
	
	
end event

event close;call super::close;if isvalid(ids_corresp) then	ids_corresp.ShareDataOff()

end event

event pfc_default;call super::pfc_default;this.Event pfc_Apply()
Close(this)
end event

event pfc_apply;call super::pfc_apply;long	ll_j, ll_id

for ll_j = 1 to dw_Corresp.Rowcount()
	ll_id = dw_Corresp.GetItemNumber(ll_j,'solicitanteid')
	if isnull(ll_id) or ll_id = 0 then
		dw_Corresp.DeleteRow(ll_j)
		ll_j --
	end if
next
end event

type cb_close from u_cb within w_gen_corresponsables
integer x = 2191
integer y = 1296
integer width = 351
integer height = 93
integer taborder = 40
string text = "&Cerrar"
end type

event clicked;call super::clicked;parent.Event pfc_Default()
end event

type cb_del from u_cb within w_gen_corresponsables
integer x = 457
integer y = 1296
integer width = 351
integer height = 93
integer taborder = 30
string text = "&Elimnar"
end type

event clicked;call super::clicked;dw_corresp.Event pfc_deleterow()
end event

type cb_add from u_cb within w_gen_corresponsables
integer x = 59
integer y = 1296
integer width = 351
integer height = 93
integer taborder = 20
string text = "&Agregar"
end type

event clicked;call super::clicked;dw_corresp.Event pfc_addrow()
dw_corresp.SetFocus()
dw_corresp.SetRow(dw_corresp.RowCount())
end event

type dw_corresp from u_dw within w_gen_corresponsables
integer x = 26
integer y = 32
integer width = 2523
integer height = 1248
integer taborder = 10
string dataobject = "dw_gen_corresponsables_sol"
boolean ib_isupdateable = false
end type

event itemchanged;call super::itemchanged;string	ls_null, ls_dig, ls_id, ls_nom
long	ll_null, ll_tip, ll_id, ll_pos
setnull(ls_null)
setnull(ll_null)

if dwo.name = 'solicitante_tipo' then
	SetItem(row,'solicitantenombre',ls_null)
	SetItem(row,'solicitanteid_char',ls_null)
	SetItem(row,'solicitanteid',ll_null)
	
elseif dwo.name = 'solicitanteid_char' then
	ll_tip	=	GetitemNumber(row,'solicitante_tipo')
	if ll_tip = 1 then //Alumno
		if not match(data,"^[0-9]+-?[0-9Aa]$") then
			MessageBox("Aviso","Cuenta Inválida.")
			return 2
		end if
		ll_pos	=	pos(data,'-')
		if ll_pos = 0 then ll_pos = len(data)
		ls_dig	=	right(data,1)
		ll_id = long(left(data,ll_pos - 1))
		ls_nom = wf_busca_alumno(ll_id)
		if isnull(ls_nom) or len(trim(ls_nom))= 0 then
			return 2
		end if
		SetItem(row,'solicitanteid',ll_id)
		SetItem(row,'solicitantenombre',ls_nom)
		
	elseif ll_tip = 2 then //Intercambio
		ll_id	=	long(data)
		if ll_id <= 0 or isnull(ll_id) then
			MessageBox("Aviso","Cuenta Inválida")
			return 2
		end if
		ls_nom	=	wf_busca_alumno_dca(ll_id)
		if isnull(ls_nom) or len(trim(ls_nom)) = 0 then
			return 2
		end if
		SetItem(row,'solicitanteid',ll_id)
		SetItem(row,'solicitantenombre',ls_nom)
			
	elseif ll_tip = 3 then //Profesor
		ll_id	=	long(data)
		if ll_id <= 0 or isnull(ll_id) then
			MessageBox("Aviso","Nómina Inválida")
			return 2
		end if
		ls_nom	=	wf_busca_empleado(ll_id)
		if isnull(ls_nom) or len(trim(ls_nom)) = 0 then
			return 2
		end if
		SetItem(row,'solicitanteid',ll_id)
		SetItem(row,'solicitantenombre',ls_nom)
		
	end if
end if	
end event

