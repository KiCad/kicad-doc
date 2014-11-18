Schematic Creation and Editing
------------------------------



Introduction
~~~~~~~~~~~~

A schematic can be represented on a single sheet, but, if big enough, it
will require several sheets.

A schematic represented on several sheets is then called hierarchical,
and all its sheets (each one represented by its own file) constitutes a
Eeschema project. A project consists of a main schematic, called the root
schematic, and sub-sheets constituting a hierarchy.

In order to find every file of the project, you will have to follow
drawing rules which will be described hereafter.

In the following, when we talk about project, we will be referring to
both single sheet and hierarchical multi sheets. An additional special
chapter explains the use of the hierarchy and its characteristics.

General considerations
~~~~~~~~~~~~~~~~~~~~~~

A schematic designed with Eeschema is more than a simple graphic
representation of an electronic device. It is normally the entry point of
a development chain which allows for:

*   The control of the electrical rules (ERC) that allows the detection
    of errors or omissions in the schematic.

*   The automatic generation of the bill of material (BOM).

*   The netlist generation for simulation software such as Pspice.

*   The netlist generation for the generation of a printed circuits board
    design using PcbNew. The consistency check between the schematic and the
    printed circuit board is then automatic and instantaneous.



In order to benefit from all these options, you will have to respect
certain constraints and conventions which will also enable you to avoid
nasty surprises.

A schematic mainly consists of components, wires, labels, junctions,
buses and power ports. For clearness in the schematic, you can place
purely graphical elements like bus entries, comments, and dotted lines to
draw frames.

The development chain
~~~~~~~~~~~~~~~~~~~~~

|dev-chain_png|

The schematic software uses component libraries. In addition to the
schematic design file, the netlist file is particularly important because
it is used by the other design software.

A netlist file gives the list of the components and connections resulting from the schematic.

There is (unfortunately for the user) a great number of netlist formats,
some are more popular then others. It is the case of the Spice format for
example.

Component placement and editing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Find and place a component
^^^^^^^^^^^^^^^^^^^^^^^^^^

To load a component in your schematic you can use the icon
|100000000000002100000022A0ADE255_png|. To place a new component, click
at the place you want to draw it. A dialog box allows you to type the
name of the module to load.

|1000000000000179000000BC25F2E37F_png|

The dialog box displays the last two elements loaded.

If you type \*, or if you select the button “list all”, Eeschema will
display the libraries list, and then the available components.

If you type the symbol “=“ followed by key words, EESchema will then
display a list of components according to all the key words.

You can also list a selection. For example if you enter LM2 \*, all the
component's names starting with LM2 will be listed

The selected component will appear on the screen, in placement mode.

Before the component gets placed in the desired position (with a left
click), you can rotate the component by 90 degrees, have a mirror view
according to axis X or Y, or select its representation via the fast edit
pop-up menu. This can also easily be done after placement.

If the desired component does not exist, remember that you can often load
a similar component and modify it : if a 54LS00 is wanted, you can
obviously load a 74LS00 and change the name 74LS00 to 54LS00.

Here is a component during placement:

|10000000000002F300000252E8478EBF_png|


Power ports
^^^^^^^^^^^

A power port symbol is a component (the symbols are grouped in the
“power” library). So you can use the previous command. But as these
placements are frequent, the |10000000000000210000001EAC4DD762_png| tool
is available. This tool is similar to the preceding one, except that the
search is done directly in the “power library”, saving time.

Component Editing and Modification (already placed component)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The editing and modification of a component can be of two types

*   Modification of the component itself (position, orientation, part selection of a multi-part component).



*   Modification of one of the fields (reference, value, or others) of the component.



When a component has just been placed, you may have to modify its value (particularly for resistors, capacitors, etc.), but it is useless to assign to it a reference number right away, or to select the part of a multi-part component (like a 7400).

This can be done automatically by the annotation function.

Component modification
++++++++++++++++++++++

To modify some feature of a component, position the cursor mouse on the component (not to position on a field). One can then:

*   Double-click on the component to open the full editing dialog box.



*   Right-click to open the Pop Up menu, and use one of the displayed commands (Move, Orientation, Edit, Delete).



Text fields modification
++++++++++++++++++++++++

You can modify the reference, value, position, orientation, size and the visibility of the fields. For simple editing:

*   Double-click on the text field to modify it.



