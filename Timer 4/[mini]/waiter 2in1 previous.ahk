/*
0.2 2in1
ако има някой пред камерата отключва мишката
ако се задвижи мишката се включва монитора и мини таймера
0.1
ако има активност стартира мини таймера
*/
;waiter 2in1

;ako raboti ozna4ava 4e nqma nikoi

#SingleInstance force
#Persistent
;;#notrayicon

    ;SplashTextOn,,, nqma nikoi
    ;sleep, 2000
    ;SplashTextOff



sleep, 1000
;SendMessage 0x112, 0xF170, 2,,Program Manager ; off
;;SplashTextOn,,, monitor off
;;sleep, 500
;;SplashTextOff

;IfWinNotExist, AMCAP ahk_class #1000
;  run C:\Windows\PixArt\Pac207\AmCap.exe
;winwait, AMCAP ahk_class #1000
;IfWinNotActive, AMCAP ahk_class #1000
;  WinActivate, AMCAP ahk_class #1000

s=off
sleep, 1000
Loop
{
  ;ControlSetText, static1, % (A_TimeIdle/1000) " nobody here", g1
  
  ;CoordMode, mouse, screen
  ;mousegetpos,x, y
  ;if (x>1263 && y>986)
  ;  mousemove 640, 512
  ;sleep, 501
  
  ;see=false
  /*IfWinActive, AMCAP ahk_class #1000
  {
	coordmode, pixel, relative
    PixelSearch, x, y, 10, 50, 356, 333, 0x2a0016, , fast
    if !errorlevel
    {
      see=true
      BlockInput off
    }
    else
      BlockInput, on
  }
  */
  if (a_timeidle<1 && s="off") ; && see="true")
  {
    s=on
    run %a_scriptdir%\mini t.ahk
    ;;DetectHiddenWindows, on
    ;winclose, AMCAP ahk_class #1000
    ;WinWaitClose, AMCAP ahk_class #1000
    ;SplashTextOn,,, exiting %a_scriptname%
    ;sleep, 1000
	exitapp
  }

} 

