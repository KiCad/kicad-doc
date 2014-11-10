KiCad
=====

*Reference manual*

**Copyright**

This document is Copyright © 2010–2014 by its contributors as listed
below. You may distribute it and/or modify it under the terms of either
the GNU General Public License (`http://www.gnu.org/licenses/gpl.html
<http://www.gnu.org/licenses/gpl.html>`_), version 3 or later, or the
Creative Commons Attribution License
(`http://creativecommons.org/licenses/by/3.0/
<http://creativecommons.org/licenses/by/3.0/>`_), version 3.0 or later.

All trademarks within this guide belong to their legitimate owners.

**Contributors**

Jean-Pierre Charras, Fabrizio Tappero.

**Feedback**

Please direct any comments or suggestions about this document to the kicad mailing list:
*https://launchpad.net/~kicad-developers*

**Acknowledgments**

None

**Version**

2014, march 17.

**Note for Mac users**

The KiCad support for the Apple OS X operating system is experimental.

.. toctree::
   :maxdepth: 2

Introduction
------------

KiCad
^^^^^

KiCad is an open-source software tool for the creation of electronic
schematic diagrams and PCB artwork. Beneath its singular surface, kicad
incorporates an elegant ensemble of the following stand-alone software
tools:

*   **Kicad**: project manager

*   **Eeschema**: schematic editor

*   **CvPcb**: footprint selector

*   **Pcbnew**: circuit board layout editor

*   **GerbView**: Gerber viewer

3 utilities are included

*   **Bitmap2Component**: component maker for logos (Creates a schematic
    component or a footprint from a bitmap picture).

*   **PcbCalculator**: a calculator that is helpfull to calculate
    components for regulators, track witdth versus current, transmission
    lines...

*   **PlEditor**: Page Layout Editor.

At the time of writing, KiCad is considered mature and can be used for
the successful development and maintenance of complex electronic boards.

Kicad does not present any board-size limitation and it can easily handle
up to 16 copper layers and up to 12 technical layers.

Kicad can create all the files necessary for building printed boards:

*   Gerber files for photo-plotters

*   drilling files

*   component location files

*   and a lot more.


Being open source (GPL licensed), kicad represents the ideal tool for
projects oriented towards the creation of electronic hardware with an
open-source flavour.

Kicad is available for Linux, Windows and Apple OS X (experimental).

Installation and configuration
------------------------------

Display options
^^^^^^^^^^^^^^^

Pcbnew needs the support of OpenGL v2.1 or more.

Initialization of the default configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A default configuration file named *kicad.pro* is supplied in
kicad/template. It serves as a template for any new project.

**The default file kicad.pro can be freely modified if necessary,
mainly to set the list of libraries files loaded by Eeschema or Pcbnew.**

Some other parameters (default text size, default line thickness, mainly
for Pcbnew) are stored.

Verify you have a write acces to kicad/template/kicad.pro

Run kicad and load *kicad.pro* project.

Run Eeschema via kicad. Modify and update the Eeschema configuration, and
mainly the list of libraries you want to use each time you create new
projects.

Run Pcbnew via kicad. Modify and update the Pcbnew configuration

Kicad: principles of use

In order to manage a Kicad project: schematic files, printed circuit
board files, supplementary libraries, manufacturing files for
photo-tracing, drilling and automatic component placement files, it is
recommended to create a project as follows:

*   Create a working directory for the project (using KiCad or by other
    means).

*   In this directory, use Kicad to create a project file (file with    
    extension .pro) via the “Start a new project” icon.

It is strongly recommended to use the same name for both project file and
its directory.

Kicad creates a file with a .pro extension that maintains a number of
parameters for project management (such as the filename of the principal
schematic, list of libraries used in the schematics and PCBs). Default
names of both principal schematic and printed circuit board files are
derived from the name of the project. Thus, if a project called
*example.pro* was created in a directory called
*example*, the default files will be created:


