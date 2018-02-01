#! /bin/sh

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use steven;
create function RecentEmergenciesNearUser(userName) {  
  (
	select  report, shelters from
	 ( select value r from Reports r where r.timeStamp > 
	 current_datetime() - day_time_duration("PT10S"))report,
	UserLocations u
    let shelters = (select s.location from Shelters s where spatial_intersect(s.location,u.location))
	where u.userName = userName
	and spatial_intersect(report.location,u.location)
  )
};


create repetitive channel EmergencyChannel using RecentEmergenciesNearUser@1 period duration("PT10S");

create broker brokerA at "asdfrdd";
' http://promethium.ics.uci.edu:19002/sqlpp > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/responses/responses.txt



curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use steven;
LOAD DATASET EmergencyChannelSubscriptions USING localfs
 (("path"="promethium.ics.uci.edu:///home/sjacobs/two/subscriptions1000.adm"),("format"="adm"));
' http://promethium.ics.uci.edu:19002/sqlpp > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/responses/responses.txt