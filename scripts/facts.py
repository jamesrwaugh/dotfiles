#!/usr/bin/env python
import requests, re

response = requests.get('http://randomfactgenerator.net/')

for item in re.findall('\'z\'\>(.*?)<br\/>', response.text):
	print item.encode('ascii').strip()

