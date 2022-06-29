

Write-Host "AUTHENTICATING SALESFORCE ORG (VIA AUTH URL)" 
$org_alias = "squaredev2"
$auth_url = "force://PlatformCLI::5Aep861YbQ2WNspBqEUgFsHVTHaTaclYz2mONygu9Iyc.gICvY91IPR1qFRuHMq2Lie7iUST.FJWDGC.Q8pYbbn@va--squaredev2.my.salesforce.com"
$key_file = "auth_url.key"

New-Item -Type File $key_file | Out-Null
$auth_url | Out-File $key_file

$auth_result_json = $(sfdx auth:sfdxurl:store -f $key_file -a $org_alias --json)
Write-Host $auth_result_json
$auth_result = $auth_result_json| ConvertFrom-Json
$auth_result.status
