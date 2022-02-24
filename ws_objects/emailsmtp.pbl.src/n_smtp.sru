$PBExportHeader$n_smtp.sru
$PBExportComments$SMTP Email Object
forward
global type n_smtp from n_winsock
end type
type uuid from structure within n_smtp
end type
type systemtime from structure within n_smtp
end type
type time_zone_information from structure within n_smtp
end type
type attachment from structure within n_smtp
end type
type address from structure within n_smtp
end type
end forward

type uuid from structure
	unsignedlong		data1
	integer		data2
	integer		data3
	blob		data4
end type

type systemtime from structure
	integer		wyear
	integer		wmonth
	integer		wdayofweek
	integer		wday
	integer		whour
	integer		wminute
	integer		wsecond
	integer		wmilliseconds
end type

type time_zone_information from structure
	long		bias
	character		standardname[32]
	systemtime		standarddate
	long		standardbias
	character		daylightname[32]
	systemtime		daylightdate
	long		daylightbias
end type

type attachment from structure
	string		filename
	blob		filedata
	boolean		inline
end type

type address from structure
	string		email
	string		name
end type

global type n_smtp from n_winsock
end type

type prototypes
// Windows API Functions

Subroutine DebugMsg( &
	String lpOutputString &
	) Library "kernel32.dll" Alias For "OutputDebugStringW"

Function boolean QueryPerformanceFrequency ( &
	Ref Double lpFrequency &
	) Library "kernel32.dll"

Function boolean QueryPerformanceCounter ( &
	Ref Double lpPerformanceCount &
	) Library "kernel32.dll"

Function long CreateFile ( &
	string lpFileName, &
	ulong dwDesiredAccess, &
	ulong dwShareMode, &
	ulong lpSecurityAttributes, &
	ulong dwCreationDisposition, &
	ulong dwFlagsAndAttributes, &
	ulong hTemplateFile &
	) Library "kernel32.dll" Alias For "CreateFileW"

Function boolean CloseHandle ( &
	long hObject &
	) Library "kernel32.dll"

Function boolean ReadFile ( &
	long hFile, &
	Ref blob lpBuffer, &
	ulong nNumberOfBytesToRead, &
	Ref ulong lpNumberOfBytesRead, &
	ulong lpOverlapped &
	) Library "kernel32.dll"

Function long UuidCreate ( &
	Ref UUID pId &
	) Library "rpcrt4.dll"

Function long UuidToString ( &
	Ref UUID Uuid, &
	Ref ulong StringUuid &
	) Library "rpcrt4.dll" Alias For "UuidToStringW"

Function long RpcStringFree ( &
	Ref ulong pString &
	) Library "rpcrt4.dll" Alias For "RpcStringFreeW"

Subroutine CopyMemory ( &
	Ref string Destination, &
	ulong Source, &
	long Length &
	) Library  "kernel32.dll" Alias For "RtlMoveMemory"

Function ulong FindMimeFromData ( &
	ulong pBC, &
	string pwzUrl, &
	blob pBuffer, &
	ulong cbSize, &
	ulong pwzMimeProposed, &
	ulong dwMimeFlags, &
	ref ulong ppwzMimeOut, &
	ulong dwReserved &
	) Library "urlmon.dll"

Function Long GetTimeZoneInformation ( &
	Ref TIME_ZONE_INFORMATION lpTimeZoneInformation &
	) Library "kernel32.dll"

Subroutine SleepMS ( &
	ulong dwMilliseconds &
	) Library "kernel32.dll" Alias For "Sleep"

// Cryptlib Functions
Function long cryptInit ( &
	) Library "cl32.dll"

Function long cryptEnd ( &
	) Library "cl32.dll"

Function long cryptCreateSession ( &
	Ref long pSession, &
	long cryptUser, &
	long SessionType &
	) Library "cl32.dll"

Function long cryptDestroySession ( &
	long session &
	) Library "cl32.dll"

Function long cryptSetAttributeString ( &
	long hCrypt, &
	long CryptAttType, &
	Ref string pBuff, &
	long StrLen &
	) Library "cl32.dll" Alias For "cryptSetAttributeString;Ansi"

Function long cryptSetAttribute ( &
	long hCrypt, &
	long CryptAttType, &
	long value &
	) Library "cl32.dll"

Function long cryptPopData ( &
	long envelope, &
	Ref string pBuff, &
	long StrLen, &
	Ref long pBytesCopied &
	) Library "cl32.dll" Alias For "cryptPopData;Ansi"

Function long cryptPushData ( &
	long envelope, &
	Ref string pBuff, &
	long StrLen, &
	Ref long pBytesCopied &
	) Library "cl32.dll" Alias For "cryptPushData;Ansi"

Function long cryptFlushData ( &
	long envelope &
	) Library "cl32.dll"

Function long cryptGetAttributeString ( &
	long hCrypt, &
	long CryptAttType, &
	Ref string pBuff, &
	Ref integer StrLen &
	) Library "cl32.dll" Alias For "cryptGetAttributeString;Ansi"
 
end prototypes

type variables
Private:

Constant	String CRLF = Char(13) + Char(10)

// Cryptlib constants
Constant Long CRYPT_OK                      =  0
Constant Long CRYPT_UNUSED                  = -101
Constant Long CRYPT_SESSION_SSL             = 3
Constant Long CRYPT_SESSINFO_ACTIVE         = 6001
Constant Long CRYPT_SESSINFO_SERVER_NAME    = 6008
Constant Long CRYPT_SESSINFO_SERVER_PORT    = 6009
Constant Long CRYPT_SESSINFO_NETWORKSOCKET  = 6014

Constant	Long CRYPT_OPTION_CERT_COMPLIANCELEVEL = 118
Constant	Long CRYPT_OPTION_NET_READTIMEOUT = 138
Constant	Long CRYPT_COMPLIANCELEVEL_PKIX_FULL = 4
Constant	Long CRYPT_COMPLIANCELEVEL_PKIX_PARTIAL = 3
Constant	Long CRYPT_COMPLIANCELEVEL_STANDARD = 2
Constant	Long CRYPT_COMPLIANCELEVEL_REDUCED = 1
Constant	Long CRYPT_COMPLIANCELEVEL_OBLIVIOUS = 0

ULong iul_socket
Long il_Session
Double idbl_frequency

UInt iui_port				= 25
Integer ii_priority		= 0
Integer ii_Timeout		= 60
Boolean ib_html			= False
Boolean ib_receipt		= False
Boolean ib_authenticate	= False
Boolean ib_eventlog 		= False
Boolean ib_jaguarlog		= False
Boolean ib_messagebox	= False
Boolean ib_logfile		= False
Boolean ib_debugviewer	= False
String is_userid
String is_passwd
String is_server
String is_subject
String is_body
String is_customhdr[]
String is_replyto[]
String is_logfile
Address istr_From
Address istr_Address[]
Address istr_CC[]
Address istr_Bcc[]
Attachment istr_Attach[]

end variables

forward prototypes
public subroutine of_setserver (string as_server)
public subroutine of_setsubject (string as_subject)
public subroutine of_setfrom (string as_email, string as_name)
public function integer of_addcc (string as_email)
public function integer of_addaddress (string as_email)
public function boolean of_sendmail ()
public subroutine of_reset ()
public subroutine of_setlogin (string as_userid, string as_passwd)
public subroutine of_setbody (string as_body, boolean ab_html)
public subroutine of_setreceipt (boolean ab_receipt)
public subroutine of_setfrom (string as_email)
public function integer of_addaddress (string as_email, string as_name)
public function integer of_addcc (string as_email, string as_name)
public function integer of_addbcc (string as_email)
public function integer of_addbcc (string as_email, string as_name)
private function string of_generate_guid ()
private function string of_findmimefromdata (string as_filename, ref blob ablob_filedata)
public subroutine of_logerror (integer ai_msglevel, string as_msgtext)
public subroutine of_setlogerror (boolean ab_eventlog, boolean ab_jaguarlog, boolean ab_messagebox)
private function string of_timezoneoffset ()
private function boolean of_readfile (string as_filename, ref blob ablob_data)
public function integer of_addattachment (string as_filename, blob ablob_filedata, boolean ab_inline)
public function integer of_addattachment (string as_filename, boolean ab_inline)
public function integer of_addattachment (string as_filename, blob ablob_filedata)
public function integer of_addattachment (string as_filename)
public subroutine of_setpriority (string as_priority)
public subroutine of_resetall ()
public function integer of_addreplyto (string as_email)
public function integer of_addcustomheader (string as_header)
private subroutine of_logfile (string as_logmsg)
public subroutine of_setport (unsignedinteger aui_port)
public function boolean of_sendmail_logoff ()
public function boolean of_sendmail_logon ()
public function boolean of_sendmail_send ()
private function string of_stringfromptr (unsignedlong aul_ptr)
private function string of_dataheader ()
private function string of_databody ()
public function string of_data ()
public function string of_crypterror (long al_retval)
public function boolean of_sendsecmail_send ()
public function boolean of_sendsecmail_logoff ()
public function integer of_addto (string as_email)
public function integer of_addto (string as_email, string as_name)
public function integer of_addfile (string as_filename)
private function string of_hex (unsignedlong aul_decimal)
private function string of_utf8string (string as_string)
private subroutine of_utf8body (ref string as_string, ref string as_encoding, ref string as_charset)
public subroutine of_setlogfile (boolean ab_flag, string as_logfile)
public function boolean of_sendtlsmail_logon ()
public function boolean of_sendsslmail_logon ()
public function boolean of_sendtlsmail ()
public function boolean of_sendsslmail ()
public function boolean of_validemail (string as_email, ref string as_errormsg)
public subroutine of_settimeout (integer ai_timeout)
public function double of_performance_start ()
public function decimal of_performance_stop (double adbl_start)
private function boolean of_sendmsg_crypt (readonly string as_cmd, integer ai_okreturn, ref string as_reply)
private function boolean of_sendmsg (readonly string as_cmd, integer ai_okreturn, ref string as_reply)
public subroutine of_setdebugviewer (boolean ab_flag)
end prototypes

