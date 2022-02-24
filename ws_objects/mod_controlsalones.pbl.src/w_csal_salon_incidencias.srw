$PBExportHeader$w_csal_salon_incidencias.srw
forward
global type w_csal_salon_incidencias from window
end type
type dw_csal_incidencia from u_basedw within w_csal_salon_incidencias
end type
type st_2 from statictext within w_csal_salon_incidencias
end type
type st_observaciones from statictext within w_csal_salon_incidencias
end type
type mle_observaciones from multilineedit within w_csal_salon_incidencias
end type
type cb_guardar from commandbutton within w_csal_salon_incidencias
end type
type st_1 from statictext within w_csal_salon_incidencias
end type
type em_hora from editmask within w_csal_salon_incidencias
end type
type st_fecha from statictext within w_csal_salon_incidencias
end type
type st_profesor from statictext within w_csal_salon_incidencias
end type
type st_salon from statictext within w_csal_salon_incidencias
end type
type sle_salon from singlelineedit within w_csal_salon_incidencias
end type
type st_nombre_profesor from statictext within w_csal_salon_incidencias
end type
type sle_profesor from singlelineedit within w_csal_salon_incidencias
end type
type dw_csal_materias_profesor_grupo from u_basedw within w_csal_salon_incidencias
end type
type dw_csal_materias_profesor from u_basedw within w_csal_salon_incidencias
end type
type dw_csal_profesor from u_basedw within w_csal_salon_incidencias
end type
type em_fecha from editmask within w_csal_salon_incidencias
end type
type gb_1 from groupbox within w_csal_salon_incidencias
end type
end forward

global type w_csal_salon_incidencias from window
integer width = 3781
integer height = 1418
boolean titlebar = true
string title = "Registro de incidencias"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_csal_incidencia dw_csal_incidencia
st_2 st_2
st_observaciones st_observaciones
mle_observaciones mle_observaciones
cb_guardar cb_guardar
st_1 st_1
em_hora em_hora
st_fecha st_fecha
st_profesor st_profesor
st_salon st_salon
sle_salon sle_salon
st_nombre_profesor st_nombre_profesor
sle_profesor sle_profesor
dw_csal_materias_profesor_grupo dw_csal_materias_profesor_grupo
dw_csal_materias_profesor dw_csal_materias_profesor
dw_csal_profesor dw_csal_profesor
em_fecha em_fecha
gb_1 gb_1
end type
global w_csal_salon_incidencias w_csal_salon_incidencias

type variables
DatawindowChild idwc_materias_profesor, idwc_materias_profesor_grupo
DatawindowChild idwc_profesor, idwc_incidencia

string is_salon='', is_grupo='', is_profesor='', is_materia='', is_observaciones
long il_profesor=0, il_materia=0

integer ii_anio, ii_periodo, ii_hora, ii_incidencia=0
date id_fecha
datetime idt_fecha
end variables

forward prototypes
public function integer f_ultimo_consec ()
public subroutine uf_cambio_profesor (string ps_texto)
public subroutine uf_registrar_incidencia ()
public subroutine uf_limpiar ()
end prototypes

public function integer f_ultimo_consec ();/*integer li_consec

select isnull(max(consec),0)+1
into :li_consec
from dbo.salon_mobiliario
where cve_salon =:is_salon
using gtr_escolar; 

if gtr_escolar.SQLCode = -1 then 
	messagebox("Error ESCOLAR: Obtener máximo mobiliario", gtr_escolar.SQLErrText)	
	rollback using gtr_escolar;
	return -1
else
	commit using gtr_escolar;	
end if


return(li_consec)*/

return 0
end function

public subroutine uf_cambio_profesor (string ps_texto);long ll_profesor

dw_csal_materias_profesor.reset()
dw_csal_materias_profesor_grupo.reset()

il_materia=0
is_grupo="NA"
 
 if IsNumber(ps_texto) then

	ll_profesor=long(ps_texto)
	il_profesor=ll_profesor
	is_profesor=f_select_nombre_profesor(ll_profesor)
	
	sle_profesor.text=string(ll_profesor)
	st_nombre_profesor.text=is_profesor

	idwc_materias_profesor.retrieve(ii_anio, ii_periodo,ll_profesor)
	if idwc_materias_profesor.RowCount()>0 then dw_csal_materias_profesor.insertrow(0)

