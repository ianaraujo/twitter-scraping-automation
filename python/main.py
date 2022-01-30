import yaml
import os

import tweepy as tp
import pandas as pd

# handle config file info

with open('config/test.yml') as f:
    conf = yaml.safe_load(f)

search_terms = conf['keywords']
credentials = conf['api_oauth']
database = conf['database']

assert database == 0, 'Essa função ainda encontra-se em desenvolvimento! Por favor escolher opção "database = false"'

if database == 0:
    pass
else:
    pass

# Twitter API

token = tp.OAuthHandler(
    consumer_key = credentials['consumer_key'],
    consumer_secret = credentials['consumer_key_secret'],
    access_token = credentials['access_token'],
    access_token_secret = credentials['access_token_secret']
)

client = tp.API(token)

tweets = client.search_tweets(q = "renda básica", count = 5)

json_data = [s._json for s in tweets]

s = pd.json_normalize(json_data)

print(s['id'])

