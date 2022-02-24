$PBExportHeader$n_smtpmail.sru
forward
global type n_smtpmail from nonvisualobject
end type
end forward

global type n_smtpmail from nonvisualobject
end type
global n_smtpmail n_smtpmail

type variables
STRING	is_server
integer	ii_serverport	=	587 //25
boolean	ib_html

//n_cst_base_datos	iob_db

n_smtp	iob_em
end variables

forward prototypes
public function integer of_enviamail (string as_remitente, string as_destinatario[], string as_cc[], string as_asunto, string as_cuerpo, string as_archivo)
end prototypes

public function integer of_enviamail (string as_remitente, string as_destinatario[], string as_cc[], string as_asunto, string as_cuerpo, string as_archivo);String	ls_err, ls_rerr
Int		li_indice

iob_em.of_SetFrom('control.vehicular@ibero.mx')
//iob_em.of_setlogin('control.vehicular@ibero.mx','H7u*2J21') 

// inicia cph ene 2022

string is_usuario,is_contrasena

//is_server					=	"172.17.29.188"
//ii_serverport				=	25


is_usuario				= "control.vehicular@ibero.mx"
is_contrasena			= "H7u*2J21"

//is_usuario				= "desarrollo29@ibero.mx"
//is_contrasena			= ""


is_server					=	"smtp.office365.com"
ii_serverport				=	587

//iob_em.of_SetFrom('desarrollo29@ibero.mx')
iob_em.of_SetFrom('control.vehicular@ibero.mx')
iob_em.of_setPort(ii_serverport) // faltaba inicializar puerto y servidor. cph ene 06 2022
iob_em.of_setServer(is_server)

iob_em.of_setlogin(is_usuario,is_contrasena)

n_smtp mi_correo

//mi_correo = create n_smtp


mi_correo.of_SetFrom('desarrollo29@ibero.mx')
mi_correo.of_setPort(ii_serverport) // faltaba inicializar puerto y servidor. cph ene 06 2022
mi_correo.of_setServer(is_server)
//iob_em.of_setlogin('control.vehicular@ibero.mx','H7u*2J21') 
mi_correo.of_setlogin(is_usuario,is_contrasena)
mi_correo.of_setSubject("Prueba de correo")

//iob_em.of_SetBody(as_cuerpo,ib_html)
mi_correo.of_SetBody("El cuerpo del correo",True)
mi_correo.of_addAddress ( 'cesar.ponce@tijuana.ibero.mx' )		
mi_correo.of_addAddress ( 'cponcehdz@gmail.com' )		

ls_err=''

mi_correo.of_addattachment(as_archivo)

mi_correo.of_setSubject(as_asunto)

//iob_em.of_SetBody(as_cuerpo,ib_html)
mi_correo.of_SetBody(as_cuerpo,True)

		integer li_intento,li_intentos
		boolean lb_se_envio_correo
		li_intento=0
		li_intentos=5
		lb_se_envio_correo=false
/*
		open(w_msg_procesando_correo)

		do		
			li_intento=li_intento + 1 
			w_msg_procesando_correo.st_1.text = "Enviando correo. Intento No."+string(li_intento)
			lb_se_envio_correo=mi_correo.of_sendtlsmail( )
			IF NOT lb_se_envio_correo then
					sleep(4)
			end if

		loop while	(li_intento<=li_intentos) and (lb_se_envio_correo=false)

		close(w_msg_procesando_correo)
		if not lb_se_envio_correo then
			ls_err	=	ls_err + "No se envió el correox."
		
		end if

IF NOT mi_correo.of_sendtlsmail() THEN
	
	messagebox("Error","error al enviar el correo electronico")
	RETURN -1	
END IF

Return 0

*/

// fin cph ene 2022


iob_em.of_setSubject(as_asunto)

//iob_em.of_SetBody(as_cuerpo,ib_html)
iob_em.of_SetBody(as_cuerpo,True)

/*PARA COPIA OCULTA*/
//iob_em.of_addBcc(as_remitente)	

//	Agregar los destinatarios ...

ls_rerr=""

FOR li_indice = 1 TO UpperBound ( as_destinatario [] ) 

	IF NOT iob_em.of_validemail ( as_destinatario [ li_indice ] , ls_rerr ) THEN
		ls_err	=	ls_rerr
	ELSE
		iob_em.of_addAddress ( as_destinatario [ li_indice ] ,  'e_mail' )		

	END IF

NEXT

//	Agregar los destinatarios ...
FOR li_indice = 1 TO UpperBound ( as_cc [] ) 

	IF NOT iob_em.of_validemail ( as_cc [ li_indice ] , ls_rerr ) THEN
		ls_err	=	ls_rerr
	ELSE
		iob_em.of_addcc ( as_cc [ li_indice ] )

		
	END IF

NEXT

iob_em.of_addattachment(as_archivo)

	li_intento=0
		li_intentos=5
		lb_se_envio_correo=false

		open(w_msg_procesando_correo)

		do		
			li_intento=li_intento + 1 
			w_msg_procesando_correo.st_1.text = "Enviando correo. Intento No."+string(li_intento)+" de "+string(li_intentos)
			lb_se_envio_correo=iob_em.of_sendtlsmail( )
			IF NOT lb_se_envio_correo then
					sleep(4)
			end if

		loop while	(li_intento<li_intentos) and (lb_se_envio_correo=false)

		close(w_msg_procesando_correo)
		if not lb_se_envio_correo then
			ls_err	=	ls_err + "No se envió el correo."
		else
			messagebox("Aviso","El Correo se envió de forma exitosa!")
		END IF
	
IF len(ls_err) > 0 THEN
	MessageBox("Aviso", ls_err,stopsign!)
	RETURN -1
END IF

RETURN 0
end function

on n_smtpmail.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_smtpmail.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;/**************************************************/
is_server					=	"smtp.office365.com"
/**************************************************/
iob_em.of_setPort(ii_serverport)
iob_em.of_setServer(is_server)
iob_em.of_SetLogFile(true,'smtp_log.txt')
end event

