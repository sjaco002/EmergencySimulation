#! /bin/sh
curl --silent -G -H "Accept: application/x-adm" -v -d 'mode=synchronous' --data-urlencode 'aql=use steven;
          select value r from EmergencyReports r where r.insert_time > current_datetime() - day_time_duration("PT10S")
          and spatial_intersect(r.location,circle("'"$1"'"));
		' http://promethium.ics.uci.edu:19002/sqlpp >> responses/results/"$2".txt &


