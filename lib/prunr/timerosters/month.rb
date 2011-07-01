## partitions time into segments of multiple months, aligned to a Year roster
class Prunr::TimeRoster::Month < Prunr::TimeRoster

  def initialize(timeframe)
    super(timeframe, Prunr::TimeRoster::Year)
  end

  def adjust_timeframe(timeframe)
    timeframe
  end

end

