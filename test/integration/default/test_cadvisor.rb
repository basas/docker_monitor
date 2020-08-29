describe docker_image('gcr.io/cadvisor/cadvisor:v0.36.0') do
  it { should exist }
end

describe docker_container('cadvisor') do
  it { should exist }
  it { should be_running }
end

describe port(8080) do
  it { should be_listening }
end

ip_addr = command("ifconfig eth0 |grep \"inet \" | awk '{print $2}'").stdout.strip

describe command('curl -s http://' + ip_addr + ':8080/containers/') do
  its('stdout') { should match %r{.*cAdvisor - \/.*} }
end
