## partitions time into segments of multiple months, aligned to a Year roster
class Prunr::TimeRoster::Month < Prunr::TimeRoster

  def initialize(timeframe)
    years = (timeframe.days / 1.year.days) + 1
    super(timeframe, Prunr::TimeRoster::Year.new(years))
  end

  def adjust_timeframe(timeframe)
    timeframe
  end

end

