#! /bin/sh

#create dataverse and datasets
curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=drop dataverse steven if exists;
create dataverse steven;
use steven;

create type UserLocation as closed {
	location: circle,
	userName: string,
	timeStamp: datetime,
	insert_time: datetime
};


create type UserLocationFeedType if not exists as open{
	location: circle,
	userName: string,
	timeStamp: datetime
};

create type EmergencyReport as closed {
	reportId: uuid,
	Etype: string,
	location: circle,
	timeStamp: datetime,
	insert_time: datetime
};

create type EmergencyReportFeedType as closed {
	Etype: string,
	location: circle,
	timeStamp: datetime
};


create type EmergencyShelter as closed {
	shelterName: string,
	location: circle
};

create type PollingResult as open {
	resultId: uuid
};

create dataset UserLocations(UserLocation)
primary key userName;

create dataset EmergencyShelters(EmergencyShelter)
primary key shelterName;

create dataset EmergencyReports(EmergencyReport)
primary key reportId autogenerated;

create dataset PollingResults(PollingResult)
primary key resultId autogenerated;

create index locTimes on UserLocations(insert_time);
create index locLocations on UserLocations(location) type RTREE;
create index repTimes on EmergencyReports(insert_time);

create function add_insert_time(record) {
    object_merge({"insert_time": current_datetime()}, record)
};

' http://promethium.ics.uci.edu:19002/sqlpp > responses/responses.txt


curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use steven;
create feed ReportFeed using socket_adapter
(
    ("sockets"="promethium.ics.uci.edu:10008"),
    ("address-type"="IP"),
    ("type-name"="EmergencyReportFeedType"),
    ("upsert-feed"="true"),
    ("format"="adm")
);
' http://promethium.ics.uci.edu:19002/sqlpp > responses/responses.txt

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use steven;
create feed LocationFeed using socket_adapter
(
    ("sockets"="promethium.ics.uci.edu:10009"),
    ("address-type"="IP"),
    ("type-name"="UserLocationFeedType"),
    ("upsert-feed"="true"),
    ("format"="adm")
);
' http://promethium.ics.uci.edu:19002/sqlpp > responses/responses.txt

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use steven;
connect feed ReportFeed to dataset EmergencyReports apply function add_insert_time;
' http://promethium.ics.uci.edu:19002/sqlpp > responses/responses.txt

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use steven;
connect feed LocationFeed to dataset UserLocations apply function add_insert_time;
' http://promethium.ics.uci.edu:19002/sqlpp > responses/responses.txt


curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use steven;
start feed LocationFeed;
start feed ReportFeed;
' http://promethium.ics.uci.edu:19002/sqlpp > responses/responses.txt

#while read p; do
#  curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse steven; insert into dataset EmergencyShelters('"$p"')' http://localhost:19002/aql > reponses/reponses.txt
#  echo "p is"$p
#done <Shelters.adm
