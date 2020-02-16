config_path = node['mosquitto']['path']

template "#{config_path}/mosquitto.conf" do
  source 'mosquitto.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[mosquitto]'
end

unless node['mosquitto']['users'].empty?
  password_file = node['mosquitto']['password_file']

  file password_file do
    content 'content'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    not_if { ::File.exist?(password_file) }
  end

  node['mosquitto']['users'].each do |user|
    username      = user['username']
    password      = user['password']
    password_file = node['mosquitto']['password_file']

    execute "create user #{username}" do
      command <<-eos
  mosquitto_passwd -b #{password_file} #{username} #{password}
      eos
      action :run
    end
  end

end
