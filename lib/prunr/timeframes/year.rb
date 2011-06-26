class Prunr::Timeframe::Year < Prunr::Timeframe

  def contains(date)
    diff = DateTime.now - date
    return diff <= 60*60*24*366
  end

end

