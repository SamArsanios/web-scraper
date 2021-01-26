require_relative '../lib/scraper.rb'    

describe '#world_population' do
let(:hash) { {:Number=>1, :Country=>"China", :Population=>1439323776, :YearlyChange=>0.39, :NetChange=>5540090, :Density=>153, :LandArea=>9388211, :Migrants=>348399, :FertilityRate=>1.69, :MedianAge=>38, :UrbanPopulation=>60.8, :WorldShare=>18.5} }
it 'Returns Array of hashes from the table' do
      expect(hash).to be_an(Hash)
    end
end
