@echo off

REM Schriftfarbe
color c

REM Fenstergr�sse
mode con lines=50 cols=110


echo %cd%\

REM Title
title Schneewittchen
cls
:start

REM Set everything to NULL, except num
set "Heute=%Heute*=%"
set "a=%a*=%"
set "s=%s*=%"
set "L�schen=%L�schen*=%"
set "JN=%JN*=%"
cls
echo.
echo.
echo --------------------------------%date:~0%--------------------------------
echo.
echo ------------------------------Hallo %USERNAME%------------------------------
echo.
echo.


REM Was soll ich tun?
set /p a= 
if /i %a%==exit exit
if /i %a%==New goto new
if /i %a%==Search goto s
if /i %a%==Help goto help
if /i %a%==delete goto del
							REM Ergeben alle if-Abfragen "false", weiss der Nutzer m�glicherweise nicht, was er eingeben soll.
							REM nach 3 mal "false" erscheint deshalb Hilfe
if /i %a%==color (goto Farbe) else (SET /A num = %num% + 1)
ELSE goto help


REM num = Z�hler f�r die Anzahl ung�ltiger Eingaben
if %num%==3 goto help

pause
goto start

REM new note
:new

REM Codepage anpassen, um Umlaute im Dokument darstellen zu k�nnen
chcp 1252
cls

echo.
echo.
echo --------------------------------%date:~0%--------------------------------
echo.
echo ------------------------------Neuer Eintrag:------------------------------
echo.
echo.

REM Notiz kann eingegeben werden
set /p Heute= 

REM New line
echo.>>C:\Users\n.sterki.BE\Documents\Schneewittchen\%date%.txt

REM Datum, Uhrzeit und Ersteller zur eindeutigen Identifikation der Notitz ins Dokument Schreiben
echo  Created by %USERNAME% on %date:~0% at %time:~0,5%>>C:\Users\%USERNAME%\Dokumente\Schneewittchen\%date%.txt

REM new line
echo.>>C:\Users\%USERNAME%\Dokumente\Schneewittchen\%date%.txt

REM Notiz ins Dokument schreiben
echo  Eintrag: %Heute%>>C:\Users\%USERNAME%\Dokumente\Schneewittchen\%date%.txt

REM Zwei Leere Zeilen um das Dokument �bersichtlicher zu gestalten
echo.>>C:\Users\%USERNAME%\Dokumente\Schneewittchen\%date%.txt
echo.>>C:\Users\%USERNAME%\Dokumente\Schneewittchen\%date%.txt


pause

REM set codepage to normal
chcp %CP%>nul
chcp 850

cls
goto start

REM Search file

:s
cls
echo.
echo.
echo --------------------------------%date:~0%--------------------------------
echo.
echo                                  ~Search~
echo.
echo Welches Dokument suchst du? Dr�cke "x" um den Vorgang abzubrechen.
echo.

REM Take input for search
set /p s=
REM----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
REM �berpr�fen, ob das gesuchte Dokument existiert. Falls ja: �ffnen
IF Exist C:\Users\%USERNAME%\Documents\Schneewittchen\%s%.txt (
	start C:\Users\%USERNAME%\Documents\Schneewittchen\%s%.txt

REM if userinput = "x": go to start
) ELSE ( 
	IF %s%==x (
		goto start

REM Else: File doesnt exist
	) ELSE (
		echo.
		echo.
		echo File "%s%" doesnt exist.
	)
)
echo.

REM Continue searching?
echo Willst du weiter suchen? [Y/N]
echo.
echo.
set /p YN=
IF %JN%==Y (
	set "s=%s*=%"
	goto s
) ELSE (
	IF %JN%==N (
		goto start
	) Else (
		goto help
	)
)
pause
cls
goto start

REM delete file

:del
cls
echo.
echo.
echo Welches Dokument m�chtest du l�schen? Dr�cke "x" um den Vorgang abzubrechen.
echo.

REM Nutzer: Eingabe zu l�schendes Dokument
set /p L�schen=

REM �berpr�fen, ob das gesuchte Dokument existiert. Falls ja: L�schen
IF Exist C:\Users\%USERNAME%\Documents\Schneewittchen\%L�schen%.txt (
	del C:\Users\%USERNAME%\Documents\Schneewittchen\%L�schen%.txt

REM Info dass das Dokument gel�scht wurde
	echo Das Dokument %L�schen% wurde gel�scht.
	
REM Wenn die Nutzereingabe = "x": gehe zu start
) ELSE ( 
	IF %L�schen%==x (
		goto start

REM Else: Dokument existiert nicht
	) ELSE (
		echo.
		echo.
		echo Das Dokument "%L�schen%" existiert nicht.
	)
)
echo.

