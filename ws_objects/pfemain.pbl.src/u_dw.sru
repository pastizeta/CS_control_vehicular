$PBExportHeader$u_dw.sru
$PBExportComments$Extension DataWindow class
forward
global type u_dw from pfc_u_dw
end type
end forward

global type u_dw from pfc_u_dw
event type long pfc_retrieve1 ( any arg_ret1 )
event type long pfc_retrieve2 ( any arg_ret1,  any arg_ret2 )
event type long pfc_retrieve3 ( any arg_ret1,  any arg_ret2,  any arg_ret3 )
event type long pfc_retrieve4 ( any arg_ret1,  any arg_ret2,  any arg_ret3,  any arg_ret4 )
event type long pfc_firstrow ( )
event type long pfc_lastrow ( )
event type long pfcnextrow ( )
event type long pfc_nextrow ( )
event type long pfc_previousrow ( )
event type long pfc_retrieve5 ( any arg_ret1,  any arg_ret2,  any arg_ret3,  any arg_ret4,  any arg_ret5 )
end type
global u_dw u_dw

forward prototypes
public function integer of_Retrieve2 (any arg_ret1, any arg_ret2)
public function integer of_retrieve3 (any arg_ret1, any arg_ret2, any arg_ret3)
public function integer of_retrieve4 (any arg_ret1, any arg_ret2, any arg_ret3, any arg_ret4)
public function long of_retrieve1 (any arg_ret1)
public function long of_retrieve5 (any arg_ret1, any arg_ret2, any arg_ret3, any arg_ret4, any arg_ret5)
end prototypes

event pfc_retrieve1;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_retrieve1
//	Arguments:		arg_ret1
//	Returns:			long - The return code from the Retrieve Powerscript function
//	Description:	Specific retrieve logic should be coded in descendant scripts
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
//	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
return 0
end event

event pfc_retrieve2;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_retrieve2
//	Arguments:		arg_ret1,arg_ret2
//	Returns:			long - The return code from the Retrieve Powerscript function
//	Description:	Specific retrieve logic should be coded in descendant scripts
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
//	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
return 0
end event

event pfc_retrieve3;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_retrieve3
//	Arguments:		None
//	Returns:			long - The return code from the Retrieve Powerscript function
//	Description:	Specific retrieve logic should be coded in descendant scripts
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
//	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
return 0
end event

event pfc_retrieve4;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_retrieve4
//	Arguments:		arg_ret1,arg_ret2,arg_ret3,arg_ret4
//	Returns:			long - The return code from the Retrieve Powerscript function
//	Description:	Specific retrieve logic should be coded in descendant scripts
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
//	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
return 0
end event

event pfc_firstrow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_firstrow
//	Arguments:		None
//	Returns:			Long - 1 if it succeeds and -1 if an error occurs
//	Description:	Scrolls to the first row of the DW
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						7.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
return this.ScrolltoRow(1)
end event

event pfc_lastrow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_lastrow
//	Arguments:		None
//	Returns:			Long - 1 if it succeeds and -1 if an error occurs
//	Description:	Scrolls to the last row of the DW
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						7.0   Initial version
//////////////////////////////////////////////////////////////////////////////
return this.ScrolltoRow(this.RowCount())
end event

event pfcnextrow;
IF this.Getrow()< this.RowCount() THEN
	return this.ScrolltoRow(this.GetRow()+1)
END IF
end event

event pfc_nextrow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_nextrow
//	Arguments:		None
//	Returns:			Long - 1 if it succeeds and -1 if an error occurs
//	Description:	Scrolls to the first row of the DW
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						7.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
IF this.Getrow()< this.RowCount() THEN
	return this.ScrolltoRow(this.GetRow()+1)
else
	return 1
END IF
end event

event pfc_previousrow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_previousrow
//	Arguments:		None
//	Returns:			Long - 1 if it succeeds and -1 if an error occurs
//	Description:	Scrolls to the last row of the DW
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						7.0   Initial version
//////////////////////////////////////////////////////////////////////////////
IF this.Getrow()>1 THEN 
 return	this.ScrollToRow(this.GetRow()-1)
else
	return 1
END IF
end event

event pfc_retrieve5;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_retrieve4
//	Arguments:		arg_ret1, arg_ret2, arg_ret3, arg_ret4, arg_ret5
//	Returns:			long - The return code from the Retrieve Powerscript function
//	Description:	Specific retrieve logic should be coded in descendant scripts
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
//	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
return 0
end event

