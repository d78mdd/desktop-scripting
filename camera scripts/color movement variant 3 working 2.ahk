#SingleInstance force

IniRead, color1, %A_ScriptDir%\%a_scriptname%, colors, color1, 0x402363
IniRead, color2, %A_ScriptDir%\%a_scriptname%, colors, color2, 0x402363

A:

wingetpos, xx, yy, w,h, AMCAP ahk_class #1000 
WinGetActiveStats,a,a,a,ax,ay

setkeydelay , ,30
/*
ifwinactive AMCAP ahk_class #1000
{
  A1:
  PixelSearch, x1, y1, 10, 50, w-20, h-80, % color1, 100,fast
  ;MsgBox % x1 " " y1
  if (errorlevel<>0)
  goto A1
  A2:
  PixelSearch, x2, y2, 10, 50, w-20, h-80, % color2, 100,fast
  ;MsgBox % x2 " " y2
  if (errorlevel<>0)
  goto A2
}

else
*/

  A3:
  PixelSearch, x1, y1, xx-ax+9, yy-ay+50, xx-ax+w-10, yy-ay+h-30, % color1, 50,fast
  if (errorlevel<>0)
  goto A3
  A4:
  PixelSearch, x2, y2, xx-ax+9, yy-ay+50, xx-ax+w-10, yy-ay+h-30, % color2,50,fast
  if (errorlevel<>0)
  goto A4


;{
 ; MouseMove, x1, y1
 ; sleep, 10
 ; MouseMove, x2, y2
 ; sleep, 10
  
  
  c:=y1-y2   ; maksimum 64*/
  t:=(abs(c))*5
   SetKeyDelay,,% t ;turn, zavoi
   
  sy:=y1-(y1-y2)/2  ; sredata na
  sx:=x1-(x1-x2)/2  ; dvete kvadrat4eta
  
  ;a:=sy...
  
  SetKeyDelay,, % a ; acceleraion, uskorenie
  
 
  if (c="")
    goto A
  ;if (abs(c)<20)
    ;goto A
  if (c>0)
    send {LEFT}
  else if (c<0)
    send {RIGHT}
  else
    SplashTextOff
;} 


 
goto A


q::
mousemove, 183, 192
PixelGetColor, color1, 183, 192
IniWrite, % color1, %A_ScriptDir%\%a_scriptname%, colors, color1
SplashTextOn,,,color1 changed
sleep, 500
reload

w::
PixelGetColor , color2, 183, 192
IniWrite, % color2, %A_ScriptDir%\%a_scriptname%, colors, color2
SplashTextOn,,,color2 changed
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

color1=0xFFA516
color2=0x433AE0
