$PBExportHeader$uo_datetimepicker.sru
$PBExportComments$Objeto de usuario para encapsular el control datetimepicker de Microsoft.
forward
global type uo_datetimepicker from userobject
end type
type ole_1 from olecustomcontrol within uo_datetimepicker
end type
end forward

global type uo_datetimepicker from userobject
integer width = 457
integer height = 88
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ole_1 ole_1
end type
global uo_datetimepicker uo_datetimepicker

type variables

end variables

forward prototypes
public function unsignedlong of_calendarforecolor ()
public function unsignedlong of_calendartitlebackcolor ()
public function unsignedlong of_calendartitleforecolor ()
public function unsignedlong of_calendartrailingforecolor ()
public function boolean of_checkbox ()
public function string of_customformat ()
public function integer of_format ()
public function datetime of_maxdate ()
public function datetime of_mindate ()
public function oleobject of_mouseicon ()
public function integer of_mousepointer ()
public function boolean of_updown ()
public function integer of_day ()
public function integer of_dayofweek ()
public function integer of_minute ()
public function integer of_month ()
public function integer of_second ()
public function integer of_year ()
public function unsignedlong of_calendarbackcolor ()
public function datetime of_value ()
public subroutine of_calendarbackcolor (unsignedlong aul_calendarbackcolor)
public subroutine of_calendarforecolor (unsignedlong aul_calendarforecolor)
public subroutine of_calendartitlebackcolor (unsignedlong aul_calendartitlebackcolor)
public subroutine of_calendartitleforecolor (unsignedlong aul_calendartitleforecolor)
public subroutine of_calendartrailingforecolor (unsignedlong aul_calendartrailingforecolor)
public subroutine of_checkbox (boolean ab_checkbox)
public subroutine of_customformat (string as_customformat)
public subroutine of_day (integer ai_day)
public subroutine of_dayofweek (integer ai_dayofweek)
public function boolean of_enabled ()
public subroutine of_enabled (boolean ab_enabled)
public function oleobject of_font ()
public subroutine of_font (oleobject aole_font)
public subroutine of_format (integer ai_format)
public function integer of_hour ()
public subroutine of_hour (integer ai_hour)
public function integer of_hwnd ()
public subroutine of_hwnd (integer ai_hwnd)
public subroutine of_maxdate (datetime adt_maxdate)
public subroutine of_mindate (datetime adt_mindate)
public subroutine of_minute (integer ai_minute)
public subroutine of_month (integer ai_month)
public subroutine of_mouseicon (oleobject aole_mouseicon)
public subroutine of_mousepointer (integer ai_mousepointer)
public function integer of_oledropmode ()
public subroutine of_Refresh ()
public subroutine of_oledrag ()
public subroutine of_oledropmode (integer ai_oledropmode)
public subroutine of_second (integer ai_second)
public subroutine of_updown (boolean ab_updown)
public subroutine of_value (datetime adt_value)
public subroutine of_year (integer ai_year)
end prototypes

public function unsignedlong of_calendarforecolor ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_calendarforecolor
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	unsignedlong
//
//	Description:
//	Encapsula la propiedad calendarforecolor del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.CalendarForeColor
end function

public function unsignedlong of_calendartitlebackcolor ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_calendartitlebackcolor
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	unsignedlong
//
//	Description:
//	Encapsula la propiedad calendartitlebackcolor del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.CalendarTitleBackColor
end function

public function unsignedlong of_calendartitleforecolor ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_calendartitleforecolor
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	unsignedlong
//
//	Description:
//	Encapsula la propiedad calendartitleforecolor del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.CalendarTitleForeColor
end function

public function unsignedlong of_calendartrailingforecolor ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_calendartrailingforecolor
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	unsignedlong
//
//	Description:
//	Encapsula la propiedad calendartrailingforecolor del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.CalendarTrailingForeColor
end function

public function boolean of_checkbox ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_checkbox
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
//	Encapsula la propiedad checkbox del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.CheckBox
end function

public function string of_customformat ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_customformat
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	string
//
//	Description:
//	Encapsula la propiedad customformat del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.CustomFormat
end function

public function integer of_format ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_format
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
//	Encapsula la propiedad format del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Format
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
//	Encapsula la propiedad maxdate del objeto ole (datetimepicker)
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
//	Encapsula la propiedad mindate del objeto ole (datetimepicker)
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
//	Encapsula la propiedad mouseicon del objeto ole (datetimepicker)
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
//	Encapsula la propiedad mousepointer del objeto ole (datetimepicker)
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

