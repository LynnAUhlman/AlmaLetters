<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="generalStyle">
    <style>
        body {@@language_related_body_css@@ background-color:#fff}
        .listing td {border-bottom: 1px solid #eee}
        .listing tr:hover td {background-color:#eee}
        .listing th {background-color:#eee }
    </style>
</xsl:template>

<xsl:template name="bodyStyleCss">
    font-family: Arial;
    color:#333;
    margin:0;
    padding:0em;
    font-size:100%;
</xsl:template>

<xsl:template name="listStyleCss">
    list-style: none;
    margin:0 0 0 1em;
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

<xsl:template name="headerLogoStyleCss">
    background-color:#ffffff;
    width:100%;
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
</xsl:template>

<!-- Add style for organization unit part of the footer -->
<xsl:template name="footer1TableStyleCss">
    background-color:#034661;
    width:100%;
    text-shadow:1px 1px 1px #333;
    color:#fff;
    margin-top:1em;
    font-weight:700;
    line-height:2em;
    font-size:125%;
    padding: 0; <!-- Remove padding -->
</xsl:template>

<!-- Adjust style for links of footer -->
<xsl:template name="footer2TableStyleCss">
    background-color:#07688F;
    width:100%;
    text-shadow:1px 1px 1px #333;
    color:#fff;
    margin-top:0;
    font-weight:700;
    line-height:2em;
    font-size:100%;
    padding: 0; <!-- Remove padding -->
</xsl:template>

<!-- Add style for hyperlinks -->
<xsl:template name="footer2LinkStyleCss">
    a {
        color: #ffffff; <!-- White color for regular links -->
    }
    a:visited {
        color: #07688F; <!-- #07688F UMS approved style for visited links -->
    }
</xsl:template>

<!-- Add padding to the <td> elements containing the text -->
<xsl:template name="footer2TableCellStyleCss">
    <style>
        .footer-cell {
            padding-left: 10px;
        }
    </style>
</xsl:template>

</xsl:stylesheet>
