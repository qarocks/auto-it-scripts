;---------------------------------------------------------
;
;----------------------------------------------------------

; set the select mode to select using substring
AutoItSetOption("WinTitleMatchMode","2")
 
if $CmdLine[0] < 2 then
 ; Arguments are not enough
 msgbox(0,"Error","Supply all the Arguments, Dialog title,Save/Cancel and Path to save(optional)")
 Exit
EndIf

; wait until dialog box appears
WinWait($CmdLine[1]) ; match the window with substring
$title = WinGetTitle($CmdLine[1]) ; retrives whole window title
WinActive($title);

; if user choose to save file
If (StringCompare($CmdLine[2],"Save",0) = 0) Then

 WinActivate($title)
 WinWaitActive($title)
 Sleep(1)

 ; If firefox is set the save the file on some specific location without asking user.
 ;Save the File
 ;send("{TAB}")
 Send("{ENTER}")
 if ( StringCompare(WinGetTitle("[active]"),$title,0) = 0 ) Then
  WinActivate($title)
  send("{TAB}")
  Send("{ENTER}")
 EndIf

 ;if firefox is set to prompt user for save path.
 if WinExists("Enter name") Then
  $title = WinGetTitle("Enter name")
  if($CmdLine[0] = 2) Then
  ; If user hasn't provided path to save
  ;save to default path.
  WinActivate($title)
  ControlClick($title,"","Button2")

  Else
  ; If user has provided path 
  ;Set path and save file
  WinActivate($title)
  WinWaitActive($title)
  ControlSetText($title,"","Edit1",$CmdLine[3])
  ControlClick($title,"","Button2")
  EndIf

 Else
  ;Firefox is configured to save file at specific location
  Exit
 EndIf

EndIf
; do not save the file
If (StringCompare($CmdLine[2],"Cancel",0) = 0) Then
 WinWaitActive($title)
 Send("{ESCAPE}")
EndIf