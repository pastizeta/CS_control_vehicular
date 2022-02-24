$PBExportHeader$w_gen_multas_condonar.srw
forward
global type w_gen_multas_condonar from window
end type
type cb_condonar from commandbutton within w_gen_multas_condonar
end type
type dw_multas from datawindow within w_gen_multas_condonar
end type
end forward

global type w_gen_multas_condonar from window
integer width = 3357
integer height = 2269
boolean titlebar = true
string title = "Condonación de multas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 30520472
string icon = "AppIcon!"
boolean center = true
cb_condonar cb_condonar
dw_multas dw_multas
end type
global w_gen_multas_condonar w_gen_multas_condonar

type variables

end variables

forward prototypes
public subroutine f_condonar (long p_multa)
end prototypes

public subroutine f_condonar (long p_multa);update dbo.spre_multas
set saldo=0
where folio_multa=:p_multa
using gtr_sumuia;

update dbo.spre_materiales_multas
set status=2
where folio_multa=:p_multa
using gtr_sumuia;

if gtr_sumuia.sqlcode<>0 then
	messagebox("Error al cancelar la multa: "+string(gtr_sumuia.sqlcode), gtr_sumuia.SQLErrText)
	rollback using gtr_sumuia;
else
	commit using gtr_sumuia;
end if	


end subroutine

on w_gen_multas_condonar.create
this.cb_condonar=create cb_condonar
this.dw_multas=create dw_multas
this.Control[]={this.cb_condonar,&
this.dw_multas}
end on

on w_gen_multas_condonar.destroy
destroy(this.cb_condonar)
destroy(this.dw_multas)
end on

event open;dw_multas.settransobject(gtr_sumuia)
dw_multas.Retrieve(gi_depto)
end event

type cb_condonar from commandbutton within w_gen_multas_condonar
integer x = 2864
integer y = 2029
integer width = 413
integer height = 106
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Condonar"
end type

event clicked;integer li_row=0, li_i, li_marca=0
long ll_multa

for li_i=1 to dw_multas.RowCount()
	li_marca=dw_multas.GetItemNumber(li_i,'box')
	if li_marca = 1 then li_row = 1
next
	
if li_row=0 then
	messagebox('Aviso','Tiene que seleccionar alguna multa')
else
	for li_i=1 to dw_multas.RowCount()
		li_marca=dw_multas.GetItemNumber(li_i,'box')
		ll_multa=dw_multas.GetItemNumber(li_i,'spre_multas_folio_multa')
		
		if li_marca=1 then f_condonar(ll_multa)
	next
	messagebox('Aviso','Las multas marcadas fueron condonadas')
end if
end event

type dw_multas from datawindow within w_gen_multas_condonar
integer x = 59
integer y = 51
integer width = 3222
integer height = 1936
integer taborder = 10
string title = "none"
string dataobject = "d_gen_multas_pendientes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0  then

	choose case dwo.name

		case 'box'
			
			if this.GetItemNumber(row,'box') = 0 then
				//Se va a marcar
				this.SetItem(row,'box',1)
			else
				//Se va a desmarcar
				this.SetItem(row,'box',0)
			end if

	end choose
	
end if
end event

