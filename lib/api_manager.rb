class Amiiboproject::APIManager

    BASE_URL = "https://www.amiiboapi.com/api/"

    def self.get_amiibo
        url = BASE_URL + "amiibo"
        res = HTTParty.get(url)
        Amiiboproject::Amiibo.mass_create_from_api(res["amiibo"])
    end

end