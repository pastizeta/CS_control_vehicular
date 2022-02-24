$PBExportHeader$w_csal_mat_plumones.srw
forward
global type w_csal_mat_plumones from window
end type
type rb_3 from radiobutton within w_csal_mat_plumones
end type
type st_4 from statictext within w_csal_mat_plumones
end type
type cb_4 from commandbutton within w_csal_mat_plumones
end type
type rb_2 from radiobutton within w_csal_mat_plumones
end type
type rb_1 from radiobutton within w_csal_mat_plumones
end type
type cb_3 from commandbutton within w_csal_mat_plumones
end type
type cb_2 from commandbutton within w_csal_mat_plumones
end type
type st_3 from statictext within w_csal_mat_plumones
end type
type st_2 from statictext within w_csal_mat_plumones
end type
type sle_nombreprof from singlelineedit within w_csal_mat_plumones
end type
type sle_cuenta from singlelineedit within w_csal_mat_plumones
end type
type st_1 from statictext within w_csal_mat_plumones
end type
type dw_consulta from datawindow within w_csal_mat_plumones
end type
type cbx_2 from checkbox within w_csal_mat_plumones
end type
type cbx_1 from checkbox within w_csal_mat_plumones
end type
type cb_1 from commandbutton within w_csal_mat_plumones
end type
type gb_1 from groupbox within w_csal_mat_plumones
end type
type gb_2 from groupbox within w_csal_mat_plumones
end type
end forward

global type w_csal_mat_plumones from window
integer width = 3635
integer height = 2509
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 29534863
string icon = "AppIcon!"
boolean center = true
rb_3 rb_3
st_4 st_4
cb_4 cb_4
rb_2 rb_2
rb_1 rb_1
cb_3 cb_3
cb_2 cb_2
st_3 st_3
st_2 st_2
sle_nombreprof sle_nombreprof
sle_cuenta sle_cuenta
st_1 st_1
dw_consulta dw_consulta
cbx_2 cbx_2
cbx_1 cbx_1
cb_1 cb_1
gb_1 gb_1
gb_2 gb_2
end type
global w_csal_mat_plumones w_csal_mat_plumones

type variables
long 		al_nomina
integer	ii_estatus
datetime idt_fecha_hoy
end variables

on w_csal_mat_plumones.create
this.rb_3=create rb_3
this.st_4=create st_4
this.cb_4=create cb_4
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_3=create st_3
this.st_2=create st_2
this.sle_nombreprof=create sle_nombreprof
this.sle_cuenta=create sle_cuenta
this.st_1=create st_1
this.dw_consulta=create dw_consulta
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.rb_3,&
this.st_4,&
this.cb_4,&
this.rb_2,&
this.rb_1,&
this.cb_3,&
this.cb_2,&
this.st_3,&
this.st_2,&
this.sle_nombreprof,&
this.sle_cuenta,&
this.st_1,&
this.dw_consulta,&
this.cbx_2,&
this.cbx_1,&
this.cb_1,&
this.gb_1,&
this.gb_2}
end on

on w_csal_mat_plumones.destroy
destroy(this.rb_3)
destroy(this.st_4)
destroy(this.cb_4)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_nombreprof)
destroy(this.sle_cuenta)
destroy(this.st_1)
destroy(this.dw_consulta)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;idt_fecha_hoy= f_fecha_hora_servidor()

dw_consulta.setTransObject(gtr_sumuia)

sle_cuenta.setfocus()

end event

type rb_3 from radiobutton within w_csal_mat_plumones
integer x = 146
integer y = 234
integer width = 538
integer height = 61
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Consulta General"
end type

event clicked;cb_2.enabled = false
sle_cuenta.text = ""
sle_cuenta.setfocus()
dw_consulta.reset()
cbx_1.checked = false
cbx_2.checked = false
cbx_1.enabled = true
cbx_2.enabled = true
sle_nombreprof.text = ""


end event

