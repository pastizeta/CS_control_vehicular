$PBExportHeader$uo_sqlca.sru
forward
global type uo_sqlca from nonvisualobject
end type
end forward

global type uo_sqlca from nonvisualobject
end type
global uo_sqlca uo_sqlca

forward prototypes
public function transaction uf_conectar (string ls_conexion)
end prototypes

public function transaction uf_conectar (string ls_conexion);// Conexión a base de datos
transaction tr_regreso

tr_regreso = create transaction

tr_regreso.DBMS = profilestring('sispre.ini', ls_conexion, 'DBMS', '')
tr_regreso.logid = profilestring('sispre.ini', ls_conexion, 'login', '')
tr_regreso.logpass = profilestring('sispre.ini', ls_conexion, 'logpass', '')
tr_regreso.AutoCommit = false
tr_regreso.DBParm = profilestring('sispre.ini', ls_conexion, 'DBParm', '')

return tr_regreso
end function

on uo_sqlca.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_sqlca.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

