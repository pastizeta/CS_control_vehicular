$PBExportHeader$n_cst_dwsrv_linkage.sru
$PBExportComments$Extension DataWindow Linkage service
forward
global type n_cst_dwsrv_linkage from pfc_n_cst_dwsrv_linkage
end type
end forward

global type n_cst_dwsrv_linkage from pfc_n_cst_dwsrv_linkage
end type
global n_cst_dwsrv_linkage n_cst_dwsrv_linkage

forward prototypes
public function integer of_retrieve1 (any arg_ret1)
public function integer of_retrieve3 (any arg_ret1, any arg_ret2, any arg_ret3)
public function integer of_retrieve4 (any arg_ret1, any arg_ret2, any arg_ret3, any arg_ret4)
public function integer of_retrieve2 (any arg_ret1, any arg_ret2)
public function integer of_retrieve5 (any arg_ret1, any arg_ret2, any arg_ret3, any arg_ret4, any arg_ret5)
end prototypes

public function integer of_retrieve1 (any arg_ret1);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Retrieve1
//
//	Access:    		Public
//
//	Arguments: 		arg_ret1
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Retrieves (using 'pfc_retrieve' event) the datawindows in the
//					  linked chain, starting with the requesting datawindow.
//
//	  *Note: Typically called from the root datawindow to affect all datawindows in
//	   		the chain, but may be started anywhere in the chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 When appropriate, notify the requestor that row focus has changed.
// 5.0.04 If applicable when using the scroll style, scroll to the appropriate row.
// 6.0 	Instead of notifying the requestor of the rowfocus just notify the service.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1
Boolean 	lb_rowpriortoretrieveisone

// Determine the current row prior to retrieval.
lb_rowpriortoretrieveisone = (idw_requestor.GetRow() = 1)

// Retrieve the requesting datawindow.
If idw_requestor.Event pfc_retrieve1 (arg_ret1) = -1 Then Return FAILURE

// If appropriate, notify the service of the row focus change.
If lb_rowpriortoretrieveisone and (idw_requestor.GetRow() = 1) Then
	this.Event pfc_RowFocusChanged(1)
End If

Choose Case ii_collinkuse
	Case FILTER
		// The retrieve should be filtered.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_FilterDetails(idw_master.GetRow())
			End If
		End If
	Case SCROLL
		// The retrive should be scrolled.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_ScrollDetails(idw_master.GetRow())
			End If
		End If
End Choose	

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i]) Then
 		If IsNull(idw_details[li_i].inv_Linkage) Or &
		 	Not IsValid ( idw_details[li_i].inv_Linkage) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_Retrieve1 (arg_ret1)
		// If error, then get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

public function integer of_retrieve3 (any arg_ret1, any arg_ret2, any arg_ret3);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Retrieve3
//
//	Access:    		Public
//
//	Arguments: 		arg_ret1, arg_ret2, arg_ret3
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Retrieves (using 'pfc_retrieve' event) the datawindows in the
//					  linked chain, starting with the requesting datawindow.
//
//	  *Note: Typically called from the root datawindow to affect all datawindows in
//	   		the chain, but may be started anywhere in the chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 When appropriate, notify the requestor that row focus has changed.
// 5.0.04 If applicable when using the scroll style, scroll to the appropriate row.
// 6.0 	Instead of notifying the requestor of the rowfocus just notify the service.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1
Boolean 	lb_rowpriortoretrieveisone

// Determine the current row prior to retrieval.
lb_rowpriortoretrieveisone = (idw_requestor.GetRow() = 1)

// Retrieve the requesting datawindow.
If idw_requestor.Event pfc_retrieve3 (arg_ret1, arg_ret2, arg_ret3) = -1 Then Return FAILURE

// If appropriate, notify the service of the row focus change.
If lb_rowpriortoretrieveisone and (idw_requestor.GetRow() = 1) Then
	this.Event pfc_RowFocusChanged(1)
End If

Choose Case ii_collinkuse
	Case FILTER
		// The retrieve should be filtered.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_FilterDetails(idw_master.GetRow())
			End If
		End If
	Case SCROLL
		// The retrive should be scrolled.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_ScrollDetails(idw_master.GetRow())
			End If
		End If
End Choose	

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i]) Then
 		If IsNull(idw_details[li_i].inv_Linkage) Or &
		 	Not IsValid ( idw_details[li_i].inv_Linkage) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_Retrieve3 (arg_ret1,arg_ret2,arg_ret3)
		// If error, then get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

public function integer of_retrieve4 (any arg_ret1, any arg_ret2, any arg_ret3, any arg_ret4);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Retrieve4
//
//	Access:    		Public
//
//	Arguments: 		arg_ret1, arg_ret2, arg_ret3, arg_ret4
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Retrieves (using 'pfc_retrieve' event) the datawindows in the
//					  linked chain, starting with the requesting datawindow.
//
//	  *Note: Typically called from the root datawindow to affect all datawindows in
//	   		the chain, but may be started anywhere in the chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 When appropriate, notify the requestor that row focus has changed.
// 5.0.04 If applicable when using the scroll style, scroll to the appropriate row.
// 6.0 	Instead of notifying the requestor of the rowfocus just notify the service.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1
Boolean 	lb_rowpriortoretrieveisone

