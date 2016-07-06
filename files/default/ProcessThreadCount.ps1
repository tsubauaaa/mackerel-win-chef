$Server = $env:COMPUTERNAME
$Perf = Get-Counter -Counter "\\${Server}\Process(_total)\Thread Count"
$PValue = $Perf.CounterSamples.CookedValue
$TimeStamp = $Perf.TimeStamp
$EpochTime = Get-Date $TimeStamp -uFormat "%s"
Write-Output thread_count.count`t$PValue`t$EpochTime
