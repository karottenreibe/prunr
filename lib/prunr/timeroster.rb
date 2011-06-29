## partitions the time into units of the same size
class Prunr::TimeRoster

  ## adjusts the given timespan so it's start_date is aligned
  # with the roster
  def adjust_timespan(timespan)
    timespan
  end

end

Dir["#{File.dirname(__FILE__)}/timerosters/*.rb"].each do |file|
  require file
end

