#SingleInstance force
;OnExit, _exit

; (mai samo gamata trqbva da se uveli4ava malko)

;rabotiii - na tykmo v staqta, pri 40% qrkost na gsm-a


IniRead, color1, %A_ScriptDir%\%a_scriptname%, colors, color1
IniRead, color2, %A_ScriptDir%\%a_scriptname%, colors, color2

if (color1="empty" || color2="empty")
{
  SplashTextOn,220,, 'q' and 'w' to adjust colors under cursor
  winactivate, AMCAP ahk_class #1000
  mousemove, 183, 192
}

A:
WinWaitActive, ManiaPlanet ahk_class ManiaPlanet
wingetpos, xx, yy, w,h, AMCAP ahk_class #1000 
WinGetActiveStats,a,a,a,ax,ay

;setkeydelay , ,30

  A3:
  PixelSearch, x1, y1, xx-ax+9, yy-ay+50, xx-ax+w-10, yy-ay+h-30, % color1, 100,fast
  er1:=ErrorLevel
  
  ;if (errorlevel<>0)
  ;goto A3
  A4:
  PixelSearch, x2, y2, xx-ax+9, yy-ay+50, xx-ax+w-10, yy-ay+h-30, % color2, 100,fast
  er2:=ErrorLevel
  ;if (errorlevel<>0)
  ;goto A4
  
  if (er1<>0 && er2<>0)
    goto A3
  if (er1<>0 || er2<>0)
    send {enter}
  
  c:=y1-y2   ; maksimum 64*/
  t:=(abs(c))*5
   
   
  sy:=y1-(y1-y2)/2  ; sredata na
  sx:=x1-(x1-x2)/2  ; dvete kvadrat4eta
  a:= 5* (100 - (sy+213))  ; 1.5*
  ;if (a)
  ;SplashTextOn,,, % a
  d:=a*7
  ;msgbox % a ; ot60 do -213 demek 270
  
  if (a<0)
  {
    d:=abs(d)
    SetKeyDelay,, % d ; deceleraion, zabavqne
    send {down}
    ;SplashTextOn ,,, % d
  
  }else if (a>0) {
    SetKeyDelay,, % a ; acceleraion, uskorenie
    send {Up}
  }
  
  
  SetKeyDelay,,% t ;turn, zavoi
  if (c="")
    goto A
  ;if (abs(c)<20)
    ;goto A
  if (c>0)
    send {LEFT}     ;  zavoi nalqvo  
  else if (c<0)
    send {RIGHT}    ;  zavoi nadqsno

 
goto A

w::
winactivate, AMCAP ahk_class #1000
WinWaitActive AMCAP ahk_class #1000
sleep, 100
mousemove, 183, 192
PixelGetColor, color1, 183, 192
IniWrite, % color1, %A_ScriptDir%\%a_scriptname%, colors, color1
sleep, 100
winactivate, ahk_class ManiaPlanet
sleep, 100
SplashTextOn,,,right color changed
sleep, 500
reload
return

q::
winactivate, AMCAP ahk_class #1000
WinWaitActive AMCAP ahk_class #1000
sleep 100
PixelGetColor , color2, 183, 192
IniWrite, % color2, %A_ScriptDir%\%a_scriptname%, colors, color2
sleep 100
winactivate, ahk_class ManiaPlanet
sleep, 100
SplashTextOn,,,Left color changed
sleep, 500
reload
return

~^s::
SetTitleMatchMode 2

IfWinActive, %A_ScriptName% 
{ 
  SplashTextOn,,,Updated %A_Scriptname%, 
  Sleep, 500 
  SplashTextOff 
  Reload 
}

;_exit:
;IniWrite, empty, %A_ScriptDir%\%a_scriptname%, colors, color1
;IniWrite, empty, %A_ScriptDir%\%a_scriptname%, colors, color2

esc::
IniWrite, empty, %A_ScriptDir%\%a_scriptname%, colors, color1
IniWrite, empty, %A_ScriptDir%\%a_scriptname%, colors, color2
ExitApp
/*
[colors]


color1=empty
color2=empty
