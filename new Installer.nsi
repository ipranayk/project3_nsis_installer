OutFile "installer.exe"

InstallDir $PROGRAMFILES\configuration

RequestExecutionLevel admin

Section

SetOutPath $INSTDIR
File Project1.exe
writeUninstaller "$INSTDIR\Uninstall.exe"

CreateDirectory "$SMPROGRAMS\configuration"
CreateShortCut "$SMPROGRAMS\configuration\Uninstall.lnk" "$INSTDIR\Uninstall.exe"
CreateShortCut "$SMPROGRAMS\configuration\Project1.lnk" "$INSTDIR\Project1.exe"
WriteRegStr HKCU "SOFTWARE\configuration_key" 'string' 'INFO6025'
;messageBox MB_OK "hello world"

SectionEnd

Section "Uninstall"

delete "$INSTDIR\Uninstall.exe"
delete "$INSTDIR\Project1.exe"
delete "$SMPROGRAMS\configuration\Project1.lnk"
delete "$SMPROGRAMS\configuration\Uninstall.lnk"
RMDir "$SMPROGRAMS\configuration"
DeleteRegKey HKCU "SOFTWARE\configuration_key"
messageBox MB_OK "Congradulations! The application has been uninstalled."
SectionEnd