IniRead, color1, %A_ScriptDir%\%a_scriptname%, colors, id1, 0x402363
IniRead, color2, %A_ScriptDir%\%a_scriptname%, colors, id2, 0x402363
A:
name=AMCAP ahk_class #1000

WinWaitActive, % name
;SplashTextOn,,,searching
;sleep, 500
SetBatchLines, -1

PixelSearch,s1,d1,0,0,368,366, % color1, ,fast
er1:=% ErrorLevel

;mousemove, s1, d1

PixelSearch,s2,d2,0,0,368,366, % color2, ,fast
er2:=% ErrorLevel

;mousemove, s2, d2

;MsgBox % er2
SplashTextOff
if (er1=2 || er2=2)
{
	;sleep, 100
	goto A
}
else if (er1=0 && er2=0)
{
	SplashTextOn,,, I SEE YOU !
    ;sleep, 200
	goto A
}

q::		; change color with that under the mouse cursor
MouseGetPos, x, y
;CoordMode pixel relative
PixelGetColor , color1, x, y
IniWrite, % color1, %A_ScriptDir%\%a_scriptname%, colors, id1 
SplashTextOn,,,color1 changed
sleep, 700
reload

w::		; change color with that under the mouse cursor
MouseGetPos, x, y
;CoordMode pixel relative
PixelGetColor , color2, x, y
IniWrite, % color2, %A_ScriptDir%\%a_scriptname%, colors, id2 
SplashTextOn,,,color2 changed
sleep, 700
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
[color]
id=0x3C233B 

[colors]
id1=0x009C86
id2=0xD3FFFF
