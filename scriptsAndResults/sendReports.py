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
		j = 0
		while (j < -1):
			sline='{"Etype" : "flood" , "location" : circle("20000.5,20000.56 1.0")}'
			print sline
			sock1.sendall(sline)
			j=j+1
			i=i+1
			if (i % persecond == 0):
				time.sleep(1)
		print line
		sock1.sendall(line)
		i=i+1

sock1.close()
