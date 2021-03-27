/*ver

добавих липсващи запетайки на coordmode

цифрички на редовете за грешка
поправено - не се виждаше текста на съобщенията за грешка
;title match mode 2 - anywhere
;winwaitactive samo "Google Chrome" - za6toto ne vinagi e to4no igoogle - google chrome

;1.4:
;dobaven o6te 1 'prozorec' za svobodni deistviq pri nepredvideni slu4ai - blockinput off, on
;continue, blockinput
;startira nov prozorec samo ako nqma otvorena nikakva stranica
;zatvarq stranicata
;pyrvata sy6to s loop
;izpolzva direkten link, chrome si pomni imeto i parolata, skripta samo klika 'vhod'
;iz4isteni - tyrseneto na kartinkite i klikaneto
;2-rata kartinka q tyrsi s loop
;ima6e sleep 2sec nakraq ?
;po-malko 4akane v na4aloto
;po-dobro iz4akvane na prozoreca - winwait, winactivate, winwaitactive
;iz4akva da se aktivira prozoreca sled win+3

;1.2:
;tyrsi poleto za nomer vmesto da klika na slqpo
;ne se opitva da zatvarq stranici v prozoreca
;edini4no (a ne promenq6to se s cikyl) posledno syob6tenie
;ne natiska win+down 6toto moje da minimizira prozoreca
;iztrit eventualno izli6en red winactivate VivaSMS - Google Chrome predi win+up
; i o6te 1 povtarq6t se coordmode

;1.11:
;now searces for the filling form instead of clicking 'somewhere'
;понякога се бъгва ако вече има отворени няколко страници, прозореца

;1.1:
;'обновява' прозореца ; търси бутона 'изпрати' вместо да клика на сляпо там където би трябвало да е

;syob6tenieto ne trqbva da zapo4va s kvadratni skobi
*/

;по някаква причина като стигне ! знак отваря нова страница, остатъка от съобщението се изписва в адресната лента на Chrome и скрипта излиза



;clipboard to sms using Vivacom website



Message=%clipboard%	; текста на съобщението



path=D:\1 Soft' & dox\AutoHotKey\my scripts\skype to sms\
link=http://www.vivacom.bg/online/cgi-bin/web2sms.cgi?temp=send_sms.html&ls=7af94d31fce7e9025135ae3bfdee2330

number=0877833555
pass=__________

blockinput on
ifwinnotexist ahk_class Chrome_WidgetWin_0
{
  send #3 
  blockinput, off
  settitlematchmode 2
  winwaitactive Google Chrome
}
;sleep, 200

run % link
winwait VivaSMS - Google Chrome
winactivate VivaSMS - Google Chrome
winwaitactive VivaSMS - Google Chrome

sleep, 100 
blockinput on
send #{Up}
blockinput off
sleep, 300

coordmode mouse, screen
coordmode pixel, screen

loop{
imagesearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, %path%vhod.png
if (errorlevel = 2){
    splashtexton, 200, 50, ,възникна грешка 84
    sleep, 2000
    exitapp
}
else if (errorlevel = 1)
  continue
else
  break
}
blockinput on
mousemove x+2, y+2
click
blockinput off

sleep, 200
winwait VivaSMS - Google Chrome
winactivate VivaSMS - Google Chrome
winwaitactive VivaSMS - Google Chrome

blockinput on
send #{Up}
blockinput off

sleep, 200

loop{
imagesearch ,x,y, 0, 0, A_ScreenWidth, A_ScreenHeight, %path%rectangle.png

if (errorlevel = 2) {
    msgbox, Fatal error rectangle 113
    exitapp
} else if (errorlevel = 1)
   continue
  else
   break
}

blockinput on
mousemove x+5, y+5
click
send %number%	;номер на получателя
blockinput off
sleep, 100
blockinput on
mousemove 676, 525
click
send skype: %Message%
sleep, 100
blockinput off

imagesearch, xp, yp, 0, 0, A_ScreenWidth, A_ScreenHeight, %path%'izprati'.png
if (errorlevel = 2){
    splashtexton, , ,възникна грешка 136
    sleep, 2000
    exitapp
}
else if (errorlevel = 1){
    splashtexton, , ,не виждам бутона 141
    sleep, 2000
    exitapp
}
else
blockinput on
mousemove xp+15, yp+15
sleep, 100
click		; най-важния бутон - Send
sleep, 100

send ^w

winminimize
blockinput off

;sleep, 2000
;esc::exitapp
