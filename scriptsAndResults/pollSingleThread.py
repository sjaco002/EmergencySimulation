import subprocess
import shutil
import sys, os
import threading
import time
from time import sleep

shutil.rmtree("responses", ignore_errors=True, onerror=None)
os.system("mkdir responses && mkdir responses/results && mkdir responses/times")


i=0
j=0
maxUsers = 100
while (j<20):
        locations=open("UserLocations.adm")
        i=0
        start = time.time()
        for line in locations:
                i=i+1   
                trimmedLine = line.split("\"")
                username = trimmedLine[3]
                location = trimmedLine[7]       
                command = "until $(curl --silent -G -H \"Accept: application/x-adm\" -v -d 'mode=synchronous' --data-urlencode 'aql=use steven; select value r from EmergencyReports r where r.insert_time > current_datetime() - day_time_duration(\"PT10S\") and spatial_intersect(r.location,circle(\""
                command += location + "\")); ' http://promethium.ics.uci.edu:19002/sqlpp -w %{time_total} >> responses/results/"
                command += username + ".txt); do : ; done"
                os.system(command)
                elapsed = time.time() - start
                os.system("echo '' >> responses/results/"+username+".txt")
                if (i >= maxUsers):
                        while (elapsed < 10):
                                elapsed = time.time() - start
                if (elapsed >= 10):
                        break
        os.system("echo '" + str(i) + "\n' >> responses/amounts.txt")
        j=j+1


