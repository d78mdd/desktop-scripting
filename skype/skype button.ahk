#SingleInstance force
#NoTrayIcon

; da se vijda ne ikonka na ahk a ne6to drugo kogato multiedit e aktivno

gui, +alwaysontop -caption +owner
gui, add, Button ,x0 y0 w83 h25 gAction, SEND
gui, color, white
gui, show,hide  w83 h25, b

coordmode, pixel, screen
coordmode, mouse, screen
loop{
	sleep 10
	if (winactive("ahk_class TConversationForm") or WinActive("b"))
	{
		WinGetPos, x, y,w,h, ahk_class TConversationForm
		x+=311
		y:=y+h-30
		gui, show, NoActivate x%x% y%y%
	}else 
		gui hide
}

esc::exitapp

Action:
ControlSend, TChatRichEdit1, {enter},ahk_class TConversationForm
WinActivate, ahk_class TConversationForm
return