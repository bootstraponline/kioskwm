kioskwm - minimalist window manager for kiosks
==============================================

kioskwm is an extremely fast, small, and minimalist window manager for X.
It has been modified from "dwm", with all potential security holes removed.
It no longer can exec other programs for example.

It is not very suitable for end-user use, but is customized for use with
applications running on kiosks, which may still require the use of a window
manager to support placing and moving windows around.


Requirements
------------
In order to build kioskwm you need the Xlib header files.


Installation
------------

Enter the following command to build and install kioskwm (if
necessary as root):

    make clean install


Running kioskwm
-----------
Add the following line to your .xinitrc to start kioskwm using startx:

    exec kioskwm

In order to connect kioskwm to a specific display, make sure that
the DISPLAY environment variable is set correctly, e.g.:

    DISPLAY=foo.bar:1 exec kioskwm

(This will start kioskwm on display :1 of the host foo.bar.)

The window manager will attempt to center new windows on the display.
It has minimal chrome.  The following mouse/keyboard operations exist:

    Mod1-Shift-Mouse1 - Move the window
    Mod1-Shift-Mouse3 - Resize the window

The Mod1 usually refers to either Alt or Command depending on your
environment.  The use of Shift with this avoids conflicts with other
software which may use Mod1 for emulation gestures.


Configuration
-------------
kioskwm has no configuration.