*   Right-click and use one of the displayed commands (Move, Rotate, Edit, Delete) in the Pop Up menu.



For a more complete editing option, or in order to create fields, double-click on the component. This will open the “component properties” dialog box.

|100000000000034000000217A12FAF81_png|

You can set the orientation and others options of the component, and edit, add or remove fields.

Each field can be visible or not, and displayed horizontally or vertically. The displayed (and changeable) position is always indicated for a normally displayed component (no rotation or mirror) and relates to the anchoring point of the component.

The option “Reset to Library Defaults” set the component to the orientation 0, and the options, size and position of each field. However, texts fields are not modified because this could break the schematic.

Wires, Buses, Labels, Power ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduction
^^^^^^^^^^^^

All these drawing elements can also be placed with the tools on the vertical right toolbar.

These elements are:

*   **Wires:** typical usual connections.

*   **Buses:** to connect bus labels, for esthetic considerations of the drawing.

*   **Dotted lines:** for graphic presentation.

*   **Junctions:** to force connections between crossing wires or buses.

*   **Bus entries:** of Wire to Bus or Bus to Bus connections. For aesthetic considerations of the drawing.

*   **Labels:** for usual connections.

*   **Global labels:** for connections between sheets.

*   **Texts:** for commenting.

*   **“No Connection” symbols:** to end a pin that does not need any connection.

*   **Hierarchy sheets**, and their connection pins.


Connections (Wires and Labels)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

There are two ways to establish connection:

*   Pin to pin wires.

*   Labels.


The following figure shows the two methods:

|2000000800003B6F00001BCE333A0A82_png|

**Note 1:**

The point of “contact” (or anchoring) of a label is the lower left corner
of the first letter of the label.

This point must thus be in contact with the wire, or be superimposed at
the point of contact of a pin so that this label is taken into account.

**Note 2:**

To establish a connection, a segment of wire must be connected by its
ends to an another segment or to a pin.

If there is overlapping (if a wire passes over a pin, but without being
connected to the pin end) there is no connection. However, a label will
be connected to a wire whatever the position of the anchoring point of
the label on this wire.

**Note 3:**

If a wire must be connected to another wire, otherwise than by their
ends, it will be necessary to place a junction symbol at the crossing
point.

The previous figure (wires connected to DB25FEMALE pins 22, 21, 20, 19)
shows such a case of connection using a junction symbol.

**Note 4:**

If two different labels are placed on the same wire, they are connected
together and become equivalent: all the other elements connected to one
or the other labels are then connected to all of them.

Connections (Buses)
^^^^^^^^^^^^^^^^^^^

Let us consider the following schematic:

|200000080000445200002B6A548B0D21_png|

Many pins (particularly component U1 and BUS1) are connected to buses.

Bus members
+++++++++++

From the schematic point of view, a bus is a collection of signals,
starting with a common prefix, and ending by a number. This concept is
not exactly the one which is used for a microprocessor bus. Each signal
is a member of the bus. PCA0, PCA1, PCA2, are thus members of PCA bus.

The complete bus is named PCA [N. .m], where N and m are the first and
the last wire number of this bus. Thus if PCA has 20 members from 0 to
19, the complete bus is noted PCA [0..19]. But a collection of signals
like PCA0, PCA1, PCA2, WRITE, READ cannot be contained in a bus.

Connections between bus members
+++++++++++++++++++++++++++++++

Pins connected between the same members of a bus must be connected by
labels. Indeed, directly connecting a pin to a bus is a non-sense,
because a bus is a collection of signals, and this connection will be
ignored by Eeschema.

In the example above, connections are made by the labels placed on wires
connected to the pins. Connections via bus entries (wire segments at 45
degrees) to bus wires have only an esthetic value, and are not necessary
on the purely schematic level.

In fact, due to the repetition command (*Insert* key), connections can be
very quickly made in the following way, if component pins are aligned in
increasing order (a common case in practice on components such as
memories, microprocessors...):

*   Place the first label (for example PCA0)

*   Use the repetition command as much as needed to place members.
    EESchema will automatically create the next labels (PCA1, PCA2...)
    vertically aligned, theoretically on the position of the other pins.

*   Draw the wire under the first label. Then use the repetition command
    to place the other wires under the labels.

*   If needed, place the bus entries by the same way (Place the first
    entry, then use the repetition command).


**Note:**

