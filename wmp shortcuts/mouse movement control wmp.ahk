;mouse-only support
;change song or volume with f1 + mouse movement

; proba za raz6irqvane na opciite
#IfWinExist, Windows Media Player ahk_class WMPlayerApp
IfWinNotActive, ahk_class Chrome_WidgetWin_1
f1::
MButton::
coordmode, mouse, screen
coordmode, tooltip, screen
MouseGetPos, ox, oy
sleep, 150

Loop
{
  if ( GetKeyState("f1","p") = 0 && GetKeyState("mbutton","p") = 0 )
  {
    tooltip
    return
  }
  mousegetpos, nx, ny
  
  if (abs(nx-ox)>20 && abs(ny-oy)<20)
  {
    tooltip
    goto _song ; 'zaklu4va' na rejim smqna na predi6na/sledva6ta pesen
  }
  
  if (abs(ny-oy)>20 && abs(nx-ox)<20)
  {
    tooltip
    break      ; rejim uveli4avane/namalqne zvuka
  }
  
  
  ToolTip, up/down - volume`nleft/right - song, nx+10, ny+20
}

; promqna na zvuka : ;
SoundGetWaveVolume, wavevol
Loop
{
  if ( GetKeyState("f1","p") = 0 && GetKeyState("mbutton","p") = 0 )
  {
    tooltip
    return
  }
  MouseGetPos, oxl, oyl
  ;mousemove,ox, oyl
  changevolby := (oy-oyl)/4
  newvol:=round(wavevol + changevolby)
  if (newvol>100)
    newvol=100
  else if (newvol<0)
    newvol=0
  soundsetwavevolume, newvol
  tooltip, wave volume %newvol%, oxl+10, oyl+20
}


; smqna na pesenta : ;
_song:
Loop
{
  mousegetpos, nx, ny
  if (nx-ox>30)
    ttext:="next"
  else if (ox-nx>30)
    ttext:="previous"
  else
    ttext:="leave the current song"
  tooltip, % ttext, nx+10, ny+20
  if ( GetKeyState("f1","p") = 0 && GetKeyState("mbutton","p") = 0 )
  {
    tooltip
    break
  }
}

if      (nx-ox>30) ; && abs(ny-oy)<20)  ; horizontal right
  goto _next

else if (ox-nx>30) ; && abs(ny-oy)<20)  ; left
  goto _prev


return
#IfWinExist
IfWinNotActive