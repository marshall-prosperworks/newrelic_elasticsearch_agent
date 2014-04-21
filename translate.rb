require 'erb'

def process(template_file, env)
  File.open('config/newrelic_plugin.yml.erb', "r") do |f|
    template = f.read
    return ERB.new(template).result(binding)
  end
end

h = Hash.new do |h,k|
  raise("Missing key: #{k}. Keys: #{h.keys.sort.to_s}")
end

h.merge!(ENV)

config_file = 'config/newrelic_plugin.yml'
File.delete(config_file) if File.exists?(config_file)

contents = process('config/newrelic_plugin.yml.erb', h)
File.open(config_file, 'w') do |f|
  f.write(contents)
end
