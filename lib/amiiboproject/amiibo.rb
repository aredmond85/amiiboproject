class Amiiboproject::Amiibo

    # class variable that holds an array of all amiibo objects
    @@all = []   

    # access elements of the class variable '@@all' array
    def self.all
        @@all
    end

    #create an instance of amiibo
    def self.create(array)
        array.each do |hash|
            amiibo = new(hash["character"],hash["gameSeries"],hash["name"])
            amiibo.save 
        end
    end

    attr_accessor :character,:gameSeries, :name

    def initialize(character, gameSeries, name)
        @character, @gameSeries, @name = character, gameSeries, name
    end

    def save
        @@all << self
    end
end

#binding.pry