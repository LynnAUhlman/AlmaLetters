<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="generalStyle">
    <style>
        body {@@language_related_body_css@@ background-color:#fff}
        .listing td {border-bottom: 1px solid #eee}
        .listing tr:hover td {background-color:#eee}
        .listing th {background-color:#eee }
        margin:0 0 0 0;
    </style>
</xsl:template>

<xsl:template name="bodyStyleCss">
    font-family: Arial;
    color:#333;
    margin:0 0 0 0;
    padding:0em;
    font-size:100%;
    height: 100px;
    padding:1%;
    border:none;
}
</xsl:template>

<xsl:template name="listStyleCss">
    list-style: none;
    margin:0 0 1em 0;
    padding:0;
</xsl:template>

<xsl:template name="mainTableStyleCss">
    width:100%;
    color: 000000;
    text-align:left;
    margin:0 0 0 0;
    padding: 0; <!-- Remove padding -->
</xsl:template>

    
<xsl:template name="bodyTableStyleCss">
    width:100%;
    color: 000000;
    text-align:left;
    margin:0 0 0 0;
    padding: 0; <!-- Remove padding -->    
</xsl:template>

<xsl:template name="feeTableStyleCss">
  width: 50%;
  color: 000000;
  text-align:left;
  margin:0 0 0 0;
  padding: 0; <!-- Remove padding -->    
</xsl:template>


<xsl:template name="headerLogoStyleCss">
    background-color:#ffffff;
    width:100%;
    margin:0 0 0 0;
</xsl:template>

<xsl:template name="headerTableStyleCss">
    background-color:#034661;
    font-color:ffffff;
    width:100%;
    text-shadow:1px 1px 1px #333;
    color:#fff;
    font-weight:700;
    line-height:2em;
    font-size:125%;
    margin:0 0 0 0;

</xsl:template>

<!-- Add style for organization unit part of the footer -->
<xsl:template name="footer1TableStyleCss">
    background-color:#034661;
    width:100%;
    text-shadow:1px 1px 1px #333;
    text-decoration: none;
    color:#fff;
    margin:0 0 0 0;
    font-weight:700;
    line-height:2em;
    font-size:125%;
    padding: 0; <!-- Remove padding -->
</xsl:template>

<xsl:template name="footer2TableStyleCss">
    background-color:#07688F;
    width:100%;
    text-shadow:1px 1px 1px #333;
    text-decoration: none;
    color:#fff;
    margin:0 0 0 0;
    font-weight:700;
    line-height:2em;
    font-size:100%;
    padding-left: 1px; <!-- Remove padding -->
</xsl:template>

<!-- Add style for hyperlinks -->
<xsl:template name="footer2LinkStyleCss">
    a {
        color: #ffffff; text-decoration: none; <!-- White color for regular links -->
    }
    a:visited {
        color: #07688F;text-decoration: none; <!-- #07688F UMS approved style for visited links -->
    }
</xsl:template>

</xsl:stylesheet>
