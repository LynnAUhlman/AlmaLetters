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
	<table align="left">
	<tr>
	<td align="left">
	<a>
                        <xsl:attribute name="href">
                          @@email_contact_us@@
                        </xsl:attribute>
						@@contact_us@@
                        <xsl:value-of select="current_date"/>
					</a>
	</td>
</tr>
	</table>
</xsl:template>
<xsl:template name="myAccount">
	<table align="center">
	<tr>
	<td align="center">
	<a>
                        <xsl:attribute name="href">
                          @@email_my_account@@
                        </xsl:attribute>
						@@my_account@@
					</a>
	</td>
</tr>
	</table>
</xsl:template>

<xsl:if test="notification_data/general_data/letter_name !=''">
             <h4><xsl:value-of select="notification_data/general_data/letter_name"/></h4>
        </xsl:if>
        
        <h4><xsl:value-of select="notification_data/general_data/letter_type"/></h4>

</xsl:stylesheet>