type st_4 from statictext within w_csal_mat_plumones
integer x = 2940
integer y = 154
integer width = 344
integer height = 58
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217857
long backcolor = 29534863
string text = "PLUMONES"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_csal_mat_plumones
integer x = 2454
integer y = 714
integer width = 402
integer height = 90
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;dw_consulta.print()

sle_cuenta.text = ""
sle_cuenta.setfocus()
dw_consulta.reset()
cbx_1.checked = false
cbx_2.checked = false
sle_nombreprof.text = ""

end event

type rb_2 from radiobutton within w_csal_mat_plumones
integer x = 146
integer y = 131
integer width = 362
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Profesor"
boolean checked = true
end type

event clicked;
sle_cuenta.text = ""
sle_cuenta.setfocus()
dw_consulta.reset()
cbx_1.enabled = true
cbx_2.enabled = true
cbx_1.checked = false
cbx_2.checked = false
cb_2.enabled = true
sle_nombreprof.text = ""
cb_2.enabled = true


end event

type rb_1 from radiobutton within w_csal_mat_plumones
integer x = 146
integer y = 333
integer width = 362
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Alumno"
end type

event clicked;
sle_cuenta.text = ""
sle_cuenta.setfocus()
dw_consulta.reset()
cbx_1.enabled = false
cbx_2.enabled = false
cb_2.enabled = false
cbx_1.checked= false
cbx_2.checked= false
sle_nombreprof.text = ""
end event

type cb_3 from commandbutton within w_csal_mat_plumones
integer x = 2926
integer y = 714
integer width = 402
integer height = 90
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Salir"
end type

event clicked;close(parent)
end event

type cb_2 from commandbutton within w_csal_mat_plumones
integer x = 1371
integer y = 336
integer width = 402
integer height = 90
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar"
end type

event clicked;long 	llMaxid, ll_sqlcode

if trim(sle_cuenta.text) <>"" then
	SELECT max(spre_control_salones.id_control)
		into :llMaxid
	FROM spre_control_salones
	USING gtr_sumuia;		
	if isnull(llMaxid) then 
		llMaxid =1	
	ELSE
		llMaxid =1	+ llMaxid		
	end if
								
	// Se inserta 
	INSERT INTO dbo.spre_control_salones 
				( id_control,
					solicitanteid,   
					estatus,   
					fecha_generacion)  
	VALUES (:llMaxid,
				:al_nomina,
				:ii_estatus, // estatus 
				getdate())  
	USING gtr_sumuia;
	
	messagebox('',string(llMaxid))
	IF ll_sqlcode = 100 THEN
		MessageBox('Error:' , 'No se genero el registro',Exclamation!)
		Rollback Using gtr_sumuia;	
		
	ELSEIF ll_sqlcode = -1 THEN
		MessageBox('Error : ','No se genero el registro'+'~n'+gtr_sumuia.SQLErrText,StopSign!)
		Rollback Using gtr_sumuia;	
		
	ELSE
		messagebox("Mensaje del sistema","El registro se actualizo con éxito",exclamation!)
		Commit Using gtr_sumuia;
		
		sle_cuenta.text =  ' '
		sle_nombreprof.text = ' '
		cbx_1.checked = false
		cbx_1.checked = false
	END IF	
else
	messagebox("Mensaje del sistema","Debe de indicar No.Clave",exclamation!)
end if
end event

type st_3 from statictext within w_csal_mat_plumones
integer x = 69
integer y = 739
integer width = 278
integer height = 61
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Nombre:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_csal_mat_plumones
integer x = 165
integer y = 653
integer width = 179
integer height = 58
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Clave:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_nombreprof from singlelineedit within w_csal_mat_plumones
integer x = 366
integer y = 723
integer width = 1503
integer height = 77
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type sle_cuenta from singlelineedit within w_csal_mat_plumones
event activarbusq ( )
integer x = 366
integer y = 637
integer width = 307
integer height = 77
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

event modified;
string ls_nombrecompleto,ls_costo,ls_depto,ll_cuenta_inscrito,ls_carrera
dw_consulta.Reset()
cbx_1.checked = false
cbx_2.checked = false
sle_nombreprof.text = ""


