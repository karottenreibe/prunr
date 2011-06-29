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
    date = date.to_date
    return Prunr::AbsoluteTimeframe.new(date - @days + 1, date)
  end

  ## fixes the relative timeframe so it ends with the given current EndTime and
  # returns the resulting absolute timeframe
  def align
    endtime = Prunr::EndTime.delta(self).to_date
    return Prunr::AbsoluteTimeframe.new(endtime - @days + 1, endtime)
  end

  ## whether there is at most this timeframe between the given dates
  def contains?(date1, date2)
    date1, date2 = date1.to_date, date2.to_date
    (date1 - date2).abs < @days
  end

end

## captures an absolute timeframe like "from 2011-06-05 to 2011-06-10"
# calculates everything in days
class Prunr::AbsoluteTimeframe

  attr_accessor :start_date, :end_date

  def initialize(start_date, end_date)
    @start_date, @end_date = start_date.to_date, end_date.to_date
  end

  ## whether the given date falls within this timespan
  def contains?(date)
    date = date.to_date
    return (date <= @end_date and date >= @start_date)
  end

end

## Singleton that saves, which dates have already been captured
class Prunr::EndTime

  def self.get
    @endtime || Date.today
  end

  def self.set(date)
    @endtime = date.to_date
  end

  def self.delta(timeframe)
    @endtime ||= Date.today
    old = @endtime
    @endtime -= timeframe.days
    return old
  end

  def self.reset
    @endtime = nil
  end

end

