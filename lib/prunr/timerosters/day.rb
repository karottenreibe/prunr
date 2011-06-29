## partitions time into segments of multiple days, aligned to a Month roster
class Prunr::TimeRoster::Day < Prunr::TimeRoster

  def initialize(timeframe)
    months = (timeframe.days / 1.month.days) + 1
    super(timeframe, Prunr::TimeRoster::Month.new(months))
  end

  def adjust_timeframe(timeframe)
    timeframe
  end

end

