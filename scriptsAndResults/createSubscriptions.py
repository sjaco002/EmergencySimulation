import random
import datetime
import time
import re
import pytz
import os

os.remove('subscriptions.adm')

i=0
stop = 20000
locations=open("UserLocations.adm")
subs = open('subscriptions.adm','w+')
for line in locations:
        i=i+1   
        trimmedLine = line.split("\"")
        username = trimmedLine[3]
        sub = '{"DataverseName" : "steven" , "BrokerName" : "brokerA", "param0" : "' + username + '" }\n'
        subs.write(sub) 
        if (i==stop):
                break   
subs.close()

