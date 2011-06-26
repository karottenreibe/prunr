require 'helper'

class TestKeep < Test::Unit::TestCase

  context "a keep rule" do

    should "keep :all" do
      rule = Prunr::Rule::All.new(:for => 1.week)
      young = Prunr::Source.new
      young.date = DateTime.now
      old = Prunr::Source.new
      old.date = DateTime.now - 60*60*24*8
      assert_equal [old], rule.filter([young, old])
    end

    should "keep :newest" do
      rule = Prunr::Rule::Newest.new(:of_every => 1.week, :for => 1.week)
      young = Prunr::Source.new
      young.date = DateTime.now - 5
      younger = Prunr::Source.new
      younger.date = DateTime.now
      old = Prunr::Source.new
      old.date = DateTime.now - 60*60*24*8
      assert_equal [old, young], rule.filter([old, young, younger])
    end

  end

end

