require 'helper'

class TestKeep < Test::Unit::TestCase

  context "a Keep rule" do

    should "keep :all" do
      rule = Prunr::Rule::Keep.new(:all, :for => 1.week)
      source = Prunr::Source.new
      source.date = Time.now
      assert rule.keep?(source)
      source.date = Time.now - 60*60*24*8
      assert !rule.keep?(source)
    end

  end

end

