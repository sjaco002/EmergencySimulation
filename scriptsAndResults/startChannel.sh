#! /bin/sh

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use steven;
create function RecentEmergenciesNearUser(userName) {  
  (
  SELECT m.r AS report, m.l.userName
  FROM 
  (select * from 
    (select value r from EmergencyReports r where r.insert_time > current_datetime() - day_time_duration("PT10S")) r,
    UserLocations l where spatial_intersect(r.location,l.location)) m
  where m.l.userName = userName
  )
};


create repetitive channel EmergencyChannel using RecentEmergenciesNearUser@1 period duration("PT10S");

create broker brokerA at "asdfrdd";
' http://promethium.ics.uci.edu:19002/sqlpp > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/responses/responses.txt



curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use steven;
LOAD DATASET EmergencyChannelSubscriptions USING localfs
 (("path"="promethium.ics.uci.edu:///home/sjacobs/two/subscriptions100.adm"),("format"="adm"));
' http://promethium.ics.uci.edu:19002/sqlpp > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/responses/responses.txt