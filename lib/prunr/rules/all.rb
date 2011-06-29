## :all rule
class Prunr::Rule::All

  ## initializer with options hash
  def initialize(options)
    tf = options[:for]
    @timeframe = tf.end_with(Prunr::EndTime.delta(tf.days))
  end

  ## keep all items within @timeframe
  def filter(objects)
    objects.reject do |o|
      @timeframe.contains?(o.date)
    end
  end

end

