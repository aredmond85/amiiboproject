#require 'pry'
class Amiiboproject::Amiibo

    @@all = []   

    def self.all
        @@all
    end

    def self.create(arrHash)
        arrHash.each do |hash|
            new(hash["character"],hash["gameSeries"],hash["name"])
        end
    end

    def self.find_by_character(input)
        #iterate through array
        #find all amiibos that have the character that was inputted
        @@all.find_all {|i| i.character == input.to_s}
    end

    attr_accessor :character,:gameSeries, :name

    def initialize(character, gameSeries, name)
        @character = character
        @gameSeries = gameSeries
        @name = name
        save
    end

    def save
        @@all << self
    end
end

#binding.pry