+-------------------+------------------------------------------------------+
| example.pro       | project management file.                             |
|                   |                                                      |
+-------------------+------------------------------------------------------+
| example.sch       | main schematic file.                                 |
|                   |                                                      |
+-------------------+------------------------------------------------------+
| example.          | printed circuit board file.                          |
| kicad_pcb         |                                                      |
|                   |                                                      |
+-------------------+------------------------------------------------------+
| example.net       | netlist file.                                        |
|                   |                                                      |
+-------------------+------------------------------------------------------+
| example.xxx       | various files created by the other utility programs. |
|                   |                                                      |
+-------------------+------------------------------------------------------+
| example.cache.lib | cache file of libraries used in the schematic        |
|                   |                                                      |
|                   | (backup of the components used)                      |
|                   |                                                      |
+-------------------+------------------------------------------------------+

Use Kicad
---------

Main window
^^^^^^^^^^^

|10000000000002B5000001AB64B9B213_png|

The main KiCad window is composed of a project tree view, a launch pane
containing buttons used to run the various software tools, and a message
window. The menu and the toolbar can be used to create, read and save
project files.

Utility launch pane
^^^^^^^^^^^^^^^^^^^

Kicad allows you to run all stand alone software tools that come with it.

The launch pane is made of the above 7 buttons that correspond to the
following commands (from left to right):


|10000000000001EC0000004F07F2B654_png|

+---+---+---+---+---+---+---+
| 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+



+---+----------------------+--------------------------------------------------------------------------------------+
| 1 | **Eeschema**         | The schematic editor                                                                 |
|   |                      |                                                                                      |
+---+----------------------+--------------------------------------------------------------------------------------+
| 2 | **Cvpcb**            | A tool to create the association between components and the corresponding footprints |
|   |                      |                                                                                      |
+---+----------------------+--------------------------------------------------------------------------------------+
| 3 | **Pcbnew**           | The board layout editor                                                              |
|   |                      |                                                                                      |
+---+----------------------+--------------------------------------------------------------------------------------+
| 4 | **Gerbview**         | A GERBER file viewer. Its also can show drill files.                                 |
|   |                      |                                                                                      |
+---+----------------------+--------------------------------------------------------------------------------------+
| 5 | **Bitmap2component** | A tool to build a footprint or a component from a B&W bitmap image to create logos   |
|   |                      |                                                                                      |
+---+----------------------+--------------------------------------------------------------------------------------+
| 6 | **Pcb Calculator**   | A tool to calculate track widths, any many other things                              |
|   |                      |                                                                                      |
+---+----------------------+--------------------------------------------------------------------------------------+
| 7 | **Pl Editor**        | The Page Layout editor, to create/customize frame references.                        |
|   |                      |                                                                                      |
+---+----------------------+--------------------------------------------------------------------------------------+


Project tree view
^^^^^^^^^^^^^^^^^

+----------------------------------------+-----------------------------------------------------------------------+
| |10000000000000C60000009255B0301C_png| | Double-clicking on the Eeschema icons runs the schematic editor which |
|                                        | in this case will open the file pic_programmer.sch.                   |
|                                        |                                                                       |
|                                        |                                                                       |
|                                        | Double-clicking on the Pcbnew icon runs the layout editor, in this    |
|                                        | case opening the file pic_programmer.kicad_pcb                        |
|                                        |                                                                       |
|                                        |                                                                       |
|                                        | Right clicking on any of the files in the project tree allows generic |
|                                        | files manipulation.                                                   |
|                                        |                                                                       |
+----------------------------------------+-----------------------------------------------------------------------+

Top toolbar
^^^^^^^^^^^

|10000000000000E900000027B0999D75_png|

Kicad top toolbar allows for some basic files operation (from left to
right).

