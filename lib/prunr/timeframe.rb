## captures a relative timeframe like "10 days"
# calculates everything in days
class Prunr::RelativeTimeframe

  attr_accessor :days

  def initialize(days)
    @days = days
  end

  ## fixes the relative timeframe so it ends with the given date and
  # returns the resulting absolute timeframe
  def end_with(date)
    return Prunr::AbsoluteTimeframe.new(date - @days + 1, date)
  end

  ## whether there is at most this timeframe between the given dates
  def contains(date1, date2)
    (date1 - date2).abs < @days
  end

end

## captures an absolute timeframe like "from 2011-06-05 to 2011-06-10"
# calculates everything in days
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

## Singleton that saves, which dates have already been captured
class Prunr::EndTime

  def self.get
    Date.now
  end

  def self.set(date)
  end

end

