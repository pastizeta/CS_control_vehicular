$PBExportHeader$uo_monthview.sru
$PBExportComments$Objeto de usuario para encapsular el control monthview de Microsoft.
forward
global type uo_monthview from userobject
end type
type ole_1 from olecustomcontrol within uo_monthview
end type
end forward

global type uo_monthview from userobject
integer width = 791
integer height = 632
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ole_1 ole_1
end type
global uo_monthview uo_monthview

forward prototypes
public function ulong of_backcolor ()
public function integer of_borderstyle ()
public function integer of_day ()
public function integer of_dayofweek ()
public function boolean of_enabled ()
public function oleobject of_font ()
public function ulong of_forecolor ()
public function datetime of_maxdate ()
public function integer of_maxselcount ()
public function datetime of_mindate ()
public function integer of_month ()
public function ulong of_monthbackcolor ()
public function integer of_monthcolumns ()
public function integer of_monthrows ()
public function oleobject of_mouseicon ()
public function integer of_mousepointer ()
public function boolean of_multiselect ()
public function integer of_oledropmode ()
public function integer of_scrollrate ()
public function datetime of_selend ()
public function datetime of_selstart ()
public function boolean of_showtoday ()
public function boolean of_showweeknumbers ()
public function integer of_startofweek ()
public function ulong of_titlebackcolor ()
public function ulong of_titleforecolor ()
public function ulong of_trailingforecolor ()
public function datetime of_value ()
public function integer of_week ()
public function integer of_year ()
public function integer of_appearance ()
public subroutine of_appearance (integer ai_appearance)
public subroutine of_backcolor (unsignedlong aul_backcolor)
public subroutine of_borderstyle (integer ai_borderstyle)
public subroutine of_day (integer ai_day)
public subroutine of_dayofweek (integer ai_dayofweek)
public subroutine of_enabled (boolean ab_enabled)
public subroutine of_font (oleobject aole_font)
public subroutine of_forecolor (unsignedlong aul_forecolor)
public function integer of_hwnd ()
public subroutine of_hwnd (integer ai_hwnd)
public subroutine of_maxdate (datetime adt_maxdate)
public subroutine of_maxselcount (integer ai_maxselcount)
public subroutine of_mindate (datetime adt_mindate)
public subroutine of_month (integer ai_month)
public subroutine of_monthbackcolor (unsignedlong aul_monthbackcolor)
public subroutine of_monthcolumns (integer ai_monthcolumns)
public subroutine of_monthrows (integer ai_monthrows)
public subroutine of_mouseicon (oleobject aole_mouseicon)
public subroutine of_mousepointer (integer ai_mousepointer)
public subroutine of_multiselect (boolean ab_multiselect)
public subroutine of_oledropmode (integer ai_oledropmode)
public subroutine of_scrollrate (integer ai_scrollrate)
public subroutine of_selend (datetime adt_selend)
public subroutine of_selstart (datetime adt_selstart)
public subroutine of_showtoday (boolean ab_showtoday)
public subroutine of_showweeknumbers (boolean ab_showweeknumbers)
public subroutine of_startofweek (integer ai_startofweek)
public subroutine of_trailingforecolor (unsignedlong aul_trailingforecolor)
public subroutine of_titlebackcolor (unsignedlong aul_titlebackcolor)
public subroutine of_value (datetime adt_value)
public subroutine of_titleforecolor (unsignedlong aul_titleforecolor)
public subroutine of_week (integer ai_week)
public subroutine of_year (integer ai_year)
public subroutine of_computecontrolsize (integer ai_rows, integer ai_columns, ref real ar_width, ref real ar_height)
public function boolean of_daybold (datetime adt_dateindex)
public subroutine of_daybold (datetime adt_dateindex, boolean ab_riid)
public function integer of_hittest (integer ai_x, integer ai_y, ref datetime adt_date)
public subroutine of_oledrag ()
public subroutine of_refresh ()
public function datetime of_visibledays (integer ai_sindex)
public subroutine of_visibledays (integer ai_sindex, datetime adt_sindex)
end prototypes

