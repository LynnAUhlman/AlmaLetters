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
          <xsl:call-template name="bodyStyleCss" />
        </xsl:attribute>

        <div class="messageArea">
          <div class="messageBody">
            <xsl:call-template name="head" />
            <xsl:call-template name="toWhomIsConcerned" />

            <p>@@inform_you_item_below@@</p>
            <p>@@borrowed_by_you@@ @@decalred_as_lost@@</p>

            <table role="presentation" cellpadding="5" class="listing">
              <xsl:attribute name="style">
                <xsl:call-template name="mainTableStyleCss"/>
              </xsl:attribute>

              <tr align="center" bgcolor="#f5f5f5">
                <th>@@lost_item@@ / @@description@@</th>
                <th>@@library@@</th>
                <th>@@loan_date@@</th>
                <th>@@due_date@@</th>
                <th>@@barcode@@</th>
                <th>@@call_number@@</th>
                <th>@@fee_type@@</th>
                <th>@@fee_amount@@</th>
                <th>@@note@@</th>
              </tr>

              <!-- Main loop -->
<xsl:for-each select="notification_data">
  <xsl:for-each select="fines_fees_list/user_fines_fees">
    <tr>
      <td>
        <xsl:value-of select="ancestor::notification_data/item_loan/title"/>
        <br/>
        <xsl:value-of select="ancestor::notification_data/item_loan/description"/>
      </td>
      <td><xsl:value-of select="ancestor::notification_data/organization_unit/name"/></td>
      <td><xsl:value-of select="ancestor::notification_data/item_loan/loan_date"/></td>
      <td><xsl:value-of select="ancestor::notification_data/item_loan/due_date"/></td>
      <td><xsl:value-of select="ancestor::notification_data/item_loan/barcode"/></td>
      <td><xsl:value-of select="ancestor::notification_data/phys_item_display/call_number"/></td>
      <td><xsl:value-of select="fine_fee_type_display"/></td>
      <td>
        <xsl:value-of select="fine_fee_ammount/normalized_sum"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="fine_fee_ammount/currency"/>
      </td>
      <td><xsl:value-of select="ff"/></td>
    </tr>
  </xsl:for-each>
</xsl:for-each>

            </table>

            <br/>

            <p>@@additional_info_1@@</p>
            <p>@@additional_info_2@@</p>
          </div>
        </div>

        <!-- Footer -->
        <xsl:call-template name="attentionSalutation"/>
        <xsl:call-template name="salutation"/>
        <br/>
        <xsl:call-template name="last1Footer"/>
        <xsl:call-template name="last2Footer"/>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
