class Prunr::Timeframe::Day < Prunr::Timeframe

  def contains(date)
    diff = DateTime.now - date
    return diff <= 60*60*24
  end

end

