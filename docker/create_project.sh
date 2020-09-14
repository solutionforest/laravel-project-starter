#!/bin/bash

if [ -z "$1" ]; then
    echo "Please specify your project name (without space)"
    echo "$0 [project name]"
    exit 1
fi

if [ -z "$2" ]; then
    echo "Please specify your project name (without space)"
    echo "$0 [$1] [port]"
    exit 1
fi
echo "Create Project [ $1 ] now"

echo "Clean up files"
rm -rf ../db
rm docker-compose.yml
rm run.sh
rm build-image.sh
cp docker-compose-sample.yml docker-compose.yml

echo "Generate APP_KEY for Laravel"
NEW_UUID=$(openssl rand -base64 32 | tr -d '/')
while [ ${#NEW_UUID} != 44 ] 
do
	NEW_UUID=$(openssl rand -base64 32  | tr -d '/')
done

echo ${NEW_UUID}

echo "Create a new docker-compose file"
sed "s/__APP__KEY__/${NEW_UUID}/g" docker-compose-sample.yml > temp.yml
sed "s/__NAME__/$1/g" temp.yml > temp2.yml
sed "s/__PORT__/$2/g" temp2.yml > docker-compose.yml
sed "s/__NAME__/$1/g" build-sample > build-image.sh

echo "Update docker-compose-sample file"
rm docker-compose-sample.yml
cp docker-compose.yml docker-compose-sample.yml


echo "docker exec -it $1-web \$@" > run.sh

echo "change permission"
chmod 755 run.sh
chmod 755 build-image.sh

echo "Clean up"
rm temp.yml temp2.yml
rm -rf ../.git
cd ../../ && mv laravel-project-starter $1

echo "Finish!!! Run the docker-compose and change your Laravel code in /web/src/"