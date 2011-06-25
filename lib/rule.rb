class Rule
end

Dir["#{File.dirname(__FILE__)}/rules/*.rb"].each do |file|
  require file
end


