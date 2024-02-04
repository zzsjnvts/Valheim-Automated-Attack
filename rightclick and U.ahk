#Persistent

U::
    ; Get the current state of the keyboard and mouse buttons
    GetKeyState, stateR, R
    GetKeyState, stateM, M
    GetKeyState, stateSpace, Space

    ; If any of the keys are already pressed, do nothing
    if (stateR = "D" or stateM = "D" or stateSpace = "D")
        return

    ; Call Windows API functions to simulate simultaneous actions
    DllCall("mouse_event", uint, 0x02, uint, 0, uint, 0, uint, 0, ptr, 0) ; Right button down
    DllCall("mouse_event", uint, 0x20, uint, 0, uint, 0, uint, 0, ptr, 0) ; Middle button down
    Send, {Space down}

    ; Simulate a left mouse click
    Click down

    ; Wait for the 'U' key to be released
    KeyWait, U

    ; Release the simulated actions
    DllCall("mouse_event", uint, 0x04, uint, 0, uint, 0, uint, 0, ptr, 0) ; Right button up
    DllCall("mouse_event", uint, 0x40, uint, 0, uint, 0, uint, 0, ptr, 0) ; Middle button up
    Send, {Space up}
    Click up
return
