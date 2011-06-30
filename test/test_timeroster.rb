require 'helper'

class TestTimerosters < Test::Unit::TestCase

  context "a Year roster" do
    should "align correctly" do
      r = Prunr::TimeRoster::Year.new(1.year)
      tf = 1.week.end_with(Date.parse("2011-06-23"))
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2011-01-01"), tf.start_date
      assert_equal Date.parse("2011-06-23"), tf.end_date
    end

    should "use the modulus correctly" do
      r = Prunr::TimeRoster::Year.new(3.years)
      tf = 1.week.end_with(Date.parse("2011-06-23"))
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2010-01-01"), tf.start_date
      assert_equal Date.parse("2011-06-23"), tf.end_date

      r = Prunr::TimeRoster::Year.new(7.years)
      tf = 1.week.end_with(Date.parse("2011-06-23"))
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2009-01-01"), tf.start_date
      assert_equal Date.parse("2011-06-23"), tf.end_date
    end

    should "not change aligned dates" do
      r = Prunr::TimeRoster::Year.new(1.year)
      tf = 1.week.end_with(Date.parse("2011-01-07"))
      assert_equal Date.parse("2011-01-01"), tf.start_date
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2011-01-01"), tf.start_date
      assert_equal Date.parse("2011-01-07"), tf.end_date
    end
  end

  context "a Month roster" do
    should "align correctly" do
      r = Prunr::TimeRoster::Month.new(1.month)
      tf = 1.week.end_with(Date.parse("2011-06-23"))
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2011-06-01"), tf.start_date
      assert_equal Date.parse("2011-06-23"), tf.end_date
    end

    should "use the modulus correctly" do
      r = Prunr::TimeRoster::Month.new(3.months)
      tf = 1.week.end_with(Date.parse("2011-06-23"))
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2010-04-01"), tf.start_date
      assert_equal Date.parse("2011-06-23"), tf.end_date

      r = Prunr::TimeRoster::Month.new(7.months)
      tf = 1.week.end_with(Date.parse("2011-06-23"))
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2009-01-01"), tf.start_date
      assert_equal Date.parse("2011-06-23"), tf.end_date
    end

    should "not change aligned dates" do
      r = Prunr::TimeRoster::Month.new(1.month)
      tf = 1.week.end_with(Date.parse("2011-01-07"))
      assert_equal Date.parse("2011-01-01"), tf.start_date
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2011-01-01"), tf.start_date
      assert_equal Date.parse("2011-01-07"), tf.end_date
    end
  end

  context "a Day roster" do
    should "use the modulus correctly" do
      r = Prunr::TimeRoster::Day.new(2.days)
      tf = 3.days.end_with(Date.parse("2011-06-23"))
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2011-06-20"), tf.start_date
      assert_equal Date.parse("2011-06-23"), tf.end_date

      r = Prunr::TimeRoster::Day.new(3.days)
      tf = 4.days.end_with(Date.parse("2011-06-23"))
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2010-06-18"), tf.start_date
      assert_equal Date.parse("2011-06-23"), tf.end_date

      r = Prunr::TimeRoster::Day.new(7.days)
      tf = 1.week.end_with(Date.parse("2011-06-23"))
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2009-06-14"), tf.start_date
      assert_equal Date.parse("2011-06-23"), tf.end_date
    end

    should "not change aligned dates" do
      r = Prunr::TimeRoster::Day.new(1.day)
      tf = 1.week.end_with(Date.parse("2011-01-07"))
      assert_equal Date.parse("2011-01-07"), tf.start_date
      r.adjust_timeframe(tf)
      assert_equal Date.parse("2011-01-07"), tf.start_date
      assert_equal Date.parse("2011-01-07"), tf.end_date
    end
  end

end

