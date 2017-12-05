import subprocess
import shutil
import sys, os
import threading
import time
from time import sleep

shutil.rmtree("responses", ignore_errors=True, onerror=None)
os.system("mkdir responses && mkdir responses/results && mkdir responses/times")

i=0
stop = 100
j=0
while (j<3):
        locations=open("UserLocations.adm")
        i=0
        start = time.clock()
        for line in locations:
                i=i+1   
                trimmedLine = line.split("\"")
                username = trimmedLine[3]
                location = trimmedLine[7]       
                command = "curl --silent -G -H \"Accept: application/x-adm\" -v -d 'mode=synchronous' --data-urlencode 'aql=use steven; select value r from EmergencyReports r where r.insert_time > current_datetime() - day_time_duration(\"PT10S\") and spatial_intersect(r.location,circle(\""
                command += location + "\")); ' http://localhost:19002/sqlpp -w %{time_total} >> responses/results/"
                command += username + ".txt &"
                os.system(command)
                elapsed = time.clock() - start
                #os.system("echo '' >> responses/results/"+username+".txt")
                if (elapsed > 10 or i > stop):
                        break
        os.system("echo 'sent " + str(i) + "' >> responses/amounts.txt")
        j=j+1