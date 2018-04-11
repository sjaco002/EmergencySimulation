#! /bin/sh

curl -H "Accept: application/x-adm" -v --data-urlencode 'statement=use steven;


SET `compiler.parallelism` "12";

create function RecentEmergenciesNearUser(userName) {  
  (
	select report, shelters from
	 ( select value r from Reports r where r.timeStamp > 
	 current_datetime() - day_time_duration("PT10S"))report,
	UserLocations u
    let shelters = (select s.location from Shelters s where spatial_intersect(s.location,u.location))
	where u.userName = userName
	and spatial_intersect(report.location,u.location)
  )
};

create repetitive channel EmergencyChannel using RecentEmergenciesNearUser@1 period duration("PT10S");

create broker brokerA at "http://polonium.ics.uci.edu:19004";
//create broker brokerA at "asssf";
create broker brokerB at "http://polonium.ics.uci.edu:19007";
create broker brokerC at "http://polonium.ics.uci.edu:19007";
' http://promethium.ics.uci.edu:19002/query/service > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/responses/responses.txt



curl -H "Accept: application/x-adm" -v --data-urlencode "statement=use steven;
LOAD DATASET EmergencyChannelSubscriptions USING localfs
 (('path'='promethium.ics.uci.edu:///home/asterix/three/subscriptions/subscriptions"$1"broker"$2".adm'),('format'='adm'));
" http://promethium.ics.uci.edu:19002/query/service > /Users/stevenjacobs/asterix/data_generator/scriptsAndResults/responses/responses.txt