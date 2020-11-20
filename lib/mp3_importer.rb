require 'pry'
class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path = path
    end

    def files
        x= Dir.entries(self.path).select{|song| song[-1] == "3"}
    end

    # def import 
    
    # end


end