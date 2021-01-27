require_relative '../lib/scraper'

describe Scraper do
  let(:scraper) { Scraper.new('https://www.worldometers.info/world-population/') }

  describe '#world_population' do
    it 'Returns Array of hashes from the table' do
      expect(scraper.world_population).to be_an(Array)
    end
  end

  describe '#all_nations' do
    it 'Returns an integer' do
      expect(Integer).to be_truthy
    end
  end

  describe '#find_country_by_name' do
    it 'Returns a Hash' do
      expect(scraper.find_country_by_name('Turkey')).to be_an(Array)
    end
  end
end
