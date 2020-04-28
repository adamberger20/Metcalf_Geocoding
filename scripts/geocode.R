# script to geocode addresses using tidygeocoder

# load the necessary pacakges
library(tidyverse)
library(mapsapi)

# load the data and remove empty rows
buses_import <- read_csv("data/buses.csv") 
buses <- buses_import[c(1:343), ]

# get the addresses as a character vector
addresses <- buses$Local

# get geocodes from the Google Maps API (requires key)
codes <- mp_geocode(addresses, region = "br", key = getOption("google_key"))

# extract lat/long points from the API responses
point <- mp_get_points(codes)

# save the output (remove comment to run)
# write_csv(point, "data/points.csv")
