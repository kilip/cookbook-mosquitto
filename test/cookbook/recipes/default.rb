directory '/etc/mosquitto/certs' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

openssl_x509_certificate '/etc/mosquitto/certs/test.pem' do
  common_name 'test.mosquitto.com'
  org 'DoyoLabs'
  country 'ID'
end

include_recipe 'mosquitto::default'
