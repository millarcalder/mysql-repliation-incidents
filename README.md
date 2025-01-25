# MySQL Replication

I wrote this repository for my own educational purposes, it is intended to simulate different incidents with a simple MySQL replica setup.

*This project is using binary log replication*

![mysql cluster](docs/diagrams/mysql_cluster.svg)

## Getting Started

### Dependencies

Required
 - [Docker Engine](https://docs.docker.com/engine/)
 - [Docker Compose](https://docs.docker.com/compose/)

Reccommended
 - [Docker Desktop](https://docs.docker.com/desktop/)
 - [DBeaver](https://dbeaver.io/) or similar database tool

### Running

```bash
# Start all docker compose services
docker compose up

# Open a shell in the dev container and execute the init script from within the dev container
docker exec -it dev /bin/bash
bash /scripts/init.bash
```

## Incidents

 - [Source Database Fails](docs/incidents/source_db_fails.md)
 - [TODO: Replica Database Fails](docs/incidents/replica_db_fails.md)
 - [TODO: Out of Sync Data](docs/incidents/out_of_sync_data.md)
