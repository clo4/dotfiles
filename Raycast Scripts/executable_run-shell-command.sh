#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Run shell command
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon images/icon-bash.png
# @raycast.needsConfirmation false

# Documentation:
# @raycast.description Run a command in Bash
# @raycast.author Robert
# @raycast.authorURL https://github.com/SeparateRecords

# @raycast.argument1 { "type": "text", "placeholder": "Command" }
eval "$1"
