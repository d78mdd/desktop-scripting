/*

0.4
aawwesoome - ���� �� ����� - ����� �� ���� ����� ������ �� �� �������� ��������� �� ����� �� �� �����
��� �������� �������� �� ������ �� �������� �� ��������� ������� (����� ������)
0.3
��������� - ���� ���� �� � ������� ��� �� � �������� ��� ��������� ������� �������!

0.2
���� �� � ����� (��������) �� � ������� ��������� �� ��������, �� ������ �� � �����

v0.1
������ ���������� � ����������, �������� � �� ������ ������ �� � ������� ��������


kartinkata trqbva da e po-golqma
*/


;coordmode pixel, screen		; ����� ���������� ������! �� �� ��������� ��� �������




#SingleInstance force

IfWinNotExist AMCAP ahk_class #1000
{
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
  sleep, 300
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
}

IniRead, color1, %A_ScriptDir%\%a_scriptname%.ini, colors, color1
IniRead, color2, %A_ScriptDir%\%a_scriptname%.ini, colors, color2
coordmode pixel screen
coordmode mouse screen

c:=0

loop
{
 wingetpos, xx, yy, w,h, AMCAP ahk_class #1000 
 WinGetActiveStats,a,a,a,ax,ay
  ; ako ne e fast zabiva*/
 PixelSearch, x1, y1, xx-ax+9, yy-ay+50, xx-ax+w-10, yy-ay+h-30, % color1, 19 ,fast 
 er1:=errorlevel
 PixelSearch, x2, y2, xx-ax+9, yy-ay+50, xx-ax+w-10, yy-ay+h-30, % color2, 22 ,fast
 er2:=errorlevel

 if (er1=0)
 {
   sx:= 1280/(368-100) ; syotno6enie
   sy:= 1024/(366-120)

   xx1:= ( x1-50 + ax ) * sx - ax
   yy1:= ( y1-70 + ay ) * sy - ay
  
   xx1:=round(xx1)
   yy1:=Round(yy1)
  
   mousemove xx1, yy1
  
   if (er2=0)
   {
    c++
    if c>5
      click down
   } else
    if (c<5 && c>0)
    {
      click
      c:=0
    } else
    {
      click up
      c:=0
    }
 }
 
 ;~ if (!(WinActive("Program Manager ahk_class Progman")) && !(WinActive("AMCAP ahk_class #1000")))
   ;~ if (ax<w && ay<h)
     ;~ winmove, a,,w, ay
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


esc::ExitApp
