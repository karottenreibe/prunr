class Fixnum

  def day
    return Prunr::RelativeTimeframe.new(self)
  end

  def week
    return Prunr::RelativeTimeframe.new(self*7)
  end

  def month
    return Prunr::RelativeTimeframe.new(self*31)
  end

  def year
    return Prunr::RelativeTimeframe.new(self*365)
  end

  alias :days :day
  alias :weeks :week
  alias :months :month
  alias :years :year

end

def prune(&block)
end

