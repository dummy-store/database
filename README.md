## Getting started
Clone this repository and then:"
1. Run `config.sh`
2. Login in _pgadmin_ (http://127.0.0.1:16543) using the credentials defined at [docker-compose.yaml](./docker-compose.yaml)
3. Start a new server (tip: fill the host field with `postgres`)

## Development
Bring up container:
```
docker-compose up -d
```

Teardown container:
```
docker-compose down
```

Go inside container:
```
docker exec -it dummy-store-database_postgres_1 psql -h localhost -U postgres
```