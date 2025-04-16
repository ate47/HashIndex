param(
    $DownloadLink = "https://github.com/ate47/atian-cod-tools/releases/download/2.5.3/acts.zip",
    [switch]
    $RemoveBuild
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).parent
    Set-Location ($base.Fullname)

    $buildDir = "build/package"
    $base = "build/package_index"

    if ($RemoveBuild) {
        Remove-Item -Recurse -Force -ErrorAction Ignore "build" > $null
    } else {
        Remove-Item -Recurse -Force -ErrorAction Ignore "$base" > $null
        Remove-Item -Recurse -Force -ErrorAction Ignore "$buildDir" > $null
    }

    New-Item -ItemType Directory $buildDir -ErrorAction Ignore > $null
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

    function WniName ($fileName) {
        $split = $fileName.LastIndexOf('.')

        if ($split -ne -1) {
            return "$($fileName.SubString(0, $split)).wni"
        } else {
            return "$($fileName).wni"
        }
    }

    function HandleHashes($file, $id) {
        Write-Host "Handling '$file' - '$id'"
        $fileName = (Get-Item $file).Name
        if (Test-Path -Path $file -PathType Container) {
            if ($id.Length -eq 0) {
                $id = $fileName
            } else {
                $id = "$id-$fileName"
            }

            # save tmp
            Remove-Item -Recurse -Force -ErrorAction Ignore "$base-$id" > $null
            Move-Item $base "$base-$id"
            New-Item -ItemType Directory $base -ErrorAction Ignore > $null

            $r = $true
            foreach ($subFile in (Get-ChildItem $file)) {
                $subFileName = "$file/$($subFile.Name)"
                
                if (!(HandleHashes $subFileName $id)) {
                    $r = $false
                }
            }

            $buildOut = "$buildDir/$id-all.zip"
            # all our hashes of this dir are in package_index
            Remove-Item -Force -ErrorAction Ignore $buildOut > $null
            Compress-Archive -LiteralPath "$base" -DestinationPath $buildOut > $null
            Write-Host ""
            Write-Host "Packaged to '$buildOut'"
            
            Move-Item "$base/*" "$base-$id"
            Remove-Item -Recurse -Force -ErrorAction Ignore "$base" > $null
            Move-Item "$base-$id" $base
            return $r
        } else {
            $fileOut = "$base/$id-$(WniName($fileName))"
    
            
            if (!(build\acts\bin\acts.exe -t wni_gen_csv $file $fileOut)) {

                Write-Error "Error when compiling $fileOut"
                return $false
            }
            return $true
        }

    }

    if (!(HandleHashes "hashes" "")) {
        exit -1
    }
    Move-Item "$base/*" "$buildDir"
    
    Write-Host "Packaged"
}
finally {
    $prevPwd | Set-Location
}