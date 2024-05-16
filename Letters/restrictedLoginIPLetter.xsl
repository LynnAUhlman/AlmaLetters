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
                <div class="messageBody">
			<br/>
			<div>
				@@the_user@@<strong><xsl:value-of select="notification_data/display_name"/> (@@user_name@@ <xsl:value-of select="notification_data/user_name"/>, @@email@@ <xsl:value-of select="notification_data/user_email"/> )</strong>, @@coming_from_ip@@<strong><xsl:value-of select="notification_data/ip"/></strong>, @@is_blocked@@
				<br/><br/>
				@@free_text@@
				<br/>
				<xsl:value-of select="notification_data/free_text"/>
				<br/>
			</div>
		</div>
	</div>
			<br />

            <!-- footer.xsl -->
            <!-- xsl:call-template name="reachoutSalutation" -->
           <!-- <xsl:call-template name="attentionSalutation" /> -->
            <xsl:call-template name="salutation" />
            <br />
            <xsl:call-template name="last1Footer" />
            <xsl:call-template name="last2Footer" />
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>
