Creating Customized Netlists and BOM Files
------------------------------------------


Intermediate Netlist File
~~~~~~~~~~~~~~~~~~~~~~~~~

BOM files and netlist files can be converted from an Intermediate netlist
file created by Eeschema.

This file uses XML syntax and is called the intermediate netlist. The
intermediate netlist includes a large amount of data about your board and
because of this, it can be used with post-processing to create a BOM or
other reports.

Depending on the output (BOM or netlist), different subsets of the
complete Intermediate Netlist file will be used in the post-processing.

Schematic sample
^^^^^^^^^^^^^^^^

|10000000000004990000028CB8319B1E_png|

The Intermediate Netlist file sample
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The corresponding intermediate netlist (using XML syntax) of the circuit
above is shown below.


::

    <?xml version="1.0" encoding="utf-8"?>
    <export version="D">
      <design>
        <source>F:\kicad_aux\netlist_test\netlist_test.sch</source>
        <date>29/08/2010 20:35:21</date>
        <tool>eeschema (2010-08-28 BZR 2458)-unstable</tool>
      </design>
      <components>
        <comp ref="P1">
          <value>CONN_4</value>
          <libsource lib="conn" part="CONN_4"/>
          <sheetpath names="/" tstamps="/"/>
          <tstamp>4C6E2141</tstamp>
        </comp>
        <comp ref="U2">
          <value>74LS74</value>
          <libsource lib="74xx" part="74LS74"/>
          <sheetpath names="/" tstamps="/"/>
          <tstamp>4C6E20BA</tstamp>
        </comp>
        <comp ref="U1">
          <value>74LS04</value>
          <libsource lib="74xx" part="74LS04"/>
          <sheetpath names="/" tstamps="/"/>
          <tstamp>4C6E20A6</tstamp>
        </comp>
        <comp ref="C1">
          <value>CP</value>
          <libsource lib="device" part="CP"/>
          <sheetpath names="/" tstamps="/"/>
          <tstamp>4C6E2094</tstamp>
        </comp>
        <comp ref="R1">
          <value>R</value>
          <libsource lib="device" part="R"/>
          <sheetpath names="/" tstamps="/"/>
          <tstamp>4C6E208A</tstamp>
        </comp>
      </components>
      <libparts>
        <libpart lib="device" part="C">
          <description>Condensateur non polarise</description>
          <footprints>
            <fp>SM*</fp>
            <fp>C?</fp>
            <fp>C1-1</fp>
          </footprints>
          <fields>
            <field name="Reference">C</field>
            <field name="Value">C</field>
          </fields>
          <pins>
            <pin num="1" name="~" type="passive"/>
            <pin num="2" name="~" type="passive"/>
          </pins>
        </libpart>
        <libpart lib="device" part="R">
          <description>Resistance</description>
          <footprints>
            <fp>R?</fp>
            <fp>SM0603</fp>
            <fp>SM0805</fp>
            <fp>R?-*</fp>
            <fp>SM1206</fp>
          </footprints>
          <fields>
            <field name="Reference">R</field>
            <field name="Value">R</field>
          </fields>
          <pins>
            <pin num="1" name="~" type="passive"/>
            <pin num="2" name="~" type="passive"/>
          </pins>
        </libpart>
        <libpart lib="conn" part="CONN_4">
          <description>Symbole general de connecteur</description>
          <fields>
            <field name="Reference">P</field>
            <field name="Value">CONN_4</field>
          </fields>
          <pins>
            <pin num="1" name="P1" type="passive"/>
            <pin num="2" name="P2" type="passive"/>
            <pin num="3" name="P3" type="passive"/>
            <pin num="4" name="P4" type="passive"/>
          </pins>
        </libpart>
        <libpart lib="74xx" part="74LS04">
          <description>Hex Inverseur</description>
          <fields>
            <field name="Reference">U</field>
            <field name="Value">74LS04</field>
          </fields>
          <pins>
            <pin num="1" name="~" type="input"/>
            <pin num="2" name="~" type="output"/>
            <pin num="3" name="~" type="input"/>
            <pin num="4" name="~" type="output"/>
            <pin num="5" name="~" type="input"/>
            <pin num="6" name="~" type="output"/>
            <pin num="7" name="GND" type="power_in"/>
            <pin num="8" name="~" type="output"/>
            <pin num="9" name="~" type="input"/>
            <pin num="10" name="~" type="output"/>
            <pin num="11" name="~" type="input"/>
            <pin num="12" name="~" type="output"/>
            <pin num="13" name="~" type="input"/>
            <pin num="14" name="VCC" type="power_in"/>
          </pins>
        </libpart>
        <libpart lib="74xx" part="74LS74">
          <description>Dual D FlipFlop, Set &amp; Reset</description>
          <docs>74xx/74hc_hct74.pdf</docs>
          <fields>
            <field name="Reference">U</field>
            <field name="Value">74LS74</field>
          </fields>
          <pins>
            <pin num="1" name="Cd" type="input"/>
            <pin num="2" name="D" type="input"/>
            <pin num="3" name="Cp" type="input"/>
            <pin num="4" name="Sd" type="input"/>
            <pin num="5" name="Q" type="output"/>
            <pin num="6" name="~Q" type="output"/>
            <pin num="7" name="GND" type="power_in"/>
            <pin num="8" name="~Q" type="output"/>
            <pin num="9" name="Q" type="output"/>
            <pin num="10" name="Sd" type="input"/>
            <pin num="11" name="Cp" type="input"/>
            <pin num="12" name="D" type="input"/>
            <pin num="13" name="Cd" type="input"/>
            <pin num="14" name="VCC" type="power_in"/>
          </pins>
        </libpart>
      </libparts>
      <libraries>
        <library logical="device">
          <uri>F:\kicad\share\library\device.lib</uri>
        </library>
        <library logical="conn">
          <uri>F:\kicad\share\library\conn.lib</uri>
        </library>
        <library logical="74xx">
          <uri>F:\kicad\share\library\74xx.lib</uri>
        </library>
      </libraries>
      <nets>
        <net code="1" name="GND">
          <node ref="U1" pin="7"/>
          <node ref="C1" pin="2"/>
          <node ref="U2" pin="7"/>
          <node ref="P1" pin="4"/>
        </net>
        <net code="2" name="VCC">
          <node ref="R1" pin="1"/>
          <node ref="U1" pin="14"/>
          <node ref="U2" pin="4"/>
          <node ref="U2" pin="1"/>
          <node ref="U2" pin="14"/>
          <node ref="P1" pin="1"/>
        </net>
        <net code="3" name="">
          <node ref="U2" pin="6"/>
        </net>
        <net code="4" name="">
          <node ref="U1" pin="2"/>
          <node ref="U2" pin="3"/>
        </net>
        <net code="5" name="/SIG_OUT">
          <node ref="P1" pin="2"/>
          <node ref="U2" pin="5"/>
          <node ref="U2" pin="2"/>
        </net>
        <net code="6" name="/CLOCK_IN">
          <node ref="R1" pin="2"/>
          <node ref="C1" pin="1"/>
          <node ref="U1" pin="1"/>
          <node ref="P1" pin="3"/>
        </net>
      </nets>
    </export>

