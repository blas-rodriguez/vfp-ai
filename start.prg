* VFP-AI entry point. Run inside the Visual FoxPro 9 IDE.
LOCAL lcRoot, loChat
lcRoot = ADDBS(JUSTPATH(SYS(16, 0)))
loChat = NEWOBJECT("VfpAiChat", lcRoot + "src\vfp\chat.prg", "", lcRoot)
loChat.Show(1)
RETURN
