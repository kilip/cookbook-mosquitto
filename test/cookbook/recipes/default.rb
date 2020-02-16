
openssl_x509_certificate '/etc/mosquitto/certs/test.pem' do
  common_name 'test.mosquitto.com'
  org 'DoyoLabs'
  country 'ID'
end

include_recipe 'mosquitto::default'
