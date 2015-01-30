# Interactive Router #

*Reference Manual*

**Copyright**

This document is Copyright © 2010–2013 by it's contributors as listed
below. You may distribute it and/or modify it under the terms of either
the GNU General Public License
([http://www.gnu.org/licenses/gpl.html](http://www.gnu.org/licenses/gpl.html)), version 3 or later, or the
Creative Commons Attribution License
([http://creativecommons.org/licenses/by/3.0/](http://creativecommons.org/licenses/by/3.0/)), version 3.0 or later.

All trademarks within this guide belong to their legitimate owners.

**Contributors**

Name Surname.

**Feedback**

Please direct any comments or suggestions about this document to the
KiCad mailing list:

[https://launchpad.net/~kicad-developers](https://launchpad.net/~kicad-developers)

**Acknowledgments**

None

**Publication date and software version**

Published on january 27, 2015.

**Note for Mac users**

The KiCad support for the Apple OS X operating system is experimental.

## Introduction ##

The Interactive Router lets you quickly and efficient route your PCBs by
shoving off or walking around items on the PCB that collide with the
trace you are currently drawing.

Following modes are supported:

- **Shove**, attempting to push and shove all items colliding with the
currently routed track.
- **Walk around**, trying to avoid obstacles by hugging/walking around
them.
- **Highlight collisions** which highlights all violating objects with a
nice, shiny green color and shows violating clearance regions.

## Setting up  ##

Before using the Interactive Router, please set up these two things:
- Clearance settings. To set the clearances, open the *Design Rules* dialog and make sure at least the default clearance
value looks sensible.

- Enable OpenGL mode by selecting *View->Switch canvas to OpenGL* menu option or pressing **F11**.

![Screenshot](images/opengl_menu.png)

## Laying out tracks ##

To activate the router tool press the *Interactive Router* button
![Interactive Router Button](images/route_icon.png) or the **X** key. The
cursor will turn into a cross and the tool name, will appear in the
status bar.

To start a track, click on any item (a pad, track or a via) or press the
**X** key again hovering the mouse over that item. The new track will use
the net of the starting item. Clicking or pressing **X** on empty PCB
space starts a track with no net assigned.

Move the mouse to define shape of the track. The router will try to
follow mouse trail, hugging unmovable obstacles (such as pads) and
shoving colliding traces/vias, depending on the mode. Retreating mouse
cursor will cause the shoved items to spring back to their former
locations.

Clicking on a pad/track/via in the same net finishes routing. Clicking in
empty space fixes the segments routed so far and continues routing the
trace.

In order to stop routing and undo all changes (shoved items, etc.),
simply press **Esc**.

Pressing **V** or selecting *Place Through Via* from the context menu
while routing a track attaches a via at the end of the trace being
routed. Pressing **V** again disables via placement. Clicking in any spot
establishes the via and continues routing.

Pressing **/** or selecting *Switch Track Posture* from the context menu
toggles the direction of the initial track segment between straight or
diagonal.

**Note**: By default, the router snaps to centers/axes of the items.
Snapping can be disabled by holding **Shift** while routing or selecting
items.

## Setting track widths and via sizes ##

There are several ways to pre-select a track width/via size or to change it during routing:
- Use standard Kicad shortcuts.
- Press **W** or select *Custom Track Width* from the context menu to type in a custom width/via size.
- Pick a predefined width from the *Select Track Width* sub-menu of the context menu.
- Select *Use the starting track width* in the *Select Track Width* menu to pick the width from the start item (or the traces already connected to it).

## Dragging ##

The router can drag track segments, corners and vias. To drag an item,
click on it with **Ctrl** key pressed, hover the mouse and press **G** or
select *Drag Track/Via* from the context menu. Finish dragging by
clicking again or abort by pressing *Esc*.

## Options ##

The router behavior be configured by pressing *E* or selecting *Routing
Options* from the context menu. It opens a window like the one below:

![Screenshot](images/router_options.png)

The options are:

- **Mode** - select how the router handles DRC violation (shoving,
walking around, etc.)

- **Shove vias** - when disabled, vias are treated as un-movable objects
and hugged instead of shoved.

- **Jump over obstacles** - when enabled, the router tries to move
colliding traces behind solid obstacles (e.g. pads) instead of
"reflecting" back the collision

- **Remove redundant tracks** - removes loops while routing (e.g. if the
new track ensures same connectivity as an already existing one, the old
track is removed). Loop removal works locally (only between the start and
end of the currently routed trace).

- **Automatic neckdown** - when enabled, the router tries to break out
pads/vias in a clean way, avoiding acute angles and jagged breakout
traces.

- **Smooth dragged segments** - when enabled, the router attempts to
merge several jagged segments into a single straight one (dragging mode).

- **Allow DRC violations** (*Highlight collisions* mode only) - allows to
establish a track even if is violating the DRC rules.

- **Optimizer effort** - defines how much time the router shall spend
optimizing the routed/shoved traces. More effort means cleaner routing
(but slower), less effort means faster routing but somewhat jagged
traces.