Conversion to a new netlist format
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By applying a post-processing filter to the Intermediate netlist file you
can generate foreign netlist files as well as BOM files. Because this
conversion is a text to text transformation, this post-processing filter
can be written using Python, XSLT, or any other tool capable of taking
XML as input.

XSLT itself is a an XML language very suitable for XML transformations.
There is a free program called *xsltproc* that you can download and
install. The xsltproc program can be used to read the Intermediate XML
netlist input file, appl y a style-sheet to transform the input, and save
the results in an output file. Use of x sltproc requires a style-sheet
file using XSLT conventions. The full conversion process is handle d by
Eeschema, after it is configured once to run xsltproc in a specific way.

XSLT approach
~~~~~~~~~~~~~

The document that describes XSL Transformations (XSLT) is available here:

**http://www.w3.org/TR/xslt**

Create a Pads-Pcb netlist file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The pads-pcb format is comprise d of two sections.

*   The footprint list.

*   The Nets list: grouping pads references by nets.


Immediately below is a style-sheet which converts the Intermediate
Netlist file to a pads-pcb netlist format:

::

    <?xml version="1.0" encoding="ISO-8859-1"?>
    <!--XSL style sheet to EESCHEMA Generic Netlist Format to PADS netlist format
        Copyright (C) 2010, SoftPLC Corporation.
        GPL v2.

        How to use:
            https://lists.launchpad.net/kicad-developers/msg05157.html
    -->

    <!DOCTYPE xsl:stylesheet [
      <!ENTITY nl  "&#xd;&#xa;"> <!--new line CR, LF -->
    ]>

    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

    <xsl:template match="/export">
        <xsl:text>*PADS-PCB*&nl;*PART*&nl;</xsl:text>
        <xsl:apply-templates select="components/comp"/>
        <xsl:text>&nl;*NET*&nl;</xsl:text>
        <xsl:apply-templates select="nets/net"/>
        <xsl:text>*END*&nl;</xsl:text>
    </xsl:template>

    <!-- for each component -->
    <xsl:template match="comp">
        <xsl:text> </xsl:text>
        <xsl:value-of select="@ref"/>
        <xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test = "footprint != '' ">
                <xsl:apply-templates select="footprint"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>unknown</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&nl;</xsl:text>
    </xsl:template>

    <!-- for each net -->
    <xsl:template match="net">
        <!-- nets are output only if there is more than one pin in net -->
        <xsl:if test="count(node)>1">
            <xsl:text>*SIGNAL* </xsl:text>
            <xsl:choose>
                <xsl:when test = "@name != '' ">
                    <xsl:value-of select="@name"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>N-</xsl:text>
                    <xsl:value-of select="@code"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&nl;</xsl:text>
            <xsl:apply-templates select="node"/>
        </xsl:if>
    </xsl:template>

    <!-- for each node -->
    <xsl:template match="node">
        <xsl:text> </xsl:text>
        <xsl:value-of select="@ref"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="@pin"/>
        <xsl:text>&nl;</xsl:text>
    </xsl:template>

    </xsl:stylesheet>


