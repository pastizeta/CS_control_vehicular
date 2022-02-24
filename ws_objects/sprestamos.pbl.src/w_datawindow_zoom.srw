$PBExportHeader$w_datawindow_zoom.srw
forward
global type w_datawindow_zoom from window
end type
type em_custom from editmask within w_datawindow_zoom
end type
type cb_cancel from u_cb within w_datawindow_zoom
end type
type cbx_rulers from checkbox within w_datawindow_zoom
end type
type st_percent from statictext within w_datawindow_zoom
end type
type cb_ok from commandbutton within w_datawindow_zoom
end type
type rb_custom from radiobutton within w_datawindow_zoom
end type
type rb_33 from radiobutton within w_datawindow_zoom
end type
type rb_50 from radiobutton within w_datawindow_zoom
end type
type rb_100 from radiobutton within w_datawindow_zoom
end type
type rb_200 from radiobutton within w_datawindow_zoom
end type
type gb_1 from groupbox within w_datawindow_zoom
end type
end forward

global type w_datawindow_zoom from window
integer x = 827
integer y = 528
integer width = 864
integer height = 1004
boolean titlebar = true
string title = "Print Preview"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
em_custom em_custom
cb_cancel cb_cancel
cbx_rulers cbx_rulers
st_percent st_percent
cb_ok cb_ok
rb_custom rb_custom
rb_33 rb_33
rb_50 rb_50
rb_100 rb_100
rb_200 rb_200
gb_1 gb_1
end type
global w_datawindow_zoom w_datawindow_zoom

type variables
datawindow i_dwToActOn
end variables

event open;String szDescribe
datawindow aver


i_dwToActOn = message.powerobjectparm
aver = create datawindow
aver=i_dwToActOn
aver.visible=true

error.windowmenu = "w_dw_zoom"

szDescribe = i_dwToActOn.Describe('DataWindow.Print.Preview DataWindow.Print.Preview.rulers DataWindow.Print.Preview.Zoom')

cb_cancel.enabled = ("yes" = f_get_token( szDescribe, "~n"))
cbx_rulers.checked = ("yes" = f_get_token( szDescribe, "~n"))

Choose Case szDescribe
	Case '200'
		rb_200.checked = TRUE
		rb_200.TriggerEvent( Clicked!)
	Case '100'
		rb_100.checked = TRUE
		rb_100.TriggerEvent( Clicked!)
	Case '50'
		rb_50.checked = TRUE
		rb_50.TriggerEvent( Clicked!)
	Case '33'
		rb_33.checked = TRUE
		rb_33.TriggerEvent( Clicked!)
	Case Else
		rb_custom.checked = TRUE
		em_custom.text = szDescribe
End Choose

end event

on w_datawindow_zoom.create
this.em_custom=create em_custom
this.cb_cancel=create cb_cancel
this.cbx_rulers=create cbx_rulers
this.st_percent=create st_percent
this.cb_ok=create cb_ok
this.rb_custom=create rb_custom
this.rb_33=create rb_33
this.rb_50=create rb_50
this.rb_100=create rb_100
this.rb_200=create rb_200
this.gb_1=create gb_1
this.Control[]={this.em_custom,&
this.cb_cancel,&
this.cbx_rulers,&
this.st_percent,&
this.cb_ok,&
this.rb_custom,&
this.rb_33,&
this.rb_50,&
this.rb_100,&
this.rb_200,&
this.gb_1}
end on

on w_datawindow_zoom.destroy
destroy(this.em_custom)
destroy(this.cb_cancel)
destroy(this.cbx_rulers)
destroy(this.st_percent)
destroy(this.cb_ok)
destroy(this.rb_custom)
destroy(this.rb_33)
destroy(this.rb_50)
destroy(this.rb_100)
destroy(this.rb_200)
destroy(this.gb_1)
end on

type em_custom from editmask within w_datawindow_zoom
event spun pbm_enchange
integer x = 416
integer y = 464
integer width = 210
integer height = 84
integer taborder = 40
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "50"
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
double increment = 5
string minmax = "1~~1000"
end type

event spun;//rb_custom.checked = true

end event

type cb_cancel from u_cb within w_datawindow_zoom
integer x = 343
integer y = 700
integer width = 434
integer height = 88
integer taborder = 10
integer weight = 700
string facename = "Arial"
string text = "Cancel Preview"
boolean cancel = true
end type

event clicked;call super::clicked;i_dwToActOn.Modify( "DataWindow.Print.Preview = no")

close( Parent)	 
end event

type cbx_rulers from checkbox within w_datawindow_zoom
integer x = 46
integer y = 596
integer width = 453
integer height = 72
integer taborder = 50
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Show Rulers"
borderstyle borderstyle = stylelowered!
end type

type st_percent from statictext within w_datawindow_zoom
integer x = 626
integer y = 472
integer width = 59
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "%"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_datawindow_zoom
integer x = 41
integer y = 700
integer width = 283
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Preview"
boolean default = true
end type

event clicked;String szDescribe, szReturn

szDescribe = "DataWindow.Print.Preview.Zoom="+em_custom.text+" DataWindow.Print.Preview = yes DataWindow.Print.Preview.rulers = "

If cbx_rulers.checked Then 
	szDescribe = szDescribe + "yes"
Else
	szDescribe = szDescribe + 'no'
End If

szReturn = i_dwToActOn.Modify( szDescribe)

If szReturn <> "" Then
	MessageBox( "cb_ok", szReturn)
End If

Close( parent)	 
end event

type rb_custom from radiobutton within w_datawindow_zoom
integer x = 101
integer y = 460
integer width = 311
integer height = 72
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = " C&ustom"
boolean checked = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//em_custom.setfocus()
end event

type rb_33 from radiobutton within w_datawindow_zoom
integer x = 101
integer y = 372
integer width = 224
integer height = 72
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = " &33 %"
borderstyle borderstyle = stylelowered!
end type

event clicked;//em_custom.text = '33'
end event

type rb_50 from radiobutton within w_datawindow_zoom
integer x = 101
integer y = 284
integer width = 224
integer height = 72
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = " &50 %"
borderstyle borderstyle = stylelowered!
end type

event clicked;//em_custom.text = '50'
end event

type rb_100 from radiobutton within w_datawindow_zoom
integer x = 101
integer y = 196
integer width = 238
integer height = 72
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "&100 %"
borderstyle borderstyle = stylelowered!
end type

event clicked;//em_custom.text = '100'
end event

type rb_200 from radiobutton within w_datawindow_zoom
integer x = 101
integer y = 108
integer width = 238
integer height = 72
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "&200 %"
borderstyle borderstyle = stylelowered!
end type

event clicked;//em_custom.text = '200'

end event

type gb_1 from groupbox within w_datawindow_zoom
integer x = 41
integer y = 32
integer width = 736
integer height = 552
integer taborder = 20
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Magnification"
borderstyle borderstyle = stylelowered!
end type

