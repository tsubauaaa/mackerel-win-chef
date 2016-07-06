require 'serverspec'

set :backend, :cmd
set :os, :family => 'windows'

describe package('mackerel-agent') do
  it { should be_installed }
end

describe service('mackerel-agent') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe file('C:/Program Files (x86)/Mackerel/mackerel-agent/mackerel-agent.conf') do
  it { should be_file }
  its(:content) { should match /apikey/ }
end

describe file('C:/mackerel-scripts') do
  it { should be_directory }
end
