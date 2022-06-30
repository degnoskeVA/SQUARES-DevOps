param($username)
Write-Host "Deleting Error Logs" 
sfdx config:set maxQueryLimit=200000
sfdx force:data:soql:query -q "SELECT Id FROM ACMN_Error_Log__c" --resultformat csv -u $org_alias  | Out-File -encoding oem out.csv 
sfdx force:data:bulk:delete -s ACMN_Error_Log__c -f out.csv -u $org_alias
