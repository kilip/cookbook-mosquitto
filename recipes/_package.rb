
apt_repository 'mosquitto' do
  uri 'ppa:mosquitto-dev/mosquitto-ppa'
  action :add
end

apt_package 'mosquitto' do
  action :install
end