// Determine the current row prior to retrieval.
lb_rowpriortoretrieveisone = (idw_requestor.GetRow() = 1)

// Retrieve the requesting datawindow.
If idw_requestor.Event pfc_retrieve4 (arg_ret1, arg_ret2, arg_ret3, arg_ret4) = -1 Then Return FAILURE

// If appropriate, notify the service of the row focus change.
If lb_rowpriortoretrieveisone and (idw_requestor.GetRow() = 1) Then
	this.Event pfc_RowFocusChanged(1)
End If

Choose Case ii_collinkuse
	Case FILTER
		// The retrieve should be filtered.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_FilterDetails(idw_master.GetRow())
			End If
		End If
	Case SCROLL
		// The retrive should be scrolled.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_ScrollDetails(idw_master.GetRow())
			End If
		End If
End Choose	

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i]) Then
 		If IsNull(idw_details[li_i].inv_Linkage) Or &
		 	Not IsValid ( idw_details[li_i].inv_Linkage) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_Retrieve4 (arg_ret1,arg_ret2,arg_ret3, arg_ret4)
		// If error, then get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

public function integer of_retrieve2 (any arg_ret1, any arg_ret2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Retrieve2
//
//	Access:    		Public
//
//	Arguments: 		arg_ret1, arg_ret2
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Retrieves (using 'pfc_retrieve' event) the datawindows in the
//					  linked chain, starting with the requesting datawindow.
//
//	  *Note: Typically called from the root datawindow to affect all datawindows in
//	   		the chain, but may be started anywhere in the chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 When appropriate, notify the requestor that row focus has changed.
// 5.0.04 If applicable when using the scroll style, scroll to the appropriate row.
// 6.0 	Instead of notifying the requestor of the rowfocus just notify the service.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1
Boolean 	lb_rowpriortoretrieveisone

// Determine the current row prior to retrieval.
lb_rowpriortoretrieveisone = (idw_requestor.GetRow() = 1)

// Retrieve the requesting datawindow.
If idw_requestor.Event pfc_retrieve2 (arg_ret1, arg_ret2) = -1 Then Return FAILURE

// If appropriate, notify the service of the row focus change.
If lb_rowpriortoretrieveisone and (idw_requestor.GetRow() = 1) Then
	this.Event pfc_RowFocusChanged(1)
End If

Choose Case ii_collinkuse
	Case FILTER
		// The retrieve should be filtered.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_FilterDetails(idw_master.GetRow())
			End If
		End If
	Case SCROLL
		// The retrive should be scrolled.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_ScrollDetails(idw_master.GetRow())
			End If
		End If
End Choose	

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i]) Then
 		If IsNull(idw_details[li_i].inv_Linkage) Or &
		 	Not IsValid ( idw_details[li_i].inv_Linkage) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_Retrieve2 (arg_ret1,arg_ret2)
		// If error, then get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

public function integer of_retrieve5 (any arg_ret1, any arg_ret2, any arg_ret3, any arg_ret4, any arg_ret5);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Retrieve5
//
//	Access:    		Public
//
//	Arguments: 		arg_ret1, arg_ret2, arg_ret3, arg_ret4,arg_ret5
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Retrieves (using 'pfc_retrieve' event) the datawindows in the
//					  linked chain, starting with the requesting datawindow.
//
//	  *Note: Typically called from the root datawindow to affect all datawindows in
//	   		the chain, but may be started anywhere in the chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 When appropriate, notify the requestor that row focus has changed.
// 5.0.04 If applicable when using the scroll style, scroll to the appropriate row.
// 6.0 	Instead of notifying the requestor of the rowfocus just notify the service.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1
Boolean 	lb_rowpriortoretrieveisone

// Determine the current row prior to retrieval.
lb_rowpriortoretrieveisone = (idw_requestor.GetRow() = 1)

// Retrieve the requesting datawindow.
If idw_requestor.Event pfc_retrieve5 (arg_ret1, arg_ret2, arg_ret3, arg_ret4,arg_ret5) = -1 Then Return FAILURE

// If appropriate, notify the service of the row focus change.
If lb_rowpriortoretrieveisone and (idw_requestor.GetRow() = 1) Then
	this.Event pfc_RowFocusChanged(1)
End If

Choose Case ii_collinkuse
	Case FILTER
		// The retrieve should be filtered.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_FilterDetails(idw_master.GetRow())
			End If
		End If
	Case SCROLL
		// The retrive should be scrolled.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_ScrollDetails(idw_master.GetRow())
			End If
		End If
End Choose	

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i]) Then
 		If IsNull(idw_details[li_i].inv_Linkage) Or &
		 	Not IsValid ( idw_details[li_i].inv_Linkage) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_Retrieve5 (arg_ret1,arg_ret2,arg_ret3, arg_ret4,arg_ret5)
		// If error, then get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

on n_cst_dwsrv_linkage.create
call super::create
end on

on n_cst_dwsrv_linkage.destroy
call super::destroy
end on

