<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="toWhomIsConcerned">
    <table cellspacing="0" cellpadding="5" border="0" margin="0">
        <tr>
            <td>
                <xsl:for-each select="notification_data">
                    <p>
                        <xsl:attribute name="style">
                           font-size:1em;
                        </xsl:attribute>
                        @@dear@@ &#160;
                    </p>
                </xsl:for-each>
            </td>
        </tr>
    </table>
</xsl:template>
</xsl:stylesheet>
