#! /bin/sh

#create dataverse and datasets
curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=drop dataverse steven if exists;
create dataverse steven;
use dataverse steven;

create type UserLocation as closed {
	recordId: uuid,
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
primary key recordId autogenerated;

create dataset EmergencyShelters(EmergencyShelter)
primary key shelterName;

create dataset EmergencyReports(EmergencyReport)
primary key reportId autogenerated;

create dataset PollingResults(PollingResult)
primary key resultId autogenerated;

create index locTimes on UserLocations(timeStamp);
create index repTimes on EmergencyReports(timeStamp);

create function add_insert_time($record) {
	let $time := {"insert_time": current_datetime()}
    return object_merge($time, $record)
}

' http://promethium.ics.uci.edu:19002/aql > responses/responses.txt


curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse steven;
create feed ReportFeed using socket_adapter
(
    ("sockets"="promethium.ics.uci.edu:10008"),
    ("address-type"="IP"),
    ("type-name"="EmergencyReportFeedType"),
    ("upsert-feed"="true"),
    ("format"="adm")
);
' http://promethium.ics.uci.edu:19002/aql > responses/responses.txt

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse steven;
create feed LocationFeed using socket_adapter
(
    ("sockets"="promethium.ics.uci.edu:10009"),
    ("address-type"="IP"),
    ("type-name"="UserLocationFeedType"),
    ("upsert-feed"="true"),
    ("format"="adm")
);
' http://promethium.ics.uci.edu:19002/aql > responses/responses.txt

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse steven;
connect feed ReportFeed to dataset EmergencyReports apply function add_insert_time;
' http://promethium.ics.uci.edu:19002/aql > responses/responses.txt

curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse steven;
connect feed LocationFeed to dataset UserLocations apply function add_insert_time;
' http://promethium.ics.uci.edu:19002/aql > responses/responses.txt


curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse steven;
start feed LocationFeed;
start feed ReportFeed;
' http://promethium.ics.uci.edu:19002/aql > responses/responses.txt

#while read p; do
#  curl -G -H "Accept: application/x-adm" -v --data-urlencode 'aql=use dataverse steven; insert into dataset EmergencyShelters('"$p"')' http://localhost:19002/aql > reponses/reponses.txt
#  echo "p is"$p
#done <Shelters.adm