public function boolean of_updown ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_updown
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
//	Encapsula la propiedad updown del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.UpDown
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
//	Encapsula la propiedad day del objeto ole (datetimepicker)
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
//	Encapsula la propiedad dayofweek del objeto ole (datetimepicker)
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

public function integer of_minute ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_minute
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
//	Encapsula la propiedad minute del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Minute
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
//	Encapsula la propiedad month del objeto ole (datetimepicker)
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

public function integer of_second ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_second
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
//	Encapsula la propiedad second del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Second
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
//	Encapsula la propiedad year del objeto ole (datetimepicker)
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

public function unsignedlong of_calendarbackcolor ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_calendarbackcolor
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	unsignedlong
//
//	Description:
//	Encapsula la propiedad calendarbackcolor del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.CalendarBackColor
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
//	Encapsula la propiedad value del objeto ole (datetimepicker)
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

public subroutine of_calendarbackcolor (unsignedlong aul_calendarbackcolor);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_calendarbackcolor
//
//	Access:  public
//
//	Arguments:
//	unsignedlong
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad calendarbackcolor del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.CalendarBackColor(aul_CalendarBackColor)
end subroutine

public subroutine of_calendarforecolor (unsignedlong aul_calendarforecolor);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_calendarforecolor
//
//	Access:  public
//
//	Arguments:
//	unsignedlong
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad calendarforecolor del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.CalendarForeColor(aul_CalendarForeColor)
end subroutine

public subroutine of_calendartitlebackcolor (unsignedlong aul_calendartitlebackcolor);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_calendartitlebackcolor
//
//	Access:  public
//
//	Arguments:
//	unsignedlong
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad calendartitlebackcolor del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.CalendarTitleBackColor(aul_CalendarTitleBackColor)
end subroutine

public subroutine of_calendartitleforecolor (unsignedlong aul_calendartitleforecolor);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_calendartitleforecolor
//
//	Access:  public
//
//	Arguments:
//	unsignedlong
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad calendartitleforecolor del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.CalendarTitleForeColor(aul_CalendarTitleForeColor)
end subroutine

public subroutine of_calendartrailingforecolor (unsignedlong aul_calendartrailingforecolor);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_calendartrailingforecolor
//
//	Access:  public
//
//	Arguments:
//	unsignedlong
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad calendartrailingforecolor del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.CalendarTrailingForeColor(aul_CalendarTrailingForeColor)
end subroutine

public subroutine of_checkbox (boolean ab_checkbox);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_checkbox
//
//	Access:  public
//
//	Arguments:
//	boolean
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad checkbox del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.CheckBox(ab_CheckBox)
end subroutine

public subroutine of_customformat (string as_customformat);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_customformat
//
//	Access:  public
//
//	Arguments:
//	string
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad customformat del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.CustomFormat(as_CustomFormat)
end subroutine

public subroutine of_day (integer ai_day);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_day
//
//	Access:  public
//
//	Arguments:
//	integer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad day del objeto ole (datetimepicker)
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
//	integer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad dayofweek del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.DayOfWeek(ai_DayOfWeek)
end subroutine

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
//	Encapsula la propiedad enabled del objeto ole (datetimepicker)
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

public subroutine of_enabled (boolean ab_enabled);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_enabled
//
//	Access:  public
//
//	Arguments:
//	boolean ab_enabled
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad enabled del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Enabled(ab_Enabled)
end subroutine

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
//	Encapsula la propiedad font del objeto ole (datetimepicker)
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

public subroutine of_font (oleobject aole_font);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_font
//
//	Access:  public
//
//	Arguments:
//	oleobject
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad font del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Font(aole_Font)
end subroutine

public subroutine of_format (integer ai_format);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_format
//
//	Access:  public
//
//	Arguments:
//	integer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad format del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Format(ai_Format)
end subroutine

public function integer of_hour ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_hour
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
//	Encapsula la propiedad hour del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

return this.ole_1.object.Hour
end function

public subroutine of_hour (integer ai_hour);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_hour
//
//	Access:  public
//
//	Arguments:
//	integer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad hour del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Hour(ai_Hour)
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
//	Encapsula la propiedad hwnd del objeto ole (datetimepicker)
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
//	integer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad hwnd del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.hWnd(ai_hWnd)
end subroutine

public subroutine of_maxdate (datetime adt_maxdate);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_maxdate
//
//	Access:  public
//
//	Arguments:
//	datetime
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad maxdate del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MaxDate(adt_MaxDate)
end subroutine

