<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />
<xsl:template match="/">
	<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

		<head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<h1>
				<strong>@@requested_for@@ :
							<xsl:value-of select="notification_data/user_for_printing/name"/>
				</strong>
			</h1>

<div class="messageArea">
    <div class="messageBody">
        <table role="presentation" cellspacing="0" cellpadding="5" border="0">
            <xsl:if test="notification_data/request/selected_inventory_type='ITEM'">
                <tr>
                    <td><strong>@@note_item_specified_request@@.</strong></td>
                </tr>
            </xsl:if>
            <xsl:if test="notification_data/request/manual_description != ''">
                <tr>
                    <td><strong>@@please_note@@:</strong> @@manual_description_note@@ - <xsl:value-of select="notification_data/request/manual_description"/></td>
                </tr>
            </xsl:if>
			<tr>
				<td><h3>@@request_id@@: <img src="cid:request_id_barcode.png" alt="Request Barcode"/></h3></td>
			</tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <xsl:value-of select="notification_data/incoming_request/external_request_id"/>
                </td>
            </tr>
            <xsl:if test="notification_data/external_id != ''">
                <tr>
                    <td><strong>@@external_id@@:</strong> <xsl:value-of select="notification_data/external_id"/></td>
                </tr>
            </xsl:if>
            <xsl:if test="notification_data/user_for_printing/name">
                <tr>
                    <td><strong>@@requested_for@@:</strong> <xsl:value-of select="notification_data/user_for_printing/name"/></td>
                </tr>
            </xsl:if>
            <xsl:if test="notification_data/proxy_requester/name">
                <tr>
                    <td><strong>@@proxy_requester@@:</strong> <xsl:value-of select="notification_data/proxy_requester/name"/></td>
                </tr>
            </xsl:if>
            <tr>
                <td colspan="2">
                    <xsl:call-template name="recordTitle"/>
                </td>
            </tr>
            <xsl:if test="notification_data/phys_item_display/isbn != ''">
                <tr>
                    <td>@@isbn@@: <xsl:value-of select="notification_data/phys_item_display/isbn"/></td>
                </tr>
            </xsl:if>
            <xsl:if test="notification_data/phys_item_display/issn != ''">
                <tr>
                    <td>@@issn@@: <xsl:value-of select="notification_data/phys_item_display/issn"/></td>
                </tr>
            </xsl:if>
            <xsl:if test="notification_data/phys_item_display/edition != ''">
                <tr>
                    <td>@@edition@@: <xsl:value-of select="notification_data/phys_item_display/edition"/></td>
                </tr>
            </xsl:if>
            <xsl:if test="notification_data/phys_item_display/imprint != ''">
                <tr>
                    <td>@@imprint@@: <xsl:value-of select="notification_data/phys_item_display/imprint"/></td>
                </tr>
            </xsl:if>
            <tr>
                <td><h3><strong>@@location@@:</strong> <xsl:value-of select="notification_data/phys_item_display/location_name"/></h3></td>
            </tr>
            <tr>
                <td><h3><strong>@@item_barcode@@:</strong><img src="cid:item_id_barcode.png" alt="Item Barcode"/> </h3></td>
            </tr>

            <tr>
                <xsl:if test="notification_data/phys_item_display/call_number != ''">
                    <td><h3><strong>@@call_number@@:</strong> <xsl:value-of select="notification_data/phys_item_display/call_number"/></h3></td>
                </xsl:if>
                <xsl:if test="notification_data/phys_item_display/accession_number != ''">
                    <td><strong>@@accession_number@@:</strong> <xsl:value-of select="notification_data/phys_item_display/accession_number"/></td>
                </xsl:if>
            </tr>
            <xsl:if test="notification_data/phys_item_display/shelving_location/string">
                <tr>
                    <td><strong>@@shelving_location_for_item@@:</strong>
                        <xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
                            <xsl:value-of select="."/> &#160;
                        </xsl:for-each>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="notification_data/phys_item_display/display_alt_call_numbers/string">
                <tr>
                    <td><strong>@@alt_call_number@@:</strong>
                        <xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
                            <xsl:value-of select="."/> &#160;
                        </xsl:for-each>
                    </td>
                </tr>
            </xsl:if>
            <tr>
                <td><strong>@@move_to_library@@:</strong> <xsl:value-of select="notification_data/destination"/></td>
            </tr>
            <tr>
                <td><strong>@@request_type@@:</strong> <xsl:value-of select="notification_data/request_type"/></td>
            </tr>
            <xsl:if test="notification_data/request/system_notes != ''">
                <tr>
                    <td><strong>@@system_notes@@:</strong> <xsl:value-of select="notification_data/request/system_notes"/></td>
                </tr>
            </xsl:if>
            <xsl:if test="notification_data/request/note != ''">
                <tr>
                    <td><strong>@@request_note@@:</strong> <xsl:value-of select="notification_data/request/note"/></td>
                </tr>
            </xsl:if>
        </table>
    </div>
</div>


</body>
</html>


	</xsl:template>
</xsl:stylesheet>
