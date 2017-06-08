@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"c:\RailsInstaller\Ruby2.2.0\bin\ruby.exe" "c:/Users/Veni5on/Desktop/6toSemestre/UzielLenguajesProgramacion/equipoProf/ca/vendor/bundle/ruby/2.2.0/bin/listen" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"c:\RailsInstaller\Ruby2.2.0\bin\ruby.exe" "%~dpn0" %*
