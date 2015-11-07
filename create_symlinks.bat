Set _Destination=C:\[CHANGE THIS]

call:symlink combat-trainer
call:symlink combat-trainer-setup
call:symlink common
call:symlink crossing-repair
call:symlink crossing-repair-setup
call:symlink crossing-training
call:symlink crossing-training-setup
call:symlink events
call:symlink smartlisten
goto:eof

:symlink
del %_Destination%\%~1.lic
mklink /H %_Destination%\%~1.lic .\%~1.lic
