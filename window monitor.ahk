#Persistent
#SingleInstance, force
DetectHiddenWindows, on
SetTitleMatchMode, 2


while ( true )
{
	WinClose, Microsoft Office Activation Wizard ahk_class NUIDialog
	;~ process, close, NVDisplay.Container.exe
	;~ WinClose, ,NVIDIA Control Panel is not found
	Winclose, Please purchase WinRAR license ahk_class #32770 ahk_exe WinRAR.exe
	winclose, WinRAR 5.71 Expired Notification ahk_class RarReminder ahk_exe WinRAR.exe
	sleep, 200
}