Main top menu
-------------


File menu
~~~~~~~~~

Here you can see what the “File” menu looks like.

|10000000000000F30000015D6A0BDDF6_png|


+------------------------------+--------------------------------------------------------------------+
| New                          | Clear current schematic and initialize a new one                   |
+------------------------------+--------------------------------------------------------------------+
| Open                         | Load a schematic hierarchy                                         |
+------------------------------+--------------------------------------------------------------------+
| Open Recent                  | Open a list of recent opened files for loading                     |
+------------------------------+--------------------------------------------------------------------+
| Save Whole Schematic project | Save current sheet and all its hierarchy.                          |
+------------------------------+--------------------------------------------------------------------+
| Save Current Sheet Only      | Save current sheet, but not others in a hierachy.                  |
+------------------------------+--------------------------------------------------------------------+
| Save Current sheet as...     | Save current sheet with a new name.                                |
+------------------------------+--------------------------------------------------------------------+
| Print                        | Access to print menu (See also chap “Print and Plot”).             |
+------------------------------+--------------------------------------------------------------------+
| Plot                         | Plot in Postscript HPGL or SVF format (See chap “Print and Plot”). |
+------------------------------+--------------------------------------------------------------------+
| Quit                         | Quit without saving.                                               |
+------------------------------+--------------------------------------------------------------------+


Preferences menu
~~~~~~~~~~~~~~~~

Preferences
^^^^^^^^^^^

|100000000000017F000001484EF563F9_png|

+------------------+---------------------------------------------+
| Library          | Select libraries and the library's path     |
+------------------+---------------------------------------------+
| Colors           | Select colors.                              |
+------------------+---------------------------------------------+
| Options          | Display options (Units, Grid size.).        |
+------------------+---------------------------------------------+
| Language         | Access to the current list of translations. |
|                  |                                             |
|                  | Use default.                                |
|                  |                                             |
|                  | Mainly for translators and developers       |
+------------------+---------------------------------------------+
| Read             | Read and Save configuration file.           |
| preferences      |                                             |
|                  |                                             |
| Save preferences |                                             |
+------------------+---------------------------------------------+
| Hotkeys          | Access to the hot keys menu                 |
+------------------+---------------------------------------------+

Hot-keys sub menu
^^^^^^^^^^^^^^^^^

+-----------------------+----------------------------------------------------+
| List Current Keys     | Shows the current hotkeys, Same as the hotkey “?”  |
+-----------------------+----------------------------------------------------+
| Edit Hokeys           | Launch the hotkeys editor                          |
+-----------------------+----------------------------------------------------+
| Export Hotkeys Config | Create a hotkeys configure file.                   |
+-----------------------+----------------------------------------------------+
| Import Hotkeys Config | Read a previously exported hotkeys configure file. |
+-----------------------+----------------------------------------------------+


Preferences menu / Libs and Dir
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

|100000000000021400000283EC98FC85_png|

Eeschema configuration is essentially used for:

*   Library's path.

*   Library's list.

The configuration parameters are saved in the .pro file. Different
configuration files in different directories are also possible.

Eeschema seeks and uses by decreasing priorities:

#.  The configuration file (project.pro) in the current directory.

#.  The kicad.pro configuration file in the kicad directory. This file
    can thus be the default configuration.

#.  Default values if no file is found. It will at least then be
    necessary to fill out the list of libraries to load, and then save the
    configuration.


Preferences menu and colors
^^^^^^^^^^^^^^^^^^^^^^^^^^^

|100000000000026200000204DD16B393_png|

Various drawing elements, colur selection and background colur (black or
white only).

Preferences and Options
^^^^^^^^^^^^^^^^^^^^^^^

|10000000000001A1000002084BBFB77A_png|


+---------------------------------------------+---------------------------------------------------------------------+
| Measurement units:                          | Select the display and the cursor                                   |
|                                             | coordinate units (Inches or Millimeters).                           |
+---------------------------------------------+---------------------------------------------------------------------+
| Grid Size:                                  | Grid size selection.                                                |
|                                             |                                                                     |
|                                             | **One must work with normal grid (0,050 inches or 1,27 mm)**.       |
|                                             | *Smaller grids are used for component building*.                    |
+---------------------------------------------+---------------------------------------------------------------------+
| Default line width:                         | Pen size used to draw objects that do not have a specified pen size.|
+---------------------------------------------+---------------------------------------------------------------------+
| Default text size:                          | Value used when creating new texts or labels                        |
+---------------------------------------------+---------------------------------------------------------------------+
| Repeat draw item horizontal displacement    | shift value on X axis during element duplication (usual value 0)    |
|                                             |                                                                     |
|                                             | (after placing an item like a component, label or wire,             |
|                                             |  a duplication is made by the *Inser* key)                          |
+---------------------------------------------+---------------------------------------------------------------------+
| Repeat draw item horizontal displacement    | shift value on Y axis during element duplication                    |
|                                             | (usual value is 0,100 inches or 2,54 mm)                            |
+---------------------------------------------+---------------------------------------------------------------------+
| Repeat label increment:                     | Increment during duplication of texts ending in a                   |
|                                             | number, such as bus members (usual value 1 or -1).                  |
+---------------------------------------------+---------------------------------------------------------------------+
| Show Grid:                                  | If checked: display grid.                                           |
+---------------------------------------------+---------------------------------------------------------------------+
| Show hidden pins:                           | Display invisible (or *hidden*) pins.                               |
|                                             | If checked, allows the display of power pins.                       |
+---------------------------------------------+---------------------------------------------------------------------+
| Enable                                      | When enabled, when the middle mouse button                          |
| middle mouse button                         | is pressed, the entire sheet is moved,                              |
| panning                                     | following the cursor.                                               |
+---------------------------------------------+---------------------------------------------------------------------+
| Middle mouse button                         | When enabled, the middle mouse button cannot move                   |
| panning limited                             | the sheet area “outside” the displayed area.                        |
+---------------------------------------------+---------------------------------------------------------------------+
| Enable automatic panning                    | If checked, automatically shifts the window if the cursor           |
|                                             | leaves the window, during wire drawing, or element moving.          |
+---------------------------------------------+---------------------------------------------------------------------+
| Allow buses and wires to                    | If checked buses and wires can be only vertical or horizontal.      |
| be placed in H or V orientation only        |                                                                     |
|                                             | Else buses and wires can be placed in any direction.                |
+---------------------------------------------+---------------------------------------------------------------------+
| Show page limit                             | If checked, shows the page limits on screen.                        |
+---------------------------------------------+---------------------------------------------------------------------+

Preferences and Language
^^^^^^^^^^^^^^^^^^^^^^^^

Use default mode. Other languages are available mainly for maintenance
purpose.

Help menu
~~~~~~~~~

Access to on-line help (this document) for an extensive tutorial about
KiCad and also for checking the current version of Eeschema (Eeschema
about).

