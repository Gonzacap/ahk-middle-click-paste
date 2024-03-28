; Variable para almacenar el texto copiado
CopiedText := ""
; Variable para almacenar el estado anterior del portapapeles
ClipboardPrevState := ""

; Configura el atajo para copiar solo texto al soltar el botón izquierdo del ratón
~LButton Up::RetrieveSelectedText()

; Configura el atajo para pegar el texto al presionar la rueda del ratón
MButton::pasteSelectedText()

; Funcion para copiar el texto seleccionado
RetrieveSelectedText() {
    if GetKeyState("Control") ; Verifica si la tecla Control está presionada
        {
            ClipboardPrevState := Clipboard
            ; Obtiene el texto seleccionado usando control + C
            Send, ^c
            ClipWait
            if (ErrorLevel = 0 && Clipboard != "") { ; Verifica que haya texto seleccionado y que no esté vacío
                ; Guarda solo el texto copiado en el portapapeles
                SelectedText := Clipboard
                ; Copia solo texto a la variable CopiedText
                CopiedText := SelectedText
            }
            ; Restauara el estado anterior al portapapeles
            Clipboard := ClipboardPrevState
        }
        ; Retorna el control al sistema
        Return
}

; Funcion para pegar el texto seleccionado usando la rueda del raton
pasteSelectedText(){
    if (CopiedText != "") { ; Verifica que haya texto copiado en la variable
        ; Realiza un clic antes de pegar el texto
        Click
        ; Espera a que se complete el clic
        Sleep 100
        ; Pega el texto copiado
        SendInput, %CopiedText%
    }
    ; Retorna el control al sistema
    Return
}