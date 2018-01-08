import subprocess
import shutil
import sys, os
import threading
import time

totalPolls=0.0
executions=0.0
maxUsers=0.0
minUsers=100000
results=open("responses/amounts.txt")
for line in results:
	try:
		users = float(line)
	except ValueError:
		continue
	executions += 1.0
	totalPolls += users
	if (users > maxUsers):
		maxUsers = users
	if (users < minUsers):
		minUsers = users

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

print "executions:" + str(executions)
print "totalPolls:" + str(totalPolls)
print "max succeeded:" + str(maxUsers)
print "min succeeded:" + str(minUsers)
print "requests:" + str(count)
print "total request times:" + str(sumation)
print "polling user average:" + str(totalPolls/executions)
print "average total time:" + str(sumation/executions)
print "avg user time:" + str(sumation/count)
print "max user time:" + str(maxi)
