describe service('node_exporter_main') do
  it { should be_enabled }
  it { should be_running }
end

describe port(9100) do
  it { should be_listening }
  its('processes') { should include 'node_exporter' }
end

ip_addr = command("ifconfig eth0 |grep \"inet \" | awk '{print $2}'").stdout.strip

describe command("curl -s http://#{ip_addr}:9100") do
  its('stdout') { should match(/.*Node Exporter.*/) }
end
