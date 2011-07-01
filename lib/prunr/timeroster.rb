## partitions the time into units of the same size
class Prunr::TimeRoster

  attr_accessor :timeframe, :parent

  def initialize(timeframe, parent = nil)
    @timeframe = timeframe
    @parent = parent.new(timeframe) if parent
  end

  ## adjusts the given timespan so it's start_date is aligned
  # with the roster
  def adjust_timeframe(timeframe)
    timeframe
  end

end

Dir["#{File.dirname(__FILE__)}/timerosters/*.rb"].each do |file|
  require file
end

