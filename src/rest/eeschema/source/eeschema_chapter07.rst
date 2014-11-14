Automatic classification Annotation



Introduction

The automatic classification annotation tool allows you to automatically assign a designator to components in your schematic. For multi-parts components, assign a multi-part suffix to minimize the number of these packages. The automatic classification annotation tool is accessible via the icon
|100000000000002400000023EA45FB2C_png|
. Here you find its main window.

|1000000000000155000001705431457D_png|


Various possibilities are available:

*   Annotate all the components (reset existing annotation option)



*   Annotate new components only (i.e. those whose reference finishes by? like IC? ) (keep existing annotation option).



*   Annotate the whole hierarchy (use the entire schematic option).



*   Annotate the current sheet only (use current page only option).



The annotation order choice gives the method used to set the reference number inside each sheet of the hierarchy.

Except for particular cases, an automatic annotation applies to the whole project (all sheets) and to the new components, if you don't want to modify previous annotations.

The Annotation Choice gives the method used to calculate reference Id:

*   Use first free number in schematic: components are annotated from 1 (for each reference prefix). If a previous annotation exists, not yet in use numbers will be used.



*   Start to sheet number*100 and use first free number:
    Annotation start from 101 for the sheet 1, from 201 for the sheet 2, etc.
    If there are more than 99 items having the same reference prefix (U, R) inside the sheet 1, the annotation tool uses the number 200 and more, and annotation for sheet 2 will start from the next free number.



*   Start to sheet number*1000 and use first free number.
    Annotation start from 1001 for the sheet 1, from 2001 for the sheet 2.



Some examples

*Annotation order*

|2000000800003E6E0000154B2A71537E_png|

This example shows 5 elements placed, but not annotated.

After the annotation tool Is executed, the following result is obtained.

|100000000000022C000000B9BA2E1A94_png|

Sort by X position.

|100000000000023D000000BC05569580_png|

Sort by Y position.

You can see that four 74LS00 gates were distributed in U1 package, and that the fifth 74LS00 has been assigned to the next , U2.


*Annotation Choice*

Here is an annotation in sheet 2 where the option use first free number in schematic was set.

|100000000000014300000137E6B02665_png|


Option start to sheet number*100 and use first free number give the following result.

|1000000000000138000001495A2E0270_png|


The option start to sheet number*1000 and use first free number gives the following result.

|1000000000000117000001359D8B03B1_png|


.. |100000000000014300000137E6B02665_png| image:: images/100000000000014300000137E6B02665.png
    :width: 8.546cm
    :height: 8.229cm


.. |1000000000000155000001705431457D_png| image:: images/1000000000000155000001705431457D.png
    :width: 9.021cm
    :height: 9.74cm


.. |100000000000023D000000BC05569580_png| image:: images/100000000000023D000000BC05569580.png
    :width: 15.161cm
    :height: 4.971cm


.. |100000000000022C000000B9BA2E1A94_png| image:: images/100000000000022C000000B9BA2E1A94.png
    :width: 14.711cm
    :height: 4.89cm


.. |1000000000000117000001359D8B03B1_png| image:: images/1000000000000117000001359D8B03B1.png
    :width: 7.382cm
    :height: 8.176cm


.. |1000000000000138000001495A2E0270_png| image:: images/1000000000000138000001495A2E0270.png
    :width: 8.255cm
    :height: 8.705cm


.. |2000000800003E6E0000154B2A71537E_png| image:: images/2000000800003E6E0000154B2A71537E.png
    :width: 15.983cm
    :height: 5.449cm


.. |100000000000002400000023EA45FB2C_png| image:: images/100000000000002400000023EA45FB2C.png
    :width: 0.951cm
    :height: 0.93cm