And here is the pads-pcb output file after running xsltproc:

::

    *PADS-PCB*
    *PART*
    P1 unknown
    U2 unknown
    U1 unknown
    C1 unknown
    R1 unknown
    *NET*
    *SIGNAL* GND
    U1.7
    C1.2
    U2.7
    P1.4
    *SIGNAL* VCC
    R1.1
    U1.14
    U2.4
    U2.1
    U2.14
    P1.1
    *SIGNAL* N-4
    U1.2
    U2.3
    *SIGNAL* /SIG_OUT
    P1.2
    U2.5
    U2.2
    *SIGNAL* /CLOCK_IN
    R1.2
    C1.1
    U1.1
    P1.3

    *END*


The command line to make this conversion is:

::

    kicad\\bin\\xsltproc.exe -o test.net kicad\\bin\\plugins\\netlist_form_pads-pcb.xsl test.tmp

Create a Cadstar netlist file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The Cadstar format is comprized of two sections.

*   The footprint list.

*   The Nets list: grouping pads references by nets.



Here is the style-sheet file to make this specific conversion:

::

    <?xml version="1.0" encoding="ISO-8859-1"?>
    <!--XSL style sheet to EESCHEMA Generic Netlist Format to CADSTAR netlist format
        Copyright (C) 2010, Jean-Pierre Charras.
        Copyright (C) 2010, SoftPLC Corporation.
        GPL v2.

    <!DOCTYPE xsl:stylesheet [
      <!ENTITY nl  "&#xd;&#xa;"> <!--new line CR, LF -->
    ]>

    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

    <!-- Netlist header -->
    <xsl:template match="/export">
        <xsl:text>.HEA&nl;</xsl:text>
        <xsl:apply-templates select="design/date"/>  <!-- Generate line .TIM <time> -->
        <xsl:apply-templates select="design/tool"/>  <!-- Generate line .APP <eeschema version> -->
        <xsl:apply-templates select="components/comp"/>  <!-- Generate list of components -->
        <xsl:text>&nl;&nl;</xsl:text>
        <xsl:apply-templates select="nets/net"/>          <!-- Generate list of nets and connections -->
        <xsl:text>&nl;.END&nl;</xsl:text>
    </xsl:template>

     <!-- Generate line .TIM 20/08/2010 10:45:33 -->
    <xsl:template match="tool">
        <xsl:text>.APP "</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>"&nl;</xsl:text>
    </xsl:template>

     <!-- Generate line .APP "eeschema (2010-08-17 BZR 2450)-unstable" -->
    <xsl:template match="date">
        <xsl:text>.TIM </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>&nl;</xsl:text>
    </xsl:template>

    <!-- for each component -->
    <xsl:template match="comp">
        <xsl:text>.ADD_COM </xsl:text>
        <xsl:value-of select="@ref"/>
        <xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test = "value != '' ">
                <xsl:text>"</xsl:text> <xsl:apply-templates select="value"/> <xsl:text>"</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>""</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&nl;</xsl:text>
    </xsl:template>

    <!-- for each net -->
    <xsl:template match="net">
        <!-- nets are output only if there is more than one pin in net -->
        <xsl:if test="count(node)>1">
        <xsl:variable name="netname">
            <xsl:text>"</xsl:text>
            <xsl:choose>
                <xsl:when test = "@name != '' ">
                    <xsl:value-of select="@name"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>N-</xsl:text>
                    <xsl:value-of select="@code"/>
            </xsl:otherwise>
            </xsl:choose>
            <xsl:text>"&nl;</xsl:text>
            </xsl:variable>
            <xsl:apply-templates select="node" mode="first"/>
            <xsl:value-of select="$netname"/>
            <xsl:apply-templates select="node" mode="others"/>
        </xsl:if>
    </xsl:template>

    <!-- for each node -->
    <xsl:template match="node" mode="first">
        <xsl:if test="position()=1">
           <xsl:text>.ADD_TER </xsl:text>
        <xsl:value-of select="@ref"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="@pin"/>
        <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="node" mode="others">
        <xsl:choose>
            <xsl:when test='position()=1'>
            </xsl:when>
            <xsl:when test='position()=2'>
               <xsl:text>.TER     </xsl:text>
            </xsl:when>
            <xsl:otherwise>
               <xsl:text>         </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="position()>1">
            <xsl:value-of select="@ref"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="@pin"/>
            <xsl:text>&nl;</xsl:text>
        </xsl:if>
    </xsl:template>

    </xsl:stylesheet>


Here is the Cadstar output file.

