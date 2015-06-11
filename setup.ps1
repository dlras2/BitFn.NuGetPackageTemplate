$old_name = "BitFn.NugetPackageTemplate"
$name_regex = "^[0-9A-Za-z]+(\.[0-9A-Za-z]+)*$"

# Gather variables
Clear-Host
$new_name = read-host "Solution/Library Name (e.g. BitFn.MyLibrary)"
While (!($new_name -match $name_regex))
{
  Write-Host "Invalid name:" $new_name -foreground "red"
  $new_name = read-host "Solution/Library Name (e.g. BitFn.MyLibrary)"
}

# Prepare solution
Rename-Item -path "$old_name.sln" -newname "$new_name.sln" -whatIf
#Get-ChildItem *.cs -Recurse | % {
#  Get-Content $_.PSPath |
#  % { $_ -replace $old_name, $new_name } | 
#  Set-Content $_.PSPath
#}