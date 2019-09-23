Func ranNum($min, $max)
	If ($min > $max) Then
		Return Random ($max, $min, 1) 
	Else
		Return Random ($min, $max, 1) 
	EndIf	
EndFunc

Func ranSleep($min, $max)
	sleep(ranNum($min, $max))
EndFunc

Func saveSettings()
	Local $file = "files/config.ini"

	IniWrite($file, "settings", "clickIntervalInput", GUICtrlRead($clickIntervalInput))
	IniWrite($file, "settings", "clickLimitInput", GUICtrlRead($clickLimitInput))
	IniWrite($file, "settings", "randomDelayInput", GUICtrlRead($randomDelayInput))
	IniWrite($file, "settings", "clickButton", GUICtrlRead($clickButton))
	
	;IniWrite($file, "settings", "singleClickRadio", GUICtrlRead($singleClickRadio))
	;IniWrite($file, "settings", "doubleClickRadio", GUICtrlRead($doubleClickRadio))
	

	If GUICtrlRead($singleClickRadio) = $GUI_CHECKED Then
		IniWrite($file, "settings", "singleClickRadio", True)
		IniWrite($file, "settings", "doubleClickRadio", False)
	Else
		IniWrite($file, "settings", "singleClickRadio", False)
		IniWrite($file, "settings", "doubleClickRadio", True)
	EndIf
	
	
	IniWrite($file, "settings", "dClickMinInput", GUICtrlRead($dClickMinInput))
	IniWrite($file, "settings", "dClickMaxInput", GUICtrlRead($dClickMaxInput))

	;If GUICtrlRead($enableTooltipCheckbox) = $GUI_CHECKED Then
	;	IniWrite($file, "settings", "enableTooltip", 1)
	;Else
	;	IniWrite($file, "settings", "enableTooltip", 0)
	;EndIf
		
	
	#comments-start
	If GUICtrlRead($concealWindowIcon) = $GUI_CHECKED Then
		IniWrite($file, "settings", "concealIcon", 1)
	Else
		IniWrite($file, "settings", "concealIcon", 0)
	EndIf
	#comments-end

	MsgBox($MB_OK, "Settings saved", "Settings saved to file." & @CRLF & "Program will load these new settings on start.")
EndFunc

Func loadSettings($file)
	GUICtrlSetData ($clickIntervalInput, IniRead($file, "settings", "clickIntervalInput", 0.5))
	GUICtrlSetData ($clickLimitInput, IniRead($file, "settings", "clickLimitInput", 5))		
	GUICtrlSetData ($randomDelayInput, IniRead($file, "settings", "randomDelayInput", 0.3))	
	GUICtrlSetData ($clickButton, IniRead($file, "settings", "clickButton", "Left-click"))	
			
	If IniRead($file, "settings", "singleClickRadio", "Error") = "True" Then
		GUICtrlSetState($singleClickRadio, $GUI_CHECKED)
		GUICtrlSetState($doubleClickRadio, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($singleClickRadio, $GUI_UNCHECKED)
		GUICtrlSetState($doubleClickRadio, $GUI_CHECKED)
	EndIf	
	
	GUICtrlSetData ($dClickMinInput, IniRead($file, "settings", "dClickMinInput", 120))	
	GUICtrlSetData ($dClickMaxInput, IniRead($file, "settings", "dClickMaxInput", 400))	
EndFunc

Func resetSettings()
	Local $result = MsgBox($MB_OKCANCEL, "Reset settings", "Do you want to reset settings? Click OK to reset program settings.")
	If ($result = 1) Then
		loadSettings("files/default.ini")		
	EndIf
EndFunc