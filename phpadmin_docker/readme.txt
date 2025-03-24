phpmyadmin container can be started using:
===========================================
docker run \
    --name=mydjqadm \
    --network=mydjn \      * n/w id. same with the mysql server container n/w id
    -d \
    --link mydjq:db \      * container_id:db
    -p 8080:80 \           * host_port:container_port for the phpmyadmin
    phpmyadmin             * phpmyadmin image
