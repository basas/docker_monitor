describe docker_image('prom/prometheus:v2.20.1') do
  it { should exist }
end

describe docker_container('prometheus') do
  it { should exist }
  it { should be_running }
end

describe port(9090) do
  it { should be_listening }
end

ip_addr = command("ifconfig eth0 |grep \"inet \" | awk '{print $2}'").stdout.strip

describe command('curl -s http://' + ip_addr + ':9090/-/ready') do
  its('stdout') { should eq "Prometheus is Ready.\n" }
end

describe command('curl -s http://' + ip_addr + ':9090/-/healthy') do
  its('stdout') { should eq "Prometheus is Healthy.\n" }
end
