$PBExportHeader$n_sumuia_bd.sru
forward
global type n_sumuia_bd from nonvisualobject
end type
end forward

global type n_sumuia_bd from nonvisualobject
end type
global n_sumuia_bd n_sumuia_bd

type variables
string is_connectfrom = "3"

CONSTANT string IS_USE_INIFILE 	= "1"
CONSTANT string IS_USE_REGISTRY	= "2"
CONSTANT string IS_USE_SCRIPT 	= "3"
end variables

forward prototypes
public function integer of_getconnectioninfo (ref string as_dbms, ref string as_database, ref string as_userid, ref string as_dbpass, ref string as_logid, ref string as_logpass, ref string as_server, ref string as_dbparm, ref string as_lock, ref string as_autocommit)
public function integer of_connectdb ()
public function integer of_disconnectdb ()
end prototypes

public function integer of_getconnectioninfo (ref string as_dbms, ref string as_database, ref string as_userid, ref string as_dbpass, ref string as_logid, ref string as_logpass, ref string as_server, ref string as_dbparm, ref string as_lock, ref string as_autocommit);//*--------------------------------------------------------*/
//*  The source of connection information can be changed by
//*  altering the value of the 'is_connectfrom' variable.
//*--------------------------------------------------------*/
Choose Case is_connectfrom
		
	Case IS_USE_INIFILE						/*  Populate Database Connection from INI file  */
		string ls_inifile = ""



// para coneccion con controlescolar_bed_borja copia
		as_dbms			= ProfileString ( ls_inifile, "Database","DBMS", "ODBC")
		as_database		= ProfileString ( ls_inifile, "Database", "Database", "controlescolar_bd_borja")
		as_userid		= ProfileString ( ls_inifile, "Database", "UserID", "")
		as_dbpass		= ProfileString ( ls_inifile, "Database", "DBPass", "")
		as_logid		= ProfileString ( ls_inifile, "Database", "LogID", "sa")
		as_logpass		= ProfileString ( ls_inifile, "Database", "LogPassword",	"desarrollo")
		as_server		= ProfileString ( ls_inifile, "Database", "Servername", "controlescolar_bd_borja")
		as_dbparm		= ProfileString ( ls_inifile, "Database", "DBParm", "")
		as_lock			= ProfileString ( ls_inifile, "Database", "Lock", "")
		as_autocommit	= ProfileString ( ls_inifile, "Database", "AutoCommit",	"false")



//		para coneccion real con CD Mexico
/*		as_dbms			= ProfileString ( ls_inifile, "Database", "DBMS", "SYC Adaptive Server Enterprise")
		as_database		= ProfileString ( ls_inifile, "Database", "Database", "controlescolar_bd")
		as_userid		= ProfileString ( ls_inifile, "Database", "UserID", "")
		as_dbpass		= ProfileString ( ls_inifile, "Database", "DBPass", "")
		as_logid		= ProfileString ( ls_inifile, "Database", "LogID", "sa")
		as_logpass		= ProfileString ( ls_inifile, "Database", "LogPassword",	"desarrollo")
		as_server		= ProfileString ( ls_inifile, "Database", "Servername", "SYBCESDESTIJ")
		as_dbparm		= ProfileString ( ls_inifile, "Database", "DBParm", "")
		as_lock			= ProfileString ( ls_inifile, "Database", "Lock", "")
		as_autocommit	= ProfileString ( ls_inifile, "Database", "AutoCommit",	"false")

*/
	Case IS_USE_REGISTRY						/*  Populate Database Connection from Registry  */
		string ls_registrykey = "" + "\DataBase"
		
		If RegistryGet ( ls_registrykey, "DBMS",			RegString!, as_dbms ) <> 1 Then
			RegistrySet ( ls_registrykey, "DBMS",				RegString!, "SYC Adaptive Server Enterprise" )
			RegistryGet ( ls_registrykey, "DBMS", 			RegString!, as_dbms )
		End If
		If RegistryGet ( ls_registrykey, "Database",		RegString!, as_database ) <> 1 Then
			RegistrySet ( ls_registrykey, "Database", 		RegString!, "controlescolar_bd" )
			RegistryGet ( ls_registrykey, "Database", 		RegString!, as_database )
		End If
		If RegistryGet ( ls_registrykey, "UserID", 			RegString!, as_userid ) <> 1 Then
			RegistrySet ( ls_registrykey, "UserID", 		RegString!, "" )
			RegistryGet ( ls_registrykey, "UserID", 		RegString!, as_userid )
		End If
		If RegistryGet ( ls_registrykey, "DBPass", 			RegString!, as_dbpass ) <> 1 Then
			RegistrySet ( ls_registrykey, "DBPass", 		RegString!, "" )
			RegistryGet ( ls_registrykey, "DBPass", 		RegString!, as_dbpass )
		End If
		If RegistryGet ( ls_registrykey, "LogID", 			RegString!, as_logid ) <> 1 Then
			RegistrySet ( ls_registrykey, "LogID", 			RegString!, "sa" )
			RegistryGet ( ls_registrykey, "LogID", 			RegString!, as_logid )
		End If
		If RegistryGet ( ls_registrykey, "LogPassword",		RegString!, as_logpass ) <> 1 Then
			RegistrySet ( ls_registrykey, "LogPassword",	RegString!, "desarrollo" )
			RegistryGet ( ls_registrykey, "LogPassword",	RegString!, as_logpass )
		End If
		If RegistryGet ( ls_registrykey, "Servername", 		RegString!, as_server ) <> 1 Then
			RegistrySet ( ls_registrykey, "Servername", 	RegString!, "SYBCESDESTIJ" )
			RegistryGet ( ls_registrykey, "Servername", 	RegString!, as_server )
		End If
		If RegistryGet ( ls_registrykey, "DBParm", 			RegString!, as_dbparm ) <> 1 Then
			RegistrySet ( ls_registrykey, "DBParm", 		RegString!, "" )
			RegistryGet ( ls_registrykey, "DBParm", 		RegString!, as_dbparm )
		End If
		If RegistryGet ( ls_registrykey, "Lock", 			RegString!, as_lock ) <> 1 Then
			RegistrySet ( ls_registrykey, "Lock", 			RegString!, "" )
			RegistryGet ( ls_registrykey, "Lock", 			RegString!, as_lock )
		End If
		If RegistryGet ( ls_registrykey, "AutoCommit", 		RegString!, as_autocommit ) <> 1 Then
			RegistrySet ( ls_registrykey, "AutoCommit", 	RegString!, "false" )
			RegistryGet ( ls_registrykey, "AutoCommit", 	RegString!, as_autocommit )
		End If

	Case IS_USE_SCRIPT							/*  Populate Database Connection from Script  */
		
