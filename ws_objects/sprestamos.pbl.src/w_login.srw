$PBExportHeader$w_login.srw
$PBExportComments$Window para acceso al sistema de presupuestos
forward
global type w_login from window
end type
type st_conexiones from statictext within w_login
end type
type st_password from statictext within w_login
end type
type st_2 from statictext within w_login
end type
type sle_usuario from singlelineedit within w_login
end type
type sle_contrasenia from singlelineedit within w_login
end type
type cb_listo from commandbutton within w_login
end type
type cb_cancel from commandbutton within w_login
end type
type p_2 from picture within w_login
end type
type p_1 from picture within w_login
end type
type st_8 from statictext within w_login
end type
type st_6 from statictext within w_login
end type
type p_logo_uia from picture within w_login
end type
type st_1 from statictext within w_login
end type
type r_1 from rectangle within w_login
end type
end forward

global type w_login from window
integer x = 306
integer y = 288
integer width = 3081
integer height = 1980
boolean titlebar = true
string title = "Ventana de acceso"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
event ue_login pbm_custom60
event ue_close pbm_custom61
st_conexiones st_conexiones
st_password st_password
st_2 st_2
sle_usuario sle_usuario
sle_contrasenia sle_contrasenia
cb_listo cb_listo
cb_cancel cb_cancel
p_2 p_2
p_1 p_1
st_8 st_8
st_6 st_6
p_logo_uia p_logo_uia
st_1 st_1
r_1 r_1
end type
global w_login w_login

on w_login.create
this.st_conexiones=create st_conexiones
this.st_password=create st_password
this.st_2=create st_2
this.sle_usuario=create sle_usuario
this.sle_contrasenia=create sle_contrasenia
this.cb_listo=create cb_listo
this.cb_cancel=create cb_cancel
this.p_2=create p_2
this.p_1=create p_1
this.st_8=create st_8
this.st_6=create st_6
this.p_logo_uia=create p_logo_uia
this.st_1=create st_1
this.r_1=create r_1
this.Control[]={this.st_conexiones,&
this.st_password,&
this.st_2,&
this.sle_usuario,&
this.sle_contrasenia,&
this.cb_listo,&
this.cb_cancel,&
this.p_2,&
this.p_1,&
this.st_8,&
this.st_6,&
this.p_logo_uia,&
this.st_1,&
this.r_1}
end on

on w_login.destroy
destroy(this.st_conexiones)
destroy(this.st_password)
destroy(this.st_2)
destroy(this.sle_usuario)
destroy(this.sle_contrasenia)
destroy(this.cb_listo)
destroy(this.cb_cancel)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.st_8)
destroy(this.st_6)
destroy(this.p_logo_uia)
destroy(this.st_1)
destroy(this.r_1)
end on

event open;//gs_usuario = ProfileString("control_vehicular.ini","USUARIO","usuario","");
gs_path = ProfileString("control_vehicular.ini","PATH","ruta","");
gs_tlector= ProfileString("control_vehicular.ini","Lector","Tipo","");
//st_1.text= ProfileString("control_vehicular.ini","TEXTOS","titulo","")
st_1.text = 'Sistema de control Vehicular'
sle_usuario.Text = gs_usuario
//sle_contrasenia.setfocus()
gtr_sumuia=CREATE n_tr
gtr_escolar=CREATE n_tr

////Se obtiene el valor si ocupa lector de credenciales
//RegistryGet( "HKEY_CURRENT_USER\Software\prestamos_equipo",  "LectorActivo", RegString!, gs_lector_activ)
gs_lector_activ =  ProfileString("control_vehicular.ini","LECTOR","activo","0");




//If gs_lector_activ = "" Then
////	RegistrySet( "HKEY_CURRENT_USER\Software\prestamos_equipo",  "LectorActivo", RegString!, "0")
//	gs_lector_activ = "0"
//Else
//	
//	RegistryGet( "HKEY_CURRENT_USER\Software\prestamos_equipo",  "LectorActivo", RegString!, gs_lector_activ)	
//End If


end event

type st_conexiones from statictext within w_login
boolean visible = false
integer x = 1573
integer y = 1308
integer width = 1394
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean focusrectangle = false
boolean disabledlook = true
end type

type st_password from statictext within w_login
integer x = 1733
integer y = 1052
integer width = 370
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Password :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_login
integer x = 1728
integer y = 932
integer width = 370
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Usuario:"
boolean focusrectangle = false
end type

type sle_usuario from singlelineedit within w_login
integer x = 2135
integer y = 924
integer width = 622
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event getfocus;selecttext(1,len(sle_usuario.text))
end event

type sle_contrasenia from singlelineedit within w_login
integer x = 2135
integer y = 1040
integer width = 626
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
boolean autohscroll = false
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;selecttext(1,len(sle_contrasenia.text))
end event

type cb_listo from commandbutton within w_login
integer x = 1819
integer y = 1536
integer width = 416
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Listo"
boolean default = true
end type

event clicked;string ls_contraseniaRemota, ls_usuario, ls_bd=""
boolean lb_error

st_conexiones.visible=true
gs_usuario = Trim (sle_usuario.text)
gs_pass = Trim(sle_contrasenia.text)

//SetProfileString("control_vehicular.ini","USUARIO", "usuario", gs_usuario)	

if f_conecta_sql_bd(gtr_cv,"CV") = 0 then
	messagebox("Error","Problemas al conectarse la base de Control Vehicular")
end if 

