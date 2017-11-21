import subprocess
import shutil
import sys, os
import threading
import time

shutil.rmtree("responses", ignore_errors=True, onerror=None)
os.system("mkdir responses && mkdir responses/results")

def worker(command):
	while (True):
		start = time.clock() 
		os.system(command)
		elapsed = time.clock() - start
		if (elapsed > 10):
			os.system("echo 'failure' >> responses/fails.txt")
		while (elapsed < 10):
			elapsed = time.clock() - start


i=0
stop = 300
while (i<stop):
	locations=open("UserLocations.adm")
	for line in locations:
		i=i+1
		trimmedLine = line.split("\"")
		username = trimmedLine[3]
		location = trimmedLine[7]	
		command = "./singlePoll.sh \"" + location + "\" " + username

		t = threading.Thread(name='my_service', target=worker, kwargs={'command':command})
		t.start()
		if (i==stop):
			break