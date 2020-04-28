# script to geocode addresses using tidygeocoder

# load the necessary pacakges
library(tidyverse)
library(mapsapi)
library(hash)
library(xml)

# load the data and remove empty rows
buses_import <- read_csv("data/buses.csv") 
buses <- buses_import[c(1:343), ]

# get the addresses as a character vector
addresses <- buses$Local

# geocode the addresses
codes <- mp_geocode(addresses, region = "br", key = getOption("google_key"))
point <- mp_get_points(codes)

# save the output
write_csv(point, "data/points.csv")
