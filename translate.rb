require 'erb'

def process(template_file, env)
  File.open('config/newrelic_plugin.yml.erb', "r") do |f|
    template = f.read
    return ERB.new(template).result(binding)
  end
end

h = Hash.new do |h,k|
  raise("Missing key: #{k}. Keys: #{h.keys.sort}")
end

h.merge!(ENV)
puts process('config/newrelic_plugin.yml.erb', h)
