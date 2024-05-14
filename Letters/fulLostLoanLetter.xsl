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


        <div class="messageArea">

				<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
				<tr>
				<td>
					<h>@@inform_you_item_below@@ </h>
					<h>@@borrowed_by_you@@ @@decalred_as_lost@@</h>
				</td>
				</tr>
				</table>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>

				<xsl:for-each select="notification_data">
				<table role='presentation' >
					<tr>
						<td>
						<strong>@@lost_item@@ :</strong> <xsl:value-of select="item_loan/title"/>
						<br />
						<strong>@@description@@ :</strong><xsl:value-of select="item_loan/description"/>
						<br />
						<strong> @@by@@ :</strong><xsl:value-of select="item_loan/author"/>
						<br />
						<strong>@@library@@ :</strong><xsl:value-of select="organization_unit/name"/>
						<br />
						<strong>@@loan_date@@ :</strong><xsl:value-of select="item_loan/loan_date"/>
						<br />
						<strong>@@due_date@@ :</strong><xsl:value-of select="item_loan/due_date"/>
						<br />
						<strong>@@barcode@@ :</strong><xsl:value-of select="item_loan/barcode"/>
						<br />
						<strong>@@call_number@@ :</strong><xsl:value-of select="phys_item_display/call_number"/>
						<br />
						<strong>@@charged_with_fines_fees@@ </strong>
						</td>
					</tr>
				</table>
				</xsl:for-each>

				<table role='presentation'  cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
					<tr>
						<th>@@fee_type@@</th>
						<th>@@fee_amount@@</th>
						<th>@@note@@</th>
					</tr>
					<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
					<tr>
						<td><xsl:value-of select="fine_fee_type_display"/></td>
						<td><xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/></td>
						<td><xsl:value-of select="ff"/></td>
					</tr>
					</xsl:for-each>

				</table>
				<br />
				<br />
				@@additional_info_1@@
				<br />
				@@additional_info_2@@
				<br />
	         <!-- footer.xsl -->
	         <!-- xsl:call-template name="reachoutSalutation" -->
        <xsl:call-template name="attentionSalutation" />
        <xsl:call-template name="salutation" />
	    <xsl:call-template name="last1Footer" />
	    <xsl:call-template name="last2Footer" />

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
	  
