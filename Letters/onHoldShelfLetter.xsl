<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />
  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />
  <xsl:variable name="isDeposit" select="/notification_data/request/deposit_indicator" />
  <xsl:variable name="isDigitalDocDelivery" select="/notification_data/digital_document_delivery" />

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
            <xsl:attribute name="style">
                <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
            </xsl:attribute>
            <xsl:call-template name="head" /><!-- header.xsl -->
            <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
            <br />

        <div class="messageArea">
            <div class="messageBody">
                
					<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
						<tr>
							<td>@@following_item_requested_on@@ <xsl:value-of select="notification_data/request/create_date"/>, @@can_picked_at@@ <strong><xsl:value-of select="notification_data/request/assigned_unit_name"/></strong>.</td>
						</tr>

						<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
						<tr>
							<td>
							 @@note_item_held_until@@ <strong><xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/> </strong>.
							 </td>
						</tr>
												<tr><td></td></tr>
							</xsl:if>
						<tr>
							<td><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></td>
						</tr>
						<xsl:if test="notification_data/request/system_notes">
						<tr><td></td></tr>
						<tr>
							<td><strong>Barcode:</strong> <xsl:value-of select="notification_data/phys_item_display/available_items/available_item/barcode"/></td>
						</tr>
							<tr></tr>
						    <tr>
							<td><strong>@@notes_affect_loan@@:</strong></td>
						</tr>    

						<tr>
							<td><xsl:value-of select="notification_data/request/system_notes"/></td>
						</tr>

						</xsl:if>

					</table>
				</div>
			</div>
				<table role='presentation' >

						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>

				</table>

            <!-- footer.xsl -->
            <!-- <xsl:call-template name="reachoutSalutation" /> -->
            <!--<xsl:call-template name="attentionSalutation" /> -->
            <xsl:call-template name="salutation" />
            <br />
            <xsl:call-template name="last1Footer" />
            <xsl:call-template name="last2Footer" />
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>
