# Laravel Start Kit
### A simple and easy to create a Laravel Project with docker
###### We are using latest Laravel version 7.xx

---

###### Docker including
* richarvey/nginx-php-fpm:latest
* redis:5.0-alpine
* bitnami/mariadb:latest
* Dockerfile is base on "richarvey/nginx-php-fpm:latest" , optional to build your own image including your code.

---

###### What we do?
* When you create a laravel project, it is quite annoying with the AppKey, database, etc. We simply it in one script, and using Docker.
* 1) create new docker-compose , update all related name
* 2) rename the folder
* 3) remove git ( you should create your own git )

---

To use it, simply:

* git clone this repository
* Run following script ( generate laravel APP_Key , and create docker-compose for you)
* 
```sh

cd laravel-project-starter-7.0

cd docker

./create_project.sh [Your project name] [your port]
```

* then you can start your docker-compose
* ``` docker-compose up -d ```
* It will create a database, Redis, and the web service.
* Install the packages after you get in to the web service container
* ``` composer install```
---

Any problem, please contact alan@solutionforest.net
