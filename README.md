## Run migration

Windows:
```
docker run --rm -v $PWD\migrations:/migrations --network host migrate/migrate -path=/migrations -database postgres://postgres:postgres@0.0.0.0:5432/medical?sslmode=disable up
```

Linux:
```
docker run --rm -v $PWD/migrations:/migrations --network host migrate/migrate -path=/migrations -database postgres://postgres:postgres@0.0.0.0:5432/medical?sslmode=disable up
```