public subroutine of_mindate (datetime adt_mindate);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_mindate
//
//	Access:  public
//
//	Arguments:
//	datetime
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad mindate del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MinDate(adt_MinDate)
end subroutine

public subroutine of_minute (integer ai_minute);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_minute
//
//	Access:  public
//
//	Arguments:
//	integer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad minute del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Minute(ai_Minute)
end subroutine

public subroutine of_month (integer ai_month);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_month
//
//	Access:  public
//
//	Arguments:
//	integer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad month del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Month(ai_Month)
end subroutine

public subroutine of_mouseicon (oleobject aole_mouseicon);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_mouseicon
//
//	Access:  public
//
//	Arguments:
//	oleobject
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad mouseicon del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MouseIcon(aole_MouseIcon)
end subroutine

public subroutine of_mousepointer (integer ai_mousepointer);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_mousepointer
//
//	Access:  public
//
//	Arguments:
//	integer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad mousepointer del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.MousePointer(ai_MousePointer)
end subroutine

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
//	Encapsula la propiedad oledropmode del objeto ole (datetimepicker)
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

public subroutine of_Refresh ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Refresh
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad Refresh del objeto ole (datetimepicker)
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

public subroutine of_oledrag ();
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_oledrag
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad oledrag del objeto ole (datetimepicker)
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

public subroutine of_oledropmode (integer ai_oledropmode);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_oledropmode
//
//	Access:  public
//
//	Arguments:
//	integer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad oledropmode del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.OLEDropMode(ai_OLEDropMode)
end subroutine

public subroutine of_second (integer ai_second);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_second
//
//	Access:  public
//
//	Arguments:
//	integer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad second del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Second(ai_Second)
end subroutine

public subroutine of_updown (boolean ab_updown);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_updown
//
//	Access:  public
//
//	Arguments:
//	boolean
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad updown del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.UpDown(ab_UpDown)
end subroutine

public subroutine of_value (datetime adt_value);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_value
//
//	Access:  public
//
//	Arguments:
//	datetime
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad value del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Value(adt_Value)
end subroutine

public subroutine of_year (integer ai_year);
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_year
//
//	Access:  public
//
//	Arguments:
//	integer
//
//	Returns:
//	none
//
//	Description:
//	Encapsula la propiedad year del objeto ole (datetimepicker)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////

this.ole_1.object.Year(ai_Year)
end subroutine

on uo_datetimepicker.create
this.ole_1=create ole_1
this.Control[]={this.ole_1}
end on

on uo_datetimepicker.destroy
destroy(this.ole_1)
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  uo_datetimepicker
//
//	Description:
//	Objeto de usuario que encapsula al control datetimepicker de Microsoft.
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

type ole_1 from olecustomcontrol within uo_datetimepicker
event callbackkeydown ( integer keycode,  integer shift,  string callbackfield,  ref datetime callbackdate )
event change ( )
event closeup ( )
event dropdown ( )
event format ( string callbackfield,  ref string formattedstring )
event formatsize ( string callbackfield,  ref integer size )
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
integer width = 457
integer height = 88
integer taborder = 10
boolean border = false
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "uo_datetimepicker.udo"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
05uo_datetimepicker.bin 
2A00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000090ff10c001c483b900000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000480000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe0000000000000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000420dd1b9e11d187c40000e38ba14d75f80000000090fcc6d001c483b990ff10c001c483b900000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
26ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff003500360041003100390038003000340038002d00430037002d003500310031003100640038002d00450042002d00330030003000300030003800460035003700440034003100410000000600000001000000000000000600000001000000000000000500000001000000000000000500000001000000000000000700000001123443210000000800000a56000002460e7f28410006000000000020000607d4001200050000000000000000000c270f001f00050000000000000000000106410001000100000000000000000000000800000000abcdef010005000077aedf0400440006ffffffffffffffff018b000000000000bdecde1f000500010012e1c800000001000000000000000600000001000000000000000500000001000000000000000600000001000000000000000700000001ffffffff0000000b00000000000000000000000600000001000000000000000700000001000000000000000600000001000000000000000200000001000000000000000300000000000000000000000200000001000000000000000500000000000000000000000600000000000000000000000200000002000000000000000500000001000000000000000500000001000000000000000500000001000000000000000500000001000000000000000500000001000000000000000400000000000000000000000500000001006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
15uo_datetimepicker.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
