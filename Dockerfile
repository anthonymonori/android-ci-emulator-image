FROM anthonymonori/android-fastlane-image:latest

LABEL maintainer="anthonymonori@gmail.com"

# Expose ADB, ADB control and VNC ports
EXPOSE 22
EXPOSE 5037
EXPOSE 5554
EXPOSE 5555
EXPOSE 5900
EXPOSE 443
EXPOSE 80

# Install additional system dependencies
COPY dependencies.txt /var/temp/dependencies.txt
RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install -y --allow-change-held-packages $(cat /var/temp/dependencies.txt)

# Copy various scripts over
COPY scripts /opt/scripts
RUN chmod 755 /opt/scripts/android-accept-licenses.sh
RUN chmod 755 /opt/scripts/android-wait-for-emulator.sh
RUN chmod 755 /opt/scripts/create-devices.sh

# Copy list of Android SDK packages to be installed
COPY android-packages.txt /var/temp/android-packages.txt

# Install SDK packages
# RUN sdkmanager --package_file="/var/temp/android-packages.txt" --channel=0 --sdk_root="$ANDROID_HOME" --verbose
RUN sdkmanager --channel=0 --sdk_root="$ANDROID_HOME" --verbose \
            "platforms;android-23" \
            "system-images;android-23;google_apis;x86_64" 

# Cleaning
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# GO to workspace
RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace