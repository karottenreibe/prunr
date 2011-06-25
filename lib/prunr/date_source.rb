## Interface for sources of dates
class Prunr::DateSource

  ## whether the DateSource can be used with this object type
  def is_applicable_to(object) false end

  ## extracts the date from the given object
  def get_date(object) end

end

Dir["#{File.dirname(__FILE__)}/date_sources/*.rb"].each do |file|
  require file
end

