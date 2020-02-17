require 'spec_helper.rb'

describe 'mosquitto::_package' do
  describe '~> install mosquitto' do
    it {
      is_expected.to add_apt_repository('mosquitto')
        .with(uri: 'ppa:mosquitto-dev/mosquitto-ppa')
    }
    it {
      is_expected.to install_apt_package('mosquitto')
      is_expected.to install_apt_package('mosquitto-clients')
    }
  end
end
