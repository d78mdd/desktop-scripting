/*
natiska avtomati4no F6 i F7
*/

#singleinstance force

IfWinNotExist, AMCAP ahk_class #1000
	run C:\Windows\PixArt\Pac207\AmCap.exe
WinActivate AMCAP ahk_class #1000
WinWaitActive AMCAP ahk_class #1000
sleep 500
send !{PrintScreen}
run msPaint
WinWaitActive, ahk_class MSPaintApp
send {alt}hz2re
WinWaitActive Resize and Skew ahk_class #32770
send {right}{tab}3{enter}
send ^v
SetKeyDelay 0
send {up 110}{left 100}
setkeydelay default
CoordMode mouse relative
mousemove, 385, 522
click
sleep, 100
MouseClickDrag, L, 385, 522, 185, 311
;exitapp
send ^s
WinWaitActive, Save As ahk_class #32770
send scrshot {enter}
WinWaitNotActive, Save As ahk_class #32770

sleep, 100
ifwinactive, Confirm Save As ahk_class #32770
  send {left}{enter}
WinWaitnotActive Confirm Save As ahk_class #32770  

winclose, ahk_class MSPaintApp

;WinActivate, AMCAP ahk_class #1000
DetectHiddenWindows, On 
CoordMode pixel relative
screen=on
Loop
{
  sleep, 1000
  SplashTextOff
  WinWaitActive AMCAP ahk_class #1000
  
  ImageSearch,,,0,0,370,370, *90 C:\Users\d7m\Desktop\scrshot.png ; 370,370
  IniRead, state, % A_ScriptFullPath, screen, state
  ;SplashTextOn,,, % errorlevel
  
  if (errorlevel=0) ; ако няма движение (намира изображението - картината е същата) */
  {  
    
    if a_timeidle>2000
    {
      if (state<>off)
      {
        send {F7}
        WinWaitClose, D:\1 Soft' & doc's\AutoHotKey\my scripts\Timer 4\trtt 4.ahk ahk_class AutoHotkey
        ;SendMessage 0x112, 0xF170, 2,,Program Manager   ; screen off */
        IniWrite, off, % A_ScriptFullPath, screen, state
	    ;SplashTextOn,,, no movement
      }
    } else if (a_timeidle<=1000)
      {
        ;SplashTextOn,,, Movement !
        ;; screen on */
        IniWrite, on, % A_ScriptFullPath, screen, state
        
        ifwinnotexist D:\1 Soft' & doc's\AutoHotKey\my scripts\Timer 4\trtt 4.ahk ahk_class AutoHotkey
          send {F6}
      }
  }
  else if (errorlevel=1) ; ако има движение */
  {
    
    if (state<>on)
     ;SendMessage 0x112, 0xF170, -1,,Program Manager     ; screen on
     
     
    ;screen=on */
    
    ;sleep, 1000*/
    ;if a_timeidle <1000*/
      ;reload*/
    
    ;SplashTextOn,,, Movement !
    IniWrite, on, % A_ScriptFullPath, screen, state
    
    ifwinnotexist D:\1 Soft' & doc's\AutoHotKey\my scripts\Timer 4\trtt 4.ahk ahk_class AutoHotkey
      send {F6}
  }
  if a_index=50
	reload
  ;sleep, 100*/
}


ExitApp
esc::
winclose, ahk_class MSPaintApp
exitapp


~^s::
SetTitleMatchMode 2
IfWinActive, %A_ScriptName% 
{ 
  SplashTextOn,,,Updated %A_Scriptname%, 
  Sleep, 500 
  SplashTextOff 
  Reload 
}
/*
[screen]
state=on
