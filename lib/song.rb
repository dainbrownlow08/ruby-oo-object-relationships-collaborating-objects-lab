require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create_by_name(name)
        new_song = Song.new(name)
        new_song
    end

    def self.find_by_name(name)
        @@all.find{|song| song.name == name}
    end
    
    def self.find_or_create_by_name(name)
        if self.find_by_name(name) != nil
          self.find_by_name(name)
        else
          self.create_by_name(name)
        end
    end
    
    def self.new_by_filename(file)
        file_data = file.split(/[.-]/).map{|section| section = section.strip}
        song = self.find_or_create_by_name(file_data[1])
        song.artist = Artist.find_or_create_by_name(file_data[0])
        song
    end
    
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

end