Plot and Print
--------------


Introduction
~~~~~~~~~~~~

You can access both print and plot commands via the file menu.

|100000000000017E000001109CDAC612_png|

The suported output formats are POSTSCRIPT, HPGL, SVG and DXF. You can as
well directly print to your printer.

Common printing commands
~~~~~~~~~~~~~~~~~~~~~~~~

“Plot All” allows you to plot the whole hierarchy (one print file is
generated for each sheet).

:Plot Current: prints one file for the current sheet only.

Plot in HPGL
~~~~~~~~~~~~

This command allows you to create an HPGL file. This option is available
via the icon |10000000000000220000001E69EFEAC6_png|. In this format you
can define.

*   Pen number

*   Pen thickness (in 0,001 inch).

*   Drawing speed (in cm/S).

*   Sheet size.

*   Print offsets.


The plotter setup dialog window looks like the following.


|1000000000000196000001CC52FEA30B_png|

The output file name will be the sheet name plus the extension .plt.

Sheet size selection
^^^^^^^^^^^^^^^^^^^^

Sheet size is normally checked. In this case, the sheet size defined in
the title block menu will be used and the chosen scale will be 1. If a
different sheet size is selected (A4 with A0, or A with E), the scale is
automatically adjusted to fill the page.

Offset adjustments
^^^^^^^^^^^^^^^^^^

For all standard dimensions, you can adjust the offsets to center the
drawing as accurately as possible. Because plotters have an origin point
at the center or at the lower left corner of the sheet, it is necessary
to be able to introduce an offset, in order to plot properly.

Generally speaking.

*   For plotters having their origin point at the center of the sheet the
    offset must be negative and set at half of the sheet dimension.

*   For plotters having their origin point at the lower left corner of
    the sheet the offset must be set equal to 0.


To set an offset.

*   Select sheet size.

*   Set offset X and offset Y.

*   Click on accept offset.


Plot in Postscript
~~~~~~~~~~~~~~~~~~

This command allows you to create PostScript files. This option is
available via the icon |100000000000002200000022A6211250_png|.

|100000000000017A000001555B390DD5_png|

The file name is the sheet name with an extension .ps. You can disable
the option “print title block”. This is useful if you want to create a
postscript file for encapsulation (format .eps) often used to insert a
diagram in a word processing software. The message window displays the
file names created.

Plot in SVG
~~~~~~~~~~~

|10000000000001D8000001A61AC74D2A_png|

Allows you to create plot files using the vectored format SVG. This
option is available via the icon |10000000000000220000001D43940ADA_png|.
The file name is the sheet name with an extension .svg.

Plot in DXF
~~~~~~~~~~~

|10000000000000FB00000191F3D6461D_png|

Allows you to create plot files using the format DXF. This option is
available via the icon |10000000000000220000001D43940ADA_png|. The file
name is the sheet name with an extension .dxf.

Print on paper
~~~~~~~~~~~~~~

This command, available via the icon
|1000000000000022000000227E318ED2_png|,  allows you to visualize and
generate design files for the standard printer.

|100000000000015A000000C1CF6CC2C5_png|

The “Print sheet reference and title block” option enables or disables
sheet references and title block.

The “Print in black and white” option sets printing in monochrome. This
option is generally necessary if you use a black and white laser printer,
because colors are printed into half-tones that are often not so
readable.

