

;coordmode pixel, screen		; двата параметъра трябва! да са разделени със запетая




IfWinNotExist, AMCAP ahk_class #1000
	run C:\Windows\PixArt\Pac207\AmCap.exe
WinActivate AMCAP ahk_class #1000
send !{PrintScreen}
run msPaint
WinWaitActive, ahk_class MSPaintApp


send {alt}hz2re
WinWaitActive Resize and Skew ahk_class #32770
send {right}{tab}3{enter}
send ^v
SetKeyDelay 0
send {up 110}{left 100} ; {up 60}{left 48}
setkeydelay default

CoordMode mouse relative
mousemove, 385, 522

click
sleep, 100
MouseClickDrag, L, 385, 522, 185, 311
;exitapp
send ^s
WinWaitActive, Save As ahk_class #32770
sleep, 1000
SetKeyDelay, 200
send %A_ScriptDir%\scrshot {enter}
sleep,1000
WinWaitNotActive, Save As ahk_class #32770

sleep, 100
ifwinactive, Confirm Save As ahk_class #32770
  send {left}{enter}
WinWaitnotActive Confirm Save As ahk_class #32770  

winclose, ahk_class MSPaintApp

;WinActivate, AMCAP ahk_class #1000
CoordMode pixel relative
screen=on
Loop
{
  WinWaitActive AMCAP ahk_class #1000
  ImageSearch,,,0,0,370,370, *90 %A_ScriptDir%\scrshot.png ; 370,370
  ;SplashTextOn,,, % errorlevel
  if (errorlevel=0)
  {  
    
    if screen<>off
      ;if a_timeidle>1000
        SendMessage 0x112, 0xF170, 2,,Program Manager   ; screen off
    screen=off
	
    ;SplashTextOn,,, no movement
  }
  else if (errorlevel=1)
  {
    
    if screen<>on
     SendMessage 0x112, 0xF170, -1,,Program Manager     ; screen on
    screen=on
    
    sleep, 1000
    if a_timeidle <1000
      reload
    
    ;SplashTextOn,,, Movement !
  }
  sleep, 1000
  if a_index=50
	reload
  ;sleep, 100
}


ExitApp
esc::exitapp