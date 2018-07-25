#!/bin/bash

###################
# INFO
###################
# Uncomment the following line for debugging
set -x
# xbindkeys - config located in ~/.xbindkeysrc
# autostart - config located in ~/.config/autostart/gxp-kiosk.desktop
# pkill     - terminates running instances of Chromium

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

function kill_chromium () {
  pkill chromium-browse
}


###################
# EXECUTE
###################
random_site
kill_chromium
load_site
