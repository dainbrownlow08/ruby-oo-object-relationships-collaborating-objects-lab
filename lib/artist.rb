class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.create_by_name(name)
        new_artist = Artist.new(name)
        new_artist
    end

    def self.find_by_name(name)
        @@all.find{|artist| artist.name == name}
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name) != nil
          self.find_by_name(name)
        else
          self.create_by_name(name)
        end
    end

    def print_songs
        x = Song.all.select{|song| song.artist == self}
        x.each{|song| puts song.name}
    end


end