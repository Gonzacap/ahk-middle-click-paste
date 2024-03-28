; Configura el atajo para copiar solo texto al soltar el botón izquierdo del ratón
~LButton Up::
    if GetKeyState("Control") ; Verifica si la tecla Control está presionada
    {
        ; Obtiene el texto seleccionado usando control + C
        Send, ^c
        ClipWait
        if (ErrorLevel = 0 && Clipboard != "") { ; Verifica que haya texto seleccionado y que no esté vacío
            ; Guarda solo el texto copiado en el portapapeles
            SelectedText := Clipboard
            ; Copia solo texto al portapapeles
            Clipboard := SelectedText
        }
    }
    ; Retorna el control al sistema
    Return

; Configura el atajo para pegar el texto al presionar la rueda del ratón
MButton::
    ; Realiza un clic antes de pegar el texto
    Click
    ; Espera a que se complete el clic
    Sleep 100
    ; Pega el texto
    SendInput, ^v
    ; Retorna el control al sistema
    Return