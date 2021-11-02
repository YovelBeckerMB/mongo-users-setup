# Intro

This repo gives an example to how a mongoDB container will deploy using docker-compose with a script to run that will set the mongoDB instance's Admin user and also a DB with a user to the DB.

### Required Environment Variables

* DB_ADMIN_USERNAME
* DB_ADMIN_PASS
* DB_USERNAME
* DB_PASS
* DB_NAME

## Instructions

Set up your environment variables in the docker-compose.yml file

```yml
    environment:
      DB_ADMIN_USERNAME: 'myAdminUsername' 
      DB_ADMIN_PASS: 'myAdminPass'
      DB_USERNAME: 'myDbUsername'
      DB_PASS: 'myDbPass'
      DB_NAME: 'myDbName'
```

Run the container
```sh
docker compose up --build mongo
```

Run the following command to execute the init-db-users.sh script inside the container.

```sh
docker exec -it mongo-user-setup /bin/bash /db-config/init-db-users.sh
```

At this point you will be able to connect to the mongoDB intance inside the container but only a user that identifies with the correct username and password will be able to connect to the db with the name you put in the environment variables.