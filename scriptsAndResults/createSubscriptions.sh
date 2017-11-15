#! /bin/sh

rm subscriptions.adm

COUNTER=4
while [  $COUNTER -lt 5 ]; do
  SUBCOUNTER=0
  while [ $SUBCOUNTER -lt 100 ]; do
    SUBSUBCOUNTER=0
    while [ $SUBSUBCOUNTER -lt 10 ]; do
      SUBSUBSUBCOUNTER=0
      while [ $SUBSUBSUBCOUNTER -lt 10 ]; do
        echo '{"DataverseName" : "steven" , "BrokerName" : "brokerA", "param0" : "p'"$COUNTER"''"$SUBSUBCOUNTER"''"$SUBSUBSUBCOUNTER"'u'"$SUBCOUNTER"'" }' >> subscriptions.adm
        let SUBSUBSUBCOUNTER=SUBSUBSUBCOUNTER+1 
      done
      let SUBSUBCOUNTER=SUBSUBCOUNTER+1 
    done
    let SUBCOUNTER=SUBCOUNTER+1 
  done
  let COUNTER=COUNTER+1 
done

#while [  $COUNTER -lt 1670 ]; do
#  SUBCOUNTER=0
#  while [ $SUBCOUNTER -lt 100 ]; do
#    echo '{"DataverseName" : "steven" , "BrokerName" : "brokerA", "param0" : "c'"$COUNTER"'u'"$SUBCOUNTER"'" }' >> subscriptions.adm
#    let SUBCOUNTER=SUBCOUNTER+1 
#  done
#  let COUNTER=COUNTER+1 
#done#

#while [  $COUNTER -lt 2505 ]; do
#  SUBCOUNTER=0
#  while [ $SUBCOUNTER -lt 100 ]; do
#    echo '{"DataverseName" : "steven" , "BrokerName" : "brokerA", "param0" : "w'"$COUNTER"'u'"$SUBCOUNTER"'" }' >> subscriptions.adm
#    let SUBCOUNTER=SUBCOUNTER+1 
#  done
#  let COUNTER=COUNTER+1 
#done#

#while [  $COUNTER -lt 5010 ]; do
#  SUBCOUNTER=0
#  while [ $SUBCOUNTER -lt 100 ]; do
#    echo '{"DataverseName" : "steven" , "BrokerName" : "brokerA", "param0" : "t'"$COUNTER"'u'"$SUBCOUNTER"'" }' >> subscriptions.adm
#    let SUBCOUNTER=SUBCOUNTER+1 
#  done
#  let COUNTER=COUNTER+1 
#done
