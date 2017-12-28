# android-ci-emulator-image

Container set up with build tools in order to run Android connected builds in a Docker setup.

## Contains

- Base: [anthonymonori/android-ci-image](https://hub.docker.com/r/anthonymonori/android-ci-image/)
- [android-packages.txt](./android-packages.txt)
- [dependencies.txt](./dependencies.txt)

## Usage

### Including this in your ci.yml

```Dockerfile
image: anthonymonori/android-ci-emulator-image:latest
```

_Note: Currently supporting Travis CI and GitLab CI._

### Creating a docker container

```Shell
docker login
docker pull anthonymonori/android-ci-emulator-image:latest
docker run -it -d -p <port>:<port-internal> --name <container-name> anthonymonori/android-ci-emulator-image:latest
```

_Note: of course, you need to change `[port]`,`[port-internal]`,`[container-name]` to run the above command lines. You also might want to enable the `[port]` variable on whatever cloud solutions you are running._

### Running androidConnectedTest

In your `.gitlab-ci.yml` file, add the following lines to ensure the virtual devices are started up:

```Shell
before_script:
- /opt/scripts/create-devices.sh
- cd $ANDROID_HOME/tools && emulator -avd [AVD-NAME] -wipe-data -netfast -no-boot-anim -no-audio -no-snapshot -bootchart 120
- /opt/scripts/android-wait-for-emulator.sh
- adb shell input keyevent 82
```

#### Possible device names:

- `Nexus6P`
- `Nexus10`

_For the full list, please see [create-devices.sh](./scripts/create-devices.sh)_

## Build image

```Shell
docker build .
```

## Deploy image

```Shell
docker push anthonymonori/android-ci-emulator-image
```

## Problems

Use the `Issues` tab above.
