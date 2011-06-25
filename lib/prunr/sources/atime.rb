## uses the last modification time to determine the date
class Prunr::Source::Atime < Prunr::Source::File

  def initialize(path)
    super(path)
    @date = File.atime(path)
  end

end