public function ulong of_backcolor ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_backcolor
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	ulong
//
//	Description:
//	Encapsula la propiedad backcolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.BackColor
end function

public function integer of_borderstyle ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_borderstyle
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad borderstyle del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.BorderStyle
end function

public function integer of_day ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_day
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad day del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Day
end function

public function integer of_dayofweek ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_dayofweek
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad dayofweek del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.DayOfWeek
end function

public function boolean of_enabled ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_enabled
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	boolean
//
//	Description:
//	Encapsula la propiedad enabled del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Enabled
end function

public function oleobject of_font ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_font
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	oleobject
//
//	Description:
//	Encapsula la propiedad font del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Font
end function

public function ulong of_forecolor ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_forecolor
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	ulong
//
//	Description:
//	Encapsula la propiedad forecolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.ForeColor
end function

public function datetime of_maxdate ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_maxdate
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	datetime
//
//	Description:
//	Encapsula la propiedad maxdate del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.MaxDate
end function

public function integer of_maxselcount ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_maxselcount
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad maxselcount del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.MaxSelCount
end function

public function datetime of_mindate ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_mindate
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	datetime
//
//	Description:
//	Encapsula la propiedad mindate del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.MinDate
end function

public function integer of_month ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_month
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad month del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Month
end function

public function ulong of_monthbackcolor ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_monthbackcolor
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	ulong
//
//	Description:
//	Encapsula la propiedad monthbackcolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.MonthBackColor
end function

public function integer of_monthcolumns ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_monthcolumns
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad monthcolumns del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.MonthColumns
end function

public function integer of_monthrows ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_monthrows
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad monthrows del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.MonthRows
end function

public function oleobject of_mouseicon ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_mouseicon
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	oleobject
//
//	Description:
//	Encapsula la propiedad mouseicon del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.MouseIcon
end function

public function integer of_mousepointer ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_mousepointer
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad mousepointer del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.MousePointer
end function

public function boolean of_multiselect ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_multiselect
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	boolean
//
//	Description:
//	Encapsula la propiedad multiselect del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.MultiSelect
end function

public function integer of_oledropmode ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_oledropmode
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad oledropmode del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.OLEDropMode
end function

public function integer of_scrollrate ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_scrollrate
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad scrollrate del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.ScrollRate
end function

public function datetime of_selend ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_selend
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	datetime
//
//	Description:
//	Encapsula la propiedad selend del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.SelEnd
end function

public function datetime of_selstart ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_selstart
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	datetime
//
//	Description:
//	Encapsula la propiedad selstart del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.SelStart
end function

public function boolean of_showtoday ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_showtoday
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	boolean
//
//	Description:
//	Encapsula la propiedad showtoday del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.ShowToday
end function

public function boolean of_showweeknumbers ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_showweeknumbers
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	boolean
//
//	Description:
//	Encapsula la propiedad showweeknumbers del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.ShowWeekNumbers
end function

public function integer of_startofweek ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_startofweek
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad startofweek del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.StartOfWeek
end function

public function ulong of_titlebackcolor ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_titlebackcolor
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	ulong
//
//	Description:
//	Encapsula la propiedad titlebackcolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.TitleBackColor
end function

public function ulong of_titleforecolor ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_titleforecolor
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	ulong
//
//	Description:
//	Encapsula la propiedad titleforecolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.TitleForeColor
end function

public function ulong of_trailingforecolor ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_trailingforecolor
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	ulong
//
//	Description:
//	Encapsula la propiedad trailingforecolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.TrailingForeColor
end function

public function datetime of_value ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_value
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	datetime
//
//	Description:
//	Encapsula la propiedad value del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Value
end function

public function integer of_week ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_week
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad week del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Week
end function

public function integer of_year ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_year
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad year del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Year
end function

