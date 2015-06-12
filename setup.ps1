# Gather variables
Clear-Host
$old_name = "BitFn.NugetPackageTemplate"
$new_name = read-host "Solution/Library Name (e.g. BitFn.MyLibrary)"
$name_regex = "^[0-9A-Za-z]+(\.[0-9A-Za-z]+)*$"
While (!($new_name -match $name_regex))
{
  Write-Host "Invalid name:" $new_name -foreground "red"
  $new_name = read-host "Solution/Library Name (e.g. BitFn.MyLibrary)"
}
$old_author = "Daniel Rasmussen"
$new_author = read-host "Author/Company Name"

$OutputEncoding = [System.Text.Encoding]::UTF8
# Rename solution
Rename-Item -path "$old_name.sln" -newname "$new_name.sln"
# Replace global changes
Get-ChildItem . -Include *.cs, *.*proj, *.config, *.nuspec -Recurse | % {
  (Get-Content $_.PSPath) |
  % { $_ -replace "\b"+$old_name+"\b", $new_name -replace "\b"+$old_author+"\b", $new_author } |
  Write-Output | Out-File $_.PSPath -encoding utf8
}
