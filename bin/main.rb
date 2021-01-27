require_relative '../lib/scraper'

scraper = Scraper.new('https://www.worldometers.info/world-population/')
run_app = scraper.world_population

run_app
