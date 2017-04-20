from socket import socket
import random
import datetime
import time
import re
import pytz

ip = '127.0.0.1'
port1 = 10002

sock1 = socket()
sock1.connect((ip, port1))

i=0
locations=open("UserLocations.adm")
for line in locations:
	if (i % 5000 == 0):
		time.sleep(.1)
	i=i+1
	trimmedLine = line.split("Stamp")[0]
	t = datetime.datetime.now(pytz.utc)
	stringTime = "%s" %t
	stringTime = re.sub(r"\s+", 'T', stringTime)
	stringTime = stringTime[0:stringTime.index(".")+4]
	trimmedLine += "Stamp\" : datetime(\"" + stringTime + "\"), \"recordId\" : " + str(i) + "}"
	print trimmedLine
	sock1.sendall(trimmedLine)

sock1.close()
