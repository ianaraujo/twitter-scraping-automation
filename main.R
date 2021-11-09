# TTSCRAPER by Ian Araujo

setwd("/home/ianaraujo/Projects/R/twitter-scraping-automation/")

# Install project required packages

packages <- installed.packages()

if (!"yaml" %in% packages) {
  install.packages("yaml")
} else {
  library(yaml)
}

if (!"rtweet" %in% packages) {
  install.packages("rtweet")
} else {
  library(rtweet)
}

config <- read_yaml(file = "config.yml")

# Read the api-config JSON file with Twitter API OAuth access information

api_keys <- config$api_oauth

# Registers the OAuth Token
create_token(app = api_keys$app_name,
             consumer_key = api_keys$consumer_key, consumer_secret = api_keys$consumer_secret,
             access_token = api_keys$access_token, access_secret = api_keys$access_token_secret,
             set_renv = FALSE)

# Read the config file with the provided search keywords

search_terms <- config$keywords

# Check existence of directory to store the tweets (based on the terms provided)

if (!dir.exists("./data")) {dir.create("./data")}

check_dir_existence <- function(terms) {
  # if any required directory does not exist this will create it //
  for (i in terms) {
    dir_logical <- dir.exists(paste0("./data/", i))

    if (dir_logical == FALSE) {
      dir.create(paste0("./data/", i))
    }
  }
}

check_dir_existence(search_terms)

# Check if directory is empty and start the scraping process (initial search)

init_cont_search <- function(terms) {
  # check if the directory is empty
  for (i in terms) {
    n_files <- length(list.files(paste0("./data/", i)))

    if (n_files == 0) {
      # start initial scraping
      init_search <- search_tweets(paste0("\"", i, "\""),
                      n = 20000, include_rts = FALSE)

      write_as_csv(x = init_search,
        file_name = paste0("./data/", i, "/", format(Sys.time(), '%d-%m-%Y'), ".csv"),
        prepend_ids = TRUE, na = "NA")

    } else {
        # continue scraping from most recent status id
        files_info <- file.info(list.files(paste0("./data/", i), full.names = TRUE))
        recent_file <- rownames(files_info)[which.max(files_info$mtime)]

        status_id <- read_twitter_csv(file = recent_file)$status_id
        id <- status_id[which.max(status_id)]

        tt <- search_tweets(paste0("\"", i, "\""), n = 20000,
                            include_rts = FALSE, retryonratelimit = TRUE, since_id = id)
        if (nrow(tt) != 0) {
          write_as_csv(x = tt,
                       file_name = paste0("./data/", i, "/", format(Sys.time(), '%d-%m-%Y'), ".csv"),
                       prepend_ids = TRUE, na = "NA")
      }
    }
  }
}

init_cont_search(search_terms)

# Check previous searchs and set status_id

setwd("~")

# Routine Twitter search for each keyword, save and write report
