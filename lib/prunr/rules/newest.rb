## :newest rule
class Prunr::Rule::Newest

  ## initializer with options hash
  def initialize(options)
    @amount = options[:newest]
    @selection = 1.send(options[:of_every])
    @timeframe = options[:for]
  end

  ## only keep the newest item in every @selection within @timeframe
  def filter(objects)
    filterable, too_old = objects.find { |o| @timeframe.contains(o.date) }
    groups = []
    filterable.each do |o|
      g = groups.find { |g| @selection.is_between(g[0], o) }
      if g
        g << o
      else
        groups << [o]
      end
    end
    groups.map do |g|
      g.sort!
      g = g[0...@amount]
    end
    return too_old + removable
  end

end

