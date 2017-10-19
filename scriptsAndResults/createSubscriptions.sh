#! /bin/sh

COUNTER=0
while [  $COUNTER -lt 835 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    curl -G -H "Accept: application/x-adm" -v -d 'mode=asynchronous' --data-urlencode 'aql=use steven;
    subscribe to EmergencyChannel ("p'"$COUNTER"'u'"$SUBCOUNTER"'") on brokerA;
    ' http://promethium.ics.uci.edu:19002/sqlpp > reponses/reponses.txt
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done

while [  $COUNTER -lt 1670 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    curl -G -H "Accept: application/x-adm" -v -d 'mode=asynchronous' --data-urlencode 'aql=use steven;
    subscribe to EmergencyChannel ("c'"$COUNTER"'u'"$SUBCOUNTER"'") on brokerA;
    ' http://promethium.ics.uci.edu:19002/sqlpp > reponses/reponses.txt
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done

while [  $COUNTER -lt 2505 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    curl -G -H "Accept: application/x-adm" -v -d 'mode=asynchronous' --data-urlencode 'aql=use steven;
    subscribe to EmergencyChannel ("w'"$COUNTER"'u'"$SUBCOUNTER"'") on brokerA;
    ' http://promethium.ics.uci.edu:19002/sqlpp > reponses/reponses.txt
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done

while [  $COUNTER -lt 5010 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    curl -G -H "Accept: application/x-adm" -v -d 'mode=asynchronous' --data-urlencode 'aql=use steven;
    subscribe to EmergencyChannel ("t'"$COUNTER"'u'"$SUBCOUNTER"'") on brokerA;
    ' http://promethium.ics.uci.edu:19002/sqlpp > reponses/reponses.txt
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done
