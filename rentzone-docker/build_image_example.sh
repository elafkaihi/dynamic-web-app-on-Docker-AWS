#!/bin/bash

# Run the docker build command
docker build \
--build-arg PERSONAL_ACCESS_TOKEN='xxxxxxxxx' \
--build-arg GITHUB_USERNAME='xxxxxxxxx' \
--build-arg REPOSITORY_NAME='xxxxxxxxx' \
--build-arg WEB_FILE_ZIP='xxxxxxxxx' \
--build-arg WEB_FILE_UNZIP='xxxxxxxxx' \
--build-arg DOMAIN_NAME='xxxxxxxxx' \
--build-arg RDS_ENDPOINT='xxxxxxxxx' \
--build-arg RDS_DB_NAME='xxxxxxxxx' \
--build-arg RDS_MASTER_USERNAME='xxxxxxxxx' \
--build-arg RDS_DB_PASSWORD='xxxxxxxxx' \
-t rentzoine . 