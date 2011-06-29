class Prunr::RelativeTimeframe

  attr_accessor :days

  def initialize(days)
    @days = days
  end

  ## fixes the relative timeframe so it ends with the given date and
  # returns the resulting absolute timeframe
  def end_with(date)
    nil
  end

  ## whether there is at most this timeframe between the given dates
  def contains(date1, date2)
    false
  end

end

class Prunr::AbsoluteTimeframe

  attr_accessor :start_date, :end_date

  def initialize(start_date, end_date)
    @start_date, @end_date = start_date, end_date
  end

  ## whether the given date falls within this timespan
  def contains(date)
    false
  end

end

