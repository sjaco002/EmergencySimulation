rm -rf responses/*

curl --silent -G -H "Accept: application/x-adm" -v -d 'mode=synchronous' --data-urlencode 'aql=use steven;
          select * from EmergencyChannelResults where channelExecutionTime > current_datetime()-day_time_duration("PT10S");
    ' http://promethium.ics.uci.edu:19002/sqlpp -w %{time_total} >> responses/responses.txt &