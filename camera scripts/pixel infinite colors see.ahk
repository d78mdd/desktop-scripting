

;coordmode pixel, screen		; двата параметъра трябва! да са разделени със запетая






#SingleInstance force
locked=0
xp:=4 		    ;брой пиксели по х */
yp:=4 			;по у */
count:=xp*yp	;oбщо търсени цветове */
loop %count%{
  IniRead, color%A_Index%, %A_ScriptDir%\%a_scriptname%, colors, id%a_index%, 0x402363  
}  

A:
IniRead, locked, %A_ScriptDir%\%a_scriptname%, colors, locked
name=AMCAP ahk_class #1000

;WinWaitActive, % name
coordmode mouse relative
coordmode pixel relative

Loop % count
{
  PixelSearch,s,d,0,0,1280, 1024, % color%A_Index%, 1,fast ; ,368,366
  mousemove, s, d
}
SplashTextOff
if (ErrorLevel=2)
{
    Iniwrite,0, %a_scriptdir%\counter.ahk, Section, state
	sleep, 100
	goto A
}
else if (ErrorLevel=0)
{
	SplashTextOn,,, I SEE YOU !
    
    ;custom actions*/
    ;run %A_ScriptDir%\counter.ahk
    ;Iniwrite,1, C:\Users\d7m\Desktop\counter.ahk, Section, state
    
    ;custom actions*/
    
    
    IniRead locked, %A_ScriptDir%\%a_scriptname%, colors, locked
    if (locked)
    {
     WinClose AMCAP ahk_class #1000
     winwaitclose AMCAP ahk_class #1000
     run C:\Windows\PixArt\Pac207\AmCap.exe
     winwait AMCAP ahk_class #1000
     
     ;send {
   }
    ;sleep, 500
	goto A
}
/*
e::
if (locked)
  locked=0
else if(!locked)
  locked=1
SplashTextOn,,, % locked
IniWrite, % locked, %A_ScriptDir%\%a_scriptname%, colors, locked
sleep, 500
return
*/

q::				; change color with that at the center
;MouseGetPos, x, y
WinActivate % name
x:=177
y:=186
mousemove, x,y
by:=y
cn:=0
loop % xp
{
  x+=3
  y:=by
  loop % yp
  {
	cnt++
	y+=3
    PixelGetColor , color%cnt%, x, y
    IniWrite, % color%cnt%, %A_ScriptDir%\%a_scriptname%, colors, id%cnt% 
  }
}
mousemove ,x,y
SplashTextOn,,,color%cnt% changed
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
id1=0x12121F
id2=0x0B1426
id3=0x181F24
id4=0x052A33
id5=0x3E3E45
id6=0x001C1E
id7=0x00212D
id8=0x0B242C
id9=0x214849
id10=0x14454A
id11=0x003037
id12=0x052A33
id13=0x2F4C4B
id14=0x00403E
id15=0x0B4453
id16=0x00333C
locked=0
