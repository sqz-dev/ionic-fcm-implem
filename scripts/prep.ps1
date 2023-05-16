# Remove-Item -Path ".\.sourcemaps", ".\node_modules", ".\platforms", ".\plugins", ".\www", ".\package-lock.json" -Recurse -Force

npm i;
ionic cordova platform add android@8;
# ionic cordova build android;
ionic cordova build android --release --prod;
