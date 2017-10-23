require 'httparty'
require 'json'

class PunkBeerService
  include HTTParty

  base_uri 'https://api.punkapi.com/v2/' #adds this to the front of the URL

  def single_beer_call(beer)
    JSON.parse(self.class.get("/beers/#{number}").body) #need to pares so ruby and handle JS, and we will get a Hash back. This part appends to line 7.
  end

  def multiple_beer_service(beers_array)
    JSON.parse(self.class.post("/beers", body: {"beers" => beers_array }).body)
  end
end


#parese postcode, and brings back the post codes
