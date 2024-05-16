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

<xsl:template name="reachoutSalutation">
   <table>
       
        <tr>If you still need the material, please reach out to your campus library for assistance in exploring alternative options to obtain the material.</tr>
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

<xsl:template name="last1Footer">
    <table>
        <xsl:attribute name="style">
            <xsl:call-template name="footer1TableStyleCss" /> <!-- style.xsl -->
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

<xsl:template name="last2Footer">
    <table style="width: 100%;">
        <xsl:attribute name="style">
            <xsl:call-template name="footer2TableStyleCss" /> <!-- style.xsl -->
        </xsl:attribute>
        <colgroup>
            <col style="width: 12%;" />
            <col style="width: 22%;" />
            <col style="width: 22%;" />
            <col style="width: 22%;" />
            <col style="width: 22%;" />
        </colgroup>
<tr>
    <td></td> <!-- Empty cell for right column -->
    <td align="left" style="padding-right: 1px;" class="footer-cell"><a href="http://www.library.umaine.edu/" style="color: #ffffff;">UMaine</a></td>
    <td align="left" style="padding-left: 1px;" class="footer-cell"><a href="http://machias.edu/library/" style="color: #ffffff;">UMM</a></td>
    <td align="left" style="padding-left: 1px;" class="footer-cell"><a href="http://library.umfk.edu/" style="color: #ffffff;">UMFK</a></td>
    <td align="left" style="padding-left: 1px;" class="footer-cell"><a href="https://maine.primo.exlibrisgroup.com/discovery/login?vid=01MAINE_INST:01MAINE_INST&amp;lang=en&amp;section=overview" style="color: #ffffff;">@@my_account@@</a></td>
</tr>
        <tr>
            <td></td> <!-- Empty cell for right column -->
            <td align="left" class="footer-cell"><a href="http://www.umpi.edu/library/" style="color: #ffffff;">UMPI</a></td> 
            <td align="left" class="footer-cell"><a href="https://www.umf.maine.edu/library/" style="color: #ffffff;">UMF</a></td>
            <td align="left" class="footer-cell"><a href="http://mainelaw.maine.edu/library/" style="color: #ffffff;">MaineLaw</a></td>
            <td></td> <!-- Empty cell for right column -->
        </tr>
        <tr>        
            <td></td> <!-- Empty cell for right column -->
            <td align="left" class="footer-cell"><a href="https://mycampus.maine.edu/web/uc-library-portal/home/" style="color: #ffffff;">UMA</a></td>
            <td align="left" class="footer-cell"><a href="http://usm.maine.edu/library/" style="color: #ffffff;">USM</a></td>
            <td class="footer-cell"></td> <!-- Empty cell for right column -->
            <td class="footer-cell"></td> <!-- Empty cell for right column -->
        </tr>
    </table>
</xsl:template>


<xsl:if test="notification_data/general_data/letter_name !=''">
             <h4><xsl:value-of select="notification_data/general_data/letter_name"/></h4>
        </xsl:if>
        
        <h4><xsl:value-of select="notification_data/general_data/letter_type"/></h4>

</xsl:stylesheet>
