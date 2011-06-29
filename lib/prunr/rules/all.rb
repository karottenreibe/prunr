## :all rule
class Prunr::Rule::All

  ## initializer with options hash
  def initialize(options)
    @timeframe = options[:for].align
  end

  ## keep all items within @timeframe
  def filter(objects)
    objects.reject do |o|
      @timeframe.contains?(o.date)
    end
  end

end

