class DateSource
end

Dir["#{File.dirname(__FILE__)}/date_sources/*.rb"].each do |file|
  require file
end

