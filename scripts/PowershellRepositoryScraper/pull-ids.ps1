[String]$RepoName = "rmm-scripts-master"
[String]$Path = "$env:userprofile\Desktop\$RepoName\$RepoName\scripts"
[PSObject]$ScriptDirectories = Get-ChildItem -Path $Path -Directory

$Date = Get-Date -Format MMddyyyy-hhmm
[HashTable]$outputObject = New-Object -TypeName PSObject
$OutputArray = @()

ForEach($ScriptDirectory in $ScriptDirectories) {
    $DirectoryJSON = Get-ChildItem -Path $ScriptDirectory.FullName -Filter "*.json"
    if($DirectoryJSON) {
        $ScriptJSON = Get-Content -Path $DirectoryJSON.FullName | ConvertFrom-JSON

        $ScriptDirectory.Name
        $ScriptJSON.id

        $OutputArray += [pscustomobject]@{
        "GitName" = $ScriptDirectory.Name
        "GitID" = $ScriptJSON.id
        "GitCat" = $ScriptJSON.category[0]
        }
       }
}
#Out-File -InputObject $OutputArray -FilePath "C:\temp\Output-$Date.csv"
$OutputArray | Export-CSV -Path "C:\temp\output-$RepoName-$Date.csv" -NoTypeInformation