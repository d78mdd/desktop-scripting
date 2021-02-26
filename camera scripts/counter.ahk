#SingleInstance ignore
sekundi:=0
;Iniread, sekundi, C:\Users\d7m\Desktop\counter.ahk, Section, sekundi, 0
;Iniread, sekundi, C:\Users\d7m\Desktop\counter.ahk, Section, sekundi, 0
;MsgBox % sekundi
Loop
{
	SplashTextOn,,,% sekundi
	IniRead, state, % A_ScriptFullPath, Section, state
	if state=0
	{
		;SplashTextOn,,,<<< %sekundi% >>>
		;IniWrite, % sekundi, C:\Users\d7m\Desktop\counter.ahk, Section, sekundi
		;sleep, 1000
		if sekundi<3
		  send !{numpad5}
		else if sekundi>2
		  send !{Numpad6}
		ExitApp
	}	
	sleep, 500
	sekundi+=0.5
	
	SplashTextOn,,,% sekundi
}

esc::exitapp

/*
[Section]
state=0
sekundi=59
