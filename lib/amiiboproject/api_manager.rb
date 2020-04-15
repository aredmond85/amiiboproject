class Amiiboproject::APIManager

    BASE_URL = "https://www.amiiboapi.com/api/"

    def self.get_amiibo
        url = BASE_URL + "amiibo"
        res = HTTParty.get(url)
        Amiiboproject::Amiibo.create(res["amiibo"])
    end

end