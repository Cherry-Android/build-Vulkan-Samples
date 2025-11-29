#!/bin/bash

export WORKSPACE=`pwd`

cd $WORKSPACE

# Download android-studio tool
wget https://dl.google.com/dl/android/studio/ide-zips/2025.2.1.8/android-studio-2025.2.1.8-linux.tar.gz
tar -xvzf android-studio-2025.2.1.8-linux.tar.gz

# Download commandline tool
wget https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip
unzip commandlinetools-linux-13114758_latest.zip

# Download Android NDK (r27)
wget https://dl.google.com/android/repository/android-ndk-r27d-linux.zip
unzip android-ndk-r27d-linux.zip

cd $WORKSPACE
# Install SDK Build Tools
./cmdline-tools/bin/sdkmanager --sdk_root=${WORKSPACE}/android-studio "build-tools;26.0.1"

# Install SDK Platform Tools
./cmdline-tools/bin/sdkmanager --sdk_root=${WORKSPACE}/android-studio "platforms;android-30"

# Install CMake
./cmdline-tools/bin/sdkmanager --sdk_root=${WORKSPACE}/android-studio "cmake;3.10.2.4988404"

# Lisence
printf 'y\ny\ny\ny\ny\ny\ny' | ./cmdline-tools/bin/sdkmanager --sdk_root=${WORKSPACE}/android-studio --licenses

# Install tool to build
sudo apt-get install cmake g++ xorg-dev libglu1-mesa-dev libwayland-dev libxkbcommon-dev
sudo -S apt-get install g++-aarch64-linux-gnu -y
sudo -S apt-get install gcc-aarch64-linux-gnu -y

# Export JDK tool
#export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/
export JAVA_HOME=${WORKSPACE}/android-studio/jbr
# Export Android SDK
export ANDROID_HOME=${WORKSPACE}/android-studio
# Export Android NDK
export ANDROID_NDK_HOME=${WORKSPACE}/android-ndk-r27d

# Clone Vulkan-Samples source
git clone --recurse-submodules git@github.com:Cherry-Android/Vulkan-Samples.git
pushd ${WORKSPACE}/Vulkan-Samples > /dev/null
# Generate the gradle project
./scripts/generate.py android
popd

# Build the project
pushd ${WORKSPACE}/Vulkan-Samples/build/android_gradle > /dev/null
./gradlew assembleRelease
popd
