## partitions time into segments of multiple years, aligned by taking
# the modulus of the year number
class Prunr::TimeRoster::Year < Prunr::TimeRoster

  def initialize(timeframe)
    super(timeframe, nil)
  end

  def adjust_timeframe(timeframe)
    timeframe
  end

end

