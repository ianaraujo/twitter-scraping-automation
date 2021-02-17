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

The idea behind it is very simple. You need to be able to search tweets every 3-6 days communicatiing with the API via `rtweet` and store this data somewhere. You could make a script and run it manually, sure! But this script implements a way to make it automatic, plus searching various terms at the same time. Also you need figure out a way to make the data collection as efficient as possible, not scraping duplicate information and storing it on a reliable place and format. 

The second step, after writing the software, is to figure out a way of automating the task of running the R script. On your local machine you could use any task scheduler to program a certain time and period to run your code. For this I used `cron` on Ubuntu. 

The problem is: you'll need your computer on all the time or at least make sure it will be on when the code is set to run. This results on a lot of problems, because you will often forget to turn it on. The solution is to run the code on a server or a cloud service, making sure your code will always run without exceptions and no tweet will be lost. 

Using this method you will be able to cummulate a great amount of data, the outcome of days or months of search, to build a reliabre source of information to your research or project. You can run it for as long as you can and editing the `query-config.json` you'll be able to add and remove terms changing the subject of your searh maintaining the data collected previously. 

# How to use it? 

This script was idealized to minimize human interaction and the obligation to run it manually. After cloning this project I recommend following 3 simples steps to set everything up and start scraping. 


### 1. Creating a Twitter Developer account

Create a Twitter Developer Account in order to gain access to the API (if don't have one already)

### 2. Setting the `config.txt` file

Access the `config.txt` file on the config folder and insert the keywords/terms to search (don't use quotation marks and write on term for each line)

### 3. Setting the `api-config.json` file 

Access the `api-config.json` file on the config folder and insert your personal credentials to authorize the `rtweet` to send requests to the API using your user account

### 4. Scheduling automated task (using any Linux OS or Mac with _cron_) 

This optional: start a sometype of task scheduler to automate the process of running the R script every 3 days or every week

# ? 
