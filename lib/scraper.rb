require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'byebug'

class Scraper
  def initialize(url)
    unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(unparsed_page)
  end

  # Method to iterate through all nations and return an array of hashes
  def world_population
    @population_stats = []
    i = 1
    count = all_nations(@parsed_page)
    while i < count
      @population_stats << save_record(@parsed_page, i)
      i += 1
    end
    save_to_csv
    parse_to_json
    @population_stats
  end

  # Method that counts all entries that are in the scraped page
  def all_nations(parsed_page)
    parsed_page.css('table#popbycountry > tbody > tr').map(&:text).count
  end

  # Method that returns a record from the site
  def save_record(parsed_page, index)
    record = parsed_page.css("table#popbycountry > tbody > tr[#{index}]").text
    record = record.split(' ')
    record.delete '%'
    {
      "Number": record[0],
      "Country": record[1],
      "Population": record[2],
      "Yearly Change": record[3],
      "Net Change": record[4],
      "Density (P/Km2)": record[5],
      "Land Area (Km2)": record[6],
      "Migrants": record[7],
      "Fertility Rate": record[8],
      "Median Age": record[9],
      "Urban Population": record[10],
      "World Share": record[11]
    }
  end

  # Method to save scrapped data into a csv file
  def save_to_csv
    header = @population_stats[0].keys
    CSV.open('population.csv', 'w') do |csv|
      csv << header
      @population_stats.each do |record|
        csv << record.values
      end
    end
  end

  # CSV.open('bin/data.csv', 'w') do |csv|
  #   csv << headers
  #   arr_csv.each do |rec|
  #     csv << rec.values
  #   end
  # end
  
  # Method that outputs the scrapped data in JSON format
  def parse_to_json
    puts JSON.pretty_generate(@population_stats)
  end

  # Method that searches a record by its country name
  def find_country_by_name(country_to_find)
    down_country = country_to_find.downcase
    select_country = world_population.select { |nation| nation[:Country].downcase == down_country }
    puts JSON.pretty_generate(select_country)
    select_country
  end
end
