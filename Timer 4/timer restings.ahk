/*
F7::run %a_scriptdir%\F7.ahk

ako waiter2v1 ne e aktiven izpra6ta broq sekundi na g1
dir, better compatibility

!x close all running skripts
double click icon to start timer
53 red - s1.ahk


;(pri nqkakvi obstoqtelstva ponqkoga moje da zapisva po4ivkaERROR v nov den vmesto stariq)

 (po nqkakva pri4ina po4ivkite zapo4na da gi zapisva ot 5-tata natatyk)
 (по някаква друга причина спря да ги записва след 7-мата - 20.4 и 21.4)
 би трябвало да са поправени

ползва отделния файл F6
(ако ОС е ХР включва горещия клавиш F6)

0.9:
не записва нулева почивка, щото се бъгва след това timer пък и няма смисъл
на [06/юни/2012] по някаква причина записа само 2 почивки
 поправенo - копнах 'ф-ята' after от timer с разликата вместо goto continue - return, стария код беше недодялан
съвместимост и с ХР-то - lowercase за mmm и Y_Date
вмъкнати функциите на timer auto adjust вместо include-нат
tray menus - start, open file
не затваря skype to sms и не стартира timer
;затваря skype to sms

;0.8:
;s f6 se izklu4va i puska timer
;0.7:
;добавих tray tip показващ от колко време е включен скрипта (почти в реално време)
;0.6:
;ако няма данни за този ден първата почивка е нулева
;използва вградената променлива за path
;0.5:
;махнах автоматичното презареждане при сейфане
;0.4:
;include auto adjust; read intervals(), after() - записва почивките по същата логика както timer престоите
;0.3:
;zatvarq se samo 4rez F6 prez 8in1
;onexit
;0.2:
;esc vmesto F6 za da moje skype to sms da go zatvori
*/

#singleinstance ignore
;#notrayicon


StringTrimRight, dir, a_scriptdir, 8   ; D:\1 Soft' & dox\AutoHotKey\my scripts

DetectHiddenWindows on
hotkey, F6, , on
ifWinExist, %dir%\always on\s1.ahk ; 8in1[includes]
  hotkey, F6, , off

StringLower, mmm, a_mmm

menu, tray, add
menu, tray, add, open_file
menu, tray, add, start

menu, tray, default, start

onexit, _exit

path=%a_scriptdir%\file.ini

startdate=% a_dd


all:=0    ;ob6to vreme prestoi v minuti
c:=R
p_all:=0  ;ob6to vreme po4ivki v minuti

read_intervals()
{
 ;--------- проверка за данни -----------
 global
  IniRead, R, % path, %startdate%/%mmm%/%a_yyyy%, брой престои
  if R=ERROR
  {
    ;SplashTextOn, , , Няма данни
    return ; exitapp
  }
  p_error:=0

  loop % R
  {
   IniRead, r%a_index%, % path, %startdate%/%mmm%/%a_yyyy%, престой%A_Index%
   IniRead, p%a_index%, % path, %startdate%/%mmm%/%a_yyyy%, почивка%A_Index%
   p%A_Index%+=0
   
   if p%a_index% <> ERROR
     p_all+=p%a_index%	; avtomati4no iz4istva bukvite i ostavq samo cifrite
   else ; ako e ERROR
     p_error++
   
   minstartpos:=instr(r%a_index%, "минут")
   extract_times(a_index)
   
   all+=min%a_index%  ; abe vsy6tnost sy6toto kato "ob6to vreme" ama v minuti i ne s takava to4nost
  }
  p_all/=60
}
extract_times(a)
{
 global
 ;-------- izvli4ane na 4asove i minuti --------
   ifinstring, r%a%, час			
   {
    endpos=6
    stringmid, hour%a%, r%a%, 1, endpos
    StringTrimright, hour%a%, hour%a%, 4
    stringmid, min%a% ,r%a%,  minstartpos-3, minstartpos  ; izvli4ane na minuti
    StringTrimRight, min%a%, min%a%,6			  ; ot red s 4asove

    min%a% += hour%a% * 60

			;r%a% si ostava nepokytnato

 ;-------- bi trqbvalo da e izvli4ane samo na minuti;-------- 
   } else {  
    startpos:= instr(r%a%, "=" ) + 1
    lenght:= instr(r%a%, "от" ) - startpos
    StringMid, r%a%, r%a%, % startpos , % lenght
    StringTrimRight, r%a%, r%a%,1
    stringmid, min%a%, r%a%, 1, minstartpos - 2

    if min%a%=
    {
      min%a%:=0  ; st-st po podrazbirane ako prestoq e po-malyk ot 59sek
      c--		   ; ne se vzima pod vnimanie takyv prestoi
    }
   }
}


