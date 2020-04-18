class Amiiboproject::Amiibo

    #class variable that stores an array of all amiibo objects
    @@all = []   

    #access elements of the class variable '@@all' array
    def self.all
        @@all
    end

    #creates an amiibo object
    def self.create(array)
        array.each do |hash|
            amiibo = new(hash["character"],hash["gameSeries"],hash["name"],hash["amiiboSeries"])
            amiibo.save 
        end
    end

    #instance variables for getters and setters
    attr_accessor :character, :gameSeries, :name, :amiiboSeries

    #instantiates an amiibo object
    def initialize(character, gameSeries, name, amiiboSeries)
        @character, @gameSeries, @name, @amiiboSeries = character, gameSeries, name, amiiboSeries
    end

    #saves all objects into the @@all array for amiibo
    def save
        @@all << self
    end
end

#binding.pry