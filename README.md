### ReturnUnifiedAuditLog_O365.ps1
Script will pull last 90 days of Unified Audit Logs for specified user and export data to .csv at specified path. The script will loop allowing for as many reports as needed to be exported. 
The script can also be configured to use Get-Content with foreach to export logs for bulk amount of users.

NOTE: Due to PowerShell limitations the total amount of items returned will be a maximum of 5000. 
(refer to [Search-UnifiedAuditLog documentation, specifically the -ResultSize switch](https://docs.microsoft.com/en-us/powershell/module/exchange/policy-and-compliance-audit/search-unifiedauditlog?view=exchange-ps))

The script can also be modified to utilize the -RecordType switch to limit the records returned. Valid values for the switch are:

AzureActiveDirectory
AzureActiveDirectoryAccountLogon
AzureActiveDirectoryStsLogon
ComplianceDLPExchange
ComplianceDLPSharePoint
CRM
DataCenterSecurityCmdlet
Discovery
ExchangeAdmin
ExchangeAggregatedOperation
ExchangeItem
ExchangeItemGroup
MicrosoftTeams
MicrosoftTeamsAddOns
MicrosoftTeamsSettingsOperation
OneDrive
PowerBIAudit
SecurityComplianceAlerts
SecurityComplianceCenterEOPCmdlet
SecurityComplianceInsights
SharePoint
SharePointFileOperation
SharePointSharingOperation
SkypeForBusinessCmdlets
SkypeForBusinessPSTNUsage
SkypeForBusinessUsersBlocked
Sway
ThreatIntelligence
Yammer