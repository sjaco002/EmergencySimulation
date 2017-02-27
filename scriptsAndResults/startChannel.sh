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

create repetitive channel EmergencyChannel using  RecentEmergenciesNearUser@1 period duration("PT10S");
' http://localhost:19002/aql > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/reponses/reponses.txt
