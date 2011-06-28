require 'helper'

class TestKeep < Test::Unit::TestCase

  context "a keep rule" do

    should "keep :all :for" do
      rule = Prunr::Rule::All.new(:all => nil, :for => 1.week)
      young = Prunr::Source.new
      young.date = DateTime.now
      old = Prunr::Source.new
      old.date = DateTime.now - 60*60*24*8
      assert_equal [old], rule.filter([young, old])
    end

    should "keep :newest" do
      rule = Prunr::Rule::Newest.new(:newest => 1, :of_every => 1.week, :for => 1.week)
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

