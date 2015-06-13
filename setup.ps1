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
# Replace README
Remove-Item README.md
Rename-Item README.setup.md README.md
# Replace project and author names
Get-ChildItem . -Include *.cs, *.*proj, *.config, *.nuspec, *.md -Recurse | % {
  (Get-Content $_.PSPath) |
  % { $_ -replace $old_name, $new_name -replace $old_author, $new_author } |
  Write-Output | Out-File $_.PSPath -encoding utf8
}
# Replace assembly GUIDs with new GUIDs
Get-ChildItem . -Include AssemblyInfo.cs -Recurse | % {
  (Get-Content $_.PSPath) |
  % { $_ -replace "[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}", [guid]::NewGuid() } |
  Write-Output | Out-File $_.PSPath -encoding utf8
}
# Clean up script
Remove-Item $MyInvocation.InvocationName