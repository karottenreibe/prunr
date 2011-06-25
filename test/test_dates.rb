require 'helper'

class TestDates < Test::Unit::TestCase

  context "a Date" do

    should "be avilable as a DSL method on Number" do
      Prunr::Date.extend_fixnum
      assert 1.year.is_a?(Prunr::Date::Year)
      assert 1.month.is_a?(Prunr::Date::Month)
      assert 1.week.is_a?(Prunr::Date::Week)
      assert 1.day.is_a?(Prunr::Date::Day)
      assert 1.day.amount == 1
    end

  end

end

