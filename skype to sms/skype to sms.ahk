;ne raboti kogato win7 smeni na neprozra4na tema
;i ponqkoi i drug proizvolen pyt pak ne raboti;
;za 4 syob6teniq ne raboti

; ima i drug variant kato ne stava - pixelsearch 

/* versioning

доста разширих обсега за търсене

сложих липсващи запетайки на coordmode
ako desktopa ne e aktiven si go aktivira

1.8
изключих грешката изцяло - изглежда сега работи
loop 5  за да няма повече грешката 125
изключих F6::
през 30сек търси съобщение в продължение на 5сек 10 пъти в секундата
и я търси в различни 'вариации' - *2 и *10
активира десктопа , иначе не вижда иконката на скайп

извадих първия клик извън ф-ята fc
добавен tray tip с обикновен надпис
около 109 ред - unblock input, exit application

1.7:
би трябвало да работи винаги - отваря прозореца със съобщенията по друг начин
  смяната на темата не му пречи

;bez esc 6toto timer restings se izklu4va 4rez winclose v 8in1
;send {F6} {esc} - izklu4va timer restings
;skrolva do dolu - poslednoto saob6tenie

;1.6:
;(a da , i ve4e si raboti s bygavoto smenqne na temata na win7-cata...)
;samo 1 klik v/u pyrvata kartinka, no:
;otdelna promenliva 'y1 :=y-50' za6toto v sledva6ta iteraciq na cikyla 'y' se promenq
;izli6no e klikaneto vstrani;klika dva pyti vmesto da izvikva dva pyti funkciqta
;break
;minimizira prozoreca
;continue
;s F6 izliza i puska taimera

;1.2:
;ne tyrsi vtorata kartinka a klika sys zakysnenie
;pyrvata kartinka e otdelena vyv funkciq
;pyrviq klik e druga funkciq izvikvana ot pyrvata

;1.1:
;include vmesto run
;(dva pyti klika pyrvata kartinka)
;vtorata i tretata kartinki sy6to se tyrsqt neprekysnato dokato ne se pokajat

;v1.0:
;4aka da byde polu4eno syob6tenie, otvarq prozoreca i kopira syob6tenieto
;v klipborda - cqloto posledno syob6tenie
*/


;(ne raboti !?!?!?!?)

;skype message to sms using sms.ahk


#singleinstance ignore

setmousedelay, 5
path=D:\1 Soft' & doc's\AutoHotKey\my scripts\skype to sms\new message.png

coordmode mouse, screen
coordmode pixel, screen

/* naspis s klavi6ite
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  	; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Font, s20 									; Set a large font size (32-point).
Gui, Add, Text, vMyText cLime, 9990 9190 		; XX & YY serve to auto-size the window.
WinSet, TransColor, %CustomColor% 150				; Make all pixels of this color transparent and make the text itself translucent (150)

GuiControl,, MyText, waiting for skype messasge`nesc to close`nwin+p to pause
Gui, Show, x0 y400 NoActivate  						; NoActivate avoids deactivating the currently active window.
*/


clicks()
{
 sleep 100
 MouseMove, A_ScreenWidth, A_ScreenHeight
 click
}

;winwaitactive, ahk_class WorkerW,,0.5
;if (errorlevel)
;  clicks()

fc()
;sleep, 100

fc()
{
 global
loop
{
 loop 50
 {
  imagesearch ,x,y, -100, -100, 2000, 2000, *2 %path%  ;  978, 959

  if (errorlevel = 2) {
    msgbox, Fatal error new message 67
    exitapp
  } else if (errorlevel = 1)
  {
    tip=checking for skype message every 30 seconds
    menu, tray, tip, % tip
    sleep, 100 
  }
  else
  {
    fb()
    return
  }
 }
sleep, 30000 ; 12000 ;3000 1010 ; hah na 30 000 ne se smenq temata na win7 
}
}


fb(){
global
y1:=y-50

Loop
{
  ifwinnotactive, ahk_class tSkMainForm
  {
    blockinput on
    run C:\Program Files\Skype\Phone\Skype.exe
    WinWait ahk_class tSkMainForm,,2
    WinActivate ahk_class tSkMainForm
    WinWaitActive, ahk_class tSkMainForm,,2
    sleep, 1000
  }else return
}
}
  coordmode mouse, relative
  mousemove, 385, 139
  click
  blockinput off


coordmode pixel, relative

loop 5
{
path=D:\1 Soft' & doc's\AutoHotKey\my scripts\skype to sms\new message (2).png
sleep, 1000
imagesearch ,x,y, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %path%
if (errorlevel = 2) {
  msgbox, Fatal error 113
  ExitApp
} else if (errorlevel = 1)
{
  path=D:\1 Soft' & doc's\AutoHotKey\my scripts\skype to sms\new message (1).png
  imagesearch ,x,y, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %path%
  if (errorlevel = 2) {
    msgbox, Fatal error 120
    ExitApp
  } else if (errorlevel = 1)
  {
    BlockInput off
    ;msgbox, Ne se vijda 125
    ;exitapp
  }
}
}
 
mousemove x+5, y+5
Click 2

CoordMode mouse, screen
CoordMode pixel, screen

winwaitactive ahk_class TConversationForm
sleep, 300

path=D:\1 Soft' & doc's\AutoHotKey\my scripts\skype to sms\smile.png

loop
{
  imagesearch ,x,y, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %path%

  if (errorlevel = 2) {
    msgbox, Fatal error smile 146
    exitapp
  } else if (errorlevel = 1)
    continue
  else
    break
  sleep,400
}

sleep,100
blockinput on
mousemove x+340, y-20
sleep,50

click
sleep, 50
send ^{end}
sleep, 50

click right
sleep, 50
send {down 2}{enter}
clipwait,,1
sleep, 50

send {F2}
sleep, 50
blockinput off
#include D:\1 Soft' & doc's\AutoHotKey\my scripts\skype to sms\sms.ahk

reload

;F6::
;send {F6} ; {esc}

esc::
exitapp

~^s::
settitlematchmode 2
IfWinActive, %A_ScriptName% 
{ 
  SplashTextOn,,,Updated %A_Scriptname%
  Sleep, 500 
  SplashTextOff 
  Reload 
}
return

#p::Pause

