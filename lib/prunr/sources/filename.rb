## uses the filename to determine the date
# uses Date.strptime to parse the filename
class Prunr::Source::Filename < Prunr::Source::File

  def initialize(path, pattern = nil)
    super(path)
    raise ArgumentError.new("no pattern given for Filename source") unless pattern
    @date = Date.strptime(File.basename(path), pattern)
  end

end

