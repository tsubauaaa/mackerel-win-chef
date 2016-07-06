$Server = $env:COMPUTERNAME
$Adapter = "0"
$NIC = (Get-NetAdapter)[$Adapter] | Select-Object InterfaceDescription
$NICName = $NIC.InterfaceDescription.Replace("/","_").Replace("(","[").Replace(")","]")
$Category = "sent", "received"
ForEach($Cat in $Category) {
  $Perf = Get-Counter -Counter "\\${Server}\Network Interface(${NICName})\Bytes ${Cat}/Sec"
  $PValue = $Perf.CounterSamples.CookedValue
  $TimeStamp = $Perf.Timestamp
  $EpochTime = Get-Date $TimeStamp -uFormat "%s"
  Write-Output network_interface_byte.$Cat`t$PValue`t$EpochTime
}
