$PBExportHeader$w_buscar.srw
forward
global type w_buscar from window
end type
type dw_criteria from datawindow within w_buscar
end type
type cbx_case_sensitive from checkbox within w_buscar
end type
type cb_cancel from commandbutton within w_buscar
end type
type cb_find from commandbutton within w_buscar
end type
end forward

global type w_buscar from window
integer x = 1074
integer y = 480
integer width = 2199
integer height = 608
boolean titlebar = true
string title = "Buscar"
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 12632256
toolbaralignment toolbaralignment = alignatleft!
dw_criteria dw_criteria
cbx_case_sensitive cbx_case_sensitive
cb_cancel cb_cancel
cb_find cb_find
end type
global w_buscar w_buscar

type variables
Long i_lRow
String i_aszTypes[]
DataWindow i_dwToActOn
end variables

forward prototypes
private function string wf_escapechars (string a_szvalue)
private subroutine wf_resetfind ()
private function long wf_find (long a_lStartRow)
end prototypes

private function string wf_escapechars (string a_szvalue);Char cChar
Integer nLength, nPos

nLength = Len( a_szValue)

For nPos = nLength To 1 Step -1
	cChar = Mid( a_szValue, nPos, 1)
	Choose Case cChar
		Case "~t", "~r", "~n", '"', "'", "~~"
			a_szValue = Replace( a_szValue, nPos, 1, "~~" + cChar)
	End Choose
Next

Return Trim( a_szValue)
end function

private subroutine wf_resetfind ();i_lRow = 0
cb_find.Text = "&Buscar"
end subroutine

private function long wf_find (long a_lStartRow);Long lNoOfCriteria, lRow, lColumnNo
Integer nPos
String szFind, szColumn, szOperator, szValue, szExpression, szJoin, szFormat, szValue1, szValue2, szValue3

lNoOfCriteria = dw_criteria.RowCount()

For lRow = 1 To lNoOfCriteria
	lColumnNo = dw_criteria.GetItemNumber( lRow, "column_number")

	szColumn = i_dwToActOn.Describe( "#" + String( lColumnNo) + ".Name")
	szJoin = dw_criteria.GetItemString( lRow, "join_operator")
	If IsNull( szJoin) Then szJoin = ""
	szValue = wf_escapechars( dw_criteria.GetItemString( lRow, "value"))

	Choose Case Left( i_aszTypes[ lColumnNo], 5)
	Case "char("
		If IsNull( szValue) Then
			szExpression = szColumn
		Else
			szOperator = Upper( dw_criteria.GetItemString( lRow, "string_operators"))
			If Right( szOperator, 4) = "LIKE" Then
				If Pos( szValue, "%") = 0 Then
					szValue = szValue + "%"
				End If
			End If
			szExpression = szOperator + " '" + szValue + "' "

			If cbx_case_sensitive.Checked Then
				szExpression = szColumn + " " + szExpression
			Else
				szExpression = "LOWER( " + szColumn + ") " + Lower( szExpression)
			End If
		End If
	Case "date", "time"
		If IsNull( szValue) Then
			szExpression = szColumn
		Else
			szOperator = Upper( dw_criteria.GetItemString( lRow, "datetime_operators"))
			If Right( szOperator, 7) = "BETWEEN" Then
				nPos = Pos( Upper( szValue), " AND ")
				If nPos > 0 Then
					szValue1 = Left( szValue, nPos - 1)
					szValue2 = Mid( szValue, nPos + 5)
				End If
			Else					
				nPos = 0
			End If

			If i_aszTypes[ lColumnNo] = "date" Then
				szFormat = "yyyymmdd"
				szValue = String( Date( szValue), szFormat)
				szValue1 = String( Date( szValue1), szFormat)
				szValue2 = String( Date( szValue2), szFormat)
			ElseIf i_aszTypes[ lColumnNo] = "time" Then
				szFormat = "hhmmss"
				szValue = String( Time( szValue), szFormat)
				szValue1 = String( Time( szValue1), szFormat)
				szValue2 = String( Time( szValue2), szFormat)
			End If

			If nPos = 0 Then
				szExpression = "Long( String( " + szColumn + ", '" + szFormat + "')) " + szOperator + szValue
			Else
				szExpression = "Long( String( " + szColumn + ", '" + szFormat + "')) " + szOperator + &
  	                        " " + szValue1 + " AND " + szValue2
			End If
		End If
	Case Else
		If IsNull( szValue) Then
			szExpression = szColumn
		Else
			szOperator = Upper( dw_criteria.GetItemString( lRow, "numeric_operators"))
			If szOperator = "IN" Or szOperator = "NOT IN" Then
				szExpression = szColumn + " " + szOperator + " (" + szValue + ") "
			Else
				szExpression = szColumn + " " + szOperator + " " + szValue + " "
			End If
		End If
	End Choose

	szFind = szFind + " ( " + Trim( szExpression) + ") " + szJoin
