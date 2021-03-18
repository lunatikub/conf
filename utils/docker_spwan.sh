#!/bin/bash

container=$1

[ -z "$container" ] && echo "Need container name..." && exit 1

docker start $container
docker exec -it $container su -l thomas

exit 0
