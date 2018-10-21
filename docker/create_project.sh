#!/bin/bash

if [ -z "$1" ]; then
    echo "Please specify your project name (without space)"
    echo "$0 [project name]"
    exit 1
fi
echo "Create Project [ $1 ] now"

echo "Clean up files"
rm -rf ../db
rm docker-compose.yml
cp docker-compose-sample.yml docker-compose.yml

echo "Generate 32bit APP_KEY for Laravel"
NEW_UUID=$(openssl rand -base64 32 | tr -d '/')
while [ ${#NEW_UUID} != 44 ] 
do
	NEW_UUID=$(openssl rand -base64 32  | tr -d '/')
done

echo ${NEW_UUID}

echo "Create a new docker-compose file"
sed "s/__APP__KEY__/${NEW_UUID}/g" docker-compose-sample.yml > temp.yml
sed "s/__NAME__/$1/g" temp.yml > docker-compose.yml
sed "s/__NAME__/$1/g" build-sample > build-image.sh
echo "docker exec -it $1-web $@" > run.sh

chmod 755 run.sh
chmod 755 build-image.sh

echo "Clean up"
rm temp.yml