$source = "https://www.nuget.org/nuget.exe"
$nugetFolder = $PSScriptRoot + "\.nuget"
$nugetFile = $nugetFolder + "\nuget.exe"
 
if(!(Test-Path -Path $nugetFile )){
   New-Item -ItemType Directory -Force -Path $nugetFolder | Out-Null
   Invoke-WebRequest $source -OutFile $nugetFile
}

Get-ChildItem $PSScriptRoot -Filter "*.sln" |
   Where-Object { $_.Attributes -ne "Directory"} |
      ForEach-Object {
         Write-Host "Restoring NuGet packages for $_..."
         & "$nugetFile" restore "$_"
      }