Use below docker command to create mysql docker container:
##########################################################
docker run \
    --name=mydjq \                         * Name of the container
    -e=MYSQL_ROOT_PASSWORD=root \          * root user's password
    -d -p=9010:3306 \                      * port mapping HOST->CONTAINER
    --net=mydjn \                          * docker network (name-spaced network)
    mysql:latest                           * mysql image with tag
Important points:
    1. Donot use: -e=MYSQL_TCP_PORT=3306
    2. Always run the server in: 3306 default port number
    3. Otherwise you cannot connect the server using phpmyadmin

Now access the mysql server using:
##################################
docker exec -it mydjq mysql -uroot -proot
---> docker exec -it <container id> <command to run inside container machine>

After entered into container, you can try:
##########################################
docker exec -it /bin/bash
mysql -uroot -proot -h127.0.0.1 -P9010
---> -P9010 is only mandatory, if you started server using -e=MYSQL_TCP_PORT=3306

