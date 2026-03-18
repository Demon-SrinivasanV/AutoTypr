^q:: ; Trigger when Ctrl + Q is pressed
{
    ; Path to the file containing the text to be typed
    FilePath := "C:\Users\Demon - PSP\Desktop\AutoTyprContent.txt"

    ; Check if the file exists, show error and exit if not
    if !FileExist(FilePath)
    {
        MsgBox, 16, Error, The specified file does not exist: %FilePath%
        return
    }

    ; Read the file contents into FileContent
    FileRead, FileContent, %FilePath%

    ; Check if file read failed, show error and exit if so
    if ErrorLevel
    {
        MsgBox, 16, Error, Failed to read the file: %FilePath%
        return
    }

    ; Use Event mode to simulate real keystrokes
    SendMode, Event
    ; 0ms between keys, 30ms key press duration
    SetKeyDelay, 0, 30

    ; Normalize line endings to LF only (remove CR from CRLF)
    StringReplace, FileContent, FileContent, `r`n, `n, All

    ; Counter to track characters sent, used for periodic buffer flush pauses
    charCount := 0

    ; Loop through each line in the file
    Loop, Parse, FileContent, `n
    {
        ; Loop through each character in the current line
        Loop, Parse, A_LoopField
        {
            char := A_LoopField
            ; Get the decimal Unicode code point of the character
            code := Asc(char)
            ; Convert decimal to 4-digit uppercase hex (e.g. 65 -> 0041)
            hex := Format("{:04X}", code)
            ; Send the character using its Unicode code point
            Send, {U+%hex%}

            ; Increment character counter
            charCount++
            ; Every 50 characters, pause 100ms to let the app's input buffer clear
            if (Mod(charCount, 50) == 0)
                Sleep, 100
        }

        ; Send Enter at the end of each line
        Send, {Enter}
        ; Also pause after each line to give the app time to process
        Sleep, 50
    }

    return
}
