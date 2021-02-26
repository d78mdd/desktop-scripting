;AMCAP auto setting

WinWaitActive, AMCAP ahk_class #1000
SetKeyDelay, 100
send {alt}{right 2}{down 4}{enter}
sleep, 100
winwaitactive, Properties ahk_class #32770

sleep, 100
send {right}

sleep, 100
mousemove, 198, 139
click 2
coordmode mouse relative
sleep, 100

mousemove, 136, 316
click 5

mousemove 304, 317
click
sleep, 500
Click
sleep, 100
send {enter}

ExitApp
esc::ExitApp