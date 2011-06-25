class Prunr::Date

  ## add DSL methods to Fixnum
  def self.extend_fixnum
  end

  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

end

