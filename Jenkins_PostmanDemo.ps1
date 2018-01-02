#Windows Batch Command in Jenkins
#powershell.exe -executionpolicy bypass -command "& '%WORKSPACE%\Jenkins_PostmanDemo.ps1'"

echo "You are in the powershell script now..."

$SourceFilePath = $env:WORKSPACE
$FilenamePostfix = "*.postman_collection.json"
$EnvironmentFile = "Demo-OpenWeatherMap.postman_environment.json"

# Get all Postman test files
$JsonFiles = Get-ChildItem -Path $SourceFilePath -name -Filter $FilenamePostfix | Sort-Object -Property CreationTime -Descending

# Change to directory where we have NodeJs installed.  Otherwise, the 'newman' command will not be recognized. 
# You can install NPM and Newman as a user and copy the ~Roaming\npm directory in the C:\ drive.
#cd C:\Users\[username]\AppData\Roaming\npm\node_modules\newman\bin
cd C:\npm\node_modules\newman\bin

# Loop through the json files and execute newman to run the Postman tests
foreach ($File in $JsonFiles) {
	$collectionfilepath = "$SourceFilePath\$File"
	$environmentfilepath = "$SourceFilePath\$EnvironmentFile"
	node newman run $collectionfilepath -e $environmentfilepath --disable-unicode 
}

exit $LASTEXITCODE