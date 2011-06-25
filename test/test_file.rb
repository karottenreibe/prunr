require 'helper'

fixtures_dir = "#{File.dirname(__FILE__)}/fixtures"

class TestFile < Test::Unit::TestCase
  context "a prunable File" do

    should "recognize all files from a pattern" do
      list = File.get_all("#{fixtures_dir}/*.txt")
      assert_equals %w{bar.txt foo.txt goo.txt}, list.sort
    end

  end
end
