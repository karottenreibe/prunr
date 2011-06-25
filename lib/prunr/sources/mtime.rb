## uses the last modification time to determine the date
class Prunr::Source::Mtime < Prunr::Source::File

  def initialize(path)
    super(path)
    @date = File.mtime(path)
  end

end

