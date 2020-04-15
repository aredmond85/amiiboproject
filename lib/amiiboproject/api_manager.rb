class Amiiboproject::APIManager

    BASE_URL = "https://www.amiiboapi.com/api/"

    #gets the amiibo data from the API 
    def self.get_amiibo
        url = BASE_URL + "amiibo"
        res = HTTParty.get(url)
        Amiiboproject::Amiibo.create(res["amiibo"])
    end

end