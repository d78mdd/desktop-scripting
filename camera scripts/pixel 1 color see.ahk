#SingleInstance force
IniRead, color, %A_ScriptDir%\%a_scriptname%, color, id, 0x402363
A:
name=AMCAP ahk_class #1000

;WinWaitActive, % name
;SplashTextOn,,,searching
;sleep, 500
PixelSearch,s,d,0,0,368,366, % color, ,fast
mousemove, s, d
SplashTextOff
if (errorlevel=2)
{
	;sleep, 100
	goto A
}
else if (errorlevel=1)
{
	MsgBox fatal error
	ExitApp
}
else
{
	SplashTextOn,,, I SEE YOU !
    ;sleep, 300
	goto A
}

q::		; change color with that under the mouse cursor
MouseGetPos, x, y
;CoordMode pixel relative
PixelGetColor , color, 183, 192
IniWrite, % color, %A_ScriptDir%\%a_scriptname%, color, id 
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
[color]
id=0x0D2D37 
*/
