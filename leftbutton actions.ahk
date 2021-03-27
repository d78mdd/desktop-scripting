/*
action 8
%dir%

ON ve4e s dlbclk zaradi eventualen incident
vsy6tnost  && x1l>=10) zaradi ON
deistvie 4 (111) - && x1l!=0) 6toto ottam se startira taimera
fixed fullscreen chrome tab click restore window
ve4e pri restore s mi6kata ne se bygva X-a
na 75red lipsva6e 3-to =
0.2:
trans ve4e ne bi trqbvalo da mu pre4i (vednyj proraboti)

0.1:
ve4e proverqva kyde sym pusnal mi6kata - ako e nadale4e ne zatvarq prozoreca
pleyra ponqkoga sam si puska pesenta 6toto tuka mnogo prezarejdam skriptovete i se izpylnqva 4astta tab6.. ot s1
prov. za povt. se prom.
*/


~LButton::
/*  moje bi taka 6te e po-dobre:
coordmode, mouse, relative
mousegetpos, xRel, yRel

coordmode, mouse, screen
mousegetpos, xScr, yScr
i posle samo gi izpolzvam
*/ 


; action 8 - razlistvane na kartinki s klik, orazmerqvane

IfWinActive, ahk_class ShImgVw:CPreviewWnd
{
  coordmode, mouse, screen
  MouseGetPos, x, y
  if x>1000
    send {right}
  else if x<200
    send {left}
  else
  {
    if (pic<>"big") ; ako e small ili neinicializirano
    {
      send ^a  ; actual size/big
      pic:="big"
    }
    else
    {
      send ^b  ; fit
      pic:="small"
    }
    MouseMove, x+1, y, 0
    MouseMove, x, y, 0
  }
}



;  deistvie 5 - maksimalna/normalna viso4ina (y)

coordmode, mouse, relative  
MouseGetPos, xmax, ymax 
; works for y
if (A_TimeSincePriorHotkey<300 && A_PriorHotkey=A_ThisHotkey) ; double click
{
  if(ymax<4)
  {
	wingetpos, ,winy, ,winh, a
	if(winy!=0 && winh!=1000)
	{
	  winyold:=winy
	  winhold:=winh
      winmove, a, ,, 0,,1000	
    return
    }
	if(winy=0 && winh>900) ; winh=1000)
    {
	  winmove, a,,,winyold,,winhold
      return
    }
    return
  }
return
}




IfWinExist, Windows Media Player ahk_class WMPlayerApp  ;;; deistvie 3 ; zatvarqne na WMP
{
  coordmode, mouse, screen
  MouseGetPos, x, y, win
  WinGetTitle, title, ahk_id %win%
  
  WinGetPos, xxx, yyy,ww,hh, % title
  if (title="Windows Media Player")
  if ((x > xxx+(ww-50)) && (x < xxx+(ww-9)) && (y > yyy+1) && (y < yyy+17))
  {
    winmove, % title,,xxx-100,yyy+100
    keywait, lbutton, up
    winmove, % title,,xxx,yyy
    sleep, 100
    
    winset, Trans, off, Windows Media Player ahk_class WMPlayerApp
    runwait %dir%\wmp_try\w onexit.ahk
    WinWaitClose D:\1 Soft' & doc's\AutoHotKey\my scripts\wmp_try\w onexit.ahk ahk_class AutoHotkey
    winset, trans, 225, Windows Media Player ahk_class WMPlayerApp
  }
}
 ; za6to nqma return ? ne e li problem ?



coordmode, mouse, screen  ;;; deistvie 1 ; zabilo start meniu
MouseGetPos, x, y
IfWinNotActive, ahk_class VMUIFrame
if (x<=95 && y>=996)
{
	WinWaitActive, Start Menu ahk_class DV2ControlHost,,0.4 ; 0.6
    if (errorlevel)
		send {rwin}
}




;;;deistvie 2 ; onenote   (2-click start ; da ama ne)

;coordmode, mouse, screen
;mousegetpos, x, y
twin:=dir . "\Timer 4\trtt 4.ahk ahk_class AutoHotkey" 
mwin:=dir . "\Timer 4\[mini]\mini t.ahk ahk_class AutoHotkey"

