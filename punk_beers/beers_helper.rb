require 'httparty'
require 'json'

class PunkBeerService
  include HTTParty

  base_uri 'https://api.punkapi.com/v2/' #adds this to the front of the URL

  def single_beer_call(id)
    JSON.parse(self.class.get("/beers/#{id}").body) #need to pares so ruby and handle JS, and we will get a Hash back. This part appends to line 7.
  end

  def random_beers_call
    JSON.parse(self.class.get("/beers/random").body)
  end
end


single = PunkBeerService.new
puts single.single_beer_call('1')
