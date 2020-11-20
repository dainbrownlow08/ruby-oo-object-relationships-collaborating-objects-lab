require 'pry'
class Song

    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @artist
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        file_data = file.split(/[.-]/).map{|section| section = section.strip}
        song = self.find_or_create_by_name(file_data[1])
        song.artist_name = file_data[0]
        song
    end

end