require 'spec_helper'

describe 'test beers' do

before(:all) do
  service = PunkBeerService.new
  @beers_tests = service.all_beers({"yeast" => "american", "abv_gt" => 4})

end

  it 'all key values of name should be of data type string' do
    puts @beer_tests["name"].class
    # expect(@beers_tests['name']).to be_a_kind_of(String)
  end
end
