param(
    [switch]
    $RemoveBuild,
    $ext = "wni"
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).parent
    Set-Location ($base.Fullname)

    Write-Host "Format hash index directory"

    acts.exe sort_file hashes
}
finally {
    $prevPwd | Set-Location
}