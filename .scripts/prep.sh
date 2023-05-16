#!/bin/bash

npm i
ionic cordova platform add android@8
# ionic cordova build android
ionic cordova build android --release --prod
