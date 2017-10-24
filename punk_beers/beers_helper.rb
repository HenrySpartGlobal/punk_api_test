require 'httparty'
require 'json'

class PunkBeerService
  include HTTParty
  attr_accessor :uri

  def initialize
      @uri = ""
  end

  base_uri 'https://api.punkapi.com/v2/'

  def single_beer_call(id)
    single_beer_call = JSON.parse(self.class.get("/beers/#{id}").body)
    single_beer_call[0]
  end

  def random_beers_call
    random_beers_call = JSON.parse(self.class.get("/beers/random").body)
    random_beers_call[0]
  end

  def all_beers_service
    all = JSON.parse(self.class.get("/beers").body)
  end

  def select_beers (opts = {})
    if opts.empty? == false
      num_keys = 0
      @uri << "?"
      opts.each do |k,v|
        @uri << "#{k}=#{v}"
        while num_keys < opts.keys.length - 1
          @uri << '&'
          num_keys += 1
        end
        query_response = JSON.parse(self.class.get("/beers#{@uri}").body)
        query_response[0]
      end
    else
      response = JSON.parse(self.class.get("/beers").body)
      response[0]
    end
  end
end
