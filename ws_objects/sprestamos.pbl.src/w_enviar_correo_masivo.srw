$PBExportHeader$w_enviar_correo_masivo.srw
forward
global type w_enviar_correo_masivo from window
end type
type em_fecha_final from editmask within w_enviar_correo_masivo
end type
type st_7 from statictext within w_enviar_correo_masivo
end type
type em_registros from editmask within w_enviar_correo_masivo
end type
type st_2 from statictext within w_enviar_correo_masivo
end type
type cb_5 from commandbutton within w_enviar_correo_masivo
end type
type dw_2 from datawindow within w_enviar_correo_masivo
end type
type cb_4 from commandbutton within w_enviar_correo_masivo
end type
type cb_3 from commandbutton within w_enviar_correo_masivo
end type
type cb_2 from commandbutton within w_enviar_correo_masivo
end type
type cb_1 from commandbutton within w_enviar_correo_masivo
end type
type dw_obtenconsulta from datawindow within w_enviar_correo_masivo
end type
type em_diasaconsultar from editmask within w_enviar_correo_masivo
end type
type em_dias from editmask within w_enviar_correo_masivo
end type
type em_fecha_apartir from editmask within w_enviar_correo_masivo
end type
type st_1 from statictext within w_enviar_correo_masivo
end type
type st_3 from statictext within w_enviar_correo_masivo
end type
type st_6 from statictext within w_enviar_correo_masivo
end type
type st_5 from statictext within w_enviar_correo_masivo
end type
type st_4 from statictext within w_enviar_correo_masivo
end type
type gb_1 from groupbox within w_enviar_correo_masivo
end type
end forward

global type w_enviar_correo_masivo from window
integer width = 3657
integer height = 2416
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 29534863
em_fecha_final em_fecha_final
st_7 st_7
em_registros em_registros
st_2 st_2
cb_5 cb_5
dw_2 dw_2
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_obtenconsulta dw_obtenconsulta
em_diasaconsultar em_diasaconsultar
em_dias em_dias
em_fecha_apartir em_fecha_apartir
st_1 st_1
st_3 st_3
st_6 st_6
st_5 st_5
st_4 st_4
gb_1 gb_1
end type
global w_enviar_correo_masivo w_enviar_correo_masivo

type variables
integer liEquipoSol
datetime fecha,fecha_masdias
end variables

on w_enviar_correo_masivo.create
this.em_fecha_final=create em_fecha_final
this.st_7=create st_7
this.em_registros=create em_registros
this.st_2=create st_2
this.cb_5=create cb_5
this.dw_2=create dw_2
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_obtenconsulta=create dw_obtenconsulta
this.em_diasaconsultar=create em_diasaconsultar
this.em_dias=create em_dias
this.em_fecha_apartir=create em_fecha_apartir
this.st_1=create st_1
this.st_3=create st_3
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.gb_1=create gb_1
this.Control[]={this.em_fecha_final,&
this.st_7,&
this.em_registros,&
this.st_2,&
this.cb_5,&
this.dw_2,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_obtenconsulta,&
this.em_diasaconsultar,&
this.em_dias,&
this.em_fecha_apartir,&
this.st_1,&
this.st_3,&
this.st_6,&
this.st_5,&
this.st_4,&
this.gb_1}
end on

on w_enviar_correo_masivo.destroy
destroy(this.em_fecha_final)
destroy(this.st_7)
destroy(this.em_registros)
destroy(this.st_2)
destroy(this.cb_5)
destroy(this.dw_2)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_obtenconsulta)
destroy(this.em_diasaconsultar)
destroy(this.em_dias)
destroy(this.em_fecha_apartir)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.gb_1)
end on

event open;datetime ldtm_fecha_hoy
ldtm_fecha_hoy = f_fecha_hora_servidor()
em_fecha_apartir.text = string(ldtm_fecha_hoy,"dd-mm-yyyy")

em_diasaconsultar.text = string(0)
em_dias.text = string(17)

em_dias.setfocus()
end event

type em_fecha_final from editmask within w_enviar_correo_masivo
integer x = 2725
integer y = 164
integer width = 361
integer height = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "none"
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_7 from statictext within w_enviar_correo_masivo
integer x = 2651
integer y = 192
integer width = 55
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 29534863
string text = "al"
boolean focusrectangle = false
end type

type em_registros from editmask within w_enviar_correo_masivo
integer x = 489
integer y = 2164
integer width = 293
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "none"
alignment alignment = center!
borderstyle borderstyle = styleraised!
string mask = "######"
end type

type st_2 from statictext within w_enviar_correo_masivo
integer x = 55
integer y = 2184
integer width = 407
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 29534863
string text = "Total registros"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_enviar_correo_masivo
integer x = 3026
integer y = 2164
integer width = 361
integer height = 96
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Salir"
end type

