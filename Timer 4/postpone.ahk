/*
-вариант удължаване на времето без изключване
ограничен списъка с изключения
всичко ifwinexist
;a_scriptdir
;aktivira screen off.ahk samo ako "Дени" ne sy6testvuva
;v1.1
;delay screen off
;kogato natisna F7 me pita za delay.. pri vsi4ki slu4ai, a ne trqbva - 
;popraveno - 'if sleeper' otdelno ot 'if 'bummer'

*/

SetTitleMatchMode, 2





;---list of windows to have delays------
;groupadd, exeptions, Известяване ; prozoreca na skaip kogato nqkoi mi poiska palnomo6tno
detecthiddenwindows, on

groupadd, exeptions, UNDISPUTED
groupadd, exeptions2, D:\1 Soft' & doc's\AutoHotKey\my scripts\v dub.ahk ahk_class AutoHotkey


groupadd, exeptions, Chess - Google Chrome
groupadd, exeptions, International - Google Chrome
groupadd, exeptions, Trine 2
;groupadd, exeptions, postpone.ahk - Notepad
;groupadd, exeptions, TrackMania
groupadd, exeptions, Djagi 
;groupadd, exeptions, trtt 3.ahk - Notepad
;groupadd, exeptions, ahk_class TConversationForm
groupadd, exeptions, Дени
groupadd, exeptions, Митко
groupadd, exeptions, conQUIZtador
;------------------------


IfWinExist ahk_group exeptions
  bummer=unblock
ifwinexist ahk_group exeptions2
  bummer=unblock

postpone:=20 	;kolko sekundi da iz4akva

if (sleeper="yes")
{

  if (bummer<>"unblock")
    postpone:=1
  else ;if (bummer="unblock")
  {
    ; /* вариант само запитване и изключване въпреки всичко:*/
    blockinput, off
    MsgBox, 4, 4с за отговор , Изчакване с %postpone% секунди?, 5
    IfMsgBox Yes
      pstp:=postpone
    else
      postpone:=1
    
    
    /*
    ; вариант удължаване на времето без изключване :*/
    iniread, num, %path%, current time, num
    inputbox, num, Удължаване с Х минути, number of minutes,, 150, 100,,,,, %num%
    
    iniwrite, %num%, %path%, current time, num
    iniwrite, y, %path%, current time, ch
    ch=y
  
    suspend on	;
    k=pause	    ;  send {F6} ne raboti
    goto _calc	;
    */

  }

  if postpone >= 2
    loop % postpone
    {
     SplashTextOn, , ,off after %pstp% seconds...
     Sleep, 1000
     pstp--
    }
  blockinput, on
  SplashTextOn, , , off
;#include D:\1 Soft' & doc's\AutoHotKey\my scripts\Timer 3\sound warning.ahk


  ifwinnotexist Дени
    run %a_scriptdir%\screen off.ahk
  Sleep, 500
  SplashTextOff

}

;esc::exitapp kogato tozi red e  aktiven nastypva haos ;d