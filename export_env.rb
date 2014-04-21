def print_val(key)
  puts "export #{key}='#{ENV[key]}'"
end

[ "NEW_RELIC_LICENSE_KEY", 
  "ELASTICSEARCH_APPLICATION_NAME", \
  "ELASTICSEARCH_INDEX", \
  "ELASTICSEARCH_URL"].each do |key| print_val(key) end
