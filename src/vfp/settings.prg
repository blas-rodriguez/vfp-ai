DEFINE CLASS VfpAiSettings AS Form
    Caption = "VFP-AI - Configuracion"
    Width = 560
    Height = 280
    AutoCenter = .T.
    BorderStyle = 2
    MaxButton = .F.
    MinButton = .F.
    DataSession = 2

    ADD OBJECT lblProvider AS Label WITH ;
        Left = 20, Top = 24, Width = 520, Height = 24, ;
        Caption = "Proveedor activo: Demo local"

    ADD OBJECT lblStatus AS Label WITH ;
        Left = 20, Top = 64, Width = 520, Height = 24, ;
        Caption = "Conexion a servicios de IA: pendiente de implementacion."

    ADD OBJECT lblKeys AS Label WITH ;
        Left = 20, Top = 104, Width = 520, Height = 48, ;
        WordWrap = .T., ;
        Caption = "Esta version no solicita ni guarda claves API. La configuracion de proveedores se incorporara con el puente de comunicaciones."

    ADD OBJECT lblTarget AS Label WITH ;
        Left = 20, Top = 172, Width = 520, Height = 24, ;
        Caption = "Lenguaje objetivo: Microsoft Visual FoxPro 9.0"

    ADD OBJECT cmdClose AS CommandButton WITH ;
        Left = 420, Top = 224, Width = 120, Height = 32, ;
        Caption = "Cerrar", Cancel = .T.

    PROCEDURE cmdClose.Click
        Thisform.Release()
    ENDPROC
ENDDEFINE
