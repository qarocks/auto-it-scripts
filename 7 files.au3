WinWaitActive("Open")
Send("C:\Users\Sneha\Desktop\automation files\")
Send("{ENTER}")
Send("{TAB 7}")
Send("{CTRLDOWN}")
Send("{a down}") ;Holds the A key down
    Send("{a up}") ;Releases the A key
	Send("{CTRLUP}")
Send("{ENTER}")
#comments-start
$var="""download_handle"" ""download_handle"" ""IE"" ""IE"" ""Lighthouse.jpg"" ""Oops.jpg"" ""PHPx64"" ""silver_autoit"" ""silver_autoit"" ""silver_autoit_greaterthan25mb"" ""silver_autoit_greaterthan25mb"""
Send($var)
Send("{ENTER}")
#comments-end