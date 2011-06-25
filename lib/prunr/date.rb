class Prunr::Date

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

end

Dir["#{File.dirname(__FILE__)}/dates/*.rb"].each do |file|
  require file
end

