# Gaming Experience Platform (GXP)

Codebase for the barcade to make it useful at the WP Engine Summit.

The goal here is to have the Raspberry Pi boot up into a browser window, in kiosk mode, to website (from a specified list of sites), and load an Asteroids game on top of that website. The player can use the joystick and fire button to play asteroids on top of the website, destroying elements on the page.

The person turning the cabinet on should not have to do anything except ensure the barcade has an active internet connection (wifi or ethernet).

## Bootup script
Raspbian looks for files named `*.desktop` inside `~/.config/autostart/`, and it will load those files during bootup.

This repo contains a file `gxp-startup.desktop`, which I symlinked to from within the autostart directory.

You should not need to edit `gxp-startup.desktop`. However, you may modify the shell script that it calls, `startup.sh`.

## OS-level keyboard shortcuts
Using `xbindkeys` for keyboard shortcuts. This lets the user press a button that triggers a shell script; in this case, that script loads another website from the list.

To edit keybindings, modify the config file:

```shell
vim ~/.xbindkeysrc
```

...then restart the program:

```shell
killall xbindkeys && xbindkeys
```

## Arcade button mappings
Using [QJoyPad](http://qjoypad.sourceforge.net/) to take input from a gamepad or joystick and translate it into key strokes or mouse actions. It has a GUI that lets you click a button on the joystick then click a button on the keyboard to assign it to. This program automatically runs during bootup via the `startup.sh` script in this repo.

## Autoload Asteroids
Using a Chromium extension called [Control Freak](https://chrome.google.com/webstore/detail/control-freak/jgnchehlaggacipokckdlbdemfeohdhc?hl=en) to load the Asteroids JavaScript on every page load.
