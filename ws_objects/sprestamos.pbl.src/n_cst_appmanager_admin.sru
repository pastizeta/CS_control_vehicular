$PBExportHeader$n_cst_appmanager_admin.sru
forward
global type n_cst_appmanager_admin from n_cst_appmanager
end type
end forward

global type n_cst_appmanager_admin from n_cst_appmanager
end type
global n_cst_appmanager_admin n_cst_appmanager_admin

type variables
n_tr itr_security
end variables

on n_cst_appmanager_admin.create
call super::create
end on

on n_cst_appmanager_admin.destroy
call super::destroy
end on

event constructor;call super::constructor;is_appinifile="control_vehicular.ini"
end event

