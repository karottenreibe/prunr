class Prunr::Timeframe::Month < Prunr::Timeframe

  def contains(date)
    diff = DateTime.now - date
    return diff <= 60*60*24*31
  end

end

