sleep, 200
iniread, c, notes.ini, count, c
if (c="ERROR")
	MsgBox nqma zapisi, OK za nov
iniread, s, notes.ini, melodies, m%c%
Loop, parse, s
{
	Send % A_LoopField
	;MsgBox % A_LoopField
	sleep, 200
}

SplashTextOn,,, край на записа
sleep, 1500
SplashTextOff

run record.ahk
exitapp

1::SoundBeep, 70, 200
2::SoundBeep, 80, 200
3::SoundBeep, 90, 200
4::SoundBeep, 100, 200
5::SoundBeep, 110, 200
6::SoundBeep, 120, 200
7::SoundBeep, 130, 200
8::SoundBeep, 150, 200

ctrl::pause

q::SoundBeep, 300, 100
w::SoundBeep, 400, 100
e::SoundBeep, 500, 100
r::SoundBeep, 600, 100
t::SoundBeep, 700, 100
y::SoundBeep, 800, 100
u::SoundBeep, 1000, 100
i::SoundBeep, 1500, 100
o::SoundBeep, 2000, 100
p::SoundBeep, 2500, 100
[::SoundBeep, 3000, 100
]::SoundBeep, 3500, 100
\::SoundBeep, 4000, 100
;[::SoundBeep, 4000, 200

esc::ExitApp