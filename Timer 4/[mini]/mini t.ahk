/*
promenliva 'prep' za po lesna promqna na vremeto
commented 48 moved it out on 16
double click icon to start timer
run F7.ahk
инфо 1 час вместо 40мин
coordmode, mouse, screen липсваше

мини таймер който еднократно съобщава за 40мин ако някой друг седи на компа
осигурява бързо стартиране на Таймера с мишката
*/

;naro4no zadvijva mi6kata

#SingleInstance, ignore
;#NoTrayIcon

onexit, _close
;ako raboti ozna4ava 4e ima nqkoi

StringTrimRight, f6dir, a_scriptdir, 6

menu, tray, add, item, label
menu, tray, default, item
StringTrimRight, outputvar, a_scriptdir, 6

goto l

label:
  run %outputvar%F6.ahk
return

l:

DetectHiddenWindows, on
winclose, %a_scriptdir%\waiter.ahk ahk_class AutoHotkey
winclose, %a_scriptdir%\cam waiter.ahk ahk_class AutoHotkey
;SendMessage 0x112, 0xF170, -1,,Program Manager ; on



i:=0
loop
{
	sleep, 1000
	i++
	ControlSetText, static1, ot %i% sekundi, g1
	
	
	prep:=40  ; prepory4itelno vreme
	
	;if (i=60*60) ; 40*60 ; sled x minuti (aktivnost) se obajda
	if (i=prep*60) ; sled 'prep' minuti (aktivnost) se obajda
	{
		;MsgBox, 4096, инфо 1 час, препоръчвам ви кратка почивка от компютърното устройство
		MsgBox, 4096, инфо %prep% минути, препоръчвам ви кратка почивка от компютърното устройство
		;StringTrimRight, outputvar, a_scriptdir, 6
		run %outputvar%F7.ahk
		exitapp
	}
	;idle se izmerva v hilqdni
	if (a_timeidle>1000*60) ; sled 1 minuta neaktivnost se zatvarq i zapisva 
	{
		MouseGetPos, x, y
		mousemove, x+10, y
		mousemove, x-10, y
		run %a_scriptdir%\waiter 2in1.ahk
		ExitApp
	}
}

~lbutton::
coordmode, mouse, screen
MouseGetPos, x, y
if (x=0 && y=0)
{
   run %f6dir%F6.ahk
   exitapp
}	
return

_close:
ControlSetText, Static8,  , g1

if i>2
  IniWrite, %i% seconds, %a_scriptdir%\log.ini, %a_now%, i

exitapp
