#!/bin/bash

function launch_qjoypad () {
  qjoypad "GXP"
}

function launch_game () {
  /bin/bash /home/pi/gxp/cycle-website.sh
}

function move_mouse () {
  xdotool mousemove 500 500
}

launch_qjoypad &
move_mouse &
launch_game &
wait
