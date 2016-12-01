class Artist

@@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end


##need to understand this better. "keeps track of an artist's songs"
  def add_song(song)
    @songs << song
    song.artist = self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create_by_name(n)
    new_artist = self.new(n)
    new_artist.save
    new_artist
  end

  def self.find_by_name(n)
    @@all.find{|artist| artist.name == n} # .find will return nil if can't be found
  end

  def self.find_or_create_by_name(n)
    if self.find_by_name(n)
      self.find_by_name(n) #will run if ^ evaluates to true. otherwise(ie=nil) else will run
    else
      self.create_by_name(n)
    end
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end


end
