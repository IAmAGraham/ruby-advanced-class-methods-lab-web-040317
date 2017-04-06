require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    if @@all.include?(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    var = filename.split(" - ")
    artist_name = var[0]
    name = var[1].split(".")[0]
    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)

  end

  def self.destroy_all
    @@all.clear

  end



  #
  # (filename)
  #   split = filename.split("-")
  #   artist = split[0]


end
