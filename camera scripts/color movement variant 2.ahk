#SingleInstance force

IniRead, color, %A_ScriptDir%\%a_scriptname%, colors, color, 0x402363

wingetpos, xx, yy, w,h, AMCAP ahk_class #1000  ;взима координатите на активния и на важния прозорц*/
WinGetActiveStats,a,a,a,ax,ay

A:

wingetpos, xx, yy, w,h, AMCAP ahk_class #1000 
WinGetActiveStats,a,a,a,ax,ay

setkeydelay , ,30

ifwinactive AMCAP ahk_class #1000
  PixelSearch,x,y,10, 50, w-20, h-80, % color, 20,fast
else
  PixelSearch,x,y,xx-ax+9, yy-ay+50, xx-ax+w-10, yy-ay+h-30, % color, 30,fast

if (errorlevel=0)
{
  MouseMove, x, y
  ;send {up 3}*/
  center:= ( xx-ax+w-10 - xx-ax+9 ) /2
  
  t:=abs(x-center)
  SetKeyDelay,,% t
  
  if (x<center)
    send {right}
  else if (x>center)
    send {left}
} else 
 
 
SplashTextOff
goto A


q::		; change color with that under the mouse cursor*/
MouseGetPos, x, y
;CoordMode pixel relative*/
PixelGetColor , color, 183, 192
IniWrite, % color, %A_ScriptDir%\%a_scriptname%, colors, color 
SplashTextOn,,,color changed
sleep, 500
reload


~^s::
SetTitleMatchMode 2
IfWinActive, %A_ScriptName% 
{ 
  SplashTextOn,,,Updated %A_Scriptname%, 
  Sleep, 500 
  SplashTextOff 
  Reload 
}
esc::ExitApp
/*
[colors]
color1=0x48ECF6
color=0xD27F34
