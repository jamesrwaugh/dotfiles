#!/usr/bin/env python3
# Opens all archives of a specified board in Firefox
import requests
import json, sys, os

if __name__ == '__main__':
	#Boilerplate
	if len(sys.argv) < 2:
		print("{}: [board name]".format(sys.argv[0]))
		sys.exit(1)
	board = sys.argv[1]
	archives = [ ]

	#Get Mayhem's JSON of archives.
	#For each, check if it holds a board.
	r = requests.get("https://raw.githubusercontent.com/MayhemYDG/archives.json/gh-pages/archives.json")
	for object in r.json():
		if board in object["boards"]:
			archives.append(object["domain"])

	#Open all as tabs in Firefox, with /board/ on the end.
	for archive in archives:
		os.system("firefox --private-window {0}/{1}/ &".format(archive, board))

