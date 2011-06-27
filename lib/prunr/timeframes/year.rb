class Prunr::Timeframe::Year < Prunr::Timeframe

  def contains(date)
    diff = DateTime.now - date
    return diff <= 60*60*24*366
  end

  def is_between(date1, date2)
    return (date1.year - date2.year).abs() <= @amount - 1
  end

end

