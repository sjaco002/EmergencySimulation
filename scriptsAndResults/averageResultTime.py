import subprocess
import shutil
import sys, os
import threading
import time

results=open("responses/responses.txt")
count=0.0
sumation=0.0
for line in results:  
        trimmedLine = line.split("\"")
        if (len(trimmedLine) != 1):
                continue
        count += 1.0
        sumation += float(line)
print count 
print sumation 
print (sumation/count)