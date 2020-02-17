
apt_repository 'mosquitto' do
  uri 'ppa:mosquitto-dev/mosquitto-ppa'
  action :add
end

%w(mosquitto mosquitto-clients).each do |pkg|
  apt_package pkg do
    action :install
  end
end
