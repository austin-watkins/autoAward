;hot keys

HotKeySet("q", "exitScript")

;variables
$studentCount = 9

processOneTwo()

;function does process one and two (adding curricula and graduating them)

Func processOneTwo()
	For $var = 0 To $studentCount - 1

	enterSFAREGS()
	Send("201720") ;enter term
	enterSFAREGSStudent()
	checkStudentHold()
	addCurricula()
	exitSFAREGS()
	enterSHADEGR()
	enterSHADEGRStudent()
	addGradInfo()
	nextStudent()
	exitSHADEGR()
Next
EndFunc


;Functions for getting into forms

Func enterSFAREGS()
	MouseClick("", 131, 116, 1, 20) ;click on "Go To..."\
	Send("SFAREGS")
	Send("{ENTER}")
	Sleep(1000)
EndFunc

Func enterSHADEGR()
	MouseClick("", 131, 116, 1, 20) ;click on "Go To..."\
	Send("SHADEGR")
	Send("{ENTER}")
	Sleep(1000)
EndFunc


;navigating to student functions

Func enterSFAREGSStudent()
	MouseMove(1226, 20, 20) Move pointer to excell
	Sleep(1000)
	MouseClick("") ; click on excel (this is broken down, it was having problems)
	Sleep(1000)
	Send("{CTRLDOWN}c{CTRLUP}")
	Sleep(1000)
	MouseClick("", 124, 133, 1, 20) ;click on term
	Sleep(1000)
	Send("{TAB}") ; tab to ID
	Sleep(1000)
	Send("{CTRLDOWN}v{CTRLUP}")
	Sleep(1000)
	Send("{CTRLDOWN}{PGDN}{CTRLUP}")
	Sleep(3000)
EndFunc

Func enterSHADEGRStudent()
	MouseClick('', 656, 134, 1, 20) ;click on degree sequence arrow
	Sleep(1000)
	MouseClick('', 65, 299, 2, 20) ; dboule click on latest sequence number
	Sleep(1000)
	Send("{TAB}")
	Sleep(1000)
	Send("{CTRLDOWN}{PGDN}{CTRLUP}")
	Sleep(1000)
EndFunc

Func nextStudent()
	;markes student as "done"
	MouseClick("", 1226, 20, 1, 20) ;click on excel
	Sleep(1000)
	Send("{RIGHT}{RIGHT}{RIGHT}")
	Sleep(1000)
	Send("DONE")
	Sleep(1000)
	Send("{LEFT}{LEFT}")
	Sleep(1000)

	;moves to next student
	Sleep(1000)
	Send("{DOWN}")
EndFunc


; data entry functions

Func addGradInfo()
	Send("{TAB}")
	Sleep(500)
	Send("201720")
	Sleep(500)
	Send("{TAB}{TAB}")
	Sleep(500)
	Send("201720")
	Sleep(500)
	Send("{TAB}{TAB}")
	Sleep(500)
	Send("201720")
	Sleep(500)
	Send("{TAB}")
	Sleep(500)
	Send("2017")
	Sleep(500)
	Send("{TAB}")
	Sleep(500)
	Send("5")
	Sleep(500)
	Send("{TAB}")
	Sleep(500)
	Send("10-MAY-2017")
	MouseClick("", 319, 296, 1, 20) ;click on banner
	Send("{SHIFTDOWN}{TAB}{SHIFTUP}")
	Send("CA")
	Sleep(1000)
	Send("{F10}")
	Sleep(1000)
EndFunc

Func addCurricula()

	;adding a new record
	MouseClick("", 220,181, 1, 20) ;click on curricula
	Sleep(1000)
	MouseClick("", 218, 42, 1, 20) ;click on record
	Sleep(1000)
	MouseClick("", 217, 188, 1, 20) ;click on insert
	Sleep(1000)

	checkFormPopup() ;financial aid popup

	;getting program
	MouseClick("", 1226, 20, 1, 20) ;click on excel
	Send("{LEFT}") ;select program
	Sleep(1000)
	Send("{CTRLDOWN}c{CTRLUP}")
	Sleep(1000)

	;adding program
	MouseClick("", 196, 440, 1, 20) ;click on program
	Sleep(1000)
	Send("{CTRLDOWN}v{CTRLUP}")
	Sleep(1000)

	;save
	Send("{F10}")
	Sleep(3000)

	checkFormPopup() ;financial aid popup

	;Roll to Outcome
	MouseClick("", 976, 281, 1, 20) ;click roll to outcome
	Sleep(2500)
	Send("{ENTER}")
	Sleep(1000)
	Send("{ENTER}")
	Sleep(2000)
EndFunc


;validation functions

Func checkStudentHold()
	$possibleHoldPixelColor = PixelGetColor(640, 500) ;get pixel color
	Const $holdPixelColor = 16250855 ;tan color of popup

	;if there's a popup then it's a hold (probably) if that's the case remove it
	If $holdPixelColor = $possibleHoldPixelColor Then
		removeHoldSFAREGS()
	EndIf
EndFunc

Func removeHoldSFAREGS()
	Send("{ENTER}")
	Sleep(1000)
	Send("024")
	Sleep(1000)
 	Send("{CTRLDOWN}{PGDN}{CTRLUP}")
	Sleep(2000)
EndFunc

Func checkFormPopup()
	$possibleHoldPixelColor = PixelGetColor(640, 500) ;get pixel color
	Const $holdPixelColor = 16250855 ;value of tan popup

	;effect financial aid popup
	If $holdPixelColor = $possibleHoldPixelColor Then
		Send("{ENTER}")
		Sleep(2000)
	EndIf
EndFunc


;exiting form functions

Func exitSFAREGS()
	MouseClick("", 775, 68, 2, 20) ;click on exit
	Sleep(2000)
EndFunc

Func exitSHADEGR()
	MouseClick("", 775, 68, 1, 20) ;click on exit
	Sleep(2000)
EndFunc


;key bind functions

Func exitScript()
	Exit
EndFunc


;unused functions

Func restartExcel() ; this function is no longer called now that I'm doing one student at a time
	MouseClick("", 1226, 20, 1, 20) ;click on excel
	For $var = 0 To $studentCount - 1
		Send("{UP}") ; moves to top student
	Next
EndFunc








