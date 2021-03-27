/*
StringTrimRight
;%programfiles%

;no icon
;въвеждането на другата става многократно с wincatcher2 try
;изключена е паролата

;ostava pusnat ako ve4e ima otvoren prozorec na OneNote
*/

#singleinstance ignore
#NoTrayIcon

StringTrimRight, path, A_ScriptDir, 8
path .= "\code v1\coded.txt"

;pass=tadiveru87823

;run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft OneNote 2010.lnk ; - win7
run %ProgramFiles%\Microsoft Office\Office14\ONENOTE.EXE ; - winxp
winwaitactive ahk_class Framework::CFrame 

s= 
j=
p:=0

dec=q w e r t y u i o p a s d f g h j k l z x c v b n m . 1 2 3 4 5 6 7 8 9 0 . / _
cod=d q i m a n w z x b e c r v l t j o y p u g s k h f . 9 7 5 3 1 2 4 6 0 8 / _ .
stringsplit, dec, dec, %A_Space%
stringsplit, cod, cod, %A_Space%

dec27:=" "

Loop, Read, %path% ; pro4ita vseki red ot faila
{
  Loop, parse, A_LoopReadLine ; pro4ita vsqka bukva ot reda
  {
    loop 50 ; tyrsi s koq bukva da dekodira teku6tata
    {
      p++
      if A_LoopField in % cod%A_Index%
      {
        j= % dec%A_Index%
        s := s . j
      }
    }
  }
  s := s . "`n"
}

if (s = "")
{
 splashtexton,,, [no writings]
 sleep, 1000
} else
 msgbox, 4096, Hidden text:, % s
exitapp
