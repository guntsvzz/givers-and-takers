# Givers and Takers : platform

by Todsavad

## Pre-requisites

- Docker


## Database

To start the database server, go to the directory db,

`cd db`

Run the docker-compose file using command:

`docker compose up -d`

The database server will run on http://localhost:5432


## Running Rails app

Go the rails app directory

`cd students`

For first time usage, build the app image using command

`docker compose build`

Run the app using command

`docker compose up -d`

The app will run on http://localhost:3000

### Accessing the container

To use rails command to generate new models and views, or migrating the command first access into container

`docker exec -it students-app bash`

To generate new models and views run the command

`./bin/rails generate scaffold course name:string credits:integer`

To run a migration and create tables or update database tables

`bundle exec rake db:migrate`

To exit the container, simply run the command

`exit`

## Stopping the containers
To stop all the containers, run the command on the folder where docker-compose files are located

`docker compose down --remove-orphans`

