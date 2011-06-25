class Prunr::Timeframe

  ## add DSL methods to Fixnum
  def self.extend_fixnum
    subclasses = []
    ObjectSpace.each_object(Class) do |c|
      if c.superclass == self
        method_name = c.to_s.downcase.split('::').last
        Fixnum.send(:define_method, method_name.to_sym) do
          c.new(self)
        end
      end
    end
  end

  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  ## whether the given date is within the given timeframe starting today
  # and going back in time
  def contains(date)
    false
  end

end

Dir["#{File.dirname(__FILE__)}/timeframes/*.rb"].each do |file|
  require file
end

