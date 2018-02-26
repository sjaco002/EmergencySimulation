import re
import sys

f1 = open('subscriptions50000.adm', 'r')
f2 = open('subscriptions'+ sys.argv[1] + 'broker' + sys.argv[2] + '.adm', 'w')

i=0.0
for line in f1:
	if (i == float(sys.argv[1])):
		break
	if (i > float(sys.argv[1]) / 2.0 and float(sys.argv[2]) == 2.0):
		line = line.replace("brokerA","brokerB")
	elif (i > float(sys.argv[1]) / 3.0 and float(sys.argv[2]) == 3):
		line = line.replace("brokerA","brokerB")
	if (i > float(sys.argv[1]) * (2.0 / 3.0) and float(sys.argv[2]) == 3.0):
		line = line.replace("brokerB","brokerC")
	f2.write(line)
	i=i+1.0

f1.close()
f2.close()