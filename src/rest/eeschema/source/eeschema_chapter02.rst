Generic Eeschema commands
-------------------------

Access to Eeschema commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can reach the various commands by:

*   Clicking on the menu bar (top of screen).

*   Clicking on the icons on top of the screen (general commands).

*   Clicking on the icons on the right side of the screen (particular
    commands or “tools”).

*   Clicking on the icons on the left side of the screen (display options).

*   Clicking on the mouse buttons (important complementary commands). In
    particular a right click opens a contextual menu that depends on the
    element under the cursor (Zoom, grid and edition of the elements).

*   Function keys of the keyboard (F1, F2, F3, F4, Insert and space keys).
    Specifically:
    The “Escape” key often allows the canceling of a command in progress.
    The “Insert” key allows the duplication of the last element created.



Here are the various possible accesses to the commands.

|1000000000000351000002C84658BB4A_png|


Mouse Commands
~~~~~~~~~~~~~~

Basic commands
^^^^^^^^^^^^^^

**Left button**

*   Single click: displays the characteristics of the component or text
    under the cursor.

*   Double click: edit (if the element is editable) the component or text.


**Right button**

*   Opens a pop-up menu.


Operations on blocks
^^^^^^^^^^^^^^^^^^^^

You can move, drag, copy and delete selected areas in all Eeschema menus.

Areas are selected with the left mouse button. The command is completed
with the release of the button.

By holding one of the keys “Shift”, “Ctrl”, or the 2 keys “Shift and
Ctrl”, during selection this results in the copying, dragging or deletion
of the selected area.

Commands summary:

+-------------------------------------+-------------------+
| left mouse button                   | Move selection.   |
+-------------------------------------+-------------------+
| Shift + left mouse button           | Copy selection.   |
+-------------------------------------+-------------------+
| Ctrl + left mouse button            | Drag selection.   |
+-------------------------------------+-------------------+
| Control + Shift + left mouse button | Delete selection. |
+-------------------------------------+-------------------+


The command is executed at button release.

During selection you can:

*   Click again to place back the elements.


*   Click the right button to cancel.


If a move block command has started, an other command block can be
deselected via the pop-up menu (mouse, right button):

|100000000000013C0000023FB98FB463_png|

Hot keys
~~~~~~~~

The hot keys are not case sensitive.

*   The “?” key displays the current hot keys list.

*   The Preference menu manage the hot keys.

+----------------------------------------+-----------------------------------+
| |1000000000000157000002EE737709EE_png| | Here is the default hot key list. |
+----------------------------------------+-----------------------------------+

All hot keys can be redefined by the user via the hotkey editor.

|100000000000017F000001484EF563F9_png|

Selecting grid size
~~~~~~~~~~~~~~~~~~~

In Eeschema, the cursor moves over a grid, which can be displayed or not.
The grid is always displayed in the library management menus.