public subroutine of_setserver (string as_server);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetServer
//
// PURPOSE:    This function is used to set the server name
//
// ARGUMENTS:  as_server - Server name
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

is_server = as_server

end subroutine

public subroutine of_setsubject (string as_subject);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetSubject
//
// PURPOSE:    This function is used to set the message subject.
//
// ARGUMENTS:  as_subject - Subject
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

is_subject = as_subject

end subroutine

public subroutine of_setfrom (string as_email, string as_name);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetFrom
//
// PURPOSE:    This function is used to set the sender's email address and name.
//
// ARGUMENTS:  as_email - Sender's Email address
//					as_name	- Sender's Name
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

istr_From.Email = as_email
istr_From.Name  = as_name

end subroutine

public function integer of_addcc (string as_email);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddCC
//
// PURPOSE:    This function is used to add a CC email address.
//
// ARGUMENTS:  as_email - Email address
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Return of_AddCC(as_email, "")

end function

public function integer of_addaddress (string as_email);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddAddress
//
// PURPOSE:    This function is used to add a primary send to email address.
//
// ARGUMENTS:  as_email - Email address
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Return of_AddAddress(as_email, "")

end function

public function boolean of_sendmail ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SendMail
//
// PURPOSE:    This function is the main process to send the email.
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// 02/13/2012	RolandS		Moved logging here
// -----------------------------------------------------------------------------

DateTime ldt_current

// log start of SMTP conversation
ldt_current = DateTime(Today(), Now())
of_LogFile("of_SendMail Start: " + String(ldt_current)+CRLF)

// start the server session
If Not of_sendmail_logon() Then
	Return False
End If

// send the email message
If Not of_sendmail_send() Then
	Return False
End If

// stop the server session
If Not of_sendmail_logoff() Then
	Return False
End If

// log end of SMTP conversation
ldt_current = DateTime(Today(), Now())
of_LogFile(CRLF+"of_SendMail End: " + String(ldt_current)+CRLF)

Return True

end function

public subroutine of_reset ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_Reset
//
// PURPOSE:    This function is used to reset all the recipient and
//					attachment arrays.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Address lstr_EmptyAddress[]
Attachment lstr_EmptyAttachment[]

istr_Address	= lstr_EmptyAddress
istr_CC			= lstr_EmptyAddress
istr_Bcc			= lstr_EmptyAddress
istr_Attach		= lstr_EmptyAttachment

end subroutine

public subroutine of_setlogin (string as_userid, string as_passwd);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetLogin
//
// PURPOSE:    This function is used to set the userid and password when the
//					SMTP server requires authentication.
//
// ARGUMENTS:  as_userid - Server userid
//					as_passwd - Server password
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

is_userid = as_userid
is_passwd = as_passwd
ib_authenticate = True

end subroutine

public subroutine of_setbody (string as_body, boolean ab_html);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetBody
//
// PURPOSE:    This function is used to set the contents of the message body.
//
// ARGUMENTS:  as_cmd  - SMTP command to be sent
//					ab_html - The text contains HTML
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

is_body = as_body
ib_html = ab_html

end subroutine

public subroutine of_setreceipt (boolean ab_receipt);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetReceipt
//
// PURPOSE:    This function is used to set whether return receipt is requested.
//
// ARGUMENTS:  ab_receipt - True/False
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

ib_receipt = ab_receipt

end subroutine

public subroutine of_setfrom (string as_email);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetFrom
//
// PURPOSE:    This function is used to set the sender's
//					email address.
//
// ARGUMENTS:  as_email - Sender's Email address
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

of_SetFrom(as_email, "")

end subroutine

public function integer of_addaddress (string as_email, string as_name);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddAddress
//
// PURPOSE:    This function is used to add a primary send to
//					email address and name.
//
// ARGUMENTS:  as_email - Email address
//					as_name	- Recipient name
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Integer li_next

li_next = UpperBound(istr_Address) + 1
istr_Address[li_next].Email = as_email
istr_Address[li_next].Name  = as_name

Return li_next

end function

public function integer of_addcc (string as_email, string as_name);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddCC
//
// PURPOSE:    This function is used to add a CC email address and name.
//
// ARGUMENTS:  as_email - Email address
//					as_name	- Recipient name
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Integer li_next

li_next = UpperBound(istr_CC) + 1
istr_CC[li_next].Email = as_email
istr_CC[li_next].Name  = as_name

Return li_next

end function

public function integer of_addbcc (string as_email);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddBcc
//
// PURPOSE:    This function is used to add a Blind CC email address.
//
// ARGUMENTS:  as_email - Email address
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Return of_AddBcc(as_email, "")

end function

public function integer of_addbcc (string as_email, string as_name);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddBcc
//
// PURPOSE:    This function is used to add a Blind CC email address and name.
//
// ARGUMENTS:  as_email - Email address
//					as_name	- Recipient name
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Integer li_next

li_next = UpperBound(istr_Bcc) + 1
istr_Bcc[li_next].Email = as_email
istr_Bcc[li_next].Name  = as_name

Return li_next

end function

private function string of_generate_guid ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_Generate_GUID
//
// PURPOSE:    This function is used to generate a GUID.
//
// RETURN:     GUID string
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

UUID lstr_UUID
Constant Long RPC_S_OK = 0
Constant Long SZ_UUID_LEN = 36
ULong lul_ptrUuid
String ls_Uuid

lstr_UUID.Data4 = Blob(Space(8), EncodingAnsi!)
If UuidCreate(lstr_UUID) = RPC_S_OK Then
	If UuidToString(lstr_UUID, lul_ptrUuid) = RPC_S_OK Then
		ls_Uuid = Space(SZ_UUID_LEN)
		CopyMemory(ls_Uuid, lul_ptrUuid, SZ_UUID_LEN*2)
		RpcStringFree(lul_ptrUuid)
		ls_Uuid = Upper(ls_Uuid)
	End If
End If

Return ls_Uuid

end function

private function string of_findmimefromdata (string as_filename, ref blob ablob_filedata);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_FindMimeFromData
//
// PURPOSE:    This function is determines the file MIME type.
//
// ARGUMENTS:  as_filename - Filename
//					ablob_data	- By ref blob of the file contents
//
// RETURN:     MIME Type
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Constant ulong E_INVALIDARG	= 2147942487	// &h80070057
Constant ulong E_OUTOFMEMORY	= 2147942414	// &h8007000E
Constant ulong NOERROR			= 0
String ls_mimetype, ls_errmsg
ULong lul_ptr, lul_rtn

lul_rtn = FindMimeFromData(0, as_filename, ablob_filedata, &
				Len(ablob_filedata), 0, 0, lul_ptr, 0)
If lul_rtn = NOERROR Then
	ls_mimetype = of_StringFromPtr(lul_ptr)
Else
	choose case lul_rtn
		case E_INVALIDARG
			ls_errmsg = "One or more of the arguments passed to the function were invalid."
		case E_OUTOFMEMORY
			ls_errmsg = "The function could not allocate enough memory to complete the call."
		case else
			ls_errmsg = "Undefined Error " + String(lul_rtn)
	end choose
	of_SetLastError("of_FindMimeFromData: " + ls_errmsg)
	of_LogError(iERROR, "of_FindMimeFromData: " + ls_errmsg)
	SetNull(ls_mimetype)
End If

Return ls_mimetype

end function

public subroutine of_logerror (integer ai_msglevel, string as_msgtext);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_LogError
//
// PURPOSE:    This function writes a message to the selected destinations.
//
// ARGUMENTS:  ai_msglevel	- The level of message importance
//					as_msgtext	- The text of the message
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

If ib_eventlog Then
	this.of_EventLog(ai_msglevel, as_msgtext)
End If

If ib_jaguarlog Then
	this.of_JaguarLog(ai_msglevel, as_msgtext)
End If

If ib_messagebox Then
	this.of_MessageBox(ai_msglevel, as_msgtext)
End If

end subroutine

public subroutine of_setlogerror (boolean ab_eventlog, boolean ab_jaguarlog, boolean ab_messagebox);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetLogError
//
// PURPOSE:    This function is used to set how messages are logged.
//
// ARGUMENTS:  ab_eventlog		- Write error messages to the Event Log
//					ab_jaguarlog	- Write error messages to the Jaguar Log
//					ab_messagebox	- Display error messages with MessageBox
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

ib_eventlog   = ab_eventlog
ib_jaguarlog  = ab_jaguarlog
ib_messagebox = ab_messagebox

end subroutine

private function string of_timezoneoffset ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_TimeZoneOffset
//
// PURPOSE:    This function returns the timezone offset string.
//
// RETURN:     Offset
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

TIME_ZONE_INFORMATION lstr_tzi
Integer li_hour, li_minute
Long ll_rtn, ll_bias
String ls_offset

