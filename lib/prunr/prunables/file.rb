class Prunr::Prunable::File

  ## retrieves all objects matching the given pattern
  def self.get_all(pattern)
    Dir[pattern].map { |path| self.new(path) }
  end

  attr_accessor :file

  def initialize(path)
    @file = File.new(path)
  end

  ## removes the object
  def prune
    File.delete(@file)
  end

end