In the Preferences/Options menu, you ca n set the parameters of
repetition:

*   Vertical step.

*   Horizontal step.

*   Label increment (which can thus be incremented by 2, 3. or
    decremented).


Global Connections between buses
++++++++++++++++++++++++++++++++

You may need connections between buses, in order to link two buses having
different names, or in the case of a hierarchy, to create connections
between different sheets. You can make these connections in the following
way.

|20000008000037320000158046776F9F_png|

Buses PCA [0..15], ADR [0..7] and BUS [5..10] are connected together
(note the junction here because the vertical bus wire joins the middle of
the horizontal bus segment).

More precisely, the corresponding members are connected together : PCA0,
ADR0 are connected, (as same as PCA1 and ADR1… PCA7 and ADR7).

Furthermore, PCA5, BUS5 and ADR5 are connected (just as PCA6, BUS6 and
ADR6 like PCA7, BUS7 and ADR7).

PCA8 and BUS8 are also connected (just as PCA9 and BUS9, PCA10 and BUS10)

On the other hand you cannot connect members of different weights in this
way.

If you want to connect members of different weights from different buses,
you will have to do that member by member like two usual labels, placing
them on the same wire.

Power ports connection
^^^^^^^^^^^^^^^^^^^^^^

When the power pins of the components are visible, they must be
connected, as for any other signal.

The difficulty comes from components (such as gates and flip-flops) for
which the power pins are normally invisible (invisible power pins).

The difficulty is double because:

*   You cannot connect wires, because of their invisibility.

*   You do not know their name.


And moreover, it would be a bad idea to make them visible and to connect
them like the other pins, because the schematic would become unreadable
and not in accordance with usual conventions.

Note:

If you want to enforce the display of these invisible power pins, you
must check the option "Show invisible power pins" in the
Preferences/Options dialog box of the main menu, or the icon
|100000000000001500000015ACE0A40B_png| of the left toolbar (options
toolbar)

Eeschema connects automatically the invisible power pins:

All the invisible power pins of the same name are automatically connected
between them without other notice.

However these automatic connections must be supplemented:

- By connections to the other visible pins, connected to this power port.

- Possibly by connections between groups of invisible pins of different
  names (for example, the ground pins are usually called “GND” in TTL
  components and “VSS” in MOS, and they must be connected together).

For these connections, you must use power ports symbols (components
especially designed for this use, that you can create and modify with the
library editor).

These symbols consist of an invisible power pin associated with the
desired drawing.

Don't use labels, which have only a “local” connection ability, and which
would not connect the invisible power pins. (See hierarchy concepts for
more details).

The figure below shows an example of power ports connections.

|20000008000042E000001988C01B06F6_png|

In this example, ground (GND) is connected to power port VSS, and power
port VCC is connected to VDD.

Two PWR_FLAG symbols are visible. They indicate that the two power ports
VCC and GND are really connected to a power source.

Without these two flags, the ERC tool would diagnose:
*Warning: power port not powered*.

All these symbols are components of the schematic library "power".

“No Connection” symbols
^^^^^^^^^^^^^^^^^^^^^^^

These symbols are very useful to avoid undesired warnings in the ERC. The
electric rules check ensures that no connection has been inopportunely
left unconnected.

If pins must really remain unconnected, it is necessary to place a
No-Connection symbol (tool |1000000000000018000000159092E6A1_png|) on
these pins. These symbols however do not have any influence on the
generated netlists.

Drawing Complements
~~~~~~~~~~~~~~~~~~~

Text Comments
^^^^^^^^^^^^^

It can be useful (for a good comprehension of the schematic) to place
indications such as text fields, frames. Text fields (tool
|100000000000001700000017D11B5EC4_png|) and dotted lines (tool
|10000000000000170000001630B9A1C8_png|) are intended for this use,
contrary to labels and wires, which are connection elements.

Here you can find an example of a frame with a textual comment.

|2000000800001EB3000014FC09557A9D_png|

Sheet title block
^^^^^^^^^^^^^^^^^

The title block is edited with the tool
|20000008000002470000022DA00BC8FE_png|.

|10000000000002C100000230033A432A_png|


The complete title block will be as follows.

|1000000000000447000001493681DC5A_png|


The date and the sheet number (Sheet X/Y) are automatically updated:

*   Date: when you modify the schematic.

*   Sheet number (useful in hierarchy): by the annotation function.


