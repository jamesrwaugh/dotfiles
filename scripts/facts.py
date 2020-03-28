#!/usr/bin/env python3
import requests, re

response = requests.get('http://randomfactgenerator.net/')

for item in re.findall('\'z\'\>(.*?)<br\/>', response.text):
	print(item.strip())

