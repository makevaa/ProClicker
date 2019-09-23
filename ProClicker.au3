#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <ComboConstants.au3>
#include <gui.au3>
#include <utility.au3>

Func idle()
	While 1		
		Switch GUIGetMsg() 	
			Case $GUI_EVENT_CLOSE
				exitScript()					
				
			Case $saveButton
				saveSettings()	
				
			Case $resetButton
				resetSettings()		
				
		EndSwitch	
		sleep(40)	
	WEnd
EndFunc 

Func click()	
	Local $clickInterval = Number(GUICtrlRead($clickIntervalInput)) * 1000
	Local $clickLimit = Number(GUICtrlRead($clickLimitInput))
	Local $randomDelay = Number(GUICtrlRead($randomDelayInput)) * 1000
	Local $button
	
	Switch GUICtrlRead($clickButton)	
		Case "Left-click"
			$button = $MOUSE_CLICK_LEFT			
		Case "Right-click"
			$button = $MOUSE_CLICK_RIGHT		
		Case "Middle-click"
			$button = $MOUSE_CLICK_MIDDLE 					
	EndSwitch	
		
	Local $doubleClick = false
	
	If GUICtrlRead($doubleClickRadio) = $GUI_CHECKED Then
		$doubleClick = true
	EndIf
	
	
	Local $dClickSpeedMin = Number(GUICtrlRead($dClickMinInput))
	Local $dClickSpeedMax = Number(GUICtrlRead($dClickMaxInput))
	
	Local $clicks = 0
	
	While 1
		If $clickLimit <> 0 And $clicks >= $clickLimit Then
			ExitLoop
		Else		
			MouseClick($button)	
			If $doubleClick = true Then
				ranSleep($dClickSpeedMin, $dClickSpeedMax)
				MouseClick($button)
			EndIf
				
			$clicks += 1
			sleep($clickInterval + Random(0, $randomDelay, 1))			
		EndIf
	WEnd

	idle()
EndFunc

Func exitScript()
	exit
EndFunc


HotkeySet ("{F9}", click)
HotkeySet ("{F10}", idle)
HotkeySet ("{ESC}", exitScript)

loadSettings("files/config.ini")
idle()