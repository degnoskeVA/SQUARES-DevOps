sfdx force:data:soql:query -q "SELECT Id FROM ACMN_Error_Log__c" --resultformat csv -u squaredev2 | Out-File -encoding oem out.csv 
sfdx force:data:bulk:delete -s ACMN_Error_Log__c -f out.csv -u squaredev2
