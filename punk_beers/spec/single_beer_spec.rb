require 'spec_helper'

describe 'test beers' do

before(:all) do
  service = PunkBeerService.new
  @beers_tests = service.all_beers
end

  it 'all key values of name should be of data type string' do
    p @beers_tests
    expect(@beers_tests["name"]).to be_a_kind_of(String)
  end
  it 'all key values of id should be of data type Integer' do
    expect(@beers_tests["id"]).to be_a_kind_of(Integer)
  end
  it 'The abv value of all beers should be between 1 and 55' do
    expect(@beers_tests["abv"]).to be <= 55
  end
end
