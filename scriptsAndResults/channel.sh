#! /bin/sh

python makeSubscriptionFile.py $1 $2
scp subscriptions$1broker$2.adm promethium:three/subscriptions/.
./startChannel.sh $1 $2