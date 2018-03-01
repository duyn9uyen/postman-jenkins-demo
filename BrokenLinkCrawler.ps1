Param(
	#dev, stage, prod,
	[string] $environment = $null,	
	[string] $url = $null
)

echo "Start Powershell script: BrokenLinkCrawler.ps1"
echo "Environment Specified: " $Environment
echo "Date: 03/01/18"

# Change to directory where we have NodeJs installed.  Otherwise, the command will not be recognized. 
# You can install NPM as a user and copy the ~Roaming\npm directory in the C:\ drive.
#cd C:\Users\[username]\AppData\Roaming\npm\node_modules\
cd C:\npm\node_modules\broken-link-checker\bin

# Without this line, the output is unreadable
#[Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8
$OutputEncoding = New-Object -typename System.Text.UTF8Encoding

#blc $url -rpg
node blc https://www.pacefoods.com/ -rog 
#node blc http://unsubscribe.campbellsoupcompany.com/ -rog 

# if no errors are found $LASTEXITCODE == 0, else $LASTEXITCODE == 1
if($LASTEXITCODE -eq 1) {
	echo " ---- Broken links found! ---- "
	exit 1
}

echo "End Powershell script: BrokenLinkCrawler.ps1"
