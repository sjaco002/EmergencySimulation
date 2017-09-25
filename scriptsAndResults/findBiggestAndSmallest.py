import re

f1 = open('userLocations.log', 'r')
biggestx=0
smallestx=5000
biggesty=0
smallesty=5000
x = 0
y = 0

for line in f1:
    if (line[0] == 'I'):
		splitLine = line.split(" ")
		if (splitLine[1] == "user"):
			location = splitLine[5].split("(")[1]
			x = float(location.split(",")[0])
			y = float(location.split(",")[1][:-2])
		if (splitLine[1] == "shelter"):
			location = splitLine[4].split("(")[1]
			x = float(location.split(",")[0])
			y = float(location.split(",")[1][:-2])
		if (splitLine[1] == "emergency"):
			Etype = splitLine[5]
			location = splitLine[7].split("(")[1]
			x = float(location.split(",")[0])
			y = float(location.split(",")[1][:-2])
		if (x < smallestx):
			smallestx = x
		if (y < smallesty):
			smallesty = y
		if (x > biggestx):
			biggestx = x
		if (y > biggesty):
			biggesty = y
f1.close()
print str(smallestx) + " " + str(smallesty) + " " + str(biggestx) + " " + str(biggesty)

