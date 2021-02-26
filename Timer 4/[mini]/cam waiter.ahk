#SingleInstance force
#Persistent
;#notrayicon

IfWinNotExist, AMCAP ahk_class #1000
  run C:\Windows\PixArt\Pac207\AmCap.exe
winwait, AMCAP ahk_class #1000
IfWinNotActive, AMCAP ahk_class #1000
  WinActivate, AMCAP ahk_class #1000

sleep, 1000

Loop
{
  SplashTextOff
  see=false
  IfWinActive, AMCAP ahk_class #1000
  {
    PixelSearch, x, y, 10, 50, 300, 300, 0x2a0016, , fast
    if !errorlevel
      see=true
  }
  
  if see=true
  {
	run %a_scriptdir%\mini t.ahk
    DetectHiddenWindows on
    winclose, AMCAP ahk_class #1000
    WinWaitClose, AMCAP ahk_class #1000
    winclose, %a_scriptdir%\waiter.ahk ahk_class AutoHotkey
    winwaitclose, %a_scriptdir%\waiter.ahk ahk_class AutoHotkey
	exitapp
  }
}


