#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Reset Launchpad
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🚀
# @raycast.needsConfirmation true

# Documentation:
# @raycast.description Reset the layout of Launchpad
# @raycast.author Robert
# @raycast.authorURL https://github.com/SeparateRecords

defaults write com.apple.dock ResetLaunchPad -bool true
killall Dock
echo Launchpad layout has been reset
