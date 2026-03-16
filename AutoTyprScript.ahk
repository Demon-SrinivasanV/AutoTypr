^q:: ; Trigger when Ctrl + Q is pressed
{
    ; Specify the file path
    FilePath := "C:\path\to\your\AutoTyprContent.txt"
    
    ; Check if the file exists
    if !FileExist(FilePath)
    {
        MsgBox, 16, Error, The specified file does not exist: %FilePath%
        return
    }
    
    ; Read the file content
    FileRead, FileContent, %FilePath%
    
    ; Check for errors in reading the file
    if ErrorLevel
    {
        MsgBox, 16, Error, Failed to read the file: %FilePath%
        return
    }
    
    ; Force CapsLock OFF before typing to prevent casing issues on VDI
    SetCapsLockState, off
    
    ; Normalize line endings by replacing `\r\n` with `\n`
    StringReplace, FileContent, FileContent, `r`n, `n, All
    
    ; Input the content character by character
    Loop, Parse, FileContent, `n
    {
        ; Send each character of the current line
        Loop, Parse, A_LoopField
        {
            SendRaw, %A_LoopField%
        }
        
        ; Add a single newline after each line
        Send, {Enter}
    }
    return
}
