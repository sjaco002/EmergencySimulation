#! /bin/sh

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use steven;
create function RecentEmergenciesNearUser(userName) {  
  (
  SELECT r AS report, l.userName
  FROM 
  (select value r from EmergencyReports r where r.insert_time > current_datetime() - day_time_duration("PT10S")) r,
  (select value l from UserLocations l where l.insert_time > current_datetime() - day_time_duration("PT10S")) l
  where l.userName = userName 
  and spatial_intersect(r.location,l.location)
  )
};


create repetitive channel EmergencyChannel using RecentEmergenciesNearUser@1 period duration("PT10S");

create broker brokerA at "asdfrdd";
' http://promethium.ics.uci.edu:19002/sqlpp > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/responses/responses.txt



curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use steven;
LOAD DATASET EmergencyChannelSubscriptions USING localfs
 (("path"="promethium.ics.uci.edu:///home/sjacobs/two/subscriptions.adm"),("format"="adm"));
' http://promethium.ics.uci.edu:19002/sqlpp > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/responses/responses.txt