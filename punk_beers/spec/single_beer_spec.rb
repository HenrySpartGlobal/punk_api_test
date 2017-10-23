require 'spec_helper'

describe 'test beers' do

before(:each) do
  service = PunkBeerService.new
  @beers_tests = service.single_beer_call('beers')
end

  it 'all key quality values should be between 1-8' do
  end
end
