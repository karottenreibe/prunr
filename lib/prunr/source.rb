## Interface for sources of dates
class Prunr::Source

  ## retrieves all objects matching the given pattern
  def self.get_all(pattern) [] end

  ## the date associated with the object
  attr_reader :date

  ## removes the object
  def prune
  end

end

Dir["#{File.dirname(__FILE__)}/sources/*.rb"].each do |file|
  require file
end

