## partitions time into segments of multiple years, aligned by taking
# the modulus of the year number
class Prunr::TimeRoster::Year < Prunr::TimeRoster

  def initialize(timeframe)
    super(timeframe, nil)
    @years = timeframe.days / 365 #todo test this
  end

  def adjust_timeframe(timeframe)
    date = timeframe.start_date
    year = date.year
    diff = year % @years
    timeframe.start_date = Date.civil(year - diff, 1, 1)
  end

end

