**Build scripts for Vulkan-Samples**

This README is simply a quick-start guide on the build script themselves. 
For more information on how to run the script, please refer to the user guide.

How to build:
- **Nevigate to build-Vulkan-Samples by `cd` command:**

  `cd build-Vulkan-Samples`

- Source file script (If you run this script by `./`, environment variable will not update)

  `source build.sh`

To run Vulkan Samples:

- **Install the apk on the device:**

  `adb install app/build/outputs/apk/release/vulkan_samples-release.apk`

- **Push assets and shaders folders**

  ` adb push --sync assets /sdcard/Android/data/com.khronos.vulkan_samples/files/`

  `adb push --sync shaders /sdcard/Android/data/com.khronos.vulkan_samples/files/`
