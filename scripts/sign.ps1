$envApp = "APP"
$ver = [regex]::Match((Get-Content -Raw config.xml), 'version="([0-9.]*)"').Groups[1].Value
$verCon = [regex]::Match((Get-Content -Raw config.xml), 'android-versionCode="([^"]*)"').Groups[1].Value
$date = Get-Date -Format "MMddyyyy"
$pass = $args[0]
$apkName = "AZ-Journey_${envApp}_v${ver}_${date}_VC${verCon}_RELEASE.apk"

echo $envApp
echo $ver
echo $verCon
echo $date
echo $apkName
echo $PWD

echo "apk_name=${apkName}" >> "$GITHUB_ENV"

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore scripts/ionicdemo.jks -storepass "$pass" -keypass "$pass" platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk ionicdemo;

mkdir release

zipalign -v -p -f 4 platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk release/${apkName}