If (WinExist(twin) && !winexist(mwin))  
;if (a_timesincepriorhotkey<300 && a_priorhotkey=a_thishotkey)
{
  if (x>=1 && x<10 && y=0)
  {   
   IfWinNotExist, ahk_class Framework::CFrame
    {
      run %dir%\code v1\decoder.ahk
      winwait, ahk_class Framework::CFrame
    }
    IfWinNotActive, ahk_class Framework::CFrame
      WinActivate, ahk_class Framework::CFrame
    winmove, ahk_class Framework::CFrame,,239, 343, 956, 631
    reload
  }
}



/*

IfWinActive, Toolbars ahk_class BaseBar  ;;;deistvie 4 maksimizirane s provla4vane
	return
coordmode, mouse, screen
MouseGetPos, x1l, y1l, winl
WinGetPos, ,,wl,hl, ahk_id %winl%
if (y1l=0 && wl=1288 && hl=1002 && x2l<1176 && x1l<1176 && x1l>=10)
{
  coordmode, pixel, screen
  IfWinActive, ahk_class Chrome_WidgetWin_1
  {
    PixelGetColor, chromecolor, x1l, y1l
    if (chromecolor!="0xDE9463")
      return
  }
 	SetBatchLines -1 

  ;        ; opit za bezdeistvie ako prosto sym kliknal na edno mqsto bez dvijeniq
  ;Loop{
  ;  mousegetpos, x11l, y11l
  ;  if (x1l!=x11l and y1l!=y11l)
  ;    break
  ;}
  ;winmove, a,,,y1l-4
  
  
	BlockInput, on
	SetMouseDelay, 0
	SetDefaultMouseSpeed, 0
	;MouseGetPos, x3l, y3l
	WinRestore, ahk_id %winl%
    ;restoreX:=
    ;winmove, ahk_id %winl%,, , -10
    sleep, 150
	send {lbutton down}
	BlockInput, off
	SetBatchLines, 10ms
	KeyWait, lbutton, up
	return
}
KeyWait, lbutton, up
mousegetpos, x2l, y2l
if (y1l>0 && y2l=0)
{
	WinMaximize, ahk_id %winl%
	return
}

*/



;deistvie 6 try
/*
coordmode, mouse screen
mousegetpos, x, y
if (x=0 && y=0) ; && !(WinExist("D:\1 Soft & doc's\AutoHotKey\myscripts\Timer 4\[mini]\mini t.ahk")))
  ;controlsend, , {f6}, D:\1 Soft & doc's\AutoHotKey\myscripts\Timer 4\trtt.ahk ahk_class AutoHotkey
  send {F7}  ; no action
;return
*/



; action 7  - reload s click-vaneto v/u butona

IfWinActive, ahk_class SciTEWindow
{
  coordmode, mouse, relative
  mousegetpos, x, y
  
  if x between 58 and 80    ;  koordinati v ramkite
   if y between 52 and 71   ;  na butona
  {
    WinGetActiveTitle, t
    
    StringGetPos, pos, t, .ahk 

    StringMid, t, t, 0, % (pos+4)  ; moje i bez %
    ;MsgBox % t
    ;  IfEqual,F2,Reload , PostMessage,0x111,65400,0,,% "ahk_id" AList%F1%
    
    winget, ahklist, list, ahk_class AutoHotkey
    loop %ahklist% {
      id := ahklist%a_index%
      WinGetTitle, title, ahk_id %id%
      ;MsgBox %title%`n%id%
    }
      ;MsgBox % t
      if (t<>"s1.ahk")  ; ina4e go startira nqkolko pyti ;d
      PostMessage, 0x111, 65400, 0,, % t
  reload
  return
  }

}

/*
IfWinActive, ahk_class SciTEWindow
{
  coordmode, mouse, relative
  mousegetpos, x, y
  ;MsgBox %x% %y%
  if x between 58 and 80
   if y between 52 and 71
  {
    goto _save
  }
  
  return
}
*/


return   ; mai trqbva da ima return tuk 6toto v hotkeys to4no sled nego e inkludnato i rbutton, koito zatvarq trtt, i tozi otiva da izpylnqva negoviq kod
;autoreload on click at Save Button coordinates