end if
end subroutine

public subroutine uf_registrar_incidencia ();long ll_id=0
datetime ldt_ahorita

ldt_ahorita=DateTime(Today(),Now())

select isnull(max(id),0)+1
into :ll_id
from dbo.spre_incidencias 
using gtr_sumuia; 

if gtr_sumuia.SQLCode = -1 then 
	messagebox("Error SUMUIA: Obtener Máximo ID de Incidencia", gtr_sumuia.SQLErrText)	
	rollback using gtr_sumuia;
	return
else
	commit using gtr_sumuia;	
end if


//Insertar incidencia
insert into dbo.spre_incidencias
(id, cve_incidencia, cve_profesor, cve_materia, cve_grupo, cve_salon, profesor, materia, 
fecha_incidencia, fecha_registro, anio, cveperiodo, observaciones, usuario)
 
values
(:ll_id, :ii_incidencia, :il_profesor, :il_materia, :is_grupo, :is_salon, :is_profesor, :is_materia,
:idt_fecha, :ldt_ahorita, :ii_anio, :ii_periodo, :is_observaciones, :gs_usuario)

using gtr_sumuia;	

if gtr_sumuia.sqlcode<>0 then
	messagebox("Error al insertar incidencia: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
else
	commit using gtr_sumuia;
	messagebox("Aviso","La incidencia ha quedado registrada con el folio: "+string(ll_id))
	uf_limpiar()
end if	
	
end subroutine

public subroutine uf_limpiar ();sle_salon.text=''
sle_profesor.text=''
mle_observaciones.text=''

em_hora.text= string(07)
em_fecha.text=string(today())
ii_hora=integer(trim(em_hora.text))
id_fecha=date(em_fecha.text)

dw_csal_profesor.Reset()
dw_csal_materias_profesor.Reset()
dw_csal_materias_profesor_grupo.Reset()
dw_csal_incidencia.Reset()

idwc_profesor.Retrieve()
if idwc_profesor.RowCount()>0 then dw_csal_profesor.InsertRow(0)

idwc_incidencia.Retrieve()
if idwc_incidencia.RowCount()>0 then dw_csal_incidencia.InsertRow(0)

is_salon='' 
is_grupo='' 
is_profesor='' 
is_materia='' 
is_observaciones=''
il_profesor=0 
il_materia=0
ii_incidencia=0

st_nombre_profesor.text=''

end subroutine

on w_csal_salon_incidencias.create
this.dw_csal_incidencia=create dw_csal_incidencia
this.st_2=create st_2
this.st_observaciones=create st_observaciones
this.mle_observaciones=create mle_observaciones
this.cb_guardar=create cb_guardar
this.st_1=create st_1
this.em_hora=create em_hora
this.st_fecha=create st_fecha
this.st_profesor=create st_profesor
this.st_salon=create st_salon
this.sle_salon=create sle_salon
this.st_nombre_profesor=create st_nombre_profesor
this.sle_profesor=create sle_profesor
this.dw_csal_materias_profesor_grupo=create dw_csal_materias_profesor_grupo
this.dw_csal_materias_profesor=create dw_csal_materias_profesor
this.dw_csal_profesor=create dw_csal_profesor
this.em_fecha=create em_fecha
this.gb_1=create gb_1
this.Control[]={this.dw_csal_incidencia,&
this.st_2,&
this.st_observaciones,&
this.mle_observaciones,&
this.cb_guardar,&
this.st_1,&
this.em_hora,&
this.st_fecha,&
this.st_profesor,&
this.st_salon,&
this.sle_salon,&
this.st_nombre_profesor,&
this.sle_profesor,&
this.dw_csal_materias_profesor_grupo,&
this.dw_csal_materias_profesor,&
this.dw_csal_profesor,&
this.em_fecha,&
this.gb_1}
end on

on w_csal_salon_incidencias.destroy
destroy(this.dw_csal_incidencia)
destroy(this.st_2)
destroy(this.st_observaciones)
destroy(this.mle_observaciones)
destroy(this.cb_guardar)
destroy(this.st_1)
destroy(this.em_hora)
destroy(this.st_fecha)
destroy(this.st_profesor)
destroy(this.st_salon)
destroy(this.sle_salon)
destroy(this.st_nombre_profesor)
destroy(this.sle_profesor)
destroy(this.dw_csal_materias_profesor_grupo)
destroy(this.dw_csal_materias_profesor)
destroy(this.dw_csal_profesor)
destroy(this.em_fecha)
destroy(this.gb_1)
end on

event open;
f_select_anio_periodo_actual(ii_periodo,ii_anio,today())

em_hora.text= string(07)
em_fecha.text=string(today())
ii_hora=integer(trim(em_hora.text))
id_fecha=date(em_fecha.text)

//Profesor
dw_csal_profesor.settransobject(gtr_escolar)
dw_csal_profesor.getchild('profesor',idwc_profesor)
idwc_profesor.settransobject(gtr_escolar)
idwc_profesor.Retrieve()
if idwc_profesor.RowCount()>0 then dw_csal_profesor.InsertRow(0)

//Materias de un Profesor
dw_csal_materias_profesor.settransobject(gtr_escolar)
dw_csal_materias_profesor.getchild('materias_materia',idwc_materias_profesor)
idwc_materias_profesor.settransobject(gtr_escolar)

//Grupos de Materias de un Profesor
dw_csal_materias_profesor_grupo.settransobject(gtr_escolar)
dw_csal_materias_profesor_grupo.getchild('gpo',idwc_materias_profesor_grupo)
idwc_materias_profesor_grupo.settransobject(gtr_escolar)

//Incidencia
dw_csal_incidencia.settransobject(gtr_sumuia)
dw_csal_incidencia.getchild('incidencia',idwc_incidencia)
idwc_incidencia.settransobject(gtr_sumuia)
idwc_incidencia.Retrieve()
if idwc_incidencia.RowCount()>0 then dw_csal_incidencia.InsertRow(0)


end event

type dw_csal_incidencia from u_basedw within w_csal_salon_incidencias
integer x = 545
integer y = 490
integer width = 1360
integer height = 93
integer taborder = 30
string dataobject = "d_csal_salon_incidencias_drop"
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;
ii_incidencia=integer(this.gettext())

end event

type st_2 from statictext within w_csal_salon_incidencias
integer x = 73
integer y = 490
integer width = 461
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Incidencia:"
boolean focusrectangle = false
end type

type st_observaciones from statictext within w_csal_salon_incidencias
integer x = 73
integer y = 621
integer width = 464
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Observaciones:"
boolean focusrectangle = false
end type

type mle_observaciones from multilineedit within w_csal_salon_incidencias
integer x = 552
integer y = 621
integer width = 2681
integer height = 515
integer taborder = 30
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

type cb_guardar from commandbutton within w_csal_salon_incidencias
integer x = 3266
integer y = 1027
integer width = 410
integer height = 106
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Registrar"
end type

event clicked;string ls_hora

if is_salon='' then
	messagebox('Aviso','Debe indicar un salón válido')
	return
end if

if ii_hora<0 or ii_hora>23 then
	messagebox('Aviso','Debe indicar una hora válida')
	return
end if

if il_profesor=0 then
	messagebox('Aviso','Debe indicar el profesor encargado del salón durante la incidencia')
	return
end if	

if ii_incidencia=0 then
	messagebox('Aviso','Debe indicar el tipo de incidencia')
	return
end if	

if trim(mle_observaciones.text)='' then
	messagebox('Aviso','Debe indicar observaciones de la incidencia')
	return
end if	

is_observaciones=mid(trim(mle_observaciones.text),1,250)
if ii_hora<10 then ls_hora='0' +string(ii_hora) else ls_hora=string(ii_hora)
ls_hora=ls_hora+':00:00'

idt_fecha=datetime(id_fecha,time(ls_hora))

uf_registrar_incidencia()
end event

type st_1 from statictext within w_csal_salon_incidencias
integer x = 2790
integer y = 125
integer width = 304
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Hora:"
boolean focusrectangle = false
end type

type em_hora from editmask within w_csal_salon_incidencias
integer x = 2992
integer y = 106
integer width = 179
integer height = 90
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 33554431
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##########"
string minmax = "0~~23"
end type

event modified;ii_hora=integer(trim(em_hora.text))

end event

type st_fecha from statictext within w_csal_salon_incidencias
integer x = 1730
integer y = 125
integer width = 293
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Fecha:"
boolean focusrectangle = false
end type

type st_profesor from statictext within w_csal_salon_incidencias
integer x = 73
integer y = 243
integer width = 410
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Profesor:"
boolean focusrectangle = false
end type

type st_salon from statictext within w_csal_salon_incidencias
integer x = 73
integer y = 125
integer width = 410
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Salón:"
boolean focusrectangle = false
end type

type sle_salon from singlelineedit within w_csal_salon_incidencias
integer x = 549
integer y = 125
integer width = 450
integer height = 90
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_salon

ls_salon=(trim(this.text))

if f_select_salon_valido(ls_salon)>0 then
	is_salon=ls_salon
	sle_profesor.SetFocus()
else
	messagebox('Aviso','Debe indicar un salón válido.')
	is_salon=''
end if


end event

type st_nombre_profesor from statictext within w_csal_salon_incidencias
integer x = 1031
integer y = 243
integer width = 2586
integer height = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
boolean focusrectangle = false
end type

type sle_profesor from singlelineedit within w_csal_salon_incidencias
integer x = 549
integer y = 243
integer width = 450
integer height = 90
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event modified;st_nombre_profesor.text=''

dw_csal_profesor.Reset()
idwc_profesor.Retrieve()
if idwc_profesor.RowCount()>0 then dw_csal_profesor.InsertRow(0)

uf_cambio_profesor(trim(this.text))

end event

type dw_csal_materias_profesor_grupo from u_basedw within w_csal_salon_incidencias
integer x = 3343
integer y = 365
integer width = 282
integer height = 96
integer taborder = 30
string dataobject = "d_csal_materias_profesor_grupo_drop"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("gpo", "gpo", "gpo")
end event

event itemchanged;call super::itemchanged;integer li_grupos, li_row

is_grupo=this.gettext()

li_grupos=idwc_materias_profesor_grupo.rowcount()
li_row=idwc_materias_profesor_grupo.Find("gpo='"+is_grupo+"'",1,li_grupos)


end event

type dw_csal_materias_profesor from u_basedw within w_csal_salon_incidencias
integer x = 1953
integer y = 365
integer width = 1360
integer height = 96
integer taborder = 20
string dataobject = "d_csal_materias_profesor_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("materias_materia", "materias_materia", "materias_materia")
end event

event itemchanged;call super::itemchanged;integer li_materias, li_row
long ll_cve_materia

ll_cve_materia=long(this.gettext())
il_materia=ll_cve_materia
is_materia=idwc_materias_profesor.GetItemString(li_row,"materias_materia")
is_grupo='NA'

dw_csal_materias_profesor_grupo.Reset()
idwc_materias_profesor_grupo.Reset()

idwc_materias_profesor_grupo.retrieve(ii_anio,ii_periodo,il_profesor,il_materia)
if idwc_materias_profesor_grupo.RowCount()>0 then dw_csal_materias_profesor_grupo.insertrow(0)
  
li_materias=idwc_materias_profesor.rowcount()
li_row=idwc_materias_profesor.Find("grupos_cve_mat="+string(ll_cve_materia),1,li_materias)





end event

type dw_csal_profesor from u_basedw within w_csal_salon_incidencias
integer x = 545
integer y = 365
integer width = 1360
integer height = 93
integer taborder = 20
string dataobject = "d_csal_profesor_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("profesor", "profesor", "profesor")
end event

event itemchanged;call super::itemchanged;sle_profesor.text=''
st_nombre_profesor.text=''

uf_cambio_profesor(trim(this.gettext()))

end event

type em_fecha from editmask within w_csal_salon_incidencias
integer x = 2081
integer y = 125
integer width = 508
integer height = 90
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
boolean border = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean dropdowncalendar = true
end type

event modified;id_fecha=date(em_fecha.text)

end event

type gb_1 from groupbox within w_csal_salon_incidencias
integer x = 40
integer y = 19
integer width = 3690
integer height = 1248
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
end type

