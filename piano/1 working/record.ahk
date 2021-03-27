; zapisva vsqka melodiq na otdelen red vyv faila


melody=

enter::
iniread, c, notes.ini, count, c, 0
c++
iniwrite, % c, notes.ini, count, c
iniwrite, % melody, notes.ini, melodies, m%c%

run %A_ScriptDir%\play.ahk
ExitApp
return

ctrl::pause

1::
SoundBeep, 70, 200
goto _a
2::
SoundBeep, 80, 200
goto _a
3::
SoundBeep, 90, 200
goto _a
4::
SoundBeep, 100, 200
goto _a
5::
SoundBeep, 120, 200
goto _a
6::
SoundBeep, 120, 200
goto _a
7::
SoundBeep, 130, 200
goto _a
8::
SoundBeep, 150, 200
goto _a

_a:
melody .= A_ThisHotkey
;MsgBox % melody
return

q::
SoundBeep, 300, 100
goto _a
w::
SoundBeep, 400, 100
goto _a
e::
SoundBeep, 500, 100
goto _a
r::
SoundBeep, 600, 100
goto _a
t::
SoundBeep, 700, 100
goto _a
y::
SoundBeep, 800, 100
goto _a
u::
SoundBeep, 1000, 100
goto _a
i::
SoundBeep, 1500, 100
goto _a
o::
SoundBeep, 2000, 100
goto _a
p::
SoundBeep, 2500, 100
goto _a
[::
SoundBeep, 3000, 100
goto _a
]::
SoundBeep, 3500, 100
goto _a
\::
SoundBeep, 4000, 100
goto _a
;[::SoundBeep, 4000, 200





;return
esc::ExitApp