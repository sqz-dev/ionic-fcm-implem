#!/bin/bash

# file_path="./package.json";
# sed -i 's/"android"//gi' ${file_path};
# sed -i 's/"cordova-plugin-agilaplugin": {},//gi' ${file_path};
# # sed -i 's/"cordova-plugin-agilaplugin": {}//gi' ${file_path};
# # sed -i 's/"cordova-plugin-local-notification": {},/"cordova-plugin-local-notification": {}/gi' ${file_path};

rm -rf ./.sourcemaps ./node_modules ./platforms ./plugins ./www ./package-lock.json;
npm cache clean --force;
npm i --prefer-online;
ionic cordova platform add android@8 --no-resources;
ionic cordova plugin add ./AgilaPlugin;
cp ./google-services.json ./platforms/android/app;
ionic cordova build android --configuration=buildDccUat;
