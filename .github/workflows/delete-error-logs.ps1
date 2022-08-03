param($username)
Write-Host "Deleting Error Logs" 
sfdx config:set maxQueryLimit=200000 -g
sfdx force:data:soql:query -q "SELECT Id FROM ACMN_Error_Log__c" --resultformat csv -u $username  | Out-File -encoding oem out.csv 
sfdx force:data:bulk:delete -s ACMN_Error_Log__c -f out.csv -u  $username 
