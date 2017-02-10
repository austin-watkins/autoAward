HotKeySet("q", "exitScript")

$studentCount = 9

For $var = 0 To $studentCount - 1

	enterSFAREGS()
	Send("201720") ;enter term
	enterSFAREGSStudent()
	checkStudentHold()
	addCurricula()
	exitSFAREGS()

	enterSHADEGR()
	enterSHADEGRStudent()
	exitSHADEGR()
Next

Func restartExcel()
	MouseClick("", 1226, 20, 1, 20) ;click on excel
	For $var = 0 To $studentCount - 1
		Send("{UP}") ; moves to top student
	Next
EndFunc

Func enterSHADEGRStudent()


	MouseClick('', 656, 134, 1, 20)
	Sleep(1000)
	MouseClick('', 65, 299, 2, 20)
	Sleep(1000)
	Send("{TAB}")
	Sleep(1000)
	Send("{CTRLDOWN}{PGDN}{CTRLUP}")
	Sleep(1000)


	;enter grad info
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

	;Marks student as done
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



Func checkStudentHold()
	$possibleHoldPixelColor = PixelGetColor(640, 500) ;get pixel color
	Const $holdPixelColor = 16250855

	If $holdPixelColor = $possibleHoldPixelColor Then
		removeHoldSFAREGS()
	EndIf
EndFunc

Func removeHoldSFAREGS()
	;MouseClick("", 755,16,1,20)
	Send("{ENTER}")
	Sleep(1000)
	Send("024")
	Sleep(1000)
 	Send("{CTRLDOWN}{PGDN}{CTRLUP}")
	Sleep(2000)
EndFunc


Func checkFormPopup()
	$possibleHoldPixelColor = PixelGetColor(640, 500) ;get pixel color
	Const $holdPixelColor = 16250855

	If $holdPixelColor = $possibleHoldPixelColor Then
		Send("{ENTER}")
		Sleep(2000)
	EndIf
EndFunc

Func addCurricula()

	MouseClick("", 220,181, 1, 20) ;click on curricula
	Sleep(1000)
	MouseClick("", 218, 42, 1, 20) ;click on record
	Sleep(1000)
	MouseClick("", 217, 188, 1, 20) ;click on insert
	Sleep(1000)

	checkFormPopup()


	MouseClick("", 1226, 20, 1, 20) ;click on excel
	Send("{LEFT}") ;select program
	Sleep(1000)
	Send("{CTRLDOWN}c{CTRLUP}")
	Sleep(1000)
	MouseClick("", 196, 440, 1, 20) ;click on program
	Sleep(1000)
	Send("{CTRLDOWN}v{CTRLUP}")
	Sleep(1000)
	Send("{F10}")
	Sleep(3000)
	checkFormPopup()

	;Roll to Outcome
	MouseClick("", 976, 281, 1, 20)
	Sleep(2500)
	Send("{ENTER}")
	Sleep(1000)
	Send("{ENTER}")
	Sleep(2000)
	;I need to add something here to get the amount


	;get priority and add to excel
	;MouseClick("", 194, 416, 1, 20) ;click on Priority
	;Sleep(1000)
	;Send("{CTRLDOWN}{SHIFTDOWN}{LEFT}{SHIFTUP}{CTRLUP}") ;selects priority
	;Sleep(1000)
	;Send("{CTRLDOWN}c{CTRLUP}")
	;Sleep(1000)
	;MouseClick("", 1226, 20, 1, 20) ;click on excel
	;Sleep(1000)
	;Send("{RIGHT}{RIGHT}{RIGHT}");moves left 3 times
	;Sleep(1000)
	;Send("{CTRLDOWN}v{CTRLUP}")
	;Sleep(1000)
	;Send("{LEFT}{LEFT}");moves right 2 times (moves back to id)
	;Sleep(1000)
	;Send("{DOWN}") ; moves to next student
	;Sleep(1000)
EndFunc

Func exitSFAREGS()
	MouseClick("", 775, 68, 2, 20) ;click on exit
	Sleep(2000)
EndFunc


Func exitSHADEGR()
	MouseClick("", 775, 68, 1, 20) ;click on exit
	Sleep(2000)
EndFunc

Func enterSHADEGR()
	MouseClick("", 131, 116, 1, 20) ;click on "Go To..."\
	Send("SHADEGR")
	Send("{ENTER}")
	Sleep(1000)
EndFunc


Func enterSFAREGS()
	MouseClick("", 131, 116, 1, 20) ;click on "Go To..."\
	Send("SFAREGS")
	Send("{ENTER}")
	Sleep(1000)
EndFunc


Func enterSFAREGSStudent()
	MouseMove(1226, 20, 20)
	Sleep(1000)
	MouseClick("")
	Sleep(1000)
	Send("{CTRLDOWN}c{CTRLUP}")
	Sleep(1000)
	MouseClick("", 124, 133, 1, 20)
	Sleep(1000)
	Send("{TAB}")
	Sleep(1000)
	Send("{CTRLDOWN}v{CTRLUP}")
	Sleep(1000)
	Send("{CTRLDOWN}{PGDN}{CTRLUP}")
	Sleep(3000)
EndFunc


Func exitScript()
	Exit
EndFunc










