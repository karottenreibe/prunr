require 'helper'

class TestKeep < Test::Unit::TestCase

  context "a keep rule" do

    should "keep :all" do
      rule = Prunr::Rule::All.new(:for => 1.week)
      young = Prunr::Source.new
      old = Prunr::Source.new
      young.date = Time.now
      old.date = Time.now - 60*60*24*8
      assert_equal [old], rule.filter([young, old])
    end

    should "keep :newest" do
      rule = Prunr::Rule::Newest.new(:of_every => 1.week, :for => 1.week)
      young = Prunr::Source.new
      younger = Prunr::Source.new
      old = Prunr::Source.new
      young.date = Time.now - 5
      younger.date = Time.now
      old.date = Time.now - 60*60*24*8
      assert_equal [old, young], rule.filter([old, young, younger])
    end

  end

end

