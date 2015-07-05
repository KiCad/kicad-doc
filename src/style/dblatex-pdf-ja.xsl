<?xml version='1.0' encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
  <xsl:param name="xetex.font">
    <xsl:text>\usepackage{xeCJK}
    </xsl:text>
    <xsl:text>\setCJKmainfont{VL-Gothic-Regular}
    </xsl:text>
    <xsl:text>\setCJKsansfont{VL-Gothic-Regular}
    </xsl:text>
    <xsl:text>\setCJKmonofont{VL-Gothic-Regular}
    </xsl:text>
    <xsl:text>\XeTeXlinebreaklocale{ja}
    </xsl:text>
<!--    <xsl:text>\XeTeXlinebreakskip{0pt plus 1pt minux 0.1pt}
    </xsl:text>
    <xsl:text>\XeTeXlinebreakpenalty{0}
    </xsl:text> -->
<!--    <xsl:text>\def\<{\@ifstar{\zx@hwback\nobreak}{\zx@hwback\relax}}
    </xsl:text>
    <xsl:text>\def\zx@hwback#1{\leavevmode#1\hskip-.5em\relax}
    </xsl:text> -->
    <xsl:text>\def\baselinestretch{1.3}
    </xsl:text>
    <xsl:text>\usepackage{indentfirst}
    </xsl:text>
<!--    <xsl:text>\parindent{1em}
    </xsl:text> -->
  </xsl:param>
</xsl:stylesheet>