as_dbms			= "ODBC"
	/*	as_database		= "controlescolar_bd_borja"
		as_userid		= ""
		as_dbpass		= ""
		as_logid		= "sa"
		as_logpass		= "desarrollo"
		as_server		= "SYBCESDESTIJ"
		as_dbparm		= "ConnectString='DSN=controlescolar_bd_borja'"
		as_lock			= ""
		as_autocommit	= "false"		
		*/
		
		as_dbms			= "SYC Adaptive Server Enterprise"
		as_database		= "sumuia_bd"
		as_userid		= ""
		as_dbpass		= ""
		as_logid		= "sa"
		as_logpass		= "desarrollo"
		as_server		= "SYBCESDES"
		as_dbparm		= ""
		as_lock			= ""
		as_autocommit	= "false"

	
	Case Else
		
		Return -1
		
End Choose

Return 1
end function

public function integer of_connectdb ();//*--------------------------------------------------------*/
//*  Make a connection to the database
//*--------------------------------------------------------*/
/*  Actual DB connection */
Connect using gtr_sumuia;

If gtr_sumuia.SQLCode <> 0 Then
	MessageBox ("Cannot Connect to Database", gtr_sumuia.SQLErrText )
End If

Return gtr_sumuia.SQLCode
end function

public function integer of_disconnectdb ();//*--------------------------------------------------------*/
//*  Disconnect from database
//*--------------------------------------------------------*/
/*  Actual DB disconnection */
Disconnect using gtr_sumuia;

If gtr_sumuia.SQLCode <> 0 Then
	MessageBox ("Cannot Disconnect from Database", gtr_sumuia.SQLErrText )
End If

Return gtr_sumuia.SQLCode
end function

on n_sumuia_bd.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_sumuia_bd.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//*--------------------------------------------------------*/
//*  Connection Information is obtained from either:
//*			- An INI File
//*			- The Windows Registry
//*			- Script
//*
//*  The source of connection information can be changed by
//*  altering the value of the 'is_connectfrom' variable.
//*--------------------------------------------------------*/
string ls_dbms, ls_database, ls_userid, ls_dbpass, ls_logid, ls_logpass
string ls_server, ls_dbparm, ls_lock, ls_autocommit

// gtr_sumuia = create Transaction
gtr_sumuia = create Transaction

If of_GetConnectionInfo ( ls_dbms, ls_database, ls_userid, ls_dbpass, ls_logid, ls_logpass, ls_server, ls_dbparm, ls_lock, ls_autocommit ) = 1 Then
	
	gtr_sumuia.DBMS			= ls_dbms
	gtr_sumuia.Database		= ls_database
	gtr_sumuia.UserID		= ls_userid
	gtr_sumuia.DBPass		= ls_dbpass
	gtr_sumuia.LogID			= ls_logid
	gtr_sumuia.LogPass		= ls_logpass
	gtr_sumuia.ServerName	= ls_server
	gtr_sumuia.DBParm		= ls_dbparm
	gtr_sumuia.Lock			= ls_lock
	Choose Case Lower ( ls_autocommit ) 
		Case "1", "true", "on", "yes"
			gtr_sumuia.AutoCommit	= True
		Case "0", "false", "off", "no"
			gtr_sumuia.AutoCommit	= False
		Case Else
			gtr_sumuia.AutoCommit	= False
	End Choose
	
End If
end event

