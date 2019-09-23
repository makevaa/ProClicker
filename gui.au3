$scriptName = "ProClicker"
$scriptVersion = "1.0.0"

GUICreate($scriptName & " v" & $scriptVersion, 435, 240)
Opt("GUICoordMode", 0) ;0=relative, 1=absolute
$guiInputOffset = 3

GUICtrlCreateGroup("Settings", 10, 10, 180, 220)


GUICtrlCreateLabel("Click interval:", 10, 22)
Global $clickIntervalInput = GUICtrlCreateInput ("0.5", 80, $guiInputOffset * -1, 35) 
GUICtrlCreateLabel("seconds", 40, $guiInputOffset)

GUICtrlCreateLabel("Click amount:", -120, 22)
Global $clickLimitInput = GUICtrlCreateInput ("5", 80, $guiInputOffset * -1, 35) 
GUICtrlCreateLabel("times", 40, $guiInputOffset)

GUICtrlCreateLabel("Random delay:", -120, 22)
Global $randomDelayInput = GUICtrlCreateInput ("0.3",  80,  $guiInputOffset * -1, 35) 
GUICtrlCreateLabel("seconds", 40,  $guiInputOffset)

GUICtrlCreateLabel("Click button:", -120, 30)
Global $clickButton = GUICtrlCreateCombo("Left-click", 70, -3, 80, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData(-1, "Right-click|Middle-click")

Global $singleClickRadio = GUICtrlCreateRadio("Single click", 0, 25)
Global $doubleClickRadio = GUICtrlCreateRadio("Double click", 0, 20)
GUICtrlSetState($singleClickRadio, $GUI_CHECKED)


GUICtrlCreateLabel("Double click speed:", -50, 30, 100)
Global $dClickMinInput = GUICtrlCreateInput("120", 0, 20 + $guiInputOffset * -1, 40) 
GUICtrlCreateLabel("to", 45, $guiInputOffset)
Global $dClickMaxInput = GUICtrlCreateInput("400", 15, $guiInputOffset * -1, 40) 
GUICtrlCreateLabel("ms", 45, $guiInputOffset)


Opt("GUICoordMode", 1)
GUICtrlCreateGroup("Instructions", 195, 10, 230, 95)
GUICtrlCreateLabel("• Enter 0 to click amount for infinite clicker" & @CRLF & "• Enter 0 to random delay to disable it" & @CRLF & "> F9: start auto-clicking" & @CRLF & "> F10: stop auto-clicking" & @CRLF & "> ESC: exit program" , 205, 25, 210, 70)
GUICtrlSetColor(-1, $COLOR_GRAY)



Opt("GUICoordMode", 1)
Global $resetButton = GUICtrlCreateButton("Reset settings", 330, 110, 90, 25)
Global $saveButton = GUICtrlCreateButton("Save settings", 330, 140, 90, 25)

GUISetIcon("files/icon.ico") 
GUISetState()