from socket import socket
import random
import datetime
import time
import re
import sys

ip = 'promethium.ics.uci.edu'
port1 = 10008

sock1 = socket()
sock1.connect((ip, port1))

t_end = time.time() + 200

i=1
persecond=int(sys.argv[1])
while (True):
	locations=open("Emergencies.adm")
	for line in locations:
		if (i % persecond == 0):
			time.sleep(1)
		i=i+1
		trimmedLine = line.split("Stamp")[0]
		t = datetime.datetime.utcnow()
		#t = t + datetime.timedelta(0,20)
		stringTime = "%s" %t
		stringTime = re.sub(r"\s+", 'T', stringTime)
		stringTime = stringTime[0:stringTime.index(".")+4]
		trimmedLine += "Stampgiven\" : datetime(\"" + stringTime + "\")}"
		print trimmedLine
		sock1.sendall(trimmedLine)

sock1.close()
