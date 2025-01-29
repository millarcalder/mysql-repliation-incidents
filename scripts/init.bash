# Get the source DB ready for replication
mysql -u root -psecret -h db1 -P 3306 -e " \
SET GLOBAL server_id = 11; \
CREATE USER 'replica' IDENTIFIED WITH sha256_password BY 'secret'; \
GRANT REPLICATION SLAVE ON *.* TO 'replica'; \
"

# Initial data
mysql -u root -psecret -h db1 -P 3306 < /scripts/data.sql

# Setup the replica DBs
replication_servers=(2 3)
for replica in ${replication_servers[@]}; do
    mysql -u root -psecret -h db$replica -P 3306 -e " \
    SET GLOBAL server_id = 1$replica; \
    CHANGE REPLICATION SOURCE TO \
        SOURCE_HOST='db1', \
        SOURCE_USER='replica', \
        SOURCE_PASSWORD='secret', \
        SOURCE_AUTO_POSITION = 1; \
    START REPLICA; \
    "
done
