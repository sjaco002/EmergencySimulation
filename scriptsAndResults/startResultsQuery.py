import subprocess
import shutil
import sys, os
import threading
import time

shutil.rmtree("responses", ignore_errors=True, onerror=None)
os.system("mkdir responses")

while (True):
        start = time.clock() 
	os.system("./queryResultsTable.sh")
	elapsed = time.clock() - start
	while (elapsed < 10):
        	elapsed = time.clock() - start