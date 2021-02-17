<br>

<p align="center">
  <img src="https://svgur.com/i/BW3.svg" width="150" height="75"/> 
  <img src="https://elinux.org/images/c/cb/Raspberry_Pi_Logo.svg" width="100" height="75"/> 
  <img src="https://www.docker.com/sites/default/files/d8/2019-07/vertical-logo-monochromatic.png" width="100" height="75"/>
<p/>

<br>

# Twitter Scraping Automation [work in progress]

This repo provides a script written to automate the procces of sustained twitter search/scraping using the R programming language.

Read the rest of this README.md for more information about the thought procces and use guide. I'm not an experienced programmer so feel free to contribue and address issues to help me on this project. 

# Why I wrote this code? 

The biggest drawback of using the Twitter Developer API for scraping tweets and doing research on the field of social sciences is the time span limitation. Both the R and Python libraries that interact with the API face this issue of only having access to tweets posted 7-9 days in the past. This limits the work of researchers that choose this methodology. 

That said, we have two possibilities: 

- Either pay for the "premium" API wich allows you to search the full Twitter arquive;
- Or use this project to automate the scraping of tweets for a long period of time in order to build an extensive database on determined topic. 

The main goal, besides developing my first open source project, is to make this script easily avaible to researchers to implement it on their projects.

# How it works? 

# How to use it for your research/project? 

This script was idealized to minimize human interaction and the obligation to run it manually. After cloning this project I recommend following 3 simples steps to set everything up and start scraping. 


### 1. Creating a Twitter Developer account

Create a Twitter Developer Account in order to gain access to the API (if don't have one already)

### 2. Setting the `config.txt` file

Access the `config.txt` file on the config folder and insert the keywords/terms to search (don't use quotation marks and write on term for each line)

### 3. Setting the `api-config.json` file 

Access the `api-config.json` file on the config folder and insert your personal credentials to authorize the `rtweet` to send requests to the API using your user account

### 4. Scheduling automated task (using any Linux OS or Mac with _cron_) 

This optional: start a sometype of task scheduler to automate the process of running the R script every 3 days or every week

# How to maintain this script running and collecting information 24/7? 
