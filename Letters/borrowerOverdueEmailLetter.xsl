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
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->

		<xsl:call-template name="toWhomIsConcerned" /> 
  <br />
  <!-- mailReason.xsl -->	
				<!-- header.xsl -->

				<div class="messageArea">
					<div class="messageBody">
						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">

							<tr>
								<td>
									@@overdue_message@@
  <br />
  <br />
									<strong> @@orignal_due_date@@: <xsl:value-of select="notification_data/request/due_date"/></strong>
  <br />
  <br />
									@@return_message@@
								</td>

							</tr>

						</table>
  <br />
						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">

							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss" />
							</xsl:attribute>

							<tr>
								<td>
									<strong>@@request_info@@:</strong>
								</td>
							</tr>

							<tr>
								<td>
									<strong>@@request_id@@: </strong>
									<xsl:value-of select="notification_data/request/external_request_id" />
								</td>
							</tr>

							<tr>
								<td>
									<strong>@@title@@: </strong>
									<xsl:value-of select="notification_data/request/display/title" />
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@author@@: </strong>
									<xsl:value-of select="notification_data/request/display/author" />
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@request_date@@: </strong>
									<xsl:value-of select="notification_data/request/create_date" />
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@needed_by_date@@: </strong>
									<xsl:value-of select="notification_data/request/needed_by" />
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@supplied_date@@: </strong>
									<xsl:value-of select="notification_data/request/item_sent_date" />
								</td>
							</tr>

						</table>
						<table role='presentation' >

							<tr>
								<td>@@signature@@</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="notification_data/library/name" />
								</td>
							</tr>
							<xsl:if test="notification_data/library/address/line1 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line1" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line2 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line2" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line3 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line3" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line4 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line4" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line5 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line5" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/city !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/city" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/country !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/country" />
									</td>
								</tr>
							</xsl:if>
						</table>
					</div>
				</div>
	<!-- footer.xsl -->
	    <!-- xsl:call-template name="reachoutSalutation" -->
	    <xsl:call-template name="attentionSalutation" />
	    <xsl:call-template name="salutation" />
	    <br />
	    <xsl:call-template name="last1Footer" />
	    <xsl:call-template name="last2Footer" />

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
