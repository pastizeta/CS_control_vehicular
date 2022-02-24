$PBExportHeader$conf_impr.srw
forward
global type conf_impr from Window
end type
type cbx_intercalar from checkbox within conf_impr
end type
type cbx_archivo from checkbox within conf_impr
end type
type st_impresora from statictext within conf_impr
end type
type ddlb_pg from dropdownlistbox within conf_impr
end type
type cb_printer from commandbutton within conf_impr
end type
type cb_cancel from commandbutton within conf_impr
end type
type cb_ok from commandbutton within conf_impr
end type
type st_5 from statictext within conf_impr
end type
type st_4 from statictext within conf_impr
end type
type rb_paginas from radiobutton within conf_impr
end type
type rb_pagina_actual from radiobutton within conf_impr
end type
type rb_todas from radiobutton within conf_impr
end type
type st_3 from statictext within conf_impr
end type
type sle_paginas from singlelineedit within conf_impr
end type
type em_copia from editmask within conf_impr
end type
type gb_1 from groupbox within conf_impr
end type
end forward

global type conf_impr from Window
int X=471
int Y=328
int Width=1979
int Height=1132
boolean TitleBar=true
string Title="Imprimir"
long BackColor=12632256
boolean ControlMenu=true
WindowType WindowType=response!
cbx_intercalar cbx_intercalar
cbx_archivo cbx_archivo
st_impresora st_impresora
ddlb_pg ddlb_pg
cb_printer cb_printer
cb_cancel cb_cancel
cb_ok cb_ok
st_5 st_5
st_4 st_4
rb_paginas rb_paginas
rb_pagina_actual rb_pagina_actual
rb_todas rb_todas
st_3 st_3
sle_paginas sle_paginas
em_copia em_copia
gb_1 gb_1
end type
global conf_impr conf_impr

type variables
string is_archivo
datawindow idw

end variables

on close;//principal.no_vent_imp=false
end on

event open;
string ls_copias
idw=message.powerobjectparm
st_impresora.text="Impresora Actual: "+ string(idw.object.datawindow.printer)
ls_copias=string(idw.object.datawindow.print.copies)

if ls_copias<>"" and ls_copias<>"0" then
	em_copia.text=ls_copias
else
	em_copia.text="1"
end if

cbx_intercalar.checked=(upper (string(idw.object.datawindow.print.collate))="YES")
is_archivo=trim(string(idw.object.datawindow.print.filename))
cbx_archivo.checked=(is_archivo<>"")
end event

on conf_impr.create
this.cbx_intercalar=create cbx_intercalar
this.cbx_archivo=create cbx_archivo
this.st_impresora=create st_impresora
this.ddlb_pg=create ddlb_pg
this.cb_printer=create cb_printer
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_5=create st_5
this.st_4=create st_4
this.rb_paginas=create rb_paginas
this.rb_pagina_actual=create rb_pagina_actual
this.rb_todas=create rb_todas
this.st_3=create st_3
this.sle_paginas=create sle_paginas
this.em_copia=create em_copia
this.gb_1=create gb_1
this.Control[]={this.cbx_intercalar,&
this.cbx_archivo,&
this.st_impresora,&
this.ddlb_pg,&
this.cb_printer,&
this.cb_cancel,&
this.cb_ok,&
this.st_5,&
this.st_4,&
this.rb_paginas,&
this.rb_pagina_actual,&
this.rb_todas,&
this.st_3,&
this.sle_paginas,&
this.em_copia,&
this.gb_1}
end on

on conf_impr.destroy
destroy(this.cbx_intercalar)
destroy(this.cbx_archivo)
destroy(this.st_impresora)
destroy(this.ddlb_pg)
destroy(this.cb_printer)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.rb_paginas)
destroy(this.rb_pagina_actual)
destroy(this.rb_todas)
destroy(this.st_3)
destroy(this.sle_paginas)
destroy(this.em_copia)
destroy(this.gb_1)
end on

type cbx_intercalar from checkbox within conf_impr
int X=1362
int Y=684
int Width=507
int Height=76
string Text="Intercalar Copias"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_archivo from checkbox within conf_impr
int X=1362
int Y=776
int Width=562
int Height=76
string Text="Imprimir al archivo"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string ls_archivo

if this.checked then
	getfilesavename("Selecciona el archivo ",is_archivo,ls_archivo, &
	"PRN","Archivos de impresion (*.PRN),*.PRN")
else
	is_archivo=""
end if
end event