public function integer of_appearance ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_appearance
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad appearance del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Appearance
end function

public subroutine of_appearance (integer ai_appearance);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_appearance
//
//	Access:  public
//
//	Arguments:
//	ai_appearance
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad appearance del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Appearance(ai_appearance)
end subroutine

public subroutine of_backcolor (unsignedlong aul_backcolor);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_backcolor
//
//	Access:  public
//
//	Arguments:
//	aul_backcolor
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad backcolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.BackColor(aul_backcolor)
end subroutine

public subroutine of_borderstyle (integer ai_borderstyle);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_borderstyle
//
//	Access:  public
//
//	Arguments:
//	ai_borderstyle
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad borderstyle del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.BorderStyle(ai_borderstyle)
end subroutine

public subroutine of_day (integer ai_day);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_day
//
//	Access:  public
//
//	Arguments:
//	ai_day
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad day del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Day(ai_day)
end subroutine

public subroutine of_dayofweek (integer ai_dayofweek);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_dayofweek
//
//	Access:  public
//
//	Arguments:
//	ai_dayofweek
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad dayofweek del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.DayOfWeek(ai_dayofweek)
end subroutine

public subroutine of_enabled (boolean ab_enabled);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_enabled
//
//	Access:  public
//
//	Arguments:
//	ab_enabled
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad enabled del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Enabled(ab_enabled)
end subroutine

public subroutine of_font (oleobject aole_font);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_font
//
//	Access:  public
//
//	Arguments:
//	aole_font
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad font del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Font(aole_font)
end subroutine

public subroutine of_forecolor (unsignedlong aul_forecolor);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_forecolor
//
//	Access:  public
//
//	Arguments:
//	aul_forecolor
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad forecolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.ForeColor(aul_forecolor)
end subroutine

public function integer of_hwnd ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_hwnd
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad hwnd del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.hWnd
end function

public subroutine of_hwnd (integer ai_hwnd);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_hwnd
//
//	Access:  public
//
//	Arguments:
//	ai_hwnd
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad hwnd del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.hWnd(ai_hwnd)
end subroutine

public subroutine of_maxdate (datetime adt_maxdate);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_maxdate
//
//	Access:  public
//
//	Arguments:
//	adt_maxdate
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad maxdate del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MaxDate(adt_maxdate)
end subroutine

public subroutine of_maxselcount (integer ai_maxselcount);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_maxselcount
//
//	Access:  public
//
//	Arguments:
//	ai_maxselcount
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad maxselcount del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MaxSelCount(ai_maxselcount)
end subroutine

public subroutine of_mindate (datetime adt_mindate);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_mindate
//
//	Access:  public
//
//	Arguments:
//	adt_mindate
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad mindate del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MinDate(adt_mindate)
end subroutine

public subroutine of_month (integer ai_month);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_month
//
//	Access:  public
//
//	Arguments:
//	ai_month
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad month del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Month(ai_month)
end subroutine

public subroutine of_monthbackcolor (unsignedlong aul_monthbackcolor);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_monthbackcolor
//
//	Access:  public
//
//	Arguments:
//	aul_monthbackcolor
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad monthbackcolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MonthBackColor(aul_monthbackcolor)
end subroutine

public subroutine of_monthcolumns (integer ai_monthcolumns);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_monthcolumns
//
//	Access:  public
//
//	Arguments:
//	ai_monthcolumns
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad monthcolumns del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MonthColumns(ai_monthcolumns)
end subroutine

public subroutine of_monthrows (integer ai_monthrows);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_monthrows
//
//	Access:  public
//
//	Arguments:
//	ai_monthrows
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad monthrows del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MonthRows(ai_monthrows)
end subroutine

public subroutine of_mouseicon (oleobject aole_mouseicon);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_mouseicon
//
//	Access:  public
//
//	Arguments:
//	aole_mouseicon
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad mouseicon del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MouseIcon(aole_mouseicon)
end subroutine

