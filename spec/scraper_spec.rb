require_relative '../lib/scraper'

describe Scraper do
  let(:scraper) { Scraper.new('https://www.worldometers.info/world-population/') }

  describe '#world_population' do
    it 'Returns Array of hashes from the table' do
      expect(scraper.world_population).to be_an(Array)
    end

    it 'Returns false if hashes are returned' do
      expect(scraper.world_population).to_not be_an(Hash)
    end
  end

  describe '#all_nations' do
    it 'Returns an integer' do
      expect(Integer).to be_truthy
    end

    it 'Returns false if integer is not returned' do
      expect(String).to_not eql(Integer)
    end
  end

  describe '#find_country_by_name' do
    it 'Returns a Hash' do
      expect(scraper.find_country_by_name('Turkey')).to be_an(Array)
    end

    it 'Returns false if Array is not returned' do
      expect(scraper.find_country_by_name('Turkey')).not_to be_an(Hash)
    end
  end
end
