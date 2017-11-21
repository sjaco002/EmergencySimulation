#! /bin/sh
rm responses/responses.txt

#835 and 100 would capture all users for p
COUNTER=420
while [  $COUNTER -lt 421 ]; do
	SUBCOUNTER=0
	while [ $SUBCOUNTER -lt 100 ]; do
		curl --silent -G -H "Accept: application/x-adm" -v -d 'mode=synchronous' --data-urlencode 'aql=use steven;
          SELECT m.r AS report, m.l.userName
          FROM 
          (select * from 
          (select value r from EmergencyReports r where r.insert_time > current_datetime() - day_time_duration("PT10S")) r,
          UserLocations l where spatial_intersect(r.location,l.location)) m
          where m.l.userName = "p'"$COUNTER"'u'"$SUBCOUNTER"'";
		' http://promethium.ics.uci.edu:19002/sqlpp >> responses/responses.txt &
		let SUBCOUNTER=SUBCOUNTER+1 
	done
	let COUNTER=COUNTER+1 
done


