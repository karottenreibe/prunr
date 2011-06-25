## keep rule
class Prunr::Rule::Keep

  ## initializer with options hash
  def initialize(target, options)
    @target = target
    @selection = options[:of_every]
    @timeframe = options[:for]
  end

  ## whether to keep the object
  def keep?(object)
    true
  end

end

