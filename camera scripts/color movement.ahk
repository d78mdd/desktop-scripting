#SingleInstance force

IniRead, color, %A_ScriptDir%\%a_scriptname%, colors, color, 0x402363
px=0
wingetpos, xx, yy, w,h, AMCAP ahk_class #1000  ;взима координатите на активния и на важния прозорц*/
WinGetActiveStats,a,a,a,ax,ay

A:

;if px=0
  ;px:=x

wingetpos, xx, yy, w,h, AMCAP ahk_class #1000  ;взима координатите на активния и на важния прозорц*/
WinGetActiveStats,a,a,a,ax,ay

setkeydelay , ,30

ifwinactive AMCAP ahk_class #1000
  PixelSearch,x,y,10, 50,w-20,h-80, % color, 20,fast
else
  PixelSearch,x,y,xx-ax+9, yy-ay+50, xx-ax+w-10, yy-ay+h-30 , % color, 20,fast

if (errorlevel=0)
{
  MouseMove, x, y
  ;send {up 3}
 ; SplashTextOn,,, %py% %y%
 
  a:=abs(x-px)
  if (a<10)
    goto A
  else if (a>50)
    a=10
  a/=10
  if a<2
    a:=1
  if (x<px)
    ;SplashTextOn,,,UP
   loop %a%
    send {right 2}
  else if (x>px)
    ;SplashTextOn,,,DOWN
   loop %a%
    send {left 2}
                                                        
  px:=x
  ;sleep, 300
  ;goto A
} else 
  ;send {up up}
SplashTextOff
goto A



q::		; change color with that under the mouse cursor
MouseGetPos, x, y
;CoordMode pixel relative
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
