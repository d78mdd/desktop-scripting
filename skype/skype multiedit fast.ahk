;~enter::reload

;20- #if
;NoTrayIcon
;should skip the first msg
; saving clipboards, one at a time ;p - ve4e sydyrjanieto na klipborda ne bi trqbvalo da se gubi


;down should not restart if not editing a message

; cancel the editing (ctrl + a , del)

; actually esc closes the script
; so there could be only a small icon(trans GUI) floating somewhere on top of chat window indicating multiedit is active)


#SingleInstance force
;#NoTrayIcon

DetectHiddenWindows, on

#ifwinactive, ahk_class TConversationForm
#If (!(WinExist("D:\1 Soft' & doc's\AutoHotKey\my scripts\skype on off\try skype offline 2.ahk ahk_class AutoHotkey")) and !(WinExist("D:\1 Soft' & doc's\AutoHotKey\my scripts\skype on off\try skype online 2.ahk ahk_class AutoHotkey")))

;SetBatchLines -1
SetMouseDelay, 0
SetDefaultMouseSpeed, 0
WinGetActiveStats, a, w, h, a, a
ymax:=h

CoordMode, pixel, relative
coordmode, mouse, Relative
x1=337
y1=0

clip:=Clipboardall

up::

Loop {
 imagesearch, x, y, x1, y1, w, ymax,  *5 %A_ScriptDir%\msgM.bmp
 if(errorlevel=1)
 {
   MouseMove, x1, y1
   ymax:=y1-2
   break
 }
 y1:=y+2
}

if (A_PriorHotkey!=A_ThisHotkey)
{
  send {numpadup}
  return
}

BlockInput, on
click, right
send, {NumpadUp 3}{enter}
BlockInput, off

Clipboard:=clip

return

~enter::reload

#ifwinactive
#If

down::
reload
return

esc::exitapp

OnExit, ex
ex:
MsgBox, no!