+----------------------------------------+-----------------------------------------------------------------------------------------------------------------------+
| |100000000000002C00000027822C5914_png| | Create a project file. If the template kicad.pro is found in kicad/template, it is copied into the working directory. |
|                                        |                                                                                                                       |
+========================================+=======================================================================================================================+
| |100000000000002500000029C403AB20_png| | Create a project from a template.                                                                                     |
|                                        |                                                                                                                       |
+----------------------------------------+-----------------------------------------------------------------------------------------------------------------------+
| |10000000000000230000002995442CF9_png| | Open an existing project.                                                                                             |
|                                        |                                                                                                                       |
+----------------------------------------+-----------------------------------------------------------------------------------------------------------------------+
| |100000000000002700000029A7BBB537_png| | Update and save the current project tree.                                                                             |
|                                        |                                                                                                                       |
+----------------------------------------+-----------------------------------------------------------------------------------------------------------------------+
| |10000000000000260000002421A88B39_png| | Create a zip archive of the whole project. This includes schematic files, libraries, pcb, etc.                        |
|                                        |                                                                                                                       |
+----------------------------------------+-----------------------------------------------------------------------------------------------------------------------+
| |1000000000000024000000248581A3AE_png| | Redraw the tree list, useful after a tree change.                                                                     |
|                                        |                                                                                                                       |
+----------------------------------------+-----------------------------------------------------------------------------------------------------------------------+


Using templates:
----------------

Definitions
^^^^^^^^^^^

A template is a directory of files, which includes a directory of metadata.

The template system name (SYSNAME) is the directory name under which the
template files are stored. The metadata directory (METADIR) contains
pre-defined files which provide information about the template.


All files and directories in a template are copied to the new project
path when a project is created using a template, except METADIR.


All files and directories which start with SYSNAME will have SYSNAME
replaced by the new project file name, excluding the file extension.


Templates:
^^^^^^^^^^

They facilitate the easy setup of projects which have common attributes
such as pre-defined board outlines, connector positions, schematic
elements, design rules, etc.

Metadata
~~~~~~~~

A template's METADIR must contain the required files, and might
optionally contain any of the optional files

Required Files:
~~~~~~~~~~~~~~~

**meta/info.html**

Contains html formatted information about the template which is used by
the user to determine if the template is what they are after. The <title>
tag determines the actual name of the template that is exposed to the
user for template selection.

Using html to format this document means that images can be in-lined
without having to invent a new scheme.

Only a basic HTML language can be used to format this document.


Optional Files:
~~~~~~~~~~~~~~~

**meta/icon.png**

A 64 x 64 pixels PNG icon file which is used as a clickable icon in the
template selection dialog.

Example:
~~~~~~~~

Here is a template for a raspberrypi-gpio board:

|10000000000001BA0000006F670E0EA3_png|

And the meta data info:

|1000000000000163000000735475F846_png|

brd.png is an optional file

Here is an info.html file sample:

..
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <HTML>
  <HEAD>
  <META HTTP-EQUIV="CONTENT-TYPE" CONTENT="text/html; charset=windows-1252">
  <TITLE>Raspberry Pi - Expansion Board</TITLE>
  <META NAME="GENERATOR" CONTENT="LibreOffice 3.6 (Windows)">
  <META NAME="CREATED" CONTENT="0;0">
  <META NAME="CHANGED" CONTENT="20121015;19015295">
  </HEAD>
  <BODY LANG="fr-FR" DIR="LTR">
  <P>This project template is the basis of an expansion board for the
  <A HREF="http://www.raspberrypi.org/" TARGET="blank">Raspberry Pi $25
  ARM board.</A> <BR><BR>This base project includes a PCB edge defined
  as the same size as the Raspberry-Pi PCB with the connectors placed
  correctly to align the two boards. All IO present on the Raspberry-Pi
  board is connected to the project through the 0.1&quot; expansion
  headers. <BR><BR>The board outline looks like the following:</P>
  <P><IMG SRC="brd.png" NAME="brd" ALIGN=BOTTOM WIDTH=680 HEIGHT=378
  BORDER=0><BR><BR><BR><BR></P>
  <P>(c)2012 Brian Sidebotham<BR>(c)2012 Kicad Developers</P>
  </BODY>
  </HTML>


