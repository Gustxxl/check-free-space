Get-PSDrive -PSProvider 'FileSystem' | ForEach-Object {
    $freeBytes = $_.Free
    $totalBytes = $_.Used + $_.Free
    $freeGB = [math]::Round($freeBytes / 1GB, 2)
    $totalGB = [math]::Round($totalBytes / 1GB, 2)
    $usedGB = [math]::Round($totalGB - $freeGB, 2)
    $percentFree = [math]::Round(($freeBytes / $totalBytes) * 100, 2)

    [PSCustomObject]@{
        Диск = $_.Name
        'Свободно (GB)' = "$freeGB"
        'Всего (GB)' = "$totalGB"
        'Занято (GB)' = "$usedGB"
        'Свободно (%)' = "$percentFree"
        'Свободно (байт)' = "$freeBytes"
    }
} | Format-Table -AutoSize
