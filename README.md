# Android Development Bridge & APK Tool for Mac

A unix shell script to check if `adb` has been added to PATH, then lets you install any `.apk` to your device in the downloads folder.

#### This assumes
- Your device is on & connected in developer mode.
- Android Studio is Installed, or Platform-Tools in its installation location of `/Users/$USERNAME/Library/Android/sdk/platform-tools`
- APKs are saved in your User `Downloads` folder.

## Usage

#### First time run
- after downloading script run `chmod +x ~/Downloads`

#### To Run

1. Download `InstallAPK.sh` to your downloads folder.
2. Open Terminal.
3. Drag `InstallAPK.sh` from your Downloads folder to your terminal window.
4. Select the terminal window and press enter.
5. Script will search for APKs, and follow instructions to install.
