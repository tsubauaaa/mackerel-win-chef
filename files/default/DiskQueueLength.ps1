$Server = $env:COMPUTERNAME
$AllPerf = Get-Counter -Counter "\\${Server}\PhysicalDisk(*)\Current Disk Queue Length"
$InstanceName = $AllPerf.CounterSamples.InstanceName
ForEach($Ins in $InstanceName) {
  IF ($Ins -ne "_total") {
    $Perf = Get-Counter -Counter "\\${Server}\PhysicalDisk(${Ins})\Current Disk Queue Length"
    $PValue = $Perf.CounterSamples.CookedValue
    $TimeStamp = $Perf.Timestamp
    $EpochTime = Get-Date $TimeStamp -uFormat "%s"
    $NewIns = $Ins.Replace(" ","").Replace(":","_drive")
    Write-Output disk_queue_length.$NewIns`t$PValue`t$EpochTime
  }
}
