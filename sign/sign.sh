#!/bin/bash

env="APP"
ver=$(grep -o 'version="[0-9.]*"' config.xml | grep -o '[0-9.]*')
verCon=$(grep -o 'android-versionCode="[^"]*"' config.xml | grep -o '[0-9]*')
date=$(date +%m%d%Y)
pass=${1}
apkName="AZ-Journey_${env^^}_v${ver}_${date}_VC${verCon}_RELEASE.apk"

signerDir="home/runner/work/ionic-fcm-implem"
var2=${2}

echo "signerDir: ${signerDir}";
echo "Ver: ${ver}";
echo "verCon: ${verCon}";
echo "date: ${date}";
echo "pass: ${pass}";
echo "apkName: ${apkName}";
echo "var2: ${var2}";

ls;

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore sign/ionicdemo.jks -storepass "$pass" -keypass "$pass" ${signerDir}/platforms/android/app/build/outputs/apk/app-release-unsigned.apk ionicdemo
/usr/local/lib/android/sdk/build-tools/27.0.3/zipalign -v -p -f 4 ${signerDir}/platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk ${signerDir}/platforms/android/app/build/outputs/apk/${apkName}
