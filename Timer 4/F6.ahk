/*
close skype msg, send sms

runwait sk off , close utorrent
skype on
затваря мини таймера и waiter

пуска Timer4, 8in1[includes]
затваря skype to sms, timer restings
*/
;#NoTrayIcon
DetectHiddenWindows, On
SetTitleMatchMode, 2

StringTrimRight, dir, a_scriptdir, 8

winclose, %dir%\skype sms\send sms.ahk ahk_class AutoHotkey
winclose, %dir%\skype sms\skype message.ahk ahk_class AutoHotkey

minit:=a_scriptdir . "\[mini]\mini t.ahk ahk_class AutoHotkey"
while(winexist(minit))
 winclose, %a_scriptdir%\[mini]\mini t.ahk ahk_class AutoHotkey
 
;winclose, %a_scriptdir%\[mini]\waiter.ahk ahk_class AutoHotkey
;winclose, %a_scriptdir%\[mini]\cam waiter.ahk ahk_class AutoHotkey
winclose, %a_scriptdir%\[mini]\waiter 2in1.ahk ahk_class AutoHotkey
;winclose, AMCAP ahk_class #1000

;winclose D:\1 Soft' & doc's\AutoHotKey\my scripts\skype to sms\skype to sms.ahk ahk_class AutoHotkey
WinClose, %A_ScriptDir%\timer restings.ahk ahk_class AutoHotkey

run %a_scriptdir%\trtt 4.ahk

;runwait, D:\1 Soft' & doc's\AutoHotKey\my scripts\skype on off\try skype online 2.ahk

WinWait, %A_ScriptDir%\trtt 4.ahk ahk_class AutoHotkey
;run D:\1 Soft' & doc's\AutoHotKey\my scripts\8in1[includes].ahk


;winclose, µTorrent

;process, close, uTorrent.exe


exitapp