//Febrero 2020_Validación del login
if Not f_valida_login(gs_usuario, gs_pass, gtr_cv) then
	if isvalid(gtr_cv) then 
		disconnect using gtr_cv;
		Destroy gtr_cv
	end if
	
	sle_contrasenia.setfocus()
	sle_contrasenia.SelectText(1, Len(sle_contrasenia.Text))
	return
end if

//if  f_conecta1_bd(gtr_cv,"CV") =0 then
//	messagebox("Error","Problemas al conectarse la base de datos CV")
//end if	

st_conexiones.text="Conectando a Base de Datos PRESTAMOS-SUMUIA, espere..."
gtr_sumuia.DBMS = ProfileString("control_vehicular.ini","sispre","dbms","");
gtr_sumuia.database = ProfileString("control_vehicular.ini","sispre","database","");
gtr_sumuia.servername = ProfileString("control_vehicular.ini","sispre","servername","");
gtr_sumuia.dbparm = ProfileString("control_vehicular.ini","sispre","dbparm","");

//if (gtr_sumuia.servername='sybcesdes') then
//
//	gtr_sumuia.logid = 'sa'
//	gtr_sumuia.logpass = 'desarrollo'
//	gtr_sumuia.userid = 'sa'
//	gtr_sumuia.dbpass = 'desarrollo'
//else
//	gtr_sumuia.logid = gs_usuario
//	gtr_sumuia.logpass = gs_pass
//	gtr_sumuia.userid = gs_usuario
//	gtr_sumuia.dbpass = gs_pass
//end if
//
//connect using gtr_sumuia;
//
//if gtr_sumuia.sqlcode=0 then
	
//	st_conexiones.text="Conectado a Sistema de Prestamos, verificando usuario..."
//	SELECT cvedepto,cvearea, IsNull(multi_area,0) INTO :gi_depto,:gi_area,:gi_areamul
//	FROM spre_usuarios 
//	WHERE spre_usuarios.usuario = :gs_usuario AND
//			spre_usuarios.contrasenia = :gs_pass	USING gtr_sumuia;
//
//	if gtr_sumuia.SQLCode = 100 THEN
//		MessageBox("Error de conexión","Usuario desconocido o deshabilitado", StopSign!)
//		disconnect using gtr_sumuia;
//		st_conexiones.visible=false
//		return	
//		
//	else
/*OSS
		if gi_depto=5 then 
			 f_conectarbd_escolar()
			 f_conecta_sql_bd(gtr_web,"WEB")
		end if

		if gi_depto=12 then f_conectarbd_escolar()

		if gi_depto=9 or gi_depto=2 then post f_multa_cierre_automatico_estatus()
		if gi_depto=11 then post f_cierre_automatico()
		if gi_depto=2 and gi_area=2 then post f_inventario_alerta()
		
		

			SELECT cve_escolar, descr_escolar INTO :gi_deptocoor,:gs_deptocoor
			FROM spre_departamentos 
			WHERE spre_departamentos.cvedepto = :gi_depto 
			USING gtr_sumuia;
*/

/*
		SetProfileString("control_vehicular.ini","PERSONAL", "LogID", gs_usuario)	
		SetProfileString("control_vehicular.ini","PERSONAL", "LogPassword", gs_pass)	
		SetProfileString("control_vehicular.ini","PERSONAL", "UserId", gs_usuario)	
		SetProfileString("control_vehicular.ini","PERSONAL", "DatabasePassword", gs_pass)	
*/

		if f_conecta1_bd(gtr_personal,"PERSONAL") =0 then
			messagebox("Error","Problemas al conectarse la base de datos de Empleados")
		else
			execute immediate "SET TRANSACTION ISOLATION LEVEL READ COMMITTED" using gtr_personal;
			open(w_ppal)
			close(parent)
			return
		end if 

	//end if
//else
//	st_conexiones.text="Error de Conexion a PRESTAMOS-SUMUIA, espere..."
//	messagebox("Error de Conexion con la Base de Datos  PRESTAMOS-SUMUIA",gtr_sumuia.SQLErrtext,stopsign!)
//	st_conexiones.visible=false
//end if
//
sle_contrasenia.setfocus()
end event

type cb_cancel from commandbutton within w_login
integer x = 2546
integer y = 1536
integer width = 416
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
boolean cancel = true
end type

event clicked;Close(parent)
end event

type p_2 from picture within w_login
integer x = 1385
integer y = 52
integer width = 1193
integer height = 176
string picturename = "iberoamericana.bmp"
boolean focusrectangle = false
end type

type p_1 from picture within w_login
integer x = 462
integer y = 52
integer width = 933
integer height = 176
string picturename = "universidad.bmp"
boolean focusrectangle = false
end type

type st_8 from statictext within w_login
integer x = 178
integer y = 1660
integer width = 480
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Copyright@. 2004."
boolean focusrectangle = false
end type

type st_6 from statictext within w_login
integer x = 178
integer y = 1548
integer width = 1303
integer height = 92
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Dirección de Informática y Telecomunicaciones"
boolean focusrectangle = false
end type

type p_logo_uia from picture within w_login
integer x = 311
integer y = 492
integer width = 1029
integer height = 828
string picturename = "uiafondo.bmp"
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_1 from statictext within w_login
integer x = 1422
integer y = 548
integer width = 1586
integer height = 204
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type r_1 from rectangle within w_login
long linecolor = 255
integer linethickness = 4
long fillcolor = 12632256
integer x = 453
integer y = 48
integer width = 2130
integer height = 188
end type