ll_rtn = GetTimeZoneInformation(lstr_tzi)

If ll_rtn = 2 Then
	ll_bias = lstr_tzi.Bias + lstr_tzi.DaylightBias
Else
	ll_bias = lstr_tzi.Bias
End If

li_hour   = Abs(ll_bias) / 60
li_minute = Abs(ll_bias) - (li_hour * 60)

ls_offset =  String(li_hour, "00") + String(li_minute, "00")
If ll_bias < 0 Then
	ls_offset = "+" + ls_offset
Else
	ls_offset = "-" + ls_offset
End If

Return ls_offset

end function

private function boolean of_readfile (string as_filename, ref blob ablob_data);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_ReadFile
//
// PURPOSE:    This function is used to read an attachment from disk to a blob.
//
// ARGUMENTS:  as_filename - Filename
//					ablob_data	- By ref blob to receive the file contents
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

// constants for CreateFile API function
Constant Long INVALID_HANDLE_VALUE = -1
Constant ULong GENERIC_READ     = 2147483648
Constant ULong GENERIC_WRITE    = 1073741824
Constant ULong FILE_SHARE_READ  = 1
Constant ULong FILE_SHARE_WRITE = 2
Constant ULong CREATE_NEW			= 1
Constant ULong CREATE_ALWAYS		= 2
Constant ULong OPEN_EXISTING		= 3
Constant ULong OPEN_ALWAYS			= 4
Constant ULong TRUNCATE_EXISTING = 5

ULong lul_bytes, lul_length
Long ll_hFile
Blob lblob_filedata
Boolean lb_result

// get file length
lul_length = FileLength(as_filename)

// open file for read
ll_hFile = CreateFile(as_filename, GENERIC_READ, &
					FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0)
If ll_hFile = INVALID_HANDLE_VALUE Then
	Return False
End If

// read the entire file contents in one shot
lblob_filedata = Blob(Space(lul_length), EncodingAnsi!)
lb_result = ReadFile(ll_hFile, lblob_filedata, &
					lul_length, lul_bytes, 0)
ablob_data = BlobMid(lblob_filedata, 1, lul_length)

// close the file
CloseHandle(ll_hFile)

Return lb_result




end function

public function integer of_addattachment (string as_filename, blob ablob_filedata, boolean ab_inline);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddAttachment
//
// PURPOSE:    This function is used to add an attachment.
//
// ARGUMENTS:  as_filename		- Filename of the attachment
//					ablob_filedata	- Blob containing the attachment
//					ab_inline		- Content Disposition: 
//												True=inline, False=attachment
//
//	USAGE NOTE:	To embed attached images within the HTML email body, use the
//					following HTML tag:
//
//					<img src='cid:attach.filename'>
//
//					In this example, filename is the name of the file without the
//					path. The file 'C:\My Documents\image.jpg' would be tagged:
//
//					<img src='cid:attach.image.jpg'>
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Integer li_next

li_next = UpperBound(istr_Attach) + 1

istr_Attach[li_next].FileName	= as_filename
istr_Attach[li_next].FileData	= ablob_filedata
istr_Attach[li_next].Inline		= ab_inline

Return li_next

end function

public function integer of_addattachment (string as_filename, boolean ab_inline);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddAttachment
//
// PURPOSE:    This function is used to add an attachment.
//
// ARGUMENTS:  as_filename		- Filename of the attachment
//					ab_inline		- Content Disposition: 
//												True=inline, False=attachment
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Blob lblob_filedata
String ls_filename

