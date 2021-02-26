/*
0.2 2in1
ако има някой пред камерата отключва мишката
ако се задвижи мишката се включва монитора и мини таймера
0.1
ако има активност стартира мини таймера
*/
;waiter 2in1

;ako raboti ozna4ava 4e nqma nikoi

#SingleInstance force
#Persistent
;;#notrayicon

StringTrimRight, dir, a_scriptdir, 7  ; D:\1 Soft' & dox\AutoHotKey\my scripts\Timer 4
s=off
;ControlSetText, static1, % (A_TimeIdle/1000) " nobody here", g1



sleep, 2000  ; ot tova zavisi kolko deistviq (vreme) mogat da se izvyrat avtomati4no vednaga 6tom nqma nikoi



Loop 
{
  ;IfWinNotExist, %dir%\timer restings.ahk ahk_class AutoHotkey
  
  if (a_timeidle<1 && s="off")
  {
    s=on
    run %a_scriptdir%\mini t.ahk
	exitapp
  }
}