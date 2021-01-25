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
                                
      record = record.split(" ")
      record.delete "%" 
      record_hash = { 
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
                      "World Share": record[11] }
                      
      records << record_hash
  
      # puts "No.1": record[0]
      # puts "Country": record[1]
      # puts "Population": record[2]
      # puts "Yearly Change": record[3]
      # puts "Net Change": record[4]
      # puts "Density (P/Km2)": record[5]
      # puts "Land Area (Km2)": record[6]
      # puts "Migrants": record[7]
      # puts "Fertility Rate": record[8]
      # puts "Median Age": record[9] 
      # puts "Urban Population": record[10]
      # puts "World Share": record[11] 
      # puts "---------------------------"
  
      i += 1
    end
   records
   byebug
  end
end
