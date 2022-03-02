class BoxingNews::Stories
    attr_accessor :title, :description, :author, :timestamp, :url

    @@all = []

    def initialize
        @@all << self
    end
    
    def self.all
        @@all
    end

end