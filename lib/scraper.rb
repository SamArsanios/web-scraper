require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'byebug'

def world_population
    unparsed_page = HTTParty.get('https://www.worldometers.info/world-population/')
    parsed_page = Nokogiri::HTML(unparsed_page)

    population_stats = []
    
    nations = parsed_page.css('table#popbycountry > tbody > tr').map(&:text).count
    
end
