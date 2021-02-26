/*

0.2
вече не е нужно да е активен прозореца на камерата, но трябва да е видим

v0.1
работи движението и кликването, проблема е че трябва винаги да е активна камерата

*/

#SingleInstance force

IniRead, color1, %A_ScriptDir%\%a_scriptname%.ini, colors, color1
IniRead, color2, %A_ScriptDir%\%a_scriptname%.ini, colors, color2
coordmode pixel screen
coordmode mouse screen

if (color1="empty")
{
  SplashTextOn,220,, 'q' to adjust color under cursor
  winactivate, AMCAP ahk_class #1000
  mousemove, 183, 192
}
c:=0

loop
{
;WinActivate, AMCAP ahk_class #1000
;winmove,AMCAP ahk_class #1000,,0,0
wingetpos, xx, yy, w,h, AMCAP ahk_class #1000 
WinGetActiveStats,a,a,a,ax,ay

PixelSearch, x1, y1, xx-ax+9, yy-ay+50, xx-ax+w-10, yy-ay+h-30, % color1, 70 ,fast ; ako ne e fast zabiva*/
er1:=errorlevel
PixelSearch, x2, y2, xx-ax+9, yy-ay+50, xx-ax+w-10, yy-ay+h-30, % color2, 40 ,fast
er2:=errorlevel
if (er1=0)
{
  If (ax<>0 || ay<>0)
  {
    x1+=ax-90
    y1+=ay-70
  }
  xbeg:=xx-ax+9
  ybeg:=yy-ay+50
  
  xend:=xx-ax+w-10
  yend:=yy-ay+h-30
  
  xx1:=(x1-50) * 1280/(368-80) ; -40 po lesno dostiga leviq krai, -80 po lesno desniq */
  yy1:=(y1-70) * 1024/(366-120) ; -60 gorniq , -100 dolniq */
  
  xx1:=round(xx1)
  yy1:=Round(yy1)
  
  WinGetActiveStats,a,a,a,bx,by
  ;SplashTextOn,, 140,, xbeg=%xbeg% ybeg=%ybeg%`nxend=%xend% yend=%yend%`nxx=%xx% yy=%yy% w=%w% h=%h%`nx1=%x1% y1=%y1%`nx2=%x2% y2=%y2%`n`nxx1=%xx1% yy1=%yy1%
  ;if (bx>0 || by>0)
  ;{
   ; x1-=bx
   ; y1-=by
  ;}
  
  mousemove xx1, yy1
  if (er2=0)
    c++
  if c=10
  {
    click
    c:=0
  }
}
}


q::
winactivate, AMCAP ahk_class #1000
WinWaitActive AMCAP ahk_class #1000
mousemove, 183, 192
sleep 100
PixelGetColor , color1, 183, 192
IniWrite, % color1, %A_ScriptDir%\%a_scriptname%.ini, colors, color1
SplashTextOn,,, cursor color changed
sleep, 500
reload
return

w::
winactivate, AMCAP ahk_class #1000
WinWaitActive AMCAP ahk_class #1000
mousemove, 183, 192
sleep 100
PixelGetColor , color2, 183, 192
IniWrite, % color2, %A_ScriptDir%\%a_scriptname%.ini, colors, color2
SplashTextOn,,, click color changed
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


esc::
;IniWrite, empty, %A_ScriptDir%\%a_scriptname%, colors, color1
ExitApp
