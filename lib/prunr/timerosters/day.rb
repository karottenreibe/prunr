## partitions time into segments of multiple days, aligned to a Month roster
class Prunr::TimeRoster::Day < Prunr::TimeRoster

  def initialize(timeframe)
    super(timeframe, Prunr::TimeRoster::Month)
  end

  def adjust_timeframe(timeframe)
    timeframe
  end

end

