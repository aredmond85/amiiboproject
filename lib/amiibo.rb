class Amiiboproject::Amiibo

    @@all = []   

    def self.all
        @@all
    end

    def self.mass_create_from_api(amiiboarr)
        amiiboarr.each do |amiibohash|
            new(amiibohash['amiiboSeries'])
        end
    end

    attr_accessor :amiiboSeries

    def initialize(amiiboSeries)
        @amiiboSeries = amiiboSeries
        save
    end

    def save
        @@all << self
    end

end