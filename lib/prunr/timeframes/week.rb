class Prunr::Timeframe::Week < Prunr::Timeframe

  def contains(date)
    diff = DateTime.now - date
    return diff <= 60*60*24*7
  end

end

