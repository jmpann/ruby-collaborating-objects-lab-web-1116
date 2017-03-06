require "pry"

class MP3Importer

  attr_reader :path
# Dir["/path/to/search/*"]

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path)[2..-1]
  end

  def import
    files.each do |file|
      new_song = Song.new_by_filename(file)
      new_song.artist.songs << new_song
    end

  end

end
