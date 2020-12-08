#Persistent
#SingleInstance, force

Pause::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
