## interface for prunable objects
class Prunr::Prunable

  ## retrieves all objects matching the given pattern
  def self.get_all(pattern) [] end

  ## the date associated with the object
  attr_accessor :date

  ## removes the object
  def prune
  end

end

Dir["#{File.dirname(__FILE__)}/prunables/*.rb"].each do |file|
  require file
end

