`::
nx:=17
ny:=37
Loop
{
PixelGetColor, color, nx, ny
cc:=c+1
if (errorlevel=0 && color = 0xFFFFFF)
{
	nx:=x+1
	c++
	;if
	mousemove nx, ny
	;goto L
}
}
if c>3
	msgbox found a horizontal line

ExitApp
esc::ExitApp