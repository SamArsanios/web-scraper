# rubocop:disable Metrics/MethodLength
require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'byebug'

def world_population
  unparsed_page = HTTParty.get('https://www.worldometers.info/world-population/')
  parsed_page = Nokogiri::HTML(unparsed_page)
  population_stats = []

  nations = parsed_page.css('table#popbycountry > tbody > tr').map(&:text).count
  i = 1
  while i < nations
    record = parsed_page.css("table#popbycountry > tbody > tr[#{i}]").text
    record = record.split(' ')
    record.delete '%'
    record_hash = { "Number": record[0],
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
                    "World Share": record[11] }
    population_stats << record_hash
    i += 1
  end
  CSV.open('population.csv', 'w') do |csv|
    csv << population_stats
    # puts CSV.generate_line(population_stats)
  end

  puts JSON.pretty_generate(population_stats)
  population_stats
end

def find_country_by_name(country_to_find)
    down_country = country_to_find.downcase
    world_population.select { |nation| nation[:Country].downcase == down_country }
end
  
world_population

puts find_country_by_name("nigeria")


# rubocop:enable Metrics/MethodLength
