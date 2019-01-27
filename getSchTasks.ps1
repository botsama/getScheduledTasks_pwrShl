# Collect Event Logs from Local Machine
# This should be run as Administrator from escalated level console to get all Scripts.

$boxName = $env:COMPUTERNAME
$outSchTsk01 = ".\$($boxName)_Scheduled-Tasks.log"

Filter timestamp {"Logs collected at $(Get-Date -Format "yyyy-MM-dd HH mm ss")"}

Get-ScheduledTask | Select TaskName, State, TaskPath | Sort-Object -Property TaskPath | Format-table -wrap | Out-File $outSchTsk01
timestamp | Out-File -Append $outSchTsk01