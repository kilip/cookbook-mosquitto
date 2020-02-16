
include_recipe 'mosquitto::_package'
include_recipe 'mosquitto::_config'

service 'mosquitto' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
