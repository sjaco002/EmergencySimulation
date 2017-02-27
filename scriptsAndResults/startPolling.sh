#! /bin/sh

COUNTER=0
while [  $COUNTER -lt 835 ]; do
	SUBCOUNTER=0
	while [ $SUBCOUNTER -lt 100 ]; do
		curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse channels;
		let $lastTenSeconds :=
		current-datetime() - day-time-duration("PT10S")
		for $emergency in dataset EmergencyReports
		for $userlocation in dataset UserLocations
		where $userlocation.userName = "p'"$COUNTER"'u'"$SUBCOUNTER"'"
		and spatial-intersect($emergency.impactZone,$userlocation.location)
		and $userlocation.timestamp >= $lastTenSeconds
		and $emergency.timestamp >= $lastTenSeconds
		return {  
		"user at":$userlocation,
		"emergency":$emergency
		};
		' http://localhost:19002/aql > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/reponses/reponses.txt
		let SUBCOUNTER=SUBCOUNTER+1 
	done
	let COUNTER=COUNTER+1 
done

while [  $COUNTER -lt 1670 ]; do
	SUBCOUNTER=0
	while [ $SUBCOUNTER -lt 100 ]; do
		curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse channels;
		let $lastTenSeconds :=
		current-datetime() - day-time-duration("PT10S")
		for $emergency in dataset EmergencyReports
		for $userlocation in dataset UserLocations
		where $userlocation.userName = "c'"$COUNTER"'u'"$SUBCOUNTER"'"
		and spatial-intersect($emergency.impactZone,$userlocation.location)
		and $userlocation.timestamp >= $lastTenSeconds
		and $emergency.timestamp >= $lastTenSeconds
		return {  
		"user at":$userlocation,
		"emergency":$emergency
		};
		' http://localhost:19002/aql > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/reponses/reponses.txt
		let SUBCOUNTER=SUBCOUNTER+1 
	done
	let COUNTER=COUNTER+1 
done

while [  $COUNTER -lt 2505 ]; do
	SUBCOUNTER=0
	while [ $SUBCOUNTER -lt 100 ]; do
		curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse channels;
		let $lastTenSeconds :=
		current-datetime() - day-time-duration("PT10S")
		for $emergency in dataset EmergencyReports
		for $userlocation in dataset UserLocations
		where $userlocation.userName = "w'"$COUNTER"'u'"$SUBCOUNTER"'"
		and spatial-intersect($emergency.impactZone,$userlocation.location)
		and $userlocation.timestamp >= $lastTenSeconds
		and $emergency.timestamp >= $lastTenSeconds
		return {  
		"user at":$userlocation,
		"emergency":$emergency
		};
		' http://localhost:19002/aql > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/reponses/reponses.txt
		let SUBCOUNTER=SUBCOUNTER+1 
	done
	let COUNTER=COUNTER+1 
done

while [  $COUNTER -lt 5010 ]; do
	SUBCOUNTER=0
	while [ $SUBCOUNTER -lt 100 ]; do
		curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse channels;
		let $lastTenSeconds :=
		current-datetime() - day-time-duration("PT10S")
		for $emergency in dataset EmergencyReports
		for $userlocation in dataset UserLocations
		where $userlocation.userName = "t'"$COUNTER"'u'"$SUBCOUNTER"'"
		and spatial-intersect($emergency.impactZone,$userlocation.location)
		and $userlocation.timestamp >= $lastTenSeconds
		and $emergency.timestamp >= $lastTenSeconds
		return {  
		"user at":$userlocation,
		"emergency":$emergency
		};
		' http://localhost:19002/aql > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/reponses/reponses.txt
		let SUBCOUNTER=SUBCOUNTER+1 
	done
	let COUNTER=COUNTER+1 
done




