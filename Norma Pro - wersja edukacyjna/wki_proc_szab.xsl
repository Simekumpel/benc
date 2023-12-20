<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >

<xsl:output method="html" indent="yes"/>
<xsl:decimal-format name="zl" decimal-separator="," grouping-separator="&#160;"/>

  <xsl:template match="/">                         
    <html>
	<head><title>Wskaźniki dodatkowe WKI.</title></head>
      <body>
	<h2>Wskaźniki dodatkowe WKI</h2>
        <xsl:apply-templates select="/*/GRUPA"/>
     </body>
     </html>
     </xsl:template>
  
 <xsl:template match="GRUPA">   <!--processing for each record-->
 <h2>GRUPA <xsl:value-of select="@NUMER"/>&#160;<xsl:value-of select="@NAZWA"/> </h2>
  <textarea style="width:100%;height:200px">
	<xsl:value-of select="OPIS"/></textarea>

    <ul>	
	<xsl:apply-templates select="PODGRUPA"/>
    </ul></xsl:template>
 
 <xsl:template match="PODGRUPA">   <!--processing for each sale-->
   <li>
   <h3>
   <xsl:value-of select="@NUMER"/>&#160;<xsl:value-of select="@NAZWA"/> 
   </h3>
   </li>
  <ul>  
  <xsl:apply-templates select="POZYCJA"/>
  </ul>
  </xsl:template>

 
 <xsl:template match="POZYCJA">   <!--processing for each sale-->
   <li>
	<xsl:value-of select="@SYMBOL"/>&#160;<b><xsl:value-of select="@NAZWA"/> </b>
	<br/>
	Jednostka miary:&#160;<xsl:value-of select="@JM_NAZWA"/>
	<xsl:if test="@JM_KOD != ''">
	&#160;(<xsl:value-of select="@JM_KOD"/>)
	</xsl:if>
	<xsl:if test="@WSK_SR != ''">
	<br/>
	Cena średnia:<xsl:value-of select="@WSK_SR"/>
	</xsl:if>
	<xsl:if test="@WSK_MIN != ''">
	<br/>
	Cena min:<xsl:value-of select="@WSK_MIN"/>
	</xsl:if>
	<xsl:if test="@WSK_MAX != ''">
	<br/>
	Cena max:<xsl:value-of select="@WSK_MAX"/>
	</xsl:if>

   </li></xsl:template>
 


  </xsl:stylesheet>
