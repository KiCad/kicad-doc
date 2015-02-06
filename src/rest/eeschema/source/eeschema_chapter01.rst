Introduction to Eeschema
------------------------

Description
~~~~~~~~~~~

Eeschema is powerful schematic capture software distributed as part of
KiCad and available under the following operating systems:

*   Linux.

*   Apple OS X (experimental).

*   Windows XP, Windows 2000, Windows 7.

Regardless of the OS, all Eeschema files are 100% compatible from one OS
to another.

Eeschema is an integrated software where all functions of drawing,
control, layout, library management and access to the PCB design software
are carried out within Eeschema itself.

Eeschema allows the use of hierarchical drawings using multi-sheets
diagrams. Eeschema handles:

*   Flat hierarchies.

*   Simple hierarchies.

*   Complex hierarchies.


Eeschema is intended to work with printed circuit software such as
PcbNew, for which it can provide the Netlist file, which describes the
electrical connections of the PCB.

Eeschema also integrates a component editor which allows the creation,
editing, and visualization of components, as well as the handling of the
symbol libraries (Import, export, addition and deletion of library
components).

Eeschema integrates the following additional but essential functions
needed for modern schematic capture software:

*   Design rules check (DRC) for the automatic control of incorrect
    connections and inputs of components left unconnected.

*   Generation of layout files in POSTSCRIPT or HPGL format.

*   Generation of layout files printable via local printer.

*   Bill of Material generation.

*   Netlist generation for PCB layout or for simulation.

Technical overview
~~~~~~~~~~~~~~~~~~

Eeschema is limited only by the available memory. There is thus no real
limitation to the component count, number of component pins, connections,
sheets. Eeschema allows simple or multi-sheet diagrams.

In the case of multi sheets diagrams, the representation is hierarchical,
and the access to each sheet is immediate.

Eeschema can use multi-sheet diagrams of this type:

*   Simple hierarchies (each diagram is used only once).

*   Complex hierarchies (some diagram is used more than once, multiple
    instances).

*   Flat hierarchies (some diagrams not explicitly connected in a master
    diagram).

The maximum size of the drawings is always adjustable from A4 format to
A0 or from A to E format.
