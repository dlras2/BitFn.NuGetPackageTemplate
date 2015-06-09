$source = "https://www.nuget.org/nuget.exe"
$nugetFolder = $PSScriptRoot + "\.nuget"
$nugetFile = $nugetFolder + "\nuget.exe"

# Download nuget.exe if it wasn't pulled from the cache
If (!(Test-Path -Path $nugetFile ))
{
  Write-Host "Downloading nuget.exe..."
  New-Item -ItemType Directory -Force -Path $nugetFolder | Out-Null
  Invoke-WebRequest $source -OutFile $nugetFile
}

# For each .sln file in the project root, restore its packages
Get-ChildItem $PSScriptRoot -Filter "*.sln" |
  Where-Object { $_.Attributes -ne "Directory"} |
    ForEach-Object {
      Write-Host "Restoring NuGet packages for $_..."
      & "$nugetFile" restore "$_"
    }

# Push pre-build settings artifacts for debugging
Push-AppveyorArtifact environment.txt
Get-ChildItem AssemblyInfo.* -Recurse | % { Push-AppveyorArtifact $_.FullName -FileName $_.Name }