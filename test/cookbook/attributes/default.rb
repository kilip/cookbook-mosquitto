
path = File.expand_path(File.join(File.dirname(__FILE__), '/default.json'))
default['mosquitto'] = JSON.parse(File.read(path))
