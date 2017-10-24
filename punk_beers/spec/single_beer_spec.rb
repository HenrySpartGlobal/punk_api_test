  require 'spec_helper'

describe 'test beers' do

  context 'all beers' do

  before(:all) do
    service = PunkBeerService.new
    @beers_tests = service.all_beers_service
  end

  it 'all key values of name should be of data type string' do
    @beers_tests.each do |i|
    expect(i["name"]).to be_a_kind_of(String)
    end
  end

  it 'all key values of "id" should be of data type Integer' do
    @beers_tests.each do |i|
    expect(i["id"]).to be_a_kind_of(Integer)
    end
  end

  it 'The "Alcohol by volume" value of all beers should be between 1 and 55' do
    @beers_tests.each do |i|
    expect(i["abv"]).to be_between(1,55)
    end
  end

  it 'The "description" should be a string data type' do
    @beers_tests.each do |i|
    expect(i["description"]).to be_a_kind_of(String)
    end
  end

  it 'The description value of the "boil volume" should be an integer' do
    @beers_tests.each do |i|
    expect(i["boil_volume"]["value"]).to be_a_kind_of(Integer)
    end
  end

end

  context 'single beer' do

    before(:all) do
      service = PunkBeerService.new
      @single_beer_test = service.single_beer_call("1")
    end

    it 'all key values of name should be of data type string' do
      expect(@single_beer_test["name"]).to be_a_kind_of(String)
    end

    it 'all PH values should be between 3.2 and 5.6' do
        expect(@single_beer_test["ph"]).to be_between(3.2,5.9)
    end
  end

end
