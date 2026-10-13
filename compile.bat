@Echo Off
chcp 866>nul
Echo Компиляция...
Set app=ceb
Set binapp=bin\Windows\%app%.exe
cd /D "%~dp0"
if exist "%binapp%" del /F /Q "%binapp%"
"%USERPROFILE%\Downloads\Program Files\fbc\fbc.exe" "%app%.bas" -x "%binapp%"
attrib +R +A "%binapp%"
Echo Ok.
