$PBExportHeader$w_calendario_sem_com.srw
forward
global type w_calendario_sem_com from w_calendario
end type
type dw_criterios from datawindow within w_calendario_sem_com
end type
type cbx_pormaterial from checkbox within w_calendario_sem_com
end type
end forward

global type w_calendario_sem_com from w_calendario
integer width = 2350
integer height = 1048
long backcolor = 80269524
dw_criterios dw_criterios
cbx_pormaterial cbx_pormaterial
end type
global w_calendario_sem_com w_calendario_sem_com

type variables
datawindowchild idwc_tipoespacio,idwc_espacio
long liGrupo 
string lsmat
end variables

on w_calendario_sem_com.create
int iCurrent
call super::create
this.dw_criterios=create dw_criterios
this.cbx_pormaterial=create cbx_pormaterial
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_criterios
this.Control[iCurrent+2]=this.cbx_pormaterial
end on

on w_calendario_sem_com.destroy
call super::destroy
destroy(this.dw_criterios)
destroy(this.cbx_pormaterial)
end on

event open;call super::open;iw_parent = this.parentwindow().getactivesheet()

gi_depto = 4


//CHILD TIPO DE ESPACIO
dw_criterios.settransobject(gtr_sumuia)
dw_criterios.getchild('tipo_espacio',idwc_tipoespacio)
idwc_tipoespacio.settransobject(gtr_sumuia)
idwc_tipoespacio.retrieve(gi_depto)
idwc_tipoespacio.insertrow(1)

idwc_tipoespacio.SetFilter("cvearea = "+string(gi_area))
idwc_tipoespacio.Filter()
//CHILD ESPACIO


dw_criterios.settransobject(gtr_sumuia)
dw_criterios.getchild('espacio',idwc_espacio)
idwc_espacio.settransobject(gtr_sumuia)
idwc_espacio.retrieve(gi_depto,gi_area,1)
idwc_espacio.insertrow(1)
//
dw_criterios.insertrow(0)



end event

type uo_calendario from w_calendario`uo_calendario within w_calendario_sem_com
end type

type cb_aplicar from w_calendario`cb_aplicar within w_calendario_sem_com
end type

event cb_aplicar::clicked;call super::clicked;
if cbx_pormaterial.checked then

	liGrupo = liGrupo
	lsmat = lsmat

	iw_parent.dynamic event ue_recuperar_pormaterial(liGrupo,lsmat)
else
	iw_parent.dynamic event ue_recuperar()
end if

end event

type cb_cerrar from w_calendario`cb_cerrar within w_calendario_sem_com
end type

type dw_criterios from datawindow within w_calendario_sem_com
integer x = 1010
integer y = 156
integer width = 1271
integer height = 180
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_com_busqueda_consulta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;
if string(dwo.name)='tipo_espacio'then
	idwc_espacio.settransobject(gtr_sumuia)
	idwc_espacio.retrieve(gi_depto,gi_area,integer(data))
	liGrupo = long(data)
elseif string(dwo.name)='espacio' then
	lsmat = string(data)
end if
	


















end event

type cbx_pormaterial from checkbox within w_calendario_sem_com
integer x = 1797
integer y = 28
integer width = 485
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Material"
boolean lefttext = true
end type

