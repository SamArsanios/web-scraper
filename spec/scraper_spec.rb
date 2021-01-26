require_relative '../lib/scraper'

describe '#world_population' do
  let(:hash) do
    { Number: 1, Country: 'China', Population: 1_439_323_776, YearlyChange: 0.39, NetChange: 5_540_090,
      Density: 153, LandArea: 9_388_211, Migrants: 348_399, FertilityRate: 1.69, MedianAge: 38,
      UrbanPopulation: 60.8, WorldShare: 18.5 }
  end
  it 'Returns Array of hashes from the table' do
    expect(hash).to be_an(Hash)
  end
end
