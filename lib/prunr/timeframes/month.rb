class Prunr::Timeframe::Month < Prunr::Timeframe

  def contains(date)
    diff = DateTime.now - date
    return diff <= 24*31
  end

  def is_between(date1, date2)
    return false unless date1.year == date2.year
    return (date1.month - date2.month).abs() <= @amount - 1
  end

end

