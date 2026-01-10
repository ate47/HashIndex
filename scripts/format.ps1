param(
    $DownloadLink = "https://github.com/ate47/atian-cod-tools/releases/download/2.20.0/acts.zip",
    [switch]
    $RemoveBuild,
    $ext = "wni"
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).parent
    Set-Location ($base.Fullname)

    New-Item -ItemType Directory "build" -ErrorAction Ignore > $null

    if (Test-Path .\build\acts.zip) {
        Write-Host "Already there."
    }
    else {
        Invoke-WebRequest -Uri $DownloadLink -OutFile .\build\acts.zip
    }
    Write-Host "Extracting"

    if (Test-Path .\build\acts) {
        Write-Host "Already there."
    }
    else {
        Expand-Archive .\build\acts.zip .\build\
    }
    
    Write-Host "Format hash index directory"

    build\acts\bin\acts.exe sort_file hashes
}
finally {
    $prevPwd | Set-Location
}