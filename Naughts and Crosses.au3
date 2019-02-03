#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

$Random = Random(1, 9, 1)
$ignore = 0
$PvsP = 0
$PvsC = 0
$CvsC = 0
Global $equals = "X"
Global $spaceowner[10]
Global $Pic[10]
Global $Label[10]
For $i = 1 To 9
	$spaceowner[$i] = 0
Next
$turn="X"

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("N&C", 226, 245, 192, 124)
$MenuItem1 = GUICtrlCreateMenu("Game")
$MenuItem2 = GUICtrlCreateMenu("New Game", $MenuItem1)
$MenuItem4 = GUICtrlCreateMenuItem("PvsP", $MenuItem2)
$MenuItem5 = GUICtrlCreateMenuItem("PvsC", $MenuItem2)
$MenuItem6 = GUICtrlCreateMenuItem("CvsC", $MenuItem2)
$MenuItem3 = GUICtrlCreateMenuItem("Exit", $MenuItem1)
$MenuItem7 = GUICtrlCreateMenu("About")
$MenuItem8 = GUICtrlCreateMenuItem("NandC", $MenuItem7)
$Label1 = GUICtrlCreateLabel("", 8, 8, 65, 65)
$Label2 = GUICtrlCreateLabel("", 80, 8, 65, 65)
$Label3 = GUICtrlCreateLabel("", 152, 8, 65, 65)
$Label4 = GUICtrlCreateLabel("", 8, 80, 65, 65)
$Label5 = GUICtrlCreateLabel("", 80, 80, 65, 65)
$Label6 = GUICtrlCreateLabel("", 152, 80, 65, 65)
$Label7 = GUICtrlCreateLabel("", 8, 152, 65, 65)
$Label8 = GUICtrlCreateLabel("", 80, 152, 65, 65)
$Label9 = GUICtrlCreateLabel("", 152, 152, 65, 65)
$Pic[1] = GUICtrlCreatePic("Blank.jpg", 8, 8, 65, 65)
$Pic[2] = GUICtrlCreatePic("Blank.jpg", 80, 8, 65, 65)
$Pic[3] = GUICtrlCreatePic("Blank.jpg", 152, 8, 65, 65)
$Pic[4] = GUICtrlCreatePic("Blank.jpg", 8, 80, 65, 65)
$Pic[5] = GUICtrlCreatePic("Blank.jpg", 80, 80, 65, 65)
$Pic[6] = GUICtrlCreatePic("Blank.jpg", 152, 80, 65, 65)
$Pic[7] = GUICtrlCreatePic("Blank.jpg", 8, 152, 65, 65)
$Pic[8] = GUICtrlCreatePic("Blank.jpg", 80, 152, 65, 65)
$Pic[9] = GUICtrlCreatePic("Blank.jpg", 152, 152, 65, 65)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Func Gothere(Const $space)
	if $turn = "X" And Not(IsString($spaceowner[$space])) Then
		GUICtrlSetImage($Pic[$space], "Cross.jpg")
		$spaceowner[$space] = "X"
		$turn = "O"
	ElseIf $turn = "O" And Not(IsString($spaceowner[$space])) Then
		GUICtrlSetImage($Pic[$space], "Circle.jpg")
		$spaceowner[$space] = "O"
		$turn = "X"
	EndIf
EndFunc

Func blockandattack(Const $symbol)
	For $i = 1 To 7 Step 3
		If $spaceowner[$i] == $symbol And $spaceowner[$i+1] == $symbol And Not(IsString($spaceowner[$i+2])) And $ignore = 0 Then
			Gothere($i+2)
			$ignore = 1
		ElseIf $spaceowner[$i] == $symbol And $spaceowner[$i+2] == $symbol And Not(IsString($spaceowner[$i+1])) And $ignore = 0 Then
			Gothere($i+1)
			$ignore = 1
		ElseIf $spaceowner[$i+1] == $symbol And $spaceowner[$i+2] == $symbol And Not(IsString($spaceowner[$i])) And $ignore = 0 Then
			Gothere($i)
			$ignore = 1
		EndIf
	Next
	For $i = 1 To 3 Step 1
		If $spaceowner[$i] == $symbol And $spaceowner[$i+3] == $symbol And Not(IsString($spaceowner[$i+6])) And $ignore = 0 Then
			Gothere($i+6)
			$ignore = 1
		ElseIf $spaceowner[$i] == $symbol And $spaceowner[$i+6] == $symbol And Not(IsString($spaceowner[$i+3])) And $ignore = 0 Then
			Gothere($i+3)
			$ignore = 1
		ElseIf $spaceowner[$i+3] == $symbol And $spaceowner[$i+6] == $symbol And Not(IsString($spaceowner[$i])) And $ignore = 0 Then
			Gothere($i)
			$ignore = 1
		EndIf
	Next
	If $ignore = 0 Then
		If $spaceowner[1] == $symbol And $spaceowner[5] == $symbol And Not(IsString($spaceowner[9])) And $ignore = 0 Then
			Gothere(9)
			$ignore = 1
		ElseIf $spaceowner[1] == $symbol And $spaceowner[9] == $symbol And Not(IsString($spaceowner[5])) And $ignore = 0 Then
			Gothere(5)
			$ignore = 1
		ElseIf $spaceowner[5] == $symbol And $spaceowner[9] == $symbol And Not(IsString($spaceowner[1])) And $ignore = 0 Then
			Gothere(1)
			$ignore = 1
		EndIf
		If $spaceowner[3] == $symbol And $spaceowner[5] == $symbol And Not(IsString($spaceowner[7])) And $ignore = 0 Then
			Gothere(7)
			$ignore = 1
		ElseIf $spaceowner[3] == $symbol And $spaceowner[7] == $symbol And Not(IsString($spaceowner[5])) And $ignore = 0 Then
			Gothere(5)
			$ignore = 1
		ElseIf $spaceowner[5] == $symbol And $spaceowner[7] == $symbol And Not(IsString($spaceowner[3])) And $ignore = 0 Then
			Gothere(3)
			$ignore = 1
		EndIf
	EndIf
