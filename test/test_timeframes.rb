require 'helper'

class TestTimeframes < Test::Unit::TestCase

  def setup
    Prunr::EndTime.reset
  end

  context "a RelativeTimeframe" do
    should "be avilable as a DSL method on Fixnum" do
      assert 1.year.is_a?(Prunr::RelativeTimeframe)
      assert 1.month.is_a?(Prunr::RelativeTimeframe)
      assert 1.week.is_a?(Prunr::RelativeTimeframe)
      assert 1.day.is_a?(Prunr::RelativeTimeframe)

      assert 7.years.is_a?(Prunr::RelativeTimeframe)
      assert 7.months.is_a?(Prunr::RelativeTimeframe)
      assert 7.weeks.is_a?(Prunr::RelativeTimeframe)
      assert 7.days.is_a?(Prunr::RelativeTimeframe)
    end

    should "have specific lengths" do
      assert 1.day.days == 1
      assert 7.day.days == 7
      assert 1.week.days == 7
      assert 1.month.days == 31
      assert 1.year.days == 365
    end

    should "contain some dates" do
      day1_12 = Date.parse("2010-12-30")
      day1_13 = Date.parse("2010-12-30")
      day2_03 = Date.parse("2010-12-31")
      assert 1.day.contains?(day1_12, day1_13)
      assert !1.day.contains?(day1_12, day2_03)
      assert 2.days.contains?(day1_12, day2_03)

      day1_23 = Date.parse("2011-06-23")
      day1_24 = Date.parse("2011-06-24")
      day2_30 = Date.parse("2011-06-30")
      assert 1.week.contains?(day1_23, day1_24)
      assert !1.week.contains?(day1_23, day2_30)
      assert 2.weeks.contains?(day1_23, day2_30)

      day1_2010 = Date.parse("2010-12-31")
      day1_2011 = Date.parse("2011-01-01")
      day2_2011 = Date.parse("2011-01-07")
      assert 1.week.contains?(day1_2010, day1_2011)
      assert !1.week.contains?(day1_2010, day2_2011)
      assert 2.weeks.contains?(day1_2010, day2_2011)

      month1_23 = Date.parse("2011-06-23")
      month1_24 = Date.parse("2011-06-24")
      month2_12 = Date.parse("2011-07-24")
      assert 1.month.contains?(month1_23, month1_24)
      assert !1.month.contains?(month1_23, month2_12)
      assert 2.months.contains?(month1_23, month2_12)

      year1_06 = Date.parse("2011-06-23")
      year1_07 = Date.parse("2011-07-24")
      year2_05 = Date.parse("2012-07-23")
      assert 1.year.contains?(year1_06, year1_07)
      assert !1.year.contains?(year1_06, year2_05)
      assert 2.years.contains?(year1_06, year2_05)
    end

    should "be convertible to an absolute timeframe" do
      abs = 1.day.end_with(Date.parse("2011-06-22"))
      assert_equal Date.parse("2011-06-22"), abs.start_date
      assert_equal Date.parse("2011-06-22"), abs.end_date

      abs = 1.week.end_with(Date.parse("2011-06-22"))
      assert_equal Date.parse("2011-06-16"), abs.start_date
      assert_equal Date.parse("2011-06-22"), abs.end_date
    end

    should "convert DateTime to Date" do
      abs = 1.day.end_with(DateTime.parse("2011-06-22T12:00"))
      assert_equal Date, abs.start_date.class
      assert_equal Date, abs.end_date.class
    end
  end

  context "an AbsoluteTimeframe" do
    should "contain some dates" do
      start_date = Date.parse("2011-06-14")
      end_date = Date.parse("2011-06-22")
      atf = Prunr::AbsoluteTimeframe.new(start_date, end_date)
      assert atf.contains?(Date.parse("2011-06-14"))
      assert atf.contains?(Date.parse("2011-06-17"))
      assert atf.contains?(Date.parse("2011-06-22"))
      assert !atf.contains?(Date.parse("2011-06-23"))
      assert !atf.contains?(Date.parse("2011-07-14"))
      assert !atf.contains?(Date.parse("2011-06-13"))
    end
  end

  context "the EndTime" do
    should "default to today" do
      assert_equal Date.today, Prunr::EndTime.get
    end

    should "apply a delta" do
      assert_equal Date.today, Prunr::EndTime.delta(1.week)
      assert_equal Date.today - 1.week.days, Prunr::EndTime.get
    end
  end

end

