require 'spec_helper.rb'

describe 'mosquitto::_config' do
  default_attributes['mosquitto'] = parse_data_bag('default')

  describe '~> create configuration' do
    file = '/etc/mosquitto/mosquitto.conf'
    it { is_expected.to create_template(file) }
    it {
      is_expected.to render_file(file)
        .with_content(/^cafile.*cafile.pem/)
        .with_content(/^certfile.*certfile.pem/)
        .with_content(/^keyfile.*keyfile.pem/)
        .with_content(/^require_certificate false/)
        .with_content(/listener 1883 127.0.0.1/)
        .with_content(/listener 8883 0.0.0.0/)
        .with_content(/listener 9001/)
        .with_content(/protocol websockets/)
    }
  end

  describe '~> create user' do
    it {
      is_expected.to run_execute('create user foo')
        .with_command(/.*foo bar/)
    }
    it {
      is_expected.to run_execute('create user hello')
        .with_command(/.*hello world/)
    }
  end
end
