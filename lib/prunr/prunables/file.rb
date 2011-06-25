class File < Object

  ## retrieves all objects matching the given pattern
  def self.get_all(pattern)
    Dir[pattern].map { |path| File.new(path) }
  end

  ## removes the object
  def prune
  end

end