Next

lRow = i_dwToActOn.Find( szFind, a_lStartRow, i_dwToActOn.RowCount()) 

Return lRow
end function

event open;Integer nColumnCount, nColumnIndex
String  szColumn
Long lRow
DataWindowChild dwcColumns

i_dwToActOn = Message.PowerObjectParm
i_lRow = 0
 
nColumnCount = Integer( i_dwToActOn.Object.DataWindow.Column.Count)

dw_criteria.GetChild( "column_number", dwcColumns)

i_aszTypes[ nColumnCount] = ""

For nColumnIndex = 1 To nColumnCount
	szColumn = f_strip( i_dwToActOn.Describe( i_dwToActOn.Describe( "#" + String(nColumnIndex) + ".Name") + "_t.Text"))
	If szColumn <> "!" Then
		lRow = dwcColumns.InsertRow( 0)
		dwcColumns.SetItem( lRow, "column_name", szColumn)
		dwcColumns.SetItem( lRow, "column_number", nColumnIndex)
		i_aszTypes[ nColumnIndex] = i_dwToActOn.Describe( "#" + String(nColumnIndex) + ".ColType")
	End If
Next

dw_criteria.insertrow(0)
end event

on w_buscar.create
this.dw_criteria=create dw_criteria
this.cbx_case_sensitive=create cbx_case_sensitive
this.cb_cancel=create cb_cancel
this.cb_find=create cb_find
this.Control[]={this.dw_criteria,&
this.cbx_case_sensitive,&
this.cb_cancel,&
this.cb_find}
end on

on w_buscar.destroy
destroy(this.dw_criteria)
destroy(this.cbx_case_sensitive)
destroy(this.cb_cancel)
destroy(this.cb_find)
end on

type dw_criteria from datawindow within w_buscar
integer x = 18
integer y = 24
integer width = 2107
integer height = 324
integer taborder = 10
string dataobject = "d_find"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;Long lRow, lTotalRows, lIndex, lReturn = 0
String szValue

lRow = this.GetRow()
lTotalRows = this.RowCount()
szValue = this.GetText()

Choose Case this.GetcolumnName()
	Case "column_number" 
		lIndex = Long( szValue)
		If lIndex > 0 Then
			If i_aszTypes[ lIndex] <> "" Then
				this.SetItem( lRow, "column_datatype", i_aszTypes[ lIndex])
			End If
		End If
	Case "value"
		If Trim( szValue) <> "" Then
			Choose Case Lower( this.GetItemString( lRow, "column_datatype"))
				Case "date"
					If Not IsDate( szValue) Then
						lReturn = 1
					End If
				Case "time"
					If Not IsTime( szValue) Then
						lReturn = 1
					End If
				Case "long", "ulong", "real"
					If Not IsNumber( szValue) Then
						lReturn = 1
					End If
			End Choose
		End If
	Case "join_operator"
		If lRow = lTotalRows And Not IsNull( this.GetItemNumber( lRow, "column_number")) Then
			this.insertrow(0)
		ElseIf Trim( szValue) = "" And lTotalRows > 1 And lRow <> lTotalRows Then
			dw_criteria.SetRow( lRow + 1)
			dw_criteria.deleterow(0)
		End If
End Choose

wf_ResetFind()

Return lReturn
end event

type cbx_case_sensitive from checkbox within w_buscar
integer x = 59
integer y = 408
integer width = 869
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Coincidir &Mayusculas y Minúsculas"
borderstyle borderstyle = stylelowered!
end type

event clicked;wf_ResetFind()
end event

type cb_cancel from commandbutton within w_buscar
integer x = 1742
integer y = 392
integer width = 247
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
boolean cancel = true
end type

on clicked;Close( Parent)
end on

type cb_find from commandbutton within w_buscar
integer x = 1408
integer y = 392
integer width = 338
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;If IsNull( dw_criteria.GetItemNumber( 1, "column_number")) Then
	Return
End If

i_lRow ++

i_lRow = wf_find( i_lRow)

If i_lRow = 0 Then
	MessageBox( "Busqueda", "No se encontraron datos que cumplan con el criterio.")
	wf_ResetFind()
ElseIf i_lRow > 0 Then
	this.text = "&Siguiente"
	i_dwToActOn.SetColumn( dw_criteria.GetItemNumber( 1, "column_number"))
	i_dwToActOn.SetRow( i_lRow)
	i_dwToActOn.ScrollToRow( i_lRow)
	i_dwToActOn.SetFocus()
End If
end event

