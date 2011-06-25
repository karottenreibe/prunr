## interface for prune rules
class Rule

  ## initializer with options hash
  def initialize(options) end

  ## whether to keep the object
  def keep?(object) true end

end

Dir["#{File.dirname(__FILE__)}/rules/*.rb"].each do |file|
  require file
end


