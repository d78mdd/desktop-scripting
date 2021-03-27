/*ver (1.6)
v alt+q:
 iz4akva wmp da se aktivira
 4aka sinqta nota do 6 sek i puska tyrsa4a na pesni runW
сенд есц
i pri startirane si opravq belite pikseli
*/

/*!Numpad9::     ;feels strange...
  PostMessage, 0x111, 84349, 0, , ahk_class WMP Skin Host ; Fast Foward
  return

!Numpad7::     ;     no effect...
  PostMessage, 0x111, 84348, 0, ,ahk_class WMP Skin Host ; Rewind
  return
*/
;SetTitleMatchMode slow
DetectHiddenWindows on

;_play:
!q::
!numpad5::
~numpad0 & numpad5::
  ifwinnotexist, Windows Media Player ahk_class WMPlayerApp
  {
    SplashTextOn,,,now playing - random music...
    stars:=(a_sec-(a_sec//3)*3=0 ? 3 : (a_sec-(a_sec//3)*3=1 ? 4 : 5)) ; 3,4,5
    
    run, %HOMEPATH%\My Documents\My Music\My Playlists\%stars% stars.wpl,,      ; C:\Users\d7m\Music\Playlists\%stars% stars.wpl,,Min
    ;D:\Documents and Settings\d 7 m\My Documents\My Music\My Playlists
    
    WinWait, Windows Media Player ahk_class WMPlayerApp ; ne moje da se iz4akvat skriti prozorci
    WinActivate, Windows Media Player ahk_class WMPlayerApp
    WinWaitActive, Windows Media Player ahk_class WMPlayerApp
    
    sleep, 500
    WinMove, Windows Media Player ahk_class WMPlayerApp,,,, w+1, h
    WinMove, Windows Media Player ahk_class WMPlayerApp,,,, w, h
    SplashTextOff
    
    coordmode, pixel, relative
    loop {
      sleep, 200
      pixelgetcolor, melcol, 180, 95 ; melody icon color = 0xEEAD49
      if (melcol="0xEEAD49")
        break
      else if (A_Index>30) { ; ako sa izminali pove4e ot 6 sekundi 6.(200ms.5)
        MsgBox wmp controls ne vijda sinqta nota
        return
      }
    }
    runW()
    return
  }
    PostMessage, 0x111, 84344, 0, , ahk_class WMPlayerApp       ; Play/Pause
    
    IfWinActive, Windows Media Player ahk_class WMPlayerApp
      send {esc}
  return

_next:
!d::
!numpad6::
numpad0 & numpad6::
    PostMessage, 0x111, 84347, 0, , ahk_class WMPlayerApp       ; Next
    IfWinActive, Windows Media Player ahk_class WMPlayerApp
      send {esc}
return

_prev:
!a::
!numpad4::
~numpad0 & numpad4::
    PostMessage, 0x111, 84346, 0, , ahk_class WMPlayerApp       ; Prev
    IfWinActive, Windows Media Player ahk_class WMPlayerApp
      send {esc}  
  return


!w::
!numpad8::
~numpad0 & numpad8::
  ;IfWinExist, ahk_class WMPlayerApp
  ;  i=1
  ;else
    PostMessage, 0x111, 84351, 0, , ahk_class WMPlayerApp     ; Volume Up
    IfWinActive, Windows Media Player ahk_class WMPlayerApp
      send {esc}   
  return

!s::
!numpad2::
~numpad0 & numpad2::
  PostMessage, 0x111, 84352, 0, , ahk_class WMPlayerApp     ;  Volume Down
    IfWinActive, Windows Media Player ahk_class WMPlayerApp
      send {esc}  
  return
  
  
#include %a_scriptdir%\mouse movement control wmp.ahk