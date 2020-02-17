
describe service('mosquitto') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port(1883) do
  it { should be_listening }
  its('addresses') { should include '127.0.0.1' }
  its('protocols') { should include 'tcp' }
  its('addresses') { should_not include '0.0.0.0' }
end

describe port(8883) do
  it { should be_listening }
  its('protocols') { should include 'tcp' }
  its('addresses') { should include '0.0.0.0' }
end

describe port(9001) do
  it { should be_listening }
  its('protocols') { should include 'tcp' }
  its('addresses') { should include '0.0.0.0' }
end

describe command('mosquitto_pub -d -h localhost -t "test" -m "hello world"') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match /Connection Refused: not authorised./ }
end

describe command('mosquitto_pub -d  -u "foo" -P "bar" -h localhost -t "test" -m "hello world"') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match '' }
end

describe command('mosquitto_pub -d -u "foo" -P "bar" -h localhost -p 8883 -t "test" -m "hello world"') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match '' }
end
