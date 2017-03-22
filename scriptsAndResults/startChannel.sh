#! /bin/sh

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse channels;
create function RecentEmergenciesNearUser($user) {  
  let $lastTenSeconds :=
    current-datetime() - day-time-duration("PT10S")
  for $emergency in dataset EmergencyReports
  for $userlocation in dataset UserLocations
  where $userlocation.userName = $user
    and spatial-intersect($emergency.impactZone,$userlocation.location)
    and $userlocation.timestamp >= $lastTenSeconds
    and $emergency.timestamp >= $lastTenSeconds
  return {  
	"user at":$userlocation,
	"emergency":$emergency
}};

create repetitive channel EmergencyChannel using RecentEmergenciesNearUser@1 period duration("PT10S");
create broker brokerA at "asdfrdd"
' http://localhost:19002/aql > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/reponses/reponses.txt


COUNTER=0
while [  $COUNTER -lt 835 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    curl -G -H "Accept: application/x-adm" -v -d 'mode=asynchronous' --data-urlencode 'aql=use dataverse channels;
    subscribe to EmergencyChannel ("p'"$COUNTER"'u'"$SUBCOUNTER"'") on brokerA;
    ' http://localhost:19002/aql > reponses/reponses.txt
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done

while [  $COUNTER -lt 1670 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    curl -G -H "Accept: application/x-adm" -v -d 'mode=asynchronous' --data-urlencode 'aql=use dataverse channels;
    subscribe to EmergencyChannel ("c'"$COUNTER"'u'"$SUBCOUNTER"'") on brokerA;
    ' http://localhost:19002/aql > reponses/reponses.txt
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done

while [  $COUNTER -lt 2505 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    curl -G -H "Accept: application/x-adm" -v -d 'mode=asynchronous' --data-urlencode 'aql=use dataverse channels;
    subscribe to EmergencyChannel ("w'"$COUNTER"'u'"$SUBCOUNTER"'") on brokerA;
    ' http://localhost:19002/aql > reponses/reponses.txt
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done

while [  $COUNTER -lt 5010 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    curl -G -H "Accept: application/x-adm" -v -d 'mode=asynchronous' --data-urlencode 'aql=use dataverse channels;
    subscribe to EmergencyChannel ("t'"$COUNTER"'u'"$SUBCOUNTER"'") on brokerA;
    ' http://localhost:19002/aql > reponses/reponses.txt
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done
