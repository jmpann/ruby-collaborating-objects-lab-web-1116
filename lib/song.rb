class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    new_song = self.new(filename)
    new_song.parse_filename(filename)
    new_song

  end

  def parse_filename(filename)
    self.name= filename.split(" - ")[1]
    self.artist= Artist.find_or_create_by_name(filename.split(" - ").first)
  end
end
