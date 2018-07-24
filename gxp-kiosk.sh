#!/bin/bash

###################
# INFO
###################
# Uncomment the following line for debugging
set -x
# xbindkeys - config located in ~/.xbindkeysrc
# autostart - config located in ~/.config/autostart/gxp-kiosk.desktop

###################
# SITE URLs
###################
declare -a WEBSITES=(
"torquemag.io"
"wpengine.com"
"wpengine-careers.com"
"nintendo.com"
"wordpress.org"
"stackoverflow.com"
)

###################
# FUNCTIONS
###################

# return a random site from the array
###################
function random_site () {
  randomSiteName=${WEBSITES[$RANDOM % ${#WEBSITES[@]} ]}
}

function load_site () {
  chromium-browser --kiosk --incognito $randomSiteName
}

# sniff keyboard input
function listen_keyboard_input () {
  while true; do
    read -rsn1 input
    if [ "$input" = "m" ]; then
      random_site
      load_site
    fi
  done
}

function better_keyboard_listener () {
  while true; do
    sleep 0.2
    read -rsn1 input
    triggerKey=$(xinput --query-state 7 | grep "key\[58]")
    if [$( "$triggerKey" = "down")]; then
      echo "magic key"
    fi
  done
}

###################
# EXECUTE
###################
listen_keyboard_input
#better_keyboard_listener
