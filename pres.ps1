$filename = "loader.py"
$desktopPath = [Environment]::GetFolderPath("Desktop")
$found = $false

$desktopFile = Join-Path $desktopPath $filename
if (Test-Path $desktopFile) {
    python "$desktopFile"
    $found = $true
}

if (-not $found) {
    $userProfile = $env:USERPROFILE
    $result = Get-ChildItem -Path $userProfile -Recurse -Filter $filename -ErrorAction SilentlyContinue -Force | Select-Object -First 1

    if ($result) {
        python "$($result.FullName)"
    }
}
