describe docker_image('grafana/grafana:7.1.5') do
  it { should exist }
end

describe docker_container('grafana') do
  it { should exist }
  it { should be_running }
end

describe port(3000) do
  it { should be_listening }
end

describe command('curl -s http://localhost:3000/api/health') do
  its('stdout') { should match(/.*\"database\": \"ok\",.*/) }
end
