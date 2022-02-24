$PBExportHeader$n_ostg.sru
$PBExportComments$Extension OLEStorage class
forward
global type n_ostg from pfc_n_ostg
end type
end forward

global type n_ostg from pfc_n_ostg
end type
global n_ostg n_ostg

on n_ostg.create
call olestorage::create
TriggerEvent( this, "constructor" )
end on

on n_ostg.destroy
call olestorage::destroy
TriggerEvent( this, "destructor" )
end on