If this.of_ReadFile(as_filename, lblob_filedata) Then
	ls_filename = Mid(as_filename, LastPos(as_filename, "\") + 1)
	Return of_AddAttachment(ls_filename, lblob_filedata, ab_inline)
Else
	Return 0
End If

end function

public function integer of_addattachment (string as_filename, blob ablob_filedata);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddAttachment
//
// PURPOSE:    This function is used to add an attachment.
//
// ARGUMENTS:  as_filename		- Filename of the attachment
//					ablob_filedata	- Blob containing the attachment
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Return of_AddAttachment(as_filename, ablob_filedata, False)

end function

public function integer of_addattachment (string as_filename);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddAttachment
//
// PURPOSE:    This function is used to add an attachment.
//
// ARGUMENTS:  as_filename		- Filename of the attachment
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Return of_AddAttachment(as_filename, False)

end function

public subroutine of_setpriority (string as_priority);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetPriority
//
// PURPOSE:    This function is used to set the message priority.
//
// ARGUMENTS:  as_priority - Priority: 'High', 'Low', 'Normal'
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// 12/26/2014	RolandS		Changed to default to zero (not specified)
// -----------------------------------------------------------------------------

choose case Lower(as_priority)
	case "high"
		ii_priority = 1
	case "low"
		ii_priority = 5
	case "normal"
		ii_priority = 3
	case else
		ii_priority = 0
end choose

end subroutine

public subroutine of_resetall ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_ResetAll
//
// PURPOSE:    This function is used to reset all settings.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Address lstr_EmptyAddress
String ls_empty[]

ib_html				= False
ib_receipt			= False
ib_authenticate	= False
ib_eventlog 		= False
ib_jaguarlog		= False
ib_messagebox		= False
iui_port			= 25
ii_priority    = 0
is_userid		= ""
is_passwd		= ""
is_server		= ""
is_subject		= ""
is_body			= ""
is_customhdr	= ls_empty
is_replyto		= ls_empty
istr_From		= lstr_EmptyAddress

of_Reset()

end subroutine

public function integer of_addreplyto (string as_email);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddReplyTo
//
// PURPOSE:    This function is used to add additional Reply-To email addresses.
//
// ARGUMENTS:  as_email - Email address
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// 09/13/2010	RolandS		Changed Reply-To to email address only
// -----------------------------------------------------------------------------

Integer li_next

li_next = UpperBound(is_replyto) + 1

is_replyto[li_next] = as_email

Return li_next

end function

public function integer of_addcustomheader (string as_header);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddCustomHeader
//
// PURPOSE:    This function is used to add custom header properties.
//
// ARGUMENTS:  as_header - Custom header text
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Integer li_next

li_next = UpperBound(is_customhdr) + 1
is_customhdr[li_next] = as_header

Return li_next

end function

private subroutine of_logfile (string as_logmsg);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_LogFile
//
// PURPOSE:    This function writes messages to the SMTP logfile.
//
// ARGUMENTS:  as_logmsg - Message text
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/10/2010	RolandS		Initial coding
// 07/06/2011	RolandS		Changed to use filename from instance variable
// 01/19/2013	RolandS		Changed to record nulls
// 10/14/2014	RolandS		Added DebugViewer
// -----------------------------------------------------------------------------

Integer li_fnum

If ib_DebugViewer Then
	If IsNull(as_logmsg) Then
		DebugMsg("<null>")
	Else
		DebugMsg(as_logmsg)
	End If
End If

If ib_logfile Then
	li_fnum = FileOpen(is_logfile, LineMode!, Write!, Shared!, Append!)
	If IsNull(as_logmsg) Then
		FileWrite(li_fnum, "<null>")
	Else
		FileWrite(li_fnum, as_logmsg)
	End If
	FileClose(li_fnum)
End If

end subroutine

public subroutine of_setport (unsignedinteger aui_port);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetPort
//
// PURPOSE:    This function is used to set the port the server is using.
//					The default is 25 and usually does not need to change.
//
// ARGUMENTS:  aui_port - Server port
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

iui_port = aui_port

end subroutine

public function boolean of_sendmail_logoff ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_sendmail_logoff
//
// PURPOSE:    This function ends the sendmail session.
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_reply, ls_msg

// quit the server session
of_LogFile(CRLF+"Close Session")
ls_msg = "QUIT" + CRLF
of_Send(iul_socket, ls_msg)

// receive response
of_Recv(iul_socket, ls_reply)

// close the socket
of_Close(iul_socket)

Return True

end function

public function boolean of_sendmail_logon ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_sendmail_logon
//
// PURPOSE:    This function starts the sendmail session.
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// 12/20/2012	RolandS		Changed to try EHLO then HELO.
// 12/27/2013	RolandS		Added logging
// -----------------------------------------------------------------------------

Constant	String REPLY_READY = "220"
String ls_msg, ls_Reply

// SMTP is Ansi
of_SetUnicode(False, False)

// initialize Winsock
of_Startup()

// connect to server
of_LogFile(CRLF+"Connect to server")
iul_socket = of_Connect(is_server, iui_port)
If iul_socket = 0 Then Return False

// receive response
of_Recv(iul_socket, ls_Reply)
If Left(ls_Reply, 3) <> REPLY_READY Then
	of_SetLastError(ls_Reply)
	of_LogError(iERROR, ls_Reply)
	Return False
End If
of_LogFile("S:" + ls_Reply)

// start the login conversation
of_LogFile(CRLF+"Identify the server")
ls_msg = "EHLO " + of_GetHostName() + CRLF
If Not of_SendMsg(ls_msg, 250, ls_Reply) Then
	of_sendmail_logoff()
	Return False
End If

// login to the server
If ib_authenticate Then
	of_LogFile(CRLF+"Login to server")
	ls_msg = "AUTH LOGIN" + CRLF
	If Not of_SendMsg(ls_msg, 334, ls_Reply) Then
		of_sendmail_logoff()
		Return False
	End If
	ls_msg = of_Encode64(is_userid) + CRLF
	If Not of_SendMsg(ls_msg, 334, ls_Reply) Then
		of_sendmail_logoff()
		Return False
	End If
	ls_msg = of_Encode64(is_passwd) + CRLF
	If Not of_SendMsg(ls_msg, 235, ls_Reply) Then
		of_sendmail_logoff()
		Return False
	End If
End If

Return True

end function

public function boolean of_sendmail_send ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_sendmail_send
//
// PURPOSE:    This function sends the email to the server.
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
//	09/17/2010	RolandS		Split of_Data into of_DataHeader and of_DataBody
// -----------------------------------------------------------------------------

String ls_msg, ls_Reply, ls_head, ls_body
Integer li_rc, li_idx, li_max

// build the data string
ls_head = of_DataHeader()
ls_body = of_DataBody()

// from email address
of_LogFile(CRLF+"From Email Address")
ls_msg = "MAIL FROM:<" + istr_From.Email + ">" + CRLF
If Not of_SendMsg(ls_msg, 250, ls_Reply) Then
	of_Close(iul_socket)
	Return False
End If

// to email address
li_max = UpperBound(istr_Address)
If li_max > 0 Then
	of_LogFile(CRLF+"To Email Address")
End If
For li_idx = 1 To li_max
	ls_msg = "RCPT TO:<" + istr_Address[li_idx].Email + ">" + CRLF
	If Not of_SendMsg(ls_msg, 250, ls_Reply) Then
		of_Close(iul_socket)
		Return False
	End If
Next

// cc email address
li_max = UpperBound(istr_CC)
If li_max > 0 Then
	of_LogFile(CRLF+"Cc Email Address")
End If
For li_idx = 1 To li_max
	ls_msg = "RCPT TO:<" + istr_CC[li_idx].Email + ">" + CRLF
	If Not of_SendMsg(ls_msg, 250, ls_Reply) Then
		of_Close(iul_socket)
		Return False
	End If
Next

// bcc email address
li_max = UpperBound(istr_Bcc)
If li_max > 0 Then
	of_LogFile(CRLF+"Bcc Email Address")
End If
For li_idx = 1 To li_max
	ls_msg = "RCPT TO:<" + istr_Bcc[li_idx].Email + ">" + CRLF
	If Not of_SendMsg(ls_msg, 250, ls_Reply) Then
		of_Close(iul_socket)
		Return False
	End If
Next

// data header
of_LogFile(CRLF+"Data Header")
ls_msg = "DATA" + CRLF
If Not of_SendMsg(ls_msg, 354, ls_Reply) Then
	of_Close(iul_socket)
	Return False
End If

// send data
of_LogFile(CRLF+"Send Data")
If Not of_SendMsg(ls_head+ls_body, 250, ls_Reply) Then
	of_Close(iul_socket)
	Return False
End If

Return True

end function

private function string of_stringfromptr (unsignedlong aul_ptr);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_StringFromPtr
//
// PURPOSE:    This function returns a string from a memory pointer.
//
// ARGUMENTS:  aul_ptr - Pointer to a string
//
// RETURN:     String
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Return String(aul_ptr, "address")

end function

private function string of_dataheader ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_DataHeader
//
// PURPOSE:    This function is used to build the header section of the DATA
//					portion of the message. It is called by of_sendmail_send.
//
// RETURN:     A string containing the data to send.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/17/2010	RolandS		Initial coding
//	12/26/2010	RolandS		Added call to of_UTF8String to encode strings
//									as quoted printable for characters > Ascii 127
// 12/23/2014	RolandS		Changed the Priority header, added quotes around
//									names, changed Reply-To to only when specified.
// -----------------------------------------------------------------------------

String ls_data
Integer li_idx, li_max
DateTime ldt_current

// From address
ls_data += 'From: '
If istr_From.Name <> "" Then
	ls_data += '"' + of_UTF8String(istr_From.Name) + '" '
End If
ls_data += '<' + istr_From.Email + '>' + CRLF

// To addresses
li_max = UpperBound(istr_Address)
For li_idx = 1 To li_max
	If li_idx = 1 Then
		ls_data += 'To: '
	Else
		ls_data += '~t'
	End If
	If istr_Address[li_idx].Name <> "" Then
		ls_data += '"' + of_UTF8String(istr_Address[li_idx].Name) + '" '
	End If
	ls_data += '<' + istr_Address[li_idx].Email + '>'
	If li_idx < li_max Then
		ls_data += ','
	End If
	ls_data += CRLF
Next

// CC addresses
li_max = UpperBound(istr_CC)
For li_idx = 1 To li_max
	If li_idx = 1 Then
		ls_data += 'Cc: '
	Else
		ls_data += '~t'
	End If
	If istr_CC[li_idx].Name <> "" Then
		ls_data += '"' + of_UTF8String(istr_CC[li_idx].Name) + '" '
	End If
	ls_data += '<' + istr_CC[li_idx].Email + '>'
	If li_idx < li_max Then
		ls_data += ','
	End If
	ls_data += CRLF
Next

// Reply-To
li_max = UpperBound(is_replyto)
For li_idx = 1 To li_max
	If li_idx = 1 Then
		ls_data += 'Reply-To: '
	Else
		ls_data += '~t'
	End If
	ls_data += '<' + is_replyto[li_idx] + '>'
	If li_idx < li_max Then
		ls_data += ','
	End If
	ls_data += CRLF
Next

// Return Receipt
If ib_receipt Then
	ls_data += 'Disposition-Notification-To: '
	If istr_From.Name <> "" Then
		ls_data += '"' + of_UTF8String(istr_From.Name) + '" '
	End If
	ls_data += '<' + istr_From.Email + '>' + CRLF
End If

// various properties
ls_data += "Subject: " + of_UTF8String(is_subject) + CRLF
ldt_current = DateTime(Today(), Now())
ls_data += "Date: " + String(ldt_current, "ddd, dd mmm yyyy hh:mm:ss")
ls_data += " " + of_TimeZoneOffset() + CRLF
ls_data += 'MIME-Version: 1.0' + CRLF
ls_data += 'X-Mailer: TopWiz PowerBuilder SMTP Object' + CRLF
ls_data += "Return-Path: " + istr_From.Email + CRLF

// Priority
choose case ii_priority
	case 1
		ls_data += 'Importance: High' + CRLF
		ls_data += 'X-Priority: 1' + CRLF
	case 3
		ls_data += 'Importance: Normal' + CRLF
		ls_data += 'X-Priority: 3' + CRLF
	case 5
		ls_data += 'Importance: Low' + CRLF
		ls_data += 'X-Priority: 5' + CRLF
end choose

// Custom Headers
li_max = UpperBound(is_customhdr)
For li_idx = 1 To li_max
	ls_data += is_customhdr[li_idx] + CRLF
Next

Return ls_data

end function

private function string of_databody ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_DataBody
//
// PURPOSE:    This function is used to build the body section of the DATA
//					portion of the message. It is called by of_sendmail_send.
//
// RETURN:     A string containing the data to send.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/17/2010	RolandS		Initial coding
//	12/26/2010	RolandS		Added call to of_UTF8Body to encode the body
//									for characters > Ascii 127 or Unicode
//	09/20/2011	RolandS		Only add Content-ID when attachment is inline
// -----------------------------------------------------------------------------

String ls_guid, ls_boundary, ls_altboundary, ls_encoding, ls_charset
String ls_data, ls_mimetype, ls_contdisp, ls_encoded
Integer li_idx, li_max
DateTime ldt_current

// create boundaries
ls_guid = of_Generate_GUID()
ls_boundary    = "000_" + ls_guid
ls_altboundary = "alt_" + ls_guid

// attachment header
If UpperBound(istr_Attach) > 0 Then
	If Pos(Lower(is_body), "cid:attach.") > 0 Then
		ls_data += 'Content-Type: multipart/related;' + CRLF
	Else
		ls_data += 'Content-Type: multipart/mixed;' + CRLF
	End If
	ls_data += ' boundary="' + ls_boundary + '"' + CRLF
	ls_data += CRLF
	ls_data += 'This is a multi-part message in MIME format.' + CRLF
	ls_data += '--' + ls_boundary + CRLF
End If

// add the Body as text or html
of_UTF8Body(is_body, ls_encoding, ls_charset)
If ib_html Then
	ls_data += 'Content-Type: text/html;' + CRLF
	ls_data += '~tcharset="' + ls_charset + '"' + CRLF
Else
	ls_data += 'Content-Type: text/plain;' + CRLF
	ls_data += '~tcharset="' + ls_charset + '";format=flowed' + CRLF
End If
ls_data += 'Content-Transfer-Encoding: ' + ls_encoding + CRLF
ls_data += CRLF + is_body + CRLF

// add attachments
If UpperBound(istr_Attach) > 0 Then
	li_max = UpperBound(istr_Attach)
	For li_idx = 1 To li_max
		// add Boundary
		ls_data += CRLF + '--' + ls_boundary + CRLF
		// determine Content-Type
		ls_mimetype = this.of_FindMimeFromData(istr_Attach[li_idx].FileName, &
															istr_Attach[li_idx].FileData)
		ls_data += 'Content-Type: ' + ls_mimetype + ';' + CRLF
		ls_data += '~tname="' + istr_Attach[li_idx].FileName + '"' + CRLF
		// determine Content-Disposition
		If istr_Attach[li_idx].Inline Then
			ls_contdisp = 'Content-Disposition: inline;'
		Else
			ls_contdisp = 'Content-Disposition: attachment;'
		End If
		// add attachment header and data
		If Lower(Left(ls_mimetype, 4)) = "text" Then
			ls_data += 'Content-Transfer-Encoding: 7bit' + CRLF
			ls_data += ls_contdisp + CRLF
			ls_data += '~tfilename="' + istr_Attach[li_idx].FileName + '"' + CRLF
			If istr_Attach[li_idx].Inline Then
				ls_data += 'Content-ID: <attach.' + istr_Attach[li_idx].FileName + '>' + CRLF
			End If
			ls_data += CRLF + String(istr_Attach[li_idx].FileData, EncodingAnsi!) + CRLF
		Else
			ls_data += 'Content-Transfer-Encoding: base64' + CRLF
			ls_data += ls_contdisp + CRLF
			ls_data += '~tfilename="' + istr_Attach[li_idx].FileName + '"' + CRLF
			If istr_Attach[li_idx].Inline Then
				ls_data += 'Content-ID: <attach.' + istr_Attach[li_idx].FileName + '>' + CRLF
			End If
			// encode the binary data
			ls_encoded = this.of_Encode64(istr_Attach[li_idx].FileData)
			ls_data += CRLF + ls_encoded + CRLF
		End If
	Next
	ls_data += '--' + ls_boundary + '--'
End If

// final double CRLF
ls_data += CRLF + '.' + CRLF

Return ls_data

end function

public function string of_data ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_Data
//
// PURPOSE:    This function is for testing purposes only.
//
// RETURN:     The DATA section of the email
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/17/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_head, ls_body

// build the data string
ls_head = of_DataHeader()
ls_body = of_DataBody()

Return ls_head+ls_body

end function

public function string of_crypterror (long al_retval);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_CryptError
//
// PURPOSE:    This function returns message text for Cryptlib errors.
//
// ARGUMENTS:  al_retval - The error returned by a Cryptlib function
//
// RETURN:     Error message
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/21/2010	RolandS		Initial coding
//	12/30/2013	RolandS		Added extended error message
// -----------------------------------------------------------------------------

Constant Long CRYPT_ATTRIBUTE_ERRORMESSAGE = 12
String ls_Return, ls_extended
Integer li_Strlen
Long ll_RetVal

If al_RetVal = CRYPT_OK Then
	Return ""
End If

choose case al_RetVal
	// Errors in function calls
	case -1
		ls_Return = "Bad argument - parameter 1"
	case -2
		ls_Return = "Bad argument - parameter 2"
	case -3
		ls_Return = "Bad argument - parameter 3"
	case -4
		ls_Return = "Bad argument - parameter 4"
	case -5
		ls_Return = "Bad argument - parameter 5"
	case -6
		ls_Return = "Bad argument - parameter 6"
	case -7
		ls_Return = "Bad argument - parameter 7"
	// Errors due to insufficient resources  
	case -10
		ls_Return = "Out of memory"
	case -11
		ls_Return = "Data has not been initialised"
	case -12
		ls_Return = "Data has already been init'd"
	case -13
		ls_Return = "Operation not avail at requested sec level"
	case -14
		ls_Return = "No reliable random data available"
	case -15
		ls_Return = "Operation failed"
	case -16
		ls_Return = "Internal consistency check failed"
	// Security violations
	case -20
		ls_Return = "This type of operation not available"
	case -21
		ls_Return = "No permission to perform this operation"
	case -22
		ls_Return = "Incorrect key used to decrypt data"
	case -23
		ls_Return = "Operation incomplete/still in progress"
	case -24
		ls_Return = "Operation complete/can't continue"
	case -25
		ls_Return = "Operation timed out before completion"
	case -26
		ls_Return = "Invalid/inconsistent information"
	case -27
		ls_Return = "Resource destroyed by extnl.event"
	// High-level function errors     
	case -30
		ls_Return = "Resources/space exhausted"
	case -31
		ls_Return = "Not enough data available"
	case -32
		ls_Return = "Bad/unrecognised data format"
	case -33
		ls_Return = "Signature/integrity check failed"
	// Data access function errors
	case -40
		ls_Return = "Cannot open object"
	case -41
		ls_Return = "Cannot read item from object"
	case -42
		ls_Return = "Cannot write item to object"
	case -43
		ls_Return = "Requested item not found in object"
	case -44
		ls_Return = "Item already present in object"
	// Data enveloping errors     
	case -50
		ls_Return = "Need resource to proceed"
	case else
		ls_Return = "Unknown error code!"
end choose

// get extended error information
li_Strlen = 255
ls_Extended = Space(li_Strlen)

ll_RetVal = cryptGetAttributeString(il_Session, &
				CRYPT_ATTRIBUTE_ERRORMESSAGE, ls_Extended, li_Strlen)
If li_Strlen > 0 Then
	ls_Return += "~r~n~r~n" + ls_Extended
End If

Return ls_Return

end function

public function boolean of_sendsecmail_send ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_sendsecmail_send
//
// PURPOSE:    This function sends the encrypted email to the server.
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/21/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_head, ls_body, ls_msg, ls_Reply
Integer li_idx, li_max

// build the data string
ls_head = of_DataHeader()
ls_body = of_DataBody()

// from email address
of_LogFile(CRLF+"From Email Address")
ls_msg = "MAIL FROM:<" + istr_From.Email + ">" + CRLF
If Not of_sendmsg_crypt(ls_msg, 250, ls_Reply) Then
	cryptEnd()
	Return False
End If

// to email address
li_max = UpperBound(istr_Address)
If li_max > 0 Then
	of_LogFile(CRLF+"To Email Address")
End If
For li_idx = 1 To li_max
	ls_msg = "RCPT TO:<" + istr_Address[li_idx].Email + ">" + CRLF
	If Not of_sendmsg_crypt(ls_msg, 250, ls_Reply) Then
		cryptEnd()
		Return False
	End If
Next

// cc email address
li_max = UpperBound(istr_CC)
If li_max > 0 Then
	of_LogFile(CRLF+"Cc Email Address")
End If
For li_idx = 1 To li_max
	ls_msg = "RCPT TO:<" + istr_CC[li_idx].Email + ">" + CRLF
	If Not of_sendmsg_crypt(ls_msg, 250, ls_Reply) Then
		cryptEnd()
		Return False
	End If
Next

// bcc email address
li_max = UpperBound(istr_Bcc)
If li_max > 0 Then
	of_LogFile(CRLF+"Bcc Email Address")
End If
For li_idx = 1 To li_max
	ls_msg = "RCPT TO:<" + istr_Bcc[li_idx].Email + ">" + CRLF
	If Not of_sendmsg_crypt(ls_msg, 250, ls_Reply) Then
		cryptEnd()
		Return False
	End If
Next

// data header
of_LogFile(CRLF+"Data Header")
ls_msg = "DATA" + CRLF
If Not of_sendmsg_crypt(ls_msg, 354, ls_Reply) Then
	cryptEnd()
	Return False
End If

// send data
of_LogFile(CRLF+"Send Data")
If Not of_sendmsg_crypt(ls_head+ls_body, 250, ls_Reply) Then
	cryptEnd()
	Return False
End If

Return True

end function

public function boolean of_sendsecmail_logoff ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_sendsecmail_logoff
//
// PURPOSE:    This function ends the encrypted sendmail session.
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/21/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_msg, ls_Reply

// quit the server session
of_LogFile(CRLF+"Close Session")
ls_msg = "QUIT" + CRLF
of_sendmsg_crypt(ls_msg, 221, ls_Reply)

// Close the session
cryptDestroySession(il_Session)

// Close the Library
cryptEnd()

// close the socket
of_Close(iul_socket)

Return True

end function

public function integer of_addto (string as_email);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddTo
//
// PURPOSE:    This function is used to add a primary send to email address.
//
//					It had been renamed to of_AddAddress but due to user request,
//					this override has been added to allow use of the old name.
//
// ARGUMENTS:  as_email - Email address
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 10/12/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Return of_AddAddress(as_email, "")

end function

public function integer of_addto (string as_email, string as_name);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddTo
//
// PURPOSE:    This function is used to add a primary send to
//					email address and name.
//
//					It had been renamed to of_AddAddress but due to user request,
//					this override has been added to allow use of the old name.
//
// ARGUMENTS:  as_email - Email address
//					as_name	- Recipient name
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 10/12/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Return of_AddAddress(as_email, as_name)

end function

public function integer of_addfile (string as_filename);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_AddFile
//
// PURPOSE:    This function is used to add an attachment.
//
//					It had been renamed to of_AddAttachment but due to user request,
//					this override has been added to allow use of the old name.
//
// ARGUMENTS:  as_filename		- Filename of the attachment
//
// RETURN:     Index to the array
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 10/12/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Return of_AddAttachment(as_filename, False)

end function

private function string of_hex (unsignedlong aul_decimal);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_Hex
//
// PURPOSE:    This function converts a number to a hex string.
//
// ARGUMENTS:  aul_decimal	- The number to convert
//
// RETURN:     Hex string
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/22/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_hex
Char lch_hex[0 to 15] = {'0','1','2','3','4','5','6','7','8','9', &
									'A','B','C','D','E','F'}

Do 
	ls_hex = lch_hex[mod(aul_decimal, 16)] + ls_hex
	aul_decimal /= 16
Loop Until aul_decimal= 0

Return ls_hex

end function

private function string of_utf8string (string as_string);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_UTF8String
//
// PURPOSE:    This function encodes UTF8 strings as quoted printable.
//
// ARGUMENTS:  as_string	- The string to encode
//
// RETURN:     Encoded string
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/26/2010	RolandS		Initial coding
// 04/18/2012	RolandS		Added of_Hex encoding of characters > 127
// -----------------------------------------------------------------------------

String ls_char[], ls_result, ls_base64
Integer li_idx, li_max
Boolean lb_EncodeB, lb_EncodeQ
UInt lui_codepoint

// determine type of encoding needed
li_max = Len(as_string)
For li_idx = 1 To li_max
	ls_char[li_idx] = Mid(as_string, li_idx, 1)
	lui_codepoint = Asc(ls_char[li_idx])
	If lui_codepoint > 127 Then
		If lui_codepoint > 255 Then
			lb_EncodeB = True
		Else
			ls_char[li_idx] = "=" + of_Hex(lui_codepoint)
			lb_EncodeQ = True
		End If
	End If
Next

If lb_EncodeB Then
	// Unicode - Encode 'base64'
	ls_base64 = of_Encode64(Blob(as_string, EncodingUTF8!))
	ls_result = "=?UTF-8?B?" + ls_base64 + "?="
Else
	If lb_EncodeQ Then
		// Ascii 128-255 - Encode 'quoted printable'
		ls_result = "=?iso-8859-1?Q?"
		For li_idx = 1 To li_max
			If ls_char[li_idx] = " " Then
				ls_result += "_"
			Else
				ls_result += ls_char[li_idx]
			End If
		Next
		ls_result += "?="
	Else
		// Ascii 000-127
		ls_result = as_string
	End If
End If

Return ls_result

end function

private subroutine of_utf8body (ref string as_string, ref string as_encoding, ref string as_charset);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_UTF8Body
//
// PURPOSE:    This function encodes UTF8 body string as quoted printable.
//
// ARGUMENTS:  as_string	- The string to encode (by ref)
//
// RETURN:     Content-Transfer-Encoding
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/26/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_char[]
Integer li_idx, li_max
Boolean lb_EncodeB, lb_EncodeQ
UInt lui_codepoint

// determine type of encoding needed
li_max = Len(as_string)
For li_idx = 1 To li_max
	ls_char[li_idx] = Mid(as_string, li_idx, 1)
	lui_codepoint = Asc(ls_char[li_idx])
	If lui_codepoint > 127 Then
		If lui_codepoint > 255 Then
			lb_EncodeB = True
		Else
			ls_char[li_idx] = "=" + of_Hex(lui_codepoint)
			lb_EncodeQ = True
		End If
	End If
Next

If lb_EncodeB Then
	// Unicode - Encode 'base64'
	as_string = of_Encode64(Blob(as_string, EncodingUTF8!))
	as_encoding = "base64"
	as_charset  = "UTF-8"
Else
	If lb_EncodeQ Then
		// Ascii 128-255 - Encode 'quoted printable'
		as_string = ""
		For li_idx = 1 To li_max
			choose case ls_char[li_idx]
				case "~t"	// Tab
					as_string += "=09"
				case "~n"	// LF
					as_string += "=0A"
				case "~r"	// CR
					as_string += "=0D"
				case " "		// Space
					as_string += "=20"
				case "="		// Equal
					as_string += "=3D"
				case else
					as_string += ls_char[li_idx]
			end choose
		Next
		as_encoding = "quoted-printable"
		as_charset  = "iso-8859-1"
	Else
		// Ascii 000-127
		as_encoding = "7bit"
		as_charset  = "iso-8859-1"
	End If
End If

end subroutine

public subroutine of_setlogfile (boolean ab_flag, string as_logfile);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetLogFile
//
// PURPOSE:    This function is used to turn on SMTP conversation logging.
//
// ARGUMENTS:  ab_flag		- True/False
//					as_logfile	- Name of the logfile
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/10/2010	RolandS		Initial coding
// 07/06/2011	RolandS		Added as_logfile
// -----------------------------------------------------------------------------

ib_logfile = ab_flag
is_logfile = as_logfile

end subroutine

public function boolean of_sendtlsmail_logon ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_sendtlsmail_logon
//
// PURPOSE:    This function starts the encrypted sendmail session for port 587.
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 02/09/2010	RolandS		Initial coding
// 12/27/2013	RolandS		Added logging
// 12/30/2013	RolandS		Added call to set certificate compliance level.
// 04/23/2014	RolandS		Added call to set read timeout.
// 10/13/2014	RolandS		Rewrote the server login to check for 220 respone.
// -----------------------------------------------------------------------------

Constant	String REPLY_READY = "220"
String ls_msg, ls_Reply, ls_Buffer
Long ll_RetVal, ll_ReplyBytes

// SMTP is Ansi
of_SetUnicode(False, False)

// initialize Winsock
of_Startup()

// connect to server
of_LogFile(CRLF+"Connect to server")
iul_socket = of_Connect(is_server, iui_port)
If iul_socket = 0 Then Return False

// receive response
of_Recv(iul_socket, ls_Reply)
If Left(ls_Reply, 3) <> REPLY_READY Then
	of_SetLastError(ls_Reply)
	of_LogError(iERROR, ls_Reply)
	Return False
End If
of_LogFile("S:" + ls_Reply)

// start conversation with server
ls_msg = "HELO " + of_GetHostName() + CRLF
If Not of_SendMsg(ls_msg, 250, ls_Reply) Then
	of_Close(iul_socket)
	Return False
End If

// start the TLS session
If Not of_SendMsg("STARTTLS" + CRLF, 220, ls_Reply) Then
	of_Close(iul_socket)
	Return False
End If

// Initialize the Library
ll_RetVal = cryptInit()
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptInit: " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	Return False
End If
of_LogFile(CRLF+"cryptInit: OK")

// Create the session
ll_RetVal = cryptCreateSession(il_Session, CRYPT_UNUSED, CRYPT_SESSION_SSL)
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptCreateSession: " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	cryptEnd()
	Return False
End If
of_LogFile("cryptCreateSession: OK")

// Set compliance level
ll_RetVal = cryptSetAttribute(il_Session, &
		CRYPT_OPTION_CERT_COMPLIANCELEVEL, CRYPT_COMPLIANCELEVEL_OBLIVIOUS)
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptSetAttribute (Set compliance level): " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	cryptEnd()
	Return False
End If
of_LogFile("cryptSetAttribute (Set compliance level): OK")

// Set the socket
ll_RetVal = cryptSetAttribute(il_Session, CRYPT_SESSINFO_NETWORKSOCKET, iul_socket) 
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptSetAttribute (Set the socket): " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	cryptEnd()
	Return False
End If
of_LogFile("cryptSetAttribute (Set the socket): OK")

// Activate the session
ll_RetVal = cryptSetAttribute(il_Session, CRYPT_SESSINFO_ACTIVE, 1) 
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptSetAttribute (Activate the session): " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	cryptEnd()
	Return False
End If
of_LogFile("cryptSetAttribute (Activate the session): OK")

// Remove any response created by connecting
ls_Buffer = Space(256)
ll_RetVal = cryptPopData(il_session, &
						ls_Buffer, Len(ls_Buffer), ll_ReplyBytes)
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptPopData: " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	of_sendsecmail_logoff()
	Return False
End If
If ll_ReplyBytes > 0 Then
	ls_Reply = Left(ls_Buffer, ll_ReplyBytes)
	of_LogFile("S:" + ls_Reply)
End If

// Set timeout
ll_RetVal = cryptSetAttribute(il_Session, CRYPT_OPTION_NET_READTIMEOUT, 10)
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptSetAttribute (Set timeout): " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	of_sendsecmail_logoff()
	Return False
End If
of_LogFile("cryptSetAttribute (Set timeout): OK")

// start the login conversation
of_LogFile(CRLF+"Identify the server")
ls_msg = "EHLO " + of_GetHostName() + CRLF
If Not of_sendmsg_crypt(ls_msg, 250, ls_Reply) Then
	of_sendsecmail_logoff()
	Return False
End If

of_LogFile(CRLF+"Login to server")
ls_msg = "AUTH LOGIN" + CRLF
If Not of_sendmsg_crypt(ls_msg, 334, ls_Reply) Then
	of_sendsecmail_logoff()
	Return False
End If

ls_msg = of_Encode64(is_userid) + CRLF
If Not of_sendmsg_crypt(ls_msg, 334, ls_Reply) Then
	of_sendsecmail_logoff()
	Return False
End If

ls_msg = of_Encode64(is_passwd) + CRLF
If Not of_sendmsg_crypt(ls_msg, 235, ls_Reply) Then
	of_sendsecmail_logoff()
	Return False
End If

Return True

end function

public function boolean of_sendsslmail_logon ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_sendsslmail_logon
//
// PURPOSE:    This function starts the encrypted sendmail session for port 465.
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 02/09/2010	RolandS		Initial coding
// 12/20/2012	RolandS		Changed to try EHLO then HELO before AUTH LOGIN.
// 12/27/2013	RolandS		Added logging
// 12/30/2013	RolandS		Added call to set certificate compliance level.
// 04/23/2014	RolandS		Added call to set read timeout.
// 10/13/2014	RolandS		Rewrote the server login to check for 220 respone.
// -----------------------------------------------------------------------------

String ls_msg, ls_Reply, ls_Buffer
Long ll_RetVal, ll_ReplyBytes, ll_next

// Initialize the Library
ll_RetVal = cryptInit()
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptInit: " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	Return False
End If
of_LogFile(CRLF+"cryptInit: OK")

// Create the session
ll_RetVal = cryptCreateSession(il_Session, CRYPT_UNUSED, CRYPT_SESSION_SSL)
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptCreateSession: " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	cryptEnd()
	Return False
End If
of_LogFile("cryptCreateSession: OK")

// Set compliance level
ll_RetVal = cryptSetAttribute(il_Session, &
		CRYPT_OPTION_CERT_COMPLIANCELEVEL, CRYPT_COMPLIANCELEVEL_OBLIVIOUS)
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptSetAttribute (Set compliance level): " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	cryptEnd()
	Return False
End If
of_LogFile("cryptSetAttribute (Set compliance level): OK")

// Add the server name
ll_RetVal = cryptSetAttributeString(il_Session, &
						CRYPT_SESSINFO_SERVER_NAME, is_server, Len(is_server)) 
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptSetAttributeString: " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	cryptEnd()
	Return False
End If
of_LogFile("cryptSetAttributeString (Add the server name): OK")

// Specify the Port
ll_RetVal = cryptSetAttribute(il_Session, &
						CRYPT_SESSINFO_SERVER_PORT, iui_port)
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptSetAttribute (Specify the Port): " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	cryptEnd()
	Return False
End If
of_LogFile("cryptSetAttribute (Specify the Port): OK")

// Activate the session
ll_RetVal = cryptSetAttribute(il_Session, CRYPT_SESSINFO_ACTIVE, 1) 
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptSetAttribute (Activate the session): " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	cryptEnd()
	Return False
End If
of_LogFile("cryptSetAttribute (Activate the session): OK")

// Set timeout
ll_RetVal = cryptSetAttribute(il_Session, CRYPT_OPTION_NET_READTIMEOUT, 10)
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptSetAttribute (Set timeout): " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	of_sendsecmail_logoff()
	Return False
End If
of_LogFile("cryptSetAttribute (Set timeout): OK")

// Remove any response created by connecting
ls_Buffer = Space(256)
ll_RetVal = cryptPopData(il_session, &
						ls_Buffer, Len(ls_Buffer), ll_ReplyBytes)
IF ll_RetVal <> CRYPT_OK Then
	ls_msg = "cryptPopData: " + of_CryptError(ll_RetVal)
	of_SetLastError(ls_msg)
	of_LogError(iERROR, ls_msg)
	of_sendsecmail_logoff()
	Return False
End If
ls_Reply = Left(ls_Buffer, ll_ReplyBytes)
of_LogFile(CRLF+"Connect to server")
of_LogFile("S:" + ls_Reply)

// start the login conversation
of_LogFile(CRLF+"Identify the server")
ls_msg = "EHLO " + of_GetHostName() + CRLF
If Not of_sendmsg_crypt(ls_msg, 250, ls_Reply) Then
	of_sendsecmail_logoff()
	Return False
End If

of_LogFile(CRLF+"Login to server")
ls_msg = "AUTH LOGIN" + CRLF
If Not of_sendmsg_crypt(ls_msg, 334, ls_Reply) Then
	of_sendsecmail_logoff()
	Return False
End If

ls_msg = of_Encode64(is_userid) + CRLF
If Not of_sendmsg_crypt(ls_msg, 334, ls_Reply) Then
	of_sendsecmail_logoff()
	Return False
End If

ls_msg = of_Encode64(is_passwd) + CRLF
If Not of_sendmsg_crypt(ls_msg, 235, ls_Reply) Then
	of_sendsecmail_logoff()
	Return False
End If

Return True

end function

public function boolean of_sendtlsmail ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SendTLSMail
//
// PURPOSE:    This function is the main process to send the email.
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 02/11/2012	RolandS		Initial coding
// 02/13/2012	RolandS		Moved logging here
// -----------------------------------------------------------------------------

DateTime ldt_current

// log start of SMTP conversation
ldt_current = DateTime(Today(), Now())
of_LogFile("of_SendTLSMail Start: " + String(ldt_current)+CRLF)

// start the server session
If Not of_sendtlsmail_logon() Then
	Return False
End If

// send the email message
If Not of_sendsecmail_send() Then
	Return False
End If

// stop the server session
If Not of_sendsecmail_logoff() Then
	Return False
End If

// log end of SMTP conversation
ldt_current = DateTime(Today(), Now())
of_LogFile(CRLF+"of_SendTLSMail End: " + String(ldt_current)+CRLF)

Return True

end function

public function boolean of_sendsslmail ();// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SendSSLMail
//
// PURPOSE:    This function is the main process to send the email.
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 02/11/2012	RolandS		Initial coding
// 02/13/2012	RolandS		Moved logging here
// -----------------------------------------------------------------------------

DateTime ldt_current

// log start of SMTP conversation
ldt_current = DateTime(Today(), Now())
of_LogFile("of_SendSSLMail Start: " + String(ldt_current)+CRLF)

// start the server session
If Not of_sendsslmail_logon() Then
	Return False
End If

// send the email message
If Not of_sendsecmail_send() Then
	Return False
End If

// stop the server session
If Not of_sendsecmail_logoff() Then
	Return False
End If

// log end of SMTP conversation
ldt_current = DateTime(Today(), Now())
of_LogFile(CRLF+"of_SendSSLMail End: " + String(ldt_current)+CRLF)

Return True

end function

public function boolean of_validemail (string as_email, ref string as_errormsg);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_ValidEmail
//
// PURPOSE:    This function determines if the email address is valid syntax.
//
// ARGUMENTS:  as_email		- Email address to analyze
//					as_errormsg	- Error message describing the problem
//
// RETURN:     True = Valid syntax, False = Invalid Syntax
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/12/2012	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_localpart, ls_domain, ls_domainpart[]
Integer li_pos, li_idx, li_max, li_asc

If Len(as_email) > 254 Then
	as_errormsg = "Email address cannot be more than 254 characters!"
	Return False
End If

li_pos = Pos(as_email, "@")
If li_pos < 2 Then
	as_errormsg = "Email address must have an @ character!"
	Return False
End If

If LastPos(as_email, "@") > Pos(as_email, "@") Then
	as_errormsg = "Email address cannot have more than one @ character!"
	Return False
End If

li_pos = Pos(as_email, " ")
If li_pos > 0 Then
	as_errormsg = "Email address cannot have any spaces!"
	Return False
End If

// split local & domain
li_pos = Pos(as_email, "@")
ls_localpart = Left(as_email, li_pos - 1)
ls_domain    = Mid(as_email, li_pos + 1)

If Len(ls_localpart) > 64 Then
	as_errormsg = "The mailbox part of the email address cannot be more than 64 characters!"
	Return False
End If

If Len(ls_domain) > 253 Then
	as_errormsg = "The domain part of the email address cannot be more than 253 characters!"
	Return False
End If

If Left(ls_localpart, 1) = "." Then
	as_errormsg = "The mailbox part of the email address cannot start with a period!"
	Return False
End If

If Right(ls_localpart, 1) = "." Then
	as_errormsg = "The mailbox part of the email address cannot end with a period!"
	Return False
End If

If Pos(ls_localpart, "..") > 0 Then
	as_errormsg = "The mailbox part of the email address cannot have more than one period in a row!"
	Return False
End If

// check local for allowed characters
li_max = Len(ls_localpart)
For li_idx = 1 To li_max
	li_asc = Asc(Mid(ls_localpart, li_idx, 1))
	choose case li_asc
		case 65 to 90
			// Lower case a-z
		case 97 to 122
			// Upper case A-Z
		case 48 to 57
			// Digits 0-9
		case 33, 35 to 39, 42, 43, 45, 47, 61, 63, 94 to 96, 123 to 126
			// Characters !#$%&'*+-/=?^_`{|}~
		case 46
			// Period
		case else
			as_errormsg = "The mailbox part of the email address contains invalid characters!"
			Return False
	end choose
Next

If Left(ls_domain, 1) = "." Then
	as_errormsg = "The domain part of the email address cannot start with a period!"
	Return False
End If

If Right(ls_domain, 1) = "." Then
	as_errormsg = "The domain part of the email address cannot end with a period!"
	Return False
End If

li_pos = Pos(ls_domain, ".")
If li_pos = 0 Then
	as_errormsg = "The domain part of the email address must have at least one period!"
	Return False
End If

// check domain for allowed characters
li_max = Len(ls_domain)
For li_idx = 1 To li_max
	li_asc = Asc(Mid(ls_domain, li_idx, 1))
	choose case li_asc
		case 65 to 90
			// Lower case a-z
		case 97 to 122
			// Upper case A-Z
		case 48 to 57
			// Digits 0-9
		case 45
			// Hyphen
		case 46
			// Period
		case else
			as_errormsg = "The domain part of the email address contains invalid characters!"
			Return False
	end choose
Next

// break domain into parts
li_max = of_Parse(ls_domain, ".", ls_domainpart)

If li_max > 127 Then
	as_errormsg = "The domain part of the email address contains too many periods!"
	Return False
End If

For li_idx = 1 To li_max
	If Left(ls_domainpart[li_idx], 1) = "-" Then
		as_errormsg = "The domain part of the email address cannot have a hyphen and a period next to one another!"
		Return False
	End If
	If Right(ls_domainpart[li_idx], 1) = "-" Then
		as_errormsg = "The domain part of the email address cannot have a hyphen and a period next to one another!"
		Return False
	End If
Next

Return True

end function

public subroutine of_settimeout (integer ai_timeout);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetTimeout
//
// PURPOSE:    This function is used to set the timeout used when waiting
//					for a reponse from the server. This is currently only used
//					by TLS or SSL connections.
//
// ARGUMENTS:  ai_timeout - Timeout in seconds.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/21/2014	RolandS		Initial coding
// -----------------------------------------------------------------------------

If ai_Timeout > 10 Then
	ii_Timeout = ai_Timeout
Else
	ii_Timeout = 10
End If

end subroutine

public function double of_performance_start ();// -----------------------------------------------------------------------------
// FUNCTION:	n_smtp.of_Performance_Start
//
// PURPOSE:		This function returns the current value of the
//					operating system's performance counter.
//
// RETURN:		Starting value for performance counter.
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 07/23/2014	RolandS		Initial coding
// -----------------------------------------------------------------------------

Double ldbl_start

QueryPerformanceCounter(ldbl_start)

Return ldbl_start

end function

public function decimal of_performance_stop (double adbl_start);// -----------------------------------------------------------------------------
// FUNCTION:	n_smtp.of_Performance_Stop
//
// PURPOSE:		This function returns the elapsed time since the start of the
//					performance counter.
//
// ARGUMENTS:  adbl_start - The value returned from of_Performance_Start
//
// RETURN:		The elapsed time.
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 07/23/2014	RolandS		Initial coding
// -----------------------------------------------------------------------------

Double ldbl_stop
Decimal{6} ldec_elapsed

// get elapsed time
QueryPerformanceCounter(ldbl_stop)
If idbl_frequency > 0 Then
	ldec_elapsed = (ldbl_stop - adbl_start) / idbl_frequency
End If

Return ldec_elapsed

end function

private function boolean of_sendmsg_crypt (readonly string as_cmd, integer ai_okreturn, ref string as_reply);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_sendmsg_crypt
//
// PURPOSE:    This function is used by other TLS functions to send an
//					encrypted message and receive any reply.
//
// ARGUMENTS:  as_cmd 		- SMTP command to be sent
//					ai_okreturn	- The return code that represents success
//					as_reply		- Return reply by ref
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/21/2010	RolandS		Initial coding
// 07/13/2012	RolandS		Changed to send command in chunks
// 01/19/2013	RolandS		Rewrote 'Recover response' section
// 07/21/2014	RolandS		Changed from 100 tries to elapsed timeout.
// 07/31/2014	RolandS		Changed the error msg to show command.
// 10/13/2014	RolandS		Added as_reply by reference argument
// 10/13/2014	RolandS		Rewrote 'Recover response' section
// -----------------------------------------------------------------------------

Constant Long MAX_BUFFER_LEN = 16000
String ls_msg, ls_Reply, ls_Buffer
Long ll_RetVal, ll_ReplyBytes, ll_SentBytes
Long ll_length, ll_totbytes
Dec{6} ldec_elapsed
Double ldbl_start
Boolean lb_Complete

// log command
If Right(as_cmd, 2) = CRLF Then
	ls_msg = Left(as_cmd, Len(as_cmd) - 2)
Else
	ls_msg = as_cmd
End If
If IsNull(ls_msg) Then
	ls_msg = "<null>"
End If
of_LogFile("C:" + ls_msg)

as_reply = ""

// send command
ll_length = Len(as_cmd)
do while ll_totbytes < ll_length
	ls_buffer = Mid(as_cmd, ll_totbytes + 1, MAX_BUFFER_LEN)
	// push data
	ll_RetVal = cryptPushData(il_session, &
						ls_buffer, Len(ls_buffer), ll_SentBytes)
	If ll_RetVal <> CRYPT_OK Then
		ls_msg = "CryptPushData: " + of_CryptError(ll_RetVal)
		of_SetLastError(ls_msg)
		of_LogError(iERROR, ls_msg)
		Return False
	End If
	If Len(ls_buffer) <> ll_SentBytes Then
		ls_msg = String(ll_SentBytes) + " bytes sent, " + String(Len(ls_buffer)) + " expected."
		of_SetLastError(ls_msg)
		of_LogError(iERROR, ls_msg)
		Return False
	End If
	ll_totbytes = ll_totbytes + ll_SentBytes
	// flush outgoing data
	ll_RetVal = cryptFlushData(il_session)
	If ll_RetVal <> CRYPT_OK Then
		ls_msg = "cryptFlushData: " + of_CryptError(ll_RetVal)
		of_SetLastError(ls_msg)
		of_LogError(iERROR, ls_msg)
		Return False
	End If
	If ll_totbytes < ll_length Then
		SleepMS(10)
	End if
loop

// process server response
do while lb_Complete = false
	// set elapsed time start
	ldbl_start = of_Performance_Start()
	// get server reply
	ls_Buffer = Space(256)
	ll_RetVal = cryptPopData(il_session, ls_Buffer, Len(ls_Buffer), ll_ReplyBytes)
	If ll_RetVal <> CRYPT_OK Then
		ls_msg = "cryptPopData: " + of_CryptError(ll_RetVal)
		of_SetLastError(ls_msg)
		of_LogError(iERROR, ls_msg)
		Return False
	End If
	// get elapsed time
	ldec_elapsed = of_Performance_Stop(ldbl_start)
	// check to see if timeout reached
	If ldec_elapsed > ii_Timeout Then
		ls_msg = "No response from server after " + String(ii_Timeout) + " seconds."
		of_SetLastError(ls_msg)
		of_LogError(iERROR, ls_msg)
		Return False
	End If
	// check the reply to see if complete
	If ll_ReplyBytes > 0 Then
		ls_Reply += Left(ls_Buffer, ll_ReplyBytes)
		If Right(ls_Reply, 2) = CRLF Then
			lb_Complete = True
		End If
	End If
loop

// save reply to by ref arg
as_reply = ls_Reply

// log reply
If Right(ls_Reply, 2) = CRLF Then
	ls_msg = Left(ls_Reply, Len(ls_Reply) - 2)
Else
	ls_msg = ls_Reply
End If
If IsNull(ls_msg) Then
	ls_msg = "<null>"
End If

// check the reply to see if successful
If Integer(Left(ls_Reply, 3)) = ai_OkReturn Then
	// success
	of_LogFile("S:" + ls_msg)
	Return True
Else
	If as_cmd = "QUIT" + CRLF Then
		// treat QUIT errors as success
		of_LogFile("S:" + ls_msg)
		Return True
	Else
		// error
		ls_msg = "Command failed:" + CRLF + CRLF + &
					as_cmd + CRLF + ls_Reply
		of_SetLastError(ls_msg)
		of_LogError(iERROR, ls_msg)
	End If
End If

Return False

end function

private function boolean of_sendmsg (readonly string as_cmd, integer ai_okreturn, ref string as_reply);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SendMsg
//
// PURPOSE:    This function is used by other functions to send a message and
//					receive any reply.
//
// ARGUMENTS:  as_cmd 		- SMTP command to be sent
//					ai_okreturn	- The return code that represents success
//					as_reply		- Return reply by ref
//
// RETURN:     True = Success, False = Failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/08/2010	RolandS		Initial coding
// 10/05/2010	RolandS		Added the ai_okreturn argument
// 10/13/2014	RolandS		Added as_reply by reference argument
// 10/15/2014	RolandS		Changed the logging
// -----------------------------------------------------------------------------

String ls_msg, ls_Reply

// log command
If Right(as_cmd, 2) = CRLF Then
	ls_msg = Left(as_cmd, Len(as_cmd) - 2)
Else
	ls_msg = as_cmd
End If
If IsNull(ls_msg) Then
	ls_msg = "<null>"
End If
of_LogFile("C:" + ls_msg)

as_reply = ""

// send the data
If Not of_Send(iul_socket, as_cmd) Then
	Return False
End If

// receive response
of_Recv(iul_socket, ls_Reply)

as_reply = ls_Reply

// log reply
If Right(ls_Reply, 2) = CRLF Then
	ls_msg = Left(ls_Reply, Len(ls_Reply) - 2)
Else
	ls_msg = ls_Reply
End If
If IsNull(ls_msg) Then
	ls_msg = "<null>"
End If

// check the reply to see if successful
If Integer(Left(ls_Reply, 3)) = ai_OkReturn Then
	// success
	of_LogFile("S:" + ls_msg)
	Return True
Else
	If as_cmd = "QUIT" + CRLF Then
		// treat QUIT errors as success
		of_LogFile("S:" + ls_msg)
		Return True
	Else
		// error
		ls_msg = "Command failed:" + CRLF + CRLF + &
					as_cmd + CRLF + ls_Reply
		of_SetLastError(ls_msg)
		of_LogError(iERROR, ls_msg)
	End If
End If

Return False

end function

public subroutine of_setdebugviewer (boolean ab_flag);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_SetDebugViewer
//
// PURPOSE:    This function is used to turn on SMTP conversation logging
//					that can be seen by the Debug Viewer utility.
//
// ARGUMENTS:  ab_flag		- True/False
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 10/14/2014	RolandS		Initial coding
// -----------------------------------------------------------------------------

ib_DebugViewer = ab_flag

end subroutine

on n_smtp.create
call super::create
end on

on n_smtp.destroy
call super::destroy
end on

event constructor;call super::constructor;// determine the performance counter frequency
QueryPerformanceFrequency(idbl_frequency)

end event

