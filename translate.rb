require 'erb'

config_file = 'config/newrelic_plugin.yml'
File.delete(config_file) if File.exists?(config_file)

File.open('config/newrelic_plugin.yml.erb', "r") do |f|
  template = f.read
  contents = ERB.new(template).result
  File.open(config_file, 'w') do |f|
    f.write(contents)
  end
end
