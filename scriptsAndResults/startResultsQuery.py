import subprocess
import shutil
import sys, os
import threading
import time

shutil.rmtree("responses", ignore_errors=True, onerror=None)
os.system("mkdir responses")
t_end = time.time() + 110

while (time.time() < t_end):
        start = time.clock()
        os.system("./queryResultsTable.sh")
        elapsed = time.clock() - start
        while (elapsed < 10):
                elapsed = time.clock() - start