Create a Netlist
----------------


Overview
~~~~~~~~

A netlist is a file which describes electrical connections between
components. In the netlist file you can find:

*   The list of the components

*   The list of connections between components, called equip-potential nets.


Different netlist formats exist. Sometimes the components list and the
equi-potential list are two separate files. This netlist is fundamental
in the use of schematic capture software, because the netlist is the link
with other electronic CAD software, like:

*   PCB software.

*   Schematic and PCB Simulators.

*   CPLD (and other programmable IC's) compilers.


Eeschema supports several netlist formats.

*   PCBNEW format (printed circuits).

*   ORCAD PCB2 format (printed circuits).

*   CADSTAR format (printed circuits).

*   Spice format, for various simulators (the Spice format is also used
    by other simulators).


Netlist format
~~~~~~~~~~~~~~

Select the tool |10000000000000220000002353233D17_png| to open the
netlist creation dialog box.

+----------------------------------------+-----------------+
| |100000000000015B00000103C7B601A8_png| | Pcbnew selected |
+----------------------------------------+-----------------+
| |100000000000015C0000010342AD04EC_png| | Spice selected  |
+----------------------------------------+-----------------+


Using the different tabs you can select the desired format. In Spice
format you can generate netlists wit h either equi-potential names (it is
more legible) or net numbers (old Spice versions accept numbers only). By
clicking the Netlist button, you will be asked for a netlist file name.

**Note**

With big projects, the netlist generation can take up to few minutes.

Netlist Examples
~~~~~~~~~~~~~~~~

You can see below a schematic design using the PSPICE library.

|10000000000002BE0000017EB6C97C72_png|


Example of a PCBNEW netlist file.

::

    # EESchema Netlist Version 1.0 generee le 21/1/1997-16:51:15
    (
    (32E35B76 $noname C2 1NF {Lib=C}
    (1 0)
    (2 VOUT_1)
    )
    (32CFC454 $noname V2 AC_0.1 {Lib=VSOURCE}
    (1 N-000003)
    (2 0)
    )
    (32CFC413 $noname C1 1UF {Lib=C}
    (1 INPUT_1)
    (2 N-000003)
    )
    (32CFC337 $noname V1 DC_12V {Lib=VSOURCE}
    (1 +12V)
    (2 0)
    )
    (32CFC293 $noname R2 10K {Lib=R}
    (1 INPUT_1)
    (2 0)
    )
    (32CFC288 $noname R6 22K {Lib=R}
    (1 +12V)
    (2 INPUT_1)
    )
    (32CFC27F $noname R5 22K {Lib=R}
    (1 +12V)
    (2 N-000008)
    )
    (32CFC277 $noname R1 10K {Lib=R}
    (1 N-000008)
    (2 0)
    )
    (32CFC25A $noname R7 470 {Lib=R}
    (1 EMET_1)
    (2 0)
    )
    (32CFC254 $noname R4 1K {Lib=R}
    (1 +12V)
    (2 VOUT_1)
    )
    (32CFC24C $noname R3 1K {Lib=R}
    (1 +12V)
    (2 N-000006)
    )
    (32CFC230 $noname Q2 Q2N2222 {Lib=NPN}
    (1 VOUT_1)
    (2 N-000008)
    (3 EMET_1)
    )
    (32CFC227 $noname Q1 Q2N2222 {Lib=NPN}
    (1 N-000006)
    (2 INPUT_1)
    (3 EMET_1)
    )
    )
    # End


In PSPICE format, the netlist is as follows.

::

    * EESchema Netlist Version 1.1 (Spice format) creation date: 18/6/2008-08:38:03

    .model Q2N2222 npn (bf=200)
    .AC 10 1Meg \*1.2
    .DC V1 10 12 0.5


    R12   /VOUT N-000003 22K
    R11   +12V N-000003 100
    L1   N-000003 /VOUT 100mH
    R10   N-000005 N-000004 220
    C3   N-000005 0 10uF
    C2   N-000009 0 1nF
    R8   N-000004 0 2.2K
    Q3   /VOUT N-000009 N-000004 N-000004 Q2N2222
    V2   N-000008 0 AC 0.1
    C1   /VIN N-000008 1UF
    V1   +12V 0 DC 12V
    R2   /VIN 0 10K
    R6   +12V /VIN 22K
    R5   +12V N-000012 22K
    R1   N-000012 0 10K
    R7   N-000007 0 470
    R4   +12V N-000009 1K
    R3   +12V N-000010 1K
    Q2   N-000009 N-000012 N-000007 N-000007 Q2N2222
    Q1   N-000010 /VIN N-000007 N-000007 Q2N2222

    .print ac v(vout)
    .plot ac v(nodes) (-1,5)

    .end

Note
~~~~

Netlist Name Precautions
^^^^^^^^^^^^^^^^^^^^^^^^

Many software tools that use netlists do not accept spaces in the
component names, pins, equipotentials or others. Systematically avoid
spaces in labels, or names and value fields of components or their pins.

In the same way, special characters other than letters and numbers can
induce problems. Note that this limitation is not related to Eeschema,
but to the netlist formats that can then become not translatable to
softwares that use netlist files.

PSPICE netlists
^^^^^^^^^^^^^^^

For the Pspice simulator, you have to include some command lines in the
netlist itself (.PROBE, .AC, etc.).

Any text line included in the schematic diagram starting with the keyword
**-pspice** or **-gnucap** will be inserted (without the keyword) at the
top of the netlist.

Any text line included in the schematic diagram starting with the keyword
**+pspice** or **+gnucap** will be inserted (without the keyword) at the
end of the netlist.

Here is a sample using many one line texts and one multi-line text.


|100000000000021B000001BDEA9ADDBA_png|


For example: if you type the following text (do not use a label!):

-PSPICE .PROBE

a line .PROBE will be inserted in the netlist.

In the previous example three lines were inserted at the beginning of the
netlist and two at the end with this technique.

If you are using multiline texts, **+pspice** or **+gnucap** keywords are
needed only once:

+PSPICE .model NPN NPN

.model PNP PNP

.lib C:\\Program Files\\LTC\\LTspiceIV\\lib\\cmp\\standard.bjt

.backanno

creates the four lines:

.model NPN NPN

.model PNP PNP

.lib C:\\Program Files\\LTC\\LTspiceIV\\lib\\cmp\\standard.bjt

.backanno

Also note that the equipotential GND must be named 0 (zero) for Pspice.

Other formats, using «plugins»
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For other netlist formats you can add netlist converters. These
converters are automatically launched by Ee schema. Chapter 14 gives some
explanations and examples of converters.

A converter is a text file (xsl format) but one can use other languages
like Python. When using the xsl format, a tool (xsltproc.exe or xsltproc)
read the intermediate file created by Eeschema, and the converter file to
create the output file. In this case, the converter file (a sheet style)
is very small and very easy to write.

Init the dialog window
^^^^^^^^^^^^^^^^^^^^^^

You can add a new netlist plug-in via the Add Plugin tab.

|10000000000000DA000000C6E73B58D7_png|

Here is the plug-in PadsPcb setup window

|100000000000021300000103755CDB21_png|

The setup will require:

*   A title (for instance: the name of the netlist format).

*   The plug-in to launch.


When the netlist is generated:

#.  Eeschema creates an intermediate file \*.tmp, for instance test.tmp.

#.  Eeschema run the plug-in, which reads test.tmp and creates test.net.



Command line format
^^^^^^^^^^^^^^^^^^^

Here is an example, using xsltproc.exe as tool to convert .xsl files, and
a file netlist_form_pads-pcb.xsl as converter sheet style:

**f:/kicad/bin/xsltproc.exe -o %O.net f:/kicad/bin/plugins/netlist_form_pads-pcb.xsl %I**

With:

+----------------------------------------------------+--------------------------------------+
| f:/kicad/bin/xsltproc.exe                          | A tool to read and convert xsl file  |
+----------------------------------------------------+--------------------------------------+
| -o %O.net                                          | Output file: %O will                 |
|                                                    | define the output file.              |
+----------------------------------------------------+--------------------------------------+
| f:/kicad/bin/plugins/netlist_form_pads-pcb.xsl     | File name converter (a sheet         |
|                                                    | style, xsl format).                  |
+----------------------------------------------------+--------------------------------------+
| %I                                                 | Will be replaced by the intermediate |
|                                                    | file created by Eeschema (\*.tmp).   |
+----------------------------------------------------+--------------------------------------+

For a schematic named test.sch, the actual command line is:

f:/kicad/bin/xsltproc.exe -o test.net f:/kicad/bin/plugins/netlist_form_pads-pcb.xsl test.tmp.

Converter and sheet style (plug in)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This is a very simple piece of software, because its purpose is only to
convert an input text file (the intermediate text file) to an other text
file. Moreover, from the intermediate text file, you can create a BOM
list.

When using xsltproc as converter tool only the sheet style will be
generated.

Intermediate netlist file format
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

See Chapter 14 for more explanations about xslproc, the descriptions of
intermediate file format, and some examples of sheet style for
converters.
