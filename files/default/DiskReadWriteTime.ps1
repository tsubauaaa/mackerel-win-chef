$Server = $env:COMPUTERNAME
$AllPerf = Get-Counter -Counter "\\${Server}\PhysicalDisk(*)\AVG. Disk Sec/Read"
$InstanceName = $AllPerf.CounterSamples.InstanceName
$Category = "read", "write"
ForEach($Ins in $InstanceName) {
  IF ($Ins -ne "_total") {
    ForEach($Cat in $Category) {
      $Perf = Get-Counter -Counter "\\${Server}\PhysicalDisk(${Ins})\AVG. Disk Sec/${Cat}"
      $PValue = $Perf.CounterSamples.CookedValue * 1000
      $TimeStamp = $Perf.Timestamp
      $EpochTime = Get-Date $TimeStamp -uFormat "%s"
      $NewIns = $Ins.Replace(" ","").Replace(":","").Replace
      Write-Output disk_read_write_time.$NewIns`_$Cat`t$PValue`t$EpochTime
    }
  }
}
