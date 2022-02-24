$PBExportHeader$w_psi_cat_pruebas_materia.srw
forward
global type w_psi_cat_pruebas_materia from window
end type
type dw_materia from u_basedw within w_psi_cat_pruebas_materia
end type
type cb_buscar from commandbutton within w_psi_cat_pruebas_materia
end type
type rb_materia from radiobutton within w_psi_cat_pruebas_materia
end type
type rb_clave from radiobutton within w_psi_cat_pruebas_materia
end type
type sle_materia from singlelineedit within w_psi_cat_pruebas_materia
end type
type dw_prueba from datawindow within w_psi_cat_pruebas_materia
end type
type cb_actualizar from commandbutton within w_psi_cat_pruebas_materia
end type
type gb_prueba from groupbox within w_psi_cat_pruebas_materia
end type
type gb_materia from groupbox within w_psi_cat_pruebas_materia
end type
end forward

global type w_psi_cat_pruebas_materia from window
integer width = 2747
integer height = 2403
boolean titlebar = true
string title = "Catálogo de Pruebas Psicológicas por Materia"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
dw_materia dw_materia
cb_buscar cb_buscar
rb_materia rb_materia
rb_clave rb_clave
sle_materia sle_materia
dw_prueba dw_prueba
cb_actualizar cb_actualizar
gb_prueba gb_prueba
gb_materia gb_materia
end type
global w_psi_cat_pruebas_materia w_psi_cat_pruebas_materia

type variables
integer ii_materia
DatawindowChild idwc_materia
end variables

forward prototypes
public function integer f_ultima_prueba ()
public function integer f_existe (integer p_materia, integer p_prueba)
end prototypes

public function integer f_ultima_prueba ();integer li_id

	select max(id)
	into :li_id
	from dbo.spre_cat_pruebas
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Obtener máxima Prueba", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	if isNull(li_id) then li_id=0

	return(li_id)
end function

public function integer f_existe (integer p_materia, integer p_prueba);integer li_existe

	select count(*) as existe
	into :li_existe
	from dbo.spre_cat_pruebas_materia
	where cve_mat =:p_materia and id_prueba =:p_prueba
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Existe registro", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
		return -1
	else
		commit using gtr_sumuia;	
	end if
	
	return(li_existe)
end function

on w_psi_cat_pruebas_materia.create
this.dw_materia=create dw_materia
this.cb_buscar=create cb_buscar
this.rb_materia=create rb_materia
this.rb_clave=create rb_clave
this.sle_materia=create sle_materia
this.dw_prueba=create dw_prueba
this.cb_actualizar=create cb_actualizar
this.gb_prueba=create gb_prueba
this.gb_materia=create gb_materia
this.Control[]={this.dw_materia,&
this.cb_buscar,&
this.rb_materia,&
this.rb_clave,&
this.sle_materia,&
this.dw_prueba,&
this.cb_actualizar,&
this.gb_prueba,&
this.gb_materia}
end on

on w_psi_cat_pruebas_materia.destroy
destroy(this.dw_materia)
destroy(this.cb_buscar)
destroy(this.rb_materia)
destroy(this.rb_clave)
destroy(this.sle_materia)
destroy(this.dw_prueba)
destroy(this.cb_actualizar)
destroy(this.gb_prueba)
destroy(this.gb_materia)
end on

event open;dw_prueba.settransobject(gtr_sumuia)

dw_materia.settransobject(gtr_sumuia)
dw_materia.getchild('materia',idwc_materia)
idwc_materia.settransobject(gtr_sumuia)

idwc_materia.Retrieve()
if idwc_materia.RowCount()>0 then 
	dw_materia.insertrow(0)
	dw_materia.SetItem(1,'materia',idwc_materia.GetItemString(1,'materia'))
	ii_materia=idwc_materia.GetItemNumber(1,'cve_mat')
end if

end event

type dw_materia from u_basedw within w_psi_cat_pruebas_materia
integer x = 731
integer y = 237
integer width = 1470
integer height = 80
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_psi_cat_materia_drop"
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;uf_SetDDKeySrch("area", "area", "area")
end event

event itemchanged;call super::itemchanged;ii_materia=long(this.gettext())

end event

type cb_buscar from commandbutton within w_psi_cat_pruebas_materia
integer x = 2260
integer y = 227
integer width = 366
integer height = 90
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Buscar"
end type

event clicked;integer li_retrieve = 0, li_existe = 0
string ls_nombre =''

dw_prueba.Reset()

if rb_clave.checked then
	if isNumber(trim(sle_materia.text)) then 
		ii_materia = long(trim(sle_materia.text))
		li_retrieve = 1
	end if
else
	if ii_materia > 0 then li_retrieve = 1
end if

