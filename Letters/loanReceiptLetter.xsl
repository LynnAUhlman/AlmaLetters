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
				<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>
				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
				<table role='presentation'  cellspacing="0" cellpadding="0" border="0" margin="0">
				<tr>
				<td>
					<p>@@inform_loaned_items@@ <xsl:value-of select="notification_data/organization_unit/name" />&#44;&#160;<xsl:value-of select="notification_data/circ_desk_name"/>.</p>
				</td>
				</tr>
				</table>
				
				<div class="messageArea">
					<div class="messageBody">

              	<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
					<tr>
						<td>
							<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" />
								</xsl:attribute>
								<tr align="center" bgcolor="#f5f5f5">
									<td colspan="6">
							<h3 style="padding: 2px; margin: 0; font-size: 14px;">Loans</h3>
									</td>
								</tr>
								<tr>
									<th>@@title@@</th>
									<th>@@author@@</th>
									<th>@@loan_date@@</th>
									<th>@@due_date@@</th>
									<th>@@library@@</th>
									<th>@@description@@</th>
								</tr>

								<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
									<tr>
										<td><xsl:value-of select="title"/></td>
										<td><xsl:value-of select="author"/></td>
										<td><xsl:value-of select="loan_date"/></td>
										<td><xsl:value-of select="new_due_date_str"/></td>
										<td><xsl:value-of select="library_name"/></td>
										<td><xsl:value-of select="description"/></td>
									</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
				</xsl:for-each>
				<br />
				<br />

        <!--<table role='presentation' > -->
        <!--<tr><td>@@sincerely@@</td></tr> -->
        <!--<tr><td>@@department@@</td></tr> -->
        <!--</table> -->

	  		</div>
        </div>
	         <!-- footer.xsl -->
	         <!-- <xsl:call-template name="reachoutSalutation"> -->
	         <!-- <xsl:call-template name="attentionSalutation"> -->
        <xsl:call-template name="salutation" />
        <br/>
        <br/>
	    <xsl:call-template name="last1Footer" />
	    <xsl:call-template name="last2Footer" />

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
