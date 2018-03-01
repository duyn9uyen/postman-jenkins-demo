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

[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding(850)

#blc $url -rpg
node blc https://www.pacefoods.com/ -rpg

echo "End Powershell script: BrokenLinkCrawler.ps1"