REM Fortfahren?
echo Willst du weiter l�schen? [J/N]
echo.
echo.
set /p JN=
IF %JN%==J (
	set "JN=%JN*=%"
	goto l
) ELSE (
	IF %JN%==N (
		goto start
	) Else (
		goto help
	)
)
pause
cls
goto start

REM Farbe tempor�r �ndern

:Farbe
cls
echo.
echo.
echo Press "x" to stop
echo Available colors:
echo.

REM Auflistung der Farbauswahl
echo - Schwarz:    "0"
echo - Dunkelblau: "1"
echo - Dunkelgr�n: "2"
echo - Blaugr�n:   "3"
echo - Dunklerot:  "4"
echo - Lila:       "5"
echo - Ocker:      "6"
echo - Hellgrau:   "7"
echo - Dunkelgrau: "8"
echo - Blau:       "9"
echo - Gr�n:       "A"
echo - Zyan:       "B"
echo - Rot:        "C"
echo - Magenta:    "D"
echo - Gelb:       "E"
echo - Weiss:      "F"
echo.
echo.
echo Achte auf Gross-/Kleinschreibung.
echo.

REM Nutzereingabe Hintergrund
set /p hintergrund= Neue Hintergrundfarbe:
echo.

REM Wenn die Nutzereingabe = "x": gehe zu start
if %hintergrund%==x goto start

REM Nutzereingabe Schrift
set /p schrift= Neue Schriftfarbe:

REM Wenn die Nutzereingabe = "x": gehe zu start
if %schrift%==x goto start
echo.
echo.
echo.
echo Die Farben werden beim Schliessen des Programms auf den Standardwert zur�ckgesetzt.
echo.
echo.
pause

REM set colors
color %hintergrund%%schrift%
cls
goto start

REM Help: The cheatsheet

:help
cls
echo.
echo.

REM Hilfe zu: Neues Dokument erstellen
echo Type "New" for creating a new note. This is case sensitive.
echo Every note gets automatically saved in Documents\Schneewittchen. The filename is always the current date.
echo If you write more than one note on the same day, they are both saved in the same file,
echo but marked with timestamps.
echo.
echo.

REM Hilfe zu: Vorhandenes Dokument suchen
echo If you wanna open an existing note, just type "Search". This is case sensitive.
echo Then simply write the name of the file you are looking for
echo (You may want to rename your most important files fo this purpose).
echo This function is only able to see files that are located at the Schneewitchen path,
echo default is /home/$USERNAME/Schneewittchen.
echo Beim Beenden der Suche wird gefragt, ob du weiter suchen m�chtest. Beantworte diese Frage
echo mit "J" (f�r Ja) oder "N" (f�r Nein). This is case sensitive.
echo.
echo.

REM Hilfe zu: Das Programm beenden
echo For exiting the program, simply type "exit", press the big red button
echo in the right top corner or press enter.
echo.
echo.

REM Hilfe zu: Bestehendes Dokument l�schen
echo Um ein Dokument zu l�schen, tippe "l�schen". This is case sensitive.
echo Gib anschliessend an, welches Dokument du l�schen m�chtest.
echo Du kannst nur Elemente l�schen, die sich im Ordner Dokumente\Schneewittchen befinden.
echo Beim Beenden dieser Funktion wird gefragt, ob du weiter l�schen m�chtest. Beantworte diese Frage
echo mit "J" (f�r Ja) oder "N" (f�r Nein). This is case sensitive.
echo.
echo.

REM Hilfe zu: Farbe �ndern
echo To choose new colors, type "Color". This is case sensitive.
echo Gib anschliessend an, welche neue Farbe du f�r die Schrift/den Hintergrund willst. Zur Verf�gung stehen:
echo.
echo - Black:      "0"
echo - Dunkelblau: "1"
echo - Dunkelgr�n: "2"
echo - Blaugr�n:   "3"
echo - Dunklerot:  "4"
echo - Lila:       "5"
echo - Ocker:      "6"
echo - Hellgrau:   "7"
echo - Dunkelgrau: "8"
echo - Blue:       "9"
echo - Green:      "A"
echo - Zyan:       "B"
echo - Red:        "C"
echo - Magenta:    "D"
echo - Yellow:     "E"
echo - White:      "F"
echo.
echo This is case sensitive.
echo.
echo Die Farben werden beim Schliessen des Programms auf den Standardwert zur�ckgesetzt.
echo.
echo.

REM Anzahl ung�ltiger Eingaben auf Null setzen, da soeben Hilfe angefordert wurde
set "num=%num*=%"
pause
cls
goto start
