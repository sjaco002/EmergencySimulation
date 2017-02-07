import re

f1 = open('userLocations.log', 'r')
f2 = open('UserLocations.adm', 'w')
f3 = open('Shelters.adm', 'w')
f4 = open('Emergencies.adm', 'w')
for line in f1:
    if (line[0] == 'I'):
		splitLine = line.split(" ")
		if (splitLine[1] == "user"):
			timeOffSet = float(splitLine[3])
			name = splitLine[4].split(":")[1]
			location = splitLine[5].split("(")[1]
			x = float(location.split(",")[0])
			y = float(location.split(",")[1][:-2])
			adm = "{\"userName\" : \"" + name + "\" , \"location\" : circle(\"" + str(x) + "," + str(y) + " 1.0" +  "\")" + ", \"timeStamp\" : " + str(timeOffSet) + "\n"
			f2.write(adm)
		if (splitLine[1] == "shelter"):
			name = splitLine[3]
			location = splitLine[4].split("(")[1]
			x = float(location.split(",")[0])
			y = float(location.split(",")[1][:-2])
			adm = "{\"shelterName\" : \"" + name + "\" , \"location\" : circle(\"" + str(x) + "," + str(y) + " 1.0" +  "\")" + " }\n"
			f3.write(adm)
		if (splitLine[1] == "emergency"):
			Etype = splitLine[5]
			location = splitLine[7].split("(")[1]
			timeOffSet = float(splitLine[3])
			x = float(location.split(",")[0])
			y = float(location.split(",")[1][:-2])
			adm = "{\"Etype\" : \"" + Etype + "\" , \"location\" : circle(\"" + str(x) + "," + str(y) + " 1.0" +  "\")" + ", \"timeStamp\" : " + str(timeOffSet) + "\n"
			f4.write(adm)
f1.close()
f2.close()
f3.close()
f4.close()
