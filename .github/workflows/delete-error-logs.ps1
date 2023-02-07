param($username)
Write-Host "Deleting Error Logs" 
sfdx config:set maxQueryLimit=200000 -g
sfdx data query -q "SELECT Id FROM ACMN_Error_Log__c" --result-format csv -o $username  | Out-File -encoding oem out.csv 
sfdx data delete bulk -s ACMN_Error_Log__c -f out.csv -o $username 