Operation
~~~~~~~~~


The KiCad File menu New shows 2 option:


|1000000000000185000000F2ADA0CF8E_png|

-   **Blank Project**

    Create a blank project by just copying template/kicad.pro to the current folder.

-   **Project from Template**

    Open the template selection dialog. The template selection dialog has
    a list of icons, and a display window. A single click on a template's
    icon on the left will load that templates info.html metadata file and
    display it in the display window. A click on the OK button starts the
    new project creation. The template will be copied to the new project
    location (excluding METADIR as mentioned earlier) and any files that
    match the string replacement rules will be renamed to reflect the new
    project's name.


|100000000000027E000001DCE9DD870D_png|

After selection of a template:


|100000000000028C000002A7A0200039_png|

Templates Location:
~~~~~~~~~~~~~~~~~~~

The list of available templates are gathered from the following sources:

*   For sytem templates:
       <kicad bin dir>/../share/template/

*   For user templates:

    On Unix:
        ~/kicad/templates/

    On Windows:
        C:\\Documents and Settings\\username\\My Documents\\kicad\\templates\\

    On Mac:
        ~/Documents/kicad/templates/

*   When the environment variable KICAD_PTEMPLATES
    is defined, there is a third page: Portable Templates, 
    which lists templates found in KICAD_PTEMPLATES path.



.. |100000000000027E000001DCE9DD870D_png| image:: images/100000000000027E000001DCE9DD870D.png
    :width: 9.38cm
    :height: 7.001cm


.. |10000000000002B5000001AB64B9B213_png| image:: images/10000000000002B5000001AB64B9B213.png
    :width: 18.339cm
    :height: 11.299cm


.. |100000000000028C000002A7A0200039_png| image:: images/100000000000028C000002A7A0200039.png
    :width: 9.59cm
    :height: 9.999cm


.. |100000000000002C00000027822C5914_png| image:: images/100000000000002C00000027822C5914.png
    :width: 0.981cm
    :height: 1.03cm


.. |10000000000001EC0000004F07F2B654_png| image:: images/10000000000001EC0000004F07F2B654.png
    :width: 13.019cm
    :height: 2.09cm


.. |1000000000000185000000F2ADA0CF8E_png| image:: images/1000000000000185000000F2ADA0CF8E.png
    :width: 10.291cm
    :height: 6.399cm


.. |100000000000002700000029A7BBB537_png| image:: images/100000000000002700000029A7BBB537.png
    :width: 0.951cm
    :height: 0.951cm


.. |10000000000000E900000027B0999D75_png| image:: images/10000000000000E900000027B0999D75.png
    :width: 6.085cm
    :height: 1.111cm


.. |100000000000002500000029C403AB20_png| image:: images/100000000000002500000029C403AB20.png
    :width: 1.085cm
    :height: 1.032cm


.. |1000000000000024000000248581A3AE_png| image:: images/1000000000000024000000248581A3AE.png
    :width: 0.951cm
    :height: 0.951cm


.. |10000000000000230000002995442CF9_png| image:: images/10000000000000230000002995442CF9.png
    :width: 0.981cm
    :height: 1.03cm


.. |10000000000000C60000009255B0301C_png| image:: images/10000000000000C60000009255B0301C.png
..
    :width: 5.241cm
    :height: 3.859cm


.. |10000000000000260000002421A88B39_png| image:: images/10000000000000260000002421A88B39.png
    :width: 1.011cm
    :height: 0.951cm


.. |1000000000000163000000735475F846_png| image:: images/1000000000000163000000735475F846.png
    :width: 9.393cm
    :height: 3.043cm


.. |10000000000001BA0000006F670E0EA3_png| image:: images/10000000000001BA0000006F670E0EA3.png
    :width: 11.695cm
    :height: 2.937cm

