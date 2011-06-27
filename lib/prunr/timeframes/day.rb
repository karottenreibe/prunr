class Prunr::Timeframe::Day < Prunr::Timeframe

  def contains(date)
    diff = DateTime.now - date
    return diff <= 60*60*24
  end

  def is_between(date1, date2)
    return false unless %w{year month}.map(&:to_sym).all? { |sym|
      date1.send(sym) == date2.send(sym)
    }
    return (date1.day - date2.day).abs() <= @amount - 1
  end

end

