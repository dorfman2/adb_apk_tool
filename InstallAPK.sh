#!/bin/bash
echo
echo Searching Downloads Folder ...
find ~/Downloads -type f -name "*.apk" -exec basename {} ";" >> apkfilename.list

echo
echo 'Please select from the APK list:'
nl apkfilename.list
count="$(wc -l apkfilename.list | cut -f 1 -d' ')"
n=""

echo
read -p 'Select option: ' choice
value="$(sed -n "${choice}p" apkfilename.list)"
read -p "Confirm install of '${value}'? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
echo "The user selected option number $choice: '$value'"

rm apkfilename.list

if adb --version ; then
    adb install /Users/$USER/Downloads/$value
else
    if grep -i "/Library/Android/sdk/platform-tools" ~/.bash_profile ; then
        echo
        echo "ERROR: Path has already been updated, platform-tools are not in the default location of '/Users/(USERNAME)/Library/Android/sdk/platform-tools'."
        echo
        echo "Exiting Installer"
        echo
        exit 1
    fi

    cd
    echo "ERROR: Global PATH missing. Fixing issue."
    echo
    echo "
export PATH=${PATH}:/Users/$USER/Library/Android/sdk/platform-tools" >> ~/.bash_profile
    # echo "Writing PATH TEST"
    echo
    echo "INFO: adb has been added to the Global PATH, please CLOSE & re-open the terminal, THEN run installer again."
    echo
    read -p 'Press Enter to close this window.'
    osascript -e 'tell application "Terminal" to close (every window whose name contains "bash")' &
    exit 0
fi