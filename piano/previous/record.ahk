; zapisva vsqka melodiq na otdelen red vyv faila
f1::Send {enter}::{enter}SoundBeep,{space}

f2::Send `, `% l{left}{right}{enter}goto _a{enter}{f1}



::
SoundBeep, 43.6, % l
goto _a

::
SoundBeep, 48.9, % l
goto _a

::
SoundBeep, 55, % l
goto _a

::
SoundBeep, 61, % l
goto _a

::
SoundBeep, 65.4, % l
goto _a

::
SoundBeep, 82.4, % l
goto _a

::
SoundBeep, 87.3, % l
goto _a

::
SoundBeep, 97.9, % l
goto _a

::
SoundBeep, 110, % l
goto _a

::
SoundBeep, 123.4, % l
goto _a

::
SoundBeep, 146.8, % l
goto _a

::
SoundBeep, 164.8, % l
goto _a

::
SoundBeep, 174.6, % l
goto _a

::
SoundBeep, 195.9, % l
goto _a

::
SoundBeep, 220, % l
goto _a

::
SoundBeep, 261.6, % l
goto _a

::
SoundBeep, 293.6, % l
goto _a

::
SoundBeep, 329.6, % l
goto _a

::
SoundBeep, 349.2, % l
goto _a

::
SoundBeep, 391.9, % l
goto _a

::
SoundBeep, 493.8, % l
goto _a

::
SoundBeep, 523.2, % l
goto _a

::
SoundBeep, 587.3, % l
goto _a

::
SoundBeep, 659.2, % l
goto _a

::
SoundBeep, 698.4, % l
goto _a

::
SoundBeep, 880, % l
goto _a

::
SoundBeep, 987.7, % l
goto _a

::
SoundBeep, 1046.5, % l
goto _a

::
SoundBeep, 1174.6, % l
goto _a

::
SoundBeep, 1318.5, % l
goto _a

::
SoundBeep, 1567.9, % l
goto _a

::
SoundBeep, 1760, % l
goto _a

::
SoundBeep, 1975.5, % l
goto _a

::
SoundBeep, 2093, % l
goto _a

::
SoundBeep, 2349.3, % l
goto _a

::
SoundBeep, 2793.8, % l
goto _a

::
SoundBeep, 3135.9, % l
goto _a

::
SoundBeep, 


return

/*
1::
SoundBeep, 43.6, % l
goto _a


/*
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

l:=150

; 

1::
SoundBeep, 43.6, % l
goto _a
2::
SoundBeep, 48.9, % l
goto _a
3::
SoundBeep, 55, % l
goto _a
4::
SoundBeep, 61.7, % l
goto _a
5::
SoundBeep, 65.4, % l
goto _a
6::
SoundBeep, 82.4, % l
goto _a
7::
SoundBeep, 87.3, % l
goto _a
8::
SoundBeep, 97.9, % l
goto _a
9::
SoundBeep, 123., % l
goto _a
0::
SoundBeep, 130, % l
goto _a
-::
SoundBeep, 140, % l
goto _a
=::
SoundBeep, 150, % l
goto _a
bs::
SoundBeep, 200, % l
goto _a


q::
SoundBeep, 346, 100
goto _a
w::
SoundBeep, 666, 100
goto _a
e::
SoundBeep, 986, 100
goto _a
r::
SoundBeep, 1306, 100
goto _a
t::
SoundBeep, 1626, 100
goto _a
y::
SoundBeep, 1946, 100
goto _a
u::
SoundBeep, 2266, 100
goto _a
i::
SoundBeep, 2586, 100
goto _a
o::
SoundBeep, 2906, 100
goto _a
p::
SoundBeep, 3226, 100
goto _a
[::
SoundBeep, 3546, 100
goto _a
]::
SoundBeep, 3866, 100
goto _a
\::
SoundBeep, 4186, 100
goto _a






z::
SoundBeep, 37, 100
goto _a
x::
SoundBeep, 3310, 100
goto _a
c::
SoundBeep, 6583, 100
goto _a
v::
SoundBeep, 9856, 100
goto _a
b::
SoundBeep, 13129, 100
goto _a


/* ne se 4uvat
n::
SoundBeep, 16402, 100
goto _a
m::
SoundBeep, 19675, 100
goto _a
,::
SoundBeep, 22948, 100
goto _a
.::
SoundBeep, 26221, 100
goto _a
/::
SoundBeep, 29494, 100
goto _a
shift::
SoundBeep, 32767, 100
goto _a

*/





_a:
melody .= A_ThisHotkey`c
return


;return
esc::ExitApp