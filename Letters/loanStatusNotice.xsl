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

			<table cellspacing="0" cellpadding="5" border="0">
              <tr>
              	<td>
	                <xsl:if test="notification_data/message='RECALL_DUEDATE_CHANGE'">
						<strong>@@recall_and_date_change@@</strong>
					</xsl:if>
					<xsl:if test="notification_data/message='RECALL_ONLY'">
						<strong>@@recall_and_no_date_change@@</strong>
					</xsl:if>
					<xsl:if test="notification_data/message='DUE_DATE_CHANGE_ONLY'">
						<strong>@@message@@</strong>
					</xsl:if>
					<xsl:if test="notification_data/message='RECALL_CANCEL_RESTORE_ORIGINAL_DUEDATE'">
						<strong>@@cancel_recall_date_change@@</strong>
					</xsl:if>
					<xsl:if test="notification_data/message='RECALL_CANCEL_ITEM_RENEWED'">
						<strong>@@cancel_recall_renew@@</strong>
					</xsl:if>
					<xsl:if test="notification_data/message='RECALL_CANCEL_NO_CHANGE'">
						<strong>@@cancel_recall_no_date_change@@</strong>
					</xsl:if>

					<br/><br/>
                </td>
              </tr>

              <tr>
              	<td>
					<strong>@@loans@@</strong>
                </td>
              </tr>

              <tr>
                <td>
                	<table role='presentation'  cellpadding="5" class="listing">
						<xsl:attribute name="style">
							<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
						</xsl:attribute>
						<tr>
							<th>@@title@@</th>
							<th>@@description@@</th>
							<th>@@author@@</th>
							<th>@@old_due_date@@</th>
							<th>@@new_due_date@@</th>
							<th>@@library@@</th>
						</tr>

                		<xsl:for-each select="notification_data/item_loans/item_loan">
						<tr>
							<td><xsl:value-of select="title"/></td>
							<td><xsl:value-of select="item_description"/></td>
							<td><xsl:value-of select="author"/></td>
							<td><xsl:value-of select="old_due_date_str"/></td>
							<td><xsl:value-of select="new_due_date_str"/></td>
							<td><xsl:value-of select="library_name"/></td>
						</tr>
						</xsl:for-each>

                	</table>
                </td>
              </tr>
             </table>

			<br />
			<table role='presentation' >
				<tr><td>@@sincerely@@</td></tr>
				<tr><td>@@department@@</td></tr>
			</table>

          </div>
        </div>
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
