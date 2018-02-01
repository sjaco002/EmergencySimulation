from socket import socket
import random
import datetime
import time
import re
import pytz

ip = 'promethium.ics.uci.edu'
port1 = 10009

sock1 = socket()
sock1.connect((ip, port1))

i=0
stop = 100
start=time.time()
while (True):
	locations=open("UserLocations.adm")
	for line in locations:
		if (i == stop/10):
			while(time.time() - start < 1):
				i = 0
			start = time.time()
			locations.close()
			break
		trimmedLine = line.split("50.0\")")[0]
		t = datetime.datetime.now(pytz.utc)
		#t = t + datetime.timedelta(0,20)
		stringTime = "%s" %t
		stringTime = re.sub(r"\s+", 'T', stringTime)
		#print stringTime
		stringTime = stringTime[0:stringTime.index(":")+6]
		trimmedLine += "100.0\"), \"timeStampGiven\" : datetime(\"" + stringTime + "\")}"
		print trimmedLine
		sock1.sendall(trimmedLine)
		i=i+1

sock1.close()