event clicked;close(parent)
end event

type dw_2 from datawindow within w_enviar_correo_masivo
integer x = 2263
integer y = 164
integer width = 361
integer height = 100
string title = "none"
string dataobject = "d_dateadd_1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(gtr_sumuia)
end event

type cb_4 from commandbutton within w_enviar_correo_masivo
integer x = 1897
integer y = 540
integer width = 361
integer height = 96
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Enviar e-mail"
end type

event clicked;
boolean  lb_ok=false
string ls_syntax, docname, named,ls_dwsyntax
string ls_email, ls_destinatario, ls_destinatario1

integer li_Sol, li_email,li_ind, liContCorreo = 0
string ls_ruta

mailReturnCode mrc_estado
mailMessage m_respuesta
mailFileDescription m_archivo

if dw_obtenconsulta.RowCount() > 0 then
	for li_ind = 1 to dw_obtenconsulta.RowCount()
		lb_ok = false

		li_Sol = dw_obtenconsulta.object.spre_reserva_espacios_sol_num[li_ind]
		ls_email = trim (dw_obtenconsulta.GetItemString(li_ind,'spre_solicitud_email_solicitante'))	
		ls_destinatario1 =trim(dw_obtenconsulta.GetItemString(li_ind,'spre_reserva_espacios_sol_nombre'))
	
			if (isnull(ls_email) or ls_email= "") then
				
				liContCorreo = liContCorreo + 1
//				messagebox("Aviso",'No existe direccion de correo para enviar e-mail')
			else
				ls_destinatario = "¡Confirmacion!~n~n~n~n" + &
				ls_destinatario1 + " " + "("+string(li_Sol)+")~n~n" + &
				" Su reservación ha quedado debidamente confirmada. El día del evento, a la hora indicada en su" + &	
				" formato, se le hará entrega del espacio y, en su caso, de los requerimientos solicitados.~n~n~n~n" + &
				" Atentamente.~n" + &
				" Administración de Espacios y Ceremonias Institucionales." + &
				" Ext. 4290"
					
				lb_ok = true

				ms_sesion = CREATE mailSession
				mrc_estado= ms_sesion.mailLogon(mailNewSession!)
					
				IF mrc_estado <> mailReturnSuccess! THEN
					messagebox("Aviso Importante",'No se puede conectar al servidor de correo')
					return
				end if
		
				m_archivo.filetype=mailAttach!
		
	//			m_archivo.Filename=ls_ruta
	//			m_archivo.Pathname=ls_ruta
							
				m_respuesta.Subject  = 'Confirmación de espacios'
				m_respuesta.NoteText =ls_destinatario 
				
	//			m_respuesta.AttachmentFile[1]=m_archivo
				
				m_respuesta.Recipient[1].RecipientType = mailTo!
				m_respuesta.Recipient[1].name = ls_email
				mrc_estado = ms_sesion.mailSend(m_respuesta)
				
				IF mrc_estado <> mailReturnSuccess! THEN
//					messagebox("Aviso","El correo no fue enviado, Favor de verificar su correo")
					lb_ok = false
				else
					messagebox("Aviso","El correo ha sido enviado")
				end if
				ms_sesion.mailLogoff( )
				DESTROY ms_sesion
				
			end if

	NEXT
	
	if liContCorreo > 0 then
		messagebox("Aviso","El correo no fue enviado a " + string(liContCorreo) + " solicitudes, no existe dirección de correo")
	end if
	
end if




end event

type cb_3 from commandbutton within w_enviar_correo_masivo
integer x = 2290
integer y = 540
integer width = 361
integer height = 96
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Exportar"
end type

event clicked;dw_obtenconsulta.SAVEAS()
end event

type cb_2 from commandbutton within w_enviar_correo_masivo
integer x = 1504
integer y = 540
integer width = 361
integer height = 96
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Actualizar"
end type

event clicked;integer i, Folio, liCont=0
boolean lb_error= false, lb_todasconf = false

for i=1 to dw_obtenconsulta.rowcount()
	if dw_obtenconsulta.getitemnumber(i,'spre_solicitud_status') = 1 then 
														
		// 	Se agrega este codigo para actualizar el status de la solicitud al ser
		//		actualizado el status a "confirmado"

		Folio = dw_obtenconsulta.getItemNumber(i, 'spre_solicitud_folio')
		UPDATE dbo.spre_solicitud  
		SET dbo.spre_solicitud.status = 2 
		WHERE ( dbo.spre_solicitud.folio = :Folio ) AND 
				( dbo.spre_solicitud.cvedepto = 1 ) 
		using gtr_sumuia;

		lb_error=true
		if lb_error then
			commit using gtr_sumuia;
			
			UPDATE dbo.spre_sol_materiales  
			SET dbo.spre_sol_materiales.status = 2 
			WHERE ( dbo.spre_sol_materiales.folio = :Folio ) AND 
					( dbo.spre_sol_materiales.cvedepto = 1 ) AND  
					( dbo.spre_sol_materiales.cvearea = 1) 
			using gtr_sumuia;
				
			liCont=liCont+1
			lb_error=true
		else
			rollback using gtr_sumuia;
			messagebox("Mensaje del Sistema","Ha ocurrido un error al actualizar la información en spre solicitud",stopsign!)
		end if
	end if
