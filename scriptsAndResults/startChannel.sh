#! /bin/sh

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use channels;
create function RecentEmergenciesNearUser(userName) {  
  (
  with tenSecondsAgo as current_datetime() - day_time_duration("PT10S")
  SELECT r AS report, tenSecondsAgo
  FROM EmergencyReports r, UserLocations l
  where l.userName = userName 
  and l.timeStamp > tenSecondsAgo
  and r.timeStamp > tenSecondsAgo
  and spatial_intersect(r.location,l.location))

}

create repetitive channel EmergencyChannel using RecentEmergenciesNearUser@1 period duration("PT10S");
create broker brokerA at "asdfrdd"
' http://localhost:19002/sqlpp > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/reponses/reponses.txt
