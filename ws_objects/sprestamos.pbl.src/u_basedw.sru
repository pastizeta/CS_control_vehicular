$PBExportHeader$u_basedw.sru
forward
global type u_basedw from datawindow
end type
end forward

type us_ddkeysrch from structure
    string textcol
    datawindowchild dw
    string srchcol
    string datacol
    string prevtext
end type

global type u_basedw from datawindow
int Width=494
int Height=360
int TabOrder=1
boolean LiveScroll=true
event ue_ddkeysrch pbm_custom01
event ue_dwnkey pbm_dwnkey
end type
global u_basedw u_basedw

type variables
Private:
   us_ddkeysrch istr_ddkeysrch[]

Protected:
   boolean ib_ddkeysrch = false
   integer  ii_ddkeysrch_cnt
end variables

forward prototypes
public subroutine uf_ddkeysrch ()
public subroutine uf_setddkeysrch (string vs_textcol, string vs_srchcol, string vs_datacol)
end prototypes

on ue_ddkeysrch;if ib_ddkeysrch then uf_DDKeySrch()
end on

on ue_dwnkey;this.PostEvent("ue_ddkeysrch")
end on

public subroutine uf_ddkeysrch ();string	ls_col, ls_srch, ls_found
integer	li_idx, li_len
long		ll_row, ll_found
date		ld_found
datetime	ldt_found
time		lt_found

Yield()

/************************/
/* Ignore movement keys */
/************************/
CHOOSE CASE true
	CASE KeyDown(keyDelete!), KeyDown(keyBack!), KeyDown(keyTab!), KeyDown(keyEnter!)
		return
	CASE KeyDown(keyDownArrow!), KeyDown(keyUpArrow!), KeyDown(keyLeftArrow!), KeyDown(keyRightArrow!)
		return
END CHOOSE

/***************************************************************************************/
/* Since multiple columns could be setup for dynamic key searching, there is an array	*/
/* of the columns currently setup. Search the array for the entry that matches the		*/
/* current column.																							*/
/***************************************************************************************/
ls_col = this.GetColumnName()
FOR li_idx = 1 TO ii_ddkeysrch_cnt
	if istr_ddkeysrch[li_idx].textcol = ls_col then
		/******************************************************************/
		/* Get the typed value from the edit box and find a match for it	*/
		/* in the dropdown list.														*/
		/******************************************************************/
		ls_srch = Lower(this.GetText())
		li_len  = Len(ls_srch)
		if li_len < 1 then Return
		ll_row = istr_ddkeysrch[li_idx].dw.Find("lower(left(" &
				+ istr_ddkeysrch[li_idx].srchcol + ", " + String(li_len) &
				+ ")) = '" + ls_srch + "'", 1, istr_ddkeysrch[li_idx].dw.RowCount())
		if ll_row < 1 then Return

		/*************************************************************************************/
		/* Find the datatype of the data column in the dddw. Use the correct GetItem... call */
		/* to retrieve the value and then use SetText to place it in the edit box.				 */
		/*************************************************************************************/
		CHOOSE CASE True
			CASE Left(istr_ddkeysrch[li_idx].dw.Describe(istr_ddkeysrch[li_idx].datacol + ".coltype"), 4) = "char"
				ls_found = istr_ddkeysrch[li_idx].dw.GetItemString(ll_row, istr_ddkeysrch[li_idx].datacol)
				this.SetText(ls_found)
			CASE istr_ddkeysrch[li_idx].dw.Describe (istr_ddkeysrch[li_idx].datacol + ".coltype") = "number"
				ll_found = istr_ddkeysrch[li_idx].dw.GetItemNumber(ll_row, istr_ddkeysrch[li_idx].datacol)
				this.SetText(String (ll_found))
			CASE istr_ddkeysrch[li_idx].dw.Describe (istr_ddkeysrch[li_idx].datacol + ".coltype") = "date"
				ld_found = istr_ddkeysrch[li_idx].dw.GetItemDate(ll_row, istr_ddkeysrch[li_idx].datacol)
				this.SetText(String (ld_found))
			CASE istr_ddkeysrch[li_idx].dw.Describe (istr_ddkeysrch[li_idx].datacol + ".coltype") = "datetime"
				ldt_found = istr_ddkeysrch[li_idx].dw.GetItemDateTime(ll_row, istr_ddkeysrch[li_idx].datacol)
				this.SetText(String (ldt_found))
			CASE istr_ddkeysrch[li_idx].dw.Describe (istr_ddkeysrch[li_idx].datacol + ".coltype") = "time"
				lt_found = istr_ddkeysrch[li_idx].dw.GetItemTime(ll_row, istr_ddkeysrch[li_idx].datacol)
				this.SetText(String (lt_found))
		END CHOOSE

		/***********************************************************************************/
		/* Select the text from the current position to the end.									  */
		/* The next keystroke will erase the selection and substitute the typed character. */
		/***********************************************************************************/
		This.SelectText(li_Len + 1, 150)
		EXIT
	end if
NEXT

end subroutine

public subroutine uf_setddkeysrch (string vs_textcol, string vs_srchcol, string vs_datacol);ib_ddkeysrch = true
ii_ddkeysrch_cnt++

/*********************************************************************/
/* Add an entry to the array of columns that are currently setup		*/
/* for dynamic key searching. Obtain a pointer to the child				*/
/* datawindow of the column and set the transaction object for it.	*/
/* Also keep track of the search column and data column so we			*/
/* know which columns to search and retrieve when a value is typed.	*/
/*********************************************************************/
istr_ddkeysrch[ii_ddkeysrch_cnt].textcol = vs_textcol
this.GetChild(vs_textcol, istr_ddkeysrch[ii_ddkeysrch_cnt].dw)
istr_ddkeysrch[ii_ddkeysrch_cnt].dw.SetTransObject(SQLCA)
istr_ddkeysrch[ii_ddkeysrch_cnt].srchcol = vs_srchcol
istr_ddkeysrch[ii_ddkeysrch_cnt].datacol = vs_datacol
end subroutine

