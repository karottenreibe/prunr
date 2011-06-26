require 'helper'

class TestDates < Test::Unit::TestCase

  def setup
      Prunr::Timeframe.extend_fixnum
  end

  context "a Date" do
    should "be avilable as a DSL method on Number" do
      assert 1.year.is_a?(Prunr::Timeframe::Year)
      assert 1.month.is_a?(Prunr::Timeframe::Month)
      assert 1.week.is_a?(Prunr::Timeframe::Week)
      assert 1.day.is_a?(Prunr::Timeframe::Day)
      assert 1.day.amount == 1
    end

    should "always contain future dates" do
      assert 1.day.contains(DateTime.now + 3600)
      assert 1.week.contains(DateTime.now + 3600)
      assert 1.month.contains(DateTime.now + 3600)
      assert 1.year.contains(DateTime.now + 3600)
    end
  end

  context "a Day" do
    should "contain some dates" do
      assert 1.day.contains(DateTime.now)
      assert 1.day.contains(DateTime.now - 3600)
      assert !1.day.contains(DateTime.now - 3600*24*2)
    end
  end

  context "a Week" do
    should "contain some dates" do
      assert 1.week.contains(DateTime.now)
      assert 1.week.contains(DateTime.now - 3600)
      assert !1.week.contains(DateTime.now - 3600*24*8)
    end
  end

  context "a Month" do
    should "contain some dates" do
      assert 1.month.contains(DateTime.now)
      assert 1.month.contains(DateTime.now - 3600)
      assert !1.month.contains(DateTime.now - 3600*24*33)
    end
  end

  context "a Year" do
    should "contain some dates" do
      assert 1.year.contains(DateTime.now)
      assert 1.year.contains(DateTime.now - 3600)
      assert !1.year.contains(DateTime.now - 3600*24*400)
    end
  end

end

