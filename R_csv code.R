library(rvest)
library(dplyr)

cars_url = 'https://en.wikipedia.org/wiki/Comma-separated_values'
cars_table = read_html(cars_url)

Year = cars_table %>% html_nodes('.wikitable td:nth-child(1)') %>% html_text()
Make = cars_table %>% html_nodes('.wikitable td:nth-child(2)') %>% html_text()
Model = cars_table %>% html_nodes('td:nth-child(3)') %>% html_text()
Description = cars_table %>% html_nodes('td:nth-child(4)') %>% html_text()
Price = cars_table %>% html_nodes('td:nth-child(5)') %>% html_text()

r_csv = data.frame(Year, Make, Model, Description, Price, stringsAsFactors = FALSE)
write.csv(r_csv, "r_csv.csv")