You can change the grid size via the pop-up menu or via the
Preferences/Options menu. The default grid size is 50 mil (0.050\") or
1,27 millimeters.

One can also work with the average (20 mil) or a finer grid (10 mil).
This is however not recommended for usual work. The average or fine grid
is especially intended to design or handle components with large numbers
of pins like several hundreds pins.

Zoom selection
~~~~~~~~~~~~~~

To change the zoom level:

*   Right click to open the Pop-up menu and select the desired zoom.

*   Or use the function keys:

*   
    *   F1: Zoom in.

    *   F2: Zoom out.

    *   F3: Redraw.

    *   F4: Center around the cursor
        Or simple click on the mouse middle button (without moving the mouse)

*   Window Zoom: Mouse drag, with the middle button.

*   
    *   Mouse weel: Zoom in / Zoom out

    *   SHIFT+Mouse weel: Up/down panning

    *   CTRL+Mouse weel: Left/Right panning



Displaying cursor coordinates
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The display units are in inches or millimeters. However, Eeschema always
works internally with 1/1000 of an inch.

The following information is displayed at the bottom right hand side of
the window:

*   The zoom factor.

*   The absolute position of the cursor.

*   The relative position of the cursor.

*   The relative coordinates (x, y) can be reset with the space bar.

*   The coordinates posted will then relate to this point.


|2000000800002FA6000003D4BCEABC3F_png|

Top menu bar
~~~~~~~~~~~~

The top menu bar allows the opening and saving of schematics, the program
configuration, and it also contains the help menu.

|20000008000013A4000003505EB15D06_png|

Upper toolbar
~~~~~~~~~~~~~

This toolbar gives access to the main functions of EESchema.

|100000000000034B000000221D3CBEF3_png|


+----------------------------------------+-------------------------------------------------------------------------+
| |1000000000000023000000229F43382D_png| | Create a new schematic.                                                 |
+----------------------------------------+-------------------------------------------------------------------------+
| |1000000000000020000000227E0BAB2E_png| | Open a schematic.                                                       |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000002200000022A1E90214_png| | Save complete schematic                                                 |
|                                        |                                                                         |
|                                        | (with the whole hierarchy).                                             |
+----------------------------------------+-------------------------------------------------------------------------+
| |1000000000000022000000221C8530A2_png| | Select the sheet size                                                   |
|                                        | and title block editing.                                                |
+----------------------------------------+-------------------------------------------------------------------------+
| |1000000000000022000000227E318ED2_png| | Open print menu.                                                        |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000002100000025F269D11B_png| | Remove the selected elements during a                                   |
|                                        | move block.                                                             |
+----------------------------------------+-------------------------------------------------------------------------+
| |10000000000000240000002590297EF1_png| | Copy selected elements in the clipboard during a                        |
|                                        | move block.                                                             |
+----------------------------------------+-------------------------------------------------------------------------+
| |10000000000000250000002561F2D858_png| | Copy last selected element or block in the current sheet.               |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000002500000025104A25E5_png| | Undo: Cancel the last change (up to 10 levels).                         |
+----------------------------------------+-------------------------------------------------------------------------+
| |10000000000000230000002547FD4C9E_png| | Redo (up to 10 levels).                                                 |
+----------------------------------------+-------------------------------------------------------------------------+
| |1000000000000024000000255522ABD1_png| | Call the menu of components localization and texts.                     |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000004300000025711F7F13_png| | Zoom in and out, around the center of screen.                           |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000004100000025F21D3B62_png| | Redraw of the screen and optimal Zoom.                                  |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000002200000025C0F59654_png| | Call the navigator window, to display the tree                          |
|                                        | structure of the diagram hierarchy (if it contains                      |
|                                        | sub sheets) and the immediate selection of any sheet                    |
|                                        | of the hierarchy.                                                       |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000002300000025F2BC99A5_png| | Call component editor *Libedit*                                         |
|                                        | (Examination, modification, and editing of library components).         |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000002400000023C03F2AE4_png| | Display libraries (Viewlib).                                            |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000002400000023EA45FB2C_png| | Component annotation.                                                   |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000002700000023737FA05C_png| | ERC (Electrical Rules Check). ERC                                       |
|                                        | automatically checks for electrical connections.                        |
+----------------------------------------+-------------------------------------------------------------------------+
| |10000000000000220000002353233D17_png| | Creation of the netlist (Pcbnew, Spice and other formats).              |
+----------------------------------------+-------------------------------------------------------------------------+
| |1000000000000025000000230D237A08_png| | Generate the BOM (Bill of materials) and/or hierarchical labels.        |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000002200000023D9BC0065_png| | Call CVPCB.                                                             |
+----------------------------------------+-------------------------------------------------------------------------+
| |1000000000000023000000254FA6011B_png| | Call PCBNEW.                                                            |
+----------------------------------------+-------------------------------------------------------------------------+
| |100000000000002400000025B5886D2F_png| | Import a stuff file from Cvpcb (fill the footprint field of components) |
+----------------------------------------+-------------------------------------------------------------------------+


Right toolbar icons
~~~~~~~~~~~~~~~~~~~

+----------------------------------------+----------------------------------------------+
| |100000000000002100000279392B037B_png| | This toolbar gives access to tools for:      |
|                                        |                                              |
|                                        | *   Component placement, wires and buses,    |
|                                        |     junctions, labels,text, etc.             |
|                                        |                                              |
|                                        | *   Navigation in the sheets hierarchy menu. |
|                                        |                                              |
|                                        | *   Creation of hierarchical sub-sheets and  |
|                                        |     connection symbols.                      |
|                                        |                                              |
|                                        | *   Component deletion.                      |
+----------------------------------------+----------------------------------------------+


The detailed use of these tools is described in the chapter “Diagram
Creation/Editing”. An outline of their use is given below.

+----------------------------------------+------------------------------------------------------------------------------+
| |100000000000002100000022D6E2566C_png| | Stop the order or tool in progress.                                          |
+----------------------------------------+------------------------------------------------------------------------------+
| |100000000000002100000020FAA0568F_png| | Navigation in the hierarchy: this tool makes                                 |
|                                        | it possible to open the subsheet of the displayed                            |
|                                        | schematic (click in the symbol of this subsheet),                            |
|                                        | or to go back up in the hierarchy (click in a free                           |
|                                        | area of the subsheet)                                                        |
+----------------------------------------+------------------------------------------------------------------------------+
| |100000000000002100000022A0ADE255_png| | Call the component placement menu.                                           |
+----------------------------------------+------------------------------------------------------------------------------+
| |10000000000000210000001EAC4DD762_png| | "Powers" placement menu.                                                     |
+----------------------------------------+------------------------------------------------------------------------------+
| |100000000000002100000023B8CF86E8_png| | Wire placement.                                                              |
+----------------------------------------+------------------------------------------------------------------------------+
| |100000000000002100000021A223E16E_png| | Bus placement.                                                               |
+----------------------------------------+------------------------------------------------------------------------------+
| |10000000000000210000001FF831ADEC_png| | Wire to bus connections. These elements have                                 |
|                                        | only a decorative role and do not allow                                      |
|                                        | connection; thus they should not be used                                     |
|                                        | for connections between wires.                                               |
+----------------------------------------+------------------------------------------------------------------------------+
| |100000000000002100000021E71263FD_png| | Bus to bus connections. They can only                                        |
|                                        | connect two buses between themselves.                                        |
+----------------------------------------+------------------------------------------------------------------------------+
| |10000000000000210000001E229A5031_png| | “No connection” symbols. These are to be placed on component pins which      |
|                                        | are not to be connected. This is useful in the ERC                           |
|                                        | function to check if pins are intentionally left not connected or are missed.|
+----------------------------------------+------------------------------------------------------------------------------+
| |10000000000000210000001F09B8170C_png| | Local label placement. Two wires may be connected with identical labels      |
|                                        | **in the same sheet**.                                                       |
|                                        | For connections between two different sheets,you have to use global symbols. |
+----------------------------------------+------------------------------------------------------------------------------+
| |10000000000000210000001D13F7B559_png| | Global label placement.                                                      |
|                                        |                                                                              |
|                                        | All global labels are connected (even between different sheets).             |
+----------------------------------------+------------------------------------------------------------------------------+
| |100000000000002100000022740CD855_png| | Junction placement. To connect two crossing wires,                           |
|                                        | or a wire and a pin, when it can be ambiguous. (i.e.                         |
|                                        | if an end of the wire or pin is not connected to                             |
|                                        | one of the ends of the other wire).                                          |
+----------------------------------------+------------------------------------------------------------------------------+
| |1000000000000021000000209B84B124_png| | Hierarchical label placement. This makes it possible                         |
|                                        | to place a connection between a sheet and the root                           |
|                                        | sheet which contains this sheet symbol.                                      |
+----------------------------------------+------------------------------------------------------------------------------+
| |100000000000002100000020F9992133_png| | Hierarchical subsheet symbol placement (resizable rectangle).                |
|                                        | You have to specify the file name to save the data of this                   |
|                                        | “subsheet”.                                                                  |
+----------------------------------------+------------------------------------------------------------------------------+
| |100000000000002100000021C98460F6_png| | Global label importation from subsheet, in order to                          |
|                                        | create a connection on a subsheet symbol. Global                             |
|                                        | labels are supposed to be already placed in this subsheet.                   |
|                                        |                                                                              |
|                                        | For this hierarchy symbol, the created connection points                     |
|                                        | are equivalent to a traditional component pin, and must be wired.            |
+----------------------------------------+------------------------------------------------------------------------------+
| |1000000000000021000000239C3EC480_png| | Global label creation in subsheets to create connection points.              |
|                                        | This function is similar to the previous one which does not                  |
|                                        | require already defined global symbols.                                      |
+----------------------------------------+------------------------------------------------------------------------------+
| |10000000000000210000001F169B0971_png| | Lines for framings... Only decorative, and does not perform a connection.    |
+----------------------------------------+------------------------------------------------------------------------------+
| |10000000000000210000002175501032_png| | Placement of comment text. Only decorative.                                  |
+----------------------------------------+------------------------------------------------------------------------------+
| |100000000000002100000023FCA3AB59_png| | Insert a bitmap image.                                                       |
+----------------------------------------+------------------------------------------------------------------------------+
| |100000000000002100000022FAA5C92D_png| | Delete selected element.                                                     |
|                                        |                                                                              |
|                                        | If several superimposed elements are selected,                               |
|                                        | the priority is given to the smallest (in the                                |
|                                        | decreasing priorities: junction, NoConnect,                                  |
|                                        | wire, bus, text, component). This also applies to                            |
|                                        | hierarchical sheets. Note: the “Undelete”                                    |
|                                        | function of the general toolbar                                              |
|                                        | allows you to cancel last deletions.                                         |
+----------------------------------------+------------------------------------------------------------------------------+


Left toolbar icons
~~~~~~~~~~~~~~~~~~

+----------------------------------------+--------------------------------------------+
| |1000000000000023000000C93464FF5C_png| | This toolbar manages the display options:  |
|                                        |                                            |
|                                        | *   Grid.                                  |
|                                        | *   Units.                                 |
|                                        | *   Cursor.                                |
|                                        | *   Invisible pins.                        |
|                                        | *   Allowed directions of wires and buses. |
+----------------------------------------+--------------------------------------------+


Pop-up menus and quick editing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A right click opens a pop-up menu which content depends on the element
selected, if any. You have immediate access to:

*   Zoom factor.

*   Grid adjustment.

*   And according to the case, editing of the most usually modified
    parameters.


+----------------------------------------+---------------------------+
| |1000000000000134000001411D7B987C_png| | Pop-up                    |
|                                        | without selected element. |
+----------------------------------------+---------------------------+
| |1000000000000198000001DF29593D94_png| | Editing of a label.       |
+----------------------------------------+---------------------------+
| |10000000000001AC000001C185B85332_png| | Editing a component.      |
+----------------------------------------+---------------------------+

