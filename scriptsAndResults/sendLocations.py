from socket import socket
import random
import datetime
import time
import re
import sys

ip = 'promethium.ics.uci.edu'
port1 = 10009

sock1 = socket()
sock1.connect((ip, port1))

i=0
users = sys.argv[1]
persecond = float(users) / 10.0
start=time.time()
while (True):
	locations=open("UserLocations.adm")
	for line in locations:
		if (i % persecond == 0):
			while(time.time() - start < 1):
				pass
			start=time.time()
		#trimmedLine = line.split("100.0\")")[0]
		#t = datetime.datetime.utcnow()
		#t = t + datetime.timedelta(0,20)
		#stringTime = "%s" %t
		#stringTime = re.sub(r"\s+", 'T', stringTime)
		#print stringTime
		#stringTime = stringTime[0:stringTime.index(":")+6]
		#trimmedLine += "100.0\")}"#, \"timeStampGiven\" : datetime(\"" + stringTime + "\")}"
		#line = '{"userName" : "c1076u3" , "location" : circle("2313.73,1851.63 100.0")}'
		print line
		sock1.sendall(line)
		i=i+1
		if (i >= float(users)):
			i = 0
			locations.close()
			break

sock1.close()
