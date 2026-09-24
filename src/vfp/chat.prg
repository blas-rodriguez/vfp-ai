* ASCII source for compatibility with VFP code pages.
DEFINE CLASS VfpAiChat AS Form
    Caption = "VFP-AI - Demo local"
    Width = 780
    Height = 570
    AutoCenter = .T.
    BorderStyle = 2
    MaxButton = .F.
    MinButton = .F.
    DataSession = 2
    cProjectRoot = ""

    ADD OBJECT lblMode AS Label WITH ;
        Left = 16, Top = 16, Width = 740, Height = 24, ;
        Caption = "Demo local: sin conexion a IA. Las respuestas son de ejemplo."

    ADD OBJECT txtHistory AS EditBox WITH ;
        Left = 16, Top = 48, Width = 748, Height = 320, ;
        ReadOnly = .T., TabStop = .F., Value = ""

    ADD OBJECT lblPrompt AS Label WITH ;
        Left = 16, Top = 380, Width = 740, Height = 22, ;
        Caption = "Escribi una instruccion para probar el chat:"

    ADD OBJECT txtPrompt AS EditBox WITH ;
        Left = 16, Top = 406, Width = 748, Height = 92, ;
        TabIndex = 1, MaxLength = 4000, Value = ""

    ADD OBJECT cmdSend AS CommandButton WITH ;
        Left = 16, Top = 516, Width = 100, Height = 32, ;
        TabIndex = 2, Caption = "Enviar"

    ADD OBJECT cmdSettings AS CommandButton WITH ;
        Left = 132, Top = 516, Width = 140, Height = 32, ;
        TabIndex = 3, Caption = "Configuracion"

    ADD OBJECT cmdExample AS CommandButton WITH ;
        Left = 288, Top = 516, Width = 160, Height = 32, ;
        TabIndex = 4, Caption = "Ver ejemplo PRG"

    ADD OBJECT cmdClose AS CommandButton WITH ;
        Left = 664, Top = 516, Width = 100, Height = 32, ;
        TabIndex = 5, Caption = "Cerrar", Cancel = .T.

    PROCEDURE Init
        LPARAMETERS tcProjectRoot
        This.cProjectRoot = tcProjectRoot
        This.AppendMessage("VFP-AI", ;
            "Bienvenido. Este prototipo muestra la interfaz. " + ;
            "Todavia no genera codigo ni consulta proveedores de IA.")
    ENDPROC

    PROCEDURE AppendMessage
        LPARAMETERS tcAuthor, tcMessage
        LOCAL lcNewLine
        lcNewLine = CHR(13) + CHR(10)
        This.txtHistory.Value = This.txtHistory.Value + ;
            tcAuthor + ":" + lcNewLine + tcMessage + lcNewLine + lcNewLine
        This.txtHistory.SelStart = LEN(This.txtHistory.Value)
    ENDPROC

    PROCEDURE SendPrompt
        LOCAL lcPrompt
        lcPrompt = ALLTRIM(This.txtPrompt.Value)
        IF EMPTY(CHRTRAN(lcPrompt, CHR(13) + CHR(10) + CHR(9), ""))
            This.txtPrompt.SetFocus()
            RETURN
        ENDIF
        This.AppendMessage("Vos", lcPrompt)
        This.AppendMessage("VFP-AI [demo]", ;
            "Mensaje recibido en modo de demostracion. " + ;
            "No se envio a una IA y no se crearon archivos. " + ;
            "Podes abrir 'Ver ejemplo PRG' para ver un formulario nativo.")
        This.txtPrompt.Value = ""
        This.txtPrompt.SetFocus()
    ENDPROC

    PROCEDURE cmdSend.Click
        Thisform.SendPrompt()
    ENDPROC

    PROCEDURE cmdSettings.Click
        LOCAL loSettings
        loSettings = NEWOBJECT("VfpAiSettings", ;
            Thisform.cProjectRoot + "src\vfp\settings.prg")
        loSettings.Show(1)
    ENDPROC

    PROCEDURE cmdExample.Click
        LOCAL loExample
        loExample = NEWOBJECT("VfpAiHelloForm", ;
            Thisform.cProjectRoot + "examples\hello_form.prg")
        loExample.Show(1)
    ENDPROC

    PROCEDURE cmdClose.Click
        Thisform.Release()
    ENDPROC
ENDDEFINE
