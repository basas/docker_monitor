describe package('docker-ce') do
  it { should be_installed }
  its('version') { should match '19.03.12*' }
end

describe service('docker') do
  it { should be_enabled }
  it { should be_running }
end
