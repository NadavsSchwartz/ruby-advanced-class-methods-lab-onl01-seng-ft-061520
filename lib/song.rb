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
  
  
  def self.new_by_name(str_name)
    song = self.create
    song.name = str_name
    song
  end
  
  def self.create_by_name(str_name)
    song = self.create
    song.name = str_name
    song   
      
  end
  
  
  def self.find_by_name(str_name)
    self.all.find do
      |name| name.name == str_name
    end
  end
  
  def self.find_or_create_by_name(str_name)
   self.find_by_name(str_name) || self.create_by_name(str_name)
  end
  
  def self.alphabetical
    self.all.sort_by{|song_name| song_name.name}
  end

  def self.new_from_filename(file_name)
    sorted_file_name = file_name.split(" - ")
    artist_name = sorted_file_name[0]
    song_name = sorted_file_name[1].slice(".mp3")
    song_name
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    sorted_file_name = file_name.split(" - ").delete(".mp3")
    artist_name = sorted_file_name[0]
    song_name = sorted_file_name[1]

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