next	

if dw_obtenconsulta.rowcount() > 0 then
	if liCont=0 then
		lb_error = true
		messagebox("Aviso","Solicitudes actualmente confirmadas")
	end if
end if


if (lb_error and liCont >=1) then
	setpointer (HourGlass!)
	commit using gtr_sumuia;
	dw_obtenconsulta.retrieve(fecha,fecha_masdias)
	setpointer (Arrow!)
	messagebox("Mensaje del Sistema","La información se ha registrado con exito, el estatus a sido actualizado",information!)
elseif lb_error = false then
	rollback using gtr_sumuia;
	messagebox("Mensaje del Sistema","Ha ocurrido un error al actualizar la información en spre sol materiales",stopsign!)
end if
end event

type cb_1 from commandbutton within w_enviar_correo_masivo
integer x = 3026
integer y = 540
integer width = 361
integer height = 96
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Consultar"
end type

event clicked;integer liDias, liDiasmas,Res
datetime fecha_hoy,fechaConsultar
datetime ldtm_fecha_hoy


	Datastore ds_dias

	liDias = integer(em_dias.text)
	fecha_hoy = datetime(date(em_fecha_apartir.text))
	dw_2.retrieve(fecha_hoy,liDias)
	fecha = dw_2.object.diasem[1]

	Res = MessageBox("Aviso", "¿ Desea consultar todas las solicitudes con los criterios requeridos ?", &
								Question!, yesno!, 2)
	if Res = 1 then
		
		ds_dias = create datastore
		ds_dias.DataObject = 'd_dateadd_1'
		ds_dias.SetTransObject(gtr_sumuia)
		
		liDiasmas = integer(em_diasaconsultar.text)
		ds_dias.retrieve(fecha,liDiasmas)
		fecha_masdias = ds_dias.object.diasem[1]
	
		em_fecha_final.text = string(fecha_masdias,"dd-mm-yyyy")
		
		setpointer (HourGlass!)
		dw_obtenconsulta.retrieve(fecha,fecha_masdias)
		
		setpointer (Arrow!)
		em_registros.text = string(dw_obtenconsulta.RowCount())
		if dw_obtenconsulta.RowCount()=0 then
			Messagebox("Aviso","No hay solicitudes con estos criterios de busqueda")
		end if
	else
		destroy ds_dias
		dw_2.reset()
		dw_obtenconsulta.reset()
		em_dias.text = string(' ')
		em_diasaconsultar.text = string(' ')
		ldtm_fecha_hoy = f_fecha_hora_servidor()
		em_fecha_apartir.text = string(ldtm_fecha_hoy,"dd-mm-yyyy")
		em_diasaconsultar.text = string(0)
		em_dias.text = string(17)
		em_dias.setfocus()
		return
	end if
	
	
	destroy ds_dias


end event

type dw_obtenconsulta from datawindow within w_enviar_correo_masivo
integer x = 41
integer y = 732
integer width = 3515
integer height = 1380
integer taborder = 60
string title = "none"
string dataobject = "d_enviarcorreo_masivo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(gtr_sumuia)
end event

type em_diasaconsultar from editmask within w_enviar_correo_masivo
integer x = 2263
integer y = 300
integer width = 361
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

type em_dias from editmask within w_enviar_correo_masivo
integer x = 1019
integer y = 164
integer width = 361
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

type em_fecha_apartir from editmask within w_enviar_correo_masivo
integer x = 1019
integer y = 300
integer width = 361
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_1 from statictext within w_enviar_correo_masivo
integer x = 165
integer y = 200
integer width = 827
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 29534863
string text = "No. de días antes del evento:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_enviar_correo_masivo
integer x = 293
integer y = 344
integer width = 699
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 29534863
string text = "A partir de la fecha:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_enviar_correo_masivo
integer x = 1033
integer y = 408
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 29534863
string text = "día/mes/año"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_enviar_correo_masivo
integer x = 1531
integer y = 200
integer width = 699
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 29534863
string text = "Fecha Solicitada:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_enviar_correo_masivo
integer x = 1509
integer y = 340
integer width = 722
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 29534863
string text = "Total de días a incluir:"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_enviar_correo_masivo
integer x = 41
integer y = 72
integer width = 3502
integer height = 432
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 29534863
string text = "Criterios de Consulta"
end type

