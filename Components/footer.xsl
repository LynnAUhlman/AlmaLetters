<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="attentionSalutation">
   <table>
       
        <tr>Thank you for your prompt attention.</tr>
         <tr><td></td></tr>
        <tr><td></td></tr>
    </table> 
</xsl:template>

<xsl:template name="salutation">
<table>
        <tr><td></td></tr>
        <tr><td></td></tr>
    <tr>
       	<td align="left">Sincerely,</td>
        </tr>
    <tr><td></td></tr>
    <tr>
       	<td align="left">UMS Library Staff</td>
        </tr>
</table>

</xsl:template>

<xsl:template name="lastFooter">
	<table>
	<xsl:attribute name="style">
		<xsl:call-template name="footerTableStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>
	<tr>
	<xsl:for-each select="notification_data/organization_unit">

		<xsl:attribute name="style">
			<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
		</xsl:attribute>
			<td align="center"><xsl:value-of select="name"/>&#160;<xsl:value-of select="line1"/>&#160;<xsl:value-of select="line2"/>&#160;<xsl:value-of select="city"/>&#160;<xsl:value-of select="postal_code"/>&#160;<xsl:value-of select="country"/></td>

	</xsl:for-each>
	</tr>
	</table>
</xsl:template>



<xsl:template name="contactUs">
<table style="width:100%;">
    <tr>
      <th style="width:250px;"></th>
      <th style="width:250px;"></th>
      <th style="width:250px;"></th>
      <th style="width:250px;"></th>

   </tr>
        <tr>
        <td align="left"><a href="http://www.library.umaine.edu/">UMaine</a></td>
        <td align="left"><a href="http://machias.edu/library/">UMM</a></td>
        <td align="left"><a href="http://library.umfk.edu/">UMFK</a></td>
        <td align="left"><a><xsl:attribute name="href">@@email_my_account@@</xsl:attribute>@@my_account@@</a></td>
    </tr>
    <tr>
        <td align="left"><a href="http://www.umpi.edu/library/">UMPI</a></td> 
        <td align="left"><a href="https://www.umf.maine.edu/library/">UMF</a></td>
        <td align="left"><a href="http://mainelaw.maine.edu/library/">MaineLaw</a></td>
    </tr>
    <tr>        
        <td align="left"><a href="https://mycampus.maine.edu/web/uc-library-portal/home/">UMA</a></td>
        <td align="left"></td> <!-- Empty cell for right column -->
        <td align="left"><a href="http://usm.maine.edu/library/">US)</a></td>
    </tr>
</table>

</xsl:template>


<xsl:if test="notification_data/general_data/letter_name !=''">
             <h4><xsl:value-of select="notification_data/general_data/letter_name"/></h4>
        </xsl:if>
        
        <h4><xsl:value-of select="notification_data/general_data/letter_type"/></h4>

</xsl:stylesheet>
