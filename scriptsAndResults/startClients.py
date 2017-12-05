import subprocess
import shutil
import sys, os
import threading
import time
from time import sleep

shutil.rmtree("responses", ignore_errors=True, onerror=None)
os.system("mkdir responses && mkdir responses/results && mkdir responses/times")

def worker(command,username):
        i = 0
	while (i < 3):
		start = time.clock()
		os.system(command)
		elapsed = time.clock() - start
                os.system("echo '' >> responses/results/"+username+".txt")
		if (elapsed > 10):
			os.system("echo 'failure " + str(elapsed) + "' >> responses/times/"+username+".txt")
		else:
			os.system("echo '" + str(elapsed) + "' >> responses/times/"+username+".txt")
		sleep(10-elapsed)
                i = i+1


i=0
stop = 600
locations=open("UserLocations.adm")
for line in locations:
        i=i+1   
        trimmedLine = line.split("\"")
        username = trimmedLine[3]
        location = trimmedLine[7]       
        command = "curl --silent -G -H \"Accept: application/x-adm\" -v -d 'mode=synchronous' --data-urlencode 'aql=use steven; select value r from EmergencyReports r where r.insert_time > current_datetime() - day_time_duration(\"PT10S\") and spatial_intersect(r.location,circle(\""
        command += location + "\")); ' http://localhost:19002/sqlpp -w %{time_total} >> responses/results/"
        command += username + ".txt"

        t = threading.Thread(name='my_service', target=worker, kwargs={'command':command,'username':username})
        t.start()
        if (i%(stop/10) == 0):
                time.sleep(1)
        if (i==stop):
                break   