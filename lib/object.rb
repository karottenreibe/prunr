class Object
end

Dir["#{File.dirname(__FILE__)}/objects/*.rb"].each do |file|
  require file
end

