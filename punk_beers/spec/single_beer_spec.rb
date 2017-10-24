require 'spec_helper'

describe 'test beers' do

before(:all) do
  service = PunkBeerService.new
  @beers_tests = service.all_beers
end

  it 'all key values of name should be of data type string' do
    expect(@beers_tests['name']).to be_a_kind_of(String)
  end
end
