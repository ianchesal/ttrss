#!/bin/sh
set -x
apt-get update
apt-get install -y apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
sudo apt-get update
sudo apt-get install -y docker-ce

# See: https://hub.docker.com/_/postgres/
docker run -d \
	--name ttrssdb \
	--mount source=pgsql-data,target=/var/lib/postgresql/data \
	-e POSTGRES_PASSWORD=ttrss \
	-e POSTGRES_USER=ttrss \
	-e POSTGRES_DB=ttrss \
	postgres:latest
docker inspect ttrssdb
# See: https://docs.docker.com/storage/volumes/#create-and-manage-volumes
docker volume inspect pgsql-data

# See: https://github.com/clue/docker-ttrss
docker run -d \
	--link ttrssdb:db \
	-p 80:80 \
	-e DB_NAME=ttrss \
	-e DB_USER=ttrss \
	-e DB_PASS=ttrss \
	clue/ttrss
docker inspect clue/ttrss
