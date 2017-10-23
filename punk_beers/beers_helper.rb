  require 'httparty'
  require 'json'

  class PunkBeerService

    include HTTParty
    attr_accessor :uri

    def initialize
        @uri = ""
    end

    base_uri 'https://api.punkapi.com/v2/' #adds this to the front of the URL

    def single_beer_call(id)
      single_beer_call = JSON.parse(self.class.get("/beers/#{id}").body) #need to pares so ruby and handle JS, and we will get a Hash back. This part appends to line 7.
      single_beer_call[0]
    end

    def random_beers_call
      random_beers_call = JSON.parse(self.class.get("/beers/random").body)
      random_beers_call[0]
    end

    def all_beers (opts = {})
      if opts.empty? == false
        num_keys = 0
        @uri << "?" #adds ? straight away at the end of the link (count), (need one less and than the amount of values added)
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
        #from line 28, if the line is not empty append the ?, for each one print the key and value and append it into the string
        #then while the number of keys is less than than the keys(length), minus one, means we get rid of one & sign. For each key minus one
        #then add the & in, then append the uri. If there are no query strings then it gets all the beers
    end
  end
end

# chooseBeer = PunkBeerService.new
# puts chooseBeer.select_beer.class

#


# https://api.punkapi.com/v2/beers?beer_name=american&abv_gt=6

# beer = PunkBeerService.new
# puts beer.single_beer_call('1').class
#
# beers = PunkBeerService.new
# puts beers.random_beers_call
#
# beers = PunkBeerService.new
# puts beers.all_beers
 kc = PunkBeerService.new
 kc.all_beers({"yeast" => "american", "abv_gt" => 4})

 p kc.uri
