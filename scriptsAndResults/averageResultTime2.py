import subprocess
import shutil
import sys, os
import threading
import time


count=0.0
sumation=0.0
maxi=0.0
for filename in os.listdir("responses/results"):
	results=open("responses/results/" + filename)
	for line in results:  
	        trimmedLine = line.split("\"")
	        if (len(trimmedLine) != 1 or "." not in trimmedLine[0]):
	                continue
	        count += 1.0
	        sumation += float(line)
	        if (float(line) > maxi):
	        	maxi = float(line)
print "requests:" + str(count)
print "total request times:" + str(sumation)
print "max request time:" + str(maxi)
print "avg request time:" + str(sumation/count)