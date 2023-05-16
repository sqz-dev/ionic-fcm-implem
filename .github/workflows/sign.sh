#!/bin/bash

envApp="APP"
ver=$(grep -o 'version="[0-9.]*"' config.xml | grep -o '[0-9.]*')
verCon=$(grep -o 'android-versionCode="[^"]*"' config.xml | grep -o '[0-9]*')
date=$(date +%m%d%Y)
pass=${1}
apkName="AZ-Journey_${envApp^^}_v${ver}_${date}_VC${verCon}_RELEASE.apk"

echo "apk_name=${apkName}" >> "$GITHUB_ENV"

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore .github/workflows/ionicdemo.jks -storepass "$pass" -keypass "$pass" platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk ionicdemo;
mkdir release
/usr/local/lib/android/sdk/build-tools/27.0.3/zipalign -v -p -f 4 platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk release/${apkName}
zip -r -j app-release.zip release