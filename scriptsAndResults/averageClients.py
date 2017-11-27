import subprocess
import shutil
import sys, os
import threading
import time

hits=0.0
attempts=0.0
hitTimesSum=0.0
failureTimesSum=0.0

for filename in os.listdir("responses/times"):
	results=open("responses/times/" + filename)
	for line in results:  
		attempts += 1.0
		if (line.find("i") == -1):
			hits += 1.0
			hitTimesSum += float(line)
		else:
			failureTimesSum += float(line.split(" ")[1])
print "attempts:" + str(attempts)
print "on time:" + str(hits)
print "total time spent on on-time queries:" + str(hitTimesSum)
print "total time spent on late queries:" + str(failureTimesSum)
print "on-time rate:" + str(hits/attempts)
print "average query time for all queries:" + str((hitTimesSum+failureTimesSum)/attempts)
print "average query time for on-time queries:" + str(hitTimesSum/hits)