require 'httparty'
require 'json'

class PunkBeerService

  # attr_accessor :abv_gt, :abv_lt
  #
  # def initialize(abv_gt, abv_lt)
  #   @abv_gt = abv_gt
  #   @abv_lt = abv_lt
  # end

  include HTTParty

  base_uri 'https://api.punkapi.com/v2/' #adds this to the front of the URL

  def single_beer_call(id)
    single_beer_call = JSON.parse(self.class.get("/beers/#{id}").body) #need to pares so ruby and handle JS, and we will get a Hash back. This part appends to line 7.
    single_beer_call[0]
  end

  def random_beers_call
    random_beers_call = JSON.parse(self.class.get("/beers/random").body)
    random_beers_call[0]
  end
  def all_beers
    all_beers = JSON.parse(self.class.get("/beers").body)
    all_beers[0]
  end
end


beer = PunkBeerService.new
puts beer.single_beer_call('1').class
#
# beers = PunkBeerService.new
# puts beers.random_beers_call
#
# beers = PunkBeerService.new
# puts beers.all_beers
