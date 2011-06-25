## :newest rule
class Prunr::Rule::Newest

  ## initializer with options hash
  def initialize(options)
    @selection = options[:of_every]
    @timeframe = options[:for]
  end

  ## only keep the newest item in every @selection within @timeframe
  def filter(objects)
    objects
  end

end

