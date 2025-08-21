# Terrell Roulston
# August 20th 2025

# Top ---------------------------------------------------------------------
### This script is for downloading digitalized herbarium samples of Malus species Native to North America
### Using the "mvh" R package, "my virtual herbarium"
### This list of downloaded herbarium records will then be cross referenced with a list of GBIF IDs of previously cleaned occurrence records
### To ensure the accuracy of observations, and to remove likely cultviated species
### It should be noted that the eastern species in sect. Chloromeles are likely a single species given genetic information
### But even so, the three species have overlapping ranges, and IDs must be taken at face value from GBIF

### Species of interest
# Malus fusca
# Malus coronaria
# Malus ioensis
# Malus angustifolia

# Libraries ---------------------------------------------------------------
library(tidyverse) # grammer and data management
library(rgbif) # a dependacy in mvh, accesses GBIF data via API
# Need to install this package remotely via github
# https://github.com/tncvasconcelos/mvh
# RUN TO INSTALL ONCE
# library(devtools)
# devtools::install_github("tncvasconcelos/mvh")
library(mvh) # download herbarium data via GBIF (can also do iNat research grade)


# Search rgbif for Metadata -----------------------------------------------
# Workflow starts by searching for taxon metadata
# For publication purposes it is good to setup a GBIF account so associated downloadeds can be referenced using a DOI
# GBIF User info
# GBIF user info
user='REDACTED'
pwd='REDACTED'
email='REDACTED'

# Note that you can only start a max of three downloads simoultaously 
# So need to move onto next step before you can complete all searches

meta_fus <- search_specimen_metadata(taxon_name = "Malus fusca",
                                     user = user,
                                     pwd = pwd,
                                     email = email)

meta_cor <- search_specimen_metadata(taxon_name = "Malus coronaria",
                                     user = user,
                                     pwd = pwd,
                                     email = email)

meta_ion <- search_specimen_metadata(taxon_name = "Malus ioensis",
                                     user = user,
                                     pwd = pwd,
                                     email = email)

meta_ang <- search_specimen_metadata(taxon_name = "Malus angustifolia",
                                     user = user,
                                     pwd = pwd,
                                     email = email)



# Download images ---------------------------------------------------------
# Once metadata is ready you are good to download
# Create directory for each species
# Checks if it already exists then makes it if doesnt

if (!dir.exists("./herb_data/fus")) {
  dir.create("./herb_data/fus", recursive = TRUE)
}

if (!dir.exists("./herb_data/cor")) {
  dir.create("./herb_data/cor", recursive = TRUE)
}

if (!dir.exists("./herb_data/ion")) {
  dir.create("./herb_data/ion", recursive = TRUE)
}

if (!dir.exists("./herb_data/ang")) {
  dir.create("./herb_data/ang", recursive = TRUE)
}

# Now start downloads
#### M. fusca ####
message("*Starting M. fusca download:  ", date())

download_specimen_images(meta_fus, # metadata object from above
                         resize = 25, # reduce the image resolution to save on file size
                         max_megapixels = 6, # this is medium quality resolution, it will reduce an images larger than this to this value
                         sleep = 1, # how long to wait in between each image download
                         dir_name = "./herb_data/fus/images", # point to species directory, this is where images downloaded go
                         result_file_name = "./herb_data/fus/fusca_results_summary.csv")

message("*Finished M. fusca download:  ", date())

#### M. coronaria ####
message("*Starting M. coronaria download:  ", date())

download_specimen_images(meta_cor, # metadata object from above
                         resize = 25, # reduce the image resolution to save on file size
                         max_megapixels = 6, # this is medium quality resolution, it will reduce an images larger than this to this value
                         sleep = 1, # how long to wait in between each image download
                         dir_name = "./herb_data/cor/images", # point to species directory, this is where images downloaded go
                         result_file_name = "./herb_data/cor/coronaria_results_summary.csv")

message("*Finished M. cornaria download:  ", date())

#### M. ioensis ####
message("*Starting M. ioensis download:  ", date())

download_specimen_images(meta_ion, # metadata object from above
                         resize = 25, # reduce the image resolution to save on file size
                         max_megapixels = 6, # this is medium quality resolution, it will reduce an images larger than this to this value
                         sleep = 1, # how long to wait in between each image download
                         dir_name = "./herb_data/ion/images", # point to species directory, this is where images downloaded go
                         result_file_name = "./herb_data/ion/ioensis_results_summary.csv")

message("*Finished M. ioensis download:  ", date())

#### M. angustifolia ####
message("*Starting M. angustifolia download:  ", date())

download_specimen_images(meta_ang, # metadata object from above
                         resize = 25, # reduce the image resolution to save on file size
                         max_megapixels = 6, # this is medium quality resolution, it will reduce an images larger than this to this value
                         sleep = 1, # how long to wait in between each image download
                         dir_name = "./herb_data/ang/images", # point to species directory, this is where images downloaded go
                         result_file_name = "./herb_data/ang/angustifolia_results_summary.csv")

message("*Finished M. angustifolia download:  ", date())