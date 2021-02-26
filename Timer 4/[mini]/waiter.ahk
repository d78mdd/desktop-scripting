/* 
ако има активност стартира мини таймера
*/

#SingleInstance force
#Persistent
;#notrayicon

;
;SendMessage 0x112, 0xF170, 2,,Program Manager ; off
sleep, 1000
SplashTextOn,,, monitor off
sleep, 500
SplashTextOff

s=off
sleep, 1000
Loop
{
  if (a_timeidle<1 && s="off")
  {
    s=on
    run %a_scriptdir%\mini t.ahk
    DetectHiddenWindows, on
    winclose, AMCAP ahk_class #1000
    WinWaitClose, AMCAP ahk_class #1000
    winclose, %a_scriptdir%\cam waiter.ahk ahk_class AutoHotkey
    WinWaitClose, %a_scriptdir%\cam waiter.ahk ahk_class AutoHotkey
	exitapp
  }
} 
  
;esc::ExitApp