public subroutine of_mousepointer (integer ai_mousepointer);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_mousepointer
//
//	Access:  public
//
//	Arguments:
//	ai_mousepointer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad mousepointer del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MousePointer(ai_mousepointer)
end subroutine

public subroutine of_multiselect (boolean ab_multiselect);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_multiselect
//
//	Access:  public
//
//	Arguments:
//	ab_multiselect
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad multiselect del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MultiSelect(ab_multiselect)
end subroutine

public subroutine of_oledropmode (integer ai_oledropmode);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_oledropmode
//
//	Access:  public
//
//	Arguments:
//	ai_oledropmode
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad oledropmode del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.OLEDropMode(ai_oledropmode)
end subroutine

public subroutine of_scrollrate (integer ai_scrollrate);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_scrollrate
//
//	Access:  public
//
//	Arguments:
//	ai_scrollrate
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad scrollrate del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.ScrollRate(ai_scrollrate)
end subroutine

public subroutine of_selend (datetime adt_selend);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_selend
//
//	Access:  public
//
//	Arguments:
//	adt_selend
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad selend del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.SelEnd(adt_selend)
end subroutine

public subroutine of_selstart (datetime adt_selstart);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_selstart
//
//	Access:  public
//
//	Arguments:
//	adt_selstart
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad selstart del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.SelStart(adt_selstart)
end subroutine

public subroutine of_showtoday (boolean ab_showtoday);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_showtoday
//
//	Access:  public
//
//	Arguments:
//	ab_showtoday
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad showtoday del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.ShowToday(ab_showtoday)
end subroutine

public subroutine of_showweeknumbers (boolean ab_showweeknumbers);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_showweeknumbers
//
//	Access:  public
//
//	Arguments:
//	ab_showweeknumbers
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad showweeknumbers del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.ShowWeekNumbers(ab_showweeknumbers)
end subroutine

public subroutine of_startofweek (integer ai_startofweek);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_startofweek
//
//	Access:  public
//
//	Arguments:
//	ai_startofweek
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad startofweek del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History

//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.StartOfWeek(ai_startofweek)
end subroutine

public subroutine of_trailingforecolor (unsignedlong aul_trailingforecolor);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_trailingforecolor
//
//	Access:  public
//
//	Arguments:
//	aul_trailingforecolor
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad trailingforecolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.TrailingForeColor(aul_trailingforecolor)
end subroutine

public subroutine of_titlebackcolor (unsignedlong aul_titlebackcolor);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_titlebackcolor
//
//	Access:  public
//
//	Arguments:
//	aul_titlebackcolor
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad titlebackcolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.TitleBackColor(aul_titlebackcolor)
end subroutine

public subroutine of_value (datetime adt_value);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_value
//
//	Access:  public
//
//	Arguments:
//	adt_value
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad value del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Value(adt_value)
end subroutine

public subroutine of_titleforecolor (unsignedlong aul_titleforecolor);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_titleforecolor
//
//	Access:  public
//
//	Arguments:
//	aul_titleforecolor
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad titleforecolor del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.TitleForeColor(aul_titleforecolor)
end subroutine

public subroutine of_week (integer ai_week);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_week
//
//	Access:  public
//
//	Arguments:
//	ai_week
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad week del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Week(ai_week)
end subroutine

public subroutine of_year (integer ai_year);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_year
//
//	Access:  public
//
//	Arguments:
//	ai_year
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad year del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Year(ai_year)
end subroutine

public subroutine of_computecontrolsize (integer ai_rows, integer ai_columns, ref real ar_width, ref real ar_height);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_computecontrolsize
//
//	Access:  public
//
//	Arguments:
//	ai_rows
//	ai_columns
//	ar_width
//	ar_height
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad computecontrolsize del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.ComputeControlSize(ai_rows,ai_columns,ar_width,ar_height)
end subroutine

