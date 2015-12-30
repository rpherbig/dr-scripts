@ECHO OFF
Set _Destination=%LICH_SCRIPTS%

FOR /f %%a IN (
 'dir /b *.lic *.yaml'
 ) DO (
 call:symlink %%a
)

goto:eof

:symlink
del %_Destination%\%~1
mklink /H %_Destination%\%~1 .\%~1
