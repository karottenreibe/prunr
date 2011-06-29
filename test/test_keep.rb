require 'helper'

class TestKeep < Test::Unit::TestCase

  def setup
    Prunr::EndTime.set(Date.today)
  end

  context "a keep rule" do

    should "keep :all" do
      rule = Prunr::Rule::All.new(:all => nil, :for => 1.week)
      young = Prunr::Source.new
      young.date = Date.today
      old = Prunr::Source.new
      old.date = Date.today - 8
      assert_equal [old], rule.filter([young, old])
    end

    should "keep :newest" do
      rule = Prunr::Rule::Newest.new(:newest => 1, :of_every => 1.week, :for => 1.week)
      young = Prunr::Source.new
      young.date = Date.today - 5
      younger = Prunr::Source.new
      younger.date = Date.today
      old = Prunr::Source.new
      old.date = Date.today - 60
      assert_equal [old, young], rule.filter([old, young, younger])
    end

    should "set a new EndTime" do
      Prunr::Rule::All.new(:all => nil, :for => 1.week)
      assert_equal Date.today - 1.week.days, Prunr::EndTime.get
      Prunr::Rule::Newest.new(:newest => 1, :of_every => 1.week, :for => 1.week)
      assert_equal Date.today - 2.weeks.days, Prunr::EndTime.get
    end

  end

end

