default['mackerel-win']['apikey'] = 'YOUR_MACKEREL_APIKEY_HERE'
default['mackerel-win']['source'] = 'https://mackerel.io/file/agent/msi/mackerel-agent-latest.msi'
default['mackerel-win']['scripts'] = %w(DiskQueueLength.ps1 NetworkInterfaceByte.ps1 DiskReadWriteTime.ps1 ProcessThreadCount.ps1 ThreadContextSwitches.ps1 NetworkConnectionStates.ps1)
