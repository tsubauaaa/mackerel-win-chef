$Server = $env:COMPUTERNAME
$Category = "established", "failures", "reset", "active", "passive"
ForEach($Cat in $Category) {
  IF ($Cat -eq "failures") {
    $Perf = Get-Counter -Counter "\\${Server}\TCPv4\Connection ${Cat}"
  }Else {
    $Perf = Get-Counter -Counter "\\${Server}\TCPv4\Connections ${Cat}"
  }
  $PValue = $Perf.CounterSamples.CookedValue
  $TimeStamp = $Perf.Timestamp
  $EpochTime = Get-Date $TimeStamp -uFormat "%s"
  Write-Output network_connection_states.$Cat`t$PValue`t$EpochTime
}
