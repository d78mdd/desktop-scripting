/*
minimizer.ahk
new os ver algorythm - better compatibility

;ne smeni rejima na skaip

;в уин7 Отново не ми го смени но излезе от акаунта и всичко останало

поправена 'грешка' за ХР - вече не активира предваритално десктопа за skype to sms

1.7:
unpause WMP
активира десктопа за skype to sms - докато не се увери че е активен , сега би трябвало винаги да сменя режима на скайп
щe ме уведомява когато няма да изключва, за сега не се е случило
липсващите запетаи на coordmode също е възможно да са пречели да не се смени режима на скайп
за ХР - при излизане изключва екрана и блокира входа (освен ctrl alt del)
съвместимост с ХР - излиза от акаунта с отделна ф-я
ако е ХР изобщо не се опитва да изключва скайп (и да излиза от акаунта)
изчаквания между извикванията на ф-иите, може би така няма да пропуска действия
връща нивото на звука както си е било преди
по-дълго изчаква старт-а
затваря onenote
;ako skaip ne se vijda ne bi trqbvalo da mu izvyr6va deistviqta 
;ne vinagi dava pause na wmp - би трябвало да е оправено

;1.6:
;в sound off - паузира WMP чрез горещия главиш в 8in1
;sound_off() - mute-va zvucite
;f-q lock account , koqto defakto nqma smisyl da se izpylnqva ako skype to sms 6te raboti
;skype (i onenote) se izklu4vat samo ako "Дени" ne sy6testvuva
;bygva se - ne otvarq starta , moje bi kato s sms-ite - da zaciklq dokato ne go otvori
;sy6to i ne smenq6e rejima na skype
; bi trqbvo da sa opraveni i dvete
;функция изключваща onenote, skype
;всички действия на клавиатурата на един ред
;ingenious and simple - чака кой да е прозорец да е активен за да се самоизключи ,"а"

;1.4:
;рестартира монитора за да му активира Auto функцията за наместване - scr-re.ahk

;1.3:
;преди да блокира мишката и клавиатурата (без ctrl+alt+del) заключва акаунта (без да изключва/затваря нищо)

;1.2:
;ingenious - чака лентата да стане активна и се самоизключва ,"ahk_class Shell_TrayWnd"

*/

#persistent
blockinput, on
setkeydelay, 50

;sv= ; sound volume

;StringLeft, root, SystemRoot, 1  ; system root e [bukva]:\Windows(WINDOWS)

#Include %A_ScriptDir%\minimizer.ahk


StringTrimLeft, os, ALLUSERSPROFILE, 3
StringLeft, os, os, 3
;MsgBox % os
if (os = "Doc" )
  os:="winxp"
else if(os = "Pro" )
  os:="win7/2008"
else
{
  os:="uknown"
  MsgBox nerazpoznata sistema, ne moga da zaklu4a ekrana
  ExitApp
}

  
settitlematchmode, 2
  
ifwinnotexist, Дени
{
  sleep, 100
  ;sound_off()
  sleep, 100  
  prep_for_screen_off()
  
  
  sleep, 100
  if (os = "win7/2008" )
    lock_account_7()
  else if (os = "winxp" )
    lock_account_xp()
  else
    MsgBox Error during lock_account
  sleep, 100
  
  
  
} else {
  SplashTextOn,,, Window "Дени" exists
  sleep, 2000
}

sound_off()
{
global
  soundget, sv
  
  WinGetPos,,, w, h, Windows Media Player
  if (w=230 && h=65)
    PostMessage, 0x111, 84344, 0, , ahk_class WMPlayerApp
  else
    PostMessage, 0x111, 84344, 0, , ahk_class WMP Skin Host     ; pause WMP
  soundset 0
}

prep_for_screen_off()
{

 ;-----onenote------
  winclose ahk_class Framework::CFrame
  
 if (os = "win7/2008" )  ; ako e v 7-cata
 {
  C: 
  sleep 100
  MouseMove, A_ScreenWidth, A_ScreenHeight
  click

  winwaitactive, ahk_class WorkerW,,0.5
  if (errorlevel)
   goto C
 }

/*
 ;------skype-------
  if (root="C")  ; ako e C zna4i e 7 ako e E zna4i e XP-to*/
  {
    coordmode mouse, screen
    coordmode pixel, screen

    path=D:\1 Soft' & doc's\AutoHotKey\my scripts\workdir\skype icon.png

    imagesearch ,x,y, 0, 0, A_ScreenWidth, A_ScreenHeight, %path%

    if (errorlevel = 2) {
      msgbox, Fatal error skype icon
    } else if (errorlevel = 1)
    {
        return
    } else
    {
      mousemove x+5, y+5
      click right
      sleep, 90
      send {down}{right}{down}{enter}
      sleep, 90
    } 
    
  }
;return
*/
}


lock_account_7()
{
global
A:
  MsgBox lock 7
;sleep, 90

blockinput on

send {lwin}

winwaitactive, Start menu,,0.5 ; 0.1
if errorlevel
  goto A

send {right 2}{down 3}{enter}
sleep, 900

SendMessage 0x112, 0xF170, 2,,Program Manager ; send the monitor into off mode
sleep, 800

winwaitactive a ; account has been unlocked*/

SoundSet, % sv

WinGetPos,,, w, h, Windows Media Player
if (w=230 && h=65)
  PostMessage, 0x111, 84344, 0, , ahk_class WMPlayerApp
else
  PostMessage, 0x111, 84344, 0, , ahk_class WMP Skin Host     ; unpause WMP

run D:\1 Soft' & doc's\AutoHotKey\my scripts\scr-re.ahk
}

lock_account_xp()
{
  b:
  BlockInput on
  send {lwin}
  winwaitactive, Start Menu ahk_class DV2ControlHost,,0.5
  if errorlevel
    goto b
  send l
  winwaitactive, ahk_class #32770
  send s
  
  sleep, 900
  SendMessage 0x112, 0xF170, 2,,Program Manager ; send the monitor into off mode
  sleep, 800
  winwaitactive a ; account has been unlocked*/
  ;run D:\1 Soft' & doc's\AutoHotKey\my scripts\Timer 4\scr-re.ahk
}

exitapp

!x::
StringTrimRight, dir, a_scriptdir, 8
run %dir%\close all running skripts.ahk

return