after()		; pomaga kysnite prestoi da bydat zapisani v denq koito trqbva
{
if R=ERROR					; deistviq ako nqma danni
{
  ;msgbox за днес няма данни следователно`nили току що пускаш компа`nили седиш след 00:00ч

  Y_Date := A_Now				            ;
  Y_Date += -1, d				            ;vzemane na
  FormatTime, Y_Date, %Y_Date%, dd/MMM/yyyy	;v4era6nata data

  IniRead, R, % path, % Y_Date, брой престои	    ;
  IniRead, y_l_h, % path, % Y_Date, престой%R%	    ;pro4itame v4era6niq posleden prestoi

    StringTrimRight, y_l_h, y_l_h, 20			    ;ot celiq red
    StringMid, y_l_h, y_l_h, StrLen(y_l_h) , 5, L	;izrqzva
    StringTrimRight, y_l_h, y_l_h, 3			    ;samiq 4as (krainiq)	

    y_l_h+=0						                ;
                                                    ;
 ;otstoqnie na dne6niq sprqmo 00			        ;
   if a_hour>=0 ; %% a_hour<6)				        ;
     tpos := a_hour + 0		;'today positive'	    ;
 ;otstoqnie na v4era6niq 4as sprqmo 00			    ;presmqtane na razlikata
   if (y_l_h<24 && y_l_h>12)	;4as predi 00:00 	;ot
   {							                    ;posledniq v4era6en prestoi
     yest := 24 - y_l_h		;'yesterday'		    ;do
     dif := tpos + yest					            ;sega:
   } else if (y_l_h >=0 && y_l_h<12) ;4as sled 00	;ravna e na [dif] chasa
   {							                    ;
     yest := y_l_h					                ;
     dif := tpos - yest					            ;
   } else msgbox грешка при пресмятане на разликата	;

  if dif >= 6 ; - > в нов ден
  {
    return
  } else if dif < 6 ; - > към стария ден
  {
    stringmid, Y_Date, Y_Date, 1, 2
    iniwrite, % Y_Date, %path%, current time, startdate		;vyv faila zapisva v4era6nata
    startdate:=Y_Date						                ;i v koda q zadava
  }
}

}

read_intervals()
after()





r=0
loop
{
 ti:=round(r/60)
 
 tip=resting for %ti% mins now
 menu, tray, tip, %tip%
 IfWinNotExist, D:\1 Soft' & dox\AutoHotKey\my scripts\Timer 4\[mini]\mini t.ahk
   ControlSetText, static1, inactive %r%, g1
 
 sleep 1000
 r++
}


F7::run %a_scriptdir%\F7.ahk


F6::run %a_scriptdir%\F6.ahk

!x::run %dir%\close all running skripts.ahk

start:
run %A_ScriptDir%\trtt 4.ahk

_exit:

iniread, n, %path%, %startdate%/%mmm%/%a_yyyy%, брой престои
if (n="ERROR")
 goto ex
IniWrite, %r% сек , % path, %startdate%/%mmm%/%a_yyyy%, почивка%n%

ex:
exitapp
return

open_file:
run notepad %a_scriptdir%\file.ini
return
