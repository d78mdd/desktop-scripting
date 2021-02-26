/*
вече не зарежда уторент със стартиране на уиндоус
runwait sk off , run utorrent
skype off
zatvarq "hidden text"

стартира waiter
0.1
скрива "скритите" файлове
пробва се да затваря onenote без да го активира

пуска timer restings, skype to sms
затваря Timer4, deni catcher, (8in1[includes]), MS Onenote
*/

#SingleInstance ignore
;#NoTrayIcon

WinMinimize, ahk_class SciTEWindow

StringTrimRight, dir, a_scriptdir, 8


DetectHiddenWindows, On 
SetTitleMatchMode, 2

;send !q

w:
winclose, Hidden text: ahk_class #32770
winclose, Microsoft OneNote
ifwinexist Microsoft OneNote
{
  WinWaitClose Microsoft OneNote,,0.5
  if errorlevel
  {
    winactivate, Microsoft OneNote
    goto w
  }
}


ifwinexist %A_ScriptDir%\trtt 4.ahk ahk_class AutoHotkey
{
  ;check1:=1
  run %A_ScriptDir%\timer restings.ahk
}
/*
if (ert<>"E:")
  ifwinexist ahk_class tSkMainForm
    run D:\1 Soft' & doc's\AutoHotKey\my scripts\skype to sms\skype to sms.ahk
*/
;winclose, D:\1 Soft' & doc's\AutoHotKey\my scripts\deni catcher.ahk ahk_class AutoHotkey

winclose, %A_ScriptDir%\trtt 4.ahk ahk_class AutoHotkey
WinWaitClose, %a_scriptdir%\trtt 4.ahk ahk_class AutoHotkey

winclose, %a_scriptdir%\[mini]\mini t.ahk ahk_class AutoHotkey
WinWaitClose, %a_scriptdir%\[mini]\mini t.ahk ahk_class AutoHotkey


run %a_scriptdir%\[mini]\waiter 2in1.ahk
winwait, %a_scriptdir%\[mini]\waiter 2in1.ahk

;runwait, D:\1 Soft' & doc's\AutoHotKey\my scripts\skype on off\try skype offline 2.ahk

/*if (check1=1)
IfWinNotExist, µTorrent
  run, %PROGRAMFILES%\µTorrent\uTorrent.exe
*/

run %dir%\skype sms\skype message.ahk



exitapp