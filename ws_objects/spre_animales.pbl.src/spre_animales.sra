$PBExportHeader$spre_animales.sra
$PBExportComments$Generated Application Object
forward
global type spre_animales from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
//Transaction controlescolar_bd

Transaction gtr_sumuia,gtr_escolar

n_controlescolar_bd conexion_controlescolar_bd
n_sumuia_bd conexion_sumuia_bd

//datawindow dw_catalogo,dw_catalogo2

int cvedepto_global=2,cvearea_global=2

int gi_depto,gi_area

/*
string gs_usuario, gs_password,gs_startupfile, gs_path_ini 
int gi_anio,gi_periodo
STRING gs_tipo_periodo
STRING gs_descripcion_tipo_periodo
STRING gs_plantel
STRING gs_multiples_periodos 
STRING gs_periodo_default 
*/
end variables

global type spre_animales from application
string appname = "spre_animales"
end type
global spre_animales spre_animales

on spre_animales.create
appname="spre_animales"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on spre_animales.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;conexion_controlescolar_bd = Create using "n_controlescolar_bd"
conexion_sumuia_bd=Create using "n_sumuia_bd"

//If conexion_escolares2.of_ConnectDB()=0  Then

//end	 if

If  conexion_controlescolar_bd.of_ConnectDB()=0 Then
//If conexion_escolares.of_ConnectDB ( )=0 Then
//If lnv_connectserv.of_ConnectDB ( ) = 0 Then	
	/*  Open Main window  */
//	Open ( w_principal )
else
	messagebox("Aviso","Error al conectarse a control escolar")
End If

If  conexion_sumuia_bd.of_ConnectDB()=0 Then
//If conexion_escolares.of_ConnectDB ( )=0 Then
//If lnv_connectserv.of_ConnectDB ( ) = 0 Then	
	/*  Open Main window  */
//	Open ( w_principal )
else
	messagebox("Aviso","Error al conectarse a sumuia_bd")
End If

String nombre

//select nombre into:nombre from alumnos where cuenta=70503 using gtr_escolar;
select nombre into:nombre from alumnos where cuenta=19897 using gtr_escolar;

//MessageBox("","hola"+nombre)

//select dato into:nombre from t_tempo3 where no_reg=3 using gtr_sumuia;

//MessageBox("","hola"+nombre)

gi_depto=8
gi_area=3


open(w_marco_general)


end event

event close;conexion_controlescolar_bd.of_disconnectDB()
conexion_sumuia_bd.of_disconnectDB()

end event

