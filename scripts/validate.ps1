param(
    [switch]
    $RemoveBuild,
    $ext = "wni"
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).parent
    Set-Location ($base.Fullname)

    Write-Host "Validate hash index directory"

    acts sort_file hashes --validate
    if (!$?) {
        Write-Error "Failed to validate hashes"
        exit -1
    }
    
    Write-Host "Validation complete."
}
finally {
    $prevPwd | Set-Location
}