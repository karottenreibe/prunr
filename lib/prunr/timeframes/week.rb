class Prunr::Timeframe::Week < Prunr::Timeframe

  def contains(date)
    diff = DateTime.now - date
    return diff <= 24*7
  end

  def is_between(date1, date2)
    if date1.year == date2.year
      return (date1.cweek - date2.cweek).abs() <= @amount - 1
    else
      date1, date2 = date2, date1 if date2 < date1
      # count weeks between the dates
      weeks = 0
      date = date1
      while date.year != date2.year and date.cweek != date2.cweek
        weeks += 1
        date += 7
      end
      return weeks <= @amount - 1
    end
    return %w{year cweek}.map(&:to_sym).all? { |sym|
      date1.send(sym) == date2.send(sym)
    }
  end

end

