$Server = $env:COMPUTERNAME
$Perf = Get-Counter -Counter "\\${Server}\Thread(_total)\Context Switches/sec"
$PValue = $Perf.CounterSamples.CookedValue
$TimeStamp = $Perf.TimeStamp
$EpochTime = Get-Date $TimeStamp -uFormat "%s"
Write-Output thread_context_switches.context_switches`t$PValue`t$EpochTime