public function integer of_Retrieve2 (any arg_ret1, any arg_ret2);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Retrieve2
//	Arguments:		arg_ret1, arg_ret2
//	Returns:			Long - The return code from the Retrieve Powerscript function
//	 					0 = No rows returned from successful retrieve
//						-1 = Retrieve was unsuccessful
//						>1 = Success.
//	Description:	Execute the specific Retrieve logic.
// 					Note:	Specific retrieve logic should be coded in descendant pfc_Retrieve event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						6.0   Initial version
// 					6.0.01 Corrected type of return variable from integer to long.
//////////////////////////////////////////////////////////////////////////////
//	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
long	ll_rc

if IsValid(inv_Linkage) then
	ll_rc = inv_Linkage.of_Retrieve2(arg_ret1, arg_ret2)
else
	ll_rc = this.Event pfc_Retrieve2(arg_ret1, arg_ret2)
end if

return ll_rc
end function

public function integer of_retrieve3 (any arg_ret1, any arg_ret2, any arg_ret3);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Retrieve3
//	Arguments:		arg_ret1, arg_ret2, arg_ret3
//	Returns:			Long - The return code from the Retrieve Powerscript function
//	 					0 = No rows returned from successful retrieve
//						-1 = Retrieve was unsuccessful
//						>1 = Success.
//	Description:	Execute the specific Retrieve logic.
// 					Note:	Specific retrieve logic should be coded in descendant pfc_Retrieve event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						6.0   Initial version
// 					6.0.01 Corrected type of return variable from integer to long.
//////////////////////////////////////////////////////////////////////////////
//	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
long	ll_rc

if IsValid(inv_Linkage) then
	ll_rc = inv_Linkage.of_Retrieve3(arg_ret1, arg_ret2, arg_ret3)
else
	ll_rc = this.Event pfc_Retrieve3(arg_ret1, arg_ret2, arg_ret3)
end if

return ll_rc
end function

public function integer of_retrieve4 (any arg_ret1, any arg_ret2, any arg_ret3, any arg_ret4);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Retrieve4
//	Arguments:		arg_ret1, arg_ret2, arg_ret3, arg_ret4
//	Returns:			Long - The return code from the Retrieve Powerscript function
//	 					0 = No rows returned from successful retrieve
//						-1 = Retrieve was unsuccessful
//						>1 = Success.
//	Description:	Execute the specific Retrieve logic.
// 					Note:	Specific retrieve logic should be coded in descendant pfc_Retrieve event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						6.0   Initial version
// 					6.0.01 Corrected type of return variable from integer to long.
//////////////////////////////////////////////////////////////////////////////
//	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
long	ll_rc

if IsValid(inv_Linkage) then
	ll_rc = inv_Linkage.of_Retrieve4(arg_ret1, arg_ret2, arg_ret3, arg_ret4)
else
	ll_rc = this.Event pfc_Retrieve4(arg_ret1, arg_ret2, arg_ret3, arg_ret4)
end if

return ll_rc
end function

public function long of_retrieve1 (any arg_ret1);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Retrieve1
//	Arguments:		arg_ret1
//	Returns:			Long - The return code from the Retrieve Powerscript function
//	 					0 = No rows returned from successful retrieve
//						-1 = Retrieve was unsuccessful
//						>1 = Success.
//	Description:	Execute the specific Retrieve logic.
// 					Note:	Specific retrieve logic should be coded in descendant pfc_Retrieve event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						6.0   Initial version
// 					6.0.01 Corrected type of return variable from integer to long.
//////////////////////////////////////////////////////////////////////////////
//	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
long	ll_rc

if IsValid(inv_Linkage) then
	ll_rc = inv_Linkage.of_Retrieve1(arg_ret1)
else
	ll_rc = this.Event pfc_Retrieve1(arg_ret1)
end if

return ll_rc
end function

public function long of_retrieve5 (any arg_ret1, any arg_ret2, any arg_ret3, any arg_ret4, any arg_ret5);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Retrieve5
//	Arguments:		arg_ret1, arg_ret2, arg_ret3, arg_ret4
//	Returns:			Long - The return code from the Retrieve Powerscript function
//	 					0 = No rows returned from successful retrieve
//						-1 = Retrieve was unsuccessful
//						>1 = Success.
//	Description:	Execute the specific Retrieve logic.
// 					Note:	Specific retrieve logic should be coded in descendant pfc_Retrieve event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						6.0   Initial version
// 					6.0.01 Corrected type of return variable from integer to long.
//////////////////////////////////////////////////////////////////////////////
//	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
long	ll_rc

if IsValid(inv_Linkage) then
	ll_rc = inv_Linkage.of_Retrieve5(arg_ret1, arg_ret2, arg_ret3, arg_ret4,arg_ret5)
else
	ll_rc = this.Event pfc_Retrieve5(arg_ret1, arg_ret2, arg_ret3, arg_ret4,arg_ret5)
end if

return ll_rc
end function

on u_dw.create
end on

on u_dw.destroy
end on

