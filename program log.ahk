﻿
/*
17.08.21
add tray menu items for?
- open log folder
- open current log file
- open "start of last large gap"
  - if current log has after 00:00 open it
  - else open previous log
  

20.nov.17
it seems it doesnt log the desktop


include debug
proper pausing
pause
new os ver algorythm - better compatibility

imeto na vseki fail e cqlata data, a vyv faila ne zapisva dati


записва и операционната с-ма в която съм
tray tip
;малко различен начин на работа - 10 пъти в секундата проверява заглавието на активния прозорец
  вече записва и отделните страници на прозореца на браузъра (Google Chrome)
;SetTitleMatchMode 2 за да се презарежда и в scite4autohotkey

;goto _A вместо reload - иначе играеше като активирам лентата със Start-a
;appskey & g

;(1.3:)
;a kogato timer restings raboti (demek mene me nqma) prez dosta pove4e vreme
;prez N sekundi se reloadva 6toto prozorci kato google chrome si menqt sydyrjanieto ponqkoga no zaglavieto ne

;1.2:
;zapisva i klasa na prozoreca

;v1.1:
;singleinstance ignore


; идея - да добавя брояч на всяко записано приложение/заглавие/клас
*/


#persistent
#singleinstance force

SplitPath, A_ScriptFullPath , , ,  , var

StringTrimRight, dir, a_scriptdir, 22

SetTitleMatchMode 2
path=E:\1_stuff\window logs\

menu, tray, tip, active window logging`n%title%

Menu, Tray, NoStandard

menu, tray, add, EditScript

menu, tray, add, LogDir
menu, tray, add, CurrentLog
menu, tray, add, PreviousLog
menu, tray, add, Last2Logs

Menu, Tray, Default, 5&
Menu, Tray, Click, 1

_A:

winwaitactive a
WinGetActiveTitle, title
WinGetClass, class, % title 

StringTrimLeft, os, ALLUSERSPROFILE, 3
StringLeft, os, os, 3

if (os = "Doc" ) ; Documents and Settings\All Users
  os:="winxp"
else if(os = "Pro" ) ; ProgramData
  os:="win7/2008"
else
  os:="uknown"

fileappend, %a_hour%:%a_min%:%a_sec% %os% - %title% [%class%] `n, % path a_dd "." a_mm "." a_yyyy ".txt"

Loop
{
  sleep, 100
  WinGetActiveTitle, ntitle
  if (ntitle<>title)
    goto _A
}

MsgBox I just went outside the loop (program log)

~^s:: 
SetTitleMatchMode 2
IfWinActive, %A_ScriptName% 
{ 
  SplashTextOn,,,Updated %A_Scriptname%
  Sleep, 500 
  SplashTextOff 
  Reload 
}
return

~^r::reload


LogDir:
  Run, % path
return

CurrentLog:
  Run,  % path a_dd "." a_mm "." a_yyyy ".txt"
return

PreviousLog:
  Run,  % path a_dd-1 "." a_mm "." a_yyyy ".txt"
return

Last2Logs:
  Run,  % path a_dd "." a_mm "." a_yyyy ".txt"
  Run,  % path a_dd-1 "." a_mm "." a_yyyy ".txt"
return

EditScript:
  run "C:\Program Files\AutoHotkey\SciTE\SciTE.exe" "C:\Users\test\Documents\Downloads\desktop-scripting\program log.ahk"
return
