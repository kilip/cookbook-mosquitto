describe service('mosquitto') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port(1883) do
  it { should be_listening }
end

describe port(8883) do
  it { should be_listening }
end

describe port(9001) do
  it { should be_listening }
end
