/*
0.3
сууууупер - вече може да е активен кой да е прозорец без абсолютно никакви разлики!

0.2
вече не е нужно (частично) да е активен прозореца на камерата, но трябва да е видим

v0.1
работи движението и кликването, проблема е че трябва винаги да е активна камерата

*/
#SingleInstance force

IfWinNotExist AMCAP ahk_class #1000
  run C:\Windows\PixArt\Pac207\AmCap.exe
winwait AMCAP ahk_class #1000
ifwinnotactive AMCAP ahk_class #1000
  winactivate AMCAP ahk_class #1000
WinWaitActive AMCAP ahk_class #1000
winmove AMCAP ahk_class #1000, , 0, 0

coordmode mouse relative
coordmode pixel relative
send {alt}{right 2}{down 4}{enter}
winwaitactive Properties ahk_class #32770
sleep, 200
send {right}
pixelgetcolor, p, 304, 372
if p=0x000000
{
  mousemove, 304, 372
  click
}
PixelGetColor, p, 35, 88
if p=0xFFFFFF
{
 mousemove, 35, 88
 click
}
mousemove, 305, 318
click
PixelGetColor, p, 305, 318
if p=0x000000
{
  sleep, 500
  click
}
send {enter}


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
/*
428 615
3 399
7 372
*/
if (er1=0)
{
/*
ako kvadrata e na koordinata -300 kursora trqbva da e na poziciq -300
-200  ->  0
  100-300
-100  -> 300
  200-600
0  -> 600
  300-900
;0  ->  1280-300
100  ->  900
200  ->  1200
1200 e = na (200+300) * syotno6enieto -300
       = (koordinata+poziciq na proz) * syotn - poziciq na proz
*/

sx:= 1280/(368-80) ; syotno6enie
sy:= 1024/(366-120)

xx1:= ( x1-50 + ax ) * sx - ax
yy1:= ( y1-70 + ay ) * sy - ay



  
  ; x е по-голям , у е по-малък
  
  /*
  xbeg:=xx-ax+9
  ybeg:=yy-ay+50
  
  xend:=xx-ax+w-10
  yend:=yy-ay+h-30
  */
  
  ;xx1:=(x1-50) * 1280/(368-80) ; -40 po lesno dostiga leviq krai, -80 po lesno desniq */
  ;yy1:=(y1-70) * 1024/(366-120) ; -60 gorniq , -100 dolniq */
  
  xx1:=round(xx1)
  yy1:=Round(yy1)
  
  ;WinGetActiveStats,a,a,a,bx,by
  
  ;SplashTextOn,, 200,, xbeg=%xbeg% ybeg=%ybeg%`nxend=%xend% yend=%yend%`n`nxx=%xx% yy=%yy% w=%w% h=%h%`nax=%ax% ay=%ay%`n`nx1=%x1% y1=%y1%`nx2=%x2% y2=%y2%`n`nxx1=%xx1% yy1=%yy1%
  
  ;if (bx>0 || by>0)
  ;{
   ; x1-=bx
   ; y1-=by
  ;}
  /*
  gorniq lqv ygyl:
  v kamerata xx:0 yy:0
    x1:9 y1:51
  v drug prozorec ax:427 ay:203
    x1:-418 y1:-152
  */
  mousemove xx1, yy1
  SplashTextOn,,, % xx1 " " yy1
  if (er2=0)
    c++
  if c=10
  {
    ;click
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