EndFunc

Func Computer()
	Sleep(500)
	blockandattack("O")
	blockandattack("X")
			If $ignore = 0 Then
				$Random = Random(1, 9, 1)
				While IsString($spaceowner[$random])
					$Random = Random(1, 9, 1)
				WEnd
				Gothere($random)
			EndIf
		$ignore = 0
EndFunc

Func Begin()
	For $i = 1 To 9
		GUICtrlSetImage($Pic[$i], "Blank.jpg")
	Next
	While 1
		Switch GUIGetMsg()
			Case $MenuItem4
				$turn = "X"
				$PvsP = 1
				$PvsC = 0
				$CvsC = 0
				For $i = 1 To 9
					$spaceowner[$i] = 0
				Next
				ExitLoop

			Case $MenuItem5
				$turn = "X"
				$PvsC = 1
				$PvsP = 0
				$CvsC = 0
				For $i = 1 To 9
					$spaceowner[$i] = 0
				Next
				ExitLoop

			Case $MenuItem6
				$turn = "X"
				$CvsC = 1
				$PvsC = 0
				$PvsP = 0
				For $i = 1 To 9
					$spaceowner[$i] = 0
				Next
				ExitLoop

			Case $MenuItem3
				Exit

			Case $MenuItem8
				MsgBox(0, "About", "Author: Tomson Boylett"&@CRLF&"Made in Autoit.")

			Case $GUI_EVENT_CLOSE
				Exit

		EndSwitch
	WEnd
EndFunc

Begin()

While 1
	For $j = 1 To 2
		If $equals = "X" Then
			$equals = "O"
		ElseIf $equals = "O" Then
			$equals = "X"
		EndIf
		For $i = 1 To 7 Step 3
			if $spaceowner[$i] == $equals And $spaceowner[$i+1] == $equals And $spaceowner[$i+2] == $equals Then
				MsgBox(0, "Winner!", $equals&" Wins!")
				Begin()
			EndIf
		Next
		For $i = 1 To 3 Step 1
			if $spaceowner[$i] == $equals And $spaceowner[$i+3] == $equals And $spaceowner[$i+6] == $equals Then
				MsgBox(0, "Winner!", $equals&" Wins!")
				Begin()
			EndIf
		Next
		if $spaceowner[1] == $equals And $spaceowner[5] == $equals And $spaceowner[9] == $equals Then
			MsgBox(0, "Winner!", $equals&" Wins!")
			Begin()
		EndIf
		if $spaceowner[3] == $equals And $spaceowner[5] == $equals And $spaceowner[7] == $equals Then
			MsgBox(0, "Winner!", $equals&" Wins!")
			Begin()
		EndIf
	Next
	If IsString($spaceowner[1]) And IsString($spaceowner[2]) And IsString($spaceowner[3]) And IsString($spaceowner[4]) And IsString($spaceowner[5]) And IsString($spaceowner[6]) And IsString($spaceowner[7]) And IsString($spaceowner[8]) And IsString($spaceowner[9]) Then
		MsgBox(0, "Awww.", "Draw...")
			Begin()
	EndIf
	If $turn = "O" And $PvsC = 1 Or $CvsC = 1 Then Computer()
	If $turn = "X" And $CvsC = 1 Then Computer()

	If Not($CvsC = 1) Then
		;Buttons
		Switch GUIGetMsg()
			Case $Label1
				Gothere(1)

			Case $Label2
				Gothere(2)

			Case $Label3
				Gothere(3)

			Case $Label4
				Gothere(4)

			Case $Label5
				Gothere(5)

			Case $Label6
				Gothere(6)

			Case $Label7
				Gothere(7)

			Case $Label8
				Gothere(8)

			Case $Label9
				Gothere(9)

			Case $MenuItem3
				Exit

			Case $MenuItem8
				MsgBox(0, "About", "Author: Tomson Boylett"&@CRLF&"Made in Autoit.")

			Case $GUI_EVENT_CLOSE
				Exit

		EndSwitch
	EndIf
WEnd