if trim(sle_cuenta.text) <>"" then 
	al_nomina = long(sle_cuenta.text)
	if rb_2.checked then
		IF KeyDown (keyEnter!) THEN
			setpointer(Hourglass!)
		
				 SELECT nombre+' '+isnull(appaterno,'') +' ' +isnull(apmaterno,'') as nombrecompleto,   
						ccosto,   
						nombredepto  
				 INTO :ls_nombrecompleto,   
						:ls_costo,   
						:ls_depto  
				FROM empl_uia1  
			WHERE empl_uia1.empleado = :al_nomina   using gtr_personal;
			if gtr_personal.sqlcode=0 then
				//TODO OK
				sle_nombreprof.text=ls_nombrecompleto
							
			else
				messagebox("Mensaje del Sistema","La clave ingresada no es valida",stopsign!)
			end if			
		
			//
			setpointer(Arrow!)		
		END IF
	elseif rb_1.checked then
		SELECT v_sce_alumnos.cuenta,   
	         v_sce_alumnos.nombre+ ' ' + v_sce_alumnos.apaterno+' ' +v_sce_alumnos.amaterno as nombre_completo
   		INTO :ll_cuenta_inscrito,   
	       		:ls_nombrecompleto
		FROM   v_sce_alumnos 
	   	WHERE v_sce_alumnos.cuenta = :al_nomina
		using gtr_sumuia;
		
			if gtr_sumuia.sqlcode=0 then
				//TODO OK
				sle_nombreprof.text=ls_nombrecompleto
							
			else
				messagebox("Mensaje del Sistema","La clave ingresada no es valida",stopsign!)
			end if	
		end if
		commit using gtr_personal;
end if
end event

type st_1 from statictext within w_csal_mat_plumones
integer x = 2820
integer y = 67
integer width = 508
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 29534863
string text = " Control Salones"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_consulta from datawindow within w_csal_mat_plumones
integer x = 110
integer y = 832
integer width = 3218
integer height = 1232
integer taborder = 20
string title = "none"
string dataobject = "d_csal_mat_plumones"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_2 from checkbox within w_csal_mat_plumones
integer x = 1357
integer y = 218
integer width = 329
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "a Cambio"
end type

event clicked;if this.checked then
	cbx_1.checked = false
	ii_estatus=3
	dw_consulta.reset()
end if
end event

type cbx_1 from checkbox within w_csal_mat_plumones
integer x = 1357
integer y = 141
integer width = 391
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Entregados"
end type

event clicked;if this.checked then
	cbx_2.checked = false
	ii_estatus= 2
	dw_consulta.reset()
end if
end event

type cb_1 from commandbutton within w_csal_mat_plumones
integer x = 1993
integer y = 714
integer width = 402
integer height = 90
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consulta"
end type

event clicked;
if trim(sle_cuenta.text) <>"" then
	dw_consulta.dataobject='d_csal_mat_plumones'
	dw_consulta.settransobject(gtr_sumuia)
	dw_consulta.Retrieve(al_nomina)
	if dw_consulta.Rowcount() > 0 then
	else
		messagebox("Mensaje del Sistema","No existen registros",exclamation!)
	end if
elseif (cbx_1.checked and rb_3.checked) or( cbx_2.checked and rb_3.checked) then
	dw_consulta.dataobject='d_csal_mat_plumones_todos'
	dw_consulta.settransobject(gtr_sumuia)
	dw_consulta.Retrieve(ii_estatus)
	if ii_estatus = 3 then
		dw_consulta.object.t_2.text = 'Reporte de Plumones a Cambio'
	end if
else
	messagebox("Mensaje del Sistema","Debe seleccionar Tipo de estatus a consultar",exclamation!)
end if


end event

type gb_1 from groupbox within w_csal_mat_plumones
integer x = 1258
integer y = 48
integer width = 614
integer height = 426
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Seleccione Tipo estatus"
end type

type gb_2 from groupbox within w_csal_mat_plumones
integer x = 80
integer y = 45
integer width = 900
integer height = 426
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 29534863
string text = "Buscar"
end type

