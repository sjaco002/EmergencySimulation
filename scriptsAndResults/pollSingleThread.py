import subprocess
import shutil
import sys, os
import threading
import time
import pycurl
from time import sleep

shutil.rmtree("responses", ignore_errors=True, onerror=None)
os.system("mkdir responses && mkdir responses/results && mkdir responses/times")

try:
    # python 3
    from urllib.parse import urlencode
except ImportError:
    # python 2
    from urllib import urlencode

c = pycurl.Curl()

i=0
j=0
iterations=1
maxUsers = 1
while (j<iterations):
        locations=open("UserLocations.adm")
        i=0
        start = time.time()
        for line in locations:
                i=i+1
                trimmedLine = line.split("\"")
                location = trimmedLine[7]
                location = location.replace(" ","%20")
                command = "http://promethium.ics.uci.edu:19002/sqlpp?aql=select%20value%20r%20from%20steven.EmergencyReports%20r"
                command += "%20where%20r.insert_time%20>%20current_datetime()%20-%20day_time_duration(\"PT10S\")"
                command += "%20and%20spatial_intersect(r.location%2Ccircle(\""
                command += location + "\"))%3B"
                c.setopt(c.URL, command)
                c.perform()
                print('time: %f' % c.getinfo(c.TOTAL_TIME))
                elapsed = time.time() - start
                if (i >= maxUsers):
                        while (elapsed < 10):
                                elapsed = time.time() - start
                if (elapsed >= 10):
                        print('requests: %f' % i)
                        break
        j=j+1
c.close()


