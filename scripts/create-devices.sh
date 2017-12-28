# Nexus 6P, API 27, XXXHDPI
echo no | avdmanager --verbose create avd --force \
                                --name "Nexus6P" \
                                --package "system-images;android-27;google_apis_playstore;x86" \
                                --abi "google_apis_playstore/x86" \
                                --sdcard 200M \
                                --device 11

# Nexus 10, API 23, XHDPI
echo no | avdmanager --verbose create avd --force \
                                --name "Nexus10" \
                                --package "system-images;android-23;google_apis;x86_64" \
                                --abi "google_apis/x86_64" \
                                --sdcard 200M \
                                --device 6

# Android TV (1080p), API 27, XHDPI 
echo no | avdmanager --verbose create avd --force \
                                --name "GenericAndroidTV1080p" \
                                --package "system-images;android-27;android-tv;x86" \
                                --abi "android-tv/x86" \
                                --sdcard 200M \
                                --device 0 