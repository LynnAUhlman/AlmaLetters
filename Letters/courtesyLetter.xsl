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

		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->


        <div class="messageArea">
          <div class="messageBody">

			<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
              <tr>
              	<td>
					<xsl:if test="notification_data/short_loans='true'">
						<strong>@@short_loans_message@@</strong>
					</xsl:if>
					<xsl:if test="notification_data/short_loans='false'">
						@@message@@
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
                	<table  cellpadding="5" class="listing">
						<xsl:attribute name="style">
							<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
						</xsl:attribute>
						<tr>
							<th>@@title@@</th>
							<th>@@author@@</th>
							<th>@@due_date@@</th>
							<th>@@library@@</th>
						</tr>

                		<xsl:for-each select="notification_data/item_loans/item_loan">
						<tr>
							<td><xsl:value-of select="title"/></td>
							<td><xsl:value-of select="author"/></td>
							<td><xsl:value-of select="due_date"/></td>
							<td><xsl:value-of select="library_name"/></td>

						</tr>
						</xsl:for-each>

                	</table>
                </td>
              </tr>
             </table>
<p>Kindly return the materials or renew any eligible materials online using <a href="https://maine.primo.exlibrisgroup.com/discovery/search?vid=01MAINE_INST:01MAINE_INST">LibrarySearch</a>. Please reach out to your campus library for assistance.</p>				
<p><strong>How to renew:</strong> </p>
<ul>
<li><p><em>Not signed in:</em> Select <strong>Sign in</strong> and follow the prompts to sign in. Select <strong>Menu>My Loans</strong>. Click the box next to each item you wish to renew and then click <strong>Renew Selected</strong>.</p></li>
<li><p><em>Already signed in:</em> Click your name from the top right corner and then click <strong>My Loans</strong>. Click the box next to each item you wish to renew and then click <strong>Renew Selected</strong>.</p></li>
</ul>
	<p></p>
          </div>
        </div>
       <!-- footer.xsl -->
        <xsl:call-template name="attentionSalutation" />
        <xsl:call-template name="salutation" />
        <xsl:call-template name="lastFooter" />
		<xsl:call-template name="contactUs" />
		<xsl:call-template name="myAccount" />

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
