<br>

<p align="center">
  <img src="https://elinux.org/images/c/cb/Raspberry_Pi_Logo.svg" width="100" height="75"/> 
  <img src="https://svgur.com/i/BW3.svg" width="100" height="75"/> 
  <img src="https://www.docker.com/sites/default/files/d8/2019-07/vertical-logo-monochromatic.png" width="100" height="75"/>
<p/>

<br>

# Twitter Scraping Automation [work in progress]

This repo contains the software written to automate the procces of sustained tweets search/scraping using the R programming language and the Twitter Developer API. Not only provides the software, but some discussion about automation, hardware and deploying, aiming a less experienced user.

Read the rest of this README.md for more information about the thought procces and use guide. I'm far from beeing an experienced programmer so feel free to contribue and address issues to help me on this project. 

# Why I wrote this code? 

The biggest drawback while using the Twitter Developer API for scraping tweets and doing social media research in social sciences is the time span limitation. Both the R (rtweet) and Python (tweepy) libraries that interact with the API face this issue of only having access to tweets posted 7-9 days in the past. This limits the studies possibilitys of researchers who intend to work with this methodology (myself included).

I was working in a project related to Universal Basic Income policys and part of my job was to search for tweets mencioning the topic from both citizens and politicians. Because I had othes jobs to focus on I started developing some way to search this tweets with less effort as possible (i.e as automatic as possible). 

Here I doccument this journey and the current state of this application that I intend to share and help other students/researches.

The main goal here, besides developing my first open source project, is to make this script also easily avaible and replicable for people to implement it on their projects.

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
