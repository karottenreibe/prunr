class Prunr::Timeframe::Week < Prunr::Timeframe

  def contains(date)
    diff = DateTime.now - date
    return diff <= 60*60*24*7
  end

  def is_between(date1, date2)
    return %w{year cweek}.map(&:to_sym).all? { |sym|
      date1.send(sym) == date2.send(sym)
    }
  end

end

