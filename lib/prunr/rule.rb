## interface for prune rules
class Prunr::Rule

  ## initializer with options hash
  def initialize(options) end

  ## returns the modified objects array with kept elements removed
  def filter(objects) objects end

end

Dir["#{File.dirname(__FILE__)}/rules/*.rb"].each do |file|
  require file
end

