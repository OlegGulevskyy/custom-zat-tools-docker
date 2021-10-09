#!/bin/sh -l

echo "Deploying to Zendesk..."
FILE=./dist/.zat

PASSWORD="\"password\""
APP_ID="\"app_id\""

npm install
npm run build:package

if  grep -q "$APP_ID" "$FILE" ; then
    echo "App ID detected, running update" ; 
	cd ./dist
    zat clean
    zat update
elif grep -q "$PASSWORD" "$FILE" ; then
    echo "No existing APP ID detected, creating new app." ; 
    zat clean
    zat create
else
    echo "Can't deploy. Please check your .zat file" ; 
fi