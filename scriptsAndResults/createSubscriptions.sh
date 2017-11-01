#! /bin/sh

rm subscriptions.adm

COUNTER=0
while [  $COUNTER -lt 835 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    echo '{"DataverseName" : "steven" , "BrokerName" : "brokerA", "param0" : "p'"$COUNTER"'u'"$SUBCOUNTER"'" }' >> subscriptions.adm
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done
while [  $COUNTER -lt 1670 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    echo '{"DataverseName" : "steven" , "BrokerName" : "brokerA", "param0" : "c'"$COUNTER"'u'"$SUBCOUNTER"'" }' >> subscriptions.adm
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done

while [  $COUNTER -lt 2505 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    echo '{"DataverseName" : "steven" , "BrokerName" : "brokerA", "param0" : "w'"$COUNTER"'u'"$SUBCOUNTER"'" }' >> subscriptions.adm
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done

while [  $COUNTER -lt 5010 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    echo '{"DataverseName" : "steven" , "BrokerName" : "brokerA", "param0" : "t'"$COUNTER"'u'"$SUBCOUNTER"'" }' >> subscriptions.adm
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done