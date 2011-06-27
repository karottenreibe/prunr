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
      assert 1.day.contains(DateTime.now + 1)
      assert 1.week.contains(DateTime.now + 1)
      assert 1.month.contains(DateTime.now + 1)
      assert 1.year.contains(DateTime.now + 1)
    end
  end

  context "a Day" do
    should "contain some dates" do
      assert 1.day.contains(DateTime.now)
      assert 1.day.contains(DateTime.now - 1)
      assert !1.day.contains(DateTime.now - 24*2)
    end

    should "be between some dates" do
      day1_12 = DateTime.parse("2010-12-30T12:00")
      day1_13 = DateTime.parse("2010-12-30T13:00")
      day2_03 = DateTime.parse("2010-12-31T03:00")
      assert 1.day.is_between(day1_12, day1_13)
      assert !1.day.is_between(day1_12, day2_03)
      assert 2.days.is_between(day1_12, day2_03)
    end
  end

  context "a Week" do
    should "contain some dates" do
      assert 1.week.contains(DateTime.now)
      assert 1.week.contains(DateTime.now - 1)
      assert !1.week.contains(DateTime.now - 24*8)
    end

    should "be between some dates" do
      day1_23 = DateTime.parse("2011-06-23")
      day1_24 = DateTime.parse("2011-06-24")
      day2_30 = DateTime.parse("2011-06-30")
      assert 1.week.is_between(day1_23, day1_24)
      assert !1.week.is_between(day1_23, day2_30)
      assert 2.weeks.is_between(day1_23, day2_30)
    end

    should "be between dates even across years" do
      day1_2010 = DateTime.parse("2010-12-31")
      day1_2011 = DateTime.parse("2011-01-01")
      day2_2011 = DateTime.parse("2011-01-04")
      assert 1.week.is_between(day1_2010, day1_2011)
      assert !1.week.is_between(day1_2010, day2_2011)
      assert 2.weeks.is_between(day1_2010, day2_2011)
    end
  end

  context "a Month" do
    should "contain some dates" do
      assert 1.month.contains(DateTime.now)
      assert 1.month.contains(DateTime.now - 1)
      assert !1.month.contains(DateTime.now - 24*33)
    end

    should "be between some dates" do
      month1_23 = DateTime.parse("2011-06-23")
      month1_24 = DateTime.parse("2011-06-24")
      month2_12 = DateTime.parse("2011-07-12")
      assert 1.month.is_between(month1_23, month1_24)
      assert !1.month.is_between(month1_23, month2_12)
      assert 2.months.is_between(month1_23, month2_12)
    end
  end

  context "a Year" do
    should "contain some dates" do
      assert 1.year.contains(DateTime.now)
      assert 1.year.contains(DateTime.now - 1)
      assert !1.year.contains(DateTime.now - 24*400)
    end

    should "be between some dates" do
      year1_06 = DateTime.parse("2011-06-23")
      year1_07 = DateTime.parse("2011-07-24")
      year2_05 = DateTime.parse("2012-05-23")
      assert 1.year.is_between(year1_06, year1_07)
      assert !1.year.is_between(year1_06, year2_05)
      assert 2.years.is_between(year1_06, year2_05)
    end
  end

end

