require 'helper'

class TestFile < Test::Unit::TestCase

  context "a prunable File" do

    should "recognize all files from a pattern" do
      list = File.get_all("#{@fixtures_dir}/*.txt")
      assert_equal %w{bar.txt foo.txt goo.txt}, list.sort
    end

  end
end