public function boolean of_daybold (datetime adt_dateindex);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_daybold
//
//	Access:  public
//
//	Arguments:
//	adt_dateindex
//
//	Returns:
//	boolean
//
//	Description:
//	Encapsula la propiedad daybold del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.DayBold(adt_dateIndex)
end function

public subroutine of_daybold (datetime adt_dateindex, boolean ab_riid);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_daybold
//
//	Access:  public
//
//	Arguments:
//	adt_dateindex
//	ab_riid
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad daybold del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.DayBold(adt_dateIndex,ab_riid)
end subroutine

public function integer of_hittest (integer ai_x, integer ai_y, ref datetime adt_date);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_hittest
//
//	Access:  public
//
//	Arguments:
//	ai_x
//	ai_y
//	adt_date
//
//	Returns:
//	integer
//
//	Description:
//	Encapsula la propiedad hittest del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.HitTest(ai_x,ai_y,adt_date)
end function

public subroutine of_oledrag ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_oledrag
//
//	Access:  public
//
//	Arguments:
//	
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad oledrag del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.OLEDrag()
end subroutine

public subroutine of_refresh ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_refresh
//
//	Access:  public
//
//	Arguments:
//	
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad refresh del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Refresh()
end subroutine

public function datetime of_visibledays (integer ai_sindex);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_visibledays
//
//	Access:  public
//
//	Arguments:
//	ai_sindex
//
//	Returns:
//	datetime
//
//	Description:
//	Encapsula la propiedad visibledays del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.VisibleDays(ai_sindex)
end function

public subroutine of_visibledays (integer ai_sindex, datetime adt_sindex);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_visibledays
//
//	Access:  public
//
//	Arguments:
//	ai_sindex
//	adt_sindex
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad visibledays del objeto ole (monthview)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.VisibleDays(ai_sIndex,adt_sIndex)
end subroutine

on uo_monthview.create
this.ole_1=create ole_1
this.Control[]={this.ole_1}
end on

on uo_monthview.destroy
destroy(this.ole_1)
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  uo_monthview
//
//	Description:
//	Objeto de usuario que encapsula al control monthview de Microsoft.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

end event

type ole_1 from olecustomcontrol within uo_monthview
event dateclick ( datetime dateclicked )
event datedblclick ( datetime datedblclicked )
event getdaybold ( datetime startdate,  integer count,  ref pointer state )
event selchange ( datetime startdate,  datetime enddate,  ref boolean cancel )
event click ( )
event dblclick ( )
event keydown ( integer keycode,  integer shift )
event keyup ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event olestartdrag ( ref oleobject data,  ref long allowedeffects )
event olegivefeedback ( ref long effect,  ref boolean defaultcursors )
event olesetdata ( ref oleobject data,  ref integer dataformat )
event olecompletedrag ( ref long effect )
event oledragover ( ref oleobject data,  ref long effect,  ref integer button,  ref integer shift,  ref real ocx_x,  ref real ocx_y,  ref integer state )
event oledragdrop ( ref oleobject data,  ref long effect,  ref integer button,  ref integer shift,  ref real ocx_x,  ref real ocx_y )
integer width = 791
integer height = 632
integer taborder = 10
boolean border = false
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "uo_monthview.udo"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Buo_monthview.bin 
2200000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000310d910001c4816100000003000001400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000480000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe0000000000000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004232e456a11d187c30000e38ba14d75f800000000310b471001c48161310d910001c4816100000000000000000000000000000001fffffffe0000000300000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff003500360041003100390038003000340038002d00430037002d003500310031003100640038002d00450042002d003300300030003000300038004600350037004400340031004100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001234432100000008000011e100001054c05fb11a000600000000001c0000088a000707d4001c00030000000000000000000c270f001f00050000000000000000000106d9000100010000000000000000000707d4001c00030035000b0055000a000707d4001c00030035000b0055000a0007000000000000abcdef01000500000012e130000000060000000000ffffff0012e1bcbdecde1f000500010012e1c80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000002000000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Buo_monthview.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
