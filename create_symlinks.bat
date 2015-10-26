Set _Source=.
Set _Destination=C:\[CHANGE THIS]

call:symlink combat-trainer
call:symlink combat-trainer-setup
call:symlink crossing-training
call:symlink crossing-training-setup
goto:eof

:symlink
del %_Destination%\%~1.lic
mklink /H %_Destination%\%~1.lic %_Source%\%~1.lic