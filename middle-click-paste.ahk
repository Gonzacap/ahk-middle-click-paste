; Variable para almacenar el texto copiado
global CopiedText := ""

; Configura el atajo para copiar solo texto al soltar el botón izquierdo del ratón
~LButton Up::RetrieveSelectedText()

; Configura el atajo para pegar el texto al presionar la rueda del ratón
MButton::PasteSelectedText()

; Funcion para copiar el texto seleccionado
RetrieveSelectedText() {

    global CopiedText
    
    ; Guarda el estado anterior del portapapeles
    ClipboardPrevState := ClipboardAll
    ; Obtiene el texto seleccionado usando control + C
    Send, ^c
    ClipWait, 0.5
    if (ErrorLevel = 0 && A_Clipboard != "") { ; Verifica que haya texto seleccionado y que no esté vacío
        ; Guarda solo el texto copiado en la variable
        CopiedText := A_Clipboard
    }
    ; Restaura el estado anterior del portapapeles
    Clipboard := ClipboardPrevState
    
    ; Retorna el control al sistema
    Return
}

; Funcion para pegar el texto seleccionado usando la rueda del raton
PasteSelectedText(){

    ; Declarar la variables globales dentro de la función
    global CopiedText

    if (CopiedText != "") { ; Verifica que haya texto copiado en la variable
        ; Realiza un clic antes de pegar el texto
        Click
        ; Espera a que se complete el clic
        Sleep 50
        ; Guarda el estado anterior del portapapeles
        ClipboardPrevState := ClipboardAll
        ; Coloca el texto copiado directamente en el portapapeles
        Clipboard := CopiedText
        ; Pega el texto del portapapeles
        Send ^v
        ; Restaura el estado anterior del portapapeles
        Clipboard := ClipboardPrevState
    }
    ; Retorna el control al sistema
    Return
}