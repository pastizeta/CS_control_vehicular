$PBExportHeader$n_transportar.sru
$PBExportComments$Objeto no visual para transportar informacion de una ventana a otra
forward
global type n_transportar from nonvisualobject
end type
end forward

global type n_transportar from nonvisualobject autoinstantiate
end type

type variables
//string 	is_parm1, is_parm2, is_parm3, is_parm4, is_parm5, is_parm6, is_parm7, is_parm8, is_parm9, is_parm10, is_parm11,is_parmserien,is_parmcvemat, is_parmcoduia
//long		ii_parm1, ii_parm2, ii_parm3, ii_parm4, ii_parm5, ii_parm6, ii_parm7, ii_parm8, ii_parm9, ii_parm10, ii_parm11,ii_parmgrupo
//long 		il_parm1, il_parm2, il_parm3, il_parm4, il_parm5
//date 		id_parm1, id_parm2, id_parm3, id_parm4, id_parm5
//
////		RECALENDARIZACIÓN
//integer 	ii_parm1recal, ii_parm2recal, ii_parmstatus
//string 	is_parm1recal, is_parm2recal
//date 		id_parm1recal, id_parm2recal, id_parm3recal, id_parm4recal, id_parm5recal,id_parm1sol, id_parm2sol, id_parm3sol
//

// Original
string is_parm11,is_parmserien,is_parmcvemat, is_parmcoduia
integer ii_parmgrupo

// 14-10-08
string 	is_parm1, is_parm2, is_parm3, is_parm4, is_parm5, is_parm6, is_parm7, is_parm8, is_parm9, is_parm10
integer 	ii_parm1, ii_parm2, ii_parm3, ii_parm4, ii_parm5, ii_parm6, ii_parm7, ii_parm8, ii_parm9, ii_parm10, ii_parm11
long 		il_parm1, il_parm2, il_parm3, il_parm4, il_parm5
date 		id_parm1, id_parm2, id_parm3, id_parm4, id_parm5
string   is_parmdir1, is_parmdir2


//		RECALENDARIZACIÓN
integer 	ii_parm1recal, ii_parm2recal, ii_parmstatus
string 	is_parm1recal, is_parm2recal
date 		id_parm1recal, id_parm2recal, id_parm3recal, id_parm4recal, id_parm5recal,id_parm1sol, id_parm2sol, id_parm3sol
long 		il_parm1recal

integer 	ii_parm1recalv, ii_parm2recalv, ii_parmstatusv
string 	is_parm1recalv, is_parm2recalv
date 		id_parm1recalv, id_parm2recalv, id_parm3recalv, id_parm4recalv, id_parm5recalv,id_parm1solv, id_parm2solv, id_parm3solv


//		VESTIBULO
string 	isv_parm1, isv_parm2, isv_parm3, isv_parm4, isv_parm5, isv_parm6, isv_parm7, isv_parm8, isv_parm9, isv_parm10
integer 	iiv_vestib,iiv_parm1, iiv_parm2, iiv_parm3, iiv_parm4, iiv_parm5, iiv_parm6, iiv_parm7, iiv_parm8, iiv_parm9, iiv_parm10, iiv_parm11
long 		ilv_parm1, ilv_parm2, ilv_parm3, ilv_parm4, ilv_parm5
date 		idv_parm1, idv_parm2, idv_parm3, idv_parm4, idv_parm5
end variables

on n_transportar.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_transportar.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

