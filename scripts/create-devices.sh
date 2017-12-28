# Nexus 6P, API 23, XXXHDPI
echo no | avdmanager --verbose create avd --force \
                                --name "Nexus6P" \
                                --package "system-images;android-23;google_apis;x86_64" \
                                --abi "google_apis/x86_64" \
                                --sdcard 200M \
                                --device 11

# Nexus 10, API 23, XHDPI
echo no | avdmanager --verbose create avd --force \
                                --name "Nexus10" \
                                --package "system-images;android-23;google_apis;x86_64" \
                                --abi "google_apis/x86_64" \
                                --sdcard 200M \
                                --device 6