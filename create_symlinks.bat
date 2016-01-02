@ECHO OFF
Set _Destination=%LICH_SCRIPTS%

FOR /f %%a IN (
 'dir /b *.lic'
 ) DO (
 call:symlink %%a
)

mklink /h /d %_Destination%\profiles .\profiles

goto:eof

:symlink
del %_Destination%\%~1
mklink /h %_Destination%\%~1 .\%~1