::

    .HEA
    .TIM 21/08/2010 08:12:08
    .APP "eeschema (2010-08-09 BZR 2439)-unstable"
    .ADD_COM P1 "CONN_4"
    .ADD_COM U2 "74LS74"
    .ADD_COM U1 "74LS04"
    .ADD_COM C1 "CP"
    .ADD_COM R1 "R"


    .ADD_TER U1.7 "GND"
    .TER     C1.2
             U2.7
             P1.4
    .ADD_TER R1.1 "VCC"
    .TER     U1.14
             U2.4
             U2.1
             U2.14
             P1.1
    .ADD_TER U1.2 "N-4"
    .TER     U2.3
    .ADD_TER P1.2 "/SIG_OUT"
    .TER     U2.5
             U2.2
    .ADD_TER R1.2 "/CLOCK_IN"
    .TER     C1.1
             U1.1
             P1.3

    .END


Create a OrcadPCB2 netlist file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This format has only one section which is the footprint list. Each
footprint includes its list of pads with reference to a net.

Here is the style-sheet for this specific conversion:


::

    <?xml version="1.0" encoding="ISO-8859-1"?>
    <!--XSL style sheet to EESCHEMA Generic Netlist Format to CADSTAR netlist format
        Copyright (C) 2010, SoftPLC Corporation.
        GPL v2.

        How to use:
            https://lists.launchpad.net/kicad-developers/msg05157.html
    -->

    <!DOCTYPE xsl:stylesheet [
      <!ENTITY nl  "&#xd;&#xa;"> <!--new line CR, LF -->
    ]>

    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

    <!--
        Netlist header
        Creates the entire netlist
        (can be seen as equivalent to main function in C
    -->
    <xsl:template match="/export">
        <xsl:text>( { EESchema Netlist Version 1.1  </xsl:text>
        <!-- Generate line .TIM <time> -->
    <xsl:apply-templates select="design/date"/>
    <!-- Generate line eeschema version ... -->
    <xsl:apply-templates select="design/tool"/>
    <xsl:text>}&nl;</xsl:text>

    <!-- Generate the list of components -->
    <xsl:apply-templates select="components/comp"/>  <!-- Generate list of components -->

    <!-- end of file -->
    <xsl:text>)&nl;*&nl;</xsl:text>
    </xsl:template>

    <!--
        Generate id in header like "eeschema (2010-08-17 BZR 2450)-unstable"
    -->
    <xsl:template match="tool">
        <xsl:apply-templates/>
    </xsl:template>

    <!--
        Generate date in header like "20/08/2010 10:45:33"
    -->
    <xsl:template match="date">
        <xsl:apply-templates/>
        <xsl:text>&nl;</xsl:text>
    </xsl:template>

    <!--
        This template read each component
        (path = /export/components/comp)
        creates lines:
         ( 3EBF7DBD $noname U1 74LS125
          ... pin list ...
          )
        and calls "create_pin_list" template to build the pin list
    -->
    <xsl:template match="comp">
        <xsl:text> ( </xsl:text>
        <xsl:choose>
            <xsl:when test = "tstamp != '' ">
                <xsl:apply-templates select="tstamp"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>00000000</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test = "footprint != '' ">
                <xsl:apply-templates select="footprint"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>$noname</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text> </xsl:text>
        <xsl:value-of select="@ref"/>
        <xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test = "value != '' ">
                <xsl:apply-templates select="value"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>"~"</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&nl;</xsl:text>
        <xsl:call-template name="Search_pin_list" >
            <xsl:with-param name="cmplib_id" select="libsource/@part"/>
            <xsl:with-param name="cmp_ref" select="@ref"/>
        </xsl:call-template>
        <xsl:text> )&nl;</xsl:text>
    </xsl:template>

    <!--
        This template search for a given lib component description in list
        lib component descriptions are in /export/libparts,
        and each description start at ./libpart
        We search here for the list of pins of the given component
        This template has 2 parameters:
            "cmplib_id" (reference in libparts)
            "cmp_ref"   (schematic reference of the given component)
    -->
    <xsl:template name="Search_pin_list" >
        <xsl:param name="cmplib_id" select="0" />
        <xsl:param name="cmp_ref" select="0" />
            <xsl:for-each select="/export/libparts/libpart">
                <xsl:if test = "@part = $cmplib_id ">
                    <xsl:apply-templates name="build_pin_list" select="pins/pin">
                        <xsl:with-param name="cmp_ref" select="$cmp_ref"/>
                    </xsl:apply-templates>
                </xsl:if>
            </xsl:for-each>
    </xsl:template>


    <!--
        This template writes the pin list of a component
        from the pin list of the library description
        The pin list from library description is something like
              <pins>
                <pin num="1" type="passive"/>
                <pin num="2" type="passive"/>
              </pins>
        Output pin list is ( <pin num> <net name> )
        something like
                ( 1 VCC )
                ( 2 GND )
    -->
    <xsl:template name="build_pin_list" match="pin">
        <xsl:param name="cmp_ref" select="0" />

        <!-- write pin numner and separator -->
        <xsl:text>  ( </xsl:text>
        <xsl:value-of select="@num"/>
        <xsl:text> </xsl:text>

        <!-- search net name in nets section and write it: -->
        <xsl:variable name="pinNum" select="@num" />
        <xsl:for-each select="/export/nets/net">
            <!-- net name is output only if there is more than one pin in net
                 else use "?" as net name, so count items in this net
            -->
            <xsl:variable name="pinCnt" select="count(node)" />
            <xsl:apply-templates name="Search_pin_netname" select="node">
                <xsl:with-param name="cmp_ref" select="$cmp_ref"/>
                <xsl:with-param name="pin_cnt_in_net" select="$pinCnt"/>
                <xsl:with-param name="pin_num"> <xsl:value-of select="$pinNum"/>
                </xsl:with-param>
            </xsl:apply-templates>
        </xsl:for-each>

        <!-- close line -->
        <xsl:text> )&nl;</xsl:text>
    </xsl:template>

    <!--
        This template writes the pin netname of a given pin of a given component
        from the nets list
        The nets list description is something like
          <nets>
            <net code="1" name="GND">
              <node ref="J1" pin="20"/>
                  <node ref="C2" pin="2"/>
            </net>
            <net code="2" name="">
              <node ref="U2" pin="11"/>
            </net>
        </nets>
        This template has 2 parameters:
            "cmp_ref"   (schematic reference of the given component)
            "pin_num"   (pin number)
    -->

    <xsl:template name="Search_pin_netname" match="node">
        <xsl:param name="cmp_ref" select="0" />
        <xsl:param name="pin_num" select="0" />
        <xsl:param name="pin_cnt_in_net" select="0" />

        <xsl:if test = "@ref = $cmp_ref ">
            <xsl:if test = "@pin = $pin_num">
            <!-- net name is output only if there is more than one pin in net
                 else use "?" as net name
            -->
                <xsl:if test = "$pin_cnt_in_net>1">
                    <xsl:choose>
                        <!-- if a net has a name, use it,
                            else build a name from its net code
                        -->
                        <xsl:when test = "../@name != '' ">
                            <xsl:value-of select="../@name"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>$N-0</xsl:text><xsl:value-of select="../@code"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <xsl:if test = "$pin_cnt_in_net &lt;2">
                    <xsl:text>?</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:if>

    </xsl:template>

    </xsl:stylesheet>


Here is the OrcadPCB2 output file.

::

    ( { EESchema Netlist Version 1.1  29/08/2010 21:07:51
    eeschema (2010-08-28 BZR 2458)-unstable}
     ( 4C6E2141 $noname P1 CONN_4
      (  1 VCC )
      (  2 /SIG_OUT )
      (  3 /CLOCK_IN )
      (  4 GND )
     )
     ( 4C6E20BA $noname U2 74LS74
      (  1 VCC )
      (  2 /SIG_OUT )
      (  3 N-04 )
      (  4 VCC )
      (  5 /SIG_OUT )
      (  6 ? )
      (  7 GND )
      (  14 VCC )
     )
     ( 4C6E20A6 $noname U1 74LS04
      (  1 /CLOCK_IN )
      (  2 N-04 )
      (  7 GND )
      (  14 VCC )
     )
     ( 4C6E2094 $noname C1 CP
      (  1 /CLOCK_IN )
      (  2 GND )
     )
     ( 4C6E208A $noname R1 R
      (  1 VCC )
      (  2 /CLOCK_IN )
     )
    )
    *

Eeschema plugins interface
^^^^^^^^^^^^^^^^^^^^^^^^^^

Intermediate Netlist converters can be automatically launched within Eeschema.

Init the Dialog window
++++++++++++++++++++++

One can add a new netlist plug-in user interface tab by clicking on the
Add Plugin tab.

|10000000000000FC000000C867B9348F_png|

Here is what the configuration data for the PadsPcb tab looks like:

|100000000000026D000001272BA6B200_png|


Plugin Configuration Parameters
+++++++++++++++++++++++++++++++

The Eeschema plug-in configuration dialog requires the following
information:

*   The title: for instance, the name of the netlist format.

*   The command line to launch the converter.



Once you click on the netlist button the following will happen:

#.  Eeschema creates an intermediate netlist file *.xml, for instance
    *test.xml.*

#.  Eeschema runs the plug-in by reading test.xml and creates test.net



Generate netlist files with the command line
++++++++++++++++++++++++++++++++++++++++++++

Assuming we are using the program *xsltproc.exe* to apply the sheet style
to the intermediate file, *xsltproc.exe* is executed with the following
command.


*xsltproc.exe -o <output filename> < style-sheet filename> <input XML file to convert>*


In Kicad under Windows the command line is the following.


*f:/kicad/bin/xsltproc.exe -o “%O” f:/kicad/bin/plugins/netlist_form_pads-pcb.xsl “%I”*


Under Linux the command becomes as following.


*xsltproc -o “%O” /usr/local/kicad/bin/plugins/netlist_form_pads-pcb.xsl “%I”*


Where *netlist_form_pads-pcb.xsl* is the style-sheet that you are
applying. Do not forget the double quotes around the file names, this
allows them to have spaces after the substitution by Eeschema.

The command line format accepts parameters for filenames:

The supported formatting parameters are.

*   %B => base filename and path of selected output file, minus path and
    extension.

*   %I => complete filename and path of the temporary input file
    (the intermediate net file).

*   %O => complete filename and path of the user chosen output file.



%I will be replaced by the actual intermediate file name

%O will be replaced by the actual output file name.

Command line format: example for xsltproc
+++++++++++++++++++++++++++++++++++++++++

The command line format for xsltproc is the following:

<path of xsltproc> xsltproc <xsltproc parameters>

*under Windows.*

**f:/kicad/bin/xsltproc.exe -o “%O” f:/kicad/bin/plugins/netlist_form_pads-pcb.xsl “%I”**


under Linux:

**xsltproc -o “%O” /usr/local/kicad/bin/plugins/netlist_form_pads-pcb.xsl “%I”**


The above examples assume xsltproc is installed on your PC under Windows
and all files located in kicad/bin.

Bill of Materials Generation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Because the intermediate netlist file contains all information about used
components, a BOM can be extracted from it. Here is the plug-in setup
window (on Linux) to create a customized Bill Of Materials (BOM) file:


|bom-netlist-tab_png|

The path to the style sheet bom2csv.xsl is system dependent. The
currently best XSLT style-sheet for BOM generation at this time is called
*bom2csv.xsl*. You are free to modify it according to your needs, and if
you develop something generally useful, ask that it become part of the
KiCad project.

Command line format: example for python scripts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The command line format for python is something like:


python <script file name> <input filename> <output filename>

under Windows:

**python \*.exe f:/kicad/python/my_python_script.py “%I” “%O”**


under Linux:

**python /usr/local/kicad/python/my_python_script.py “%I” “%O”**


Assuming python is installed on your PC.

Intermediate Netlist structure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This sample gives an idea of the netlist file format.

::

    <?xml version="1.0" encoding="utf-8"?>
    <export version="D">
      <design>
        <source>F:\kicad_aux\netlist_test\netlist_test.sch</source>
        <date>29/08/2010 21:07:51</date>
        <tool>eeschema (2010-08-28 BZR 2458)-unstable</tool>
      </design>
      <components>
        <comp ref="P1">
          <value>CONN_4</value>
          <libsource lib="conn" part="CONN_4"/>
          <sheetpath names="/" tstamps="/"/>
          <tstamp>4C6E2141</tstamp>
        </comp>
        <comp ref="U2">
          <value>74LS74</value>
          <libsource lib="74xx" part="74LS74"/>
          <sheetpath names="/" tstamps="/"/>
          <tstamp>4C6E20BA</tstamp>
        </comp>
        <comp ref="U1">
          <value>74LS04</value>
          <libsource lib="74xx" part="74LS04"/>
          <sheetpath names="/" tstamps="/"/>
          <tstamp>4C6E20A6</tstamp>
        </comp>
        <comp ref="C1">
          <value>CP</value>
          <libsource lib="device" part="CP"/>
          <sheetpath names="/" tstamps="/"/>
          <tstamp>4C6E2094</tstamp>
        <comp ref="R1">
          <value>R</value>
          <libsource lib="device" part="R"/>
          <sheetpath names="/" tstamps="/"/>
          <tstamp>4C6E208A</tstamp>
        </comp>
      </components>
      <libparts/>
      <libraries/>
      <nets>
        <net code="1" name="GND">
          <node ref="U1" pin="7"/>
          <node ref="C1" pin="2"/>
          <node ref="U2" pin="7"/>
          <node ref="P1" pin="4"/>
        </net>
        <net code="2" name="VCC">
          <node ref="R1" pin="1"/>
          <node ref="U1" pin="14"/>
          <node ref="U2" pin="4"/>
          <node ref="U2" pin="1"/>
          <node ref="U2" pin="14"/>
          <node ref="P1" pin="1"/>
        </net>
        <net code="3" name="">
          <node ref="U2" pin="6"/>
        </net>
        <net code="4" name="">
          <node ref="U1" pin="2"/>
          <node ref="U2" pin="3"/>
        </net>
        <net code="5" name="/SIG_OUT">
          <node ref="P1" pin="2"/>
          <node ref="U2" pin="5"/>
          <node ref="U2" pin="2"/>
        </net>
        <net code="6" name="/CLOCK_IN">
          <node ref="R1" pin="2"/>
          <node ref="C1" pin="1"/>
          <node ref="U1" pin="1"/>
          <node ref="P1" pin="3"/>
        </net>
      </nets>
    </export>


General netlist file structure
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The intermediate Netlist accounts for five sections.

*   The header section.

*   The component section.

*   The lib parts section.

*   The libraries section.

*   The nets section.



The file content has the delimiter <export>

::

    <export version="D">
    ...
    </export>

The header section
^^^^^^^^^^^^^^^^^^

The header has the delimiter <design>

::

    <design>
    <source>F:\kicad_aux\netlist_test\netlist_test.sch</source>
    <date>21/08/2010 08:12:08</date>
    <tool>eeschema (2010-08-09 BZR 2439)-unstable</tool>
    </design>


This section can be considered a comment section.

The components section
^^^^^^^^^^^^^^^^^^^^^^

The component section has the delimiter <components>

::

    <components>
    <comp ref="P1">
    <value>CONN_4</value>
    <libsource lib="conn" part="CONN_4"/>
    <sheetpath names="/" tstamps="/"/>
    <tstamp>4C6E2141</tstamp>
    </comp>
    </components>


This section contains the list of components in your schematic. Each
component is described like this:

::

    <comp ref="P1">
    <value>CONN_4</value>
    <libsource lib="conn" part="CONN_4"/>
    <sheetpath names="/" tstamps="/"/>
    <tstamp>4C6E2141</tstamp>
    </comp>


+----------------------------+--------------------------------------------------+
| **libsource**              | name of the lib where this component was found.  |
+----------------------------+--------------------------------------------------+
| **part**                   | component name inside this library.              |
+----------------------------+--------------------------------------------------+
| **sheetpath**              | path of the sheet inside the hierarchy: identify |
|                            | the sheet within the full schematic hierarchy.   |
+----------------------------+--------------------------------------------------+
| **tstamps (time stamps)**  | time stamp of the schematic file.                |
+----------------------------+--------------------------------------------------+
| **tstamp (time stamp)**    | time stamp of the component.                     |
+----------------------------+--------------------------------------------------+

Note about time stamps for components
+++++++++++++++++++++++++++++++++++++

To identify a component in a netlist and therefore on a board, the
timestamp reference is used as unique for each component. However Kicad
provides an auxiliary way to identify a component which is the
corresponding footprint on the board. This allows the re-annotation of
components in a schematic project and does not loose the link between the
component and its footprint.

A time stamp is an unique identifier for each component or sheet in a
schematic project. However, in complex hierarchies, the same sheet is
used more than once, so this sheet contains components having the same
time stamp.

A given sheet inside a complex hierarchy has an unique identifier: its
sheetpath. A given component (inside a complex hierarchy) has an unique
identifier: the sheetpath + its tstamp

The libparts section
^^^^^^^^^^^^^^^^^^^^

The libparts section has the delimiter <libparts>, and the content of
this section is defined in the schematic libraries. The libparts section
contains

*   The allowed footprints names (names use jokers) delimiter <fp>.

*   The fields defined in the library delimiter <fields>.

*   The list of pins delimiter <pins>.

::

    <libparts>
    <libpart lib="device" part="CP">
      <description>Condensateur polarise</description>
      <footprints>
        <fp>CP*</fp>
        <fp>SM*</fp>
      </footprints>
      <fields>
        <field name="Reference">C</field>
        <field name="Valeur">CP</field>
      </fields>
      <pins>
        <pin num="1" name="1" type="passive"/>
        <pin num="2" name="2" type="passive"/>
      </pins>
    </libpart>
    </libparts>


Lines like <pin num="1" type="passive"/>
give also the electrical pin type. Possible electrical pin types are

+----------------+--------------------------------------------------+
| Input          | Usual input pin                                  |
+----------------+--------------------------------------------------+
| Output         | Usual output                                     |
+----------------+--------------------------------------------------+
| Bidirectional  | Input or Output                                  |
+----------------+--------------------------------------------------+
| Tri-state      | Bus input/output                                 |
+----------------+--------------------------------------------------+
| Passive        | Usual ends of passive components                 |
+----------------+--------------------------------------------------+
| Unspecified    | Unknown electrical type                          |
+----------------+--------------------------------------------------+
| Power input    | Power input of a component                       |
+----------------+--------------------------------------------------+
| Power output   | Power output like a regulator output             |
+----------------+--------------------------------------------------+
| Open collector | Open collector often found in analog comparators |
+----------------+--------------------------------------------------+
| Open emitter   | Open collector sometimes found in logic.         |
+----------------+--------------------------------------------------+
| Not connected  | Must be left open in schematic                   |
+----------------+--------------------------------------------------+


The libraries section
^^^^^^^^^^^^^^^^^^^^^

The libraries section has the delimiter <libraries>. This section
contains the list of schematic libraries used in the project.

::

    <libraries>
      <library logical="device">
        <uri>F:\kicad\share\library\device.lib</uri>
      </library>
      <library logical="conn">
        <uri>F:\kicad\share\library\conn.lib</uri>
      </library>
    </libraries>


The nets section
^^^^^^^^^^^^^^^^

The nets section has the delimiter <nets>. This section contains the
“connectivity” of the schematic.

::

  <nets>
    <net code="1" name="GND">
      <node ref="U1" pin="7"/>
      <node ref="C1" pin="2"/>
      <node ref="U2" pin="7"/>
      <node ref="P1" pin="4"/>
    </net>
    <net code="2" name="VCC">
      <node ref="R1" pin="1"/>
      <node ref="U1" pin="14"/>
      <node ref="U2" pin="4"/>
      <node ref="U2" pin="1"/>
      <node ref="U2" pin="14"/>
      <node ref="P1" pin="1"/>
    </net>
  </nets>



This section lists all nets in the schematic.

A possible net is contains the following.

::

    <net code="1" name="GND">
      <node ref="U1" pin="7"/>
      <node ref="C1" pin="2"/>
      <node ref="U2" pin="7"/>
      <node ref="P1" pin="4"/>
    </net>



+----------+--------------------------------------------+
| net code | is an internal identifier for this net     |
+----------+--------------------------------------------+
| name     | is a name for this net                     |
+----------+--------------------------------------------+
| node     | give a pin reference connected to this net |
+----------+--------------------------------------------+


More about xsltproc
~~~~~~~~~~~~~~~~~~~

Refer to the page: *http://xmlsoft.org/XSLT/xsltproc.html*

Introduction
^^^^^^^^^^^^

xsltproc is a command line tool for applying XSLT style-sheets to XML
documents. While it was developed as part of the GNOME project, it can
operate independently of the GNOME desktop.

xsltproc is invoked from the command line with the name of the
style-sheet to be used followed by the name of the file or files to which
the style-sheet is to be applied. It will use the standard input if a
filename provided is - .

If a style-sheet is included in an XML document with a Style-sheet
Processing Instruction, no style-sheet needs to be named in the command
line. xsltproc will automatically detect the included style-sheet and use
it. By default, the output is to *stdout*. You can specify a file for
output using the -o option.

Synopsis
^^^^^^^^

xsltproc [[-V] | [-v] | [-o *file* ] | [--timing] | [--repeat] |
[--debug] | [--novalid] | [--noout] | [--maxdepth *val* ] | [--html] |
[--param *name* *value* ] | [--stringparam *name* *value* ] | [--nonet] |
[--path *paths* ] | [--load-trace] | [--catalogs] | [--xinclude] |
[--profile] | [--dumpextensions] | [--nowrite] | [--nomkdir] |
[--writesubtree] | [--nodtdattr]] [ *stylesheet* ] [ *file1* ] [ *file2*
] [ *....* ]

Command line options
^^^^^^^^^^^^^^^^^^^^

*-V* or *--version*

Show the version of libxml and libxslt used.

*-v* or *--verbose*

Output each step taken by xsltproc in processing the stylesheet and the document.

*-o* or *--output file*

Direct output to the file named *file*. For multiple outputs, also known
as "chunking", -o directory/ directs the output files to a specified
directory. The directory must already exist.

*--timing*

Display the time used for parsing the stylesheet, parsing the document
and applying the stylesheet and saving the result. Displayed in
milliseconds.

*--repeat*

Run the transformation 20 times. Used for timing tests.

*--debug*

Output an XML tree of the transformed document for debugging purposes.

*--novalid*

Skip loading the document's DTD.

*--noout*

Do not output the result.

*--maxdepth value*

Adjust the maximum depth of the template stack before libxslt concludes
it is in an infinite loop. The default is 500.

*--html*

The input document is an HTML file.

*--param name value*

Pass a parameter of name *name* and value *value* to the stylesheet. You
may pass multiple name/value pairs up to a maximum of 32. If the value
being passed is a string rather than a node identifier, use --stringparam
instead.

*--stringparam name value*

Pass a paramenter of name *name* and value *value* where *value* is a
string rather than a node identifier. (Note: The string must be utf-8.)

*--nonet*

Do not use the Internet to fetch DTD's, entities or documents.

*--path paths*

Use the list (separated by space or column) of filesystem paths specified
by *paths* to load DTDs, entities or documents.

*--load-trace*

Display to stderr all the documents loaded during the processing.

*--catalogs*

Use the SGML catalog specified in SGML_CATALOG_FILES to resolve the
location of external entities. By default, xsltproc looks for the catalog
specified in XML_CATALOG_FILES. If that is not specified, it uses
/etc/xml/catalog.

*--xinclude*

Process the input document using the Xinclude specification. More details
on this can be found in the Xinclude specification:
`http://www.w3.org/TR/xinclude/ <http://www.w3.org/TR/xinclude/>`_


*--profile --norman*

Output profiling information detailing the amount of time spent in each
part of the stylesheet. This is useful in optimizing stylesheet
performance.

*--dumpextensions*

Dumps the list of all registered extensions to stdout.

*--nowrite*

Refuses to write to any file or resource.

*--nomkdir*

Refuses to create directories.

*--writesubtree path*

Allow file write only within the *path* subtree.

*--nodtdattr*

Do not apply default attributes from the document's DTD.

Xsltproc return values
^^^^^^^^^^^^^^^^^^^^^^

xsltproc returns a status number that can be quite useful when calling it within a script.

0: normal

1: no argument

2: too many parameters

3: unknown option

4: failed to parse the stylesheet

5: error in the stylesheet

6: error in one of the documents

7: unsupported xsl:output method

8: string parameter contains both quote and double-quotes

9: internal processing error

10: processing was stopped by a terminating message

11: could not write the result to the output file

More Information about xsltproc
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

libxml web page: `http://www.xmlsoft.org/ <http://www.xmlsoft.org/>`_

W3C XSLT page: `http://www.w3.org/TR/xslt <http://www.w3.org/TR/xslt>`_