type st_impresora from statictext within conf_impr
int X=37
int Y=44
int Width=1701
int Height=72
boolean Enabled=false
boolean FocusRectangle=false
long BackColor=12632256
long BorderColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type ddlb_pg from dropdownlistbox within conf_impr
int X=581
int Y=860
int Width=567
int Height=260
int TabOrder=70
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
int Limit=3
long BackColor=16777215
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Todo",&
"Páginas impares",&
"Páginas pares"}
end type

event constructor;this.selectitem(1)
end event

event selectionchanged;rb_todas.checked=true
end event

type cb_printer from commandbutton within conf_impr
int X=1385
int Y=548
int Width=389
int Height=92
int TabOrder=100
string Text="Impresora"
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
if printsetup()=1 then
   st_impresora.text= "Impresora: "+string(dw.object.datawindow.printer)
end if
end event

type cb_cancel from commandbutton within conf_impr
int X=1385
int Y=420
int Width=389
int Height=92
int TabOrder=90
string Text="Cancelar"
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(parent)
end event

type cb_ok from commandbutton within conf_impr
int X=1385
int Y=288
int Width=389
int Height=92
int TabOrder=80
string Text="Aceptar"
boolean Default=true
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;integer li_indice
string ls_modifica_dw, ls_pagina, ls_error_dw

ls_modifica_dw="Datawindow.print.copies="+em_copia.text

if cbx_intercalar.checked then
	ls_modifica_dw= ls_modifica_dw+ " Datawindow.print.collate=YES"
else
	ls_modifica_dw= ls_modifica_dw+ " Datawindow.print.collate=NO"
end if

if cbx_archivo.checked then
	ls_modifica_dw= ls_modifica_dw+ " Datawindow.print.filename="+is_archivo
else
	ls_modifica_dw= ls_modifica_dw+ " Datawindow.print.filename=''"
end if

if rb_todas.checked then
	ls_modifica_dw= ls_modifica_dw+ " Datawindow.print.page.range=''"
elseif rb_pagina_actual.checked then
	ls_pagina=idw.describe("Evaluate('Page()',"+String(idw.getrow())+")")
	ls_modifica_dw= ls_modifica_dw+ " Datawindow.print.page.range='"+ls_pagina+"'"
else
	ls_modifica_dw= ls_modifica_dw+ " Datawindow.print.page.range='"+sle_paginas.text+"'"
end if
li_indice=ddlb_pg.finditem(ddlb_pg.text,0)
if li_indice>0 then
	ls_modifica_dw=ls_modifica_dw+ " Datawindow.print.page.rangeinclude=" + string(li_indice - 1)
end if
	ls_error_dw=idw.modify(ls_modifica_dw)

parent.visible=false

if ls_error_dw <>"" then
	populateerror(-1,ls_error_dw)
	messagebox("Mensaje del sistema","Las opciones de impresion son incorrectas, "+ls_error_dw,stopsign!)
else
	idw.print(TRUE)
	this.setfocus()
end if
close(parent)


end event

type st_5 from statictext within conf_impr
int X=37
int Y=872
int Width=443
int Height=72
boolean Enabled=false
string Text="  Imprimir sólo:"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within conf_impr
int X=160
int Y=680
int Width=942
int Height=116
boolean Enabled=false
string Text="Escriba numeros de página  e/o intervalos  separados por comas. Ejemplo: 1,3,5-12,14"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_paginas from radiobutton within conf_impr
int X=160
int Y=592
int Width=329
int Height=72
int TabOrder=50
string Text="Páginas :"
BorderStyle BorderStyle=StyleLowered!
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on getfocus;sle_paginas.setfocus()
end on

type rb_pagina_actual from radiobutton within conf_impr
int X=160
int Y=492
int Width=485
int Height=72
int TabOrder=40
string Text="Página actual"
BorderStyle BorderStyle=StyleLowered!
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;ddlb_pg.text=""
end on

type rb_todas from radiobutton within conf_impr
int X=160
int Y=380
int Width=247
int Height=72
int TabOrder=30
string Text="Todo"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;checked =true
end event

type st_3 from statictext within conf_impr
int X=27
int Y=156
int Width=306
int Height=72
boolean Enabled=false
string Text=" Copias"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_paginas from singlelineedit within conf_impr
int X=603
int Y=584
int Width=494
int Height=72
int TabOrder=60
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long BackColor=16777215
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event getfocus;rb_paginas.checked=True
end event

type em_copia from editmask within conf_impr
int X=407
int Y=152
int Width=393
int Height=96
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string Mask="#"
boolean Spin=true
double Increment=1
string MinMax="1~~20"
long BackColor=16777215
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within conf_impr
int X=27
int Y=288
int Width=1312
int Height=556
int TabOrder=20
string Text="Intervalo de página"
BorderStyle BorderStyle=StyleLowered!
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

