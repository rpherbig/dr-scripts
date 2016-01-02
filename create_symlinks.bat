@ECHO OFF
Set _Destination=%LICH_SCRIPTS%

FOR /f %%a IN (
 'dir /b *.lic'
 ) DO (
 call:symlink %%a
)

rmdir %_Destination%\profiles
mklink /h /j %_Destination%\profiles .\profiles

goto:eof

:symlink
del %_Destination%\%~1
mklink /h %_Destination%\%~1 .\%~1
