MAX := 4  ;брой различни цветове - действия
loop %MAX%
{
  IniRead, color%a_index%, %A_ScriptDir%\%a_scriptname%, colors, color%a_index%, 0x402363
}

A:
;WinWaitActive, AMCAP ahk_class #1000
;CoordMode pixel Screen
;coordmode mouse Screen

wingetpos, xx, yy, w,h, AMCAP ahk_class #1000  ;взима координатите на активния и на важния прозорц*/
WinGetActiveStats,a,a,a,ax,ay

;mousemove, xx-ax+9, yy-ay+51
;sleep, 500
;mousemove xx-ax+w-10,yy-ay+h-30
sleep, 100

loop %MAX%
{
  PixelSearch,x,y,xx-ax, yy-ay,xx-ax+w,yy-ay+h, % color%a_index%, 10,fast
  if (errorlevel=0)
  {
	SplashTextOn,,, color %a_index% is visible
    MouseMove, x, y
    c:=a_index
    sleep, 300
	;goto A
  }
  SplashTextOff
}
if c=1 
{
IfWinNotExist Windows Media Player
  send !{Numpad5}
}
else if c=2 
{
DetectHiddenWindows on
 IfWinNotExist ahk_class tSkMainForm
 {
  run C:\Program Files\Skype\Phone\Skype.exe
 } else
  WinActivate ahk_class tSkMainForm
}
else if c=3
{
  SendMessage 0x112, 0xF170, 2,,Program Manager
  sleep, 1000
}
else if c=4
{
 ;IfWinNotExist, Untitled1.png - Windows Photo Viewer ahk_class Photo_Lightweight_Viewer
  ;run D:\1 Soft' & doc's\AutoHotKey\my scripts\programa.ahk
 ;WinActivate Untitled1.png - Windows Photo Viewer ahk_class Photo_Lightweight_Viewer
 SendMessage 0x112, 0xF170, -1,,Program Manager
 sleep, 1000
 run C:\Users\d7m\Desktop\4rd.ahk
 sleep, 1000
}


c=0
;sleep, 1000
;winclose ahk_class Photo_Lightweight_Viewer

;WinActivate AMCAP ahk_class #1000
goto A

q::
InputBox, n
PixelGetColor , color%n%, 183, 192
IniWrite, % color%n%, %A_ScriptDir%\%a_scriptname%, colors, color%n%
SplashTextOn,,,color%n% changed
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
id=0xEBACBC 

[colors]
color1=0x48ECF6
color2=0xFCD439
color3=0x3339D8
color4=0x7BBE3F
