param(
    $DownloadLink = "https://github.com/ate47/atian-cod-tools/releases/latest/download/acts.zip",
    [switch]
    $RemoveBuild
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).parent
    Set-Location ($base.Fullname)

    $base = "build/package_index"

    if ($RemoveBuild) {
        Remove-Item -Recurse -Force -ErrorAction Ignore "build" > $null
    } else {
        Remove-Item -Recurse -Force -ErrorAction Ignore "$base" > $null
        Remove-Item -Force -ErrorAction Ignore "$base.zip" > $null
    }

    New-Item -ItemType Directory build -ErrorAction Ignore > $null
    New-Item -ItemType Directory $base -ErrorAction Ignore > $null

    if (Test-Path .\build\acts.zip) {
        Write-Host "Already there."
    } else {
        Invoke-WebRequest -Uri $DownloadLink -OutFile .\build\acts.zip
    }
    Write-Host "Extracting"

    if (Test-Path .\build\acts) {
        Write-Host "Already there."
    } else {
        Expand-Archive .\build\acts.zip .\build\
    }

    
    Write-Host "Building hash index directory"
    foreach ($file in (Get-ChildItem hashes)) {
        $split = $file.Name.LastIndexOf('.')

        if ($split -ne -1) {
            $fileOut = "$base/$($file.Name.SubString(0, $split)).wni"
        } else {
            $fileOut = "$base/$($file.Name).wni"
        }

        build\acts\bin\acts.exe wni_gen_csv $file.FullName $fileOut
    }
    
    Compress-Archive -LiteralPath "$base" -DestinationPath "$base.zip" > $null
    Write-Host "Packaged to '$base.zip'"
}
finally {
    $prevPwd | Set-Location
}