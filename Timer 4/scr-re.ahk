SplashTextOn, 300, 20,, Forcing monitor's auto position...
sleep, 100
SendMessage 0x112, 0xF170, 2,,Program Manager ; off
sleep, 100
SendMessage 0x112, 0xF170, -1,,Program Manager ; on
sleep, 100

exitapp