if li_retrieve = 1 then

	select  b.materia, b.cve_mat
	into :ls_nombre, :li_existe
	from v_sce_materias b
	where b.cve_coordinacion in (3500,3600) 
	and b.cve_mat = :ii_materia
	using gtr_sumuia; 
	
	if gtr_sumuia.SQLCode = -1 then 
		messagebox("Error SUMUIA: Buscar materia", gtr_sumuia.SQLErrText)	
		rollback using gtr_sumuia;
	else
		commit using gtr_sumuia;	
	end if		

	if li_existe > 0 then
		dw_prueba.Retrieve(ii_materia)
	else
		messagebox('Aviso','La materia no pertenece a la coordinación de PSICOLOGÍA')
	end if
end if

gb_prueba.text = 'Materia: ' + ls_nombre
end event

type rb_materia from radiobutton within w_psi_cat_pruebas_materia
integer x = 80
integer y = 227
integer width = 596
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Materias con pruebas"
end type

event clicked;idwc_materia.Retrieve()
if idwc_materia.RowCount()>0 then 
	dw_materia.insertrow(0)
	dw_materia.SetItem(1,'materia',idwc_materia.GetItemString(1,'materia'))
	ii_materia=idwc_materia.GetItemNumber(1,'cve_mat')
end if

dw_prueba.Reset()
gb_prueba.text = 'Materia:'

end event

type rb_clave from radiobutton within w_psi_cat_pruebas_materia
integer x = 80
integer y = 125
integer width = 483
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Clave de materia"
boolean checked = true
end type

event clicked;idwc_materia.Retrieve()
if idwc_materia.RowCount()>0 then 
	dw_materia.insertrow(0)
	dw_materia.SetItem(1,'materia',idwc_materia.GetItemString(1,'materia'))
	ii_materia=idwc_materia.GetItemNumber(1,'cve_mat')
end if

dw_prueba.Reset()
gb_prueba.text = 'Materia:'

end event

type sle_materia from singlelineedit within w_psi_cat_pruebas_materia
integer x = 739
integer y = 118
integer width = 366
integer height = 90
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_prueba from datawindow within w_psi_cat_pruebas_materia
integer x = 73
integer y = 464
integer width = 2509
integer height = 1632
integer taborder = 10
string title = "none"
string dataobject = "d_psi_cat_pruebas_mat_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_actualizar from commandbutton within w_psi_cat_pruebas_materia
integer x = 2158
integer y = 2182
integer width = 322
integer height = 99
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Actualizar"
end type

event clicked;integer Net, li_i, li_materia, li_prueba, li_cbox, li_existe, li_error = 0
	
if dw_prueba.RowCount()>0 then

	Net = messagebox("Atención", '¿Desea guardar los cambios?', Question!, yesno!, 2)
	if Net = 1 then
		
		for li_i=1 to dw_prueba.RowCount()
			li_materia = dw_prueba.GetItemNumber(li_i,'cve_mat')
			li_prueba = dw_prueba.GetItemNumber(li_i,'id_prueba')
			li_cbox = dw_prueba.GetItemNumber(li_i,'borrado')
			
			li_existe = f_existe(li_materia,li_prueba)
			
			if li_existe > 0 then
				/*Actualiza*/
				update dbo.spre_cat_pruebas_materia
				set borrado =:li_cbox
				where cve_mat =:li_materia and id_prueba =:li_prueba
				using gtr_sumuia; 
				
				if gtr_sumuia.SQLCode = -1 then 
					messagebox("Error SUMUIA: Guarda registro", gtr_sumuia.SQLErrText)	
					li_error = 1
				end if
				
			else
				/*Inserta*/
				if li_cbox = 0 then
					insert into dbo.spre_cat_pruebas_materia
					(cve_mat, id_prueba, borrado)
					values (:li_materia, :li_prueba, :li_cbox)
					using gtr_sumuia; 
					
					if gtr_sumuia.SQLCode = -1 then
						messagebox("Error SUMUIA: Guarda registro", gtr_sumuia.SQLErrText)	
						li_error = 1
					end if
				end if
				
			end if
			
		next
		
		if li_error = 0 then
			commit using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros han sido Actualizados con éxito.",exclamation!)
		else
			rollback using gtr_sumuia;
			messagebox("Mensaje del sistema","Los registros NO han sido Actualizados con éxito.",stopsign!)
		end if
	
	end if

end if

end event

type gb_prueba from groupbox within w_psi_cat_pruebas_materia
integer x = 33
integer y = 387
integer width = 2633
integer height = 1750
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
end type

type gb_materia from groupbox within w_psi_cat_pruebas_materia
integer x = 33
integer y = 48
integer width = 2629
integer height = 301
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 30520472
string text = "Materias"
end type

