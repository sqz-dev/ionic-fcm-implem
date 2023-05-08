#!/bin/bash

# echo "Enter Build Environment:"
# read env

signer_dir=$(pwd)

# change this to where your source code is. Note: if your code is in drive C, it should start with /c/ and not C:\
src_dir="/j/dev/ionic-fcm-implem"
build_dir="${src_dir}/platforms/android/app/build/outputs/apk/release"

cp ${build_dir}/app-release-unsigned.apk ${signer_dir}

env="APP"
ver=$(grep -o 'version="[0-9.]*"' ${src_dir}/config.xml | grep -o '[0-9.]*')
verCon=$(grep -o 'android-versionCode="[^"]*"' ${src_dir}/config.xml | grep -o '[0-9]*')
date=$(date +%m%d%Y)
pass="Nooneknowsthis1"
apk_name="AZ-Journey_${env^^}_v${ver}_${date}_VC${verCon}_RELEASE.apk"

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ionicdemo.jks -storepass "$pass" -keypass "$pass" app-release-unsigned.apk ionicdemo
zipalign -v -p -f 4 app-release-unsigned.apk ${apk_name}

start ${signer_dir}
