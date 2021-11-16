![](https://img.shields.io/badge/Microverse-blueviolet)

# Web Scraper

> This is a project built to scrap current world population statistics from (https://www.worldometers.info/world-population/). The scraper gets the information from the website and displays the data in JSON format and also saves the data into a csv file. Here is what is being scraped from the website:

**World Population Data**

```
#Number
#Country
#Population
#Yearly Change
#Net Change
#Density(p/km2)
#Land Area(km2)
#Migrants
#Fertility
#Median Age
#Urban Population
#World Share
```

<!--### The original Web site-->

<!--![screenshot](./assets/images/page.png)-->

<!--### My scraper Output-->

<!--![screenshot](./assets/images/my_scraper.png)-->

## Built With

![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?&style=for-the-badge&logo=ruby&logoColor=white)

- Gems used: nokogiri, byebug, HTTParty

## Getting Started

_Get a local copy up and running by following these simple steps._

- You need to have ruby installed on your machine
- run command `git clone https://github.com/SamArsanios/web-scraper.git` to clone the repository
- run command `bundle install`
- go into the folder containing the project by typing `cd web-scraper`
- go into the folder containing the project by typing `cd bin`
- type in your terminal the command `ruby main.rb`

### Run tests

- Unit test (Rspec)

- go into the folder containing the project by typing `cd web-scraper`
- go into the folder containing the project by typing `cd spec`
- type in your terminal the command `rspec scraper_spec.rb`
<!-- ![screenshot](./assets/images/test_results.png)

To see the test results run the following command

`rspec --format documentation`-->

## Author

👤 **SamArsanios**

- Github: [@SamArsanios](https://github.com/SamArsanios)
- Twitter: [@SamArsanios](https://twitter.com/SamArsanios)
- LinkedIn: [Samson](https://www.linkedin.com/in/samson-kibrom/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

Hat tip to Microverse for their `README` template.
