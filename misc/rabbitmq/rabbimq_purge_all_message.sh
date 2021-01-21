#!/bin/bash
# Only works on localhost machine, where we have access to rabbitmqctl and got rights to erlang coockie. 
set -e 

list_vhosts=`rabbitmqctl list_vhosts --quiet --no-table-headers`

for vh in $list_vhosts;
do
    echo $vh
    list_queues=`rabbitmqctl list_queues --vhost=$vh --no-table-headers --quiet name`
    for q in $list_queues;
    do
        echo $q
        rabbitmqctl purge_queue $q --vhost=$vh
    done
done
